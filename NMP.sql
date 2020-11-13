-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dumbahanjo
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `allplaylist`
--

DROP TABLE IF EXISTS `allplaylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allplaylist` (
  `pl_no` int NOT NULL AUTO_INCREMENT,
  `m_id` varchar(50) NOT NULL,
  `pl_name` varchar(300) NOT NULL,
  PRIMARY KEY (`pl_no`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `allplaylist_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allplaylist`
--

LOCK TABLES `allplaylist` WRITE;
/*!40000 ALTER TABLE `allplaylist` DISABLE KEYS */;
INSERT INTO `allplaylist` VALUES (1,'a','a 리스트입니다! 1'),(2,'a','a play 22'),(3,'b','b 리스트이에영'),(4,'a','a의 리스트 3!!!@@@'),(5,'둠바','비오는날 드라이브'),(6,'hanjo8813','밤에 듣고싶은 노래'),(7,'hanjo8813','씻을 때 듣는 노래'),(8,'dbmaster','30대 노래리스트'),(9,'ghis22130','몽환적인 노래들'),(10,'a','너무슬퍼요'),(11,'a','오토바이 탈때 들어야지');
/*!40000 ALTER TABLE `allplaylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeling`
--

DROP TABLE IF EXISTS `feeling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeling` (
  `feel_name` varchar(30) NOT NULL,
  PRIMARY KEY (`feel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeling`
--

LOCK TABLES `feeling` WRITE;
/*!40000 ALTER TABLE `feeling` DISABLE KEYS */;
INSERT INTO `feeling` VALUES ('달달한'),('몽환적'),('슬픈'),('신나는'),('잔잔한');
/*!40000 ALTER TABLE `feeling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_name` varchar(30) NOT NULL,
  PRIMARY KEY (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('R&B'),('Soul'),('댄스'),('록'),('발라드'),('트로트'),('포크'),('힙합');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `m_id` varchar(50) NOT NULL,
  `m_pwd` varchar(50) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_age` int DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('a','123','a',25),('b','b','b',26),('c','a','a',33),('dbmaster','1','1',36),('Dumba','zpfldj','김지수',22),('Dumbabab','zpfldj','신현욱',24),('ghis22130','zpfldj12','김지수',23),('hanjo8813','a','한재원',27),('HHUi','zpfldj','김지수',22),('Huiba','zpfldj','김지지',22),('둠바','zpfldj','김지수',25);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist1`
--

DROP TABLE IF EXISTS `playlist1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist1` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist1_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist1_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist1`
--

LOCK TABLES `playlist1` WRITE;
/*!40000 ALTER TABLE `playlist1` DISABLE KEYS */;
INSERT INTO `playlist1` VALUES (1,1,11),(2,1,12),(3,1,13);
/*!40000 ALTER TABLE `playlist1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist10`
--

DROP TABLE IF EXISTS `playlist10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist10` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist10_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist10_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist10`
--

LOCK TABLES `playlist10` WRITE;
/*!40000 ALTER TABLE `playlist10` DISABLE KEYS */;
INSERT INTO `playlist10` VALUES (1,10,40),(2,10,41),(3,10,42),(4,10,43),(5,10,44),(6,10,45),(7,10,46),(8,10,47),(9,10,48),(10,10,49),(11,10,50),(12,10,51),(13,10,153),(14,10,306),(15,10,307),(16,10,308),(17,10,309),(18,10,310),(19,10,311),(20,10,312),(21,10,314),(22,10,315),(23,10,433),(24,10,484),(25,10,491),(26,10,492),(27,10,493);
/*!40000 ALTER TABLE `playlist10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist11`
--

DROP TABLE IF EXISTS `playlist11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist11` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist11_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist11_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist11`
--

LOCK TABLES `playlist11` WRITE;
/*!40000 ALTER TABLE `playlist11` DISABLE KEYS */;
INSERT INTO `playlist11` VALUES (1,11,40),(2,11,41),(3,11,42),(4,11,43),(5,11,44),(6,11,45),(7,11,46),(8,11,47),(9,11,48),(10,11,49),(11,11,50),(12,11,51),(13,11,153),(14,11,306),(15,11,307),(16,11,308),(17,11,309),(18,11,310),(19,11,311),(20,11,312),(21,11,314),(22,11,315),(23,11,433),(24,11,484),(25,11,491),(26,11,492),(27,11,493),(28,11,52);
/*!40000 ALTER TABLE `playlist11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist2`
--

DROP TABLE IF EXISTS `playlist2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist2` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist2_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist2_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist2`
--

LOCK TABLES `playlist2` WRITE;
/*!40000 ALTER TABLE `playlist2` DISABLE KEYS */;
INSERT INTO `playlist2` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,8),(8,2,9),(9,2,10);
/*!40000 ALTER TABLE `playlist2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist3`
--

DROP TABLE IF EXISTS `playlist3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist3` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist3_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist3_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist3`
--

LOCK TABLES `playlist3` WRITE;
/*!40000 ALTER TABLE `playlist3` DISABLE KEYS */;
INSERT INTO `playlist3` VALUES (1,3,27),(2,3,28);
/*!40000 ALTER TABLE `playlist3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist4`
--

DROP TABLE IF EXISTS `playlist4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist4` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist4_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist4_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist4`
--

LOCK TABLES `playlist4` WRITE;
/*!40000 ALTER TABLE `playlist4` DISABLE KEYS */;
INSERT INTO `playlist4` VALUES (1,4,40),(2,4,42),(3,4,46),(4,4,48),(5,4,50),(6,4,51),(7,4,26);
/*!40000 ALTER TABLE `playlist4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist5`
--

DROP TABLE IF EXISTS `playlist5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist5` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist5_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist5_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist5`
--

LOCK TABLES `playlist5` WRITE;
/*!40000 ALTER TABLE `playlist5` DISABLE KEYS */;
INSERT INTO `playlist5` VALUES (1,5,40),(2,5,42),(3,5,44),(4,5,46),(5,5,48),(6,5,50),(7,5,51);
/*!40000 ALTER TABLE `playlist5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist6`
--

DROP TABLE IF EXISTS `playlist6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist6` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist6_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist6_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist6`
--

LOCK TABLES `playlist6` WRITE;
/*!40000 ALTER TABLE `playlist6` DISABLE KEYS */;
INSERT INTO `playlist6` VALUES (1,6,10),(2,6,52);
/*!40000 ALTER TABLE `playlist6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist7`
--

DROP TABLE IF EXISTS `playlist7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist7` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist7_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist7_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist7`
--

LOCK TABLES `playlist7` WRITE;
/*!40000 ALTER TABLE `playlist7` DISABLE KEYS */;
INSERT INTO `playlist7` VALUES (1,7,14),(2,7,15),(3,7,16),(4,7,18),(5,7,55),(6,7,61);
/*!40000 ALTER TABLE `playlist7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist8`
--

DROP TABLE IF EXISTS `playlist8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist8` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist8_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist8_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist8`
--

LOCK TABLES `playlist8` WRITE;
/*!40000 ALTER TABLE `playlist8` DISABLE KEYS */;
INSERT INTO `playlist8` VALUES (1,8,184),(2,8,185),(3,8,186),(4,8,191),(5,8,298),(6,8,299),(7,8,301),(8,8,302),(9,8,303),(10,8,373),(11,8,374),(12,8,375),(13,8,376),(14,8,380),(15,8,381),(16,8,388),(17,8,389),(18,8,390);
/*!40000 ALTER TABLE `playlist8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist9`
--

DROP TABLE IF EXISTS `playlist9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist9` (
  `pl_id` int NOT NULL AUTO_INCREMENT,
  `pl_no` int DEFAULT NULL,
  `song_no` int NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `pl_no` (`pl_no`),
  KEY `song_no` (`song_no`),
  CONSTRAINT `playlist9_ibfk_1` FOREIGN KEY (`pl_no`) REFERENCES `allplaylist` (`pl_no`) ON DELETE CASCADE,
  CONSTRAINT `playlist9_ibfk_2` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist9`
--

LOCK TABLES `playlist9` WRITE;
/*!40000 ALTER TABLE `playlist9` DISABLE KEYS */;
INSERT INTO `playlist9` VALUES (1,9,40),(2,9,41),(3,9,42),(4,9,43),(5,9,44),(6,9,45),(7,9,46),(8,9,47),(9,9,48),(10,9,49),(11,9,50),(12,9,51),(13,9,153),(14,9,306),(15,9,307),(16,9,308),(17,9,309),(18,9,310),(19,9,311),(20,9,312),(21,9,314),(22,9,315),(23,9,433),(24,9,484),(25,9,491),(26,9,492),(27,9,493),(28,9,52);
/*!40000 ALTER TABLE `playlist9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer2song`
--

DROP TABLE IF EXISTS `singer2song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singer2song` (
  `song_no` int NOT NULL,
  `sing_no` int NOT NULL,
  PRIMARY KEY (`song_no`,`sing_no`),
  KEY `sing_no` (`sing_no`),
  CONSTRAINT `singer2song_ibfk_1` FOREIGN KEY (`song_no`) REFERENCES `song` (`song_no`) ON DELETE CASCADE,
  CONSTRAINT `singer2song_ibfk_2` FOREIGN KEY (`sing_no`) REFERENCES `singerinfo` (`singer_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer2song`
--

LOCK TABLES `singer2song` WRITE;
/*!40000 ALTER TABLE `singer2song` DISABLE KEYS */;
INSERT INTO `singer2song` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,4),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(52,6),(53,6),(54,6),(55,6),(56,6),(57,6),(58,6),(59,6),(60,6),(61,6),(144,14),(145,14),(146,14),(147,14),(148,14),(149,14),(150,14),(151,14),(152,14),(153,14),(180,19),(184,19),(185,19),(186,19),(187,19),(188,19),(189,19),(191,19),(192,19),(248,27),(255,27),(256,27),(257,27),(259,27),(260,27),(261,27),(262,27),(263,27),(264,27),(296,31),(297,31),(298,31),(299,31),(300,31),(301,31),(302,31),(303,31),(304,31),(305,31),(306,32),(307,32),(308,32),(309,32),(310,32),(311,32),(312,32),(313,32),(314,32),(315,32),(364,38),(365,38),(366,38),(367,38),(368,38),(369,38),(370,38),(371,38),(372,38),(373,38),(374,39),(375,39),(376,39),(377,39),(378,39),(379,39),(380,39),(381,39),(382,39),(383,39),(384,40),(385,40),(386,40),(387,40),(388,40),(389,40),(390,40),(391,40),(392,40),(393,40),(424,44),(425,44),(426,44),(427,44),(428,44),(429,44),(430,44),(431,44),(432,44),(433,44),(484,51),(485,51),(486,51),(487,51),(488,51),(489,51),(490,51),(491,51),(492,51),(493,51);
/*!40000 ALTER TABLE `singer2song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singerinfo`
--

DROP TABLE IF EXISTS `singerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singerinfo` (
  `singer_no` int NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(30) NOT NULL,
  `singer_sex` varchar(5) NOT NULL,
  PRIMARY KEY (`singer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singerinfo`
--

LOCK TABLES `singerinfo` WRITE;
/*!40000 ALTER TABLE `singerinfo` DISABLE KEYS */;
INSERT INTO `singerinfo` VALUES (1,'김광석','남성'),(2,'장혜진','여성'),(3,'한동근','남성'),(4,'권진아','여성'),(5,'창모','남성'),(6,'아이유','여성'),(7,'트와이스','여성'),(8,'오마이걸','여성'),(9,'백현','남성'),(10,'볼빨간사춘기','여성'),(11,'방탄소년단','남성'),(12,'규현','남성'),(13,'엠씨더맥스','남성'),(14,'임영웅','남성'),(15,'장범준','남성'),(16,'버스커버스커','남성'),(17,'송가인','여성'),(18,'자우림','여성'),(19,'YB','남성'),(20,'휘인','여성'),(21,'마마무','여성'),(22,'지코','남성'),(23,'EXO','남성'),(24,'태연','여성'),(25,'노을','남성'),(26,'오반','남성'),(27,'Crush','남성'),(28,'로꼬','남성'),(29,'레드벨벳','여성'),(30,'폴킴','남성'),(31,'비','남성'),(32,'영탁','남성'),(33,'악동뮤지션','혼성'),(34,'청하','여성'),(35,'팔로알토','남성'),(36,'빈지노','남성'),(37,'박재범','남성'),(38,'다이나믹듀오','남성'),(39,'임재범','남성'),(40,'부활','남성'),(41,'이승철','남성'),(42,'허각','남성'),(43,'MC몽','남성'),(44,'빅뱅','남성'),(45,'로이킴','남성'),(46,'벤','여성'),(47,'거미','여성'),(48,'케이윌','남성'),(49,'윤미래','여성'),(50,'다비치','여성'),(51,'혁오','남성'),(52,'정승환','남성'),(53,'블랙핑크','여성'),(54,'에일리','여성'),(55,'수란','여성'),(56,'헤이즈','여성'),(57,'에픽하이','남성'),(58,'멜로망스','남성'),(59,'우원재','남성'),(60,'윤종신','남성'),(61,'정준일','남성'),(62,'이적','남성'),(63,'버즈','남성'),(64,'성시경','남성'),(65,'박효신','남성'),(66,'이승기','남성'),(67,'김범수','남성'),(68,'어반자카파','혼성'),(69,'브라운 아이즈','남성'),(70,'김종국','남성'),(71,'백지영','여성'),(72,'어쿠스틱콜라보','여성'),(73,'잔나비','남성'),(74,'이문세','남성'),(75,'조용필','남성'),(76,'김건모','남성'),(77,'임창정','남성'),(78,'윤하','여성'),(79,'이소라','여성'),(80,'정인','여성'),(81,'리쌍','남성'),(82,'이수영','여성'),(83,'이선희','여성'),(84,'보아','여성'),(85,'신화','남성'),(86,'동방신기','남성'),(87,'박진영','남성'),(88,'넬','남성'),(89,'체리필터','여성'),(90,'백예린','여성'),(91,'이하이','여성'),(92,'장재인','여성'),(93,'아이들','여성'),(94,'데이식스','남성'),(95,'황인욱','남성'),(96,'염따','남성'),(97,'10CM','남성'),(98,'스윙스','남성'),(99,'김동률','남성'),(100,'태진아','남성');
/*!40000 ALTER TABLE `singerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `song_no` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(30) NOT NULL,
  `song_gen` varchar(30) NOT NULL,
  `song_year` int NOT NULL,
  `song_country` varchar(30) NOT NULL,
  `song_feel` varchar(30) NOT NULL,
  PRIMARY KEY (`song_no`),
  KEY `song_gen` (`song_gen`),
  KEY `song_feel` (`song_feel`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`song_gen`) REFERENCES `genre` (`genre_name`) ON DELETE CASCADE,
  CONSTRAINT `song_ibfk_2` FOREIGN KEY (`song_feel`) REFERENCES `feeling` (`feel_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'이등병의 편지','포크',1993,'K-POP','슬픈'),(2,'사랑이라는 이유로','포크',1993,'K-POP','잔잔한'),(3,'사랑했지만','포크',1993,'K-POP','잔잔한'),(4,'그날들','포크',1993,'K-POP','슬픈'),(5,'너에게','포크',1993,'K-POP','잔잔한'),(6,'슬픈 노래','포크',1993,'K-POP','슬픈'),(7,'거리 에서','포크',1993,'K-POP','슬픈'),(8,'말하지 못한 내사랑','포크',1993,'K-POP','잔잔한'),(9,'그루 터기','포크',1993,'K-POP','잔잔한'),(10,'광야에서','포크',1993,'K-POP','잔잔한'),(11,'아름다운 날들','발라드',2001,'K-POP','잔잔한'),(12,'1994년 어느 늦은 밤','발라드',2001,'K-POP','잔잔한'),(13,'꿈의 대화','발라드',2001,'K-POP','몽환적'),(14,'불꽃','발라드',2007,'K-POP','슬픈'),(15,'비가 내리는 날','발라드',2007,'K-POP','슬픈'),(16,'가라 사랑아','댄스',2007,'K-POP','신나는'),(17,'마주치지 말자','발라드',2006,'K-POP','슬픈'),(18,'왜 나만 아프죠','발라드',2006,'K-POP','슬픈'),(19,'술이 문제야','발라드',2019,'K-POP','슬픈'),(20,'보통 같으면','발라드',2020,'K-POP','잔잔한'),(21,'한숨','발라드',2018,'K-POP','슬픈'),(22,'안 될 사랑','발라드',2017,'K-POP','슬픈'),(23,'잘 헤어진 거야','발라드',2020,'K-POP','슬픈'),(24,'초','발라드',2020,'K-POP','슬픈'),(25,'미치고 싶다','발라드',2017,'K-POP','슬픈'),(26,'그저 사랑한다면','발라드',2020,'K-POP','슬픈'),(27,'이 소설의 끝을 다시 써보려 해','발라드',2014,'K-POP','슬픈'),(28,'읽지않음','발라드',2014,'K-POP','슬픈'),(29,'그대라는 사치','발라드',2016,'K-POP','슬픈'),(30,'끝','발라드',2016,'K-POP','슬픈'),(31,'이별 뒷변','발라드',2018,'K-POP','슬픈'),(32,'Fly away','R&B',2017,'K-POP','잔잔한'),(33,'운이 좋았지','발라드',2019,'K-POP','슬픈'),(34,'시계 바늘','발라드',2019,'K-POP','잔잔한'),(35,'위로','발라드',2019,'K-POP','잔잔한'),(36,'뭔가 잘못됐어','발라드',2020,'K-POP','잔잔한'),(37,'Lonely Night','발라드',2020,'K-POP','잔잔한'),(38,'별처럼','발라드',2020,'K-POP','잔잔한'),(39,'오늘 뭐 했는지 말해봐','발라드',2020,'K-POP','잔잔한'),(40,'동네 놈들','힙합',2018,'K-POP','몽환적'),(41,'Selfmade Orange','힙합',2018,'K-POP','신나는'),(42,'아름다워','힙합',2016,'K-POP','몽환적'),(43,'마에스트로','힙합',2016,'K-POP','신나는'),(44,'돈이 하게 했어','힙합',2016,'K-POP','몽환적'),(45,'아이야','힙합',2016,'K-POP','신나는'),(46,'I Always','힙합',2017,'K-POP','몽환적'),(47,'Swoosh Flow','힙합',2020,'K-POP','신나는'),(48,'meet me in Toronto','힙합',2019,'K-POP','몽환적'),(49,'METEOR','힙합',2019,'K-POP','신나는'),(50,'빌었어','힙합',2019,'K-POP','몽환적'),(51,'COUNTIN MY GUAP','힙합',2020,'K-POP','몽환적'),(52,'Blueming','록',2019,'K-POP','신나는'),(53,'Love poem','발라드',2019,'K-POP','몽환적'),(54,'팔레트','Soul',2017,'K-POP','몽환적'),(55,'좋은 날','댄스',2010,'K-POP','신나는'),(56,'밤 편지','발라드',2017,'K-POP','잔잔한'),(57,'삐삐','R&B',2018,'K-POP','잔잔한'),(58,'마음을 드려요','발라드',2020,'K-POP','잔잔한'),(59,'에잇','록',2020,'K-POP','몽환적'),(60,'스물셋','댄스',2015,'K-POP','신나는'),(61,'너랑 나','댄스',2011,'K-POP','신나는'),(62,'FANCY','댄스',2019,'K-POP','신나는'),(63,'Heart Shaker','댄스',2017,'K-POP','신나는'),(64,'MORE&MORE','댄스',2020,'K-POP','신나는'),(65,'CHEER UP','댄스',2016,'K-POP','신나는'),(66,'SIGNAL','댄스',2017,'K-POP','신나는'),(67,'Dance The Night Away','댄스',2018,'K-POP','신나는'),(68,'TT','댄스',2016,'K-POP','신나는'),(69,'KNOCK KNOCK','댄스',2017,'K-POP','신나는'),(70,'LIKEY','댄스',2017,'K-POP','신나는'),(71,'What is Love?','댄스',2018,'K-POP','신나는'),(72,'내 얘길 들어봐','댄스',2016,'K-POP','신나는'),(73,'비밀 정원','댄스',2018,'K-POP','신나는'),(74,'CLOSER','댄스',2015,'K-POP','몽환적'),(75,'컬러링북','댄스',2017,'K-POP','신나는'),(76,'Dolphin','댄스',2020,'K-POP','신나는'),(77,'살짝 설렜어','댄스',2020,'K-POP','신나는'),(78,'불꽃 놀이','댄스',2018,'K-POP','신나는'),(79,'BUNGEE','댄스',2019,'K-POP','신나는'),(80,'한 발짝 두 발짝','댄스',2016,'K-POP','신나는'),(81,'다섯 번째 계절','댄스',2019,'K-POP','신나는'),(82,'너를 사랑하고 있어','발라드',2020,'K-POP','잔잔한'),(83,'바래다줄게','발라드',2017,'K-POP','잔잔한'),(84,'두근거려','발라드',2015,'K-POP','잔잔한'),(85,'너에게 가는 이 길 위에서','발라드',2020,'K-POP','잔잔한'),(86,'UN Village','Soul',2019,'K-POP','몽환적'),(87,'Candy','Soul',2020,'K-POP','몽환적'),(88,'Love Again','Soul',2020,'K-POP','잔잔한'),(89,'Bungee','Soul',2020,'K-POP','몽환적'),(90,'Poppin','Soul',2020,'K-POP','몽환적'),(91,'Ghost','Soul',2020,'K-POP','신나는'),(92,'나만, 봄','포크',2019,'K-POP','잔잔한'),(93,'품','포크',2020,'K-POP','달달한'),(94,'나비와 고양이','포크',2020,'K-POP','달달한'),(95,'우주를 줄게','포크',2016,'K-POP','달달한'),(96,'나만 안되는 연애','포크',2016,'K-POP','잔잔한'),(97,'좋다고 말해','포크',2016,'K-POP','달달한'),(98,'심술','포크',2016,'K-POP','달달한'),(99,'썸 탈꺼야','포크',2017,'K-POP','달달한'),(100,'나의 사춘기에게','포크',2017,'K-POP','잔잔한'),(101,'여행','포크',2018,'K-POP','신나는'),(102,'워커홀릭','포크',2019,'K-POP','몽환적'),(103,'#첫사랑','포크',2018,'K-POP','잔잔한'),(104,'I NEED U','댄스',2015,'K-POP','신나는'),(105,'불타오르네','댄스',2016,'K-POP','신나는'),(106,'IDOL','댄스',2018,'K-POP','신나는'),(107,'DNA','댄스',2017,'K-POP','신나는'),(108,'FAKE LOVE','댄스',2018,'K-POP','신나는'),(109,'ON','댄스',2020,'K-POP','신나는'),(110,'작은 것들을 위한 시','댄스',2019,'K-POP','신나는'),(111,'소우주','댄스',2019,'K-POP','몽환적'),(112,'피 땀 눈물','댄스',2016,'K-POP','몽환적'),(113,'봄날','발라드',2017,'K-POP','잔잔한'),(114,'하루종일','발라드',2020,'K-POP','잔잔한'),(115,'여전히 아늑해','발라드',2017,'K-POP','잔잔한'),(116,'애월리','발라드',2019,'K-POP','잔잔한'),(117,'우리가 사랑한 시간','발라드',2015,'K-POP','잔잔한'),(118,'다시 만나는 날','발라드',2017,'K-POP','잔잔한'),(119,'밀리언조각','발라드',2015,'K-POP','잔잔한'),(120,'화려하지 않은 고백','발라드',2020,'K-POP','달달한'),(121,'광화문에서','발라드',2014,'K-POP','잔잔한'),(122,'깊은 밤을 날아서','발라드',2014,'K-POP','달달한'),(123,'7년간의 사랑','발라드',2009,'K-POP','잔잔한'),(124,'처음처럼','발라드',2020,'K-POP','슬픈'),(125,'넘쳐흘러','록',2019,'K-POP','슬픈'),(126,'사계','록',2019,'K-POP','슬픈'),(127,'One Love','록',2002,'K-POP','슬픈'),(128,'잠시만 안녕','록',2002,'K-POP','슬픈'),(129,'어디에도','록',2016,'K-POP','슬픈'),(130,'행복하지 말아요','록',2004,'K-POP','슬픈'),(131,'그대가 분다','록',2014,'K-POP','슬픈'),(132,'백야','록',2014,'K-POP','슬픈'),(133,'My Way','록',2017,'K-POP','슬픈'),(134,'보라빛 엽서','트로트',2020,'K-POP','슬픈'),(135,'바램','트로트',2020,'K-POP','잔잔한'),(136,'이제 나만 믿어요','트로트',2020,'K-POP','잔잔한'),(137,'어느 60대 노부부이야기','트로트',2020,'K-POP','잔잔한'),(138,'미워요','트로트',2016,'K-POP','슬픈'),(139,'응급실','트로트',2020,'K-POP','슬픈'),(140,'상사화','트로트',2020,'K-POP','잔잔한'),(141,'마범의 성','트로트',2020,'K-POP','잔잔한'),(142,'아로하','트로트',2020,'K-POP','잔잔한'),(143,'비상','트로트',2020,'K-POP','슬픈'),(144,'흔들리는 꽃들 속에서 네 샴푸향이 느껴진거야','록',2019,'K-POP','달달한'),(145,'사랑이란 말이 어울리는 사람','록',2014,'K-POP','달달한'),(146,'사랑에 빠졌죠','록',2016,'K-POP','달달한'),(147,'빗속으로','록',2016,'K-POP','달달한'),(148,'봄비','록',2016,'K-POP','달달한'),(149,'그녀가 곁에 없다면','록',2016,'K-POP','달달한'),(150,'홍대와 건대 사이','록',2016,'K-POP','달달한'),(151,'노래방에서','록',2019,'K-POP','달달한'),(152,'당신과는 천천히','록',2019,'K-POP','달달한'),(153,'일산으로','록',2019,'K-POP','잔잔한'),(154,'꽃송이가','록',2012,'K-POP','달달한'),(155,'여수 밤바다','록',2012,'K-POP','잔잔한'),(156,'첫사랑','록',2012,'K-POP','달달한'),(157,'벚꽃 엔딩','록',2012,'K-POP','달달한'),(158,'향수','록',2012,'K-POP','달달한'),(159,'정말로 사랑한다면','록',2012,'K-POP','달달한'),(160,'그댈 마주하는건 힘들어','록',2012,'K-POP','달달한'),(161,'처음엔 사랑이란게','록',2013,'K-POP','달달한'),(162,'동경소녀','록',2011,'K-POP','달달한'),(163,'정류장','록',2011,'K-POP','달달한'),(164,'용두산 엘레지','트로트',2019,'K-POP','신나는'),(165,'한 많은 대동강','트로트',2019,'K-POP','신나는'),(166,'무명배우','트로트',2019,'K-POP','신나는'),(167,'단장의 미아리 고개','트로트',2019,'K-POP','슬픈'),(168,'내 마음의 사진','발라드',2020,'K-POP','슬픈'),(169,'서울의 달','트로트',2019,'K-POP','슬픈'),(170,'가인이어라','트로트',2019,'K-POP','신나는'),(171,'엄마아리랑','트로트',2019,'K-POP','신나는'),(172,'이별의 영동선','트로트',2019,'K-POP','신나는'),(173,'목포의 눈물','트로트',2016,'K-POP','슬픈'),(174,'미안해 널 미워해','록',1998,'K-POP','슬픈'),(175,'낙화','록',1998,'K-POP','슬픈'),(176,'청춘예찬','록',2005,'K-POP','슬픈'),(177,'스물다섯, 스물하나','록',2013,'K-POP','슬픈'),(178,'Hey, Hey, Hey','록',2001,'K-POP','신나는'),(179,'하하하쏭','록',2010,'K-POP','신나는'),(180,'매직 카펫 라이드','록',2000,'K-POP','신나는'),(181,'일탈','록',1997,'K-POP','신나는'),(182,'있지','록',2018,'K-POP','슬픈'),(183,'팬이야','록',2002,'K-POP','신나는'),(184,'너를 보내고','록',1999,'K-POP','잔잔한'),(185,'담배가게 아가씨','록',1999,'K-POP','신나는'),(186,'그것만이 내 세상','록',1999,'K-POP','잔잔한'),(187,'흰수염고래','록',2011,'K-POP','잔잔한'),(188,'박하사탕','록',2006,'K-POP','신나는'),(189,'나는 나비','록',2006,'K-POP','신나는'),(190,'사랑 Two','록',2010,'K-POP','달달한'),(191,'잊을께','록',2003,'K-POP','신나는'),(192,'아직도 널','록',2009,'K-POP','잔잔한'),(193,'내 눈물 모아','발라드',2020,'K-POP','잔잔한'),(194,'EASY','Soul',2018,'K-POP','잔잔한'),(195,'헤어지자','발라드',2019,'K-POP','잔잔한'),(196,'그림자','발라드',2017,'K-POP','잔잔한'),(197,'Mr.애매모호','댄스',2014,'K-POP','신나는'),(198,'넌 is 뭔들','댄스',2016,'K-POP','신나는'),(199,'Decalcomanie','댄스',2016,'K-POP','신나는'),(200,'Piano Man','댄스',2014,'K-POP','잔잔한'),(201,'음오아예','댄스',2015,'K-POP','신나는'),(202,'나로 말할 것 같으면','댄스',2017,'K-POP','신나는'),(203,'HIP','댄스',2019,'K-POP','신나는'),(204,'너나 해','댄스',2018,'K-POP','신나는'),(205,'고고베베','댄스',2019,'K-POP','신나는'),(206,'별이 빛나는 밤','댄스',2018,'K-POP','신나는'),(207,'아무노래','힙합',2020,'K-POP','신나는'),(208,'BERMUDA TRIANGLE','힙합',2016,'K-POP','신나는'),(209,'Boys and Girls','힙합',2015,'K-POP','신나는'),(210,'날','힙합',2015,'K-POP','신나는'),(211,'너는 나 나는 너','힙합',2016,'K-POP','달달한'),(212,'유레카','힙합',2015,'K-POP','신나는'),(213,'VENI VIDI VICI','힙합',2015,'K-POP','신나는'),(214,'SoulMate','힙합',2018,'K-POP','달달한'),(215,'Artist','힙합',2017,'K-POP','신나는'),(216,'FANXY CHILD','힙합',2017,'K-POP','신나는'),(217,'사람들','발라드',2019,'K-POP','잔잔한'),(218,'Tempo','댄스',2018,'K-POP','신나는'),(219,'Monster','댄스',2016,'K-POP','신나는'),(220,'LOVE ME RIGHT','댄스',2015,'K-POP','신나는'),(221,'Love Shout','댄스',2018,'K-POP','신나는'),(222,'Obsession','댄스',2019,'K-POP','신나는'),(223,'으르렁','댄스',2013,'K-POP','신나는'),(224,'나비소녀','댄스',2013,'K-POP','신나는'),(225,'CALL ME BABY','댄스',2015,'K-POP','신나는'),(226,'Ko Ko Bop','댄스',2017,'K-POP','신나는'),(227,'중독','댄스',2014,'K-POP','신나는'),(228,'사계','발라드',2019,'K-POP','몽환적'),(229,'그대라는 시','발라드',2019,'K-POP','잔잔한'),(230,'Happy','Soul',2020,'K-POP','몽환적'),(231,'I','발라드',2015,'K-POP','몽환적'),(232,'U R','발라드',2015,'K-POP','잔잔한'),(233,'Fine','발라드',2017,'K-POP','잔잔한'),(234,'I Got Love','Soul',2017,'K-POP','몽환적'),(235,'불티','발라드',2019,'K-POP','몽환적'),(236,'Rain','발라드',2016,'K-POP','잔잔한'),(237,'Why','Soul',2016,'K-POP','몽환적'),(238,'그리워 그리워','발라드',2011,'K-POP','잔잔한'),(239,'늦은 밤 너의 집 앞 골목길에서','발라드',2019,'K-POP','잔잔한'),(240,'문득','발라드',2020,'K-POP','잔잔한'),(241,'반창꼬','발라드',2012,'K-POP','잔잔한'),(242,'별','발라드',2018,'K-POP','잔잔한'),(243,'목소리','발라드',2015,'K-POP','잔잔한'),(244,'살기 위해서','발라드',2011,'K-POP','잔잔한'),(245,'전부 너였다','발라드',2006,'K-POP','잔잔한'),(246,'청혼','발라드',2004,'K-POP','잔잔한'),(247,'하지 못한 말','발라드',2012,'K-POP','잔잔한'),(248,'어떻게 지내','힙합',2020,'K-POP','달달한'),(249,'저녁 같이 드실래요','Soul',2020,'K-POP','달달한'),(250,'전화를 할까봐','Soul',2019,'K-POP','잔잔한'),(251,'취한 밤','Soul',2018,'K-POP','달달한'),(252,'행복','Soul',2018,'K-POP','잔잔한'),(253,'불행','Soul',2018,'K-POP','몽환적'),(254,'스무살이 왜이리 능글맞아','Soul',2018,'K-POP','몽환적'),(255,'Beautiful','Soul',2016,'K-POP','달달한'),(256,'잊어버리지마','Soul',2016,'K-POP','달달한'),(257,'Hug me','Soul',2014,'K-POP','달달한'),(258,'가끔','Soul',2014,'K-POP','달달한'),(259,'자나깨나','Soul',2020,'K-POP','달달한'),(260,'우아해','Soul',2016,'K-POP','달달한'),(261,'Oasis','Soul',2015,'K-POP','신나는'),(262,'Outside','Soul',2017,'K-POP','몽환적'),(263,'SOFA','Soul',2014,'K-POP','몽환적'),(264,'Cereal','Soul',2018,'K-POP','신나는'),(265,'감아','힙합',2014,'K-POP','잔잔한'),(266,'나타나줘','힙합',2018,'K-POP','몽환적'),(267,'남아있어','힙합',2016,'K-POP','잔잔한'),(268,'시간이 들겠지','힙합',2018,'K-POP','잔잔한'),(269,'지나쳐','힙합',2017,'K-POP','잔잔한'),(270,'오랜만이야','힙합',2019,'K-POP','잔잔한'),(271,'니가 모르게','힙합',2014,'K-POP','달달한'),(272,'자꾸 생각나','힙합',2014,'K-POP','신나는'),(273,'무례하게','힙합',2014,'K-POP','신나는'),(274,'RESPECT','힙합',2015,'K-POP','신나는'),(275,'OPPA','힙합',2017,'K-POP','신나는'),(276,'피카부','댄스',2017,'K-POP','신나는'),(277,'Rookie','댄스',2017,'K-POP','신나는'),(278,'러시안 룰렛','댄스',2016,'K-POP','신나는'),(279,'Power Up','댄스',2018,'K-POP','신나는'),(280,'Ice Cream Cake','댄스',2015,'K-POP','신나는'),(281,'Bad Boy','댄스',2018,'K-POP','신나는'),(282,'Dumb Dumb','댄스',2015,'K-POP','신나는'),(283,'빨간 맛','댄스',2017,'K-POP','신나는'),(284,'짐살라빔','댄스',2019,'K-POP','신나는'),(285,'Psycho','댄스',2019,'K-POP','몽환적'),(286,'너를 만나','발라드',2018,'K-POP','잔잔한'),(287,'비','발라드',2016,'K-POP','잔잔한'),(288,'있잖아','발라드',2017,'K-POP','달달한'),(289,'우리 만남이','발라드',2020,'K-POP','잔잔한'),(290,'허전해','발라드',2019,'K-POP','잔잔한'),(291,'초록빛','발라드',2019,'K-POP','잔잔한'),(292,'커피 한 잔 할래요','발라드',2014,'K-POP','잔잔한'),(293,'안녕','발라드',2019,'K-POP','잔잔한'),(294,'편지','발라드',2016,'K-POP','잔잔한'),(295,'모든날, 모든 순간','발라드',2018,'K-POP','잔잔한'),(296,'널 붙잡을 노래','발라드',2010,'K-POP','잔잔한'),(297,'Hip Song','댄스',2010,'K-POP','신나는'),(298,'It\'s Raining','댄스',2004,'K-POP','신나는'),(299,'I Do','댄스',2004,'K-POP','달달한'),(300,'깡','댄스',2017,'K-POP','신나는'),(301,'안녕이란 말 대신','댄스',2002,'K-POP','신나는'),(302,'나쁜 남자','댄스',2002,'K-POP','신나는'),(303,'태양을 피하는 방법','댄스',2003,'K-POP','잔잔한'),(304,'어디 가요. 오빠','댄스',2014,'K-POP','신나는'),(305,'Rainism','댄스',2008,'K-POP','몽환적'),(306,'니가 왜 거기서 나와','트로트',2018,'K-POP','신나는'),(307,'먼지가 되어','트로트',2020,'K-POP','잔잔한'),(308,'옆집오빠','트로트',2020,'K-POP','신나는'),(309,'나는 나비','트로트',2020,'K-POP','신나는'),(310,'우리 정말 나쁘다','트로트',2016,'K-POP','신나는'),(311,'꼰대라떼','트로트',2020,'K-POP','신나는'),(312,'찐이야','트로트',2020,'K-POP','신나는'),(313,'막걸리 한잔','트로트',2020,'K-POP','슬픈'),(314,'추억으로 가는 당신','트로트',2020,'K-POP','잔잔한'),(315,'누나가 딱이야','트로트',2016,'K-POP','신나는'),(316,'I Love You','록',2013,'K-POP','달달한'),(317,'RE-BYE','록',2016,'K-POP','신나는'),(318,'사람들이 움직이는 게','록',2016,'K-POP','신나는'),(319,'오랜 날 오랜 밤','발라드',2017,'K-POP','잔잔한'),(320,'어떻게 이별까지 사랑하겠어, 널 사랑하는 거지','발라드',2019,'K-POP','잔잔한'),(321,'달','발라드',2019,'K-POP','잔잔한'),(322,'200\\%','록',2014,'K-POP','달달한'),(323,'Give Love','록',2014,'K-POP','달달한'),(324,'Crescendo','록',2013,'K-POP','달달한'),(325,'DINOSAUR','록',2017,'K-POP','몽환적'),(326,'벌써 12시','댄스',2019,'K-POP','몽환적'),(327,'Be Yourself','댄스',2020,'K-POP','신나는'),(328,'Love U','댄스',2018,'K-POP','신나는'),(329,'Snapping','댄스',2019,'K-POP','몽환적'),(330,'Chica','댄스',2019,'K-POP','신나는'),(331,'Why Don’t You Know','댄스',2017,'K-POP','신나는'),(332,'Roller Coaster','댄스',2018,'K-POP','몽환적'),(333,'Stay Tonight','댄스',2020,'K-POP','몽환적'),(334,'센치해','힙합',2019,'K-POP','잔잔한'),(335,'Forrest Gump','힙합',2014,'K-POP','잔잔한'),(336,'Good Times','힙합',2014,'K-POP','잔잔한'),(337,'Reality Bites','힙합',2014,'K-POP','잔잔한'),(338,'감기','힙합',2014,'K-POP','잔잔한'),(339,'발자국','힙합',2014,'K-POP','잔잔한'),(340,'가뭄','힙합',2010,'K-POP','잔잔한'),(341,'죄인','힙합',2010,'K-POP','잔잔한'),(342,'Move On','힙합',2019,'K-POP','잔잔한'),(343,'Grind','힙합',2019,'K-POP','잔잔한'),(344,'Break','힙합',2015,'K-POP','신나는'),(345,'Dali, Van, Picasso','힙합',2013,'K-POP','몽환적'),(346,'Up All Night','힙합',2014,'K-POP','몽환적'),(347,'How Do I Look','힙합',2014,'K-POP','신나는'),(348,'미쳤어','힙합',2014,'K-POP','신나는'),(349,'Time Travel','힙합',2016,'K-POP','몽환적'),(350,'젖고있어','힙합',2016,'K-POP','잔잔한'),(351,'January','힙합',2016,'K-POP','신나는'),(352,'Aqua Man','힙합',2012,'K-POP','신나는'),(353,'Boogie On & On','힙합',2012,'K-POP','신나는'),(354,'몸매','힙합',2015,'K-POP','신나는'),(355,'All The Way Up','Soul',2020,'K-POP','잔잔한'),(356,'All I Wanna Do','힙합',2016,'K-POP','달달한'),(357,'DRIVE','힙합',2016,'K-POP','달달한'),(358,'좋아','힙합',2013,'K-POP','달달한'),(359,'My Last','힙합',2015,'K-POP','달달한'),(360,'Yummy','힙합',2019,'K-POP','달달한'),(361,'Solo','힙합',2015,'K-POP','달달한'),(362,'V','힙합',2018,'K-POP','달달한'),(363,'YACHT','힙합',2017,'K-POP','달달한'),(364,'죽일 놈','힙합',2009,'K-POP','잔잔한'),(365,'불꽃 놀이','힙합',2009,'K-POP','신나는'),(366,'고백','힙합',2005,'K-POP','신나는'),(367,'거기서거기','힙합',2012,'K-POP','잔잔한'),(368,'출첵','힙합',2007,'K-POP','신나는'),(369,'그 남자 그 여자의 사정','힙합',2007,'K-POP','슬픈'),(370,'BAAAM','힙합',2013,'K-POP','신나는'),(371,'날개뼈','힙합',2013,'K-POP','잔잔한'),(372,'진격의 거인 둘','힙합',2013,'K-POP','신나는'),(373,'Ring My Bell','힙합',2004,'K-POP','신나는'),(374,'고해','록',1998,'K-POP','슬픈'),(375,'비상','록',1997,'K-POP','슬픈'),(376,'사랑보다 깊은 상처','록',1997,'K-POP','슬픈'),(377,'사랑','록',2011,'K-POP','슬픈'),(378,'낙인','록',2010,'K-POP','슬픈'),(379,'사랑..그놈','록',2011,'K-POP','슬픈'),(380,'너를 위해','록',2000,'K-POP','슬픈'),(381,'그대는 어디에','록',2000,'K-POP','슬픈'),(382,'이 밤이 지나면','록',1991,'K-POP','신나는'),(383,'여러분','록',2011,'K-POP','잔잔한'),(384,'사랑할수록','록',1993,'K-POP','잔잔한'),(385,'비밀','록',2011,'K-POP','잔잔한'),(386,'Lonely Night','록',2011,'K-POP','신나는'),(387,'사랑해서 사랑해서','록',2010,'K-POP','신나는'),(388,'Never Ending Strory','록',2002,'K-POP','슬픈'),(389,'비와 당신의 이야기','록',2002,'K-POP','슬픈'),(390,'아름다운 사실','록',2003,'K-POP','슬픈'),(391,'사랑할수록','록',2011,'K-POP','잔잔한'),(392,'사랑이란건','록',2010,'K-POP','잔잔한'),(393,'생각이나','록',2009,'K-POP','잔잔한'),(394,'내가 많이 사랑해요','발라드',2020,'K-POP','잔잔한'),(395,'그런 사람 또 없습니다','발라드',2009,'K-POP','잔잔한'),(396,'사랑 참 어렵다','발라드',2009,'K-POP','잔잔한'),(397,'잊었니','발라드',2012,'K-POP','슬픈'),(398,'인연','발라드',2009,'K-POP','잔잔한'),(399,'그 사람','발라드',2010,'K-POP','잔잔한'),(400,'말리꽃','발라드',2005,'K-POP','슬픈'),(401,'서쪽 하늘','발라드',2005,'K-POP','슬픈'),(402,'My Love','발라드',2013,'K-POP','달달한'),(403,'Never Ending Story','발라드',2005,'K-POP','슬픈'),(404,'혼자, 한잔','발라드',2017,'K-POP','잔잔한'),(405,'바보야','발라드',2017,'K-POP','잔잔한'),(406,'사월의 눈','발라드',2015,'K-POP','잔잔한'),(407,'언제나','발라드',2010,'K-POP','슬픈'),(408,'나를 잊지 말아요','발라드',2011,'K-POP','잔잔한'),(409,'한사람','발라드',2012,'K-POP','잔잔한'),(410,'흔한 이별','발라드',2018,'K-POP','잔잔한'),(411,'Hello','발라드',2011,'K-POP','잔잔한'),(412,'모노드라마','발라드',2013,'K-POP','신나는'),(413,'나를 사랑했던 사람아','발라드',2012,'K-POP','잔잔한'),(414,'죽을 만큼 아파서','힙합',2010,'K-POP','잔잔한'),(415,'인기','힙합',2019,'K-POP','신나는'),(416,'샤넬','힙합',2019,'K-POP','잔잔한'),(417,'I Love Oh Thank U','힙합',2005,'K-POP','달달한'),(418,'내 생에 가장 행복한 시간','힙합',2014,'K-POP','잔잔한'),(419,'서커스','힙합',2008,'K-POP','신나는'),(420,'아이스크림','힙합',2006,'K-POP','신나는'),(421,'널 너무 사랑해서','힙합',2016,'K-POP','신나는'),(422,'너에게 쓰는 편지','힙합',2004,'K-POP','잔잔한'),(423,'그래도 남자니까','힙합',2004,'K-POP','잔잔한'),(424,'꽃 길','Soul',2018,'K-POP','잔잔한'),(425,'FANTASTRIC BABY','댄스',2012,'K-POP','신나는'),(426,'뱅뱅뱅','댄스',2015,'K-POP','신나는'),(427,'WE LIKE 2 PARTY','댄스',2015,'K-POP','신나는'),(428,'거짓말','댄스',2007,'K-POP','신나는'),(429,'How Gee','댄스',2008,'K-POP','신나는'),(430,'마지막 인사','댄스',2007,'K-POP','신나는'),(431,'BAE BAE','댄스',2015,'K-POP','신나는'),(432,'에라 모르겠다','댄스',2016,'K-POP','신나는'),(433,'LAST DANCE','발라드',2016,'K-POP','잔잔한'),(434,'안갯길','발라드',2016,'K-POP','슬픈'),(435,'꿈처럼','발라드',2016,'K-POP','잔잔한'),(436,'I\'ll Be','발라드',2020,'K-POP','잔잔한'),(437,'안 괜찮아','발라드',2016,'K-POP','슬픈'),(438,'오늘은 가지마','발라드',2012,'K-POP','슬픈'),(439,'갈 수가 없어','발라드',2017,'K-POP','슬픈'),(440,'헤어져줘서 고마워','발라드',2019,'K-POP','슬픈'),(441,'내 목소리 들리니','발라드',2019,'K-POP','슬픈'),(442,'나쁜 놈','발라드',2020,'K-POP','슬픈'),(443,'열애중','발라드',2018,'K-POP','슬픈'),(444,'My Love','발라드',2020,'K-POP','슬픈'),(445,'그대라서','발라드',2009,'K-POP','슬픈'),(446,'You Are My Everything','발라드',2016,'K-POP','슬픈'),(447,'기억해줘요 내 모든 날과 그때를','발라드',2019,'K-POP','슬픈'),(448,'어른아이','댄스',2005,'K-POP','몽환적'),(449,'혼자만 하는 사랑','발라드',2006,'K-POP','잔잔한'),(450,'날 그만 잊어요','발라드',2004,'K-POP','슬픈'),(451,'기억상실','발라드',2004,'K-POP','슬픈'),(452,'친구라도 될 걸 그랬어','발라드',2003,'K-POP','슬픈'),(453,'그대 돌아오면..','발라드',2003,'K-POP','슬픈'),(454,'가슴이 뛴다','발라드',2011,'K-POP','달달한'),(455,'그립고 그립고 그립다','발라드',2009,'K-POP','슬픈'),(456,'눈물이 뚝뚝','발라드',2009,'K-POP','슬픈'),(457,'니가 필요해','발라드',2012,'K-POP','슬픈'),(458,'내 생에 아름다운','발라드',2018,'K-POP','슬픈'),(459,'말해! 뭐해?','발라드',2016,'K-POP','신나는'),(460,'오늘부터 1일','발라드',2014,'K-POP','신나는'),(461,'이러지마 제발','발라드',2012,'K-POP','몽환적'),(462,'Love Blossom','발라드',2013,'K-POP','달달한'),(463,'꽃이 핀다','발라드',2015,'K-POP','잔잔한'),(464,'너를 사랑해','발라드',2014,'K-POP','달달한'),(465,'떠나지마…','발라드',2009,'K-POP','잔잔한'),(466,'Flower','발라드',2019,'K-POP','잔잔한'),(467,'Touch Love','발라드',2013,'K-POP','달달한'),(468,'ALWAYS','발라드',2016,'K-POP','달달한'),(469,'시간이 흐른 뒤','발라드',2001,'K-POP','슬픈'),(470,'하루하루','발라드',2001,'K-POP','슬픈'),(471,'Memories...','힙합',2002,'K-POP','슬픈'),(472,'검은 행복','힙합',2007,'K-POP','신나는'),(473,'행복한 나를','발라드',2007,'K-POP','슬픈'),(474,'나의 오랜 연인에게','발라드',2019,'K-POP','슬픈'),(475,'너에게 못했던 내 마지막 말은','발라드',2019,'K-POP','슬픈'),(476,'두사랑','발라드',2015,'K-POP','슬픈'),(477,'이 사랑','발라드',2016,'K-POP','슬픈'),(478,'미워도 사랑하니까','발라드',2008,'K-POP','슬픈'),(479,'8282','댄스',2009,'K-POP','신나는'),(480,'시간아 멈춰라','댄스',2010,'K-POP','신나는'),(481,'안녕이라고 말하지마','발라드',2011,'K-POP','슬픈'),(482,'거북이','발라드',2013,'K-POP','슬픈'),(483,'사랑과 전쟁','댄스',2008,'K-POP','신나는'),(484,'Help','록',2020,'K-POP','몽환적'),(485,'위잉위잉','록',2014,'K-POP','몽환적'),(486,'Ohio','록',2014,'K-POP','몽환적'),(487,'와리가리','록',2014,'K-POP','몽환적'),(488,'Hooka','록',2014,'K-POP','몽환적'),(489,'공드리','록',2014,'K-POP','몽환적'),(490,'큰새','록',2014,'K-POP','몽환적'),(491,'TOMBOY','록',2017,'K-POP','몽환적'),(492,'Paul','록',2017,'K-POP','몽환적'),(493,'LOVE YA!','록',2018,'K-POP','몽환적'),(494,'눈사람','발라드',2018,'K-POP','잔잔한'),(495,'비가 온다','발라드',2018,'K-POP','잔잔한'),(496,'보통의 하루','발라드',2018,'K-POP','잔잔한'),(497,'너를 사랑한 시간','발라드',2015,'K-POP','잔잔한'),(498,'너였다면','발라드',2016,'K-POP','잔잔한'),(499,'잘 지내요','발라드',2018,'K-POP','잔잔한'),(500,'이 바보야','발라드',2016,'K-POP','슬픈'),(501,'십이월 이십오일의 고백','발라드',2019,'K-POP','잔잔한'),(502,'어떤가요','발라드',2018,'K-POP','잔잔한'),(503,'사랑에 빠지고 싶다','발라드',2014,'K-POP','잔잔한'),(504,'마지막처럼','댄스',2017,'K-POP','신나는'),(505,'Kill This Love','댄스',2019,'K-POP','신나는'),(506,'Don\'t Know What To Do','댄스',2019,'K-POP','신나는'),(507,'붐바야','댄스',2016,'K-POP','신나는'),(508,'휘파람','댄스',2016,'K-POP','신나는'),(509,'불장난','댄스',2016,'K-POP','신나는'),(510,'STAY','발라드',2016,'K-POP','잔잔한'),(511,'뚜두뚜두','댄스',2018,'K-POP','신나는'),(512,'Forever Young','발라드',2018,'K-POP','잔잔한'),(513,'Really','댄스',2018,'K-POP','신나는');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 16:17:54
