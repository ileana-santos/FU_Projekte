-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 11:04 AM
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
  `autor_id` int(11) NOT NULL,
  `nachname` varchar(255) DEFAULT NULL,
  `vorname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autor_img`
--

CREATE TABLE `autor_img` (
  `autor_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bestellungen`
--

CREATE TABLE `bestellungen` (
  `bestell_id` int(11) NOT NULL,
  `kunden_id` int(11) DEFAULT NULL,
  `bestelldatum` date DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `rechnungsadressen_id` int(11) DEFAULT NULL,
  `lieferadressen_id` int(11) DEFAULT NULL,
  `lieferungsmethode_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bestellungsstatus`
--

CREATE TABLE `bestellungsstatus` (
  `bestellungsstatusID` int(11) NOT NULL,
  `bestell_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bezahlungsmethoden`
--

CREATE TABLE `bezahlungsmethoden` (
  `zahlungsmethode_id` int(11) NOT NULL,
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
  `buch_id` int(11) NOT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `sprache_id` int(11) DEFAULT NULL,
  `kategorie_id` int(11) DEFAULT NULL,
  `preis` double NOT NULL,
  `verlag_id` int(11) DEFAULT NULL,
  `ISBN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gutscheine`
--

CREATE TABLE `gutscheine` (
  `gutschein_id` int(11) NOT NULL,
  `gutscheincode` varchar(255) DEFAULT NULL,
  `rabattbetrag` decimal(10,2) DEFAULT NULL,
  `ablaufdatum` date DEFAULT NULL,
  `kunden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(11) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `beschreibung` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `kategorie_id` int(11) NOT NULL,
  `kategorie_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferungsart`
--

CREATE TABLE `lieferungsart` (
  `liefermethode_id` int(11) NOT NULL,
  `liefermethode_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferungsstatus`
--

CREATE TABLE `lieferungsstatus` (
  `lieferungsstatusID` int(11) NOT NULL,
  `bestell_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferzeiten`
--

CREATE TABLE `lieferzeiten` (
  `lieferzeit_id` int(11) NOT NULL,
  `liefermethode_id` int(11) DEFAULT NULL,
  `geschätzte_zeit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rabatt`
--

CREATE TABLE `rabatt` (
  `rabatt_id` int(11) NOT NULL,
  `rabatt_prozentsatz` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rechnung`
--

CREATE TABLE `rechnung` (
  `rechnung_id` int(11) NOT NULL,
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
  `sprache_id` int(11) NOT NULL,
  `sprache_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verlag`
--

CREATE TABLE `verlag` (
  `verlag_id` int(11) NOT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warenkorb`
--

CREATE TABLE `warenkorb` (
  `warenkorb_id` int(11) NOT NULL,
  `kunde_id` int(11) DEFAULT NULL,
  `buch_id` int(11) DEFAULT NULL,
  `menge` int(11) DEFAULT NULL,
  `preis` double DEFAULT NULL,
  `gesamtpreis` double DEFAULT NULL,
  `datum_hinzufuegt` timestamp NULL DEFAULT NULL,
  `gutschein_id` int(11) DEFAULT NULL
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
-- Indexes for table `autor_img`
--
ALTER TABLE `autor_img`
  ADD KEY `autor__autor_FK` (`autor_id`),
  ADD KEY `autor__images_FK` (`img_id`);

--
-- Indexes for table `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD PRIMARY KEY (`bestell_id`),
  ADD KEY `kunden_id` (`kunden_id`),
  ADD KEY `lieferadressen_id` (`lieferadressen_id`),
  ADD KEY `rechnungsadressen_id` (`rechnungsadressen_id`),
  ADD KEY `bestellungen_lieferungsart_FK` (`lieferungsmethode_id`);

--
-- Indexes for table `bestellungsstatus`
--
ALTER TABLE `bestellungsstatus`
  ADD PRIMARY KEY (`bestellungsstatusID`),
  ADD KEY `bestell_id` (`bestell_id`);

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
  ADD UNIQUE KEY `bücher_unique` (`ISBN`),
  ADD KEY `autor_id` (`autor_id`),
  ADD KEY `sprache_id` (`sprache_id`),
  ADD KEY `kategorie_id` (`kategorie_id`),
  ADD KEY `bücher_verlag_FK` (`verlag_id`);

--
-- Indexes for table `gutscheine`
--
ALTER TABLE `gutscheine`
  ADD PRIMARY KEY (`gutschein_id`),
  ADD KEY `gutscheine_kunden_FK` (`kunden_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kategorie_id`);

--
-- Indexes for table `lieferungsart`
--
ALTER TABLE `lieferungsart`
  ADD PRIMARY KEY (`liefermethode_id`);

--
-- Indexes for table `lieferungsstatus`
--
ALTER TABLE `lieferungsstatus`
  ADD PRIMARY KEY (`lieferungsstatusID`),
  ADD KEY `bestell_id` (`bestell_id`);

--
-- Indexes for table `lieferzeiten`
--
ALTER TABLE `lieferzeiten`
  ADD PRIMARY KEY (`lieferzeit_id`),
  ADD KEY `liefermethode_id` (`liefermethode_id`);

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
  ADD KEY `bestell_id` (`bestell_id`),
  ADD KEY `rechnung_bezahlungsmethoden_FK` (`zahlungsmethode_id`),
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
-- Indexes for table `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`warenkorb_id`),
  ADD KEY `Warenkorb_kunden_FK` (`kunde_id`),
  ADD KEY `Warenkorb_bücher_FK` (`buch_id`),
  ADD KEY `warenkorb_gutscheine_FK` (`gutschein_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `autor_img`
--
ALTER TABLE `autor_img`
  ADD CONSTRAINT `autor__autor_FK` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`),
  ADD CONSTRAINT `autor__images_FK` FOREIGN KEY (`img_id`) REFERENCES `images` (`img_id`);

--
-- Constraints for table `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD CONSTRAINT `bestellungen_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `db_bookstore_rec`.`kunden` (`kunden_id`),
  ADD CONSTRAINT `bestellungen_ibfk_2` FOREIGN KEY (`lieferadressen_id`) REFERENCES `db_bookstore_rec`.`lieferadressen` (`lieferadressen_id`),
  ADD CONSTRAINT `bestellungen_ibfk_3` FOREIGN KEY (`rechnungsadressen_id`) REFERENCES `db_bookstore_rec`.`rechnung_adressen` (`rechnungsadressen_id`),
  ADD CONSTRAINT `bestellungen_lieferungsart_FK` FOREIGN KEY (`lieferungsmethode_id`) REFERENCES `lieferungsart` (`liefermethode_id`);

--
-- Constraints for table `bestellungsstatus`
--
ALTER TABLE `bestellungsstatus`
  ADD CONSTRAINT `bestellungsstatus_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`);

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
-- Constraints for table `gutscheine`
--
ALTER TABLE `gutscheine`
  ADD CONSTRAINT `gutscheine_kunden_FK` FOREIGN KEY (`kunden_id`) REFERENCES `db_bookstore_rec`.`kunden` (`kunden_id`);

--
-- Constraints for table `lieferungsstatus`
--
ALTER TABLE `lieferungsstatus`
  ADD CONSTRAINT `lieferungsstatus_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`);

--
-- Constraints for table `lieferzeiten`
--
ALTER TABLE `lieferzeiten`
  ADD CONSTRAINT `lieferzeiten_ibfk_1` FOREIGN KEY (`liefermethode_id`) REFERENCES `lieferungsart` (`liefermethode_id`);

--
-- Constraints for table `rechnung`
--
ALTER TABLE `rechnung`
  ADD CONSTRAINT `rechnung_bezahlungsmethoden_FK` FOREIGN KEY (`zahlungsmethode_id`) REFERENCES `bezahlungsmethoden` (`zahlungsmethode_id`),
  ADD CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `bestellungen` (`bestell_id`),
  ADD CONSTRAINT `rechnung_rabatt_FK` FOREIGN KEY (`rabatt_id`) REFERENCES `rabatt` (`rabatt_id`);

--
-- Constraints for table `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `Warenkorb_bücher_FK` FOREIGN KEY (`buch_id`) REFERENCES `bücher` (`buch_id`),
  ADD CONSTRAINT `Warenkorb_kunden_FK` FOREIGN KEY (`kunde_id`) REFERENCES `db_bookstore_rec`.`kunden` (`kunden_id`),
  ADD CONSTRAINT `warenkorb_gutscheine_FK` FOREIGN KEY (`gutschein_id`) REFERENCES `gutscheine` (`gutschein_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
