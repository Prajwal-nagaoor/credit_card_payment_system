-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: credit_card_system
-- ------------------------------------------------------
-- Server version	8.0.46

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add cards',7,'add_cards'),(26,'Can change cards',7,'change_cards'),(27,'Can delete cards',7,'delete_cards'),(28,'Can view cards',7,'view_cards'),(29,'Can add transactions',8,'add_transactions'),(30,'Can change transactions',8,'change_transactions'),(31,'Can delete transactions',8,'delete_transactions'),(32,'Can view transactions',8,'view_transactions'),(33,'Can add admin logs',9,'add_adminlogs'),(34,'Can change admin logs',9,'change_adminlogs'),(35,'Can delete admin logs',9,'delete_adminlogs'),(36,'Can view admin logs',9,'view_adminlogs');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-09-26 00:22:22.791667','1','Cards object (1)',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(9,'users','adminlogs'),(7,'users','cards'),(8,'users','transactions'),(6,'users','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-26 00:09:44.073680'),(2,'contenttypes','0002_remove_content_type_name','2026-09-26 00:09:44.273650'),(3,'auth','0001_initial','2026-09-26 00:09:44.765403'),(4,'auth','0002_alter_permission_name_max_length','2026-09-26 00:09:44.887679'),(5,'auth','0003_alter_user_email_max_length','2026-09-26 00:09:44.898709'),(6,'auth','0004_alter_user_username_opts','2026-09-26 00:09:44.910827'),(7,'auth','0005_alter_user_last_login_null','2026-09-26 00:09:44.922779'),(8,'auth','0006_require_contenttypes_0002','2026-09-26 00:09:44.928157'),(9,'auth','0007_alter_validators_add_error_messages','2026-09-26 00:09:44.940528'),(10,'auth','0008_alter_user_username_max_length','2026-09-26 00:09:44.950159'),(11,'auth','0009_alter_user_last_name_max_length','2026-09-26 00:09:44.957883'),(12,'auth','0010_alter_group_name_max_length','2026-09-26 00:09:44.981626'),(13,'auth','0011_update_proxy_permissions','2026-09-26 00:09:44.989442'),(14,'auth','0012_alter_user_first_name_max_length','2026-09-26 00:09:44.999890'),(15,'users','0001_initial','2026-09-26 00:09:45.948570'),(16,'admin','0001_initial','2026-09-26 00:09:46.212965'),(17,'admin','0002_logentry_remove_auto_add','2026-09-26 00:09:46.230091'),(18,'admin','0003_logentry_add_action_flag_choices','2026-09-26 00:09:46.249599'),(19,'sessions','0001_initial','2026-09-26 00:09:46.304068'),(20,'users','0002_cards_card_type_cards_last_four_digit','2026-09-26 08:01:10.638479'),(21,'users','0003_adminlogs','2026-09-29 02:10:29.300472'),(22,'users','0004_cards_balance','2026-09-29 16:56:02.986142'),(23,'users','0005_alter_transactions_amount','2026-09-29 17:15:28.474971');
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
INSERT INTO `django_session` VALUES ('09qi1zki4t5tpojzwt8ob6we41u8mq5t','.eJxVjEEOwiAUBe_C2hCEQluX7j0DefA_UjWQlHZlvLtt0oVu38y8t_BYl-zXxrOfSFyEFaffLSA-ueyAHij3KmMtyzwFuSvyoE3eKvHrerh_Bxktb7UzYTzrMYEJpAaHga0LuutIgdMGCRFGsUNMQYF6CwdNzlIg6pMRny8UXDmi:1xBNDJ:6U2-BkkGZaqWH6Ef1a4UquYQ-8Udbf06Bil-s6pilh4','2026-10-13 02:05:01.972542'),('jueqln1a8rn7dk9zybsp3w2lhdtpcrw5','.eJxVjDsOwjAQRO_iGllrG5wsJX3OYO3HJgGUSHFSIe5OIqWAYpp5b-ZtEq1Ln9aa5zSouRpnTr8dkzzzuAN90HifrEzjMg9sd8UetNpu0vy6He7fQU-139ahXCAAR2jIYRRB5CZnYfFamIKiYgnBizsXaD20CI63RNDSRI9sPl_ryDfL:1xAG3e:UW69T8r_CuBqv06-GXsmt7UphVniCsY115xUqyd8XrM','2026-10-10 00:14:26.629334'),('o1mouicl7a8ki5kgkk2pl5443b6sljtz','.eJxVjEEOwiAUBe_C2hCEQluX7j0DefA_UjWQlHZlvLtt0oVu38y8t_BYl-zXxrOfSFyEFaffLSA-ueyAHij3KmMtyzwFuSvyoE3eKvHrerh_Bxktb7UzYTzrMYEJpAaHga0LuutIgdMGCRFGsUNMQYF6CwdNzlIg6pMRny8UXDmi:1xBZxD:4diMHJd_sRwZbBwSuUfjqtGRxOQXxCDfM4grpazz2_U','2026-10-13 15:41:15.058781');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_adminlogs`
--

DROP TABLE IF EXISTS `users_adminlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_adminlogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_adminlogs_admin_id_de88ab1e_fk_users_user_id` (`admin_id`),
  CONSTRAINT `users_adminlogs_admin_id_de88ab1e_fk_users_user_id` FOREIGN KEY (`admin_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_adminlogs`
--

LOCK TABLES `users_adminlogs` WRITE;
/*!40000 ALTER TABLE `users_adminlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_adminlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_cards`
--

DROP TABLE IF EXISTS `users_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cards` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `card_number` varchar(16) NOT NULL,
  `expiry_data` varchar(5) NOT NULL,
  `card_holder_name` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  `card_type` varchar(15) NOT NULL,
  `last_four_digit` varchar(4) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cards_user_id_4f865fc9_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_cards_user_id_4f865fc9_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cards`
