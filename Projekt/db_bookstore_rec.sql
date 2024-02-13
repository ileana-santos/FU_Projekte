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
-- Database: `db_bookstore_rec`
--

-- --------------------------------------------------------

--
-- Table structure for table `adressen`
--

CREATE TABLE `adressen` (
  `adressen_id` int(11) NOT NULL,
  `straße` varchar(255) DEFAULT NULL,
  `adresszeile` varchar(255) DEFAULT NULL,
  `stadt` varchar(100) DEFAULT NULL,
  `postleitzahl` varchar(20) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `angestellte`
--

CREATE TABLE `angestellte` (
  `Angestellte_id` varchar(100) NOT NULL,
  `Vorname` varchar(100) DEFAULT NULL,
  `Nachname` varchar(100) DEFAULT NULL,
  `Abteilung` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL,
  `typ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ansprechpartner`
--

CREATE TABLE `ansprechpartner` (
  `Ansprechpartner_id` int(11) NOT NULL,
  `Vorname` varchar(100) DEFAULT NULL,
  `Nachname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefonnumer` varchar(100) DEFAULT NULL,
  `Verlag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `konten`
--

CREATE TABLE `konten` (
  `passwort_hash` varchar(100) DEFAULT NULL,
  `erstellt_datum` timestamp NULL DEFAULT NULL,
  `last_datum` timestamp NULL DEFAULT NULL,
  `konto_id` int(11) NOT NULL,
  `benutzname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kunden`
--

CREATE TABLE `kunden` (
  `kunden_id` int(11) NOT NULL,
  `kunden_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefonnummer` varchar(20) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lieferadressen`
--

CREATE TABLE `lieferadressen` (
  `lieferadressen_id` int(11) NOT NULL,
  `kunden_id` int(11) DEFAULT NULL,
  `straße` varchar(255) DEFAULT NULL,
  `adresszeile` varchar(255) DEFAULT NULL,
  `stadt` varchar(100) DEFAULT NULL,
  `postleitzahl` varchar(20) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rechnung_adressen`
--

CREATE TABLE `rechnung_adressen` (
  `rechnungsadressen_id` int(11) NOT NULL,
  `kunden_id` int(11) DEFAULT NULL,
  `straße` varchar(255) DEFAULT NULL,
  `adresszeile` varchar(255) DEFAULT NULL,
  `stadt` varchar(100) DEFAULT NULL,
  `postleitzahl` varchar(20) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typen_konten`
--

CREATE TABLE `typen_konten` (
  `typ_id` int(11) NOT NULL,
  `typ_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unternehmen`
--

CREATE TABLE `unternehmen` (
  `unternehmen_id` int(11) NOT NULL,
  `unternehmen_name` varchar(255) DEFAULT NULL,
  `kontaktperson` varchar(255) DEFAULT NULL,
  `kontakt_email` varchar(255) DEFAULT NULL,
  `kontakt_telefon` varchar(20) DEFAULT NULL,
  `adressen_id` int(11) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verlag_kontakt`
--

CREATE TABLE `verlag_kontakt` (
  `kontakt_id` int(11) NOT NULL,
  `verlag_id` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefonnummer` varchar(20) DEFAULT NULL,
  `Ansprechpartner_id` int(11) DEFAULT NULL,
  `Straße` varchar(100) DEFAULT NULL,
  `PLZ` int(11) DEFAULT NULL,
  `Land` varchar(100) DEFAULT NULL,
  `adresszeile` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adressen`
--
ALTER TABLE `adressen`
  ADD PRIMARY KEY (`adressen_id`);

--
-- Indexes for table `angestellte`
--
ALTER TABLE `angestellte`
  ADD PRIMARY KEY (`Angestellte_id`),
  ADD KEY `angestellte_konten_FK` (`konto_id`),
  ADD KEY `angestellte_typen_konten_FK` (`typ_id`);

--
-- Indexes for table `ansprechpartner`
--
ALTER TABLE `ansprechpartner`
  ADD PRIMARY KEY (`Ansprechpartner_id`),
  ADD KEY `Ansprechpartner_verlag_FK` (`Verlag_id`);

--
-- Indexes for table `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`konto_id`);

--
-- Indexes for table `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`kunden_id`),
  ADD KEY `kunden_typen_konten_FK` (`typ_id`),
  ADD KEY `kunden_konten_FK` (`konto_id`);

--
-- Indexes for table `lieferadressen`
--
ALTER TABLE `lieferadressen`
  ADD PRIMARY KEY (`lieferadressen_id`),
  ADD KEY `kunden_id` (`kunden_id`);

--
-- Indexes for table `rechnung_adressen`
--
ALTER TABLE `rechnung_adressen`
  ADD PRIMARY KEY (`rechnungsadressen_id`),
  ADD KEY `kunden_id` (`kunden_id`);

--
-- Indexes for table `typen_konten`
--
ALTER TABLE `typen_konten`
  ADD PRIMARY KEY (`typ_id`);

--
-- Indexes for table `unternehmen`
--
ALTER TABLE `unternehmen`
  ADD PRIMARY KEY (`unternehmen_id`),
  ADD KEY `adressen_id` (`adressen_id`),
  ADD KEY `unternehmen_typen_konten_FK` (`typ_id`),
  ADD KEY `unternehmen_konten_FK` (`konto_id`);

--
-- Indexes for table `verlag_kontakt`
--
ALTER TABLE `verlag_kontakt`
  ADD PRIMARY KEY (`kontakt_id`),
  ADD KEY `verlag_id` (`verlag_id`),
  ADD KEY `verlag_kontakt_ansprechpartner_FK` (`Ansprechpartner_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angestellte`
--
ALTER TABLE `angestellte`
  ADD CONSTRAINT `angestellte_konten_FK` FOREIGN KEY (`konto_id`) REFERENCES `konten` (`konto_id`),
  ADD CONSTRAINT `angestellte_typen_konten_FK` FOREIGN KEY (`typ_id`) REFERENCES `typen_konten` (`typ_id`);

--
-- Constraints for table `kunden`
--
ALTER TABLE `kunden`
  ADD CONSTRAINT `kunden_konten_FK` FOREIGN KEY (`konto_id`) REFERENCES `konten` (`konto_id`),
  ADD CONSTRAINT `kunden_typen_konten_FK` FOREIGN KEY (`typ_id`) REFERENCES `typen_konten` (`typ_id`);

--
-- Constraints for table `lieferadressen`
--
ALTER TABLE `lieferadressen`
  ADD CONSTRAINT `lieferadressen_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`kunden_id`);

--
-- Constraints for table `rechnung_adressen`
--
ALTER TABLE `rechnung_adressen`
  ADD CONSTRAINT `rechnung_adressen_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`kunden_id`);

--
-- Constraints for table `unternehmen`
--
ALTER TABLE `unternehmen`
  ADD CONSTRAINT `unternehmen_ibfk_1` FOREIGN KEY (`adressen_id`) REFERENCES `adressen` (`adressen_id`),
  ADD CONSTRAINT `unternehmen_konten_FK` FOREIGN KEY (`konto_id`) REFERENCES `konten` (`konto_id`),
  ADD CONSTRAINT `unternehmen_typen_konten_FK` FOREIGN KEY (`typ_id`) REFERENCES `typen_konten` (`typ_id`);

--
-- Constraints for table `verlag_kontakt`
--
ALTER TABLE `verlag_kontakt`
  ADD CONSTRAINT `verlag_kontakt_ansprechpartner_FK` FOREIGN KEY (`Ansprechpartner_id`) REFERENCES `ansprechpartner` (`Ansprechpartner_id`),
  ADD CONSTRAINT `verlag_kontakt_ibfk_1` FOREIGN KEY (`verlag_id`) REFERENCES `db_buchhandlung`.`verlag` (`verlag_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
