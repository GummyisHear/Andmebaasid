--AB loomine
Create database PoldsaarBaas;

use PoldsaarBass;
CREATE TABLE opilane(
opilaneId int primary key identity(1, 1), 
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
adress text,
keskmine_hinne decimal(2, 1))
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(
eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
VALUES(
'Arrjom',
'Poldsaat',
'2000-12-12',
1,
4.5
),
(
'Vadim',
'Artemovich',
'2000-12-12',
1,
4.5
),
(
'Denis',
'Vadimovich',
'2000-12-12',
1,
4.5
),
(
'Andrei',
'Denisovich',
'2000-12-12',
1,
4.5
)
--tabeli kustutamine
DROP DATABASE opilane;
--drop table opilane


DELETE FROM opilane WHERE opilaneId=3;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET adress='Tartu' WHERE opilaneId=1
