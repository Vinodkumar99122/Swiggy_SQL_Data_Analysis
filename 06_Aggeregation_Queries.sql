/* 
06_Aggeregation_Queries.sql

Description:
This SQL script contains multiple aggeregation queries performed on the Swiggy_Data table.
Aggregation queries are used to summarize, analyze, and extract, meaningful insights from data.
The queries include:

1. COUNT - to find number of records, restaurants, or food types.
2. SUM - to calculate total revenue or total ratings.
3. AVG - to determine average price, average rating, or average delivery time.
4. MIN/MAX - toidentify the minimum and maximum ratings, prices, or delivery times.
5. GROUP BY - to group data by city, area, restaurant, or food type.
6. HAVING - to filter aggregated results based on conditions.

These queries are useful for reporting, analytics, and decision-making in business scenarios,
and they demonstrate practical SQL skills asked in interviews.
*/

--1. Total number of restaurants
SELECT COUNT(*) AS Total_Restaurants
FROM Swiggy_Data


--2. Average price of food 
SELECT AVG(TRY_CAST(price AS FLOAT)) AS Avg_price
FROM Swiggy_Data


--3. Mximum and Minimum ratings 
SELECT MAX(Avg_ratings) AS Max_Rating,
	   MIN(Avg_ratings) AS Min_rating
FROM Swiggy_Data;


--4. Total rating per city
SELECT City, SUM(TRY_CAST(TOtal_Ratings AS FLOAT)) AS Total_ratings 
FROM Swiggy_Data
GROUP BY City


--5. Average delivery time per restaurant
SELECT Restaurant, AVG(TRY_CAST(Delivery_time AS float)) AS Avg_delivery_Time
FROM Swiggy_Data
GROUP BY Restaurant;


--6. Number of restaurants by food type
SELECT Food_Type, COUNT(*) AS Num_restaurants
FROM Swiggy_Data
GROUP BY Food_Type


--7. Total revenue per restaurant(price*total-ratings)
SELECT Restaurant, SUM(TRY_CAST(Price AS FLOAT) * TRY_CAST(Total_Ratings AS INT)) AS Total_Revenue
FROM Swiggy_Data
GROUP BY Restaurant;


--8. Highest-rated restaurant in each city
SELECT City, Restaurant, MAX(TRY_CAST(Avg_Ratings AS FLOAT)) AS Max_rating
FROM Swiggy_Data
GROUP BY  City, Restaurant;


--9. Number of restaurants in each area
SELECT Area, COUNT(*) AS Restaurants
FROM Swiggy_Data
GROUP BY Area;


--10. Average delivery time by food type
SELECT Food_Type, AVG(TRY_CAST(Delivery_Time AS FLOAT)) AS Avg_Delivery_Time
FROM Swiggy_Data
GROUP BY Food_Type;


--11.Cities with more than 50 restaurants
SELECT City, COUNT(*) AS Num_Restaurants
FROM Swiggy_Data
GROUP BY City
HAVING COUNT(*) > 50;


--12. Food type with average rating above 4
SELECT Food_Type, AVG(TRY_CAST(Avg_Ratings AS FLOAT)) AS Avg_Rating
FROM Swiggy_Data
GROUP BY Food_Type
HAVING AVG(TRY_CAST(Avg_Ratings AS FLOAT)) > 4;


--13. Total ratings for top 5 restaurants by revenue
SELECT TOP 5 Restaurant, SUM(TRY_CAST(Avg_Ratings AS INT)) AS Total_Ratings
FROM Swiggy_Data
GROUP BY Restaurant
ORDER BY SUM(TRY_CAST(Price AS FLOAT) * TRY_CAST(Total_Ratings AS INT)) DESC; 


--14. Minimum and maximum delivery time by city
SELECT City, MAX(TRY_CAST(Delivery_Time AS FLOAT)) AS Max_Delivery_Time,
			 MIN(TRY_CAST(Delivery_Time AS FLOAT)) AS Min_Delivery_Time
FROM Swiggy_Data
GROUP BY City;


--15. Number of restaurants per rating range
SELECT 
	CASE
		WHEN TRY_CAST(Avg_Ratings AS FLOAT) >= 4.5 THEN '4.5 & above'
		WHEN TRY_CAST(Avg_Ratings AS FLOAT) >= 4 THEN '4 - 4.49'
		ELSE 'Below 4'
		END AS Rating_Range,
		COUNT(*) AS Num_Restaurants
FROM Swiggy_Data
GROUP BY 
	CASE
		WHEN TRY_CAST(Avg_Ratings AS FLOAT) >= 4.5 THEN '4.5 & above'
		WHEN TRY_CAST(Avg_Ratings AS FLOAT) >= 4 THEN '4 - 4.49'
		ELSE 'Below 4'
	END;


--16. Average rating per area
SELECT Area, AVG(TRY_CAST(Avg_Ratings AS FLOAT)) AS Avg_Rating
FROM Swiggy_Data
GROUP BY Area;


--17. Total number of restaurants and average price per city
SELECT City, COUNT(*) AS Num_Restaurants, AVG(TRY_CAST(Price AS FLOAT)) AS Avg_Price
FROM Swiggy_Data
GROUP BY City;


--18. Resturants with more than 1000 total ratings 
SELECT Restaurant, SUM(TRY_CAST(Total_Ratings AS FLOAT)) AS Total_Ratings
FROM Swiggy_Data
GROUP BY Restaurant;
