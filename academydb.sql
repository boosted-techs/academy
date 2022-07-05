-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: boosted_academy
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_key` varchar(130) NOT NULL,
  `user` int NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
INSERT INTO `access_keys` VALUES (1,'41d2083d21787829ce624dd4d73143d1d2382d0fa864aa84fa04b839cc4547d17aa2ad77641a660cfd1d6c240d9617b7c63f8588fc5e77ac2eaab1dd59988836',5,'2021-01-26'),(2,'a29b82aaa891256df9beb645b4bb374082dc3cf22ab51448a78f24fbd15825a6011f39903bf69c475b968d09f4baec7015a1b0318898bb292d1e29eaf9f1455d',5,'2021-01-26'),(3,'eba9df5bad1d89318f38712aa83eeeae034138b8cae355d284bc453884b8f6ff30b31f5a1b35a96a24e8d4df2a5bd57065d722b9e4d3fd0ff212135eb8ecd5e5',5,'2021-01-26');
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `district` mediumint DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `country` mediumint DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `box_no` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `temporary_id` int DEFAULT NULL,
  `mothers_name` varchar(100) DEFAULT NULL,
  `fathers_name` varchar(100) DEFAULT NULL,
  `mothers_contact` varchar(100) DEFAULT NULL,
  `fathers_contact` varchar(100) DEFAULT NULL,
  `highest_level` int NOT NULL DEFAULT '6',
  `recent_school_attended` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,5,31,'Kampala',1,'+256784565201','1234','Boosted technologies Uganda','ashrikan@gmail.com','kasubi-namungoona, Kawempe',NULL,'Anisha','Setaamu','+256784565201','+256784565201',1,'Makerere University');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_fees`
--

