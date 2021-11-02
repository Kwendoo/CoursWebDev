/*
Script de déploiement pour LaboXamarinDB

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "LaboXamarinDB"
:setvar DefaultFilePrefix "LaboXamarinDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de la base de données $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de Table [dbo].[Casting]...';


GO
CREATE TABLE [dbo].[Casting] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [MovieID]  INT          NOT NULL,
    [PersonID] INT          NOT NULL,
    [Role]     VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Casting] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Category]...';


GO
CREATE TABLE [dbo].[Category] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Movie]...';


GO
CREATE TABLE [dbo].[Movie] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [Title]            VARCHAR (50)  NOT NULL,
    [RealeseYear]      INT           NOT NULL,
    [Synopsis]         VARCHAR (MAX) NOT NULL,
    [PosterURL]        VARCHAR (MAX) NOT NULL,
    [RealisatorID]     INT           NOT NULL,
    [ScenaristID]      INT           NOT NULL,
    [CategoryID]       INT           NOT NULL,
    [PersonnalComment] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Person]...';


GO
CREATE TABLE [dbo].[Person] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [LastName]   VARCHAR (50)  NOT NULL,
    [FirstName]  VARCHAR (50)  NOT NULL,
    [PictureURL] VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_MovieID]...';


GO
ALTER TABLE [dbo].[Casting]
    ADD CONSTRAINT [FK_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [dbo].[Movie] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PersonID]...';


GO
ALTER TABLE [dbo].[Casting]
    ADD CONSTRAINT [FK_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Person] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_RealisatorID]...';


GO
ALTER TABLE [dbo].[Movie]
    ADD CONSTRAINT [FK_RealisatorID] FOREIGN KEY ([RealisatorID]) REFERENCES [dbo].[Person] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_ScenaristID]...';


GO
ALTER TABLE [dbo].[Movie]
    ADD CONSTRAINT [FK_ScenaristID] FOREIGN KEY ([ScenaristID]) REFERENCES [dbo].[Person] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_CategoryID]...';


GO
ALTER TABLE [dbo].[Movie]
    ADD CONSTRAINT [FK_CategoryID] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([Id]);


GO
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
ALTER TABLE Movie NOCHECK CONSTRAINT ALL
ALTER TABLE Category NOCHECK CONSTRAINT ALL
ALTER TABLE Person NOCHECK CONSTRAINT ALL
ALTER TABLE Casting NOCHECK CONSTRAINT ALL


INSERT INTO Category ([Name])
VALUES
('Action'),
('Animation'),
('Aventure'),
('Biographie'),
('Catastrophe'),
('Choral'),
('Comédie'),
('Danse'),
('Documentaire'),
('Drame'),
('Epique'),
('Erotique'),
('Espionnage'),
('Fantastique'),
('Fantasy'),
('Guerre'),
('Historique'),
('Horreur'),
('Musical'),
('Noir'),
('Policier'),
('Pornographique'),
('Propagande'),
('Road Movie'),
('Romantique'),
('Science-fiction'),
('Sketches'),
('Survie'),
('Thriller'),
('Western')

INSERT INTO Person ([LastName], [FirstName], [PictureURL])
VALUES

/*Die Hard 1 : Piège de Cristal*/
    /*Réal*/
    ('McTiernan', 'John', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/John_McTiernan_at_the_Cin%C3%A9math%C3%A8que_Fran%C3%A7aise.JPG/220px-John_McTiernan_at_the_Cin%C3%A9math%C3%A8que_Fran%C3%A7aise.JPG'),
    /*Scénariste*/
    ('Stuart', 'Jeb', 'https://fr.web.img5.acsta.net/r_1280_720/pictures/18/11/21/17/44/2780126.jpg'),
    ('De Souza', 'Steven E.', 'https://m.media-amazon.com/images/M/MV5BMzI2NTU2MjkyMl5BMl5BanBnXkFtZTYwOTcxNDA3._V1_.jpg'),
    /*Acteur*/
    ('Willis', 'Bruce', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Bruce_Willis_by_Gage_Skidmore.jpg/260px-Bruce_Willis_by_Gage_Skidmore.jpg'),
    ('Rickman', 'Alan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Alan_Rickman_after_Seminar_%283%29.jpg/240px-Alan_Rickman_after_Seminar_%283%29.jpg'),
    ('Bedelia', 'Bonnie', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Bonnie_Bedelia_1974.JPG/220px-Bonnie_Bedelia_1974.JPG'),
/*Spider Man 2002*/
    /*Réal*/
    ('Raimi', 'Sam', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Sam_Raimi_by_Gage_Skidmore_2.jpg/220px-Sam_Raimi_by_Gage_Skidmore_2.jpg'),
    /*Scénariste*/
    ('Koepp', 'David', 'https://images-na.ssl-images-amazon.com/images/S/amzn-author-media-prod/2fpb3rl6a4r79jvh7aep2302h0.__01_SX120_CR0,0,120,120__.jpg'),
    /*Acteur*/
    ('Maguire', 'Tobey', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Tobey_Maguire_2014.jpg/260px-Tobey_Maguire_2014.jpg'),
    ('Dunst', 'Kristen', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Kirsten_Dunst_Cannes_2016.jpg/220px-Kirsten_Dunst_Cannes_2016.jpg'),
    ('Dafoe', 'Willem', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Willem_Dafoe_Cannes_2019.jpg/240px-Willem_Dafoe_Cannes_2019.jpg'),
/*Back to the futur*/
    /*Réal*/
    ('Zemeckis', 'Robert', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg/220px-Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg'),
    /*Scénariste*/
    /*('Zemeckis', 'Robert', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg/220px-Robert_Zemeckis_%22The_Walk%22_at_Opening_Ceremony_of_the_28th_Tokyo_International_Film_Festival_%2821835891403%29_%28cropped%29.jpg'),*/
    ('Gale', 'Bob', 'https://www.babelio.com/users/AVT_Bob-Gale_9711.jpeg'),
    /*Acteur*/
    ('Fox', 'Michael J.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Michael_J_Fox_1988-cropped1.jpg/220px-Michael_J_Fox_1988-cropped1.jpg'),
    ('Lloyd' ,'Christopher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Christopher_Lloyd_May_2015.jpg/260px-Christopher_Lloyd_May_2015.jpg'),
    ('Glover', 'Crispin', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Crispin-glover-03072010.jpg/220px-Crispin-glover-03072010.jpg'),
/*Ready Player One*/
    /*Réal*/
    ('Spielberg', 'Steven', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Steven_Spielberg_by_Gage_Skidmore.jpg/220px-Steven_Spielberg_by_Gage_Skidmore.jpg'),
    /*Scénariste*/
    ('Penn', 'Zack', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Zak_Penn_by_Gage_Skidmore_2.jpg/260px-Zak_Penn_by_Gage_Skidmore_2.jpg'),
    ('Cline', 'Ernest', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Ernest_Cline_by_Gage_Skidmore.jpg/220px-Ernest_Cline_by_Gage_Skidmore.jpg'),
    /*Acteur*/
    ('Sheridan', 'Tye', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Tye_Sheridan_by_Gage_Skidmore_3.jpg/220px-Tye_Sheridan_by_Gage_Skidmore_3.jpg'),
    ('Cooke', 'Olivia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Olivia_Cooke_by_Gage_Skidmore_2.jpg/220px-Olivia_Cooke_by_Gage_Skidmore_2.jpg'),
    ('Mendelsohn', 'Ben', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Ben_Mendelsohn_by_Gage_Skidmore.jpg/220px-Ben_Mendelsohn_by_Gage_Skidmore.jpg'),
/*Jurassic Park*/
    /*Réal*/
    /*Scénariste*/
    ('Crichton', 'Michael', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/MichaelCrichton_2.jpg/220px-MichaelCrichton_2.jpg'),
    /*Acteur*/
    ('Neill', 'Sam', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Sam_Neill_2017_%28cropped%29.jpg/220px-Sam_Neill_2017_%28cropped%29.jpg'),
    ('Dern', 'Laura', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Laura_Dern_Deauville_2017.jpg/220px-Laura_Dern_Deauville_2017.jpg'),
    ('Goldblum', 'Jeff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Jeff_Goldblum_Deauville_2017.jpg/220px-Jeff_Goldblum_Deauville_2017.jpg'),
    ('Attenborough', 'Richard', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/RichardAttenborough07TIFF.jpg/220px-RichardAttenborough07TIFF.jpg'),
/*Doctor Dolittle*/
    /*Réal*/
    ('Thomas', 'Betty', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Betty_Thomas_%28cropped%29.jpg/260px-Betty_Thomas_%28cropped%29.jpg'),
    /*Scénariste*/
    ('Mauldin', 'Nat', 'https://images.mubicdn.net/images/cast_member/43045/cache-462614-1566022664/image-w856.jpg?size=120x'),
    ('Levin', 'Larry', 'https://images.gr-assets.com/authors/1282676821p5/3507043.jpg'),
    ('Lofting', 'Hugh', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Hughloftingyoung.jpg/220px-Hughloftingyoung.jpg'),
    /*Acteur*/
    ('Murphy', 'Eddie', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Eddie_Murphy_by_David_Shankbone.jpg/220px-Eddie_Murphy_by_David_Shankbone.jpg'),
    ('Wilson', 'Kristen', 'https://images.mubicdn.net/images/cast_member/43047/cache-244265-1501992652/image-w856.jpg?size=120x')




ALTER TABLE Movie CHECK CONSTRAINT ALL
ALTER TABLE Category CHECK CONSTRAINT ALL
ALTER TABLE Person CHECK CONSTRAINT ALL
ALTER TABLE Casting CHECK CONSTRAINT ALL
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
