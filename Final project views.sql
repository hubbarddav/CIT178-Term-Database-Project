/* FINAL Project Views 

--Limited Update Views:

View #1

USE custodyChain;
GO
CREATE VIEW I_TeacherInSchool
AS
SELECT FirstName, LastName, FullName
FROM Employee
JOIN School ON Employee.SchoolID = School.SchoolID
WITH CHECK OPTION;
GO

SELECT * FROM I_TeacherInSchool 

View #2

USE custodyChain;
GO
CREATE VIEW II_StudentToTeacher
AS
SELECT Student.FirstName AS [Student First], Student.LastName AS [Student Last], Employee.FirstName AS [Teacher First], Employee.LastName AS [Teacher Last]
FROM Student 
JOIN Employee ON Student.EmployeeID = Employee.EmployeeID
WITH CHECK OPTION;
GO 

SELECT * FROM II_StudentToTeacher 

View #3

USE custodyChain;
GO
CREATE VIEW III_ItemWithDateOut
AS
SELECT Equipment.EquipDescrip, CheckedOut
FROM CoC
JOIN Equipment ON COC.EquipmentID = Equipment.EquipmentID
WITH CHECK OPTION;
GO

SELECT * FROM III_ItemWithDateOut 

--Updateable Views:

View #4

USE custodyChain;
GO
CREATE VIEW IV_ItemWithDateOutModify
AS
SELECT Equipment.EquipDescrip, CheckedOut
FROM CoC
JOIN Equipment ON COC.EquipmentID = Equipment.EquipmentID
GO

Modify Checked Out Date with View

USE custodyChain;
GO
UPDATE IV_ItemWithDateOutModify
SET CheckedOut=GETDATE()
WHERE EquipDescrip = 'Scientific Calculator';

SELECT * FROM IV_ItemWithDateOutModify  */
