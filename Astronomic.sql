-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: astronomical_observations
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
-- Temporary table structure for view `astro_rezultatu`
--

DROP TABLE IF EXISTS `astro_rezultatu`;
/*!50001 DROP VIEW IF EXISTS `astro_rezultatu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `astro_rezultatu` AS SELECT
 1 AS `tryvalist_god`,
  1 AS `nazva_teleskopa`,
  1 AS `nazva_obiekta`,
  1 AS `kilkist_rezultativ` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ekspedyciya`
--

DROP TABLE IF EXISTS `ekspedyciya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ekspedyciya` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(255) NOT NULL,
  `Lokaciya` varchar(255) NOT NULL,
  `Data_pochatku` date NOT NULL,
  `Data_zavershennya` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_ekspedyciya_nazva` (`Nazva`),
  KEY `idx_ekspedyciya_lokaciya` (`Lokaciya`),
  KEY `idx_ekspedyciya_daty` (`Data_pochatku`,`Data_zavershennya`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekspedyciya`
--

LOCK TABLES `ekspedyciya` WRITE;
/*!40000 ALTER TABLE `ekspedyciya` DISABLE KEYS */;
INSERT INTO `ekspedyciya` VALUES (1,'Zymova_Ekspedyciya','Antarktyda','2025-01-10','2025-02-15'),(2,'Vesnyana_Misciya','Karpaty','2025-04-05','2025-04-20'),(3,'Lytni_Sposterezhennya','Crimea','2025-07-01','2025-07-30'),(4,'Osinnya_Ekspedyciya','Kharkiv','2025-10-01','2025-10-15'),(5,'Nochna_Misciya','Lviv','2025-11-05','2025-11-06');
/*!40000 ALTER TABLE `ekspedyciya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ekspedyciynyy_zvjazok`
--

DROP TABLE IF EXISTS `ekspedyciynyy_zvjazok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ekspedyciynyy_zvjazok` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ekspedyciyi` int(11) NOT NULL,
  `ID_sposterezhennya` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_zvjazok_ekspedyciya` (`ID_ekspedyciyi`),
  KEY `idx_zvjazok_sposterezhennya` (`ID_sposterezhennya`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ekspedyciynyy_zvjazok`
--

LOCK TABLES `ekspedyciynyy_zvjazok` WRITE;
/*!40000 ALTER TABLE `ekspedyciynyy_zvjazok` DISABLE KEYS */;
INSERT INTO `ekspedyciynyy_zvjazok` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `ekspedyciynyy_zvjazok` ENABLE KEYS */;
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
  `Email` varchar(255) DEFAULT NULL,
  `Specializaciya` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_naukovec_email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naukovec`
--

LOCK TABLES `naukovec` WRITE;
/*!40000 ALTER TABLE `naukovec` DISABLE KEYS */;
INSERT INTO `naukovec` VALUES (1,'Ivan',' Petrenko',' ivan@astro.ua',' Astronomiya\r'),(2,'Olena',' Koval',' olena@astro.ua',' Fizika\r'),(3,'Taras',' Shevchenko',' taras@astro.ua',' Kosmohrafiya\r'),(4,'Petro',' Zvizlo',' petya3@astro.ua',' Astrofizuka\r'),(5,'Maksum',' Ignatenko',' ignat@astro.ua',' Kosmohrafiya');
/*!40000 ALTER TABLE `naukovec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nebesnyj_obiekt`
--

DROP TABLE IF EXISTS `nebesnyj_obiekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nebesnyj_obiekt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(255) NOT NULL,
  `Typ` varchar(255) DEFAULT NULL CHECK (`Typ` in ('zirka','planeta','galaktyka')),
  `Vidstan_svitlovyh_rokiv` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nazva` (`Nazva`),
  UNIQUE KEY `idx_nebesnyj_nazva` (`Nazva`),
  KEY `idx_nebesnyj_typ` (`Typ`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nebesnyj_obiekt`
--

