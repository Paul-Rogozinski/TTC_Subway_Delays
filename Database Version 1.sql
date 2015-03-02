-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: teamtrapeznikov
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerts_details`
--

DROP TABLE IF EXISTS `alerts_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts_details` (
  `Alert_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Station_ID` int(11) NOT NULL,
  `Alerts` longtext NOT NULL,
  `Time_of_Alert_Posted` datetime NOT NULL,
  PRIMARY KEY (`Alert_ID`),
  KEY `Station_ID_FK_idx` (`Station_ID`),
  CONSTRAINT `Station_ID_FK` FOREIGN KEY (`Station_ID`) REFERENCES `station_details` (`Station_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts_details`
--

LOCK TABLES `alerts_details` WRITE;
/*!40000 ALTER TABLE `alerts_details` DISABLE KEYS */;
INSERT INTO `alerts_details` VALUES (1,1,'Sbway delayed','2015-01-03 08:24:00');
/*!40000 ALTER TABLE `alerts_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_details`
--

DROP TABLE IF EXISTS `comments_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_details` (
  `Comment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Alert_ID` int(11) NOT NULL,
  `Comments` longtext NOT NULL,
  `Time_of_Comment_Posted` datetime NOT NULL,
  PRIMARY KEY (`Comment_ID`),
  KEY `Alert_ID_FK_idx` (`Alert_ID`),
  CONSTRAINT `Alert_ID_FK` FOREIGN KEY (`Alert_ID`) REFERENCES `alerts_details` (`Alert_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_details`
--

LOCK TABLES `comments_details` WRITE;
/*!40000 ALTER TABLE `comments_details` DISABLE KEYS */;
INSERT INTO `comments_details` VALUES (1,1,'Now cleared','2015-01-03 08:24:00');
/*!40000 ALTER TABLE `comments_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_details`
--

DROP TABLE IF EXISTS `line_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_details` (
  `Line_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Line_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Line_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_details`
--

LOCK TABLES `line_details` WRITE;
/*!40000 ALTER TABLE `line_details` DISABLE KEYS */;
INSERT INTO `line_details` VALUES (1,'Yonge-University'),(2,'Bloor-Danforth'),(3,'Scarborough'),(4,'Sheppard');
/*!40000 ALTER TABLE `line_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_details`
--

DROP TABLE IF EXISTS `station_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_details` (
  `Station_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Station_Name` varchar(45) NOT NULL,
  `Station_Address` varchar(255) NOT NULL,
  `Indicator_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Line_ID` int(11) NOT NULL,
  PRIMARY KEY (`Station_ID`),
  KEY `Line_ID_FK_idx` (`Line_ID`),
  CONSTRAINT `Line_ID_FK` FOREIGN KEY (`Line_ID`) REFERENCES `line_details` (`Line_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_details`
--

LOCK TABLES `station_details` WRITE;
/*!40000 ALTER TABLE `station_details` DISABLE KEYS */;
INSERT INTO `station_details` VALUES (1,'Bathurst','819 Bathurst Street',0,2),(2,'Bay','1240 Bay Street',0,2),(3,'Bayview','550 Sheppard Avenue East',0,4),(4,'Bessarion','731 Sheppard Avenue East',0,4),(5,'Bloor-Yonge','20 Bloor Street East ',0,1),(6,'Bloor-Yonge','20 Bloor Street East ',0,2),(7,'Broadview','769 Broadview Avenue',0,2),(8,'Castle Frank','600 Bloor Street East',0,2),(9,'Chester','22 Chester Avenue',0,2),(10,'Christie','5 Christie Street',0,2),(11,'College','3 Carlton Street',0,1),(12,'Coxwell','355 Strathmore Boulevard',0,2),(13,'Davisville','1900 Yonge Street',0,1),(14,'Don Mills','1700 Sheppard Avenue East',0,4),(15,'Donlands','30 Donlands Avenue',0,2),(16,'Downsview','1035 Sheppard Avenue West',0,1),(17,'Dufferin','1006 Dufferin Street',0,2),(18,'Dundas','3 Dundas Street East',0,1),(19,'Dundas West','2365 Dundas Street West',0,2),(20,'Dupont','263 Dupont Street',0,1),(21,'Eglinton','2190 Yonge Street',0,1),(22,'Eglinton West','1300 Eglinton Avenue West',0,1),(23,'Ellesmere','1025 Ellesmere Road',0,3),(24,'Finch','5600 Yonge Street',0,1),(25,'Glencairn','785 Glencairn Avenue',0,1),(26,'Greenwood','10 Linnsmore Crescent ',0,2),(27,'High Park','35 Quebec Avenue',0,2),(28,'Islington','1226 Islington Avenue',0,2),(29,'Jane','15 Jane Street',0,2),(30,'Keele','21 Keele Street',0,2),(31,'Kennedy','2455 Eglinton Avenue East',0,2),(32,'Kennedy','2455 Eglinton Avenue East',0,3),(33,'King','3 King Street East ',0,1),(34,'Kipling','950 Kipling Avenue',0,2),(35,'Lansdowne','691 Lansdowne Avenue',0,2),(36,'Lawrence','3101 Yonge Street   ',0,1),(37,'Lawrence East','2444 Lawrence Avenue East',0,3),(38,'Lawrence West','665 Lawrence Avenue West',0,1),(39,'Leslie','1209 Sheppard Avenue East',0,4),(40,'Main Street','315 Main Street',0,2),(41,'McCowan','1275 McCowan Road',0,3),(42,'Midland','2085 Midland Avenue',0,3),(43,'Museum','75 Queen\'s Park',0,1),(44,'North York Centre','5102 Yonge Street',0,1),(45,'Old Mill','2672 Bloor Street West',0,2),(46,'Osgoode','181 Queen Street West',0,1),(47,'Ossington','746 Ossington Avenue',0,2),(48,'Pape','743 Pape Avenue',0,2),(49,'Queen','3 Queen Street East',0,1),(50,'Queen\'s Park','129 College Street',0,1),(51,'Rosedale','7 Crescent Road',0,1),(52,'Royal York','955 Royal York Road',0,2),(53,'Runnymede','265 Runnymede Road',0,2),(54,'Scarborough Centre Station','290 Borough Drive',0,3),(55,'Sheppard-Yonge','20 Sheppard Avenue West',0,1),(56,'Sheppard-Yonge','20 Sheppard Avenue West',0,4),(57,'Sherbourne','633 Sherbourne Street',0,2),(58,'Spadina','6 Spadina Road',0,1),(59,'Spadina','6 Spadina Road',0,2),(60,'St Andrew','173 King Street West',0,1),(61,'St Clair','15 Saint Clair Avenue East',0,1),(62,'St Clair West','10 Tichester Road',0,1),(63,'St George','139 Saint George Street',0,1),(64,'St George','139 Saint George Street',0,2),(65,'St Patrick','449 University Avenue ',0,1),(66,'Summerhill','16 Shaftesbury Avenue',0,1),(67,'Union','55 Front Street West',0,1),(68,'Victoria Park','777 Victoria Park Avenue',0,2),(69,'Warden','701 Warden Avenue',0,2),(70,'Wellesly','16 Wellesley Street East',0,1),(71,'Wilson','570 Wilson Avenue',0,1),(72,'Woodbine','991 Woodbine Avenue',0,2),(73,'York Mills','4015 Yonge Street',0,1),(74,'Yorkdale','Yorkdale Road and Yorkdale Service Road',0,1);
/*!40000 ALTER TABLE `station_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'teamtrapeznikov'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-01 21:07:51
