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