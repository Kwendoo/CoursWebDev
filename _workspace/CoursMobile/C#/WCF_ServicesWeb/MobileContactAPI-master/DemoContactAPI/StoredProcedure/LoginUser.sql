CREATE PROCEDURE [dbo].[LoginUser]
	@Email VARCHAR(50),
	@PassWord VARCHAR(50),
	@IsAdmin BIT
AS

BEGIN

	DECLARE @SALT VARCHAR(100);
	SET @SALT =(SELECT @SALT FROM Users WHERE Email = @Email)

	IF @SALT IS NOT NULL
	BEGIN

		DECLARE @SecretKey VARCHAR(50);
		SET @SecretKey = [dbo].[GetSecretKey]();

		DECLARE @PassWord_Hash VARBINARY(64);
		SET @PassWord_Hash = HASHBYTES('SHA2_512', CONCAT(@SALT, @Password, @SecretKey, @SALT))

		SELECT Id, Email IsAdmin FROM Users WHERE Password = @PassWord_Hash AND Email = @Email
	
	END
 
END
