CREATE PROCEDURE [dbo].[CSP_AddEmployee]
	@LastName NVARCHAR(50),
	@FirstName NVARCHAR(50),
	@Email NVARCHAR(150),
	@ManagerId INT
AS
	INSERT INTO [Employee] ([LastName], [FirstName], [Email], [ManagerId])
	OUTPUT [inserted].[Id]
	VALUES (@LastName, @FirstName, @Email, @ManagerId);
RETURN 0
