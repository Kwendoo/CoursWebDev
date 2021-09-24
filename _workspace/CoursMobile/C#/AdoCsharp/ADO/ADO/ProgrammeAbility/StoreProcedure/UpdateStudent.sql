CREATE PROCEDURE [dbo].[UpdateStudent]
	@YearResult INT,
	@SectionId INT
AS
	UPDATE Student
	SET [YearResult] = @YearResult, [SectionId] = @SectionId;
RETURN 0