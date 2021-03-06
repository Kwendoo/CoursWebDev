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
PRINT N'Création de Table [dbo].[Jouer]...';


GO
CREATE TABLE [dbo].[Jouer] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [PersonId] INT          NOT NULL,
    [FilmName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Jouer] PRIMARY KEY CLUSTERED ([Id] ASC)
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
PRINT N'Création de Table [dbo].[Realiser]...';


GO
CREATE TABLE [dbo].[Realiser] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [PersonId] INT          NOT NULL,
    [FilmName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Realiser] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Table [dbo].[Scenariser]...';


GO
CREATE TABLE [dbo].[Scenariser] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [PersonId] INT          NOT NULL,
    [FilmName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Scenariser] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_MovieID]...';


GO
ALTER TABLE [dbo].[Casting]
    ADD CONSTRAINT [FK_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [dbo].[Movie] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PersonID_Casting]...';


GO
ALTER TABLE [dbo].[Casting]
    ADD CONSTRAINT [FK_PersonID_Casting] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Person] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PersonID_Jouer]...';


GO
ALTER TABLE [dbo].[Jouer]
    ADD CONSTRAINT [FK_PersonID_Jouer] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([Id]);


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
PRINT N'Création de Clé étrangère [dbo].[FK_PersonId_Realiser]...';


GO
ALTER TABLE [dbo].[Realiser]
    ADD CONSTRAINT [FK_PersonId_Realiser] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([Id]);


GO
PRINT N'Création de Clé étrangère [dbo].[FK_PersonID_Scenariser]...';


GO
ALTER TABLE [dbo].[Scenariser]
    ADD CONSTRAINT [FK_PersonID_Scenariser] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([Id]);


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
ALTER TABLE Jouer NOCHECK CONSTRAINT ALL
ALTER TABLE Realiser NOCHECK CONSTRAINT ALL
ALTER TABLE Scenariser NOCHECK CONSTRAINT ALL


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



INSERT INTO Movie ([Title], [RealeseYear], [Synopsis], [PosterURL], [RealisatorID], [ScenaristID], [CategoryID], [PersonnalComment])
VALUES

/*Die Hard 1 : Piège de Cristal*/
    ('Die Hard : Piège de Cristal', 1988, 
    'Un policier new-yorkais, John McClane, est séparé de sa femme Holly, cadre dans une puissante multinationale japonaise, la Nakatomi Corporation. Venu à Los Angeles passer les fêtes avec elle, il se rend à la tour Nakatomi où le patron donne une grande soirée. Tandis que John s isole pour téléphoner, un groupe de terroristes allemands, dirigé par Hans Gruber, pénètre dans l immeuble.',
    'https://fr.web.img6.acsta.net/c_310_420/pictures/14/08/14/12/00/419467.jpg',
    1, 2, 1, 
    'Le premier de la saga " Die Hard" est un bijou cinématographique. Cela fait maintenant 25 ans que Bruce Willis interprète John McClane avec brio. Tous les ingrédients sont là : les vannes, l action et le suspense. Un scénario qui captive, un huit clos plus que maîtrisé. C est sans aucun doute un film culte pour le voir et le revoir sans hésiter !!!'),

/*Spider Man 2002*/
    ('Spider Man', 2002, 
    'Orphelin, Peter Parker est élevé par sa tante May et son oncle Ben dans le quartier Queens de New York. Tout en poursuivant ses études à l université, il trouve un emploi de photographe au journal Daily Bugle. Il partage son appartement avec Harry Osborn, son meilleur ami, et rêve de séduire la belle Mary Jane.',
    'https://fr.web.img3.acsta.net/c_310_420/medias/nmedia/00/00/00/33/spiderman.jpg',
    7, 8, 26,
    'De loin la meilleure adaptation d un Marvel. Sam Raimi a su reconstituer à la perfection lunivers de Spiderman, plus même, il a su littéralement transcender les personnages et les situations. Peter Parker est ici profondément parlant, et merveilleusement interprété par un Tobey Maguire qui semble né pour ce rôle. Plus que du grand spectacle, cest du grand art.'),

/*Back to the futur*/
    ('Back to the futur', 1985,
    'Le jeune Marty McFly mène une existence anonyme, auprès de sa petite amie Jennifer, seulement troublée par sa famille en crise et un proviseur qui serait ravi de l expulser du lycée. Ami de l excentrique professeur Emmett Brown, il l accompagne tester sa nouvelle expérience : le voyage dans le temps via une DeLorean modifiée. La démonstration tourne mal : des trafiquants d armes débarquent et assassinent le scientifique.',
    'http://nezumi.dumousseau.free.fr/film/illu/backfuture1.jpg',
    12, 12, 14,
    'Un grand moment de cinéma, divertissant et irrésistible. Un film culte avec des personnages cultes et des répliques cultes. Bref, un film à voir absolument.'),

/*Ready Player One*/
    ('Ready Player One', 2018, 
    'En 2045, la planète frôle le chaos et s effondre, mais les gens trouvent du réconfort dans l OASIS, un monde virtuel créé par James Halliday. Lorsque Halliday meurt, il promet son immense fortune à la première personne qui découvre un oeuf de Pâques numérique caché dans l OASIS. Quand le jeune Wade Watts se joint au concours, il devient un héros improbable dans une chasse au trésor qui traverse des mondes fantastiques pleins de mystères, de découvertes et de dangers.',
    'https://fr.web.img2.acsta.net/c_310_420/pictures/18/02/14/09/15/3437390.jpg',
    17, 18, 26,
    'Monsieur spielberg démontre qu il est le maître du grand spectacle cinématographique,une merveille visuelle et 2h20 de pure enchantement,le boss donne encore une leçon du genre'),

/*Jurassic Park*/
    ('Jurassic Park', 1993,
    'Ne pas réveiller le chat qui dort -- c est ce que le milliardaire John Hammond aurait dû se rappeler avant de se lancer dans le clonage de dinosaures. C est à partir d une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d espèces de dinosaures. Il s apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde.',
    'https://images.affiches-et-posters.com//albums/3/2899/medium/2899-affiche-film-jurassic-park.jpg',
    17, 8, 26,
    'Un premier volet réussi, doté d une mise en scène épique. Jurassic Park est un chef d œuvre ! Une mise en scène correcte, des effets spéciaux stupéfiant et des scènes d actions époustouflantes. Du jamais vu ! Un scénario original, doté d une ingéniosité sans précédente. Un casting surchargés, des acteurs au top. Steven Spielberg réalise un film effrayant et exaltant. Ce premier volet est une merveille d adaptation, une franche réussite. Bien garnis d un humour noir, très noir. Splendide ! 5/5'),

/*Doctor Dolittle*/
    ('Doctor Dolittle', 1998,
    'John Dolittle, médecin réputé, vit heureux avec sa famille à San Francisco. Un jour, il découvre qu il peut comprendre les animaux et communiquer avec eux. Ce curieux phénomène bouleverse sa vie, car les animaux sont exigeants au point de lui prendre tout son temps libre. Sa femme Lisa et ses collègues commencent à considérer John Dolittle comme un fou.',
    'https://static.fnac-static.com/multimedia/Images/89/89/E3/70/7398281-1505-1540-1/tsp20180314141906/Dr-Dolittle-AFFICHE-CINEMA-ORIGINALE.jpg#84b86321-0a00-4269-bce0-d628e5084f2f',
    28, 29, 7,
    'Je voulais d abord voir la version avec Rex Harrison, je commence finalement avec celle d Eddie Murphy. Si je suis relativement lucide quant à la qualité du film de Richard Fleischer, il paraît toutefois acté qu elle sera supérieure à celui-ci, Betty Thomas confirmant un talent très limité pour la réalisation. Car sincèrement, il n y a vraiment pas grand-chose ici')


