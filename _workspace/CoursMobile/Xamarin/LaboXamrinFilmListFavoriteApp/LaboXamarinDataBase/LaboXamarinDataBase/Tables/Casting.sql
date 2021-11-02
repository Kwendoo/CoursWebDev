CREATE TABLE [dbo].[Casting]
(
	[Id] INT NOT NULL  IDENTITY (1, 1),
	[MovieID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[Role] VARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_Casting] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_MovieID] FOREIGN KEY ([MovieID]) REFERENCES [Movie]([Id]), 
    CONSTRAINT [FK_PersonID_Casting] FOREIGN KEY ([PersonID]) REFERENCES [Person]([Id])
)
