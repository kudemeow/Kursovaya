UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Dune.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 1

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Shoushenk.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 2

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Gentlemen.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 3

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Interstellar.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 4

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Seven.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 5

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Inception.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 6

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\warZ.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 7

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\GhostInTheShell.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 8

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\GoneGirl.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 9

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\US.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 10

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\������\�������\Drive.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 11