INSERT INTO Casting ([MovieID], [PersonID], [Role])
VALUES

/*Die Hard 1 : Piège de Cristal*/
    (1, 4, 'John McClaine'),
    (1, 5, 'Hans Gruber'),
    (1, 6, 'Holly Gennero McClaine'),

/*Spider Man 2002*/
    (2, 9, 'Peter Parker / Spider Man'),
    (2, 10, 'Mary Jane Watson'),
    (2, 11, 'Norman Osborn / Le Bouffon Vert'),

/*Back to the futur*/
    (3, 14, 'Martin "Marty" McFly'),
    (3, 15, 'Docteur Emmett Lathrop Brown'),
    (3, 16, 'Goerge Douglas McFly'),

/*Ready Player One*/
    (4, 20, 'Wade Owen Watts / Parzival'),
    (4, 21, 'Samantha Avelyn Cook / Art3mis'),
    (4, 22, 'Nolan Sorrento'),

/*Jurassic Park*/
    (5, 24, 'Professeur Alan Grant'),
    (5, 25, 'Professeur Ellie Sattler'),
    (5, 26, 'Professeur Ian Malcom'),
    (5, 27, 'John Hammond'),

/*Docteur Dolittle*/
    (6, 32, 'Docteur Dolittle'),
    (6, 33, 'Lisa Dolittle')


INSERT INTO Realiser ([PersonId], [FilmName])
VALUES

/*McTierman John*/
    (1, 'Nomads en 1986'),
    (1, 'Predator en 1987'),
    (1, 'Die Hard : Piège de cristal en 1988'),
    (1, 'A la poursuite d octobre rouge en 1990'),
    (1, 'Medicine Man en 1992'),
    (1, 'Last Action Hero en 1993'),
    (1, 'Die Hard : Une journée en enfer en 1995'),
    (1, 'Le 13e Guerrier en 1999'),
    (1, 'Thomas Crown en 1999'),
    (1, 'Rollerball en 2002'),
    (1, 'Basic en 2003'),

/*Stuart Jeb*/
    (2, 'La piste du tueur en 1997'),
    (2, 'Blood Done Sign My Name en 2010'),

/*De Souza Steven E.*/
    (3, 'Arnold s Wrecking Co. en 1973'),
    (3, 'Vault of Horror I (TV) en 1994'),
    (3, 'Street Fighter - l ultime combat en 1994'),

/*Rickman Alan*/
    (5, 'L invité de l hiver en 1997'),
    (5, 'Les jardins du roi en 2014'),

/*Raimi Sam*/
    (7, 'Evil Dead en 1981'),
    (7, 'Mort sur le grill en 1985'),
    (7, 'Evil Dead 2 en 1987'),
    (7, 'Darkman en 1990'),
    (7, 'Evil Dead 3 en 1993'),
    (7, 'Mort ou vif en 1995'),
    (7, 'Un plan simple en 1998'),
    (7, 'Pour l amour du jeu en 1999'),
    (7, 'Intuitions en 2000'),
    (7, 'Spider Man en 2002'),
    (7, 'Spider Man 2 en 2004'),
    (7, 'Spider Man 3 en 2007'),
    (7, 'Jusqu en enfer en 2009'),
    (7, 'Le monde fantstique d Oz en 2013'),

/*Koepp David*/
    (8, 'Réactions en chaine en 1996'),
    (8, 'Hypnose en 1999'),
    (8, 'Suspense en 2003'),
    (8, 'Fenètre secrete en 2004'),
    (8, 'La ville fantome en 2008'),
    (8, 'Premium Rush en 2012'),
    (8, 'Charlie Mortdecai en 2015'),
    (8, 'You Should HAve Left en 2020'),

/*Zemeckis Roberts*/
    (12, 'Crazy Day en 1978'),
    (12, 'Grosse magouille en 1980'),
    (12, 'A la poursuite du diamand vert en 1984'),
    (12, 'Retour vers le futur en 1985'),
    (12, 'Qui veux la peau de Roger Rabbit en 1988'),
    (12, 'Retour vers le futur 2 en 1989'),
    (12, 'Retour vers le futur 3 en 1990'),
    (12, 'La mort vous va si bien en 1992'),
    (12, 'Forest Gump en 1994'),
    (12, 'Contact en 1997'),
    (12, 'Apparences en 2000'),
    (12, 'Seul au monde en 2000'),
    (12, 'Le pôle express en 2004'),
    (12, 'La légende de Beowulf en 2007'),
    (12, 'Le drole de noêl de Scrooge en 2009'),
    (12, 'Flight en 2012'),
    (12, 'The Walk : Rêver plus haut en 2015'),
    (12, 'Alliés en 2016'),
    (12, 'Bienvenue à Maurwen en 2018'),
    (12, 'Sacré sorcière en 2020'),

/*Gale Bob*/
    (13, 'Interstate en 2002'),

/*Spielberg Steven*/
    (17, 'Firelight en 1964'),
    (17, 'Duel en 1971'),
    (17, 'Sugarland express en 1974'),
    (17, 'Les dents de la mer en 1975'),
    (17, 'Rencontre du troisième type en 1977'),
    (17, '1941 en 1979'),
    (17, 'Les aventures de l arche perdu en 1981'),
    (17, 'E.T., l extra-terrestre en 1982'),
    (17, 'La quatrième dimenssion en 1983'),
    (17, 'Indiana Jones et le temple maudit en 1984'),
    (17, 'La couleur pourpre en 1985'),
    (17, 'Empire du soleil en 1987'),
    (17, 'Indiana Jones et la denière croisade en 1989'),
    (17, 'Hook ou la revanche du capitaine Crochet en 1991'),
    (17, 'Jurassic park en 1993'),
    (17, 'La liste de Schindler en 1993'),
    (17, 'Le monde perdu : Jurassic park en 1997'),
    (17, 'Amistad en 1997'),
    (17, 'Il faut sauver le soldat Ryan en 1998'),
    (17, 'A.I. Intelligence Artificielle en 2001'),
    (17, 'Minority report en 2002'),
    (17, 'Arrète moi si tu peux en 2002'),
    (17, 'Le Terminal en 2004'),
    (17, 'La Guerre des mondes en 2005'),
    (17, 'Munich en 2005'),
    (17, 'Indina Jones et le royaume de cristal en 2008'),
    (17, 'Les aventures de Tintin : Le secret de la Licorne en 2011'),
    (17, 'Cheval de guerre en 2011'),
    (17, 'Lincoln en 2012'),
    (17, 'Le pont des espions en 2015'),
    (17, 'Le bon gros géant en 2016'),
    (17, 'Pentagone papers en 2017'),
    (17, 'Ready Player One en 2018'),
    (17, 'West Side Story en 2021'),

/*Crichton Michael*/
    (23, 'Pursuit en 1972'),
    (23, 'Mondwest en 1973'),
    (23, 'Mort suspect en 1978'),
    (23, 'La grande attaque du train d or en 1979'),
    (23, 'Looker en 1981'),
    (23, 'Runaway - L évadé du futur en 1984'),
    (23, 'Preuves à l appuie en 1989'),

