SELECT TOP (1000) [id]
      ,[department_Id]
      ,[chief_id]
      ,[name]
      ,[Ssalary]
  FROM [testDB].[dbo].[EMPLOYEE]

SELECT * 
FROM EMPLOYEE 
WHERE Ssalary = (SELECT MAX(Ssalary) FROM EMPLOYEE);



WITH ManagerChain AS (
  SELECT id, chief_id, 1 AS Level
  FROM EMPLOYEE
  WHERE chief_id IS NULL
  UNION ALL
  SELECT e.id, e.chief_id, mc.Level + 1 AS Level
  FROM EMPLOYEE e
  JOIN ManagerChain mc ON e.chief_id = mc.id
),
MaxLevel AS (
  SELECT MAX(Level) AS MaxChainLength
  FROM ManagerChain
)
SELECT MaxChainLength
FROM MaxLevel;



SELECT TOP 1 d.name AS department_name, SUM(e.Ssalary) AS total_salary
FROM DEPARTMENT d
JOIN EMPLOYEE e ON d.id = e.department_Id
GROUP BY d.name
ORDER BY total_salary DESC;


SELECT *
FROM EMPLOYEE
WHERE name LIKE N'Ð%í';
