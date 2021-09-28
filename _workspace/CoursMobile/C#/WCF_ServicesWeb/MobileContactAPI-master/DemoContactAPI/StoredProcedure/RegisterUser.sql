CREATE PROCEDURE [dbo].[RegisterUser]
	@Email VARCHAR(50),
	@PassWord VARCHAR(50),
	@IsAdmin BIT
AS

BEGIN

	DECLARE @SALT VARCHAR(100);
	SET @SALT = CONCAT(NEWID(), NEWID());

	DECLARE @SecretKey VARCHAR(50);
	SET @SecretKey = [dbo].[GetSecretKey]();

	DECLARE @PassWord_Hash VARBINARY(64);
	SET @PassWord_Hash = HASHBYTES('SHA2_512', CONCAT(@SALT, @Password, @SecretKey, @SALT))

	INSERT INTO [Users] ([Email], [Password], [ISAdmin], [SALT])
		VALUES (@Email, @PassWord_Hash, @IsAdmin, @SALT)
 
END
