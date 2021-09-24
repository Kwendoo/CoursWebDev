CREATE PROCEDURE [dbo].[AddStudent]
	@LastName NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@BirthDate DATETIME2(7),
	@YearResult INT,
	@SectionId INT
AS
	INSERT INTO Student([LastName], [FirstName], [BirthDate], [YearResult], [SectionId])
	OUTPUT [inserted].[Id]
	VALUES (@LastName, @FirstName, @BirthDate, @YearResult, @SectionId);
RETURN 0