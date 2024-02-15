-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 11:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_buchhandlung`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `autor_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nachname` varchar(255) DEFAULT NULL,
  `vorname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bestellungen`
--

CREATE TABLE `bestellungen` (
  `bestell_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `kunden_id` int(11) DEFAULT NULL,
  `bestelldatum` date DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `rechnungsadressen_id` int(11) DEFAULT NULL,
  `lieferadressen_id` int(11) DEFAULT NULL,
  `lieferungsart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bestellungsstatus`
--

CREATE TABLE `bestellungsstatus` (
  `bestellungsstatusID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `bestell_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bestell_buch`
--

CREATE TABLE `bestell_buch` (
  `buch_id` int(11) NOT NULL,
  `bestell_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bezahlungsmethoden`
--

CREATE TABLE `bezahlungsmethoden` (
  `zahlungsmethode_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `zahlungsmethode_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buch_img`
--

CREATE TABLE `buch_img` (
  `buch_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bücher`
--

CREATE TABLE `bücher` (
  `buch_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `titel` varchar(255) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `sprache_id` int(11) DEFAULT NULL,
  `kategorie_id` int(11) DEFAULT NULL,
  `preis` double NOT NULL,
  `verlag_id` int(11) DEFAULT NULL,
  `ISBN` varchar(100) NOT NULL,
  `kurzbeschreibung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `url` varchar(100) DEFAULT NULL,
  `beschreibung` varchar(100) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `kategorie_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `kategorie_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferungsart`
--

CREATE TABLE `lieferungsart` (
  `lieferunsart_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `liefermethode_name` varchar(255) DEFAULT NULL,
  `geschätzte_zeit` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferungsstatus`
--

CREATE TABLE `lieferungsstatus` (
  `lieferungsstatusID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `bestell_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rabatt`
--

CREATE TABLE `rabatt` (
  `rabatt_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `rabatt_prozentsatz` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rechnung`
--

CREATE TABLE `rechnung` (
  `rechnung_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `bestell_id` int(11) DEFAULT NULL,
  `rechnungsdatum` date DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `zahlungsstatus` varchar(50) DEFAULT NULL,
  `zahlungsmethode_id` int(11) DEFAULT NULL,
  `rabatt_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sprache`
--

CREATE TABLE `sprache` (
  `sprache_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `sprache_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verlag`
--

CREATE TABLE `verlag` (
  `verlag_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(50) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`autor_id`);

--
-- Indexes for table `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD PRIMARY KEY (`bestell_id`),
  ADD KEY `bestellungen_lieferungsart` (`lieferungsart_id`);

--
-- Indexes for table `bestellungsstatus`
--
ALTER TABLE `bestellungsstatus`
  ADD PRIMARY KEY (`bestellungsstatusID`),
  ADD KEY `bestellungsstatus_ibfk_1` (`bestell_id`);

--
-- Indexes for table `bestell_buch`
--
ALTER TABLE `bestell_buch`
  ADD PRIMARY KEY (`buch_id`),
  ADD KEY `bestell_buch_bestellungen_FK` (`bestell_id`),
  ADD KEY `bestell_buch_bücher_FK` (`buch_id`);

--
-- Indexes for table `bezahlungsmethoden`
--
ALTER TABLE `bezahlungsmethoden`
  ADD PRIMARY KEY (`zahlungsmethode_id`);

--
-- Indexes for table `buch_img`
--
ALTER TABLE `buch_img`
  ADD KEY `buch_img_bücher_FK` (`buch_id`),
  ADD KEY `buch_img_images_FK` (`img_id`);

--
-- Indexes for table `bücher`
--
ALTER TABLE `bücher`
  ADD PRIMARY KEY (`buch_id`),
  ADD KEY `bücher_ibfk_1` (`autor_id`),
  ADD KEY `bücher_ibfk_2` (`sprache_id`),
  ADD KEY `bücher_ibfk_3` (`kategorie_id`),
  ADD KEY `bücher_verlag_FK` (`verlag_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `images_autor_FK` (`autor_id`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kategorie_id`);

--
-- Indexes for table `lieferungsart`
--
ALTER TABLE `lieferungsart`
  ADD PRIMARY KEY (`lieferunsart_id`);

--
-- Indexes for table `lieferungsstatus`
--
ALTER TABLE `lieferungsstatus`
  ADD PRIMARY KEY (`lieferungsstatusID`),
  ADD KEY `lieferungsstatus_ibfk_1` (`bestell_id`);

--
-- Indexes for table `rabatt`
--
ALTER TABLE `rabatt`
  ADD PRIMARY KEY (`rabatt_id`);

--
-- Indexes for table `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`rechnung_id`),
  ADD KEY `rechnung_bezahlungsmethoden_FK` (`zahlungsmethode_id`),
  ADD KEY `rechnung_ibfk_1` (`bestell_id`),
  ADD KEY `rechnung_rabatt_FK` (`rabatt_id`);

--
-- Indexes for table `sprache`
--
ALTER TABLE `sprache`
  ADD PRIMARY KEY (`sprache_id`);

--
-- Indexes for table `verlag`
--
ALTER TABLE `verlag`
  ADD PRIMARY KEY (`verlag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bestellungen`
--
ALTER TABLE `bestellungen`
  MODIFY `bestell_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bestellungsstatus`
--
ALTER TABLE `bestellungsstatus`
  MODIFY `bestellungsstatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bestell_buch`
--
ALTER TABLE `bestell_buch`
  MODIFY `buch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bezahlungsmethoden`
--
ALTER TABLE `bezahlungsmethoden`
  MODIFY `zahlungsmethode_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bücher`
--
ALTER TABLE `bücher`
  MODIFY `buch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `kategorie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lieferungsart`
--
ALTER TABLE `lieferungsart`
  MODIFY `lieferunsart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lieferungsstatus`
--
ALTER TABLE `lieferungsstatus`
  MODIFY `lieferungsstatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rabatt`
--
ALTER TABLE `rabatt`
  MODIFY `rabatt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `rechnung_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sprache`
--
ALTER TABLE `sprache`
  MODIFY `sprache_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verlag`
--
ALTER TABLE `verlag`
  MODIFY `verlag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD CONSTRAINT `bestellungen_lieferungsart` FOREIGN KEY (`lieferungsart_id`) REFERENCES `lieferungsart` (`lieferunsart_id`);

--
-- Constraints for table `bestellungsstatus`
--
ALTER TABLE `bestellungsstatus`
  ADD CONSTRAINT `bestellungsstatus_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`);

--
-- Constraints for table `bestell_buch`
--
ALTER TABLE `bestell_buch`
  ADD CONSTRAINT `bestell_buch_bestellungen_FK` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`),
  ADD CONSTRAINT `bestell_buch_bücher_FK` FOREIGN KEY (`buch_id`) REFERENCES `bücher` (`buch_id`);

--
-- Constraints for table `buch_img`
--
ALTER TABLE `buch_img`
  ADD CONSTRAINT `buch_img_bücher_FK` FOREIGN KEY (`buch_id`) REFERENCES `bücher` (`buch_id`),
  ADD CONSTRAINT `buch_img_images_FK` FOREIGN KEY (`img_id`) REFERENCES `images` (`img_id`);

--
-- Constraints for table `bücher`
--
ALTER TABLE `bücher`
  ADD CONSTRAINT `bücher_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`),
  ADD CONSTRAINT `bücher_ibfk_2` FOREIGN KEY (`sprache_id`) REFERENCES `sprache` (`sprache_id`),
  ADD CONSTRAINT `bücher_ibfk_3` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`kategorie_id`),
  ADD CONSTRAINT `bücher_verlag_FK` FOREIGN KEY (`verlag_id`) REFERENCES `verlag` (`verlag_id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_autor_FK` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`);

--
-- Constraints for table `lieferungsstatus`
--
ALTER TABLE `lieferungsstatus`
  ADD CONSTRAINT `lieferungsstatus_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`);

--
-- Constraints for table `rechnung`
--
ALTER TABLE `rechnung`
  ADD CONSTRAINT `rechnung_bezahlungsmethoden_FK` FOREIGN KEY (`zahlungsmethode_id`) REFERENCES `bezahlungsmethoden` (`zahlungsmethode_id`),
  ADD CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`),
  ADD CONSTRAINT `rechnung_rabatt_FK` FOREIGN KEY (`rabatt_id`) REFERENCES `rabatt` (`rabatt_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