/*Attenborough Richard*/
    (27, 'Ah Dieu! Que la guerre est jolie en 1969'),
    (27, 'Les griffes du lion en 1972'),
    (27, 'Un pont trop loin en 1977'),
    (27, 'Magic en 1978'),
    (27, 'Gandhi en 1982'),
    (27, 'Chorus Line en 1985'),
    (27, 'Cry Freedom en 1987'),
    (27, 'Chaplin en 1992'),
    (27, 'Les ombres du coeur en 1993'),
    (27, 'Le temps d aimer en 1996'),
    (27, 'Grey Owl en 1999'),
    (27, 'War and Destiny en 2007'),

/*Thomas Betty*/
    (28, 'Flic à tout faire en 1987'),
    (28, 'Docteur Doogie en 1989'),
    (28, 'Nick Mancuso, les dossiers secrets du FBI en 1989'),
    (28, 'Le Bluffeur en 1990'),
    (28, 'Dream on en 1990'),
    (28, 'Parenthood en 1990'),
    (28, 'Son and Daughters en 1991'),
    (28, 'Only you en 1992'),
    (28, 'On the air en 1992'),
    (28, 'My breast en 1994'),
    (28, 'Couples en 1994'),
    (28, 'La tribu Brady en 1995'),
    (28, 'Changement de décors en 1996'),
    (28, 'Parties intimes en 1997'),
    (28, 'Dr. Dolittle en 1998'),
    (28, '28 jours en sursis en 2000'),
    (28, 'Silicon Follies en 2001'),
    (28, 'Espion et demi en 2002'),
    (28, 'Senor White en 2003'),
    (28, 'R3 en 2003'),
    (28, 'John Tucker doit mourir en 2006'),
    (28, 'Alvin et les Chipmunks 2 en 2009')



INSERT INTO Scenariser ([PersonId], [FilmName])
VALUES

/*McTierman John*/
    (1, 'Nomads en 1986'),

/*Stuart Jeb*/
    (2, 'Die Hard : Piège de cristal en 1988'),
    (2, 'Leviathan en 1989'),
    (2, 'Haute sécurité en 1989'),
    (2, 'Vital Signs en 1990'),
    (2, '48 heures de plus en 1990'),
    (2, 'Le Fugitif en 1993'),
    (2, 'Juste Cause en 1995'),
    (2, 'Menace toxique en 1997'),
    (2, 'La piste du tueur en 1997'),
    (2, 'Blood Done Sign My Name en 2010'),
    (2, 'Vikings : Valhalla en 2021'),

/*De Souza Steven E.*/
    (3, 'Arnold s Wrecking Co. en 1973'),
    (3, 'Le nouvel homme invisible en 1976'),
    (3, 'L homme qui vallait trois millards en 1977'),
    (3, 'The Renegades en 1982'),
    (3, '48 Heures en 1982'),
    (3, 'Matthew Star en 1982-1983'),
    (3, 'The Return of Captain Invincible en 1983'),
    (3, 'V (série télévisée) en 1984'),
    (3, 'Commando en 1985'),
    (3, 'Jumpin Jack Flash en 1986'),
    (3, 'Spirit (TV) en 1987'),
    (3, 'Running Man en 1987'),
    (3, 'Supercarrier (TV) en 1988'),
    (3, 'Bad Dreams en 1988'),
    (3, 'Die Hard : Piège de cristal en 1988'),
    (3, 'Die Hard : 58 mintes pour vivre en 1990'),
    (3, 'Hudson Hawk, gentleman et cambrioleur en 1991'),
    (3, 'K-9000 (TV) en 1991'),
    (3, 'Ricochet en 1991'),
    (3, 'Vault Of Horror I en 1994'),
    (3, 'La famille Pierrafeu (The Flintstones) en 1994'),
    (3, 'Le flic de Beverlly Hills 3 en 1994'),
    (3, 'Street Fighter - L ultime combat en 1994'),
    (3, 'Judge Dredd en 1995'),
    (3, 'Piège à Honk Kong en 1998'),
    (3, 'Possessed (TV) en 2000'),
    (3, 'Lara Croft : Tomb Raider, Le berceau de la vie en 2003'),
    (3, 'Blast ! en 2004'),

/*Bruce Willis*/
    (4, 'Hudson Hawk, gentleman et cambrioleur'),

/*Raimi Sam*/
    (7, 'Within the Woods en 1978'),
    (7, 'Evil Dead en 1981'),
    (7, 'Mort sur le grill en 1985'),
    (7, 'Evil Dead 2 en 1987'),
    (7, 'Easy Whells en 1989'),
    (7, 'Darkman en 1990'),
    (7, 'The nutt house en 1992'),
    (7, 'Evil Dead 3 en 1993'),
    (7, 'Le grand saut en 1994'),
    (7, 'Man with the screaming brain en 2005'),
    (7, 'Spider Man 3 en 2007'),
    (7, 'Jusqu en enfer en 2009'),

/*Koepp David*/
    (8, 'Appartment Zero en 1988'),
    (8, 'Dark Angel en 1990'),
    (8, 'Bad Influence en 1990'),
    (8, 'L école des héros en 1991'),
    (8, 'La mort vous va si bien en 1992'),
    (8, 'Jurassic Park en 1993'),
    (8, 'L Impasse en 1993'),
    (8, 'Le Journal en 1994'),
    (8, 'The Shadow en 1994'),
    (8, 'Suspicious en 1994'),
    (8, 'Mission impossible en 1996'),
    (8, 'Réaction en chaine en 1996'),
    (8, 'Le monde perdu : Jurassic Park en 1997'),
    (8, 'Sneak Eyes en 1998'),
    (8, 'Hypnose en 1999'),
    (8, 'Panic Room en 2002'),
    (8, 'Spider Man en 2002'),
    (8, 'Le Justicier de l ombre en 2002'),
    (8, 'Fenêtre secrète en 2004'),
    (8, 'La guerre des mondes en 2005'),
    (8, 'Zathura : Une aventure spatiale en 2005'),
    (8, 'Indiana Jones et le Royaume du crane de cristal en 2008'),
    (8, 'L attaque du metro 123 en 2009'),
    (8, 'Anges et démons en 2009'),
    (8, 'Premier Rush en 2012'),
    (8, 'Men in Black 3 en 2012'),
    (8, 'The Ryan Initiative en 2013'),
    (8, 'Inferno en 2016'),
    (8, 'KIMI en 2022'),

/*Zemeckis Roberts*/
    (12, 'Crazy day en 1978'),
    (12, '1941 en 1979'),
    (12, 'La grosse magouille en 1980'),
    (12, 'Retour vers le futur en 1985'),
    (12, 'Les pilleurs en 1992'),
    (12, 'Expériences interdites en 1997'),
    (12, 'Le pôle express en 2004'),
    (12, 'The Walk : Rêver plus haut en 2015'),
    (12, 'Bienvenu à Marwen en 2018'),
    (12, 'Manifest en 2018'),
    (12, 'Project blue book en 2019'),
    (12, 'What / If en 2019'),
    (12, 'Sacré sorcière en 2020'),

/*Gale Bob*/
    (13, 'A field of honor en 1973'),
    (13, 'Crazy Day en 1978'),
    (13, '1941 en 1979'),
    (13, 'La grosse magouille en 1980'),
    (13, 'Retour vers le futur en 1985'),
    (13, 'Retour vers le futur 2 en 1989'),
    (13, 'Retour vers le futur 3 en 1990'),
    (13, 'Back to the futur : The Ride en 1991'),
    (13, 'Interstate en 2002'),

