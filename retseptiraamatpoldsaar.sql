-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 18, 2025 kell 02:01 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `retseptiraamatpoldsaar`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaKoostis` (IN `kRetsept` INT, IN `kToiduaine ` INT, IN `kKogus` INT, IN `kYhik` INT)   BEGIN

INSERT INTO koostis(retsept_retsept_id, toiduaine_id, kogus, yhik_id) VALUES
(kRetsept, kToiduaine, kKogus, kYhik);
SELECT * FROM koostis;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaRetsept` (IN `rNimi` VARCHAR(100), IN `rKirjeldus` VARCHAR(200), IN `rJuhend` VARCHAR(500), IN `rKasutaja` INT, IN `rKategooria` INT)   BEGIN

INSERT INTO retsept(retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id) VALUES
(rNimi, rKirjeldus, rJuhend, GETDATE(), rKasutaja, rKategooria);
SELECT * FROM retsept;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaTehtud` (IN `retsept` INT)   BEGIN

INSERT INTO tehtud(tehtud_kp, retsept_id) VALUES
(GETDATE(), retsept);
SELECT * FROM tehtud;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `arvustused`
--

CREATE TABLE `arvustused` (
  `arvustus_id` int(11) NOT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL,
  `hinnang` int(11) DEFAULT NULL,
  `kommentaar` varchar(300) DEFAULT NULL,
  `kuupaev` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `arvustused`
--

INSERT INTO `arvustused` (`arvustus_id`, `kasutaja_id`, `retsept_id`, `hinnang`, `kommentaar`, `kuupaev`) VALUES
(6, 2, 3, 4, 'Love it', NULL),
(7, 3, 3, 4, 'Love it', NULL),
(8, 4, 4, 1, 'Blud that is my recipe', NULL),
(9, 1, 2, 4, 'Woah', NULL),
(10, 2, 1, 1, 'Hate it', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutaja_id` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perenimi` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kasutaja`
--

INSERT INTO `kasutaja` (`kasutaja_id`, `eesnimi`, `perenimi`, `email`) VALUES
(1, 'vadim', 'penkin', 'vadim.penkin@gmail.com'),
(2, 'andrei', 'svarshik', 'andrei2004@gmail.com'),
(3, 'mike', 'tyson', 'diddy@gmail.com'),
(4, 'nikita', 'gruzovik', 'vadimdestroyer@gmail.com'),
(5, 'anton', 'krutoi', 'antonandon@hotmail.com');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kategooria`
--

CREATE TABLE `kategooria` (
  `kategooria_id` int(11) NOT NULL,
  `kategooria_nimi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kategooria`
--

INSERT INTO `kategooria` (`kategooria_id`, `kategooria_nimi`) VALUES
(1, 'Supid'),
(2, 'Road'),
(3, 'Magusad'),
(4, 'Joogid'),
(5, 'Puuviljad');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `koostis`
--

CREATE TABLE `koostis` (
  `koostis_id` int(11) NOT NULL,
  `kogus` int(11) DEFAULT NULL,
  `retsept_retsept_id` int(11) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL,
  `yhik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `koostis`
--

INSERT INTO `koostis` (`koostis_id`, `kogus`, `retsept_retsept_id`, `toiduaine_id`, `yhik_id`) VALUES
(5, 4, 3, 1, 1),
(6, 15, 3, 2, 2),
(7, 200, 3, 4, 3),
(8, 300, 3, 5, 3);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `retsept`
--

