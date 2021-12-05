USE custodyChain;
SELECT Equipment.EquipDescrip, COUNT(DISTINCT Equipment.EquipmentID) AS [Equipment Out]
FROM Equipment JOIN CoC on Equipment.EquipmentID = Coc.EquipmentID
GROUP BY EquipDescrip
ORDER BY EquipDescrip ASC;

SELECT COUNT(CoC.EquipmentID) AS [Equipment Loaned], Equipment.EquipDescrip AS [Items Lent]
FROM CoC JOIN Equipment ON CoC.EquipmentID = Equipment.EquipmentID
GROUP BY Equipment.EquipDescrip
ORDER BY EquipDescrip ASC;

SELECT MIN(CoC.CheckedOut) AS [Checked Out],
		MAX(Coc.CheckedIn) AS [Checked In]
FROM CoC;

SELECT School.FullName AS [Schools Who Lent]
FROM School JOIN CoC ON School.SchoolID = CoC.SchoolID

SELECT COUNT(CoC.SchoolID) AS [Schools Who Lent], School.FullName AS [Test]
FROM COC JOIN School ON COC.SchoolID = School.SchoolID
JOIN Equipment on Equipment.EquipmentID = CoC.EquipmentID
GROUP BY School.FullName
ORDER BY School.FullName ASC;