LOCK TABLES `nebesnyj_obiekt` WRITE;
/*!40000 ALTER TABLE `nebesnyj_obiekt` DISABLE KEYS */;
INSERT INTO `nebesnyj_obiekt` VALUES (1,'Sirius','zirka',8.6),(2,'Mars','planeta',0.0000158),(3,'Andromeda','galaktyka',2537000),(4,'Betelgeuse','zirka',642.5),(5,'Jupiter','planeta',0.000082);
/*!40000 ALTER TABLE `nebesnyj_obiekt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezultat`
--

DROP TABLE IF EXISTS `rezultat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezultat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Znachennya` float NOT NULL,
  `Odyinycya_vymiru` varchar(50) NOT NULL,
  `Opys` varchar(255) DEFAULT NULL,
  `ID_sposterezhennya` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_sposterezhennya` (`ID_sposterezhennya`),
  KEY `idx_rezultat_sposterezhennya` (`ID_sposterezhennya`),
  KEY `idx_rezultat_znachennya` (`Znachennya`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezultat`
--

LOCK TABLES `rezultat` WRITE;
/*!40000 ALTER TABLE `rezultat` DISABLE KEYS */;
INSERT INTO `rezultat` VALUES (1,12.5,'mag','Yaskravist_zirk',1),(2,0.98,'AU','Vidstan_do_planety',2),(3,3.2,'mag','Zahalna_yaskravist_galaktyky',3),(4,1.1,'mag','Yaskravist_Betelgeuse',4),(5,5.2,'AU','Vidstan_do_Jupiter',5);
/*!40000 ALTER TABLE `rezultat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sposterezhennya`
--

DROP TABLE IF EXISTS `sposterezhennya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sposterezhennya` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Umovy_pogody` varchar(255) DEFAULT NULL,
  `tryvalist_god` float NOT NULL,
  `ID_ekspedyciyi` int(11) NOT NULL,
  `ID_teleskopa` int(11) NOT NULL,
  `ID_obiekta` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_sposterezhennya_data` (`Data`),
  KEY `idx_sposterezhennya_ekspedyciya` (`ID_ekspedyciyi`),
  KEY `idx_sposterezhennya_teleskop` (`ID_teleskopa`),
  KEY `idx_sposterezhennya_obiekt` (`ID_obiekta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sposterezhennya`
--

LOCK TABLES `sposterezhennya` WRITE;
/*!40000 ALTER TABLE `sposterezhennya` DISABLE KEYS */;
INSERT INTO `sposterezhennya` VALUES (1,'2025-01-12','Yasno',5.5,1,1,1),(2,'2025-04-06','Khmarno',3,2,2,2),(3,'2025-07-02','Chyste_nebo',6,3,3,3),(4,'2025-10-02','Tumanno',2.5,4,5,4),(5,'2025-11-05','Yasno',4,5,1,5);
/*!40000 ALTER TABLE `sposterezhennya` ENABLE KEYS */;
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
  `Typ` varchar(255) NOT NULL,
  `Diametr_dzerkala` float NOT NULL,
  `Koordinaty` varchar(255) NOT NULL,
  `Misce_rozmischennya` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_teleskop_nazva` (`Nazva`),
  KEY `idx_teleskop_typ` (`Typ`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teleskop`
--

LOCK TABLES `teleskop` WRITE;
/*!40000 ALTER TABLE `teleskop` DISABLE KEYS */;
INSERT INTO `teleskop` VALUES (1,'Lviv-1','Refraktor',0.8,'49.8397N_24.0297E','Lviv_Observatory\r'),(2,'Kyiv-2','Reflektor',1.2,'50.4501N_30.5234E','Kyiv_Astrocenter\r'),(3,'Crimea-3','Kombinovanyy',2,'44.9521N_34.1024E','Crimean_Station\r'),(4,'Poltava-4','Refraktor',0.6,'49.5883N_34.5514E','Poltava_Lab\r'),(5,'Kharkiv-5','Reflektor',1.5,'49.9935N_36.2304E','Kharkiv_Astropark\r');
/*!40000 ALTER TABLE `teleskop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uchast_u_sposterezhenni`
--

DROP TABLE IF EXISTS `uchast_u_sposterezhenni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uchast_u_sposterezhenni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_sposterezhennya` int(11) NOT NULL,
  `ID_naukovcya` int(11) NOT NULL,
  `Rol` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_uchast_sposterezhennya` (`ID_sposterezhennya`),
  KEY `idx_uchast_naukovec` (`ID_naukovcya`),
  KEY `idx_uchast_rol` (`Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uchast_u_sposterezhenni`
--

LOCK TABLES `uchast_u_sposterezhenni` WRITE;
/*!40000 ALTER TABLE `uchast_u_sposterezhenni` DISABLE KEYS */;
INSERT INTO `uchast_u_sposterezhenni` VALUES (1,1,1,'Kerivnyk\r'),(2,1,2,'Asystent\r'),(3,2,3,'Sposterigach\r'),(4,3,4,'Analitik\r'),(5,5,5,'Koordinator\r');
/*!40000 ALTER TABLE `uchast_u_sposterezhenni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `astro_rezultatu`
--

/*!50001 DROP VIEW IF EXISTS `astro_rezultatu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `astro_rezultatu` AS select `sposterezhennya`.`tryvalist_god` AS `tryvalist_god`,`teleskop`.`Nazva` AS `nazva_teleskopa`,`nebesnyj_obiekt`.`Nazva` AS `nazva_obiekta`,count(`rezultat`.`ID`) AS `kilkist_rezultativ` from (((`sposterezhennya` join `teleskop` on(`sposterezhennya`.`ID_teleskopa` = `teleskop`.`ID`)) join `nebesnyj_obiekt` on(`sposterezhennya`.`ID_obiekta` = `nebesnyj_obiekt`.`ID`)) join `rezultat` on(`sposterezhennya`.`ID` = `rezultat`.`ID_sposterezhennya`)) group by `sposterezhennya`.`tryvalist_god` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-07 11:10:07
