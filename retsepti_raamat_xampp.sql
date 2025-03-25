CREATE TABLE kasutaja(
kasutaja_id int primary key AUTO_INCREMENT,
eesnimi varchar(50),
perenimi varchar(50),
email varchar(150)
);

INSERT INTO kasutaja(eesnimi, perenimi, email) VALUES
('vadim', 'penkin', 'vadim.penkin@gmail.com'),
('andrei', 'svarshik', 'andrei2004@gmail.com'),
('mike', 'tyson', 'diddy@gmail.com'),
('nikita', 'gruzovik', 'vadimdestroyer@gmail.com'),
('anton', 'krutoi', 'antonandon@hotmail.com');

CREATE TABLE kategooria(
kategooria_id int primary key AUTO_INCREMENT,
kategooria_nimi varchar(50)
);

INSERT INTO kategooria(kategooria_nimi) VALUES
('Supid'),
('Road'),
('Magusad'),
('Joogid'),
('Puuviljad');

CREATE TABLE toiduaine(
toiduaine_id int primary key AUTO_INCREMENT,
toiduaine_nimi varchar(100)
);

INSERT INTO toiduaine(toiduaine_nimi) VALUES
('Tomatipasta'),
('Pepperoni'),
('Jahu'),
('Juust'),
('Tainas');

CREATE TABLE yhik(
yhik_id int primary key AUTO_INCREMENT,
yhik_nimi varchar(100)
);

INSERT INTO yhik(yhik_nimi) VALUES
('ml'),
('tl'),
('sl'),
('g'),
('kg'),
('tk');


CREATE TABLE retsept(
retsept_id int primary key AUTO_INCREMENT,
retsepti_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key (kategooria_id) references kategooria(kategooria_id)
);

INSERT INTO retsept(retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id) VALUES
('Pasta Carbonara', 
'Klassikaline Itaalia pastaroog, mis on valmistatud munade, juustu, pancetta ja pipraga.',
'Keeda pasta vastavalt pakendi juhistele. Küpseta pancettat eraldi pannil krõbedaks. Vahusta munad riivitud parmesani ja musta pipraga. Nõruta pasta ja kombineeri pancettaga. Lisa aeglaselt munasegu ja sega kreemja kastme saamiseks. Serveeri peale lisa juustu ja pipraga.',
'2025-02-14',
1);

INSERT INTO retsept(retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id) VALUES
('Šokolaadikook', 
'Rikkalik ja niiske šokolaadikook ühtlase šokolaadijäätisega.',
'Kuumuta ahi 180°C-ni. Sega omavahel jahu, kakaopulber, suhkur, sooda ja sool. Sega eraldi kausis munad, piim, taimeõli ja vanill. Lisa märjad koostisosad vähehaaval kuivadele koostisosadele ja sega ühtlaseks massiks. Vala tainas võiga määritud koogivormidesse ja küpseta 30 minutit. Lase jahtuda, seejärel määri šokolaadiglasuuriga.',
'2025-02-14',
1);

INSERT INTO retsept(retsepti_nimi, sisestatud_kp, kasutaja_id, kategooria_id) VALUES
('Pizza', '2020-01-01', 3, 2),
('Borš', '2024-01-01', 1, 1),
('Kartulipüree kotletiga', '1821-05-05', 3, 2);

CREATE TABLE tehtud(
tehtud_id int primary key AUTO_INCREMENT,
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id)
);

INSERT INTO tehtud(tehtud_kp, retsept_id) VALUES
('2023-02-07', 3),
('2021-01-02', 4),
('2024-12-31', 5),
('2019-07-08', 1),
('2023-02-16', 2);

CREATE TABLE koostis(
koostis_id int primary key AUTO_INCREMENT,
kogus int,
retsept_retsept_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
yhik_id int,
foreign key (yhik_id) references yhik(yhik_id)
);

INSERT INTO koostis(retsept_retsept_id, toiduaine_id, kogus, yhik_id) VALUES
(3, 1, 4, 1),
(3, 2, 15, 2),
(3, 4, 200, 3),
(3, 5, 300, 4);

-- Uus tabel
CREATE TABLE arvustused(
arvustus_id int primary key AUTO_INCREMENT,
kasutaja_id int,
retsept_id int,
hinnang int,
kommentaar varchar(300),
kuupaev date,

foreign key (kasutaja_id) references kasutaja(kasutaja_id),
foreign key (retsept_id) references retsept(retsept_id)
);

INSERT INTO arvustused(kasutaja_id, retsept_id, hinnang, kommentaar, kuupaev) VALUES
(2, 3, 4, 'Love it', '2025-03-25'),
(3, 3, 4, 'Love it', '2025-03-25'),
(4, 4, 1, 'Blud that is my recipe', '2025-03-25'),
(1, 2, 4, 'Woah', '2025-03-25'),
(2, 1, 1, 'Hate it', '2025-03-25');
