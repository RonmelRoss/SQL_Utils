-- This script uses sqlcmd scripting variables. They are in the form
-- $(MyVariable). For information about how to use scripting variables  
-- on the command line and in SQL Server Management Studio, see the 
-- "Executing Replication Scripts" section in the topic
-- "Programming Replication Using System Stored Procedures".

:setvar DistPubServer N'<server_name>';

-- Disable publishing and distribution.
DECLARE @distributionDB AS sysname;
DECLARE @publisher AS sysname;
DECLARE @publicationDB as sysname;
SET @distributionDB = N'distribution';
SET @publisher = $(DistPubServer);
--SET @publicationDB = N'AdventureWorks2012';

-- Disable the publication database.
--USE [AdventureWorks2012]
--EXEC sp_removedbreplication @publicationDB;

-- Remove the registration of the local Publisher at the Distributor.
USE master
--EXEC sp_dropsubscriber @publisher;

--EXEC sp_dropdistpublisher @publisher;
EXEC sp_removedbreplication

-- Delete the distribution database.
EXEC sp_dropdistributiondb @distributionDB;

-- Remove the local server as a Distributor.
EXEC sp_dropdistributor @no_checks=1;
GO


--KILL SPID THEN DROP REPLICATION
--https://stackoverflow.com/questions/10193404/why-sql-server-doesnt-allow-to-remove-a-distributor-exactly-after-configuration

USE [master]
DECLARE @spid VARCHAR(10);
SELECT @spid=spid FROM sys.sysprocesses WHERE dbid = DB_ID('distribution');

WHILE @@ROWCOUNT <> 0
    EXEC ('KILL ' + @spid)

EXEC sp_dropdistributor @no_checks = 1

---END---

---START---
--CHECK SESSION_ID (SPID) OF CURRENT SESSION
select spid from sys.sysprocesses where dbid = DB_ID('distribution');

--KILL SESSIONS
exec ('KILL 55;KILL 72;KILL 74;KILL 75');

--DROP RELICATION
exec sp_dropdistributor @no_checks = 1