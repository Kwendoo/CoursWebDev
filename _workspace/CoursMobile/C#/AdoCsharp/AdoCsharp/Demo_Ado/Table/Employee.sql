CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL  IDENTITY, 
    [LastName] NVARCHAR(50) NOT NULL,
	[FirstName] NVARCHAR(50) NOT NULL, 
    [Email] NVARCHAR(150) NOT NULL,
    [ManagerId] INT NULL,
    [Active] BIT CONSTRAINT DF_Employee_Active DEFAULT(1) NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY ([Id]), 
    CONSTRAINT [CK_Employee_LastName] CHECK (LEN(RTRIM(LTRIM([LastName]))) > 0),
    CONSTRAINT [CK_Employee_FirstName] CHECK (LEN(RTRIM(LTRIM([FirstName]))) > 0), 
    CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([ManagerId]) REFERENCES [Employee]([Id]), 
    CONSTRAINT [UK_Employee_Email] UNIQUE ([Email]),
)

GO

CREATE INDEX [IX_Employee_Email] ON [dbo].[Employee] ([Email])

GO

CREATE TRIGGER [dbo].[TG_Employee_Delete]
    ON [dbo].[Employee]
    INSTEAD OF DELETE
    AS
    BEGIN
        UPDATE [Employee] SET [Active] = 0 
            WHERE [Employee].[Id] IN (SELECT [Id] FROM [deleted])
    END