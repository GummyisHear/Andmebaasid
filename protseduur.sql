(localdb)mssqllocaldb

--SQL salvestatud protseduur - funktsioon, mis käivitab serveris mitu SQL tegevust järjest
--Kasutame SQL Server 

CREATE DATABASE protseduurPoldsaar;
USE protseduurPoldsaar;

CREATE TABLE linn(
linnId int PRIMARY KEY IDENTITY(1,1),
linnNimi varchar(30),
rahvaArv int
);

SELECT * FROM linn;

INSERT INTO linn(linnNimi, rahvaArv) VALUES
('Tallinn', 437980),
('Pärnu', 40228),
('Narva', 53626);

--Protseduuri loomine
--protseduur, mis lisab uus linn ja kohe näitab tabelis

CREATE PROCEDURE lisaLinn
@lnimi varchar(30),
@rArv int
AS
BEGIN

INSERT INTO linn(linnNimi, rahvaArv) VALUES
(@lnimi, @rArv);
SELECT * FROM linn;

END;

--protseduuri kutse
EXEC lisaLinn @lnimi='Tartu', @rArv=93000;
EXEC lisaLinn 'Tartu2', 93000;

--protseduur, mis kustututab linn id järgi

CREATE PROCEDURE kustutaLinn
@lId int
AS
BEGIN
SELECT * FROM linn;
DELETE FROM linn WHERE linnId=@lId;
SELECT * FROM linn;
END;

EXEC lisaLinn 'Tartu3333', 93000;
EXEC kustutaLinn 6;

--protseduuri kustutamine
DROP PROCEDURE kustutaLinn;


