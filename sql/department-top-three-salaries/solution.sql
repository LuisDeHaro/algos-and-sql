/* Write your T-SQL query statement below */

;WITH cteMax 
as(

    SELECT
        d.Name Department
        ,e.Name Employee
        ,e.Salary Salary
        ,dense_rank() OVER(partition BY d.Name ORDER BY e.Salary DESC) rn
    FROM Employee e
        INNER JOIN Department d on e.DepartmentId = d.Id
)
SELECT 
   Department,
   Employee,
   Salary
  
FROM cteMax
WHERE rn <= 3;
