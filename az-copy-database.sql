--Copy database--
CREATE DATABASE [new_db] AS COPY OF [source_server].[current_db]

--Monitor the copy progress--
SELECT * FROM sys.dm_database_copies --run on the source server

SELECT name, state, state_desc FROM sys.databases
