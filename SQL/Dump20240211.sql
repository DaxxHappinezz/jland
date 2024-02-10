-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: jland
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cno` int NOT NULL AUTO_INCREMENT,
  `pno` int DEFAULT NULL,
  `uno` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (21,1,3,3),(22,1,1,1),(23,5,1,2),(25,4,1,1),(26,4,1,5),(27,4,1,3),(28,4,1,1),(29,4,1,3),(30,5,1,3),(31,3,1,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `bno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `view_count` int DEFAULT '0',
  `comment_count` int DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'test title','no content','test',0,0,'2024-01-05 17:35:38','2024-01-05 17:35:38');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pno` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `size` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `color` varchar(50) DEFAULT NULL,
  `review_cnt` int DEFAULT '0',
  `category` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'pants',20000,'s',3,'black',0,NULL),(2,'fleece',29000,'l',3,'navy',0,NULL),(3,'hoodie',15000,'xl',3,'mint',1,NULL),(4,'The Globe',22999,NULL,3,NULL,54,'etc'),(5,'Disney Castle',39999,NULL,3,NULL,8,'etc');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `pno` int DEFAULT NULL,
  `uno` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `comment` text,
  `rating` int DEFAULT '0',
  `up` int DEFAULT '0',
  `down` int DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,4,1,'test title 2/1','test comment 2/1',3,2,1,'2024-02-01 17:03:45','2024-02-01 17:03:45'),(2,4,1,'test title 2/1','test comment 2/1',3,1,1,'2024-02-01 17:03:46','2024-02-01 17:03:46'),(3,4,1,'test title 2/1','test comment 2/1',3,2,1,'2024-02-01 17:03:46','2024-02-01 17:03:46'),(4,4,1,'test title 2/1','test comment 2/1',3,2,1,'2024-02-01 17:03:47','2024-02-01 17:03:47'),(5,4,1,'안녕하세요','반갑습니다. 저는 테스터입니다.',1,2,1,'2024-02-02 15:43:40','2024-02-02 15:43:40'),(6,4,1,'test title 2/1','test comment 2/1',3,0,0,'2024-02-02 18:18:40','2024-02-02 18:18:40'),(7,4,1,'test title 2/1','test comment 2/1',3,0,0,'2024-02-02 18:18:41','2024-02-02 18:18:41'),(8,4,1,'test title 2/1','test comment 2/1',3,0,0,'2024-02-02 18:18:42','2024-02-02 18:18:42'),(9,4,1,'test title 2/1','test comment 2/1',3,0,1,'2024-02-02 18:18:43','2024-02-02 18:18:43'),(10,4,1,'test title 2/1','test comment 2/1',3,0,0,'2024-02-02 18:18:43','2024-02-02 18:18:43'),(11,4,1,'now test','now test',5,0,0,'2024-02-02 21:21:07','2024-02-02 21:21:07'),(12,4,1,'ddddd','ddddd',2,0,0,'2024-02-02 21:42:11','2024-02-02 21:42:11'),(13,4,1,'테스트 2월 3일','테스트 2월 3일',1,0,0,'2024-02-03 17:12:07','2024-02-03 17:12:07'),(14,4,1,'테스트 2월 3일','테스트 2월 3일',5,0,0,'2024-02-03 17:12:16','2024-02-03 17:12:16'),(15,4,1,'sasdfsdff','ffffff',1,0,0,'2024-02-03 17:15:06','2024-02-03 17:15:06'),(16,4,1,'test 2/3','test 2/3',4,0,0,'2024-02-03 17:15:50','2024-02-03 17:15:50'),(17,4,1,'test 2/3','test 2/3',3,0,0,'2024-02-03 17:17:03','2024-02-03 17:17:03'),(18,4,1,'t','t',1,0,0,'2024-02-03 17:18:51','2024-02-03 17:18:51'),(19,4,1,'d','d',3,0,0,'2024-02-03 17:21:45','2024-02-03 17:21:45'),(20,4,1,'f','f',3,0,0,'2024-02-03 17:24:17','2024-02-03 17:24:17'),(21,4,1,'f','f',3,0,0,'2024-02-03 17:24:47','2024-02-03 17:24:47'),(22,4,1,'g','g',1,0,0,'2024-02-03 17:25:52','2024-02-03 17:25:52'),(23,4,1,'r','r',3,0,0,'2024-02-03 17:26:59','2024-02-03 17:26:59'),(24,4,1,'q','rq',5,0,0,'2024-02-03 17:27:22','2024-02-03 17:27:22'),(25,4,1,'a;sldkjf;laksjdf;','oijefoisjlef',1,0,0,'2024-02-03 17:29:08','2024-02-03 17:29:08'),(26,4,1,'ㅋ','ㅋ',5,0,0,'2024-02-03 17:30:17','2024-02-03 17:30:17'),(27,4,1,'ㅋ','ㅋ',1,0,0,'2024-02-03 17:30:34','2024-02-03 17:30:34'),(28,5,1,'ㅅ','ㅅ',2,0,0,'2024-02-03 17:41:22','2024-02-03 17:41:22'),(29,3,1,'테스트 2/4','테스트 2/4',3,0,0,'2024-02-04 11:40:38','2024-02-04 11:40:38'),(30,4,1,'ㅅㅅ','ㅅㅅ',2,0,0,'2024-02-04 11:41:51','2024-02-04 11:41:51'),(31,4,1,'d','d',5,0,0,'2024-02-04 11:49:27','2024-02-04 11:49:27'),(32,4,1,'d','d',1,0,0,'2024-02-04 11:49:56','2024-02-04 11:49:56'),(33,4,1,'s','s',5,0,0,'2024-02-04 11:54:09','2024-02-04 11:54:09'),(34,4,1,'sdf','sdf',2,0,0,'2024-02-04 11:55:35','2024-02-04 11:55:35'),(35,4,1,'t','t',1,0,0,'2024-02-04 12:00:39','2024-02-04 12:00:39'),(36,4,1,'q','q',5,0,0,'2024-02-04 12:01:44','2024-02-04 12:01:44'),(37,4,1,'e','e',1,0,0,'2024-02-04 12:02:30','2024-02-04 12:02:30'),(38,4,1,'e','e',5,0,0,'2024-02-04 12:03:26','2024-02-04 12:03:26'),(39,4,1,'q','q',1,0,0,'2024-02-04 12:07:11','2024-02-04 12:07:11'),(40,4,1,'ㅋ','ㅋ',5,0,0,'2024-02-04 12:18:23','2024-02-04 12:18:23'),(41,4,1,'ㅎ','ㅎ',1,0,0,'2024-02-04 12:23:13','2024-02-04 12:23:13'),(42,4,1,'','',NULL,0,0,'2024-02-04 13:12:54','2024-02-04 13:12:54'),(43,4,1,'','',NULL,1,1,'2024-02-04 13:12:58','2024-02-04 13:12:58'),(44,4,1,'','',NULL,0,0,'2024-02-04 13:15:04','2024-02-04 13:15:04'),(45,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(46,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(47,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(48,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(49,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(50,4,1,'','',2,0,0,'2024-02-04 14:30:28','2024-02-04 14:30:28'),(51,4,1,'3','',2,0,0,'2024-02-04 14:31:04','2024-02-04 14:31:04'),(52,4,1,'3','',2,0,0,'2024-02-04 14:31:04','2024-02-04 14:31:04'),(53,4,1,'','',NULL,0,0,'2024-02-04 14:32:35','2024-02-04 14:32:35'),(54,4,1,'','',NULL,0,0,'2024-02-04 14:32:47','2024-02-04 14:32:47'),(55,4,1,'','',NULL,0,0,'2024-02-04 14:37:37','2024-02-04 14:37:37'),(56,4,1,'','',NULL,0,0,'2024-02-04 14:37:55','2024-02-04 14:37:55'),(57,4,1,'','',NULL,0,0,'2024-02-04 14:41:01','2024-02-04 14:41:01'),(58,4,1,'','',NULL,0,0,'2024-02-04 18:32:31','2024-02-04 18:32:31'),(59,4,1,'','',NULL,0,0,'2024-02-04 18:41:41','2024-02-04 18:41:41'),(60,4,1,'','',NULL,1,1,'2024-02-04 18:59:34','2024-02-04 18:59:34'),(61,5,1,'','',NULL,0,0,'2024-02-04 19:00:36','2024-02-04 19:00:36'),(62,5,1,'','',NULL,0,0,'2024-02-04 19:01:38','2024-02-04 19:01:38'),(63,5,1,'','',NULL,0,0,'2024-02-04 19:11:00','2024-02-04 19:11:00'),(64,5,1,'ㅇ','ㄹ',3,0,0,'2024-02-04 19:20:08','2024-02-04 19:20:08'),(65,5,1,'q','q',5,0,0,'2024-02-04 19:41:23','2024-02-04 19:41:23'),(66,5,1,'q','q',1,0,0,'2024-02-04 19:43:10','2024-02-04 19:43:10'),(67,5,1,'df','ㅇ',3,0,0,'2024-02-04 21:32:55','2024-02-04 21:32:55'),(68,4,1,'test','test',4,0,0,'2024-02-11 02:33:23','2024-02-11 02:33:23');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uno` int NOT NULL AUTO_INCREMENT,
  `givenName` varchar(50) NOT NULL,
  `familyName` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `pw` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'guest','guest','guest','guest',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(2,'Jaecheol','Seo','master2','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(3,'Jaecheol','Seo','master3','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(4,'Jaecheol','Seo','master4','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(5,'Jaecheol','Seo','master5','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(6,'Jaecheol','Seo','master6','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(7,'Jaecheol','Seo','master7','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(8,'Jaecheol','Seo','master8','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(9,'Jaecheol','Seo','master9','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(10,'Jaecheol','Seo','master10','1234',NULL,NULL,NULL,NULL,NULL,'2024-01-11 16:59:54','2024-01-11 16:59:54'),(11,'재재','서','masterman','asdf',NULL,'korea',7,10,1991,'2024-01-29 14:24:11','2024-01-29 14:24:11'),(12,'test','man','testman','asdf',NULL,'',NULL,NULL,NULL,'2024-01-29 14:28:14','2024-01-29 14:28:14'),(13,'ㅅㄷㄴㅅ','ㅅㄷㄴㅅ','ㅅㄷㄴㅅ','asdf',NULL,'',NULL,NULL,NULL,'2024-01-29 14:32:08','2024-01-29 14:32:08'),(14,'dddd','dd','tess','asdf',NULL,'',NULL,NULL,NULL,'2024-01-29 14:53:34','2024-01-29 14:53:34'),(15,'ddfsfsf','guest','sdfasdfasdfasdf','guest',NULL,NULL,NULL,NULL,NULL,'2024-02-05 15:58:30','2024-02-05 15:58:30'),(16,'James','Seo','fffffff','asdf',NULL,'',NULL,NULL,NULL,'2024-02-05 15:59:46','2024-02-05 15:59:46'),(17,'guest','guest','dfsdfaef','guest',NULL,NULL,NULL,NULL,NULL,'2024-02-05 16:00:16','2024-02-05 16:00:16'),(18,'ffff','d','sdfasdf','asdf',NULL,'',NULL,NULL,NULL,'2024-02-05 18:15:35','2024-02-05 18:15:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wno` int NOT NULL AUTO_INCREMENT,
  `bno` int DEFAULT NULL,
  `pno` int DEFAULT NULL,
  PRIMARY KEY (`wno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-11  3:54:45
