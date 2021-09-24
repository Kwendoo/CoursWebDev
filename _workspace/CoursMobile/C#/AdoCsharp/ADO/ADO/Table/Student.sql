CREATE TABLE [dbo].[Student]
(
	[Id] INT NOT NULL IDENTITY ,
	[LastName] VARCHAR (50) NOT NULL,
	[FirstName] VARCHAR (50) NOT NULL,
	[BirthDate] DATETIME2 (7) NOT NULL,
	[YearResult] INT NOT NULL,
	[SectionId] INT NOT NULL,
	[Active] BIT CONSTRAINT DF_Student_Active DEFAULT(1) NOT NULL, 
    CONSTRAINT [PK_Student] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Student_Section] FOREIGN KEY ([SectionId]) REFERENCES [Section]([Id]), 
    CONSTRAINT [CK_Student_YearResult] CHECK ([YearResult] BETWEEN 0 AND 20), 
    CONSTRAINT [CK_Student_BirthDate] CHECK (YEAR(BirthDate) >= 1930),
)

GO

CREATE TRIGGER [dbo].[TG_Student_Delete]
    ON [dbo].[Student]
    INSTEAD OF DELETE
    AS
    BEGIN
        UPDATE [Student] SET [Active] = 0
            WHERE [Student].[Id] IN (SELECT [Id] FROM [deleted])
    END