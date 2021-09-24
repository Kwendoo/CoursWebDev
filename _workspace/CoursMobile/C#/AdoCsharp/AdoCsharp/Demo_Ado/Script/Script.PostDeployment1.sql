/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

set identity_insert [Employee] ON;

INSERT INTO [Employee] ([Id],[LastName],[FirstName],[Email],[ManagerId]) VALUES   
 (1, N'Ken', N'Sánchez', 'A@gmail.com', NULL)  
,(273, N'Brian', N'Welcker', 'B@gmail.com',1)  
,(274, N'Stephen', N'Jiang', 'C@gmail.com',273)  
,(275, N'Michael', N'Blythe', 'D@gmail.com',274)  
,(276, N'Linda', N'Mitchell', 'E@gmail.com',274)  
,(285, N'Syed', N'Abbas', 'F@gmail.com', 273)  
,(286, N'Lynn', N'Tsoflias', 'G@gmail.com', 285)  
,(16,  N'David',N'Bradley', 'H@gmail.com', 273)  
,(23,  N'Mary', N'Gibson', 'I@gmail.com', 16); 

set identity_insert [Employee] OFF;