/*Spielberg Steven*/ 
    (17, 'The last gunfight en 1959'),
    (17, 'Escpe to Nowherre en 1961'),
    (17, 'Fight squad en 1961'),
    (17, 'Fire Light en 1964'),
    (17, 'Slipstream en 1967'),
    (17, 'Amblin en 1968'),
    (17, 'Sugarland express en 1974'),
    (17, 'Rencontre du troisième type en 1977'),
    (17, 'Poltergeist en 1982'),
    (17, 'Histoires fantastiques en 1985'),
    (17, 'Les Goonies en 1985'),
    (17, 'A.I. Intelligence Atrificielle en 2001'),

/*Penn Zack*/
    (18, 'Last Action Hero en 1993'),
    (18, 'PCU en 1994'),
    (18, 'Inspecteur Gadget en 1999'),
    (18, 'En territoire ennemi en 2001'),
    (18, 'X-Men 2 en 2003'),
    (18, 'Incident au Loch Ness en 2004'),
    (18, 'Suspect Zero en 2004'),
    (18, 'Elektra en 2005'),
    (18, 'X-Men : L affrontement final en 2006'),
    (18, 'The Grand en 2007'),
    (18, 'L Incroyable Hulk en 2008'),
    (18, 'Spy Hunter en 2009'),
    (18, 'Avengers en 2012'),
    (18, 'Ready Player One en 2018'),
    (18, 'Free Player (Free Guy) en 2020'),

/*Cline Ernest*/
    (19, 'Ready Player One en 2018'),

/*Crichton Michael*/
    (23, 'Extreme Close Up en 1973'),
    (23, 'Jurassic Park en 1993'),
    (23, 'Twister en 1996'),

/*Mauldin Nat*/
    (29, 'Deux flics à Downtown en 1990'),
    (29, 'La femme du Pasteur en 1997'),
    (29, 'Dr. Dolittle en 1998'),
    (29, 'Espion mais pas trop! en 2004'),
    
/*Levin Larry*/
    (30, 'Dr Dolittle en 1998'),
    (30, 'Dr Dolittle 2 en 2001'),
    (30, 'I love you, Man en 2009'),

/*Lofting Hugh*/
    (31, 'Dr. Dolittle. 2criture des différents livre ayant inspirer le film pendant la prériode allant de 1920 à 1952')


INSERT INTO Jouer ([PersonId], [FilmName])
VALUES

/*Bruce Willis*/
    (4, 'Meutre à Hollywood en 1988'),
    (4, 'Die Hard : Piège de cristal en 1988'),
    (4, 'Allô maman, ici bébé en 1989'),
    (4, 'Die Hard : 58 minutes pour vivre en 1990'),
    (4, 'Hudson Hawk, gentleman et cambrioleur en 1991'),
    (4, 'La mort vous va si bien en 1992'),
    (4, 'Pulp Fiction en 1994'),
    (4, 'L armée des douze singes en 1995'),
    (4, 'Die Hard : Une journée en enfer en 1995'),
    (4, 'Le Cinquième Elément en 1997'),
    (4, 'Armageddon en 1998'),
    (4, 'Couvre feu en 1998'),
    (4, 'Sixième Sens en 1999'),
    (4, 'Sale Môme en 2000'),
    (4, 'Incassable en 2000'),
    (4, 'Bandit en 2001'),
    (4, 'Charlie s Angels : Les Anges se déchainent ! en 2003'),
    (4, 'Ocena s Twelve en 2004'),
    (4, 'Sin City en 2005'),
    (4, 'Nos voisins, les hommes en 2006'),
    (4, 'Die Hard : Retour en enfer en 2007'),
    (4, 'Assassinat d un Président en 2008'),
    (4, 'Clones en 2009'),
    (4, 'Expendables : Unité spéciale en 2010'),
    (4, 'RED en 2010'),
    (4, 'Expendables II : Unité spéciale en 2010'),
    (4, 'G.I. Joe : Conspiration en 2013'),
    (4, 'RED II en 2013'),
    (4, 'RED II en 2013'),
    (4, 'Sin City : J ai tué pour elle en 2014'),
    (4, 'Extraction en 2015'),
    (4, 'Precious Cargo en 2016'),
    (4, 'Split en 2017'),
    (4, 'First Kill en 2017'),
    (4, 'Représailles en 2018'),
    (4, 'Glass en 2019'),
    (4, 'La gradne aventure Lego II en 2019'),
    (4, '10 Minutes Gone en 2019'),
    (4, 'Etat de choc en 2019'),
    (4, 'Survivre en 2020'),
    (4, 'Open Source en 2020'),
    (4, 'Anti-Life en 2020'),
    (4, 'Cosmic Sin en 2021'),
    (4, 'Midnight in the Switchgrass en 2021'),
    (4, 'Out of Death en 2021'),
    (4, 'Survive the Game en 2021'),
    (4, 'Paradise City en 2022'),

/*Rickman Alan*/
    (5, 'Die Hard : Piège de cristal en 1988'),
    (5, 'Calendrier Meurtrier en 1989'),
    (5, 'Mr Quingley l Australien en 1990'),
    (5, 'Colest Land en 1991'),
    (5, 'L amour tabou en 1991'),
    (5, 'Robin des bois, prince des voleurs en 1991'),
    (5, 'Bob Roberts en 1992'),
    (5, 'Mesmer en 1994'),
    (5, 'Raison et sentimets en 1995'),
    (5, 'Michael Collins en 1996'),
    (5, 'L invité de l hiver en 1997'),
    (5, 'Juda Kiss en 1998'),
    (5, 'Dogma en 1999'),
    (5, 'Galaxy Quest en 1999'),
    (5, 'Gloups ! Je suis un poisson en 2000'),
    (5, 'Coup de peigne en 2001'),
    (5, 'Harry Potter à l école des sorciers en 2001'),
    (5, 'Harry Potter et la chambre des secrets en 2002'),
    (5, 'Harry Potter et le prisonnier d Azkaban en 2004'),
    (5, 'H2G2 : Le guide du voyager galactique en 2005'),
    (5, 'Harry Potter et la coupe de feu en 2005'),
    (5, 'Snow Cake en 2006'),
    (5, 'Le Parfum en 2006'),
    (5, 'Harry Potter et l Ordre du Phénix en 2007'),
    (5, 'Sweeny Todd : Le diabolique barbier de Fleet Street en 2007'),
    (5, 'Bottle Shok en 2008'),
    (5, 'Harry Potter et le Prince de sang-mêlé en 2009'),
    (5, 'Alice au pays des merveilles en 2010'),
    (5, 'Harry Potter et les reliques de la mort, partie I en 2010'),
    (5, 'Harry Potter et les reliques de la mort, partie II en 2011'),
    (5, 'Gambit, arnaque à l anglaise en 2013'),
    (5, 'Le Majordome en 2013'),
    (5, 'CBGD en 2013'),
    (5, 'Une promesse en 2014'),
    (5, 'Les Jardins du roi en 2014'),
    (5, 'Eye in the Sky en 2015'),
    (5, 'Alice de l autre coté du miroir en 2016'),

