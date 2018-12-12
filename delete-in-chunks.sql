SET NOCOUNT ON;
 
DECLARE @r INT;
 
SET @r = 1;
 
WHILE @r > 0
BEGIN
 
  DELETE TOP (1000)
    FROM OutboxRecord 
	WHERE Dispatched = 1 and DispatchedAt <= DateAdd(DAY, -7, GETUTCDATE());
 
  SET @r = @@ROWCOUNT;
  Print @r
END