--

LOCK TABLES `users_cards` WRITE;
/*!40000 ALTER TABLE `users_cards` DISABLE KEYS */;
INSERT INTO `users_cards` VALUES (1,'789545622315','12/28','prajwal',1,'CREDIT','0000',5000.00),(3,'************3459','12/28','Prajwal Naganoor',3,'CREDIT','3459',5000.00),(4,'************1111','12-28','Anjali',6,'CREDIT','1111',5000.00),(5,'************4531','12-28','Anjali',6,'DEBIT','4531',1000.00);
/*!40000 ALTER TABLE `users_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_transactions`
--

DROP TABLE IF EXISTS `users_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `card_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_transactions_card_id_937c6cd3_fk_users_cards_id` (`card_id`),
  KEY `users_transactions_user_id_4c45f3a1_fk_users_user_id` (`user_id`),
  CONSTRAINT `users_transactions_card_id_937c6cd3_fk_users_cards_id` FOREIGN KEY (`card_id`) REFERENCES `users_cards` (`id`),
  CONSTRAINT `users_transactions_user_id_4c45f3a1_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_transactions`
--

LOCK TABLES `users_transactions` WRITE;
/*!40000 ALTER TABLE `users_transactions` DISABLE KEYS */;
INSERT INTO `users_transactions` VALUES (1,500.00,'SUCCESS','2026-09-29 01:07:59.360765',3,3),(2,500.00,'SUCCESS','2026-09-29 01:08:21.612066',3,3),(3,500.00,'SUCCESS','2026-09-29 16:10:21.050304',4,6),(4,2000.00,'SUCCESS','2026-09-29 17:16:15.536879',4,6),(5,2000.00,'PENDING','2026-09-29 17:27:28.492733',5,6),(6,2000.00,'SUCCESS','2026-09-29 17:29:56.921067',5,6),(7,20000.00,'FAILED','2026-09-29 17:30:13.575841',5,6),(8,2000.00,'SUCCESS','2026-09-29 17:30:25.700323',5,6);
/*!40000 ALTER TABLE `users_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$1000000$z5IAPy9GfJnJAqA7P9xLi7$N/nQ8jGKOllFGtDYABOR9F4F4FRs53Et3HihAjVHZsE=','2026-09-26 00:14:26.622273',1,'prjawal','','',1,1,'2026-09-26 00:13:14.468569','prajwal@gmail.com'),(2,'pbkdf2_sha256$1000000$DWeSjRyHx7E6I101detAi3$+6KYjAgZv9UelQqiVvPl0/0EY2DGurrsJK1x65Gp6lY=',NULL,0,'prajwal','Prajwal','Naganoor',0,1,'2026-09-26 00:58:49.420586','prajwal@example.com'),(3,'pbkdf2_sha256$1000000$2bdTDrhw2aFgxWkXG4Tjon$YORZSgm9jWiLICVlAgwcnANqEOQOpJ14LwWiQa8DR90=',NULL,0,'Prajwal1','prajwal','naga',0,1,'2026-09-28 07:02:14.380913','prajwal1@gmail.com'),(5,'pbkdf2_sha256$1000000$wnRbFTRrCmBNZHuUTylNQf$ATYMJVQWH8dryxfgyfqibstN5difz24XZc2Jhd4Qz9I=','2026-09-29 15:41:15.051937',1,'crazy','','',1,1,'2026-09-29 01:51:14.733468','crazy@gmail.com'),(6,'pbkdf2_sha256$1000000$7WLhFb3oVxoOkW492G4KCW$zRIVEVCSRnNBt2fpgvde54OcBNpJt4WTx5YTQX5SNGE=',NULL,0,'Anju','anjali','R',0,1,'2026-09-29 16:00:53.276385','anju@gmail.com'),(7,'pbkdf2_sha256$1000000$ZQA4DRWMu4XS3IX0MF18ru$LddSBP0zcaj/ISfAz+M9YKdvvDTrq8d0ngawb6GJyNM=',NULL,1,'prajwalnaga','','',1,1,'2026-09-29 17:34:29.777751','prajwal12@gmail.com');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 23:06:44