/*Bedelia Bonnie*/
    (6, 'Lune de miel aux orties en 1968'),
    (6, 'Les parachutistes arrivent en 1969'),
    (6, 'The strange vengeance of Rosalie en 1972'),
    (6, 'Between Friends en 1973'),
    (6, '120 degrés Fahrenheit en 1974'),
    (6, 'The big fix en 1978'),
    (6, 'Les vampires de Salem en 1979'),
    (6, 'Pied au plancher en 1983'),
    (6, 'Death of an Angel en 1986'),
    (6, 'Violets are Blue ... en 1986'),
    (6, 'The stranger en 1987'),
    (6, 'Die hard : Piège de cistal en 1988'),
    (6, '58 minutes pour vivre en 1990'),
    (6, 'Le bazaar de l éépouvante en 1993'),
    (6, 'Concentement Judiciaire en 1994'),
    (6, 'Chérie, vote pour moi en 1994'),
    (6, 'Bad Manners en 1997'),
    (6, 'Gloria en 1999'),
    (6, 'Manhiid en 2003'),
    (6, 'Berkley en 2005'),
    (6, 'The trouble with Mom en 2013'),

/*Maguire Tobey*/
    (9, 'Vidéokid : L enfant génial en 1989'),
    (9, 'Blessures secrètes en 1993'),
    (9, 'Revenge of the Red Baron en 1994'),
    (9, 'S.F.W. en 1994'),
    (9, 'Joyride en 1996'),
    (9, 'Harry dans tous ses états en 1997'),
    (9, 'Ice Storm en 1997'),
    (9, 'Las végas parano en 1998'),
    (9, 'Pleasantville en 1998'),
    (9, 'L oeuvre de Dieu, la part du Diable en 1999'),
    (9, 'Chevauchée avec le diable en 1999'),
    (9, 'Wonder Boys en 2000'),
    (9, 'La plume de Don en 2001'),
    (9, 'Comme chiens et chats en 2001'),
    (9, 'Spider Man en 2002'),
    (9, 'Pur sang en 2003'),
    (9, 'Spider Man 2 en 2004'),
    (9, 'The Good German en 2006'),
    (9, 'Spider Man 3 en 2007'),
    (9, 'Tonner sous les tropiques en 2008'),
    (9, 'Brothers en 2009'),
    (9, 'The details en 2012'),
    (9, 'Gatsby le Magnifique en 2013'),
    (9, 'Last Days of Summer en 2014'),
    (9, 'Le Prodige en 2015'),
    (9, 'Baby Boss en 2017'),

/*Dunst Kristen*/
    (10, 'New York stories en 1989'),
    (10, 'Le Bûcher de vanités en 1990'),
    (10, 'High Strung en 1991'),
    (10, 'Greedy en 1994'),
    (10, 'Entretien avec un vampire en 1994'),
    (10, 'Les Quatres filles du docteur March en 1994'),
    (10, 'Jumaji en 1995'),
    (10, 'Mother Night en 1996'),
    (10, 'True Heart en 1997'),
    (10, 'Le fantôme d Halloween en 1997'),
    (10, 'Des hommes d influence en 1997'),
    (10, 'Anastasia en 1997'),
    (10, 'Les filles font la loi en 1998'),
    (10, 'Kiki la petite sorcière en 1998'),
    (10, 'Small Soldiers en 1998'),
    (10, 'Dick : Les coulisses de la présidence en 1999'),
    (10, 'Belle à mourir en 1999'),
    (10, 'Virgin Suicides en 1999'),
    (10, 'The Crow 3 : Salvation en 2000'),
    (10, 'Luckytown Blues en 2000'),
    (10, 'Américan gilrs en 2000'),
    (10, 'Premier amour en 2000'),
    (10, 'Deeply en 2000'),
    (10, 'Allison forever en 2001'),
    (10, 'Sexy/crazy en 2001'),
    (10, 'Un parfum de meurtre en 2001'),
    (10, 'Spider Man en 2002'),
    (10, 'Le salut en 2003'),
    (10, 'Le sourire de Mona Lisa en 2003'),
    (10, 'Kaena, la prophétie en 2003'),
    (10, 'Ethernal sunshine en 2004'),
    (10, 'La plus belle victoire en 2004'),
    (10, 'Spider Man 2 en 2004'),
    (10, 'Rencontre à Elizabethtown en 2005'),
    (10, 'Marie-Antoinette en 2006'),
    (10, 'Spider Man 3 en 2007'),
    (10, 'Un Anglais à New York en 2008'),
    (10, 'Love and Secret en 2010'),
    (10, 'Melancholia en 2011'),
    (10, 'Bachelorette en 2012'),
    (10, 'Sur la route en 2012'),
    (10, 'Upside down en 2013'),
    (10, 'The Bling Ring en 2013'),
    (10, 'Légendes vivantes en 2013'),
    (10, 'The two face en 2014'),
    (10, 'Midmight Special en 2016'),
    (10, 'Les figures de l ombre en 2017'),
    (10, 'Les proies en 2017'),
    (10, 'Woodshock en 2017'),

/*Dafoe Willem*/
    (11, 'American Psycho en 2000'),
    (11, 'Spider Man en 2002'),
    (11, 'Auto Focus en 2002'),
    (11, 'The Rockoning en 2003'),
    (11, 'Il était une fois au Mexique... en 2003'),
    (11, 'Spider Man 2 en 2004'),
    (11, 'xXx 2 : Next Level en 2005'),
    (11, 'Mr Ripley et les ombres en 2005'),
    (11, 'Inside Man en 2006'),
    (11, 'Paris je t aime en 2006'),
    (11, 'The Walker en 2007'),
    (11, 'Spider Man 3 en 2007'),
    (11, 'La poussière du temps en 2008'),
    (11, 'Dans l oeil du tueur en 2009'),
    (11, 'Day breaker en 2010'),
    (11, 'The Hunter en 2011'),
    (11, '4h44 dernier jour sur Terre en 2011'),
    (11, 'John Carter en 2012'),
    (11, 'Le brasier de la colère en 2013'),
    (11, 'Nos étoiles contraires en 2014'),
    (11, 'John Wick en 2014'),
    (11, 'My Hindu Friend en 2015'),
    (11, 'Dog eat Dog en 2016'),
    (11, 'La grande muraille en 2017'),
    (11, 'Seven Sisters en 2017'),
    (11, 'Le crime de l orient express en 2017'),
    (11, 'Aquaman en 2018'),
    (11, 'The light house en 2019'),
    (11, 'Sa dernière volontée en 2020'),
    (11, 'Siberia en 2020'),
    (11, 'The french dispatch en 2021'),
    (11, 'Nightmare Alley en 2021'),
    (11, 'The northman en 2021'),
    (11, 'The card counter en 2021'),
    (11, 'Zack snyder s Justice League en 2021'),

/*Micheal J. Fox*/
    (14, 'Une nuit folle, folle en 1980'),
    (14, 'Class 1984 en 1982'),
    (14, 'Retour vert le futur en 1985'),
    (14, 'Teen Wolf en 1985'),
    (14, 'Light of day en 1987'),
    (14, 'Le secret de mon succès en 1987'),
    (14, 'Les feux de la nuit en 1988'),
    (14, 'Outrages en 1989'),
    (14, 'Retour vers le futur 2 en 1989'),
    (14, 'Retour vers le futur 3 en 1990'),
    (14, 'Doc Hollywood en 1991'),
    (14, 'Manière forte en 1991'),
    (14, 'Graine de star en 1993'),
    (14, 'Le concierge de Bradbury en 1993'),
    (14, 'Greedy en 1994'),
    (14, 'Le prince des rivières en 1994'),
    (14, 'Coldblooded en 1995'),
    (14, 'Le Président en 1995'),
    (14, 'Brookline boogie en 1995'),
    (14, 'Fantômes contre fantômes en 1996'),
    (14, 'Mars Attacks! en 1996'),
    (14, 'Interstate 60 en 2002'),
    (14, 'Annie en 2014'),
    (14, 'See You Yesterday en 2019'),

