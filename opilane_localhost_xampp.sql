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



-- E-pood SQL päringud (XAMPP)



CREATE DATABASE epoodPoldsaar;
USE epoodPoldsaar;

CREATE TABLE Category(
idCategory int primary key AUTO_INCREMENT, 
CategoryName varchar(25) UNIQUE
);

INSERT INTO Category(CategoryName) VALUES
('jook'),
('söök');

ALTER TABLE Category ADD test int;

ALTER TABLE Category DROP COLUMN test;

CREATE TABLE Product(
idProduct int primary key AUTO_INCREMENT,
ProductName varchar(50) UNIQUE NOT NULL,
idCategory int,
FOREIGN KEY (idCategory) REFERENCES Category(idCategory),
Price decimal(5,2)
);

INSERT INTO Product(ProductName, idCategory, Price) VALUES
('Karastusjook Coca Cola 0,5l', 1, 1.25),
('Banaan Cavendish 1kl, kg', 2, 1.29),
('Tomatimahl Aura 1l', 1, 1.29),
('Kanafileesink M&M 150g', 1, 1.85),
('Apelsin Navel, 1kl Rimi kg', 2, 1.49);

CREATE TABLE Sale(
idSale int primary key AUTO_INCREMENT,
idProduct int,
FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
idCustomer int,
Count int,
DateOfSale date
);

CREATE TABLE Customer(
idCustomer int primary key AUTO_INCREMENT,
Name varchar(25),
Contact Text
);

ALTER TABLE Sale ADD FOREIGN KEY (idCustomer) REFERENCES Customer(idCustomer);

SELECT * FROM Product;
SELECT * FROM Sale;
SELECT * FROM Customer;

INSERT INTO Customer(Name, Contact) VALUES
('Artjom', '+372 11236712'),
('Vadim337', '+372 5231712'),
('ValentinKiller', '+372 5712392'),
('Wandal226', 'Wandal Company OÜ'),
('DogeFromHell1', '+7 172395942');

INSERT INTO Sale(idProduct, idCustomer, Count, DateOfSale) VALUES
(1, 1, 100, '2024-12-30'),
(2, 1, 2, '2024-12-30'),
(4, 4, 1, '2024-12-12'),
(5, 4, 2, '2024-12-12'),
(3, 2, 2, '2023-9-17');


-------------------------------------------------------------------------------------------------------------
--Protseduurid

--Lisa
BEGIN
INSERT INTO opilane(eesnimi,perenimi,synniaeg,stip,keskmine_hinne) VALUES
(eesnimi2, perenimi2, synniaeg2, stip2, keskmine_hinne2);
SELECT * FROM opilane;
END

--Kustuta
BEGIN
SELECT * FROM opilane;
DELETE FROM opilane WHERE opilaneId = opId;
SELECT * FROM opilane;
END

--Otsing
BEGIN
SELECT * FROM opilane WHERE eesnimi LIKE CONCAT(taht, '%');
END

--Uuendus
BEGIN
UPDATE opilane SET stip = stip2
WHERE opilaneId=opId;
SELECT * FROM opilane;
END





