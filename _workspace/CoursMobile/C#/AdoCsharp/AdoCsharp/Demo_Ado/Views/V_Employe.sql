CREATE VIEW [dbo].[V_Employe]
	AS 
	SELECT [E1].[LastName], [E1].[FirstName], [E2].[LastName] AS [Manager] 
	FROM [Employee] [E1]
	JOIN [Employee] [E2] ON ([E1].[ManagerId] = [E2].[Id])