/*Lloyd Christopher*/
    (15, 'Vol au dessu d un nid de coucou en 1975'),
    (15, 'Un autre homme, une autre chose en 1977'),
    (15, 'En route vers le sud en 1978'),
    (15, 'Du rouge pour un truant en 1979'),
    (15, 'Tueurs de flics en 1979'),
    (15, 'The black marble en 1980'),
    (15, 'Le facteur sonne toujours deux fois en 1981'),
    (15, 'Le justicier solitaire en 1981'),
    (15, 'Retour vers le futur en 1985'),
    (15, 'Cluedo en 1985'),
    (15, 'Tout va trop bien en 1986'),
    (15, 'Qui veux la peau de Roger Rabbit en 1988'),
    (15, 'Retour vers le futur 2 en 1989'),
    (15, 'Retour vers le futur 3 en 1990'),
    (15, 'La famille Adams en 1991'),
    (15, 'Twenty bucks en 1993'),
    (15, 'Denis la malice en 1993'),
    (15, 'Les valeurs de la famille Adams en 1993'),
    (15, 'Une équipe aux anges en 1994'),
    (15, 'Richard au pays des livres magiques en 1994'),
    (15, 'Dernières heures à Denver en 1995'),
    (15, 'Une vraie blonde en 1997'),
    (15, 'Mon matrien bien aimé en 1999'),
    (15, 'Ptits génies en 1999'),
    (15, 'Man on the moon en 1999'),
    (15, 'Kids wolrd en 2001'),
    (15, 'Interstate 60 en 2002'),
    (15, 'Flakes en 2007'),
    (15, 'Snowmen en 2010'),
    (15, 'Last call en 2010'),
    (15, 'Piranha 3D en 2010'),
    (15, 'Amour, marrogae et petits tracas en 2011'),
    (15, 'Dead before down en 2012'),
    (15, 'Piranha 2 3D en 2012'),
    (15, 'Excuse me for living en 2012'),
    (15, 'Albert à l ouest en 2014'),
    (15, 'Sin City : J ai tué pour elle en 2014'),
    (15, '88 en 2015'),
    (15, 'The boat builder en 2015'),
    (15, 'Cold moon en 2015'),
    (15, 'I am not a serial killer en 2016'),
    (15, 'Bracage à l ancienne en 2017'),
    (15, 'The sound en 2017'),
    (15, 'Muse en 2017'),
    (15, 'Boundaries en 2018'),
    (15, 'Queen bees en 2021'),
    (15, 'Nobody en 2021'),
    (15, 'The tendre bar en 2021'),

/*Glover Crispin*/
    (16, 'L été du lac en 1983'),
    (16, 'Les moissons du printemps en 1984'),
    (16, 'Vendredi 13 : chapitre final en 1984'),
    (16, 'Ras les profs! en 1984'),
    (16, 'Retour vers le futur en 1985'),
    (16, 'Comme un chien enragé en 1986'),
    (16, 'Le fleuve de la mort en 1986'),
    (16, 'Famille Cleveland en 1989'),
    (16, 'Tout pour réussir en 1990'),
    (16, 'Sailor et Lula en 1990'),
    (16, 'Fredydurke en 1991'),
    (16, 'The doors en 1991'),
    (16, 'Even cowgilrs get the blues en 1993'),
    (16, 'Gilbert Grape en 1993'),
    (16, 'L escorte infernal en 1994'),
    (16, 'Dead man en 1995'),
    (16, 'Larry Flynt en 1996'),
    (16, 'Nurse Betty en 2000'),
    (16, 'Charlie et ses drole de dames en 2000'),
    (16, 'Fast Sofa en 2001'),
    (16, 'Magic basket en 2002'),
    (16, 'Charlie s Angels : les anges se déchainent en 2003'),
    (16, 'What is it ? en 2004'),
    (16, 'Sexy à mort en 2005'),
    (16, 'Evil twins en 2006'),
    (16, 'Big moovie en 2007'),
    (16, 'La légende de Beowulf en 2007'),
    (16, 'Le sorcier macabre en 2007'),
    (16, 'Numero 9 en 2009'),
    (16, 'Alice au pays des merveilles en 2010'),
    (16, 'La machine à démonter le temps en 2010'),
    (16, 'Mr Nice en 2010'),
    (16, 'Freaky Deaky en 2013'),
    (16, 'The Con is on en 2018'),
    (16, 'Lucky day en 2019'),

/*Spielberg Steven*/
    (17, 'La chose en 1972'),
    (17, 'Les dents de la mer en 1975'),
    (17, 'The blues brothers en 1980'),
    (17, 'E.T., l extra-terrestre en 1982'),
    (17, 'Grimlins en 1984'),
    (17, 'Indiana Jones et le temple maudit en 1984'),
    (17, 'Retour vers le futur en 1985'),
    (17, 'Liberian Girl, clip video en 1989'),
    (17, 'A century of cinema en 1994'),
    (17, 'Le monde perdu : Jurassic Park en 1997'),
    (17, 'Vanilla sky en 2001'),
    (17, 'Austin Power dans Goldmember en 2002'),
    (17, 'Transfomers 2 en 2009'),
    (17, 'Paul en 2011'),

/*Pznn Zack*/
    (18, 'PCU en 1994'),
    (18, 'Star Maps en 1997'),
    (18, 'Chuck et Buck en 2000'),
    (18, 'Osmosis Jones en 2001'),

/*Sheridan Tye*/
    (20, 'The tree of Life en 2011'),
    (20, 'Mud : Sur les rives du Mississippi en 2012'),
    (20, 'Joe en 2013'),
    (20, 'L affaire Money en 2014'),
    (20, 'Dark Place en 2015'),
    (20, 'Last Day in the Desert en 2015'),
    (20, 'The Stanford Prison Experiment en 2015'),
    (20, 'Manuel de survie à l apocalypse zombie en 2015'),
    (20, 'Entrainment en 2015'),
    (20, 'X-Men : Apocalypse en 2016'),
    (20, 'The yellow Bird en 2017'),
    (20, 'Grass Staints en 2017'),
    (20, 'Ready Player One en 2018'),
    (20, 'Deadpool 2 en 2018'),
    (20, 'Friday s Childs en 2018'),
    (20, 'The Montains en 2018'),
    (20, 'X-Men : Dark Phoenix en 2019'),
    (20, 'The night clerck en 2020'),
    (20, 'Voyager en 2021'),
    (20, 'The card Counter en 2021'),

/*Cooke Olivia*/
    (21, 'The signal en 2014'),
    (21, 'Ouija en 2014'),
    (21, 'Les âmes silencieuses en 2014'),
    (21, 'This is not a love story en 2015'),
    (21, 'Katie Says Goodbye en 2016'),
    (21, 'Golem, le tueur de Londre en 2016'),
    (21, 'Pur-sang en 2018'),
    (21, 'Ready Player One en 2018'),
    (21, 'Seul la vie... en 2018'),
    (21, 'Sound of metal en 2019'),

