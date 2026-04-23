/*-----------------------------------------------------------------------
	Script Name  : 04_Basic_Queries.sql
	Purpose      : Demonstrates basic SQL operations on Swiggy_Data 
	Description  : Contains simple SELECT, WHERE, ORDER BY queirs for 
				   retrieving and filtering restaurant data
	Created On   : 25-Aug-2025
	Created By   : Vinod Kumar Mandla
-----------------------------------------------------------------------*/

--1 View all rows and columns
SELECT *
FROM Swiggy_Data;

--2 View only specific columns
SELECT ID,City,Restaurant,Avg_Ratings
FROM swiggy_Data;

--3 Filter by city
SELECT *
FROM Swiggy_Data
WHERE City = 'Hyderabad'

SELECT * 
FROM Swiggy_Data
WHERE City = 'Bangalore'

SELECT * 
FROM Swiggy_Data
WHERE City = 'Mumbai'


--4 Restaurants with price less than Rs300
SELECT Restaurant,Price
FROM Swiggy_Data
WHERE CAST(CAST(PRICE As FLOAT) As INT)<300;


--5 Restaurants with average ratings less than 4
SELECT Restaurant,Avg_Ratings
FROM Swiggy_Data
WHERE CAST(Avg_Ratings As FLOAT)<4;


--6 Sort restaurants by price (low to high)
SELECT Restaurant,Price
FROM Swiggy_Data
ORDER BY CAST(CAST(Price As FLOAT) As INT)ASC;


--7 Sort restaurant by ratingds(high to low)
SELECT Restaurant,Avg_Ratings
FROM Swiggy_Data
ORDER BY CAST(Avg_Ratings As FLOAT)DESC;


--8 Get top 10 most expensive Restaurants
SELECT TOP 10 Restaurant,Price
FROM Swiggy_Data
ORDER BY CAST(CAST(Price As FLOAT) As INT)DESC;


--9 Find all vegetarian restaurants
SELECT *
FROM Swiggy_Data
WHERE Food_type LIKE '%veg%';

--- Find all South indian restaurants
SELECT * 
FROM Swiggy_Data
WHERE Food_type LIKE '%South indian%';

--Find all American restaurants
SELECT * 
FROM Swiggy_Data
WHERE Food_type LIKE '%American%';


--Find all chinese restaurants
SELECT * 
FROM Swiggy_Data
WHERE Food_type LIKE '%Chinese%';


--10 Find All Restaurants In a specific area
SELECT *
FROM Swiggy_Data
WHERE Area = 'Banjara hills';


