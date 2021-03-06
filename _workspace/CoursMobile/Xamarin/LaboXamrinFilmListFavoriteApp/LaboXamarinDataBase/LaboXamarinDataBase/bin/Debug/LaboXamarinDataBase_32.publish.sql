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
    'MONSIEUR spielberg démontre qu il est le maître du grand spectacle cinématographique,une merveille visuelle et 2h20 de pure enchantement,le boss donne encore une leçon du genre'),

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
