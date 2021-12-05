USE custodyChain;
GO
CREATE INDEX idx_DistrictID ON School(DistrictID);
GO
CREATE INDEX idx_SchoolID ON Employee(SchoolID);
GO
CREATE INDEX idx_EmployeeID ON Student(EmployeeID);
GO
CREATE INDEX idx_SchoolIDc ON CoC(SchoolID);
GO 
CREATE INDEX idx_EmployeeIDc ON CoC(EmployeeID);
GO 
CREATE INDEX idx_StudentIDc ON CoC(StudentID);
GO 
CREATE INDEX idx_EquipmnetIDc ON CoC(EquipmentID);
GO 
