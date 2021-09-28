CREATE TABLE [dbo].[Users]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Email] VARCHAR(50) NOT NULL,
	[Password] VARBINARY(64) NOT NULL,
	[ISAdmin] BIT NOT NULL,
	--Idéalement stocké dans une autre DB ou  autre table (dans un autre schéma)
	[SALT] VARCHAR(100) NOT NULL
)
