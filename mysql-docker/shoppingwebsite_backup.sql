-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: shoppingwebsite
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Table structure for table `app_cart`
--

DROP TABLE IF EXISTS `app_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_cart_user_id_2bf07879_fk_auth_user_id` (`user_id`),
  KEY `app_cart_product_id_a4171918_fk` (`product_id`),
  CONSTRAINT `app_cart_product_id_a4171918_fk` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`),
  CONSTRAINT `app_cart_user_id_2bf07879_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `app_cart_quantity_09f6c4b4_check` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cart`
--

LOCK TABLES `app_cart` WRITE;
/*!40000 ALTER TABLE `app_cart` DISABLE KEYS */;
INSERT INTO `app_cart` VALUES (66,2,9,5),(70,1,4,1),(74,1,9,11);
/*!40000 ALTER TABLE `app_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_customer`
--

DROP TABLE IF EXISTS `app_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `locality` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zipcode` int NOT NULL,
  `state` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_customer_user_id_e6e52921` (`user_id`),
  CONSTRAINT `app_customer_user_id_e6e52921_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_customer`
--

LOCK TABLES `app_customer` WRITE;
/*!40000 ALTER TABLE `app_customer` DISABLE KEYS */;
INSERT INTO `app_customer` VALUES (1,'Lalpur','Ranchi',829856,'Jharkhand',1,'Admin'),(2,'','Dhanbad',895465,'Jharkhand',2,'Sonam Sharma'),(3,'Hirapur','Dhanbad',826001,'Jharkhand',3,'Sahil'),(4,'Chas','Bokaro',876578,'Jharkhand',3,'Sahil Aloti'),(5,'Railway Colony','Dhanbad',876567,'Jharkhand',3,'Jiya'),(6,'india','delhi',110092,'Delhi',6,'bijay mandal'),(7,'Indian','New Delhi',110048,'Delhi',1,'Rajan Srivastava'),(8,'Lucknow','Lucknow',134566,'Uttar Pradesh',8,'Chhavi Srivastava'),(9,'Delhi','East Delhi',110051,'Delhi',9,'Satnam'),(10,'East Delhi','Delhi',110084,'Delhi',9,'Satnam Singh'),(11,'East Delhi','Delhi',110084,'Delhi',9,'Satnam Singh'),(12,'1238hsakdd','lahore',54000,'Punjab',10,'saad zahid');
/*!40000 ALTER TABLE `app_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_orderplaced`
--

DROP TABLE IF EXISTS `app_orderplaced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_orderplaced` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ordered_date` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int unsigned NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_orderplaced_user_id_3c6fe1e1_fk_auth_user_id` (`user_id`),
  KEY `app_orderplaced_customer_id_9d02fbb6_fk` (`customer_id`),
  KEY `app_orderplaced_product_id_90c7863a_fk` (`product_id`),
  CONSTRAINT `app_orderplaced_customer_id_9d02fbb6_fk` FOREIGN KEY (`customer_id`) REFERENCES `app_customer` (`id`),
  CONSTRAINT `app_orderplaced_product_id_90c7863a_fk` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`),
  CONSTRAINT `app_orderplaced_user_id_3c6fe1e1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `app_orderplaced_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_orderplaced`
--

LOCK TABLES `app_orderplaced` WRITE;
/*!40000 ALTER TABLE `app_orderplaced` DISABLE KEYS */;
INSERT INTO `app_orderplaced` VALUES (33,'2021-01-18 12:42:16.658000','Cancel',1,10,1,1),(34,'2021-01-18 12:42:16.668000','Delivered',1,3,1,1),(35,'2021-01-19 05:00:35.463000','Pending',3,12,1,3),(36,'2021-01-19 05:01:59.336000','Pending',3,10,2,5),(37,'2021-01-27 07:15:24.455000','Pending',2,10,1,2),(38,'2021-04-04 19:04:14.611000','Pending',1,15,1,1),(39,'2022-05-13 11:17:09.901000','Pending',8,31,1,8),(40,'2023-01-29 17:10:50.121000','Delivered',9,15,1,9),(41,'2023-01-29 17:14:59.892000','Delivered',9,17,1,9),(42,'2025-03-06 21:24:06.004000','Pending',10,9,1,12);
/*!40000 ALTER TABLE `app_orderplaced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_product`
--

DROP TABLE IF EXISTS `app_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `selling_price` double NOT NULL,
  `discounted_price` double NOT NULL,
  `description` longtext NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` varchar(2) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (1,'TShirt 1',400,300,'This is good quality tshirt','Safira','TW','productimg/tw1.jpg'),(2,'Tshirt 2',500,300,'This is nice TShirt','Safira','TW','productimg/tw2.jpg'),(3,'TShirt 3',600,450,'Nice TShirt','Bajaj','TW','productimg/tw3.jpg'),(4,'T Shirt 4',900,700,'Nice TShirt hai','Bajaj','TW','productimg/tw4.jpg'),(5,'TShirt 5',400,250,'Good Tshirt','Bajaj','TW','productimg/tw5.jpg'),(6,'TShirt 6',300,150,'Good tshirt','Safira','TW','productimg/tw6.jpg'),(7,'T Shirt 7',650,320,'Nice TShirt','Safira','TW','productimg/tw7.jpg'),(8,'Girl Top',400,350,'Nice','Safira','TW','productimg/tw8.jpg'),(9,'Jeans 1',700,390,'Nice Jeans','Lee','BW','productimg/bw1.jpg'),(10,'Jeans 2',650,360,'Good Jeans','Lee','BW','productimg/bw2.jpg'),(11,'Jeans 3',600,550,'Nice Jeans','Lee','BW','productimg/bw3.jpg'),(12,'Jeans 4',900,800,'Good Quality Jeans','Spykar','BW','productimg/bw4.jpg'),(13,'Jeans 5',700,450,'Nice Jeans','Spykar','BW','productimg/bw5.jpg'),(14,'Jeans 6',600,305,'Good Jeans','Lee','BW','productimg/bw6.jpg'),(15,'Redmi Pro 2',15000,13999,'Nice Mobile','Redmi','M','productimg/m1.jpg'),(16,'Redmi Pro 3',6999,4999,'Good Mobile with Camera','Redmi','M','productimg/m2.jpg'),(17,'Samsung NT 2',14999,10999,'Good Mobile','Samsung','M','productimg/m3.jpg'),(18,'Samsung Pro 4',5999,3999,'Nice Mobile with 6 GB RAM','Samsung','M','productimg/m4.jpg'),(19,'Redmi 7',7999,2999,'Redmi Mobile Cheap','Redmi','M','productimg/m5.jpg'),(20,'Redmi 9',8999,1999,'Good Mobile','Redmi','M','productimg/m6.jpg'),(21,'Samsung J 2',8999,5999,'Nice Mobile','Samsung','M','productimg/m7.jpg'),(30,'Lenovo IdeaPad S540 10th Gen Intel Core i5 15.6-inch Full HD',69500,64000,'Nice Laptop','Lenovo','L','productimg/Lenovo.jpg'),(31,'Apple iPhone 12 Pro Max 512 GB, Graphite',159900,158000,'Excellent Phone With Excellent Features','Apple','M','productimg/iphone.jpg'),(32,'Dell Inspiron 15 3567',35855,27112,'Nice Laptop','Dell','L','productimg/Dell3.jpg'),(33,'HP Chromebook Touchscreen Laptop',31496,24480,'Awesome Laptop','HP','L','productimg/hp1.jpg'),(34,'HP 15s-du3047TX Laptop',75898,63999,'Very nice Laptop','HP','L','productimg/hp2.jpg'),(35,'Dell 5593 Laptop',65499,62100,'Very Nice Laptop','Dell','L','productimg/dell4.jpg'),(36,'Lenovo IdeaPad S145',83368,56990,'Good Laptop with amazing features','Lenovo','L','productimg/lenovo1.jpg'),(37,'Apple iPhone 11 Pro',99900,79999,'Excellent Phone With Awesome Features','Apple','M','productimg/Apple1.jpg'),(38,'Apple iPhone 12 Mini',75000,69900,'Very Nice Phone','Apple','M','productimg/Apple2.jpg'),(39,'Apple iPhone XR',52900,46999,'Good Product','Apple','M','productimg/Apple_3.jpeg');
/*!40000 ALTER TABLE `app_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cart',7,'add_cart'),(26,'Can change cart',7,'change_cart'),(27,'Can delete cart',7,'delete_cart'),(28,'Can view cart',7,'view_cart'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add order placed',9,'add_orderplaced'),(34,'Can change order placed',9,'change_orderplaced'),(35,'Can delete order placed',9,'delete_orderplaced'),(36,'Can view order placed',9,'view_orderplaced'),(37,'Can add customer',10,'add_customer'),(38,'Can change customer',10,'change_customer'),(39,'Can delete customer',10,'delete_customer'),(40,'Can view customer',10,'view_customer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$airrqx6R6phcIUupfVE9IE$xtqqGYqRXQks5kt/g6y1lmb7sOjWlVitlcVo8QO8RgM=','2023-01-29 17:15:20.975000',1,'admin','Admin','Kumar','admin@gmail.com',1,1,'2021-01-12 08:08:19.000000'),(2,'pbkdf2_sha256$216000$kGXDnAnKgoEn$bWWsCViKmnVVAJxahjbkdhMSu594Ia3P+yTDqzk5AzM=','2021-01-27 07:13:34.481000',0,'sonam','','','sonam@gmail.com',0,1,'2021-01-12 15:56:46.042000'),(3,'pbkdf2_sha256$216000$Rp1wTWSZylQP$DXVeMFB3UaxuC96FqcO1jljHExckLuFSghdmSXqBYeI=','2021-01-19 04:59:32.972000',0,'sahil','Sahil','','sahil@gmail.com',0,1,'2021-01-13 08:34:24.454000'),(4,'pbkdf2_sha256$216000$xAu01EQ0Hbn4$/kkK1StwAuICWpdFb1DhbmZLhA+VwbyiB9OgYywV0OQ=','2021-01-13 10:35:35.085000',0,'rose','','','rose@gmail.com',0,1,'2021-01-13 10:18:24.099000'),(5,'pbkdf2_sha256$216000$aCibukSpsSYW$xNDhy4Dgun3/ukObjSsWzBU4Y8qDHV9xH6yjWtjTT+4=','2021-01-19 05:05:24.652000',0,'jiya','','','jiya@gmail.com',0,1,'2021-01-19 05:03:19.609000'),(6,'pbkdf2_sha256$216000$I1iS3sqpaprY$0MvMPPle0Gfi08wtsHo4HRMTy6xM9DHAZBGp089Ral4=','2021-03-25 18:10:41.697000',0,'bijay','','','BIJAY@gmail.com',0,1,'2021-03-25 18:09:50.171000'),(7,'pbkdf2_sha256$216000$k2Z4NZ2BcGuo$rUSQkgZUN0QSFfjsYWsv0lhFI5cmbz5eDjVp+Sf1/1M=',NULL,0,'rajansrivastava','','','rajankumars8899@gmail.com',0,1,'2021-04-05 04:50:01.548000'),(8,'pbkdf2_sha256$216000$nu9DNa7ZtvvU$Zm87iMfHKka/d0PoDpQxWiaKPn+WAayozNlrRyfTlwA=','2022-05-13 11:14:33.073000',0,'rajan8899','','','rajansri@gmail.com',0,1,'2022-05-13 11:14:06.980000'),(9,'pbkdf2_sha256$390000$7oa6xtg0KsszpMo3DSOdhw$5iIAR6+RuyGt9tgb/4I0jc4JZpKjXwkdw+dy1LA23V8=','2023-01-29 17:16:17.324000',1,'22_satnam','','','22satnamje@gmail.com',0,1,'2023-01-29 17:09:00.000000'),(10,'pbkdf2_sha256$600000$4PO6WA82AoyOdCEvUQhilE$7E9n7cWZA3rr9/I0cDs5zYn0DGAJIYKah52DgkS/eCs=','2025-03-07 22:16:48.610132',0,'saad','','','saadzahid248@gmail.com',0,1,'2025-03-06 21:10:26.549000'),(11,'pbkdf2_sha256$600000$Co0nz41N7BCQLsiy218xAU$56ZIXKgFu01vf/I6eeXKPm5Dyu1NocP7coTnaTbOFhE=','2025-03-06 21:24:42.479000',1,'muhammadsaad','','','dexent070707@gmail.com',1,1,'2025-03-06 21:13:08.131000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-12 08:51:33.518000','1','TShirt 1',1,'[{\"added\": {}}]',8,1),(2,'2021-01-12 08:52:17.764000','2','Tshirt 2',1,'[{\"added\": {}}]',8,1),(3,'2021-01-12 08:53:22.690000','3','TShirt 3',1,'[{\"added\": {}}]',8,1),(4,'2021-01-12 08:53:53.387000','4','T Shirt 4',1,'[{\"added\": {}}]',8,1),(5,'2021-01-12 08:54:23.401000','5','TShirt 5',1,'[{\"added\": {}}]',8,1),(6,'2021-01-12 08:54:51.363000','6','TShirt 6',1,'[{\"added\": {}}]',8,1),(7,'2021-01-12 08:55:29.006000','7','T Shirt 7',1,'[{\"added\": {}}]',8,1),(8,'2021-01-12 08:55:58.504000','8','Girl Top',1,'[{\"added\": {}}]',8,1),(9,'2021-01-12 08:56:51.455000','9','Jeans 1',1,'[{\"added\": {}}]',8,1),(10,'2021-01-12 08:57:20.068000','10','Jeans 2',1,'[{\"added\": {}}]',8,1),(11,'2021-01-12 08:57:50.974000','11','Jeans 3',1,'[{\"added\": {}}]',8,1),(12,'2021-01-12 08:59:06.532000','12','Jeans 4',1,'[{\"added\": {}}]',8,1),(13,'2021-01-12 08:59:27.636000','13','Jeans 5',1,'[{\"added\": {}}]',8,1),(14,'2021-01-12 08:59:50.615000','14','Jeans 6',1,'[{\"added\": {}}]',8,1),(15,'2021-01-12 09:00:34.036000','15','Redmi Pro 2',1,'[{\"added\": {}}]',8,1),(16,'2021-01-12 09:01:05.932000','16','Redmi Pro 3',1,'[{\"added\": {}}]',8,1),(17,'2021-01-12 09:01:50.709000','17','Samsung NT 2',1,'[{\"added\": {}}]',8,1),(18,'2021-01-12 09:02:34.098000','18','Samsung Pro 4',1,'[{\"added\": {}}]',8,1),(19,'2021-01-12 09:03:05.588000','19','Redmi 7',1,'[{\"added\": {}}]',8,1),(20,'2021-01-12 09:03:33.580000','20','Redmi 9',1,'[{\"added\": {}}]',8,1),(21,'2021-01-12 09:04:02.423000','21','Samsung J 2',1,'[{\"added\": {}}]',8,1),(22,'2021-01-12 10:38:42.527000','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(23,'2021-01-12 10:39:10.118000','1','admin',1,'[{\"added\": {}}]',10,1),(24,'2021-01-13 08:24:36.466000','2','sonam',1,'[{\"added\": {}}]',10,1),(25,'2021-01-13 08:44:38.385000','1','admin',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',10,1),(26,'2021-01-16 09:15:10.815000','9','Cart object (9)',3,'',7,1),(27,'2021-01-16 09:15:10.818000','8','Cart object (8)',3,'',7,1),(28,'2021-01-16 09:15:10.821000','1','Cart object (1)',3,'',7,1),(29,'2021-01-16 16:00:00.577000','3','Cart object (3)',3,'',7,1),(30,'2021-01-17 06:53:29.371000','26','Cart object (26)',3,'',7,1),(31,'2021-01-17 06:53:29.375000','25','Cart object (25)',3,'',7,1),(32,'2021-01-17 06:53:29.377000','23','Cart object (23)',3,'',7,1),(33,'2021-01-17 07:21:47.024000','30','Cart object (30)',3,'',7,1),(34,'2021-01-17 07:21:47.029000','19','Cart object (19)',3,'',7,1),(35,'2021-01-17 08:31:25.878000','34','Cart object (34)',3,'',7,1),(36,'2021-01-18 06:04:56.300000','1','OrderPlaced object (1)',3,'',9,1),(37,'2021-01-18 09:11:33.005000','9','OrderPlaced object (9)',3,'',9,1),(38,'2021-01-18 09:11:33.008000','8','OrderPlaced object (8)',3,'',9,1),(39,'2021-01-18 09:11:33.012000','7','OrderPlaced object (7)',3,'',9,1),(40,'2021-01-18 10:54:01.481000','10','OrderPlaced object (10)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(41,'2021-01-18 10:59:19.707000','18','OrderPlaced object (18)',3,'',9,1),(42,'2021-01-18 10:59:19.712000','17','OrderPlaced object (17)',3,'',9,1),(43,'2021-01-18 10:59:19.714000','16','OrderPlaced object (16)',3,'',9,1),(44,'2021-01-18 10:59:19.717000','15','OrderPlaced object (15)',3,'',9,1),(45,'2021-01-18 10:59:19.719000','14','OrderPlaced object (14)',3,'',9,1),(46,'2021-01-18 10:59:19.722000','13','OrderPlaced object (13)',3,'',9,1),(47,'2021-01-18 10:59:19.726000','12','OrderPlaced object (12)',3,'',9,1),(48,'2021-01-18 10:59:19.729000','11','OrderPlaced object (11)',3,'',9,1),(49,'2021-01-18 10:59:19.731000','10','OrderPlaced object (10)',3,'',9,1),(50,'2021-01-18 11:01:26.907000','20','OrderPlaced object (20)',3,'',9,1),(51,'2021-01-18 11:01:26.910000','19','OrderPlaced object (19)',3,'',9,1),(52,'2021-01-18 11:02:34.864000','22','OrderPlaced object (22)',3,'',9,1),(53,'2021-01-18 11:02:34.868000','21','OrderPlaced object (21)',3,'',9,1),(54,'2021-01-18 11:03:28.771000','25','OrderPlaced object (25)',3,'',9,1),(55,'2021-01-18 11:03:28.775000','24','OrderPlaced object (24)',3,'',9,1),(56,'2021-01-18 11:03:28.778000','23','OrderPlaced object (23)',3,'',9,1),(57,'2021-01-18 12:40:36.487000','32','OrderPlaced object (32)',3,'',9,1),(58,'2021-01-18 12:40:36.491000','31','OrderPlaced object (31)',3,'',9,1),(59,'2021-01-18 12:40:36.493000','30','OrderPlaced object (30)',3,'',9,1),(60,'2021-01-18 12:40:36.497000','29','OrderPlaced object (29)',3,'',9,1),(61,'2021-01-18 12:40:36.499000','28','OrderPlaced object (28)',3,'',9,1),(62,'2021-01-18 12:40:36.502000','27','OrderPlaced object (27)',3,'',9,1),(63,'2021-01-18 12:40:36.504000','26','OrderPlaced object (26)',3,'',9,1),(64,'2021-01-18 12:57:59.753000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(65,'2021-01-18 12:58:15.589000','33','OrderPlaced object (33)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(66,'2021-01-18 12:58:30.859000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(67,'2021-01-18 13:13:22.590000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(68,'2021-01-18 13:13:41.533000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(69,'2021-01-18 13:17:48.949000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(70,'2021-01-18 13:18:00.186000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(71,'2021-01-18 13:19:15.116000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(72,'2021-01-18 13:19:24.470000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(73,'2021-01-18 13:19:33.517000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(74,'2021-01-18 13:19:47.093000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(75,'2021-01-18 13:28:44.270000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(76,'2021-01-18 13:28:56.452000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(77,'2021-01-18 13:29:33.201000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(78,'2021-01-18 13:29:48.415000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(79,'2021-01-18 13:29:57.268000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(80,'2021-01-18 13:30:07.473000','34','OrderPlaced object (34)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(81,'2021-04-02 08:52:19.209000','22','22',1,'[{\"added\": {}}]',8,1),(82,'2021-04-03 07:34:28.753000','23','23',1,'[{\"added\": {}}]',8,1),(83,'2021-04-03 07:47:06.728000','23','23',3,'',8,1),(84,'2021-04-03 07:53:58.773000','24','24',1,'[{\"added\": {}}]',8,1),(85,'2021-04-03 07:57:29.170000','25','25',1,'[{\"added\": {}}]',8,1),(86,'2021-04-03 08:34:20.487000','26','26',1,'[{\"added\": {}}]',8,1),(87,'2021-04-03 08:38:30.158000','24','24',3,'',8,1),(88,'2021-04-03 08:38:30.174000','25','25',3,'',8,1),(89,'2021-04-03 08:38:30.182000','26','26',3,'',8,1),(90,'2021-04-03 08:38:30.190000','22','22',3,'',8,1),(91,'2021-04-03 08:40:37.237000','27','27',1,'[{\"added\": {}}]',8,1),(92,'2021-04-03 08:43:35.116000','28','28',1,'[{\"added\": {}}]',8,1),(93,'2021-04-03 08:45:43.792000','29','29',1,'[{\"added\": {}}]',8,1),(94,'2021-04-03 17:36:12.820000','30','30',1,'[{\"added\": {}}]',8,1),(95,'2021-04-04 18:04:55.725000','29','29',3,'',8,1),(96,'2021-04-04 18:04:55.741000','27','27',3,'',8,1),(97,'2021-04-04 18:13:25.730000','28','28',3,'',8,1),(98,'2021-04-04 18:23:06.522000','31','31',1,'[{\"added\": {}}]',8,1),(99,'2021-04-04 18:40:40.926000','32','32',1,'[{\"added\": {}}]',8,1),(100,'2021-04-04 18:43:04.955000','33','33',1,'[{\"added\": {}}]',8,1),(101,'2021-04-04 18:54:03.460000','34','34',1,'[{\"added\": {}}]',8,1),(102,'2021-04-04 18:57:55.197000','35','35',1,'[{\"added\": {}}]',8,1),(103,'2021-04-04 19:03:31.567000','36','36',1,'[{\"added\": {}}]',8,1),(104,'2021-04-06 06:06:03.004000','37','37',1,'[{\"added\": {}}]',8,1),(105,'2021-04-06 06:10:56.445000','38','38',1,'[{\"added\": {}}]',8,1),(106,'2021-04-06 06:21:53.833000','39','39',1,'[{\"added\": {}}]',8,1),(107,'2023-01-29 17:12:24.403000','40','OrderPlaced object (40)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1),(108,'2023-01-29 17:14:02.060000','9','22_satnam',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(109,'2023-01-29 17:15:52.167000','41','OrderPlaced object (41)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','cart'),(10,'app','customer'),(9,'app','orderplaced'),(8,'app','product'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-07 21:09:00.829012'),(2,'auth','0001_initial','2025-03-07 21:09:06.741834'),(3,'admin','0001_initial','2025-03-07 21:09:08.145973'),(4,'admin','0002_logentry_remove_auto_add','2025-03-07 21:09:08.219618'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-07 21:09:08.283924'),(6,'app','0001_initial','2025-03-07 21:09:11.902625'),(7,'app','0002_auto_20210113_1412','2025-03-07 21:09:12.537728'),(8,'app','0003_auto_20210113_1545','2025-03-07 21:09:12.723394'),(9,'app','0004_auto_20210113_1547','2025-03-07 21:09:12.859910'),(10,'app','0005_auto_20210113_1609','2025-03-07 21:09:12.982091'),(11,'app','0006_auto_20210113_2006','2025-03-07 21:09:13.942735'),(12,'app','0007_auto_20210117_2100','2025-03-07 21:09:15.140925'),(13,'app','0008_auto_20210117_2101','2025-03-07 21:09:15.199877'),(14,'app','0009_auto_20210118_1245','2025-03-07 21:09:17.241151'),(15,'app','0010_orderplaced_customer','2025-03-07 21:09:18.035694'),(16,'contenttypes','0002_remove_content_type_name','2025-03-07 21:09:19.041142'),(17,'auth','0002_alter_permission_name_max_length','2025-03-07 21:09:19.642009'),(18,'auth','0003_alter_user_email_max_length','2025-03-07 21:09:19.900884'),(19,'auth','0004_alter_user_username_opts','2025-03-07 21:09:19.956056'),(20,'auth','0005_alter_user_last_login_null','2025-03-07 21:09:20.470011'),(21,'auth','0006_require_contenttypes_0002','2025-03-07 21:09:20.519838'),(22,'auth','0007_alter_validators_add_error_messages','2025-03-07 21:09:20.588004'),(23,'auth','0008_alter_user_username_max_length','2025-03-07 21:09:21.302236'),(24,'auth','0009_alter_user_last_name_max_length','2025-03-07 21:09:22.008730'),(25,'auth','0010_alter_group_name_max_length','2025-03-07 21:09:22.136319'),(26,'auth','0011_update_proxy_permissions','2025-03-07 21:09:22.186834'),(27,'auth','0012_alter_user_first_name_max_length','2025-03-07 21:09:22.826872'),(28,'sessions','0001_initial','2025-03-07 21:09:23.192905'),(29,'app','0011_alter_cart_id_alter_customer_id_alter_orderplaced_id_and_more','2025-03-07 21:52:11.742817');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5auk0cgdkhbt2e8oz29mtz5uwlth6njy','.eJxVjEEOwiAQRe_C2pApU6G4dN8zNDMMSNVAUtqV8e7apAvd_vfef6mJtjVPW4vLNIu6qA7U6XdkCo9YdiJ3KreqQy3rMrPeFX3Qpscq8Xk93L-DTC1_ayRGTOKREGPwLGABjOkw9WffCwR2wQoaZ4aBbY_eAYTB-UTJR2an3h_74zfS:1tqfzs:ChDFE6rmc3s0GqTXHegixGf1pOmw0h1bF57EipTOrMc','2025-03-21 22:16:48.809690'),('6p75b2wogh6v7lxg7t4g0bv5oqx91uvh','.eJxVjDEOwjAMRe-SGUUJTpWakZ0zRHbskAJqpaadKu4OlTrA-t97fzOJ1qWmtemcBjEX4705_Y5M-anjTuRB432yeRqXeWC7K_agzd4m0df1cP8OKrX6rYMQYECgDjEGINHszyFG9tqhg6KQFUHE9SzFC3DvXGDOMWoJxaF5fwAFIDhr:1tqIhu:XtWOhrNteQyN7KhRHsdFKu5DzFDvWluIGTo7v_5SG5s','2025-03-20 21:24:42.490000'),('af1zcmj5608f6c1g7zqgew1m5mv38xf6','.eJxVjDsOwjAQBe_iGlmOvwklPWewdu1dHEC2FCcV4u4QKQW0b2beS0TY1hK3TkucsziLQZx-N4T0oLqDfId6azK1ui4zyl2RB-3y2jI9L4f7d1Cgl28NaCmB5skaSoqC88SAI2utPFhrdVA5DClzYMNOjWjBs-NgfEajJy_eHwc-OGQ:1npTKK:ws5GSbxCDjGt8v7Y6eAUQUEvjohNQKzVp4KpFcjoGN8','2022-05-27 11:19:20.284000'),('ed9ba0h5tq30d4fh6gtvk8nvuj0fpowl','.eJxVjEEOwiAQRe_CuiFDpy3g0r1nIAMMUjWQlHZlvLs26cJu_3vvv4Wjbc1ua7y4OYqLQNH9b57Ck8sO4oPKvcpQy7rMXu6KPGiTtxr5dT3c00Gmln81UUKtwCjPkVCj7Zk0YwTD2nhlYQIYTM8AqMEnNoOaRhuSSqNl4iA-X91uN80:1l0QHx:HvfzRDH_nKnsr36_YZInkUrzF0GdkYIjKKrFyy60h0w','2021-01-29 14:41:21.193000'),('ntvv81q1wyi6auygjmcqpy3wmztnw8l3','.eJxVjDsOwjAQBe_iGlmOvwklPWewdu1dHEC2FCcV4u4QKQW0b2beS0TY1hK3TkucsziLQZx-N4T0oLqDfId6azK1ui4zyl2RB-3y2jI9L4f7d1Cgl28NaCmB5skaSoqC88SAI2utPFhrdVA5DClzYMNOjWjBs-NgfEajJy_eHwc-OGQ:1lTHDZ:ne-F4KKevrJiIOgzwdyBxSopROV5ofmGVd0pusGxOCw','2021-04-19 04:52:05.591000'),('pb24y6zpg1xi4cmiqykzjhwppos2wrim','.eJxVjEEOwiAQRe_CuiFDpy3g0r1nIAMMUjWQlHZlvLs26cJu_3vvv4Wjbc1ua7y4OYqLQNH9b57Ck8sO4oPKvcpQy7rMXu6KPGiTtxr5dT3c00Gmln81UUKtwCjPkVCj7Zk0YwTD2nhlYQIYTM8AqMEnNoOaRhuSSqNl4iA-X91uN80:1l1PqK:ahp2vSXNfZ6wT6ygTbJMimauo1H9JlB7giVOpkIJOlc','2021-02-01 08:24:56.098000'),('ptgg8zp78xnw0lv0evyn5f31zd5hhtc3','.eJxVjDsOwjAQBe_iGlmOvwklPWewdu1dHEC2FCcV4u4QKQW0b2beS0TY1hK3TkucsziLQZx-N4T0oLqDfId6azK1ui4zyl2RB-3y2jI9L4f7d1Cgl28NaCmB5skaSoqC88SAI2utPFhrdVA5DClzYMNOjWjBs-NgfEajJy_eHwc-OGQ:1lPUV2:v8fmaBM_CV6ici9ezLfbfT4DvzoROIam3CN7fUViIM0','2021-04-08 18:14:28.665000'),('qan7ndw52sy515rb5h8gl6n2y9gqhf86','.eJxVjDsOwjAQBe_iGlmOvwklPWewdu1dHEC2FCcV4u4QKQW0b2beS0TY1hK3TkucsziLQZx-N4T0oLqDfId6azK1ui4zyl2RB-3y2jI9L4f7d1Cgl28NaCmB5skaSoqC88SAI2utPFhrdVA5DClzYMNOjWjBs-NgfEajJy_eHwc-OGQ:1l1NBI:-BzxKV0bSiOOZYz5Nr_OTuSlm98kdJHbG_AYNudmVCQ','2021-02-01 05:34:24.108000'),('tbvpx0uoxfa4i0zurhf06p2unabsdyrb','.eJxVjEEOwiAQRe_CuiFDpy3g0r1nIAMMUjWQlHZlvLs26cJu_3vvv4Wjbc1ua7y4OYqLQNH9b57Ck8sO4oPKvcpQy7rMXu6KPGiTtxr5dT3c00Gmln81UUKtwCjPkVCj7Zk0YwTD2nhlYQIYTM8AqMEnNoOaRhuSSqNl4iA-X91uN80:1l0oJu:K2DseNK4e2s9_mpH8JUkQjGDwFiRzFXdJQCwD1olA2k','2021-01-30 16:20:58.019000'),('z4vdre4htl5ewbvfwewygg79kt3uyzrn','.eJxVjDsOwjAQBe_iGln2Jv5R0nMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVZBHH63QjTg9sO8h3bbZZpbusykdwVedAur3Pm5-Vw_w4q9vqttUGtFHkNo4LCdmQ2lCwV0C4oGLxFZ4G9VzqUnME4Y6B4TjgiqYHE-wPHJjdn:1pMBHt:49qZ41RUGlUVhKPuxTVELICnvCI4bJwnmxzBCeQvdqw','2023-02-12 17:16:17.332000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 12:11:14
