USE master
IF EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME = 'Cinema')
	DROP DATABASE Cinema
GO
CREATE DATABASE Cinema ON PRIMARY(NAME = CinemaData,
									 FILENAME = 'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\CinemaData.mdf',
									 SIZE = 3 MB, MAXSIZE = 100, FILEGROWTH = 10)
LOG ON
	(NAME = CinemaLog, FILENAME = 'D:\SQL\MSSQL14.SQLEXPRESS\MSSQL\DATA\CinemaLog.ldf',
	 SIZE = 3 MB, MAXSIZE = 100, FILEGROWTH = 10)
GO
USE Cinema
GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Actor' AND TYPE = 'U')
	DROP TABLE Actor
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Director' AND TYPE = 'U')
	DROP TABLE Director
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Casting' AND TYPE = 'U')
	DROP TABLE Casting
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Film' AND TYPE = 'U')
	DROP TABLE Film
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'FilmGenre' AND TYPE = 'U')
	DROP TABLE FilmGenre
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Reviewer' AND TYPE = 'U')
	DROP TABLE Reviewer
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Rating' AND TYPE = 'U')
	DROP TABLE Rating
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Genre' AND TYPE = 'U')
	DROP TABLE Genre
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Administrator' AND TYPE = 'U')
	DROP TABLE Administrator
GO
--�������� ������
CREATE TABLE Actor(Actor_ID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
				   LastName varchar(50) NOT NULL,
				   FirstName varchar(50) NOT NULL,
				   Sex varchar(1) NOT NULL,
				   DateOfBirth date NOT NULL)
CREATE TABLE Genre(Genre_ID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
				   Genre varchar(50) NOT NULL)
CREATE TABLE Director(Director_ID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
					  LastName varchar(50) NOT NULL,
					  FirstName varchar(50) NOT NULL,
					  DateOfBirth date NOT NULL)
CREATE TABLE Film(Film_ID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
				  Director_ID int NOT NULL,
				  NameFilm varchar(150) NOT NULL,
				  ReleaseDate date NOT NULL,
				  Duration time NOT NULL,
				  Country varchar(50) NOT NULL,
				  CONSTRAINT fk_dirID FOREIGN KEY (Director_ID) REFERENCES Director(Director_ID))
CREATE TABLE FilmGenre(Film_ID int NOT NULL,
					   Genre_ID int NOT NULL,
					   CONSTRAINT fk_genreID FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID),
					   CONSTRAINT fk_filmID FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID))
CREATE TABLE Casting(ID_Casting int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
					  Actor_ID int NOT NULL,
					  Film_ID int NOT NULL,
					  RoleActor varchar(50) NOT NULL,
					  CONSTRAINT fk_actorID FOREIGN KEY (Actor_ID) REFERENCES Actor (Actor_ID),
					  CONSTRAINT fk_CasFilm FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID))
CREATE TABLE Reviewer(Reviewer_ID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
					  LoginR varchar(100),
					  PasswordR varchar(10))
CREATE TABLE Rating(NumberRating int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
				    Film_ID int,
					Reviewer_ID int,
					Score int,
					CONSTRAINT fk_RatFilm FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID),
					CONSTRAINT fk_RatRew FOREIGN KEY (Reviewer_ID) REFERENCES Reviewer(Reviewer_ID))
CREATE TABLE Administrator(ID_Administrator int PRIMARY KEY NOT NULL,
						   LoginA varchar(100),
						   PasswordA varchar(10))
INSERT INTO Actor(FirstName, LastName, Sex, DateOfBirth)
	VALUES('��������', '�� ������', '�', CAST('1974-11-11' AS date)),
		  ('�������', '���', '�', CAST('1979-02-21' AS date)),
		  ('������', '���������', '�', CAST('1969-11-04' AS date)),
		  ('�������', '����', '�', CAST('1986-11-15' AS date)),
		  ('�����', '�������', '�', CAST('1980-11-12' AS date)),
		  ('����', '����', '�', CAST('1963-12-18' AS date)),
		  ('������', '������', '�', CAST('1983-03-01' AS date)),
		  ('������', '�������', '�', CAST('1972-09-27' AS date)),
		  ('���', '�������', '�', CAST('1982-11-12' AS date)),
		  ('��������', '�������', '�', CAST('1977-03-24' AS date)),
		  ('��������', '���������', '�', CAST('1984-11-22' AS date)),
		  ('������', '������-������', '�', CAST('1981-02-17' AS date)),
		  ('������', '-', '�', CAST('1996-09-01' AS date)),
		  ('������', '������', '�', CAST('1995-12-27' AS date)),
		  ('���', '�������', '�', CAST('1958-10-16' AS date)),
		  ('������', '������', '�', CAST('1937-06-01' AS date)),
		  ('���', '������', '�', CAST('1972-08-15' AS date)),
		  ('��������', '����', '�', CAST('1979-01-27' AS date)),
		  ('�����', '������', '�', CAST('1980-04-10' AS date)),
		  ('�����', '�������', '�', CAST('1976-05-31' AS date)),
		  ('�����', '����', '�', CAST('1975-09-22' AS date)),
		  ('����', '�����', '�', CAST('1982-03-02' AS date)),
		  ('�����', '����', '�', CAST('1981-04-10' AS date)),
		  ('�����', '�����', '�', CAST('1979-03-09' AS date)),
		  ('���', '�����', '�', CAST('1977-09-15' AS date)),
		  ('����', '��������', '�', CAST('1985-05-28' AS date))
INSERT INTO Genre(Genre)
	VALUES('������� ����������'),
		  ('������'),
		  ('�����������'),
		  ('�����'),
		  ('�����'),
		  ('��������'),
		  ('�������'),
		  ('��������')
INSERT INTO Director(FirstName, LastName, DateOfBirth)
	VALUES('����', '�������', CAST('1967-10-03' AS date)),
		  ('���������', '�����', CAST('1970-07-30' AS date)),
		  ('�����', '��������', CAST('1959-01-28' AS date)),
		  ('���', '����', CAST('1968-09-10' AS date)),
		  ('�����', '������', CAST('1962-08-28' AS date)),
		  ('����', '�������', CAST('1969-11-27' AS date)),
		  ('������', '�������', CAST('1971-03-16' AS date)),
		  ('�������', '���', CAST('1979-02-21' AS date)),
		  ('�������', '������� ����', CAST('1970-09-29' AS date))
INSERT INTO Film(Director_ID, NameFilm, ReleaseDate, Duration, Country)
	VALUES(1, '����', CAST('2021-09-03' AS date), CAST('02:35:00' AS time), '���, ������, �������'),
		  (3, '����� �� ��������', CAST('1994-09-10' AS date), CAST('02:22:00' AS time), '���'),
		  (4, '������������', CAST('2019-12-03' AS date), CAST('01:53:00' AS time), '��������������, ���'),
		  (2, '������������', CAST('2014-10-26' AS date), CAST('02:49:00' AS time), '��������������, ������, ���'),
		  (5, '����', CAST('1995-09-25' AS date), CAST('02:07:00' AS time), '���'),
		  (2, '������', CAST('2010-07-08' AS date), CAST('02:28:00' AS time), '���, ��������������'),
		  (6, '����� ����� Z', CAST('2013-06-02' AS date), CAST('01:56:00' AS time), '���'),
		  (7, '������� � ��������', CAST('2017-03-16' AS date), CAST('01:46:00' AS time), '���, �����, �������, �����, ������'),
		  (5, '�����������', CAST('2019-09-26' AS date), CAST('02:29:00' AS time), '���'),
		  (8, '��', CAST('2019-03-08' AS date), CAST('01:56:00' AS time), '���, �����, ������'),
		  (9, '�����', CAST('2011-05-20' AS date), CAST('01:40:00' AS time), '���')
INSERT INTO FilmGenre(Film_ID, Genre_ID)
	VALUES(1, 1),
		  (1, 2),
		  (1, 3),
		  (2, 5),
		  (2, 6),
		  (3, 2),
		  (3, 8),
		  (4, 1),
		  (4, 3),
		  (4, 5),
		  (4, 6),
		  (5, 5),
		  (5, 6),
		  (5, 8),
		  (6, 2),
		  (6, 1),
		  (6, 7),
		  (6, 3),
		  (6, 5),
		  (7, 4),
		  (7, 2),
		  (7, 5),
		  (7, 1),
		  (7, 3),
		  (7, 7),
		  (8, 2),
		  (8, 1),
		  (8, 5),
		  (8, 3),
		  (8, 7),
		  (9, 7),
		  (9, 6),
		  (9, 5),
		  (10, 4),
		  (10, 7),
		  (10, 6),
		  (11, 2),
		  (11, 5),
		  (11, 8),
		  (11, 7)
INSERT INTO Casting(Actor_ID, Film_ID, RoleActor)
	VALUES(14, 1, '��� ��������'),
		  (13, 1, '����'),
		  (24, 1, '���� ��������'),
		  (16, 2, '����� ���� "���" �������'),
		  (15, 2, '���� �������'),
		  (19, 3, '������� ����'),
		  (3, 3, '���� ������'),
		  (20, 3, '������'),
		  (3, 4, '�����'),
		  (9, 4, '������ �����'),
		  (10, 4, '̸��'),
		  (14, 4, '���'),
		  (6, 5, '����� �����'),
		  (16, 5, '������ ��������'),
		  (8, 5, '������ �����'),
		  (1, 6, '������� ����'),
		  (12, 6, '�����'),
		  (25, 6, '���'),
		  (6, 7, '������ ����'),
		  (21, 7, '����� ����'),
		  (11, 8, '������ ��������'),
		  (22, 8, '����'),
		  (23, 8, '�����'),
		  (17, 9, '������� ����'),
		  (18, 9, '��� �������-����'),
		  (4, 10, '������� "����" ������, �������'),
		  (7, 10, '�������� ������, ���'),
		  (2, 10, '��������� ������, ����� � ���� �����'),
		  (5, 11, '��������'),
		  (26, 11, '�����')
INSERT INTO Reviewer(LoginR, PasswordR)
	VALUES(NULL, NULL)
INSERT INTO Rating(Film_ID, Reviewer_ID, Score) --������ �� 5-������� �����
	VALUES(NULL, NULL, NULL)