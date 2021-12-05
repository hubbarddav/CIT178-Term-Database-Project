CREATE DATABASE custodyChain;
GO
USE custodyChain;
CREATE TABLE District(
	DistrictID int NOT NULL,
	Name varchar(255), 
	PRIMARY KEY(DistrictID)
);
GO
CREATE TABLE School(
	SchoolID int NOT NULL,
	DistrictID int NOT NULL,
	FullName varchar(255),
	PRIMARY KEY(SchoolID)
);
GO
CREATE TABLE Employee(
	EmployeeID int NOT NULL,
	SchoolID int NOT NULL,
	FirstName varchar(255),
	LastName varchar(255),
	PRIMARY KEY(EmployeeID)
);
GO
CREATE TABLE Student(
	StudentID int NOT NULL,
	EmployeeID int NOT NULL,
	FirstName varchar(255),
	LastName varchar(255),
	PRIMARY KEY(StudentID)
);
GO
CREATE TABLE Equipment(
	EquipmentID int NOT NULL,
	EquipDescrip varchar(255),
	Condition varchar(2),
	PRIMARY KEY(EquipmentID)
);
GO
CREATE TABLE CoC(
	CcID int NOT NULL,
	SchoolID int NOT NULL,
	EmployeeID int NOT NULL,
	StudentID int NOT NULL,
	EquipmentID int NOT NULL,
	CheckedOut date,
	CheckedIN date, 
	Overdue varchar(2),
	PRIMARY KEY(CcID)
);
GO

	