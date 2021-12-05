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

/* Final Project Triggers 

 -- create archive table by copying customer table without any rows
 USE custodyChain;
 GO
 SELECT * INTO EmployeeTransaction
 FROM Employee
 WHERE 1=0;

-- update CustomerTransaction table and add activity column for status
 ALTER TABLE EmployeeTransaction
 ADD Activity varchar(50);
 GO

  -- create insert trigger
 CREATE TRIGGER EmployeeTransaction_INSERT ON Employee
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @SchoolID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)

    SELECT @EmployeeID =INSERTED.EmployeeID,@SchoolID = INSERTED.SchoolID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

    INSERT INTO EmployeeTransaction VALUES(@EmployeeID,@SchoolID,@FirstName, @LastName, 'Inserted' )
END
GO
-- add row into customer to test insert trigger
INSERT INTO Employee VALUES(118,30,'Korbin','Dallas');
GO
-- view data in customer archive
SELECT * FROM EmployeeTransaction;
GO 
 -- create delete trigger
 CREATE TRIGGER EmployeeTransaction_Delete ON Employee
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @SchoolID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)

    SELECT @EmployeeID =DELETED.EmployeeID,@SchoolID = DELETED.SchoolID ,@FirstName = DELETED.FirstName, @LastName = DELETED.LastName
	FROM DELETED
	

    INSERT INTO EmployeeTransaction VALUES(@EmployeeID,@SchoolID ,@FirstName, @LastName,'Deleted' )
END
GO
-- delete row from customer to test delete trigger
DELETE FROM Employee WHERE EmployeeID = 118;
GO
-- view data in customer archive
SELECT * FROM EmployeeTransaction;
GO
 -- create update trigger
 CREATE TRIGGER EmployeeTransaction_Update ON Employee
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @EmployeeID int
	DECLARE @SchoolID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)

    SELECT @EmployeeID =INSERTED.EmployeeID,@SchoolID =INSERTED.SchoolID,@FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName
	FROM INSERTED

	-- Since all the data is being written to the archive table, there is no need to identify what was changed
    INSERT INTO EmployeeTransaction VALUES(@EmployeeID,@SchoolID,@FirstName, @LastName,'Updated' )
END
GO
-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO Employee VALUES(118,30,'John','Wayne');
GO
UPDATE Employee 
SET FirstName = 'Roger'
WHERE EmployeeID = 118;
GO
-- view data in customer archive
SELECT * FROM EmployeeTransaction;*/