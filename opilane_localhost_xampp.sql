CREATE TABLE opilane(
opilaneId int primary key AUTO_INCREMENT, 
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
adress text,
keskmine_hinne decimal(2, 1));

INSERT INTO opilane(eesnimi, perenimi, synniaeg, keskmine_hinne) VALUES
("Artjom", "Poldsaar", "2000-12-12", 9.9),
("Nikita","Nikiforov", "2008-12-12", 0.0),
("Denis","Andreyev", "2003-12-12", 3.5),
("Andrei","Denisovich", "2001-12-12", 3.0),
("Mark","Shark", "2020-12-12", 4.1);

DROP TABLE opilane;

DELETE FROM opilane WHERE opilaneId=3;

UPDATE opilane SET adress='Tartu' WHERE opilaneId=1;

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);

INSERT INTO Language (ID, Code, Language) VALUES
(1, 'EST', 'Eesti'),
(2, 'RUS', 'Vene'),
(3, 'ENG', 'Inglise'),
(4, 'DE', 'Saksa');

CREATE TABLE keelevalik (
    keelevalikID int AUTO_INCREMENT primary key, 
    valikudnimetus varchar(10) NOT NULL,
    opilaneId INT, 
    foreign key (opilaneId) references opilane(opilaneId),
    Language INT,
    foreign key (Language) references Language(ID)
);

INSERT INTO keelevalik (valikudnimetus, opilaneId, Language) VALUES
('valik B', 1, 2),
('valik A', 1, 4),
('valik C', 2, 1),
('valik D', 2, 3),
('valik E', 4, 3),
('valik F', 4, 4),
('valik F', 5, 1),
('valik F', 5, 4);
