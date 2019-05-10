--Lesson 4
USE Chinook
GO

--Question 1
SELECT
	 T.Name AS TrackName
	 ,MT.Name AS MediaName
	 ,CASE 
		 WHEN MT.Name LIKE '%Video%' THEN 'Video'
		 --WHEN MT.Name IN('Video') THEN 'Video'
		 ELSE 'Audio'
		 END AS MediaType
	 ,CASE
		 WHEN MT.Name LIKE '%AAC%' THEN 'AAC'
		 WHEN MT.Name LIKE '%MPEG%' THEN 'MPEG'
		 ELSE 'Unknown'
		 END EncodingFormat
FROM MediaType MT
JOIN Track T
	 ON T.MediaTypeId = MT.MediaTypeId
	 ORDER BY EncodingFormat

--Question 2
SELECT --DISTINCT
	MT.name AS MediaTypeName
	,T.Name	
FROM MediaType MT
JOIN Track T
	ON T.MediaTypeId = MT.MediaTypeId

	





	

