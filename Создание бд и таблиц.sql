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
--создание таблиц
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
	VALUES('Леонардо', 'Ди Каприо', 'М', CAST('1974-11-11' AS date)),
		  ('Джордан', 'Пил', 'М', CAST('1979-02-21' AS date)),
		  ('Мэттью', 'Макконахи', 'М', CAST('1969-11-04' AS date)),
		  ('Уинстон', 'Дьюк', 'М', CAST('1986-11-15' AS date)),
		  ('Райан', 'Гослинг', 'М', CAST('1980-11-12' AS date)),
		  ('Брэд', 'Питт', 'М', CAST('1963-12-18' AS date)),
		  ('Лупита', 'Нионго', 'Ж', CAST('1983-03-01' AS date)),
		  ('Гвинет', 'Пэлтроу', 'Ж', CAST('1972-09-27' AS date)),
		  ('Энн', 'Хэтэуэй', 'Ж', CAST('1982-11-12' AS date)),
		  ('Джессика', 'Честейн', 'Ж', CAST('1977-03-24' AS date)),
		  ('Скарлетт', 'Йоханссон', 'Ж', CAST('1984-11-22' AS date)),
		  ('Джозеф', 'Гордон-Левитт', 'М', CAST('1981-02-17' AS date)),
		  ('Зендея', '-', 'Ж', CAST('1996-09-01' AS date)),
		  ('Тимоти', 'Шаламе', 'М', CAST('1995-12-27' AS date)),
		  ('Тим', 'Роббинс', 'М', CAST('1958-10-16' AS date)),
		  ('Морган', 'Фримен', 'М', CAST('1937-06-01' AS date)),
		  ('Бен', 'Аффлек', 'М', CAST('1972-08-15' AS date)),
		  ('Розамунд', 'Пайк', 'Ж', CAST('1979-01-27' AS date)),
		  ('Чарли', 'Ханнэм', 'М', CAST('1980-04-10' AS date)),
		  ('Колин', 'Фаррелл', 'М', CAST('1976-05-31' AS date)),
		  ('Мирей', 'Инос', 'Ж', CAST('1975-09-22' AS date)),
		  ('Пилу', 'Асбек', 'М', CAST('1982-03-02' AS date)),
		  ('Майкл', 'Питт', 'М', CAST('1981-04-10' AS date)),
		  ('Оскар', 'Айзек', 'М', CAST('1979-03-09' AS date)),
		  ('Том', 'Харди', 'М', CAST('1977-09-15' AS date)),
		  ('Кэри', 'Маллиган', 'Ж', CAST('1985-05-28' AS date))
INSERT INTO Genre(Genre)
	VALUES('Научная фантастика'),
		  ('Боевик'),
		  ('Приключения'),
		  ('Ужасы'),
		  ('Драма'),
		  ('Детектив'),
		  ('Триллер'),
		  ('Криминал')
INSERT INTO Director(FirstName, LastName, DateOfBirth)
	VALUES('Дени', 'Вильнев', CAST('1967-10-03' AS date)),
		  ('Кристофер', 'Нолан', CAST('1970-07-30' AS date)),
		  ('Фрэнк', 'Дарабонт', CAST('1959-01-28' AS date)),
		  ('Гай', 'Ричи', CAST('1968-09-10' AS date)),
		  ('Дэвид', 'Финчер', CAST('1962-08-28' AS date)),
		  ('Марк', 'Форстер', CAST('1969-11-27' AS date)),
		  ('Руперт', 'Сандерс', CAST('1971-03-16' AS date)),
		  ('Джордан', 'Пил', CAST('1979-02-21' AS date)),
		  ('Николас', 'Виндинг Рефн', CAST('1970-09-29' AS date))
INSERT INTO Film(Director_ID, NameFilm, ReleaseDate, Duration, Country)
	VALUES(1, 'Дюна', CAST('2021-09-03' AS date), CAST('02:35:00' AS time), 'США, Канада, Венгрия'),
		  (3, 'Побег из Шоушенка', CAST('1994-09-10' AS date), CAST('02:22:00' AS time), 'США'),
		  (4, 'Джентельмены', CAST('2019-12-03' AS date), CAST('01:53:00' AS time), 'Великобритания, США'),
		  (2, 'Интерстеллар', CAST('2014-10-26' AS date), CAST('02:49:00' AS time), 'Великобритания, Канада, США'),
		  (5, 'Семь', CAST('1995-09-25' AS date), CAST('02:07:00' AS time), 'США'),
		  (2, 'Начало', CAST('2010-07-08' AS date), CAST('02:28:00' AS time), 'США, Великобритания'),
		  (6, 'Война миров Z', CAST('2013-06-02' AS date), CAST('01:56:00' AS time), 'США'),
		  (7, 'Призрак в доспехах', CAST('2017-03-16' AS date), CAST('01:46:00' AS time), 'США, Индия, Гонконг, Китай, Канада'),
		  (5, 'Исчезнувшая', CAST('2019-09-26' AS date), CAST('02:29:00' AS time), 'США'),
		  (8, 'Мы', CAST('2019-03-08' AS date), CAST('01:56:00' AS time), 'США, Китай, Япония'),
		  (9, 'Драйв', CAST('2011-05-20' AS date), CAST('01:40:00' AS time), 'США')
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
	VALUES(14, 1, 'Пол Атрейдес'),
		  (13, 1, 'Чани'),
		  (24, 1, 'Лето Атрейдес'),
		  (16, 2, 'Эллис Бойд "Рэд" Рэддинг'),
		  (15, 2, 'Энди Дюфрейн'),
		  (19, 3, 'Реймонд Смит'),
		  (3, 3, 'Мики Пирсон'),
		  (20, 3, 'Тренер'),
		  (3, 4, 'Купер'),
		  (9, 4, 'Амелия Бренд'),
		  (10, 4, 'Мёрф'),
		  (14, 4, 'Том'),
		  (6, 5, 'Дэвид Миллс'),
		  (16, 5, 'Уильям Сомерсет'),
		  (8, 5, 'Трэйси Миллс'),
		  (1, 6, 'Доминик Кобб'),
		  (12, 6, 'Артур'),
		  (25, 6, 'Имс'),
		  (6, 7, 'Джерри Лейн'),
		  (21, 7, 'Карэн Лейн'),
		  (11, 8, 'Мотоко Кусанаги'),
		  (22, 8, 'Бато'),
		  (23, 8, 'Кудзэ'),
		  (17, 9, 'Николас Данн'),
		  (18, 9, 'Эми Эллиотт-Данн'),
		  (4, 10, 'Гэбриел "Гэйб" Уилсон, Абрахам'),
		  (7, 10, 'Аделаида Уилсон, Рэд'),
		  (2, 10, 'Умирающий кролик, голос в доме забав'),
		  (5, 11, 'Водитель'),
		  (26, 11, 'Айрин')
INSERT INTO Reviewer(LoginR, PasswordR)
	VALUES(NULL, NULL)
INSERT INTO Rating(Film_ID, Reviewer_ID, Score) --оценка по 5-бальной шкале
	VALUES(NULL, NULL, NULL)