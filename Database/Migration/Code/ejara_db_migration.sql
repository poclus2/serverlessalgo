-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: ejara-v1-v2-migrations.c3yshfqyu6gn.us-west-2.rds.amazonaws.com    Database: ejara_db_test
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` bigint DEFAULT NULL,
  `fromModel` varchar(255) DEFAULT NULL,
  `originalRecord` longtext,
  `originalRecordId` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comission_ejara`
--

DROP TABLE IF EXISTS `comission_ejara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comission_ejara` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `amount_min` float DEFAULT NULL,
  `amount_max` float DEFAULT NULL,
  `comission_ejara_rate` decimal(6,5) DEFAULT NULL,
  `customer_type_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `transaction_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comission_ejara`
--

LOCK TABLES `comission_ejara` WRITE;
/*!40000 ALTER TABLE `comission_ejara` DISABLE KEYS */;
/*!40000 ALTER TABLE `comission_ejara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `short_country_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_prefix` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_name_fr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `short_country_code` (`short_country_code`),
  UNIQUE KEY `country_code` (`country_code`),
  UNIQUE KEY `country_prefix` (`country_prefix`),
  UNIQUE KEY `country_name_en` (`country_name_en`),
  UNIQUE KEY `country_name_fr` (`country_name_fr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_iso_alpha_code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency_iso_num_code` int DEFAULT NULL,
  `currency_is_fiat` tinyint(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `currency_iso_alpha_code` (`currency_iso_alpha_code`),
  UNIQUE KEY `currency_iso_num_code` (`currency_iso_num_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_status`
--

DROP TABLE IF EXISTS `currency_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency_is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `currency_status_description` (`currency_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_status`
--

LOCK TABLES `currency_status` WRITE;
/*!40000 ALTER TABLE `currency_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_status_history`
--

DROP TABLE IF EXISTS `currency_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `currency_status_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_status_history`
--

LOCK TABLES `currency_status_history` WRITE;
/*!40000 ALTER TABLE `currency_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastSeenAt` double DEFAULT NULL,
  `tosAcceptedByIp` varchar(255) DEFAULT NULL,
  `customer_type_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `customer_status_id` int DEFAULT NULL,
  `referrer_id` int DEFAULT NULL,
  `manager_customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_detail`
--

DROP TABLE IF EXISTS `customer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_detail` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email_address` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_detail`
--

LOCK TABLES `customer_detail` WRITE;
/*!40000 ALTER TABLE `customer_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_detail_history`
--

DROP TABLE IF EXISTS `customer_detail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_detail_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `detail_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_detail_type_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_detail_history`
--

LOCK TABLES `customer_detail_history` WRITE;
/*!40000 ALTER TABLE `customer_detail_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_detail_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_detail_type`
--

DROP TABLE IF EXISTS `customer_detail_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_detail_type` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_detail_type`
--

LOCK TABLES `customer_detail_type` WRITE;
/*!40000 ALTER TABLE `customer_detail_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_detail_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc`
--

DROP TABLE IF EXISTS `customer_kyc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `other_useful_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kyc_level_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc`
--

LOCK TABLES `customer_kyc` WRITE;
/*!40000 ALTER TABLE `customer_kyc` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc_level`
--

DROP TABLE IF EXISTS `customer_kyc_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc_level` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int DEFAULT NULL,
  `amount_max_daily` float DEFAULT NULL,
  `amount_max_weekly` float DEFAULT NULL,
  `amount_max_monthly` float DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc_level`
--

LOCK TABLES `customer_kyc_level` WRITE;
/*!40000 ALTER TABLE `customer_kyc_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc_level_history`
--

DROP TABLE IF EXISTS `customer_kyc_level_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc_level_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_kyc_level_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc_level_history`
--

LOCK TABLES `customer_kyc_level_history` WRITE;
/*!40000 ALTER TABLE `customer_kyc_level_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc_level_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc_request`
--

DROP TABLE IF EXISTS `customer_kyc_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc_request` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `request_status` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_kyc_level_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc_request`
--

LOCK TABLES `customer_kyc_request` WRITE;
/*!40000 ALTER TABLE `customer_kyc_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc_request_document`
--

DROP TABLE IF EXISTS `customer_kyc_request_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc_request_document` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `document_is_valid` tinyint(1) DEFAULT NULL,
  `customer_kyc_request_document_type_id` int DEFAULT NULL,
  `customer_kyc_request_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `reason` (`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc_request_document`
--

LOCK TABLES `customer_kyc_request_document` WRITE;
/*!40000 ALTER TABLE `customer_kyc_request_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc_request_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_kyc_request_document_type`
--

DROP TABLE IF EXISTS `customer_kyc_request_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_kyc_request_document_type` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_kyc_request_document_type`
--

LOCK TABLES `customer_kyc_request_document_type` WRITE;
/*!40000 ALTER TABLE `customer_kyc_request_document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_kyc_request_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_manager_history`
--

DROP TABLE IF EXISTS `customer_manager_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_manager_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `manager_customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_manager_history`
--

LOCK TABLES `customer_manager_history` WRITE;
/*!40000 ALTER TABLE `customer_manager_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_manager_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password`
--

DROP TABLE IF EXISTS `customer_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password_hash` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password`
--

LOCK TABLES `customer_password` WRITE;
/*!40000 ALTER TABLE `customer_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_change_reason`
--

DROP TABLE IF EXISTS `customer_password_change_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_change_reason` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_change_reason`
--

LOCK TABLES `customer_password_change_reason` WRITE;
/*!40000 ALTER TABLE `customer_password_change_reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_change_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_history`
--

DROP TABLE IF EXISTS `customer_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password_hash` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_password_change_reason_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_history`
--

LOCK TABLES `customer_password_history` WRITE;
/*!40000 ALTER TABLE `customer_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_payment_info`
--

DROP TABLE IF EXISTS `customer_payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_payment_info` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_payment_info` json DEFAULT NULL,
  `customer_payment_type_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_payment_info`
--

LOCK TABLES `customer_payment_info` WRITE;
/*!40000 ALTER TABLE `customer_payment_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_payment_type`
--

DROP TABLE IF EXISTS `customer_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_payment_type` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_payment_type_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `can_deposit` tinyint(1) DEFAULT NULL,
  `can_withdraw` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `customer_payment_type_description` (`customer_payment_type_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_payment_type`
--

LOCK TABLES `customer_payment_type` WRITE;
/*!40000 ALTER TABLE `customer_payment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phone_history`
--

DROP TABLE IF EXISTS `customer_phone_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phone_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phone_history`
--

LOCK TABLES `customer_phone_history` WRITE;
/*!40000 ALTER TABLE `customer_phone_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_phone_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_status`
--

DROP TABLE IF EXISTS `customer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `account_is_open` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `status_description` (`status_description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_status`
--

LOCK TABLES `customer_status` WRITE;
/*!40000 ALTER TABLE `customer_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_status_history`
--

DROP TABLE IF EXISTS `customer_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_status_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_status_history`
--

LOCK TABLES `customer_status_history` WRITE;
/*!40000 ALTER TABLE `customer_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_type` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_type_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `customer_type_description` (`customer_type_description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type_history`
--

DROP TABLE IF EXISTS `customer_type_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_type_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_type_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type_history`
--

LOCK TABLES `customer_type_history` WRITE;
/*!40000 ALTER TABLE `customer_type_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_type_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_username_history`
--

DROP TABLE IF EXISTS `customer_username_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_username_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_username_history`
--

LOCK TABLES `customer_username_history` WRITE;
/*!40000 ALTER TABLE `customer_username_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_username_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_offer`
--

DROP TABLE IF EXISTS `marketplace_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_offer` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `cost` float DEFAULT NULL,
  `amount_available` float DEFAULT NULL,
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `wallet_id` int DEFAULT NULL,
  `currency_id_sell` int DEFAULT NULL,
  `currency_id_buy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_offer`
--

LOCK TABLES `marketplace_offer` WRITE;
/*!40000 ALTER TABLE `marketplace_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_plan`
--

DROP TABLE IF EXISTS `referral_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_plan` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `wager_amount` int DEFAULT NULL,
  `wager_time_limit` int DEFAULT NULL,
  `fix_commission_godfather` decimal(19,4) DEFAULT NULL,
  `fix_commission_godson` decimal(19,4) DEFAULT NULL,
  `variable_commission_rate` decimal(6,5) DEFAULT NULL,
  `plan_lifetime` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `referral_plan_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_plan`
--

LOCK TABLES `referral_plan` WRITE;
/*!40000 ALTER TABLE `referral_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_plan_status`
--

DROP TABLE IF EXISTS `referral_plan_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_plan_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `referral_plan_status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `referral_plan_is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `referral_plan_status_description` (`referral_plan_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_plan_status`
--

LOCK TABLES `referral_plan_status` WRITE;
/*!40000 ALTER TABLE `referral_plan_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_plan_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_plan_status_history`
--

DROP TABLE IF EXISTS `referral_plan_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_plan_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `referralPlanId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_plan_status_history`
--

LOCK TABLES `referral_plan_status_history` WRITE;
/*!40000 ALTER TABLE `referral_plan_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_plan_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrer`
--

DROP TABLE IF EXISTS `referrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrer` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `referrer_status_id` int DEFAULT NULL,
  `referral_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrer`
--

LOCK TABLES `referrer` WRITE;
/*!40000 ALTER TABLE `referrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrer_status`
--

DROP TABLE IF EXISTS `referrer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrer_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `referrer_status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `referrer_is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `referrer_status_description` (`referrer_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrer_status`
--

LOCK TABLES `referrer_status` WRITE;
/*!40000 ALTER TABLE `referrer_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrer_status_history`
--

DROP TABLE IF EXISTS `referrer_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrer_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `referrer_status_id` int DEFAULT NULL,
  `referrer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrer_status_history`
--

LOCK TABLES `referrer_status_history` WRITE;
/*!40000 ALTER TABLE `referrer_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrer_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(19,4) DEFAULT NULL,
  `public_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `crypto_address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id_emitter` int DEFAULT NULL,
  `customer_id_receiver` int DEFAULT NULL,
  `transaction_status_id` int DEFAULT NULL,
  `transaction_type_id` int DEFAULT NULL,
  `marketplace_offer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `public_key` (`public_key`),
  UNIQUE KEY `crypto_address` (`crypto_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_detail`
--

DROP TABLE IF EXISTS `transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_detail` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `public_key_other_party` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `amount_raw` float DEFAULT NULL,
  `comission_godfather` float DEFAULT NULL,
  `comission_ejara` float DEFAULT NULL,
  `amount_net` float DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `wallet_id_main` int DEFAULT NULL,
  `wallet_id_other_party` int DEFAULT NULL,
  `transaction_type_id` int DEFAULT NULL,
  `transaction_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_detail`
--

LOCK TABLES `transaction_detail` WRITE;
/*!40000 ALTER TABLE `transaction_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_detail_status_history`
--

DROP TABLE IF EXISTS `transaction_detail_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_detail_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `transaction_status_id` int DEFAULT NULL,
  `transaction_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_detail_status_history`
--

LOCK TABLES `transaction_detail_status_history` WRITE;
/*!40000 ALTER TABLE `transaction_detail_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_detail_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_status`
--

DROP TABLE IF EXISTS `transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `transaction_status_description` (`transaction_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_status`
--

LOCK TABLES `transaction_status` WRITE;
/*!40000 ALTER TABLE `transaction_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_status_history`
--

DROP TABLE IF EXISTS `transaction_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `transaction_status_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_status_history`
--

LOCK TABLES `transaction_status_history` WRITE;
/*!40000 ALTER TABLE `transaction_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_type_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `transaction_type_description` (`transaction_type_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(19,4) DEFAULT NULL,
  `public_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `crypto_address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `wallet_status_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `wallet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `public_key` (`public_key`),
  UNIQUE KEY `crypto_address` (`crypto_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_addition_method`
--

DROP TABLE IF EXISTS `wallet_addition_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_addition_method` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_addition_method`
--

LOCK TABLES `wallet_addition_method` WRITE;
/*!40000 ALTER TABLE `wallet_addition_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_addition_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_balance_history`
--

DROP TABLE IF EXISTS `wallet_balance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_balance_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(19,4) DEFAULT NULL,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `wallet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_balance_history`
--

LOCK TABLES `wallet_balance_history` WRITE;
/*!40000 ALTER TABLE `wallet_balance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_balance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_status`
--

DROP TABLE IF EXISTS `wallet_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_status` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `wallet_status_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `wallet_is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `wallet_status_description` (`wallet_status_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_status`
--

LOCK TABLES `wallet_status` WRITE;
/*!40000 ALTER TABLE `wallet_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_status_history`
--

DROP TABLE IF EXISTS `wallet_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_status_history` (
  `date_creation` bigint DEFAULT NULL,
  `date_update` bigint DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `date_begin` double DEFAULT NULL,
  `date_end` double DEFAULT NULL,
  `wallet_status_id` int DEFAULT NULL,
  `wallet_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_status_history`
--

LOCK TABLES `wallet_status_history` WRITE;
/*!40000 ALTER TABLE `wallet_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ejara_db_test'
--

--
-- Dumping routines for database 'ejara_db_test'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24 18:08:22
