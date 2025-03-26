
USE video_games;

-- 1. Find the most expensive games by genre and player

SELECT TOP(10)
	g.genres, pl.Nickname,SUM(CAST(p.price AS DECIMAL(10,2))) AS Total_Price
FROM
	[dbo].[games] g
JOIN
	price p ON
	g.GameID = p.GameID
JOIN
	purchased_games pu ON
	g.GameID = pu.GameID
JOIN
	players pl ON
	pu.PlayerID = pl.PlayerID
GROUP BY
	g.Genres,pl.Nickname
ORDER BY
	SUM(CAST(p.price AS DECIMAL(10,2))) DESC

------------------------------------------

-- 2.Find games purchased and the average price between 2020 and 2024

SELECT TOP(10)
	g.Title, AVG(CAST(p.price AS DECIMAL(10,2))) AS Average_Price
FROM
	[dbo].[games] g
JOIN
	price p ON
	g.GameID = p.GameID
WHERE
	g.Release_Date >= '2020-01-01' AND g.Release_Date < '2025-01-01'
GROUP BY
	g.Title
ORDER BY
	Average_price DESC

--------------------------------------------

-- 3.Find all players who have not purchased any games and living in Canada or US

SELECT
	pl.Nickname,c.country, pl.PlayerID
FROM
	players pl
LEFT JOIN
	purchased_games pu ON
	pu.PlayerID = pl.PlayerID
JOIN
	country c ON
	pl.CountryID = c.CountryID
WHERE
	c.Country IN ('Canada' ,'United States') AND
	pu.PlayerID IS NULL