CREATE TABLE [dbo].[Jouer]
(
	[Id] INT NOT NULL IDENTITY,
	[PersonId] INT NOT NULL,
	[FilmName] VARCHAR(250) NOT NULL, 
    CONSTRAINT [PK_Jouer] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PersonID_Jouer] FOREIGN KEY ([PersonId]) REFERENCES [Person]([Id])
)
