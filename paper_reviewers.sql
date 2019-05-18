-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: paper_reviewers
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `emailaddr` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`emailaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('eu.dolor.egestas@posuereat.org','Nissim','Shaw'),('in.consectetuer.ipsum@vitaeeratvel.net','Ashton','Dixon'),('jaginiakhil@gmail.com','jagini','akhil'),('Maecenas@egestas.edu','Hector','Briggs'),('nisl@mauriseu.edu','Arthur','Leach');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paper` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `authoremail` varchar(50) NOT NULL,
  `abstract` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authoremail` (`authoremail`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`authoremail`) REFERENCES `author` (`emailaddr`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,'Public Health','Political Science.pdf','eu.dolor.egestas@posuereat.org','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'),(2,'Economics','Public Health.pdf','Maecenas@egestas.edu','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'),(3,'Business','Economics.pdf','Maecenas@egestas.edu','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'),(4,'Business','Economics.pdf','in.consectetuer.ipsum@vitaeeratvel.net','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'),(5,'Public Health','Political Science.pdf','eu.dolor.egestas@posuereat.org','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,'),(11,'Business','jagini.pdf','jaginiakhil@gmail.com','blah blah');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meritscore` int(10) NOT NULL,
  `readabilityscore` int(10) NOT NULL,
  `relevancescore` int(10) NOT NULL,
  `orginalityscore` int(10) NOT NULL,
  `paperid` int(10) unsigned NOT NULL,
  `reviewerid` varchar(50) NOT NULL,
  `recommendation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paperid` (`paperid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`paperid`) REFERENCES `paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,5,5,7,1,1,'penatibus@elitAliquam.ca','can publish'),(2,10,3,3,10,2,'lacus.pede.sagittis@diam.com','can publish'),(3,10,2,1,2,3,'Pellentesque.habitant.morbi@risusatfringilla.net','can not publish'),(4,2,5,10,6,4,'enim@ami.co.uk','can publish'),(5,4,1,1,1,5,'lectus.a@nonummyut.net','can publish');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviewer` (
  `emailaddr` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `authorfeedback` varchar(300) DEFAULT NULL,
  `commiteefeedback` varchar(300) DEFAULT NULL,
  `affiliation` varchar(50) DEFAULT NULL,
  `topicid` int(10) unsigned NOT NULL,
  `reviewid` int(10) unsigned NOT NULL,
  `phonenum` varchar(16) NOT NULL,
  PRIMARY KEY (`emailaddr`),
  KEY `topicid` (`topicid`),
  KEY `reviewid` (`reviewid`),
  CONSTRAINT `reviewer_ibfk_1` FOREIGN KEY (`topicid`) REFERENCES `topic` (`id`),
  CONSTRAINT `reviewer_ibfk_2` FOREIGN KEY (`reviewid`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES ('enim@ami.co.uk','Dustin','Dunlap','couldbe better','couldbe better','NJIT',2,2,'146-598-6252'),('lacus.pede.sagittis@diam.com','Kibo','Espinoza','couldbe better','excellent','NYU',5,5,'708-813-1059'),('lectu.a@nonummyut.net','Austin','Beach','excellent','excellent','Stevens institute of technology',4,4,'782-460-6270'),('lectus.a@nonummyut.net','Ezra','Rogers','good','excellent','NYU',3,3,'217-917-2726'),('Pellentesque.habitant.morbi@risusatfringilla.net','Paki','Noel','good','good','Stevens institute of technology',1,1,'332-253-4177');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topicname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Ethics'),(2,'Arts'),(3,'Health'),(4,'Health'),(5,'Government');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-18 18:53:52
