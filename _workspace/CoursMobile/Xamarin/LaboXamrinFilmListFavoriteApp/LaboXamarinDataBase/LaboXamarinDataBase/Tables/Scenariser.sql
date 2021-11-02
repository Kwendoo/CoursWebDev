CREATE TABLE [dbo].[Scenariser]
(
	[Id] INT NOT NULL IDENTITY,
	[PersonId] INT NOT NULL,
	[FilmName] VARCHAR(250) NOT NULL, 
    CONSTRAINT [PK_Scenariser] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_PersonID_Scenariser] FOREIGN KEY ([PersonId]) REFERENCES [Person]([Id])
)
