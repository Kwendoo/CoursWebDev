CREATE TABLE [dbo].[Movie]
(
	[Id] INT NOT NULL IDENTITY (1, 1),
	[Title] VARCHAR(50) NOT NULL,
	[RealeseYear] INT NOT NULL,
	[Synopsis] VARCHAR(MAX) NOT NULL,
	[PosterURL] VARCHAR(MAX) NOT NULL,
	[RealisatorID] INT NOT NULL,
	[ScenaristID] INT NOT NULL,
	[CategoryID] INT NOT NULL,
	[PersonnalComment] VARCHAR(MAX) NOT NULL, 
    CONSTRAINT [PK_Movie] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_RealisatorID] FOREIGN KEY ([RealisatorID]) REFERENCES [Person]([Id]), 
    CONSTRAINT [FK_ScenaristID] FOREIGN KEY ([ScenaristID]) REFERENCES [Person]([Id]), 
    CONSTRAINT [FK_CategoryID] FOREIGN KEY ([CategoryID]) REFERENCES [Category]([Id])
)
