/*1: Create SQL Login on master database (connect with admin account to master database)*/
CREATE LOGIN xxx WITH PASSWORD = ‘password’;
/*2: Create SQL user on the master database (this is necessary for login attempt to the <default> database, as with Azure SQL you cannot set the DEFAULT_DATABASE property of the login so it always will be [master] database.)*/
CREATE USER xxx FROM LOGIN xxx;
/*3: Create SQL User on the user database (connect with admin account to user database)*/
CREATE USER xxx FROM LOGIN xxx;
/*4. Grant permissions to the user by assign him to a database role*/
ALTER ROLE db_owner ADD MEMBER xxx;
