CREATE VIEW [dbo].[V_Student]
	AS SELECT	S1.[Id],
				S1.[FirstName],
				S1.[LastName],
				S1.[YearResult],
				S1.[SectionId]
	FROM [Student] S1
	WHERE S1.[Active] = 1
