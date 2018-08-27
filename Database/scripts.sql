
CREATE DATABASE [UserDB]
GO


IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
DROP TABLE dbo.Users
GO
CREATE TABLE dbo.Users
(
	UserId INT NOT NULL Primary Key IDENTITY(1,1), 
	userName [NVARCHAR](50) NOT NULL,
	userFirstName [NVARCHAR](50) NOT NULL,
	userLastName [NVARCHAR](50) NOT NULL,
);
GO

--IF OBJECT_ID('dbo.Roles', 'U') IS NOT NULL
--DROP TABLE dbo.Roles
--GO
CREATE TABLE dbo.Roles
(
	RoleId INT NOT NULL Primary Key IDENTITY(1,1),	
	RoleName [nvarchar](11)
);
GO

CREATE TABLE dbo.UserRoles
(
	UserId int FOREIGN KEY REFERENCES Users(UserId),
	RoleId int FOREIGN KEY REFERENCES Roles(RoleId),
);

--IF OBJECT_ID('dbo.Permission', 'U') IS NOT NULL
--DROP TABLE dbo.Permission
--GO
CREATE TABLE dbo.Permission
(
	PermissionId INT NOT NULL Primary Key IDENTITY(1,1),
	PermissionName [nvarchar](20),	
);
GO


CREATE TABLE dbo.RolePermissions
(
	RoleId INT NOT NULL FOREIGN KEY REFERENCES Roles(RoleId),
	PermissionId INT NOT NULL FOREIGN KEY REFERENCES Permission(PermissionId),
	IsActive BIT NOT NULL
);



INSERT INTO dbo.Users (userName, userFirstName, userLastName)
VALUES ('Hannibal', 'John', 'Smith'),
	('B.A.', 'Bosco', 'Baracus'),
	('Maverick', 'Tom', 'Cruise'),
	('Iceman', 'Val', 'Kilmer'),
	('Ripley', 'Sigourney', 'Weaver'),
	('Hudson', 'Bill', 'Paxton'),
	('Snake', 'Snake', 'Pliskin'),
	('The Duke', 'Isaaic', 'Hayes'),
	('MacReady', 'Kurt', 'Russell'),
	('Childs', 'Keith', 'David');
GO

INSERT INTO dbo.Roles (RoleName)
VALUES ( 'SuperAdmin'), ('Admin'), ('User'), ('Guest');

INSERT INTO dbo.UserRoles 
VALUES ( 1, 1),
( 1, 2),
( 1, 3),
( 1, 1),
( 2, 2),
( 2, 3),
( 3, 3),
( 3, 3),
( 4, 3),
( 5, 3),
( 6, 3),
( 7, 3),
( 8, 4),
( 9, 4),
( 10, 4);

INSERT INTO dbo.Permission (PermissionName)
Values ('ViewUsers'),('UpdateUsers'),('DeleteUsers'),('ViewAdminUsers'),('UpdateAdminUsers'),('DeleteAdminUsers'),('ChangePerms');

INSERT INTO dbo.RolePermissions
VALUES (1, 1, 1),(1, 2, 1),(1, 3, 1),(1, 4, 1),(1, 5, 1),(1, 6, 1),(1, 7, 1),
(2, 1, 1),(2, 2, 1),(2, 3, 1),(2, 4, 0),(2, 5, 0),(2, 6, 0),(2, 7, 0),
(3, 1, 0),(3, 2, 0),(3, 3, 0),(3, 4, 0),(3, 5, 0),(3, 6, 0),(3, 7, 0),
(4, 1, 0),(4, 2, 0),(4, 3, 0),(4, 4, 0),(4, 5, 0),(4, 6, 0),(4, 7, 0);



--show all users, there roles and their permissions
SELECT distinct userName, RoleName,
CASE
    WHEN IsActive = 1 THEN PermissionName 
    ELSE null
END as PermissionName

FROM dbo.Users
	LEFT JOIN dbo.UserRoles
		ON dbo.UserRoles.UserId = dbo.Users.UserId
	LEFT JOIN dbo.Roles 
		ON dbo.Roles.RoleId = dbo.UserRoles.RoleId
	LEFT JOIN dbo.RolePermissions
		ON dbo.RolePermissions.RoleId = dbo.Roles.RoleId
	LEFT JOIN dbo.Permission
		ON dbo.Permission.PermissionId = dbo.RolePermissions.PermissionId
ORDER BY userName, RoleName, PermissionName DESC;


--show each user and number of roles has
SELECT userName, COUNT(UserRoles.UserId) AS RoleCount
FROM dbo.Users
	LEFT JOIN UserRoles
		ON UserRoles.UserId = Users.UserId
GROUP by dbo.Users.userName
ORDER by RoleCount DESC;




--show each role and number of permission
SELECT RoleName, 
		COUNT(CASE WHEN RolePermissions.IsActive = 0 then 1 ELSE NULL END) as "permissionCount"
FROM dbo.Roles
	LEFT JOIN RolePermissions
		ON RolePermissions.RoleId = Roles.RoleId
GROUP BY dbo.Roles.RoleName, RolePermissions.IsActive
ORDER BY permissionCount DESC;
 
--change all permission to given role to oppisite
SELECT RoleId, IsActive
From RolePermissions
WHERE RoleId = 4;

UPDATE RolePermissions
SET IsActive = IsActive ^ 1
WHERE RoleId = 4;
