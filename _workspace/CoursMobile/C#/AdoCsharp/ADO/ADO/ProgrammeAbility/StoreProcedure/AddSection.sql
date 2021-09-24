CREATE PROCEDURE [dbo].[AddSection]
	@Id INT,
	@SectionName VARCHAR(50)
AS
	INSERT INTO Section([Id], [SectionName])
	OUTPUT [inserted].[Id]
	VALUES (@SectionName, @Id);
RETURN 0
