CREATE TABLE [dbo].[Realiser]
(
	[Id] INT NOT NULL IDENTITY,
	[PersonId] INT NOT NULL,
	[FilmName] VARCHAR(250) NOT NULL, 
    CONSTRAINT [PK_Realiser] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PersonId_Realiser] FOREIGN KEY ([PersonId]) REFERENCES [Person]([Id])
)
