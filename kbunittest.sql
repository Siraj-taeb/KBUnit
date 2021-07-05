-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Erstellungszeit: 05. Jul 2021 um 10:23
-- Server-Version: 5.7.31
-- PHP-Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `kbunittest`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classcoverage`
--

DROP TABLE IF EXISTS `classcoverage`;
CREATE TABLE IF NOT EXISTS `classcoverage` (
  `Src_id` int(11) NOT NULL AUTO_INCREMENT,
  `DateTime` timestamp NOT NULL,
  `ClassName` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Coverage` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`Src_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `linecoverage`
--

DROP TABLE IF EXISTS `linecoverage`;
CREATE TABLE IF NOT EXISTS `linecoverage` (
  `Line_Num` int(11) NOT NULL,
  `Color` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Mth_id` int(11) DEFAULT NULL,
  `Src_id` int(11) NOT NULL,
  PRIMARY KEY (`Line_Num`,`Src_id`),
  KEY `Mth_id` (`Mth_id`),
  KEY `linecoverage_ibfk_2` (`Src_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `methodcoverage`
--

DROP TABLE IF EXISTS `methodcoverage`;
CREATE TABLE IF NOT EXISTS `methodcoverage` (
  `Mth_id` int(11) NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Coverage` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Src_id` int(11) NOT NULL,
  PRIMARY KEY (`Mth_id`),
  KEY `Src_id` (`Src_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `testparameterinfo`
--

DROP TABLE IF EXISTS `testparameterinfo`;
CREATE TABLE IF NOT EXISTS `testparameterinfo` (
  `name` varchar(250) NOT NULL,
  `value` tinyblob,
  `testresultinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`testresultinfo_id`),
  KEY `testresultinfo_id` (`testresultinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `testresultinfo`
--

DROP TABLE IF EXISTS `testresultinfo`;
CREATE TABLE IF NOT EXISTS `testresultinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Path` varchar(250) NOT NULL,
  `Success` tinyint(1) NOT NULL,
  `Message` varchar(250) NOT NULL,
  `ExceptionExpected` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `linecoverage`
--
ALTER TABLE `linecoverage`
  ADD CONSTRAINT `linecoverage_ibfk_1` FOREIGN KEY (`Mth_id`) REFERENCES `methodcoverage` (`Mth_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `linecoverage_ibfk_2` FOREIGN KEY (`Src_id`) REFERENCES `classcoverage` (`Src_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `methodcoverage`
--
ALTER TABLE `methodcoverage`
  ADD CONSTRAINT `methodcoverage_ibfk_1` FOREIGN KEY (`Src_id`) REFERENCES `classcoverage` (`Src_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `testparameterinfo`
--
ALTER TABLE `testparameterinfo`
  ADD CONSTRAINT `testparameterinfo_ibfk_1` FOREIGN KEY (`testresultinfo_id`) REFERENCES `testresultinfo` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
