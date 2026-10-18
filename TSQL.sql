/*
============================================================
T-SQL Practice
Topics:
1. Variables
2. IF...ELSE Statements
3. WHILE Loop
4. Stored Procedures
5. Stored Procedures with Parameters
6. Stored Procedures with Default Parameters
7. Stored Procedures Using OUTPUT Parameters
8. Stored Procedures Using RETURN Statement
============================================================
*/


-- ============================================================
-- 1. Variables
-- ============================================================

--declare @emp varchar(50)
--declare @firstname varchar(50)
--declare @date date

--select @emp=LastName , @firstname=FirstName, @date=HireDate
--from Employees
--where EmployeeID=1

--print ' the informations about the employee witn id =1 is:'
--print 'first name : '
--print @firstname
--print 'last name :'
--print @emp
--print 'hire date : '
--print @date


-- ============================================================
-- 2. IF...ELSE Statements
-- ============================================================

-- Check whether the price of product number 2 is greater than
-- or equal to 20. Display Expensive Product if true; otherwise,
-- display Cheap Product.

-- declare @price money
-- select @price =UnitPrice
-- from Products
-- where ProductID=2

--if (@price>=20)
--   print 'Expensive Product'
--else 
--   print 'cheap Product'


-- Determine whether the total number of employees is greater
-- than 10. Display Large Staff if true; otherwise, display Small Staff.

--declare @empcount int 

--select @empcount=count(*)
--from Employees

--if @empcount >10
-- print 'large staff'
--else 
--print 'small staff'


-- ============================================================
-- 3. WHILE Loop
-- ============================================================

-- Write a query that repeatedly increases the UnitPrice of all
-- products by 2 as long as the average unit price is less than 40.

--WHILE (SELECT AVG(UnitPrice) FROM Products) < 40
--BEGIN
--    UPDATE Products
--    SET UnitPrice = UnitPrice + 2;
--END;


-- ============================================================
-- 4. Stored Procedures
-- ============================================================

-- Create

--create procedure usp_get_all_employees
--as
--begin
--    select * from Employees
--end

-- Execute

--exec usp_get_all_employees

-- Update

--ALTER PROCEDURE usp_get_all_employees
--as
--begin
--    select * from Employees
--    where Address like '%Houston'
--end 

--exec usp_get_all_employees

-- Drop

--drop procedure usp_get_all_employees


-- ============================================================
-- 5. Stored Procedures with Parameters
-- ============================================================

--create procedure get_employees_in_city @city varchar(30)
--as 
--begin
--    select * from Employees where City like '%'+@city+'%'
--end

--exec get_employees_in_city 'london'


-- Stored procedure with multiple parameters

--create procedure get_emp_in_city @city varchar(30) ,@fname nvarchar(30)
--as 
--begin
--    select *
--    from Employees
--    where City like '%'+@city+'%' 
--    and FirstName=@fname
--end

--exec get_emp_in_city 'london' ,'steven'


-- ============================================================
-- 6. Stored Procedures with Default Parameters
-- ============================================================

--create procedure get_employ_in_city @city varchar(30)='london' 
--as 
--begin
--    select *
--    from Employees
--    where City like '%'+@city+'%' 
--end 

--exec get_employ_in_city 


-- ============================================================
-- 7. Stored Procedures Using OUTPUT Parameters
-- ============================================================

--create procedure usp_count_employees_in_city (@city nvarchar(30),@count int output)
--as 
--begin
--    select  @count=count(*) from Employees
--    where  City like '%'+@city+'%' 
--end

--declare @empcount int 

--exec usp_count_employees_in_city 'london' ,@empcount output

--select @empcount as 'number of employees found'


-- ============================================================
-- 8. Stored Procedures Using RETURN Statement
-- ============================================================

--CREATE OR ALTER PROCEDURE usp_count_employees_in_city
--    @city NVARCHAR(30)
--AS
--BEGIN
--    DECLARE @count INT;

--    SELECT @count = COUNT(*)
--    FROM Employees
--    WHERE City LIKE '%' + @city + '%';

--    RETURN @count;
--END;
--GO

--DECLARE @empcount INT;

--EXEC @empcount = usp_count_employees_in_city 'london';

--SELECT @empcount AS 'number of employees found';
