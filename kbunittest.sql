-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Erstellungszeit: 11. Mrz 2019 um 08:27
-- Server-Version: 5.7.21
-- PHP-Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Tabellenstruktur fuer Tabelle `testparameterinfo`
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
-- Tabellenstruktur fuer Tabelle `testresultinfo`
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
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `testparameterinfo`
--
ALTER TABLE `testparameterinfo`
  ADD CONSTRAINT `testparameterinfo_ibfk_1` FOREIGN KEY (`testresultinfo_id`) REFERENCES `testresultinfo` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