DROP TABLE IF EXISTS `application_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fees` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_fees`
--

LOCK TABLES `application_fees` WRITE;
/*!40000 ALTER TABLE `application_fees` DISABLE KEYS */;
INSERT INTO `application_fees` VALUES (1,20000,'2021-01-28 07:31:40');
/*!40000 ALTER TABLE `application_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `program` smallint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is pending, 1 is submitted, 2 is admitted, 3 is completed, 4 is denied',
  `date_applied` date NOT NULL,
  `intake` varchar(20) NOT NULL,
  `admission_fee` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 is paid, 0 is pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (8,5,2,0,'2021-01-28','1-2021',0),(9,5,2,1,'2021-01-28','2-2021',1);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_info`
--

DROP TABLE IF EXISTS `basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basic_info` (
  `user` int NOT NULL,
  `names` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `country` char(50) DEFAULT NULL,
  `dob` date NOT NULL,
  `theme` tinyint(1) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `continent` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `timezone` char(100) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 is admin, 0 is client',
  `mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is when welcome mail is not sent. 1 is sent welcome mail',
  `boo_cash` tinyint(1) NOT NULL DEFAULT '0',
  `affiliate_discount` tinyint NOT NULL DEFAULT '0',
  `supplier` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_info`
--

LOCK TABLES `basic_info` WRITE;
/*!40000 ALTER TABLE `basic_info` DISABLE KEYS */;
INSERT INTO `basic_info` VALUES (5,'Tumusiime Ashan','https://lh3.googleusercontent.com/a-/AOh14Gi3cnvrzRqkyRZa_fyYKrgRZJsz0pdHwWN5OvDP9Q=s96-c','Uganda','1995-09-14',1,1,'Africa','Kampala','ashrikan@gmail.com',NULL,1,'tumusiime-ashan',1,1,0,0,0);
/*!40000 ALTER TABLE `basic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Uganda',1),(2,'Kenya',0),(3,'Rwanda',0),(4,'South Sudan',0),(5,'Tanzania',0),(6,'Democratic Republic of Congo',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` int NOT NULL DEFAULT '1',
  `district` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `region` tinyint NOT NULL DEFAULT '4',
  `delivery_amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Buikwe',1,1,6000),(2,1,'Bukomansimbi  ',1,1,6000),(3,1,'Butambala',1,1,6000),(4,1,'Buvuma',1,1,6000),(5,1,'Gomba',1,1,6000),(6,1,'Kalangala',1,1,6000),(7,1,'Kalungu',1,1,6000),(8,1,'Kampala',1,1,6000),(9,1,'Kampala',1,1,6000),(10,1,'Kiboga',1,1,6000),(11,1,'Kyankwanzi',1,1,6000),(12,1,'Luweero',1,1,6000),(13,1,'Lwengo',1,1,6000),(14,1,'Lyantonde',1,1,6000),(15,1,'Masaka',1,1,6000),(16,1,'Mityana',1,1,6000),(17,1,'Mpigi',1,1,6000),(18,1,'Mubende',1,1,6000),(19,1,'Mukono',1,1,6000),(20,1,'Nakaseke',1,1,6000),(21,1,'Nakasongola',1,1,6000),(22,1,'Rakai',1,1,6000),(23,1,'Sembabule',1,1,6000),(24,1,'Wakiso',1,1,6000),(25,1,'Amuria',1,2,12000),(26,1,'Budaka',1,2,12000),(27,1,'Bududa',1,2,12000),(28,1,'Bugiri',1,2,12000),(29,1,'Bukedea',1,2,12000),(30,1,'Bukwa',1,2,12000),(31,1,'Bulambuli',1,2,12000),(32,1,'Busia',1,2,12000),(33,1,'Butaleja',1,2,12000),(34,1,'Buyende',1,2,12000),(35,1,'Iganga',1,2,12000),(36,1,'Jinja',1,2,12000),(37,1,'Kaberamaido',1,2,12000),(38,1,'Kaliro',1,2,12000),(39,1,'Kamuli',1,2,12000),(40,1,'Kapchorwa',1,2,12000),(41,1,'Katakwi',1,2,12000),(42,1,'Kibuku',1,2,12000),(43,1,'Kumi',1,2,12000),(44,1,'Kween',1,2,12000),(45,1,'Luuka',1,2,12000),(46,1,'Manafwa',1,2,12000),(47,1,'Mayuge',1,2,12000),(48,1,'Mbale',1,2,12000),(49,1,'Namayingo',1,2,12000),(50,1,'Namutumba',1,2,12000),(51,1,'Ngora',1,2,12000),(52,1,'Pallisa',1,2,12000),(53,1,'Serere',1,2,12000),(54,1,'Sironko',1,2,12000),(55,1,'Soroti',1,2,12000),(56,1,'Tororo',1,2,12000),(57,1,'Abim',1,3,15000),(58,1,'Adjumani',1,3,15000),(59,1,'Agago',1,3,15000),(60,1,'Alebtong',1,3,15000),(61,1,'Amolatar',1,3,15000),(62,1,'Amudat',1,3,15000),(63,1,'Amuru',1,3,15000),(64,1,'Apac',1,3,15000),(65,1,'Arua',1,3,15000),(66,1,'Dokolo',1,3,15000),(67,1,'Gulu',1,3,15000),(68,1,'Kaabong',1,3,15000),(69,1,'Kitgum',1,3,15000),(70,1,'Koboko',1,3,15000),(71,1,'Kole',1,3,15000),(72,1,'Kotido',1,3,15000),(73,1,'Lamwo',1,3,15000),(74,1,'Lira',1,3,15000),(75,1,'Maracha',1,3,15000),(76,1,'Moroto',1,3,15000),(77,1,'Moyo',1,3,15000),(78,1,'Nakapiripirit',1,3,15000),(79,1,'Napak',1,3,15000),(80,1,'Nebbi',1,3,15000),(81,1,'Nwoya',1,3,15000),(82,1,'Otuke',1,3,15000),(83,1,'Oyam',1,3,15000),(84,1,'Pader',1,3,15000),(85,1,'Yumbe',1,3,15000),(86,1,'Zombo',1,3,15000),(87,1,'Buhweju',1,4,15000),(88,1,'Buliisa',1,4,15000),(89,1,'Bundibugyo',1,4,15000),(90,1,'Bushenyi',1,4,15000),(91,1,'Hoima',1,4,15000),(92,1,'Ibanda',1,4,15000),(93,1,'Isingiro',1,4,15000),(94,1,'Kabale',1,4,15000),(95,1,'Kabarole',1,4,15000),(96,1,'Kamwenge',1,4,15000),(97,1,'Kanungu',1,4,15000),(98,1,'Kasese',1,4,15000),(99,1,'Kibaale',1,4,15000),(100,1,'Kiruhura',1,4,15000),(101,1,'Kiryandongo',1,4,15000),(102,1,'Kisoro',1,4,15000),(103,1,'Kyegegwa',1,4,15000),(104,1,'Kyenjojo',1,4,15000),(105,1,'Masindi',1,4,15000),(106,1,'Mbarara',1,4,15000),(107,1,'Mitooma',1,4,15000),(108,1,'Ntoroko',1,4,15000),(109,1,'Ntungamo',1,4,15000),(110,1,'Rubirizi',1,4,15000),(111,1,'Rukungiri',1,4,15000),(112,1,'Sheema',1,4,15000);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_subscription`
