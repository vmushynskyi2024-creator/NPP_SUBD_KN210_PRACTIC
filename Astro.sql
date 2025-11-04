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
-- Table structure for table `ekspedytsiya`
--

DROP TABLE IF EXISTS `ekspedytsiya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ekspedytsiya` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(255) NOT NULL,
  `Lokatsiya` varchar(255) NOT NULL,
  `Data_pochatku` date NOT NULL,
  `Data_zavershennya` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekspedytsiya`
--

LOCK TABLES `ekspedytsiya` WRITE;
/*!40000 ALTER TABLE `ekspedytsiya` DISABLE KEYS */;
/*!40000 ALTER TABLE `ekspedytsiya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ekspedytsiynyy_zvyazok`
--

DROP TABLE IF EXISTS `ekspedytsiynyy_zvyazok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ekspedytsiynyy_zvyazok` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ekspedytsiyi` int(11) NOT NULL,
  `ID_spostererezhennya` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ekspedytsiyi` (`ID_ekspedytsiyi`),
  KEY `ID_spostererezhennya` (`ID_spostererezhennya`),
  CONSTRAINT `ekspedytsiynyy_zvyazok_ibfk_1` FOREIGN KEY (`ID_ekspedytsiyi`) REFERENCES `ekspedytsiya` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `ekspedytsiynyy_zvyazok_ibfk_2` FOREIGN KEY (`ID_spostererezhennya`) REFERENCES `spostererezhennya` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekspedytsiynyy_zvyazok`
--

LOCK TABLES `ekspedytsiynyy_zvyazok` WRITE;
/*!40000 ALTER TABLE `ekspedytsiynyy_zvyazok` DISABLE KEYS */;
/*!40000 ALTER TABLE `ekspedytsiynyy_zvyazok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naukovec`
--

DROP TABLE IF EXISTS `naukovec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naukovec` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imya` varchar(255) NOT NULL,
  `Prizvische` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Specializatsiya` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_specializatsiya` (`Specializatsiya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naukovec`
--

LOCK TABLES `naukovec` WRITE;
/*!40000 ALTER TABLE `naukovec` DISABLE KEYS */;
/*!40000 ALTER TABLE `naukovec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nebesnyy_obiekt`
--

DROP TABLE IF EXISTS `nebesnyy_obiekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nebesnyy_obiekt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(255) NOT NULL,
  `Tip` varchar(255) NOT NULL,
  `Vidstan_svitlovyh_rokah` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nazva` (`Nazva`),
  KEY `idx_nazva` (`Nazva`),
  KEY `idx_tip` (`Tip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nebesnyy_obiekt`
--

LOCK TABLES `nebesnyy_obiekt` WRITE;
/*!40000 ALTER TABLE `nebesnyy_obiekt` DISABLE KEYS */;
/*!40000 ALTER TABLE `nebesnyy_obiekt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezultat`
--

DROP TABLE IF EXISTS `rezultat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezultat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_spostererezhennya` int(11) NOT NULL,
  `Znachennya` float NOT NULL,
  `Odyinytsya_vymiru` varchar(255) NOT NULL,
  `Opys` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_spostererezhennya` (`ID_spostererezhennya`),
  CONSTRAINT `rezultat_ibfk_1` FOREIGN KEY (`ID_spostererezhennya`) REFERENCES `spostererezhennya` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezultat`
--

LOCK TABLES `rezultat` WRITE;
/*!40000 ALTER TABLE `rezultat` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezultat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spostererezhennya`
--

DROP TABLE IF EXISTS `spostererezhennya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spostererezhennya` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Umovy_pogody` varchar(255) DEFAULT NULL,
  `Tryvalist_god` float NOT NULL,
  `ID_ekspedytsiyi` int(11) NOT NULL,
  `ID_obiekta` int(11) NOT NULL,
  `ID_teleskopa` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_obiekta` (`ID_obiekta`),
  KEY `ID_teleskopa` (`ID_teleskopa`),
  KEY `idx_data` (`Data`),
  KEY `idx_id_ekspedytsiyi` (`ID_ekspedytsiyi`),
  CONSTRAINT `spostererezhennya_ibfk_1` FOREIGN KEY (`ID_ekspedytsiyi`) REFERENCES `ekspedytsiya` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `spostererezhennya_ibfk_2` FOREIGN KEY (`ID_obiekta`) REFERENCES `nebesnyy_obiekt` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `spostererezhennya_ibfk_3` FOREIGN KEY (`ID_teleskopa`) REFERENCES `teleskop` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spostererezhennya`
--

LOCK TABLES `spostererezhennya` WRITE;
/*!40000 ALTER TABLE `spostererezhennya` DISABLE KEYS */;
/*!40000 ALTER TABLE `spostererezhennya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teleskop`
--

DROP TABLE IF EXISTS `teleskop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teleskop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(255) NOT NULL,
  `Tip` varchar(255) NOT NULL,
  `Diametr_dzerkala` float NOT NULL,
  `Koordinaty` varchar(255) NOT NULL,
  `Misce_rozmischennya` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teleskop`
--

LOCK TABLES `teleskop` WRITE;
/*!40000 ALTER TABLE `teleskop` DISABLE KEYS */;
/*!40000 ALTER TABLE `teleskop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchast_u_spostererezhenni`
--

DROP TABLE IF EXISTS `uchast_u_spostererezhenni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchast_u_spostererezhenni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_spostererezhennya` int(11) NOT NULL,
  `ID_naukovtsya` int(11) NOT NULL,
  `Rol` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_spostererezhennya` (`ID_spostererezhennya`),
  KEY `idx_id_naukovtsya` (`ID_naukovtsya`),
  CONSTRAINT `uchast_u_spostererezhenni_ibfk_1` FOREIGN KEY (`ID_spostererezhennya`) REFERENCES `spostererezhennya` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `uchast_u_spostererezhenni_ibfk_2` FOREIGN KEY (`ID_naukovtsya`) REFERENCES `naukovec` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchast_u_spostererezhenni`
--

LOCK TABLES `uchast_u_spostererezhenni` WRITE;
/*!40000 ALTER TABLE `uchast_u_spostererezhenni` DISABLE KEYS */;
/*!40000 ALTER TABLE `uchast_u_spostererezhenni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 16:20:22