/*Mendelsohn Ben*/
    (22, 'The still point en 1986'),
    (22, 'The Year My Voice Broke en 1987'),
    (22, 'Lover Boy en 1989'),
    (22, 'The Big steal en 1990'),
    (22, 'Nirvana street murder en 1990'),
    (22, 'Return Home en 1990'),
    (22, 'Mr Quinley l Australien en 1990'),
    (22, 'Spotswood en 1992'),
    (22, 'Coeur de métisse en 1992'),
    (22, 'Say a little Prayer en 1993'),
    (22, 'Sirènes en 1994'),
    (22, 'Metal Skin en 1994'),
    (22, 'Idiot box en 1996'),
    (22, 'Cosi en 1996'),
    (22, 'True love and Chaos en 1994'),
    (22, 'Amy en 1998'),
    (22, 'Love Brokers en 1999'),
    (22, 'Vertical Limit en 2000'),
    (22, 'Sample poeple en 2000'),
    (22, 'Mullet en 2001'),
    (22, 'Black and White en 2002'),
    (22, 'Le nouveau monde en 2005'),
    (22, 'Le sens de la vie pour 9,99$ en 2008'),
    (22, 'Aistralia en 2008'),
    (22, 'Prime mover en 2009'),
    (22, 'Beautiful Kate en 2009'),
    (22, 'Prédictions en 2009'),
    (22, 'Needle en 2010'),
    (22, 'Animal Kingdom en 2010'),
    (22, 'Killer Elite en 2011'),
    (22, 'Effraction en 2012'),
    (22, 'The dark Knight Rises en  2012'),
    (22, 'Cogan : Killing Them softly en  2012'),
    (22, 'The place beyond the pines en  2012'),
    (22, 'Perfect Mother en  2013'),
    (22, 'Les points contre le mur en  2013'),
    (22, 'Exodus : Gods and Kings en  2014'),
    (22, 'Black sea en  2014'),
    (22, 'Lost River en  2014'),
    (22, 'Slow West en  2015'),
    (22, 'Under Pressure en  2015'),
    (22, 'Una en  2015'),
    (22, 'Rogue One : A star wars story en  2016'),
    (22, 'Untogether en  2017'),
    (22, 'Les heures sombres en  2017'),
    (22, 'Larikkins en  2018'),
    (22, 'Ready Player One en  2018'),
    (22, 'Robin des bois en  2018'),
    (22, 'Au pays des habitudes en  2018'),
    (22, 'Captain Marvel en  2019'),
    (22, 'Spider Man : Far From Home en  2019'),
    (22, 'Le roi en  2019'),
    (22, 'Babyteeth en  2019'),
    (22, 'Les Incognitos en  2019'),
    (22, 'Cyrano en  2021'),

/*Neill Sam*/
    (24, 'Landfall en 1975'),
    (24, 'Ashes en 1975'),
    (24, 'Sleeping Dogs en 1977'),
    (24, 'Ma brillante carrière en 1979'),
    (24, 'The Journalist en 1979'),
    (24, 'Just out of reach en 1979'),
    (24, 'La malédiction finale en 1981'),
    (24, 'Possession en 1981'),
    (24, 'From a far country en 1981'),
    (24, 'Attack force Z en 1982'),
    (24, 'Enigma en 1982'),
    (24, 'Le sang des autres en 1984'),
    (24, 'Robbery under arms en 1985'),
    (24, 'Plenty en 1985'),
    (24, 'For Love Alone en 1986'),
    (24, 'The umbrella Woman en 1987'),
    (24, 'Un cri dans la nuit en 1988'),
    (24, 'Calme blanc en 1989'),
    (24, 'La révolution française en 1989'),
    (24, 'Shadow of China en 1989'),
    (24, 'A la poursuite d octobre rouge en 1990'),
    (24, 'Death in Brunswick en 1990'),
    (24, 'Jusqu au bout du monde en 1991'),
    (24, 'Les aventure de l homme invisible en 1992'),
    (24, 'Hostage en 1993'),
    (24, 'Jurassic Park en 1993'),
    (24, 'La Leçon de piano en 1993'),
    (24, 'Sirènes en 1994'),
    (24, 'Le livre de la jungle en 1994'),
    (24, 'Le don du roi en 1995'),
    (24, 'Les enfants de la révolution en 1996'),
    (24, 'Victory en 1996'),
    (24, 'Amour, vengenace et trahison en 1998'),
    (24, 'Molokai : the story of father Damien en 1999'),
    (24, 'L homme bicentenaire en 1999'),
    (24, 'Jurassic park 3 en 2001'),
    (24, 'The Zookeeper en 2001'),
    (24, 'Dirty deeds en 2002'),
    (24, 'Perfect Stranger en 2003'),
    (24, 'Yes en 2004'),
    (24, 'La plus belle vitoire en 2004'),
    (24, 'Little fish en 2005'),
    (24, 'Irréssistible en 2006'),
    (24, 'Angel en 2007'),
    (24, 'Dean Spanley en 2008'),
    (24, 'Skin en 2008'),
    (24, 'In her skin en 2009'),
    (24, 'Le secret des septs volcans en 2009'),
    (24, 'Daybreakers en 2009'),
    (24, 'The Dragon Pearl en 2010'),
    (24, 'The hunter en 2011'),
    (24, 'Je te promet en 2012'),
    (24, 'Evasion en 2013'),
    (24, 'Les aventures extraordinaire d un apprenti détective en 2013'),
    (24, 'Up and Down en 2014'),
    (24, 'United passion en 2014'),
    (24, 'Backtrack : Les revenants en 2015'),
    (24, 'The daughter en 2015'),
    (24, 'DxM en 2015'),
    (24, 'A la poursuite de Ricky Baker en 2016'),
    (24, 'Thor : Ragnarock en 2017'),
    (24, 'Sweet country en 2017'),
    (24, 'The passender en 2018'),
    (24, 'Pierre Lapin en 2018'),
    (24, 'Ride Like a girl en 2019'),
    (24, 'Blackbird en 2020'),

/*Dern Laure*/
    (25, 'Ca plane les fille en 1980'),
    (25, 'Ras les profs ! en 1984'),
    (25, 'Mask en 1985'),
    (25, 'Un été en enfer en 1988'),
    (25, 'Les maitres de l ombre en 1989'),
    (25, 'Sailor et Lula en 1990'),
    (25, 'Jurassic Park en 1993'),
    (25, 'Un monde parfait en 1993'),
    (25, 'Citizen Ruth en 1996'),
    (25, 'Ciel d octobre en 1999'),
    (25, 'Docteur T et les femmes en 2000'),
    (25, 'Jurassic Park 3 en 2001'),
    (25, 'Novocaine en 2001'),
    (25, 'Sam, je suis Sam en 2001'),
    (25, 'Coeur perdu en 2006'),
    (25, 'Traqués en 2009'),
    (25, 'Mon beau-père et nous en 2010'),
    (25, 'Everything Must Go en 2010'),
    (25, 'The Master en 2012'),
    (25, 'Nos étoiles contraire en 2014'),
    (25, 'When the game stand all en 2014'),
    (25, 'Wild en 2014'),
    (25, 'Dancing heart en 2015'),
    (25, '99 Homes en 2016'),
    (25, 'Le fondateur en 2016'),
    (25, 'Certaines femmes en 2017'),
    (25, 'Wilson en 2017'),
    (25, 'Star Wars, épisode VIII : Les dernier Jedi en 2017'),
    (25, 'Downsizing en 2017'),
    (25, 'Le passée recomposé en 2018'),
    (25, 'J.T. LeRoy en 2018'),
    (25, 'Sang froid en 2019'),
    (25, 'Les filles du docteur March en 2019'),
    (25, 'Trial By fire en 2019'),
    (25, 'MArriage Story en 2019'),
    (25, 'Grizzly II : The predator en 2020'),
    (25, 'Jurassic World : Le monde d après en 2021'),