--

DROP TABLE IF EXISTS `mail_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_subscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_subscription`
--

LOCK TABLES `mail_subscription` WRITE;
/*!40000 ALTER TABLE `mail_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_keys`
--

DROP TABLE IF EXISTS `order_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `order_ref` varchar(100) NOT NULL,
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `response_data` text NOT NULL,
  `temporary_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_keys`
--

LOCK TABLES `order_keys` WRITE;
/*!40000 ALTER TABLE `order_keys` DISABLE KEYS */;
INSERT INTO `order_keys` VALUES (7,7,'22366d2659ac994839821a8ac20ee95c_ref_7_5_',5,'2021-01-28','',0),(8,8,'683835fd1f8cbff25c19077cb0f9b651_ref_8_5_',5,'2021-01-28','{\"status\":\"success\",\"message\":\"Transaction fetched successfully\",\"data\":{\"id\":1869842,\"tx_ref\":\"\\\"683835fd1f8cbff25c19077cb0f9b651_ref_8_5_\\\"\",\"flw_ref\":\"flwm3s4m0c1611835558425\",\"device_fingerprint\":\"651c59fed508e3a097ba99944c8e97ed\",\"amount\":20000,\"currency\":\"UGX\",\"charged_amount\":20000,\"app_fee\":600,\"merchant_fee\":0,\"processor_response\":\"Approved\",\"auth_model\":\"MOBILEMONEY\",\"ip\":\"160.242.128.222\",\"narration\":\"Boosted Technologies UG\",\"status\":\"successful\",\"payment_type\":\"mobilemoneyug\",\"created_at\":\"2021-01-28T12:05:57.000Z\",\"account_id\":661746,\"meta\":{\"consumer_id\":\"5\",\"consumer_mac\":\"92a3-912ba-1192a\"},\"amount_settled\":19400,\"customer\":{\"id\":554852,\"name\":\"Tumusiime Ashan\",\"phone_number\":\"0759800742\",\"email\":\"ashrikan@gmail.com\",\"created_at\":\"2020-12-30T06:36:10.000Z\"}}}',0);
/*!40000 ALTER TABLE `order_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `order_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is pending, 1 is submited, 2 pending_delivery, 3 is delivered, 4 is returned',
  `amount` int NOT NULL,
  `date_created` datetime NOT NULL,
  `payment_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mail` tinyint(1) NOT NULL DEFAULT '0',
  `temporary_id` int DEFAULT NULL,
  `description` text NOT NULL,
  `application` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,5,0,20000,'2021-01-28 11:13:26',0,'2021-01-28 11:13:26',0,0,'New course application',4),(4,5,0,20000,'2021-01-28 11:14:53',0,'2021-01-28 11:14:53',0,0,'Come we eat.',5),(5,5,0,20000,'2021-01-28 11:54:36',0,'2021-01-28 11:54:36',0,0,'new letter',6),(6,5,0,20000,'2021-01-28 11:58:27',0,'2021-01-28 11:58:27',0,0,'Testing application',7),(7,5,0,20000,'2021-01-28 12:00:23',0,'2021-01-28 12:00:23',0,0,'hhjhj',8),(8,5,1,20000,'2021-01-28 12:04:33',1,'2021-01-28 18:06:00',1,0,'New application',9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_keys`
--

DROP TABLE IF EXISTS `payment_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `production` varchar(100) NOT NULL,
  `testing` varchar(100) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  `testing_key` varchar(100) NOT NULL,
  `encryption` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_keys`
--

LOCK TABLES `payment_keys` WRITE;
/*!40000 ALTER TABLE `payment_keys` DISABLE KEYS */;
INSERT INTO `payment_keys` VALUES (1,'FLWPUBK-bede5c47dc0f59b4cacb66d7059397c8-X','FLWPUBK_TEST-ea8276349f78a208c5e3231a1ba5487f-X','FLWSECK-93313b8a0e29881936a43d55e4fc2ffc-X','FLWSECK_TEST-11bbd37698ba8bd689217fc19ff5629c-X','93313b8a0e29c2746b3a6806');
/*!40000 ALTER TABLE `payment_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program` varchar(200) NOT NULL,
  `award` int NOT NULL COMMENT 'Award is the benefit of the program',
  `user` int NOT NULL COMMENT 'Added the program',
  `date_added` date NOT NULL,
  `description` text NOT NULL COMMENT 'What the program is. Program description',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is for deactive, 1 is for active, 2 is for suspended, 3 is for future',
  `category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1->Insitute, 2 adult primary, 3 adult olevel, 4 adult HS',
  `audience` text NOT NULL,
  `requirements` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `photos` varchar(100) NOT NULL DEFAULT 'course.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'Fullstack web development',0,3,'2019-08-06','<p>In this program, we provide students with skills in full web development so as to equip them with mordern trends in web technology.</p>',0,1,'<p>Certificate in Uganda Examinations (UCE) is a requirement</p>','<p>Laptop Computer</p>','fullstack-web-development','full_stack.jpg'),(2,'Web design and Development',0,3,'2019-09-09','<p>Many years ago, web designing was an unknown field; but today it is one of the booming sections in the market. Many companies bit government or private are in a rush to have an online presence on the internet. There for they need web applications with related web designs to accomplish their demands in the market. This makes such companies gain a favorably good competitive advantages in the market.<br><br>We see to it that the theory and practical sessions go alternatively and effectively.&nbsp;<br>In this manner, every concept gets simplified and is explained with adequate details in our web design course.</p><h4><strong>Course Structure</strong></h4><figure class=\"table\"><table><tbody><tr><td>Course</td><td>Duration</td><td>Comment</td></tr><tr><td>Communication skills</td><td>1 month</td><td>&nbsp;</td></tr><tr><td><p>Web technologies&nbsp;</p><p>html, Css, Javascript</p></td><td>2 months</td><td><p><strong>HTML</strong> is used to create Web pages. That is, Web pages all over the world consist of HTML.&nbsp;</p><p><strong>CSS</strong> is the language for describing the presentation of Web pages, including colors, layout, and fonts.&nbsp;</p><p><strong>JavaScript (JS)</strong> is a dynamic computer programming language. It is most commonly used as part of web browsers, whose implementations allow client-side scripts to interact with the user, control the browser, communicate asynchronously, and alter the document content that is displayed</p></td></tr><tr><td>Backend Programming in PHP and MySQL</td><td>2 Months</td><td>PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. Management System (RDBMS) that uses Structured Query Language (SQL). SQL is the most popular language for adding, accessing and managing content in a database. It is most noted for its quick processing, proven reliability, ease and flexibility of use.&nbsp;</td></tr><tr><td>MVC (Model View Controllers) Technology in Codeigniter and smarty.</td><td>1 Month</td><td>CodeIgniter is loosely based on the popular model–view–controller (MVC) development pattern.</td></tr></tbody></table></figure>',1,1,'<p>This course is highly suitable for the individuals aspiring to become web designers and also for the professionals who want to upgrade their skills. There are many web designing training institutes in Pune, but we train in a better way. </p>','<p>Laptop Computer</p>','web-design-and-development','web.jpg'),(3,'Computer literacy and IT essentials',0,3,'2019-09-09','<p>This course program is aiming at equipping the learner with basic computer knowledge so as to be able to interact favorably with the computer machine placed before him/her.&nbsp;</p><p>At the end of the course, the learner is able to use basic computer applications ie Microsoft word, Excel, access and Powerpoint.&nbsp;</p><p>Internet being one of the most on demand attributes on demand in a person, this course introduces the learn to internet usage. So at the end of the course, the learner is to be able to confidently look for resources over the international network.</p><h4>Course structure</h4><figure class=\"table\"><table><tbody><tr><td>Course</td><td>Duration</td><td>Comment</td></tr><tr><td>Introduction to computer basics</td><td>1 month</td><td>Basic knowledge about a computer, what it does etc</td></tr><tr><td><p>Computer basic applications</p><p>(Microsoft Word, Microsoft Excel, Microsoft Power point, Microsoft Access)</p></td><td>2 months</td><td>Learn micro soft essential applications</td></tr><tr><td>Introduction to Internet</td><td>1 Month</td><td>Learn how to use the internet, surf using web browsers among others</td></tr></tbody></table></figure><p>&nbsp;</p>',1,1,'<p>Learners who know English as a language</p>','<p>English spoken is a requirement.</p>\r\n<p>Laptop Computer</p>\r\n','computer-literacy-and-it-essentials','literacy.jpg'),(4,'Software Engineering',0,3,'2019-09-09','<p>In today’s world, one cannot deny the overwhelming role computers play in our daily lives – from running advanced systems on space stations to assembly lines in vehicle manufacturing units down to cell phones. Computer software is responsible for storing various instructions that tell the computer how to perform a particular function. As technology continues to evolve at a pace faster than ever before and demand for new products, systems and applications continues to grow, software engineering is growing at an exponential rate. Software engineers are responsible for designing and maintaining systems and finding innovative ways to solve the issues faced by computer users around the world.</p><h2>Course structure</h2><h4>Ordinary certificate in software engineering.</h4><figure class=\"table\"><table><tbody><tr><td>Course</td><td>Duration</td><td>Comment</td></tr><tr><td>Foundations of computer and information systems</td><td>1 month</td><td><br>&nbsp;</td></tr><tr><td>Structured Programming</td><td>11/2 months</td><td>C is a structured programming language which is one of the most used languages. It allows programmer to write directly to memory. It is suggested that one must know this language before learning advanced languages.</td></tr><tr><td><p>Object Oriented Programming</p><p>(Electives)</p><p>1. Kotlin</p><p>2. Java</p></td><td>21/2 Months</td><td>Java and Kotlin are object oriented programming languages. They best the best platforms independent language to develop enterprise level applications &amp; are some of the most secure technologies for web and software application development.</td></tr><tr><td>Application Development</td><td>2 Months</td><td>The student is tasked to develop an application in either of the languages of choice ie in either C, Kotlin or Java</td></tr></tbody></table></figure><h4>National Certificate in software engineering.</h4><figure class=\"table\"><table><tbody><tr><td>Semester I Year I</td><td>Semester II Year I</td></tr><tr><td>Foundations of Computer and Information Systems</td><td>Web Technologies (Html, css, Javascript)</td></tr><tr><td>Engineering Mathematics</td><td>System Analysis and Design (SAD)</td></tr><tr><td>Communication skills</td><td>Computer communication and Networks</td></tr><tr><td>Structured programming</td><td>Management Information systems (MIS)</td></tr><tr><td>Computer Literacy</td><td>UNIX &amp; Shell Programming&nbsp;</td></tr><tr><td colspan=\"2\"><strong>Internship&nbsp;</strong></td></tr><tr><td>Semester I Year II</td><td>Semester II Year II</td></tr><tr><td>Entrepreneurship skills</td><td>Computer management and maintenance&nbsp;</td></tr><tr><td>Object Oriented Programming in Kotlin / Java (elective)</td><td>Introduction to computer systems</td></tr><tr><td>Web development Technology</td><td>Introduction to operating systems</td></tr><tr><td>Database management and administration</td><td>Final year Project</td></tr><tr><td>Research methodology</td><td>Final year Project</td></tr></tbody></table></figure><h4>Diploma in Software Engineering</h4><figure class=\"table\"><table><tbody><tr><td>Semester I Year I</td><td>Semester II Year I</td></tr><tr><td>Foundations of Computer and Information Systems</td><td>Web Technologies (Html, css, Javascript)</td></tr><tr><td>Engineering Mathematics</td><td>System Analysis and Design (SAD)</td></tr><tr><td>Communication skills</td><td>Computer communication and Networks</td></tr><tr><td>Structured programming</td><td>Management Information systems (MIS)</td></tr><tr><td>Computer Literacy</td><td>UNIX &amp; Shell Programming&nbsp;</td></tr><tr><td colspan=\"2\"><strong>Internship&nbsp;</strong></td></tr><tr><td>Semester I Year II</td><td>Semester II Year II</td></tr><tr><td>Entrepreneurship skills</td><td>Computer management and maintenance&nbsp;</td></tr><tr><td>Object Oriented Programming in Kotlin / Java (elective)</td><td>Introduction to computer systems</td></tr><tr><td>Web development Technology</td><td>Introduction to operating systems</td></tr><tr><td>Database management and administration</td><td>Final year Project</td></tr><tr><td>Research methodology</td><td>Final year Project</td></tr></tbody></table></figure>',1,1,'<p>This course is highly suitable for the individuals aspiring to become software engineers and also for the professionals who want to upgrade their skills. </p>','<h4>National Certificate in Software Engineering</h4><p>a) Minimum of Five (5) O level passes with at least a credit in mathematics or Physics.</p><p>b) S2 years duration</p><h4>Ordinary certificate in Software Engineering</h4><p>a) Minimum of Five (5) O level passes. </p><p>b) One (1) Year duration</p><h4>Diploma in Software engineering</h4><p>a) A principal pass in either Mathematics or Physics at A level with 5 credits in O level one being from mathematics.</p><p>b) 2 Years duration.</p>','software-engineering','software.jpg'),(5,'Database Administration',0,3,'2019-09-09','<p>Database administrators use specialized software to store and organize data. The role may include capacity planning, installation, configuration, database design, migration, performance monitoring, security, troubleshooting, as well as backup and data recovery.</p><h4>Course structure</h4><figure class=\"table\"><table><tbody><tr><td>Course</td><td>Duration</td><td>Comment</td></tr><tr><td>Introduction to System analysis and design</td><td>1 month</td><td><br>&nbsp;</td></tr><tr><td>Oracle DBMS</td><td>11/2 months</td><td>Oracle is an object-relational database management system which is widely used in today\'s business application. There is a huge demand in business enterprises for the professionals who are trained in Oracle</td></tr><tr><td>MySQL</td><td>2 Months</td><td>MySQL is a freely available open source Relational Database Management System (RDBMS) that uses Structured Query Language (SQL). SQL is the most popular language for adding, accessing and managing content in a database. It is most noted for its quick processing, proven reliability, ease and flexibility of use.&nbsp;</td></tr><tr><td>Mongo DB</td><td>21/2 Months</td><td>MongoDB is a cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schema.</td></tr></tbody></table></figure>',1,1,'<p>This course is highly suitable for the individuals aspiring to become database administrators and also for the professionals who want to upgrade their skills in data management and administration.</p>','<p>Knowledge of computer literacy and IT essentials is a key requirement for this program.</p>','database-administration','dbms.jpg');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-05 12:34:26
