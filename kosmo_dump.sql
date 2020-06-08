-- MariaDB dump 10.17  Distrib 10.5.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: kosmo61_db
-- ------------------------------------------------------
-- Server version	10.5.3-MariaDB

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(30) NOT NULL,
  `visitcount` mediumint(9) NOT NULL DEFAULT 0,
  `bname` varchar(10) DEFAULT 'freeboard',
  PRIMARY KEY (`num`),
  KEY `fk_board_member` (`id`),
  CONSTRAINT `fk_board_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (4,'제목입니다3','내용입니다3','2020-05-26 17:47:12','kosmo',4,'freeboard'),(5,'제목입니다4','내용입니다4','2020-05-26 17:47:12','kosmo',7,'freeboard'),(6,'제목입니다5글씨깨짐','글\r\n씨\r\n깨\r\n짐','2020-05-26 17:47:12','kosmo',16,'freeboard'),(8,'여긴 공지사항','내용없음','2020-05-27 15:10:59','kosmo',3,'notice'),(9,'여긴 공지사항','내용없음','2020-05-27 15:15:17','kosmo',5,'notice'),(10,'질문과 답변게시판에 글쓰기','질문과 답변게시판에 글쓰기','2020-05-27 16:57:21','kosmo',4,'freeboard'),(11,'질문과 답변게시판에 글쓰기','질문과 답변게시판에 글쓰기','2020-05-27 16:58:37','kosmo',5,'qna'),(12,'테스트1','테스트1\r\n입\r\n니\r\n다\r\n','2020-06-07 00:22:13','kosmo',3,'freeboard');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_table`
--

DROP TABLE IF EXISTS `img_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_table` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(64) DEFAULT NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_table`
--

LOCK TABLES `img_table` WRITE;
/*!40000 ALTER TABLE `img_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `img_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `regidate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('kosmo','1234','코스모 61기','2020-05-26 17:44:16');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_date`
--

DROP TABLE IF EXISTS `tb_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_date` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `DATE1` date NOT NULL,
  `DATE2` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_date`
--

LOCK TABLES `tb_date` WRITE;
/*!40000 ALTER TABLE `tb_date` DISABLE KEYS */;
INSERT INTO `tb_date` VALUES (1,'2020-05-27','2020-05-27 10:51:01');
/*!40000 ALTER TABLE `tb_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_int`
--

DROP TABLE IF EXISTS `tb_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_int` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `num1` tinyint(3) unsigned NOT NULL,
  `num2` smallint(6) NOT NULL,
  `num3` mediumint(9) DEFAULT 100,
  `num4` bigint(20) DEFAULT NULL,
  `fnum1` float(10,5) NOT NULL,
  `fnum2` double(20,10) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_int`
--

LOCK TABLES `tb_int` WRITE;
/*!40000 ALTER TABLE `tb_int` DISABLE KEYS */;
INSERT INTO `tb_int` VALUES (1,100,12345,1234567,1234567890,12345.12305,1234567890.1234567000),(2,100,12345,1234567,1234567890,12345.12305,1234567890.1234567000);
/*!40000 ALTER TABLE `tb_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_spec`
--

DROP TABLE IF EXISTS `tb_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_spec` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `spec1` enum('M','W','T') DEFAULT NULL,
  `spet2` set('A','B','C','D') DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_spec`
--

LOCK TABLES `tb_spec` WRITE;
/*!40000 ALTER TABLE `tb_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_test`
--

DROP TABLE IF EXISTS `ts_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_test` (
  `num` int(11) NOT NULL,
  `times` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_test`
--

LOCK TABLES `ts_test` WRITE;
/*!40000 ALTER TABLE `ts_test` DISABLE KEYS */;
INSERT INTO `ts_test` VALUES (1,'2020-05-26 07:47:00');
/*!40000 ALTER TABLE `ts_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08  9:49:52
