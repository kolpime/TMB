GO

USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'ToMyBaby')
DROP DATABASE [ToMyBaby]
GO

-- Retrieve the default data and log file locations configured for this instance.
DECLARE @DefaultDataFileFolder nvarchar(512)
EXEC master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultData', @DefaultDataFileFolder OUTPUT

DECLARE @DefaultLogFileFolder nvarchar(512)
EXEC master.dbo.xp_instance_regread N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultLog', @DefaultLogFileFolder OUTPUT

DECLARE @CreateDbSql nvarchar(4000)
SET @CreateDbSql = 'CREATE DATABASE [ToMyBaby] ON PRIMARY 
(NAME = N''ToMyBaby'', FILENAME = ''' + @DefaultDataFileFolder + N'\ToMyBaby.mdf'', SIZE = 204800KB, MAXSIZE = UNLIMITED, FILEGROWTH = 500MB)
LOG ON 
(NAME = N''ToMyBaby_log'', FILENAME = ''' + @DefaultLogFileFolder + N'\ToMyBaby_log.ldf'', SIZE = 51200KB , MAXSIZE = 2048GB, FILEGROWTH = 500MB)
COLLATE Latin1_General_CI_AS'

EXEC master.dbo.sp_executeSQL @CreateDbSql

GO

EXEC dbo.sp_dbcmptlevel @dbname=N'ToMyBaby', @new_cmptlevel=90
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	BEGIN
		EXEC [ToMyBaby].[dbo].[sp_fulltext_database] @action = 'enable'
	END
GO

ALTER DATABASE [ToMyBaby] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToMyBaby] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToMyBaby] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ToMyBaby] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToMyBaby] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToMyBaby] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToMyBaby] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ToMyBaby] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToMyBaby] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToMyBaby] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToMyBaby] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToMyBaby] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToMyBaby] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToMyBaby] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ToMyBaby] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToMyBaby] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToMyBaby] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToMyBaby] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToMyBaby] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToMyBaby] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToMyBaby] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToMyBaby] SET  READ_WRITE 
GO
ALTER DATABASE [ToMyBaby] SET RECOVERY FULL 
GO
ALTER DATABASE [ToMyBaby] SET  MULTI_USER 
GO
ALTER DATABASE [ToMyBaby] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToMyBaby] SET DB_CHAINING OFF  
GO

-- Enable CLR integration.
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO
GO

PRINT '
-----------------------------------------------------------------------------------------------------------
--c:\projects\JobBoardPlatform-3.11\JobBoard.Database\Scripts\3.0\3.0.0.1_RC1\01_Database\02_Security.sql
-----------------------------------------------------------------------------------------------------------
'
GO

USE master
GO

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ToMyBabyUser')
DROP LOGIN [ToMyBabyUser]
GO

CREATE LOGIN [ToMyBabyUser] WITH PASSWORD=N'flatcap', 
	DEFAULT_DATABASE=[master], 
	DEFAULT_LANGUAGE=[British], 
	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
	/* To allow easy restores of backed up databases
		Once developement database has been created 
		set SID below to that of new created user
		before creation of Client Test & Live Databases */
	-- , SID=0xCC857C3A1B330D4DB1FD3BC4D1AFC206
GO

USE [ToMyBaby]
GO
CREATE ROLE [MadgexJobBoardRole] AUTHORIZATION [dbo]
GO

CREATE USER [ToMyBabyUser] FOR LOGIN [ToMyBabyUser] WITH DEFAULT_SCHEMA=[dbo]

GO
EXEC sp_addrolemember N'db_datareader', N'ToMyBabyUser'
GO
