UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Dune.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 1

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Shoushenk.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 2

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Gentlemen.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 3

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Interstellar.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 4

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Seven.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 5

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Inception.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 6

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\warZ.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 7

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\GhostInTheShell.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 8

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\GoneGirl.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 9

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\US.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 10

UPDATE Film
SET Posters =
	(SELECT * FROM OPENROWSET(BULK N'C:\Users\kudemeow\Desktop\КУРСАЧ\Постеры\Drive.jpg', SINGLE_BLOB) AS Posters)
WHERE Film_ID = 11