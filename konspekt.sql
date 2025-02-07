--IIF (Sql Server)
--IF (XAMPP)

--выводет 2 столбца, название и оценку для каждого города
SELECT linnNimi, IIF (rahvaArv < 2000, 'väike linn', 'suur linn') as Hinnang
FROM linn;

SUM(), AVG(), MIN(), MAX(), COUNT()

SELECT SUM(rahvaArv) AS 'kokku rahvaArv', 
AVG(rahvaArv) AS 'keskmine rahvaArv',
MIN(rahvaArv) AS 'minimum rahvaArv', 
MAX(rahvaArv) AS 'maksimum rahvaArv', 
COUNT(*) AS 'linnade arv'
FROM linn;
