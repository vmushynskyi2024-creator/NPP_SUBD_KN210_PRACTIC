-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Astronomical_observations
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `celestial_object`
--

DROP TABLE IF EXISTS `celestial_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celestial_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_OBJECT` varchar(100) NOT NULL,
  `TYPE_OBJECT` varchar(50) DEFAULT NULL CHECK (`TYPE_OBJECT` in ('Zirka','Planet','Galaxy')),
  `DISTANCE_LIGHT_YEARS` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_OBJECT` (`NAME_OBJECT`),
  KEY `idx_NAME_OBJECT` (`NAME_OBJECT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celestial_object`
--

LOCK TABLES `celestial_object` WRITE;
/*!40000 ALTER TABLE `celestial_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `celestial_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedition`
--

DROP TABLE IF EXISTS `expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_EXPEDITION` varchar(100) NOT NULL,
  `LOCATION` varchar(100) NOT NULL,
  `DATE_START` date NOT NULL,
  `DATE_END` date NOT NULL,
  `DURATION_HOURS` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedition`
--

LOCK TABLES `expedition` WRITE;
/*!40000 ALTER TABLE `expedition` DISABLE KEYS */;
/*!40000 ALTER TABLE `expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expeditionary_link`
--

DROP TABLE IF EXISTS `expeditionary_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expeditionary_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EXPEDITION` int(11) NOT NULL,
  `ID_OBSERVATION` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_EXPEDITION` (`ID_EXPEDITION`),
  UNIQUE KEY `ID_OBSERVATION` (`ID_OBSERVATION`),
  CONSTRAINT `expeditionary_link_ibfk_1` FOREIGN KEY (`ID_EXPEDITION`) REFERENCES `expedition` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `expeditionary_link_ibfk_2` FOREIGN KEY (`ID_OBSERVATION`) REFERENCES `observation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expeditionary_link`
--

LOCK TABLES `expeditionary_link` WRITE;
/*!40000 ALTER TABLE `expeditionary_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `expeditionary_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observation`
--

DROP TABLE IF EXISTS `observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_OBSERVATION` date NOT NULL,
  `WEATHER_CONDITIONS` varchar(100) DEFAULT NULL,
  `ID_TELESCOPE` int(11) DEFAULT NULL,
  `ID_OBJECT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_TELESCOPE` (`ID_TELESCOPE`),
  KEY `ID_OBJECT` (`ID_OBJECT`),
  KEY `idx_DATE_OBSERVATION` (`DATE_OBSERVATION`),
  CONSTRAINT `observation_ibfk_1` FOREIGN KEY (`ID_TELESCOPE`) REFERENCES `telescope` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `observation_ibfk_2` FOREIGN KEY (`ID_OBJECT`) REFERENCES `celestial_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observation`
--

LOCK TABLES `observation` WRITE;
/*!40000 ALTER TABLE `observation` DISABLE KEYS */;
/*!40000 ALTER TABLE `observation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participation_observation`
--

DROP TABLE IF EXISTS `participation_observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participation_observation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_SCIENTIST` int(11) DEFAULT NULL,
  `ID_OBSERVATION` int(11) DEFAULT NULL,
  `ROLE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_OBSERVATION` (`ID_OBSERVATION`),
  KEY `idx_SCIENTIST` (`ID_SCIENTIST`),
  CONSTRAINT `participation_observation_ibfk_1` FOREIGN KEY (`ID_SCIENTIST`) REFERENCES `scientist` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `participation_observation_ibfk_2` FOREIGN KEY (`ID_OBSERVATION`) REFERENCES `observation` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation_observation`
--

LOCK TABLES `participation_observation` WRITE;
/*!40000 ALTER TABLE `participation_observation` DISABLE KEYS */;
/*!40000 ALTER TABLE `participation_observation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_OBSERVATION` int(11) DEFAULT NULL,
  `VALUE_RESULT` float NOT NULL,
  `UNIT_MEASUREMENT` varchar(50) NOT NULL,
  `DESCRIPTION_RESULT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_OBSERVATION` (`ID_OBSERVATION`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`ID_OBSERVATION`) REFERENCES `observation` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientist`
--

DROP TABLE IF EXISTS `scientist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(100) NOT NULL,
  `LAST_NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SPECIALIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `SPECIALIZATION` (`SPECIALIZATION`),
  KEY `idx_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientist`
--

LOCK TABLES `scientist` WRITE;
/*!40000 ALTER TABLE `scientist` DISABLE KEYS */;
/*!40000 ALTER TABLE `scientist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope`
--

DROP TABLE IF EXISTS `telescope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telescope` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_TELESCOPE` varchar(100) NOT NULL,
  `TYPE_TELESCOPE` varchar(50) NOT NULL,
  `DIAMETR_MIRROR` float NOT NULL,
  `COORDINATES` varchar(100) NOT NULL,
  `LOCATION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_TYPE_TELESCOPE` (`TYPE_TELESCOPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope`
--

LOCK TABLES `telescope` WRITE;
/*!40000 ALTER TABLE `telescope` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 11:59:07
