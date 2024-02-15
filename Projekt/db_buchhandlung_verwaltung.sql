-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Feb 2024 um 19:35
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_buchhandlung_verwaltung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adressen`
--

CREATE TABLE `adressen` (
  `adressen_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `straße` varchar(255) DEFAULT NULL,
  `adresszeile` varchar(255) DEFAULT NULL,
  `stadt` varchar(100) DEFAULT NULL,
  `postleitzahl` varchar(20) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `angestellte`
--

CREATE TABLE `angestellte` (
  `Angestellte_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Vorname` varchar(100) DEFAULT NULL,
  `Nachname` varchar(100) DEFAULT NULL,
  `Abteilung` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL,
  `typ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `angestellte`
--

INSERT INTO `angestellte` (`Angestellte_id`, `Vorname`, `Nachname`, `Abteilung`, `Position`, `konto_id`, `typ_id`) VALUES
(1, 'Julia', 'Schulz', 'IT', 'Manager', 11, 3),
(2, 'David', 'Fischer', 'Vertrieb', 'Entwickler', 12, 3),
(3, 'Laura', 'Schulz', 'Marketing', 'Verkäufer', 13, 3),
(4, 'Anna', 'Schulz', 'Marketing', 'Entwickler', 14, 3),
(5, 'Lena', 'Müller', 'IT', 'Analyst', 15, 3),
(6, 'David', 'Becker', 'HR', 'Entwickler', 16, 3),
(7, 'Lena', 'Weber', 'Marketing', 'Analyst', 17, 3),
(8, 'Alex', 'Schulz', 'Marketing', 'Analyst', 18, 3),
(9, 'Simon', 'Meyer', 'Marketing', 'Analyst', 19, 3),
(10, 'Simon', 'Schäfer', 'IT', 'Entwickler', 20, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ansprechpartner`
--

CREATE TABLE `ansprechpartner` (
  `Ansprechpartner_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Vorname` varchar(100) DEFAULT NULL,
  `Nachname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefonnumer` varchar(100) DEFAULT NULL,
  `Verlag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `konten`
--

CREATE TABLE `konten` (
  `konto_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `erstellt_datum` timestamp NULL DEFAULT NULL,
  `last_datum` timestamp NULL DEFAULT NULL,
  `benutzname` varchar(100) DEFAULT NULL,
  `passwort_hash` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `konten`
--

INSERT INTO `konten` (`konto_id`, `erstellt_datum`, `last_datum`, `benutzname`, `passwort_hash`) VALUES
(1, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'BeatlesFan', '$2y$10$P4Jb9G7vvFdUFV6X7PU/F.y8bMZmZZOV/qxouGpz.OOQP7HoWN88C'),
(2, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'ZeppelinRocks', '$2y$10$IM4rnSzmS//SENl.HQ7PY.J8kHR8P8r.x4guQmRrDULUctcntHt7q'),
(3, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'MadonnaQueen', '$2y$10$P2zWebcGN.0PxvDsP3GUH.Wp11a4RNWCtSyNz4cJa9YXSkkgiJr3q'),
(4, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'PrinceIcon', '$2y$10$RLlw.t8bRnvsdWzF17MrHeQoKmqGxfN/oy3LJX8OrWcMkVmsb6q3G'),
(5, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'BowieStar', '$2y$10$JpfDkSx7..CFQ/p6xdgEt.DEoyU0Z5acwdjzH2KnOfmC8E497hD.u'),
(6, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'NirvanaSpirit', '$2y$10$71y4PQlQXcv/i5xaFzurreI8yRAob75fDtIzdzaCm8tI7VkIYCGAe'),
(7, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'FloydDream', '$2y$10$BYfGgvOXisRRvInY/kvxMuUrP5fBHgTO5FMQHWX5gawdVZ6.88a.W'),
(8, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'MarleyReggae', '$2y$10$XjUmvjytY49UwLOzuBzune3SC4WTaI1P0EaDifD0rKgTAsFmlaTE.'),
(9, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'ElvisKing', '$2y$10$DQhEuZCSKrebZzQQIny/1eCyoTkHZYxnUZbGyPOZfxSprEz9Sy.za'),
(10, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'QueenMagic', '$2y$10$8hSX70NhRhcaVqVBP8eJtubnCARFkvzLitPh6sjm91g2wh11Cigum'),
(11, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'MetallicaLoud', '$2y$10$noq9Etq/HoDWl.2CzDR04uf3WyfAa1PIwYpVoH0MkRNE/uSsA3lVC'),
(12, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'AdeleVoice', '$2y$10$C6yjj4jlOBi4sCM6dIrxu.AIpMYSBgdb0HrH5/ZrKi3O.Nt9uxzry'),
(13, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'DrakeHits', '$2y$10$54Mbm.aON2bvAUGItcGfrOzZKihd1ROPo0Re1LeUKXTkfdvKvG3S6'),
(14, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'SwiftieTaylor', '$2y$10$OO5Y4/rXAXy05LWk5borU.rJ1Qh9ETgQBqckwEAMgCE1APiIWSfrG'),
(15, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'EminemRap', '$2y$10$TBUvOuzMRvUp0loAIjDLde05oTd8XO/PyhGLsy9mDxhJkqjd6DpAK'),
(16, '2024-02-14 14:35:52', '2024-02-14 14:35:52', 'U2Harmony', '$2y$10$srdrRwxEdIZuZXWewxPEteJJ6iwoeKkDL04tewx3N5B7f.kIG6mw6'),
(17, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'ColdplaySky', '$2y$10$OSRvHUvdHesraox30HSBfeYkCA.GOLWssUOy28XzhXfDxiF0WibCe'),
(18, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'EdSheeranLoop', '$2y$10$FF3jkB3uAg6rp19Z3YbV5.UAlon/GECa3Z9RHQyprrOR5t0ctd1kS'),
(19, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'BrunoMarsFunk', '$2y$10$n35w2W2PlIqXeBcs.nyLG.S8zFUA8.bjD0JfF2JSvDzQt6b66Cpoa'),
(20, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'LadyGagaPop', '$2y$10$0thJUz.eRSvJxBKlAhespeh3qGoa6YzI2EmHN./VFpSKP8YjBQPNq'),
(21, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'ArianaGrandeVocal', '$2y$10$P5hi/zumJx1wO0.QVfuxqOFeRiZxl4zVs7ysuG/B0ncevtpGF2LJy'),
(22, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'BeyonceQueenB', '$2y$10$BORInSVczcvG9NMJp5GDLeXGztjFqM9b0mlTwa/ldl43n7q0EnlWa'),
(23, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'JayZEmpire', '$2y$10$x4KK1r4fp7R3Of27evtSXOm1AxIuPyM9qRqaZ/J5Ko7e1XVDrPbVK'),
(24, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'RihannaShine', '$2y$10$CsHEkL82R43Mqkodo3iaoOrb9xkjI9c4nRVxKLUgK9LHzffqy1wni'),
(25, '2024-02-14 14:35:53', '2024-02-14 14:35:53', 'KanyeWestGenius', '$2y$10$UzIPtBeiB62s/F1TfCyoMu2l16pUwKHe1YdPaivJ.K6SrOqKMS2J6');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE `kunden` (
  `kunden_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `kd_vorname` varchar(255) DEFAULT NULL,
  `kd_nachname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefonnummer` varchar(20) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kunden`
--

INSERT INTO `kunden` (`kunden_id`, `kd_vorname`, `kd_nachname`, `email`, `telefonnummer`, `typ_id`, `konto_id`) VALUES
(11, 'Lena', 'Schulz', 'lena.schulz1@beispiel.com', '1234567891', 1, 1),
(12, 'Marie', 'Weber', 'marie.weber2@beispiel.com', '1234567892', 1, 2),
(13, 'Max', 'Meyer', 'max.meyer3@beispiel.com', '1234567893', 1, 3),
(14, 'Peter', 'Weber', 'peter.weber4@beispiel.com', '1234567894', 1, 4),
(15, 'Alex', 'Becker', 'alex.becker5@beispiel.com', '1234567895', 1, 5),
(16, 'Anna', 'Hoffmann', 'anna.hoffmann6@beispiel.com', '1234567896', 1, 6),
(17, 'Anna', 'Schäfer', 'anna.schäfer7@beispiel.com', '1234567897', 1, 7),
(18, 'Julia', 'Schäfer', 'julia.schäfer8@beispiel.com', '1234567898', 1, 8),
(19, 'Marie', 'Becker', 'marie.becker9@beispiel.com', '1234567899', 1, 9),
(20, 'Laura', 'Schulz', 'laura.schulz10@beispiel.com', '12345678910', 1, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lieferadressen`
--

CREATE TABLE `lieferadressen` (
  `lieferadressen_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `kunden_id` int(11) DEFAULT NULL,
  `straße` varchar(255) DEFAULT NULL,
  `adresszeile` varchar(255) DEFAULT NULL,
  `stadt` varchar(100) DEFAULT NULL,
  `postleitzahl` varchar(20) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnung_adressen`
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
-- Tabellenstruktur für Tabelle `typen_konten`
--

CREATE TABLE `typen_konten` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `typ_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `typen_konten`
--

INSERT INTO `typen_konten` (`typ_id`, `typ_name`) VALUES
(1, 'kunden'),
(2, 'untenehmen'),
(3, 'angestellte');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unternehmen`
--

CREATE TABLE `unternehmen` (
  `unternehmen_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `unternehmen_name` varchar(255) DEFAULT NULL,
  `kontaktperson` varchar(255) DEFAULT NULL,
  `kontakt_email` varchar(255) DEFAULT NULL,
  `kontakt_telefon` varchar(20) DEFAULT NULL,
  `adressen_id` int(11) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `konto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `unternehmen`
--

INSERT INTO `unternehmen` (`unternehmen_id`, `unternehmen_name`, `kontaktperson`, `kontakt_email`, `kontakt_telefon`, `adressen_id`, `typ_id`, `konto_id`) VALUES
(1, 'Unternehmen A', 'Max Müller', 'max@unternehmenA.com', '0123456789', 1, 2, 21),
(2, 'Unternehmen B', 'Julia Schmidt', 'julia@unternehmenB.com', '0123456790', 2, 2, 22),
(3, 'Unternehmen C', 'Anna Fischer', 'anna@unternehmenC.com', '0123456791', 3, 2, 23),
(4, 'Unternehmen D', 'Peter Weber', 'peter@unternehmenD.com', '0123456792', 4, 2, 24),
(5, 'Unternehmen E', 'Lena Meyer', 'lena@unternehmenE.com', '0123456793', 5, 2, 25);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `verlag_kontakt`
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
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adressen`
--
ALTER TABLE `adressen`
  ADD PRIMARY KEY (`adressen_id`);

--
-- Indizes für die Tabelle `angestellte`
--
ALTER TABLE `angestellte`
  ADD PRIMARY KEY (`Angestellte_id`);

--
-- Indizes für die Tabelle `ansprechpartner`
--
ALTER TABLE `ansprechpartner`
  ADD PRIMARY KEY (`Ansprechpartner_id`);

--
-- Indizes für die Tabelle `konten`
--
ALTER TABLE `konten`
  ADD PRIMARY KEY (`konto_id`);

--
-- Indizes für die Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`kunden_id`);

--
-- Indizes für die Tabelle `rechnung_adressen`
--
ALTER TABLE `rechnung_adressen`
  ADD PRIMARY KEY (`rechnungsadressen_id`);

--
-- Indizes für die Tabelle `typen_konten`
--
ALTER TABLE `typen_konten`
  ADD PRIMARY KEY (`typ_id`);

--
-- Indizes für die Tabelle `unternehmen`
--
ALTER TABLE `unternehmen`
  ADD PRIMARY KEY (`unternehmen_id`);

--
-- Indizes für die Tabelle `verlag_kontakt`
--
ALTER TABLE `verlag_kontakt`
  ADD PRIMARY KEY (`kontakt_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adressen`
--
ALTER TABLE `adressen`
  MODIFY `adressen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `angestellte`
--
ALTER TABLE `angestellte`
  MODIFY `Angestellte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `ansprechpartner`
--
ALTER TABLE `ansprechpartner`
  MODIFY `Ansprechpartner_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `konten`
--
ALTER TABLE `konten`
  MODIFY `konto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `kunden`
--
ALTER TABLE `kunden`
  MODIFY `kunden_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `rechnung_adressen`
--
ALTER TABLE `rechnung_adressen`
  MODIFY `rechnungsadressen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `typen_konten`
--
ALTER TABLE `typen_konten`
  MODIFY `typ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `unternehmen`
--
ALTER TABLE `unternehmen`
  MODIFY `unternehmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `verlag_kontakt`
--
ALTER TABLE `verlag_kontakt`
  MODIFY `kontakt_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
