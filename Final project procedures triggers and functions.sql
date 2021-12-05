/* Final Project Procedures 

--Retrieves and displays data
USE custodyChain;
GO
CREATE PROC spEmployee
AS
SELECT * from Employee
ORDER BY LastName;
GO

EXEC spEmployee

-- Takes an input parameter
USE custodyChain;
GO
CREATE PROC spGetEmployee
		@EmployeeID int
AS
BEGIN
		SELECT * FROM Employee
		WHERE EmployeeID = @EmployeeID
END
GO

EXEC spGetEmployee 101

-- Takes one input parameter and returns three output parameters
USE custodyChain;
GO
CREATE PROC spEmployeeSchool
		@EmployeeID int,
		@SchoolID int OUTPUT,
		@FirstName nvarchar(30) OUTPUT,
		@LastName nvarchar(30) OUTPUT
AS
SELECT @SchoolID = SchoolID, @FirstName = FirstName,@LastName = LastName 
FROM Employee
WHERE EmployeeID = @EmployeeID
GO
--Run the procedure
DECLARE @SchoolID int;
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(30);
EXEC spEmployeeSchool 101, @SchoolID OUTPUT, @FirstName OUTPUT, @LastName OUTPUT;
SELECT @SchoolID AS 'School ID', @FirstName AS 'First Name', @LastName AS 'Last Name'

--Stored Procedure that has a return value
USE custodyChain;
GO
CREATE PROC spEmployeeCount
AS
DECLARE @EmployeeCount int;
SELECT @EmployeeCount = COUNT(*)
FROM Employee
RETURN @EmployeeCount
GO

DECLARE @EmployeeCount int;
EXEC @EmployeeCount = spEmployeeCount;
PRINT 'There are ' + CONVERT(varchar, @EmployeeCount) + ' Employees in your database';
GO */

/* Final Project User Defined Functions

--Database modification to assist with Function

USE custodyChain;
INSERT INTO Equipment 
VALUES (10051, 'Tablet', 'C');

--creates the function
USE custodyChain;
GO
CREATE FUNCTION fnGetEquipment
	(@EquipmentName nvarchar(50) = '%')
	RETURNS int
BEGIN
	RETURN (SELECT EquipmentID FROM Equipment WHERE EquipDescrip Like @EquipmentName);
END;

--Uses the function

GO
SELECT EquipmentID, EquipDescrip FROM Equipment
WHERE EquipmentID = dbo.fnGetEquipment('Tab%');

--Second Function

Use custodyChain;
GO
CREATE FUNCTION fnEquipment
	(@EquipmentName nvarchar(50) = '%')
	RETURNS table
RETURN
		(Select * FROM Equipment WHERE EquipDescrip Like @EquipmentName);
GO
SELECT * FROM dbo.fnEquipment('%Chrome%'); */

/* Final Project Triggers */