/*Goldblum Jeff*/
    (26, 'Un justicier dans la ville en 1974'),
    (26, 'Monsieurs Saint Yves en 1976'),
    (26, 'Tu ne m oublieras pas en 1978'),
    (26, 'L invasion des profanateurs en 1978'),
    (26, 'Thresold en 1981'),
    (26, 'Les copains d abord en 1983'),
    (26, 'La mouche en 1986'),
    (26, 'Enquête en tête en 1988'),
    (26, 'La mouche 2 en 1989'),
    (26, 'Le rêve du singe fou en 1990'),
    (26, 'The player en 1992'),
    (26, 'Jurassic Park en 1993'),
    (26, 'Souvenirs de l au-delà en 1995'),
    (26, 'Independence Day en 1996'),
    (26, 'Le monde perdu : Jurassic Park en 1997'),
    (26, 'Le prince d Egypte en 1998'),
    (26, 'Hollywood liste rouge en 2000'),
    (26, 'Comme chiens et chats en 2001'),
    (26, 'Dallas 362 en 2003'),
    (26, 'La vie aquatique en 2004'),
    (26, 'Man of the year en 2006'),
    (26, 'Fay Grim en 2006'),
    (26, 'Adam resurected en 2008'),
    (26, 'Morning glory en 2010'),
    (26, 'Une famille très moderne en 2010'),
    (26, 'Zambezia en 2012'),
    (26, 'Un week-end à Paris en 2013'),
    (26, 'The Grand Budapest Hotel en 2014'),
    (26, 'Charlier Mordecai en 2015'),
    (26, 'Independence Day : Resurgence en 2016'),
    (26, 'Les gardiens de la galaxie Vol.2 en 2017'),
    (26, 'Thor : Ragnarock en 2017'),
    (26, 'L île aux chiens en 2018'),
    (26, 'Jurassic World : Fallen Kingdom en 2018'),
    (26, 'Hotel Artemis en 2018'),
    (26, 'The mountain : Une odyssée américaine en 2018'),

/*Attenborough Richard*/
    (27, 'Ceux qui servent en mer en 1942'),
    (27, 'La grande aventure en 1945'),
    (27, 'School for secret en 1946'),
    (27, 'London Belongs to me en 1948'),
    (27, 'La nuit commence à l aube en 1950'),
    (27, 'Commando sur Saint Nazaire en 1952'),
    (27, 'Le bateau qui mouru de honte en 1955'),
    (27, 'Dunkerque en 1958'),
    (27, 'Le mouchard en 1959'),
    (27, 'Après moi le déluge en 1959'),
    (27, 'SOS Pacific en 1959'),
    (27, 'Hold up à Londre en 1959'),
    (27, 'Jet storm en 1959'),
    (27, 'Le vent garde le secret en 1961'),
    (27, 'La grande évasion en 1963'),
    (27, 'Le secret du docteur Whitset en 1964'),
    (27, 'Le rideau de brume en 1964'),
    (27, 'La cannonière de Yang Tse en 1966'),
    (27, 'The Magic Christian en 1969'),
    (27, 'Un tête coupée en 1970'),
    (27, 'Dix petits nègres en 1974'),
    (27, 'Brannigan en 1975'),
    (27, 'The human factor en 1979'),
    (27, 'Jurassic Park en 1993'),
    (27, 'Le miracle de la 34e rue en 1994'),
    (27, 'Hamlet en 1996'),
    (27, 'Le monde perdu : Jurassic Park en 1997'),
    (27, 'Jack et la haricot magique en 2001'),

/*Thomas Betty*/
    (28, 'Tunnel vision en 1976'),
    (28, 'Jackson County Jail en 1976'),
    (28, 'Chesty Anderson en 1976'),
    (28, 'Dog and Cat en 1977'),
    (28, 'Outside chance en 1978'),
    (28, 'La grosse magouille en 1980'),
    (28, 'Loose Shoes en 1980'),
    (28, 'Enlèvement à Nashville en 1981'),
    (28, 'Capitaine Furillo en 1981'),
    (28, 'Homework en 1982'),
    (28, 'When Your Lover Leaves en 1983'),
    (28, 'No Greater Gift en 1985'),
    (28, 'Prison for Children en 1987'),
    (28, 'Les Scoouts de Beverly Hills en 1989'),

/*Murphy Eddie*/
    (32, '48 heures en 1982'),
    (32, 'Un fauteille pour deux en 1983'),
    (32, 'Une défense canon en 1984'),
    (32, 'Le flic de Beverly Hills en 1984'),
    (32, 'Golden Child : l enfant sacré du Tibet en 1986'),
    (32, 'Le flic de Beverly Hills 2 en 1987'),
    (32, 'Un prince à New York en 1988'),
    (32, 'Les nuits de Harlem en 1989'),
    (32, '48 heures de plus en 1990'),
    (32, 'Boomerang en 1992'),
    (32, 'Monsieur le député en 1992'),
    (32, 'Le flic de Berverly Hills 3 en 1994'),
    (32, 'Un vampire à Brooklyn en 1995'),
    (32, 'Professeur Foldingue en 1996'),
    (32, 'Le flic de San Francisco en 1997'),
    (32, 'Docteur Dolittle en 1998'),
    (32, 'Mister G. en 1998'),
    (32, 'Perpète en 1999'),
    (32, 'Bowfinger, roi d Hollywood en 1999'),
    (32, 'La famille Foldingue en 2000'),
    (32, 'Docteur Dolittle 2 en 2001'),
    (32, 'Show Time en 2002'),
    (32, 'Pluto Nash en 2002'),
    (32, 'Espion et demi en 2003'),
    (32, 'Ecole paternelle en 2003'),
    (32, 'Le manoir hanté et les 999 Fantômes en 2003'),
    (32, 'Dreamgirls en 2006'),
    (32, 'Norbit en 2007'),
    (32, 'Appelez moi Dave en 2008'),
    (32, 'Dans ses rêves en 2009'),
    (32, 'La casse de Central Park en 2011'),
    (32, 'Mille mots en 2012'),
    (32, 'Mr. Church en 2016'),
    (32, 'Dolemite is My Name en 2019'),
    (32, 'Un prince à New York 2 en 2021'),

/*Wilson Kristen*/
    (33, 'Tyson, the true legend en 1995'),
    (33, 'Dr. Dolittle en 1998'),
    (33, 'Donjons & Dragons en 2000'),
    (33, 'Dr. Dolittle 2 en 2001'),
    (33, 'Ma famille d abord en 2002'),
    (33, 'Tolérance Zero en 2004'),
    (33, 'Des amours de soeurcières en 2005'),
    (33, 'Dr. Dolittle 3 en 2006'),
    (33, 'Des amours de soeurcières en 2007')



ALTER TABLE Movie CHECK CONSTRAINT ALL
ALTER TABLE Category CHECK CONSTRAINT ALL
ALTER TABLE Person CHECK CONSTRAINT ALL
ALTER TABLE Casting CHECK CONSTRAINT ALL
ALTER TABLE Jouer CHECK CONSTRAINT ALL
ALTER TABLE Realiser CHECK CONSTRAINT ALL
ALTER TABLE Scenariser CHECK CONSTRAINT ALL
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
