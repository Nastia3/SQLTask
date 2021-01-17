CREATE DATABASE HotelTaskForAcademy;
GO

CREATE TABLE tblHotel(
  HotelId  INT PRIMARY KEY IDENTITY,
  Name varchar(40),
  FoundationYear int,
  Adress varchar(50),
  IsActive bit
);

CREATE TABLE tblRoom(
  RoomId  INT PRIMARY KEY IDENTITY,
  Number int,
  Price money,
  ComfortLevel int
      CONSTRAINT DF_Room_ComfortLevel DEFAULT 1,
      CONSTRAINT CK_Room_ComfortLevel CHECK (ComfortLevel> 0 AND ComfortLevel <4),
  Capability int,
  IdHotel int FOREIGN KEY REFERENCES tblHotel (HotelId) ON DELETE CASCADE
);

CREATE TABLE tblUser(
  UserId  INT PRIMARY KEY IDENTITY,
  Name varchar(40),
  Email varchar(40)
);


CREATE TABLE tblReservation(
  IdRoom int FOREIGN KEY REFERENCES tblRoom (RoomId) ON DELETE CASCADE,
  IdUser int FOREIGN KEY REFERENCES tblUser (UserId) ON DELETE CASCADE,
  StartDate date,
  EndDate date
);
GO

INSERT INTO tblHotel (Name, FoundationYear, Adress, IsActive)
VALUES ('Edelweiss', 1988, 'Konovaltsa 100', 'True');

INSERT INTO tblHotel (Name, FoundationYear, Adress, IsActive)
VALUES ('GrandHotel', 1978, 'Konovaltsa 33', 'True');

INSERT INTO tblHotel (Name, FoundationYear, Adress, IsActive)
VALUES ('GrandHotelPlus', 2013, 'Konovaltsa 13', 'False');
GO

SELECT * FROM tblHotel;
GO

UPDATE tblHotel
SET FoundationYear = 1937
WHERE HotelId = 1;
GO

DELETE FROM tblHotel 
WHERE HotelId = 3;
GO

INSERT INTO tblUser (Name, Email)
VALUES ('Andrew','Andrew1@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrew','Andrew2@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrew','Andrew3@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewus','Andrewus@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewia','Andrewia@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewik','Andrewik@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andretan','Andretan@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewich','Andrewich@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewuk','Andreuk@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Andrewin','Andrewin@gmail.com');

INSERT INTO tblUser (Name, Email)
VALUES ('Nastia','Nastia@gmail.com');
GO


SELECT * FROM tblUser
WHERE Name LIKE 'A%';
GO

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (101, 30.0 , 2, 2, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (102, 33.0 , 2, 3, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (103, 35.5 , 2, 3, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (104, 45.5 , 2, 3, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (103, 25.5 , 1, 2, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (204, 55.5 , 2, 3, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (301, 35.5 , 2, 3, 1);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (103, 65.5 , 3, 3, 2);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (105, 65.5 , 3, 3, 2);

INSERT INTO tblRoom (Number, Price, ComfortLevel , Capability, IdHotel  )
VALUES (101, 65.5 , 3, 3, 2);
GO

SELECT * FROM tblRoom ORDER BY Price
GO

SELECT * FROM tblRoom 
WHERE tblRoom.IdHotel = (SELECT HotelId FROM tblHotel
WHERE Name  = 'Edelweiss') ORDER BY price
GO

SELECT DISTINCT Name, FoundationYear, Adress FROM tblHotel
JOIN tblRoom ON tblRoom.IdHotel = tblHotel.HotelId
WHERE tblRoom.ComfortLevel = 3
GO

SELECT Name , tblRoom.Number FROM tblHotel
JOIN tblRoom ON tblRoom.IdHotel = tblHotel.HotelId
WHERE tblRoom.ComfortLevel = 1
GO

SELECT Name, (SELECT COUNT(*) FROM tblRoom 
WHERE tblRoom.IdHotel = tblHotel.HotelId ) AS RoomCount 
FROM  tblHotel
GO

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (1, 1, '2021-10-21', '2021-10-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (2, 2, '2021-01-21', '2021-01-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (3, 2, '2021-02-21', '2021-02-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (3, 4, '2021-03-21', '2021-03-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (3, 3, '2021-02-11', '2021-02-15' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (5, 5, '2021-03-09', '2021-03-15' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (6, 5, '2021-02-21', '2021-02-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (5, 6, '2021-02-21', '2021-02-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (9, 9, '2021-02-21', '2021-02-25' );

INSERT INTO tblReservation (IdRoom, IdUser, StartDate, EndDate)
VALUES (10, 8, '2021-02-21', '2021-02-25' );
GO

SELECT Name, tblRoom.Number , tblReservation.StartDate , tblReservation.EndDate FROM tblUser
JOIN tblReservation ON tblReservation.IdUser = UserId
JOIN tblRoom ON tblRoom.RoomId = tblReservation.IdRoom
