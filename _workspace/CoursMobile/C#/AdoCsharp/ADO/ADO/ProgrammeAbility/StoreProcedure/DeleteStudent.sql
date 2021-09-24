CREATE PROCEDURE [dbo].[DeleteStudent]
	@Id INT
AS
	DELETE 
	FROM Student
	WHERE [Id] = @Id
RETURN 0