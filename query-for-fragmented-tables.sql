SELECT a.*,b.AverageFragmentation 
FROM 
(
    SELECT 
        tbl.name AS [Table_Name], 
        tbl.object_id, i.name AS [Name], 
        i.index_id, 
        CAST(CASE i.index_id WHEN 1 THEN 1 ELSE 0 END AS bit) AS [IsClustered], 
        CAST(case when i.type=3 then 1 else 0 end AS bit) AS [IsXmlIndex], 
        CAST(case when i.type=4 then 1 else 0 end AS bit) AS [IsSpatialIndex]
    FROM
        sys.tables AS tbl
        INNER JOIN sys.indexes AS i ON (i.index_id > 0 and i.is_hypothetical = 0) 
            AND (i.object_id=tbl.object_id))a
        INNER JOIN
        (
            SELECT 
                tbl.object_id, i.index_id, 
                fi.avg_fragmentation_in_percent AS [AverageFragmentation]
            FROM
            sys.tables AS tbl
            INNER JOIN sys.indexes AS i ON (i.index_id > 0 and i.is_hypothetical = 0)
                AND (i.object_id=tbl.object_id)
            INNER JOIN sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') AS fi ON fi.object_id=CAST(i.object_id AS int) 
            AND fi.index_id=CAST(i.index_id AS int)
        )b ON a.object_id=b.object_id and a.index_id=b.index_id
ORDER BY AverageFragmentation DESC