CREATE TABLE `retsept` (
  `retsept_id` int(11) NOT NULL,
  `retsepti_nimi` varchar(100) DEFAULT NULL,
  `kirjeldus` varchar(200) DEFAULT NULL,
  `juhend` varchar(500) DEFAULT NULL,
  `sisestatud_kp` date DEFAULT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `kategooria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `retsept`
--

INSERT INTO `retsept` (`retsept_id`, `retsepti_nimi`, `kirjeldus`, `juhend`, `sisestatud_kp`, `kasutaja_id`, `kategooria_id`) VALUES
(1, 'Pasta Carbonara', 'Klassikaline Itaalia pastaroog, mis on valmistatud munade, juustu, pancetta ja pipraga.', 'Keeda pasta vastavalt pakendi juhistele. Küpseta pancettat eraldi pannil krõbedaks. Vahusta munad riivitud parmesani ja musta pipraga. Nõruta pasta ja kombineeri pancettaga. Lisa aeglaselt munasegu ja sega kreemja kastme saamiseks. Serveeri peale lisa juustu ja pipraga.', '2025-02-14', 1, NULL),
(2, 'Šokolaadikook', 'Rikkalik ja niiske šokolaadikook ühtlase šokolaadijäätisega.', 'Kuumuta ahi 180°C-ni. Sega omavahel jahu, kakaopulber, suhkur, sooda ja sool. Sega eraldi kausis munad, piim, taimeõli ja vanill. Lisa märjad koostisosad vähehaaval kuivadele koostisosadele ja sega ühtlaseks massiks. Vala tainas võiga määritud koogivormidesse ja küpseta 30 minutit. Lase jahtuda, seejärel määri šokolaadiglasuuriga.', '2025-02-14', 1, NULL),
(3, 'Pizza', NULL, NULL, '2020-01-01', 3, 2),
(4, 'Borš', NULL, NULL, '2024-01-01', 1, 1),
(5, 'Kartulipüree kotletiga', NULL, NULL, '1821-05-05', 3, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tehtud`
--

CREATE TABLE `tehtud` (
  `tehtud_id` int(11) NOT NULL,
  `tehtud_kp` date DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tehtud`
--

INSERT INTO `tehtud` (`tehtud_id`, `tehtud_kp`, `retsept_id`) VALUES
(6, '2023-02-07', 1),
(7, '2021-01-02', 2),
(8, '2024-12-31', 3),
(9, '2019-07-08', 4),
(10, '2023-02-16', 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `toiduaine`
--

CREATE TABLE `toiduaine` (
  `toiduaine_id` int(11) NOT NULL,
  `toiduaine_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `toiduaine`
--

INSERT INTO `toiduaine` (`toiduaine_id`, `toiduaine_nimi`) VALUES
(1, 'Tomatipasta'),
(2, 'Pepperoni'),
(3, 'Jahu'),
(4, 'Juust'),
(5, 'Tainas');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `yhik`
--

CREATE TABLE `yhik` (
  `yhik_id` int(11) NOT NULL,
  `yhik_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `yhik`
--

INSERT INTO `yhik` (`yhik_id`, `yhik_nimi`) VALUES
(1, 'ml'),
(2, 'tl'),
(3, 'sl'),
(4, 'g'),
(5, 'kg'),
(6, 'tk');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `arvustused`
--
ALTER TABLE `arvustused`
  ADD PRIMARY KEY (`arvustus_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutaja_id`);

--
-- Indeksid tabelile `kategooria`
--
ALTER TABLE `kategooria`
  ADD PRIMARY KEY (`kategooria_id`);

--
-- Indeksid tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD PRIMARY KEY (`koostis_id`),
  ADD KEY `retsept_retsept_id` (`retsept_retsept_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`),
  ADD KEY `yhik_id` (`yhik_id`);

--
-- Indeksid tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD PRIMARY KEY (`retsept_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `kategooria_id` (`kategooria_id`);

--
-- Indeksid tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD PRIMARY KEY (`tehtud_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  ADD PRIMARY KEY (`toiduaine_id`);

--
-- Indeksid tabelile `yhik`
--
ALTER TABLE `yhik`
  ADD PRIMARY KEY (`yhik_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `arvustused`
--
ALTER TABLE `arvustused`
  MODIFY `arvustus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `kategooria`
--
ALTER TABLE `kategooria`
  MODIFY `kategooria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `koostis`
--
ALTER TABLE `koostis`
  MODIFY `koostis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabelile `retsept`
--
ALTER TABLE `retsept`
  MODIFY `retsept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `tehtud`
--
ALTER TABLE `tehtud`
  MODIFY `tehtud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  MODIFY `toiduaine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `yhik`
--
ALTER TABLE `yhik`
  MODIFY `yhik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `arvustused`
--
ALTER TABLE `arvustused`
  ADD CONSTRAINT `arvustused_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `arvustused_ibfk_2` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);

--
-- Piirangud tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD CONSTRAINT `koostis_ibfk_1` FOREIGN KEY (`retsept_retsept_id`) REFERENCES `retsept` (`retsept_id`),
  ADD CONSTRAINT `koostis_ibfk_2` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`toiduaine_id`),
  ADD CONSTRAINT `koostis_ibfk_3` FOREIGN KEY (`yhik_id`) REFERENCES `yhik` (`yhik_id`);

--
-- Piirangud tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD CONSTRAINT `retsept_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `retsept_ibfk_2` FOREIGN KEY (`kategooria_id`) REFERENCES `kategooria` (`kategooria_id`);

--
-- Piirangud tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD CONSTRAINT `tehtud_ibfk_1` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
