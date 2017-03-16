
select * from [SCHEMA].[TABLE]  where MessageType ='MESSAGETYPE' and CreatedAt >= '2017-02-27' and CreatedAt <= '2017-03-01'
	and CONVERT(NVARCHAR(MAX), Content) LIKE '%&lt;ELEMENT&gt;VALUE%'
	ORDER BY CreatedAt DESC 
