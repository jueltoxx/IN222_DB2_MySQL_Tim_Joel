-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: localhost    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Anlass`
--

DROP TABLE IF EXISTS `Anlass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Anlass` (
  `AnalID` int NOT NULL,
  `Bezeichner` varchar(20) NOT NULL,
  `Ort` varchar(20) NOT NULL,
  `Datum` date NOT NULL,
  `Kosten` decimal(8,2) DEFAULT NULL,
  `OrgID` int NOT NULL,
  PRIMARY KEY (`AnalID`),
  KEY `OrgID` (`OrgID`),
  CONSTRAINT `Anlass_ibfk_1` FOREIGN KEY (`OrgID`) REFERENCES `Person` (`PersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anlass`
--

LOCK TABLES `Anlass` WRITE;
/*!40000 ALTER TABLE `Anlass` DISABLE KEYS */;
INSERT INTO `Anlass` VALUES (1,'Demo-Event','Veranstaltungshalle','2023-05-01',500.00,1);
/*!40000 ALTER TABLE `Anlass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funktion`
--

DROP TABLE IF EXISTS `Funktion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funktion` (
  `FunkID` int NOT NULL,
  `Bezeichner` varchar(20) NOT NULL,
  PRIMARY KEY (`FunkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funktion`
--

LOCK TABLES `Funktion` WRITE;
/*!40000 ALTER TABLE `Funktion` DISABLE KEYS */;
INSERT INTO `Funktion` VALUES (1,'Vorstand');
/*!40000 ALTER TABLE `Funktion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funktionsbesetzung`
--

DROP TABLE IF EXISTS `Funktionsbesetzung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funktionsbesetzung` (
  `Antritt` date NOT NULL,
  `Ruecktritt` date DEFAULT NULL,
  `FunkID` int NOT NULL,
  `PersID` int NOT NULL,
  PRIMARY KEY (`Antritt`,`FunkID`,`PersID`),
  KEY `FunkID` (`FunkID`),
  KEY `PersID` (`PersID`),
  CONSTRAINT `Funktionsbesetzung_ibfk_1` FOREIGN KEY (`FunkID`) REFERENCES `Funktion` (`FunkID`),
  CONSTRAINT `Funktionsbesetzung_ibfk_2` FOREIGN KEY (`PersID`) REFERENCES `Person` (`PersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funktionsbesetzung`
--

LOCK TABLES `Funktionsbesetzung` WRITE;
/*!40000 ALTER TABLE `Funktionsbesetzung` DISABLE KEYS */;
INSERT INTO `Funktionsbesetzung` VALUES ('2023-01-01',NULL,1,1);
/*!40000 ALTER TABLE `Funktionsbesetzung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `PersID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Vorname` varchar(15) NOT NULL,
  `Strasse_Nr` varchar(20) NOT NULL,
  `PLZ` char(4) NOT NULL,
  `Ort` varchar(20) NOT NULL,
  `bezahlt` char(1) NOT NULL,
  `Bemerkungen` varchar(25) DEFAULT NULL,
  `Eintritt` date NOT NULL,
  `Austritt` date DEFAULT NULL,
  `StatID` int DEFAULT NULL,
  `MentorID` int DEFAULT NULL,
  PRIMARY KEY (`PersID`),
  KEY `StatID` (`StatID`),
  KEY `MentorID` (`MentorID`),
  CONSTRAINT `Person_ibfk_1` FOREIGN KEY (`StatID`) REFERENCES `Status` (`StatID`),
  CONSTRAINT `Person_ibfk_2` FOREIGN KEY (`MentorID`) REFERENCES `Person` (`PersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Muster','Max','Musterstrasse 1','1234','Musterstadt','Y','Demo-Person','2023-01-01',NULL,1,NULL);
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Spende`
--

DROP TABLE IF EXISTS `Spende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Spende` (
  `SpenID` int NOT NULL,
  `Bezeichner` varchar(20) DEFAULT NULL,
  `Datum` date NOT NULL,
  `Betrag` decimal(8,2) NOT NULL,
  `SponID` int NOT NULL,
  `AnalID` int DEFAULT NULL,
  PRIMARY KEY (`SpenID`),
  KEY `SponID` (`SponID`),
  KEY `AnalID` (`AnalID`),
  CONSTRAINT `Spende_ibfk_1` FOREIGN KEY (`SponID`) REFERENCES `Sponsor` (`SponID`),
  CONSTRAINT `Spende_ibfk_2` FOREIGN KEY (`AnalID`) REFERENCES `Anlass` (`AnalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spende`
--

LOCK TABLES `Spende` WRITE;
/*!40000 ALTER TABLE `Spende` DISABLE KEYS */;
INSERT INTO `Spende` VALUES (1,'Demo-Spende','2023-05-01',250.00,1,1);
/*!40000 ALTER TABLE `Spende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsor`
--

DROP TABLE IF EXISTS `Sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsor` (
  `SponID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Strasse_Nr` varchar(20) NOT NULL,
  `PLZ` char(4) NOT NULL,
  `Ort` varchar(20) NOT NULL,
  `Spendentotal` decimal(8,2) NOT NULL,
  PRIMARY KEY (`SponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsor`
--

LOCK TABLES `Sponsor` WRITE;
/*!40000 ALTER TABLE `Sponsor` DISABLE KEYS */;
INSERT INTO `Sponsor` VALUES (1,'Firma Demo','Hauptstrasse 10','5678','Demohausen',1000.00);
/*!40000 ALTER TABLE `Sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsorenkontakt`
--

DROP TABLE IF EXISTS `Sponsorenkontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sponsorenkontakt` (
  `PersID` int NOT NULL,
  `SponID` int NOT NULL,
  PRIMARY KEY (`PersID`,`SponID`),
  KEY `SponID` (`SponID`),
  CONSTRAINT `Sponsorenkontakt_ibfk_1` FOREIGN KEY (`PersID`) REFERENCES `Person` (`PersID`),
  CONSTRAINT `Sponsorenkontakt_ibfk_2` FOREIGN KEY (`SponID`) REFERENCES `Sponsor` (`SponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsorenkontakt`
--

LOCK TABLES `Sponsorenkontakt` WRITE;
/*!40000 ALTER TABLE `Sponsorenkontakt` DISABLE KEYS */;
INSERT INTO `Sponsorenkontakt` VALUES (1,1);
/*!40000 ALTER TABLE `Sponsorenkontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Status` (
  `StatID` int NOT NULL,
  `Bezeichner` varchar(20) NOT NULL,
  `Beitrag` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`StatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES (1,'Aktiv',50.00);
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teilnehmer`
--

DROP TABLE IF EXISTS `Teilnehmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teilnehmer` (
  `PersID` int NOT NULL,
  `AnalID` int NOT NULL,
  PRIMARY KEY (`PersID`,`AnalID`),
  KEY `AnalID` (`AnalID`),
  CONSTRAINT `Teilnehmer_ibfk_1` FOREIGN KEY (`PersID`) REFERENCES `Person` (`PersID`),
  CONSTRAINT `Teilnehmer_ibfk_2` FOREIGN KEY (`AnalID`) REFERENCES `Anlass` (`AnalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teilnehmer`
--

LOCK TABLES `Teilnehmer` WRITE;
/*!40000 ALTER TABLE `Teilnehmer` DISABLE KEYS */;
INSERT INTO `Teilnehmer` VALUES (1,1);
/*!40000 ALTER TABLE `Teilnehmer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 17:12:00
