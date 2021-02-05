
/* Write your T-SQL query statement below */
;WITH cteResult
AS(

	SELECT
	    t.Request_At Day,

	   	SUM(  
	        CASE
	            WHEN t.Status = 'completed' THEN 1
	            ELSE 0
	        END
	    
	    ) completed_trips,
	    SUM(  
	        CASE
	            WHEN t.Status != 'completed' THEN 1
	            ELSE 0
	        END
	    
	    ) canceled_trips,

	    count( 1 ) total_trips
	FROM Trips t
	    INNER JOIN Users client ON t.Client_Id = client.Users_Id
	    INNER JOIN Users driver ON t.Driver_Id = driver.Users_Id
	WHERE client.Banned = 'No' 
		AND driver.Banned = 'No'
	    AND( t.Request_at >= '2013-10-01'
	        AND t.Request_at < DATEADD( DAY, 1, '2013-10-03' ) )
	GROUP BY t.Request_At

)
SELECT
	Day, 
	ROUND(  
	  cast( canceled_trips as float ) / cast( total_trips as float )  ,2
	) [Cancellation Rate]
FROM cteResult
ORDER BY Day:
