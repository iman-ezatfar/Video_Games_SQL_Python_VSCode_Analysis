-- Creating Database
CREATE DATABASE Video_Games;

--Creating Tables below :
-- Games, Purchase_Games, Players, Country, & Price
USE Video_Games;

Create Table Games
(
    GameID INT PRIMARY KEY,
    Title VARCHAR(255),
    Developers VARCHAR(255),
    Genre VARCHAR(255),
    Release_Date DATE,
    Platform VARCHAR(255)
);


Create Table Players
(
    PlayerID INT PRIMARY KEY,
    NickName VARCHAR(255),
    Country VARCHAR(255),
);

Create Table Purchased_Games
(
    PlayerID INT,
    GameID INT,
);

Create Table Country
(
    CountryID VARCHAR(255) PRIMARY KEY,
    Country VARCHAR(255)
);

Create Table Price
(
    GameID INT,
    Price DECIMAL(10,2)
);


SELECT * from Games;