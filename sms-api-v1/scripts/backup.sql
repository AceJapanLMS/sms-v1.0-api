-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: sms-v1.2
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `academic_settings`
--

DROP TABLE IF EXISTS `academic_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attendance_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'section',
  `marks_submission_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_settings`
--

LOCK TABLES `academic_settings` WRITE;
/*!40000 ALTER TABLE `academic_settings` DISABLE KEYS */;
INSERT INTO `academic_settings` VALUES (1,'1','on','2025-06-12 10:16:00','2025-06-12 10:16:00');
/*!40000 ALTER TABLE `academic_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criteria`
--

DROP TABLE IF EXISTS `assessment_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_criteria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criteria_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `criteria_name` (`criteria_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criteria`
--

LOCK TABLES `assessment_criteria` WRITE;
/*!40000 ALTER TABLE `assessment_criteria` DISABLE KEYS */;
INSERT INTO `assessment_criteria` VALUES (1,'Communication',1,NULL,NULL),(2,'Collaboration',2,NULL,NULL),(3,'Creativity and Innovation',3,NULL,NULL),(4,'Critical Thinking',4,NULL,NULL),(5,'Citizenship',5,NULL,NULL);
/*!40000 ALTER TABLE `assessment_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_teachers`
--

DROP TABLE IF EXISTS `assigned_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_main_on_class_subject` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_teachers`
--

LOCK TABLES `assigned_teachers` WRITE;
/*!40000 ALTER TABLE `assigned_teachers` DISABLE KEYS */;
INSERT INTO `assigned_teachers` VALUES (2,4,1,1,1,5,1,'2025-06-17 09:06:51','2025-07-23 01:51:46',0),(3,4,1,1,1,7,1,'2025-06-17 09:08:26','2025-07-23 01:55:59',0),(7,7,1,1,1,1,1,'2025-06-30 01:29:21','2025-07-23 01:57:51',0),(8,7,1,1,1,3,1,'2025-06-30 04:59:33','2025-06-30 04:59:33',1),(9,15,1,2,1,5,1,'2025-07-11 00:32:19','2025-07-11 00:32:19',1),(11,14,1,4,1,9,1,'2025-07-15 21:15:24','2025-07-15 21:15:24',1),(13,14,1,1,1,20,1,'2025-08-13 21:41:20','2025-08-26 02:29:54',0),(14,17,1,1,1,19,1,'2025-08-14 01:08:39','2025-09-02 01:56:25',1),(15,17,1,3,1,22,1,'2025-08-14 02:12:42','2025-08-26 02:29:37',0),(16,26,1,2,1,23,1,'2025-08-27 01:11:14','2025-08-27 02:06:04',0),(17,26,1,3,1,22,1,'2025-08-27 01:59:16','2025-08-27 02:06:09',1);
/*!40000 ALTER TABLE `assigned_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `assignment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignment_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_shifts`
--

DROP TABLE IF EXISTS `attendance_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_time` time NOT NULL,
  `late_after` time NOT NULL,
  `out_time` time NOT NULL,
  `early_out_before` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_shifts`
--

LOCK TABLES `attendance_shifts` WRITE;
/*!40000 ALTER TABLE `attendance_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int unsigned NOT NULL DEFAULT '0',
  `student_id` int unsigned NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attendanced_date` timestamp NOT NULL,
  `attendance_shift_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (62,1,8,'present',1,'2025-07-07 20:08:04','2025-07-07 20:08:04',NULL,'2025-07-07 17:30:00',0),(63,1,9,'present',1,'2025-07-07 20:08:04','2025-07-07 20:08:04',NULL,'2025-07-07 17:30:00',0),(64,1,10,'present',1,'2025-07-07 20:08:04','2025-07-07 20:08:04',NULL,'2025-07-07 17:30:00',0),(65,1,11,'present',1,'2025-07-07 20:08:04','2025-07-07 20:08:04',NULL,'2025-07-07 17:30:00',0),(66,2,5,'absent',1,'2025-07-07 20:08:26','2025-07-07 20:24:59',NULL,'2025-07-07 17:30:00',0),(67,2,13,'present',1,'2025-07-07 20:08:26','2025-07-07 20:08:26',NULL,'2025-07-07 17:30:00',0),(74,1,2,'absent',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(75,1,3,'absent',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(76,1,8,'absent',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(77,1,9,'absent',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(78,1,10,'leave',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(79,1,11,'present',1,'2025-07-07 20:45:09','2025-07-07 20:45:09',NULL,'2025-07-03 17:30:00',0),(80,2,5,'present',1,'2025-07-07 22:21:43','2025-07-07 22:21:43',NULL,'2025-07-08 17:30:00',0),(81,2,13,'present',1,'2025-07-07 22:21:43','2025-07-07 22:21:43',NULL,'2025-07-08 17:30:00',0),(82,2,5,'leave',1,'2025-07-07 22:23:15','2025-07-07 22:23:15','illness','2025-07-09 17:30:00',0),(83,2,13,'present',1,'2025-07-07 22:23:15','2025-07-07 22:23:15',NULL,'2025-07-09 17:30:00',0);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances_staff`
--

DROP TABLE IF EXISTS `attendances_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances_staff` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int unsigned NOT NULL,
  `position` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int unsigned NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attendanced_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances_staff`
--

LOCK TABLES `attendances_staff` WRITE;
/*!40000 ALTER TABLE `attendances_staff` DISABLE KEYS */;
INSERT INTO `attendances_staff` VALUES (2,4,'ကျောင်းအုပ်ကြီး','present',1,NULL,'2025-07-13 17:30:00','2025-07-13 23:52:21','2025-07-13 23:52:21'),(3,14,'အလယ်တန်း​ပြ','present',1,NULL,'2025-07-13 17:30:00','2025-07-14 01:01:31','2025-07-14 01:01:31'),(4,7,'အထက်တန်းပြ','leave',1,'personal case','2025-07-13 17:30:00','2025-07-14 01:38:14','2025-07-14 01:38:40'),(5,14,'အလယ်တန်း​ပြ','present',1,'data entry wrong','2025-07-10 17:30:00','2025-07-14 01:41:04','2025-07-14 01:41:29');
/*!40000 ALTER TABLE `attendances_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('sikhi_cache_spatie.permission.cache','a:3:{s:5:\"alias\";a:3:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";}s:11:\"permissions\";a:62:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"promote students\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create notices\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"view notices\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"edit notices\";s:1:\"c\";s:3:\"web\";}i:8;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"delete notices\";s:1:\"c\";s:3:\"web\";}i:9;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:13:\"create events\";s:1:\"c\";s:3:\"web\";}i:10;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"view events\";s:1:\"c\";s:3:\"web\";}i:11;a:3:{s:1:\"a\";i:12;s:1:\"b\";s:11:\"edit events\";s:1:\"c\";s:3:\"web\";}i:12;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:13:\"delete events\";s:1:\"c\";s:3:\"web\";}i:13;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:14:\"create syllabi\";s:1:\"c\";s:3:\"web\";}i:14;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:12:\"view syllabi\";s:1:\"c\";s:3:\"web\";}i:15;a:3:{s:1:\"a\";i:16;s:1:\"b\";s:12:\"edit syllabi\";s:1:\"c\";s:3:\"web\";}i:16;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:14:\"delete syllabi\";s:1:\"c\";s:3:\"web\";}i:17;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:15:\"create routines\";s:1:\"c\";s:3:\"web\";}i:18;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:13:\"view routines\";s:1:\"c\";s:3:\"web\";}i:19;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"edit routines\";s:1:\"c\";s:3:\"web\";}i:20;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:15:\"delete routines\";s:1:\"c\";s:3:\"web\";}i:21;a:3:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create exams\";s:1:\"c\";s:3:\"web\";}i:22;a:3:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"view exams\";s:1:\"c\";s:3:\"web\";}i:23;a:3:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete exams\";s:1:\"c\";s:3:\"web\";}i:24;a:3:{s:1:\"a\";i:25;s:1:\"b\";s:17:\"create exams rule\";s:1:\"c\";s:3:\"web\";}i:25;a:3:{s:1:\"a\";i:26;s:1:\"b\";s:15:\"view exams rule\";s:1:\"c\";s:3:\"web\";}i:26;a:3:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit exams rule\";s:1:\"c\";s:3:\"web\";}i:27;a:3:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete exams rule\";s:1:\"c\";s:3:\"web\";}i:28;a:3:{s:1:\"a\";i:29;s:1:\"b\";s:18:\"view exams history\";s:1:\"c\";s:3:\"web\";}i:29;a:3:{s:1:\"a\";i:30;s:1:\"b\";s:22:\"create grading systems\";s:1:\"c\";s:3:\"web\";}i:30;a:3:{s:1:\"a\";i:31;s:1:\"b\";s:20:\"view grading systems\";s:1:\"c\";s:3:\"web\";}i:31;a:3:{s:1:\"a\";i:32;s:1:\"b\";s:20:\"edit grading systems\";s:1:\"c\";s:3:\"web\";}i:32;a:3:{s:1:\"a\";i:33;s:1:\"b\";s:22:\"delete grading systems\";s:1:\"c\";s:3:\"web\";}i:33;a:3:{s:1:\"a\";i:34;s:1:\"b\";s:27:\"create grading systems rule\";s:1:\"c\";s:3:\"web\";}i:34;a:3:{s:1:\"a\";i:35;s:1:\"b\";s:25:\"view grading systems rule\";s:1:\"c\";s:3:\"web\";}i:35;a:3:{s:1:\"a\";i:36;s:1:\"b\";s:25:\"edit grading systems rule\";s:1:\"c\";s:3:\"web\";}i:36;a:3:{s:1:\"a\";i:37;s:1:\"b\";s:27:\"delete grading systems rule\";s:1:\"c\";s:3:\"web\";}i:37;a:3:{s:1:\"a\";i:38;s:1:\"b\";s:16:\"take attendances\";s:1:\"c\";s:3:\"web\";}i:38;a:3:{s:1:\"a\";i:39;s:1:\"b\";s:16:\"view attendances\";s:1:\"c\";s:3:\"web\";}i:39;a:3:{s:1:\"a\";i:40;s:1:\"b\";s:23:\"update attendances type\";s:1:\"c\";s:3:\"web\";}i:40;a:3:{s:1:\"a\";i:41;s:1:\"b\";s:18:\"submit assignments\";s:1:\"c\";s:3:\"web\";}i:41;a:3:{s:1:\"a\";i:42;s:1:\"b\";s:18:\"create assignments\";s:1:\"c\";s:3:\"web\";}i:42;a:3:{s:1:\"a\";i:43;s:1:\"b\";s:16:\"view assignments\";s:1:\"c\";s:3:\"web\";}i:43;a:3:{s:1:\"a\";i:44;s:1:\"b\";s:10:\"save marks\";s:1:\"c\";s:3:\"web\";}i:44;a:3:{s:1:\"a\";i:45;s:1:\"b\";s:10:\"view marks\";s:1:\"c\";s:3:\"web\";}i:45;a:3:{s:1:\"a\";i:46;s:1:\"b\";s:22:\"create school sessions\";s:1:\"c\";s:3:\"web\";}i:46;a:3:{s:1:\"a\";i:47;s:1:\"b\";s:16:\"create semesters\";s:1:\"c\";s:3:\"web\";}i:47;a:3:{s:1:\"a\";i:48;s:1:\"b\";s:14:\"view semesters\";s:1:\"c\";s:3:\"web\";}i:48;a:3:{s:1:\"a\";i:49;s:1:\"b\";s:14:\"edit semesters\";s:1:\"c\";s:3:\"web\";}i:49;a:3:{s:1:\"a\";i:50;s:1:\"b\";s:15:\"assign teachers\";s:1:\"c\";s:3:\"web\";}i:50;a:3:{s:1:\"a\";i:51;s:1:\"b\";s:14:\"create courses\";s:1:\"c\";s:3:\"web\";}i:51;a:3:{s:1:\"a\";i:52;s:1:\"b\";s:12:\"view courses\";s:1:\"c\";s:3:\"web\";}i:52;a:3:{s:1:\"a\";i:53;s:1:\"b\";s:12:\"edit courses\";s:1:\"c\";s:3:\"web\";}i:53;a:3:{s:1:\"a\";i:54;s:1:\"b\";s:22:\"view academic settings\";s:1:\"c\";s:3:\"web\";}i:54;a:3:{s:1:\"a\";i:55;s:1:\"b\";s:30:\"update marks submission window\";s:1:\"c\";s:3:\"web\";}i:55;a:3:{s:1:\"a\";i:56;s:1:\"b\";s:24:\"update browse by session\";s:1:\"c\";s:3:\"web\";}i:56;a:3:{s:1:\"a\";i:57;s:1:\"b\";s:14:\"create classes\";s:1:\"c\";s:3:\"web\";}i:57;a:3:{s:1:\"a\";i:58;s:1:\"b\";s:12:\"view classes\";s:1:\"c\";s:3:\"web\";}i:58;a:3:{s:1:\"a\";i:59;s:1:\"b\";s:12:\"edit classes\";s:1:\"c\";s:3:\"web\";}i:59;a:3:{s:1:\"a\";i:60;s:1:\"b\";s:15:\"create sections\";s:1:\"c\";s:3:\"web\";}i:60;a:3:{s:1:\"a\";i:61;s:1:\"b\";s:13:\"view sections\";s:1:\"c\";s:3:\"web\";}i:61;a:3:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"edit sections\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:0:{}}',1756960267),('top_one_sms_cache_spatie.permission.cache','a:3:{s:5:\"alias\";a:3:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";}s:11:\"permissions\";a:62:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"create users\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:10:\"view users\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"edit users\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"delete users\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"promote students\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:14:\"create notices\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"view notices\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"edit notices\";s:1:\"c\";s:3:\"web\";}i:8;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"delete notices\";s:1:\"c\";s:3:\"web\";}i:9;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:13:\"create events\";s:1:\"c\";s:3:\"web\";}i:10;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"view events\";s:1:\"c\";s:3:\"web\";}i:11;a:3:{s:1:\"a\";i:12;s:1:\"b\";s:11:\"edit events\";s:1:\"c\";s:3:\"web\";}i:12;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:13:\"delete events\";s:1:\"c\";s:3:\"web\";}i:13;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:14:\"create syllabi\";s:1:\"c\";s:3:\"web\";}i:14;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:12:\"view syllabi\";s:1:\"c\";s:3:\"web\";}i:15;a:3:{s:1:\"a\";i:16;s:1:\"b\";s:12:\"edit syllabi\";s:1:\"c\";s:3:\"web\";}i:16;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:14:\"delete syllabi\";s:1:\"c\";s:3:\"web\";}i:17;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:15:\"create routines\";s:1:\"c\";s:3:\"web\";}i:18;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:13:\"view routines\";s:1:\"c\";s:3:\"web\";}i:19;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"edit routines\";s:1:\"c\";s:3:\"web\";}i:20;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:15:\"delete routines\";s:1:\"c\";s:3:\"web\";}i:21;a:3:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"create exams\";s:1:\"c\";s:3:\"web\";}i:22;a:3:{s:1:\"a\";i:23;s:1:\"b\";s:10:\"view exams\";s:1:\"c\";s:3:\"web\";}i:23;a:3:{s:1:\"a\";i:24;s:1:\"b\";s:12:\"delete exams\";s:1:\"c\";s:3:\"web\";}i:24;a:3:{s:1:\"a\";i:25;s:1:\"b\";s:17:\"create exams rule\";s:1:\"c\";s:3:\"web\";}i:25;a:3:{s:1:\"a\";i:26;s:1:\"b\";s:15:\"view exams rule\";s:1:\"c\";s:3:\"web\";}i:26;a:3:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"edit exams rule\";s:1:\"c\";s:3:\"web\";}i:27;a:3:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"delete exams rule\";s:1:\"c\";s:3:\"web\";}i:28;a:3:{s:1:\"a\";i:29;s:1:\"b\";s:18:\"view exams history\";s:1:\"c\";s:3:\"web\";}i:29;a:3:{s:1:\"a\";i:30;s:1:\"b\";s:22:\"create grading systems\";s:1:\"c\";s:3:\"web\";}i:30;a:3:{s:1:\"a\";i:31;s:1:\"b\";s:20:\"view grading systems\";s:1:\"c\";s:3:\"web\";}i:31;a:3:{s:1:\"a\";i:32;s:1:\"b\";s:20:\"edit grading systems\";s:1:\"c\";s:3:\"web\";}i:32;a:3:{s:1:\"a\";i:33;s:1:\"b\";s:22:\"delete grading systems\";s:1:\"c\";s:3:\"web\";}i:33;a:3:{s:1:\"a\";i:34;s:1:\"b\";s:27:\"create grading systems rule\";s:1:\"c\";s:3:\"web\";}i:34;a:3:{s:1:\"a\";i:35;s:1:\"b\";s:25:\"view grading systems rule\";s:1:\"c\";s:3:\"web\";}i:35;a:3:{s:1:\"a\";i:36;s:1:\"b\";s:25:\"edit grading systems rule\";s:1:\"c\";s:3:\"web\";}i:36;a:3:{s:1:\"a\";i:37;s:1:\"b\";s:27:\"delete grading systems rule\";s:1:\"c\";s:3:\"web\";}i:37;a:3:{s:1:\"a\";i:38;s:1:\"b\";s:16:\"take attendances\";s:1:\"c\";s:3:\"web\";}i:38;a:3:{s:1:\"a\";i:39;s:1:\"b\";s:16:\"view attendances\";s:1:\"c\";s:3:\"web\";}i:39;a:3:{s:1:\"a\";i:40;s:1:\"b\";s:23:\"update attendances type\";s:1:\"c\";s:3:\"web\";}i:40;a:3:{s:1:\"a\";i:41;s:1:\"b\";s:18:\"submit assignments\";s:1:\"c\";s:3:\"web\";}i:41;a:3:{s:1:\"a\";i:42;s:1:\"b\";s:18:\"create assignments\";s:1:\"c\";s:3:\"web\";}i:42;a:3:{s:1:\"a\";i:43;s:1:\"b\";s:16:\"view assignments\";s:1:\"c\";s:3:\"web\";}i:43;a:3:{s:1:\"a\";i:44;s:1:\"b\";s:10:\"save marks\";s:1:\"c\";s:3:\"web\";}i:44;a:3:{s:1:\"a\";i:45;s:1:\"b\";s:10:\"view marks\";s:1:\"c\";s:3:\"web\";}i:45;a:3:{s:1:\"a\";i:46;s:1:\"b\";s:22:\"create school sessions\";s:1:\"c\";s:3:\"web\";}i:46;a:3:{s:1:\"a\";i:47;s:1:\"b\";s:16:\"create semesters\";s:1:\"c\";s:3:\"web\";}i:47;a:3:{s:1:\"a\";i:48;s:1:\"b\";s:14:\"view semesters\";s:1:\"c\";s:3:\"web\";}i:48;a:3:{s:1:\"a\";i:49;s:1:\"b\";s:14:\"edit semesters\";s:1:\"c\";s:3:\"web\";}i:49;a:3:{s:1:\"a\";i:50;s:1:\"b\";s:15:\"assign teachers\";s:1:\"c\";s:3:\"web\";}i:50;a:3:{s:1:\"a\";i:51;s:1:\"b\";s:14:\"create courses\";s:1:\"c\";s:3:\"web\";}i:51;a:3:{s:1:\"a\";i:52;s:1:\"b\";s:12:\"view courses\";s:1:\"c\";s:3:\"web\";}i:52;a:3:{s:1:\"a\";i:53;s:1:\"b\";s:12:\"edit courses\";s:1:\"c\";s:3:\"web\";}i:53;a:3:{s:1:\"a\";i:54;s:1:\"b\";s:22:\"view academic settings\";s:1:\"c\";s:3:\"web\";}i:54;a:3:{s:1:\"a\";i:55;s:1:\"b\";s:30:\"update marks submission window\";s:1:\"c\";s:3:\"web\";}i:55;a:3:{s:1:\"a\";i:56;s:1:\"b\";s:24:\"update browse by session\";s:1:\"c\";s:3:\"web\";}i:56;a:3:{s:1:\"a\";i:57;s:1:\"b\";s:14:\"create classes\";s:1:\"c\";s:3:\"web\";}i:57;a:3:{s:1:\"a\";i:58;s:1:\"b\";s:12:\"view classes\";s:1:\"c\";s:3:\"web\";}i:58;a:3:{s:1:\"a\";i:59;s:1:\"b\";s:12:\"edit classes\";s:1:\"c\";s:3:\"web\";}i:59;a:3:{s:1:\"a\";i:60;s:1:\"b\";s:15:\"create sections\";s:1:\"c\";s:3:\"web\";}i:60;a:3:{s:1:\"a\";i:61;s:1:\"b\";s:13:\"view sections\";s:1:\"c\";s:3:\"web\";}i:61;a:3:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"edit sections\";s:1:\"c\";s:3:\"web\";}}s:5:\"roles\";a:0:{}}',1750827303);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter_end_types`
--

DROP TABLE IF EXISTS `chapter_end_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter_end_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chapter_end_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Assessment type name',
  `display_order` tinyint NOT NULL COMMENT 'Display order in reports',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chapter_end_name` (`chapter_end_name`),
  KEY `idx_display_order` (`display_order`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Assessment types for student evaluations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter_end_types`
--

LOCK TABLES `chapter_end_types` WRITE;
/*!40000 ALTER TABLE `chapter_end_types` DISABLE KEYS */;
INSERT INTO `chapter_end_types` VALUES (1,'Chapter End Test 1',1,'2025-08-29 03:43:53','2025-09-01 11:18:38'),(2,'Midterm Test',2,'2025-08-29 03:43:53','2025-08-29 03:43:53'),(3,'Chapter End Test 2',3,'2025-08-29 03:43:53','2025-08-29 03:43:53'),(4,'Year End Test',4,'2025-08-29 03:43:53','2025-08-29 03:43:53'),(5,'Average Grade',5,'2025-08-29 03:43:53','2025-08-29 03:43:53');
/*!40000 ALTER TABLE `chapter_end_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (3,'Yangon','2025-06-16 08:12:08','2025-06-16 08:12:08'),(4,'Mandalay','2025-06-16 08:12:25','2025-06-16 08:12:25'),(5,'Naypyitaw','2025-06-16 08:42:21','2025-06-16 08:42:21'),(6,'Mawlamyine','2025-06-16 19:53:30','2025-07-04 01:40:34'),(7,'MyintKyiNar','2025-07-04 01:35:59','2025-07-04 01:35:59');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (19,'Myanmar','Core',1,1,1,'2025-08-13 20:32:49','2025-08-13 20:32:49'),(20,'English','Core',1,1,1,'2025-08-13 20:32:56','2025-08-13 20:32:56'),(21,'Mathematics(သင်္ချာ)','Core',1,1,1,'2025-08-13 20:33:02','2025-09-01 02:57:54'),(22,'English','Core',3,1,1,'2025-08-14 02:12:26','2025-08-14 02:12:26'),(23,'Myanmar','Core',2,1,1,'2025-08-27 01:10:23','2025-08-27 01:10:23'),(24,'History','Core',1,1,1,'2025-09-01 02:58:10','2025-09-01 02:58:10'),(25,'Geography','Core',1,1,1,'2025-09-01 02:58:18','2025-09-01 02:58:18'),(26,'Science','Core',1,1,1,'2025-09-01 02:58:24','2025-09-01 02:58:24'),(27,'ကာယ','Core',1,1,1,'2025-09-01 02:59:05','2025-09-01 02:59:05'),(28,'ပန်းချီ','Optional',1,1,1,'2025-09-01 02:59:20','2025-09-01 02:59:20');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_cprs`
--

DROP TABLE IF EXISTS `daily_cprs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_cprs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `personal_type_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `coursed_teacher_id` bigint unsigned NOT NULL,
  `reviewed_teacher_id` bigint unsigned DEFAULT (0),
  `status` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `grade` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `recorded_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_cprs`
--

LOCK TABLES `daily_cprs` WRITE;
/*!40000 ALTER TABLE `daily_cprs` DISABLE KEYS */;
INSERT INTO `daily_cprs` VALUES (113,3,2,5,1,0,'SUBMITTED','C',NULL,'2025-08-26 17:30:00','2025-08-27 01:05:19','2025-08-27 01:25:13'),(114,1,2,13,1,0,'SUBMITTED','B',NULL,'2025-08-26 17:30:00','2025-08-27 01:05:19','2025-08-27 01:05:19'),(115,1,3,16,1,26,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 01:28:16','2025-08-27 11:03:57'),(116,1,3,16,1,26,'REVIEWED','C',NULL,'2025-08-27 17:30:00','2025-08-27 02:09:19','2025-08-27 09:24:40'),(126,1,1,2,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(127,1,1,3,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(128,1,1,8,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(129,1,1,9,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(130,1,1,10,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(131,1,1,11,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(132,1,1,19,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(133,1,1,21,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(134,1,1,22,26,17,'REVIEWED','A',NULL,'2025-08-26 17:30:00','2025-08-27 04:46:27','2025-08-27 11:16:48'),(135,1,1,2,1,1,'REVIEWED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-09-02 08:25:49'),(136,1,1,3,1,17,'REVIEWED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-09-02 08:44:05'),(137,1,1,8,1,17,'REVIEWED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-09-02 09:28:18'),(138,1,1,9,1,17,'REVIEWED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-09-02 09:28:34'),(139,1,1,10,1,0,'SUBMITTED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-08-28 02:29:58'),(140,1,1,11,1,0,'SUBMITTED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-08-28 02:29:58'),(141,1,1,19,1,0,'SUBMITTED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-08-28 02:29:58'),(142,1,1,21,1,0,'SUBMITTED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-08-28 02:29:58'),(143,1,1,22,1,0,'SUBMITTED','A',NULL,'2025-08-28 17:30:00','2025-08-28 02:29:58','2025-08-28 02:29:58'),(144,1,2,5,17,17,'SUBMITTED','A',NULL,'2025-08-31 17:30:00','2025-09-01 04:18:35','2025-09-01 11:16:52'),(145,1,2,13,17,17,'SUBMITTED','A',NULL,'2025-08-31 17:30:00','2025-09-01 04:18:35','2025-09-01 11:16:52'),(146,1,2,5,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-01 22:20:55','2025-09-01 22:20:55'),(147,3,2,5,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-01 22:20:55','2025-09-01 22:20:55'),(148,4,2,5,1,0,'SUBMITTED','C',NULL,'2025-09-01 17:30:00','2025-09-01 22:20:55','2025-09-01 22:20:55'),(149,5,2,5,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-01 22:20:55','2025-09-01 22:20:55'),(150,1,1,2,1,17,'REVIEWED','B',NULL,'2025-09-01 17:30:00','2025-09-01 23:04:51','2025-09-02 10:16:26'),(151,3,1,2,1,17,'REVIEWED','A',NULL,'2025-09-01 17:30:00','2025-09-01 23:04:51','2025-09-02 10:16:30'),(152,4,1,2,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-01 23:04:51','2025-09-02 00:18:12'),(153,5,1,2,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-01 23:04:51','2025-09-01 23:04:51'),(154,1,1,3,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(155,3,1,3,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(156,4,1,3,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(157,5,1,3,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(158,1,1,8,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(159,3,1,8,1,0,'SUBMITTED','A',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(160,4,1,8,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(161,5,1,8,1,0,'SUBMITTED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:18:12','2025-09-02 00:18:12'),(162,6,1,2,1,1,'REVIEWED','A',NULL,'2025-09-01 17:30:00','2025-09-02 00:44:01','2025-09-02 08:23:47'),(163,7,1,2,1,1,'REVIEWED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:44:01','2025-09-02 08:23:50'),(164,8,1,2,1,17,'REVIEWED','B',NULL,'2025-09-01 17:30:00','2025-09-02 00:44:01','2025-09-02 08:30:04'),(165,9,1,2,1,17,'REVIEWED','A','N1','2025-09-01 17:30:00','2025-09-02 00:44:01','2025-09-02 09:14:06'),(166,1,1,2,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 09:20:31'),(167,3,1,2,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 09:38:45'),(168,4,1,2,14,17,'SUBMITTED','B',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(169,5,1,2,14,17,'REVIEWED','B',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(170,6,1,2,14,17,'REVIEWED','B',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(171,7,1,2,14,17,'REVIEWED','C',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(172,8,1,2,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(173,9,1,2,14,17,'REVIEWED','B','Testing1','2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(174,1,1,3,14,17,'REVIEWED','B',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(175,3,1,3,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(176,4,1,3,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(177,5,1,3,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(178,6,1,3,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(179,7,1,3,14,17,'REVIEWED','A',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(180,8,1,3,14,17,'REVIEWED','B',NULL,'2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(181,9,1,3,14,17,'REVIEWED','B','Testing2','2025-08-31 17:30:00','2025-09-02 01:58:54','2025-09-02 08:30:59'),(182,1,1,2,17,17,'REVIEWED','A',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 09:53:24'),(183,3,1,2,17,0,'SUBMITTED','A',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(184,4,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(185,5,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(186,6,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(187,7,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(188,8,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22'),(189,9,1,2,17,0,'SUBMITTED','B',NULL,'2025-09-03 17:30:00','2025-09-02 03:22:22','2025-09-02 03:22:22');
/*!40000 ALTER TABLE `daily_cprs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'ကျောင်းတွင်း သစ်ပင်စိုက်ရန်','2025-06-13 00:00:00','2025-06-14 00:00:00',1,'2025-06-12 10:35:28','2025-06-12 10:35:28'),(2,'Mother Day','2025-06-13 00:00:00','2025-06-14 00:00:00',1,'2025-06-12 10:35:43','2025-06-12 10:35:43'),(3,'Teacher Day','2025-06-27 00:00:00','2025-06-28 00:00:00',1,'2025-06-12 10:43:36','2025-06-12 10:43:36'),(4,'New Year Holiday','2025-06-20 00:00:00','2025-06-21 00:00:00',1,'2025-06-16 23:22:00','2025-06-16 23:22:00'),(5,'Test','2025-07-04 00:00:00','2025-07-05 00:00:00',1,'2025-06-16 23:22:14','2025-06-16 23:22:14'),(6,'Programing in Python','2025-07-11 00:00:00','2025-07-12 00:00:00',1,'2025-06-21 00:57:38','2025-06-21 00:57:38'),(7,'New test data','2025-06-22 00:00:00','2025-06-23 00:00:00',1,'2025-06-24 08:36:53','2025-06-24 08:36:53'),(8,'December Holiday','2025-06-23 00:00:00','2025-06-24 00:00:00',1,'2025-06-24 08:38:38','2025-06-24 08:38:38'),(9,'December Holiday','2025-12-01 00:00:00','2025-12-02 00:00:00',1,'2025-06-24 08:38:51','2025-06-24 08:38:51'),(10,'December Holiday','2025-12-02 00:00:00','2025-12-03 00:00:00',1,'2025-06-24 08:38:55','2025-06-24 08:38:55'),(11,'December Holiday','2025-12-03 00:00:00','2025-12-04 00:00:00',1,'2025-06-24 08:38:57','2025-06-24 08:38:57'),(12,'December Holiday','2025-12-04 00:00:00','2025-12-05 00:00:00',1,'2025-06-24 08:38:59','2025-06-24 08:38:59'),(13,'December Holiday','2025-12-05 00:00:00','2025-12-06 00:00:00',1,'2025-06-24 08:39:03','2025-06-24 08:39:03'),(14,'December Holiday','2025-12-08 00:00:00','2025-12-09 00:00:00',1,'2025-06-24 08:39:47','2025-06-24 08:39:47'),(15,'December Holiday','2025-12-09 00:00:00','2025-12-10 00:00:00',1,'2025-06-24 08:39:50','2025-06-24 08:39:50'),(16,'December Holiday','2025-12-10 00:00:00','2025-12-11 00:00:00',1,'2025-06-24 08:39:52','2025-06-24 08:39:52'),(17,'December Holiday','2025-12-11 00:00:00','2025-12-12 00:00:00',1,'2025-06-24 08:39:54','2025-06-24 08:39:54'),(18,'December Holiday','2025-12-12 00:00:00','2025-12-13 00:00:00',1,'2025-06-24 08:39:57','2025-06-24 08:39:57');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_rules`
--

DROP TABLE IF EXISTS `exam_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `total_marks` double NOT NULL,
  `pass_marks` double NOT NULL,
  `marks_distribution_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_rules`
--

LOCK TABLES `exam_rules` WRITE;
/*!40000 ALTER TABLE `exam_rules` DISABLE KEYS */;
INSERT INTO `exam_rules` VALUES (7,100,40,'75',7,1,'2025-07-18 03:19:03','2025-07-18 03:19:03'),(8,100,40,'75',8,1,'2025-07-18 03:19:19','2025-07-18 03:19:19'),(9,100,40,'75',9,1,'2025-07-18 03:19:34','2025-07-18 03:19:34'),(11,100,35,'75',11,1,'2025-07-18 03:26:41','2025-07-25 01:37:14'),(12,90,35,'80',13,1,'2025-07-20 20:26:29','2025-07-24 21:59:38'),(13,100,40,'75',14,1,'2025-07-20 21:22:24','2025-07-20 21:22:24'),(14,100,40,'75',15,1,'2025-07-20 21:22:48','2025-07-20 21:22:48'),(15,100,40,'80',16,1,'2025-07-21 01:30:16','2025-07-21 01:30:16'),(16,100,40,'80',17,1,'2025-07-21 01:30:33','2025-07-21 01:30:33'),(17,100,40,'80',18,1,'2025-07-21 01:30:47','2025-07-21 01:30:47'),(18,100,40,'80',19,1,'2025-07-21 01:31:00','2025-07-21 01:31:00'),(19,100,50,'80',20,1,'2025-07-22 00:21:07','2025-07-25 02:52:09'),(20,100,40,'75',21,1,'2025-07-22 00:22:05','2025-07-22 00:22:05'),(21,100,40,'80',22,1,'2025-07-22 00:22:18','2025-07-22 00:22:18'),(22,100,40,'80',23,1,'2025-07-22 00:22:31','2025-07-22 00:22:31'),(23,100,40,'75',10,1,'2025-07-24 21:40:25','2025-07-24 21:40:25'),(27,100,40,'50',25,1,'2025-07-25 02:39:21','2025-07-25 02:39:21'),(28,100,40,'80',26,1,'2025-07-25 02:49:55','2025-07-25 02:49:55'),(29,100,40,'75',28,1,'2025-08-27 20:40:10','2025-08-27 20:40:10');
/*!40000 ALTER TABLE `exam_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `class_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (7,'လပါတ်စာမေးပွဲ','2025-07-07 09:00:00','2025-07-07 10:00:00',4,12,1,1,'2025-07-18 03:17:25','2025-07-18 03:17:25'),(8,'လပါတ်စာမေးပွဲ','2025-07-07 10:00:00','2025-07-07 12:00:00',4,13,1,1,'2025-07-18 03:18:00','2025-07-18 03:18:00'),(9,'လပါတ်စာမေးပွဲ','2025-07-08 14:00:00','2025-07-08 16:00:00',4,14,1,1,'2025-07-18 03:18:45','2025-07-18 03:18:45'),(12,'လပါတ်စာမေးပွဲ','2025-08-07 14:00:00','2025-08-07 15:00:00',4,14,1,1,'2025-07-20 20:23:32','2025-07-20 20:23:32'),(14,'လပါတ်စာမေးပွဲ','2025-08-12 09:00:00','2025-08-12 10:00:00',2,2,1,1,'2025-07-20 21:17:48','2025-07-20 21:17:48'),(15,'လပါတ်စာမေးပွဲ','2025-08-12 10:00:00','2025-08-12 12:00:00',2,3,1,1,'2025-07-20 21:18:47','2025-07-20 21:18:47'),(27,'လပါတ်စာမေးပွဲ','2025-08-10 09:00:00','2025-08-10 12:00:00',1,19,1,1,'2025-08-13 21:58:27','2025-08-13 21:58:27'),(28,'လပါတ်စာမေးပွဲ','2025-06-16 09:38:00','2025-06-23 09:39:00',1,20,1,1,'2025-08-27 20:39:43','2025-08-27 20:39:43');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_marks`
--

DROP TABLE IF EXISTS `final_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_marks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `calculated_marks` double NOT NULL DEFAULT '0',
  `final_marks` double NOT NULL DEFAULT '0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_marks`
--

LOCK TABLES `final_marks` WRITE;
/*!40000 ALTER TABLE `final_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_rules`
--

DROP TABLE IF EXISTS `grade_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `point` double NOT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` double NOT NULL,
  `end_at` double NOT NULL,
  `grading_system_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_rules`
--

LOCK TABLES `grade_rules` WRITE;
/*!40000 ALTER TABLE `grade_rules` DISABLE KEYS */;
INSERT INTO `grade_rules` VALUES (1,100,'A+',40,100,4,1,'2025-07-17 03:40:23','2025-07-17 03:40:23');
/*!40000 ALTER TABLE `grade_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading_systems`
--

DROP TABLE IF EXISTS `grading_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grading_systems` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading_systems`
--

LOCK TABLES `grading_systems` WRITE;
/*!40000 ALTER TABLE `grading_systems` DISABLE KEYS */;
INSERT INTO `grading_systems` VALUES (1,'Grade-System-75Passed-80-D',1,1,1,'2025-06-12 10:38:35','2025-06-12 10:38:35'),(2,'Grade-System-75Passed-80-D',2,1,1,'2025-06-21 00:56:53','2025-06-21 00:56:53'),(3,'Grade-3 grading 1',4,1,1,'2025-07-17 02:42:37','2025-07-17 02:42:37'),(4,'Grading For Grade-3',4,1,1,'2025-07-17 03:37:00','2025-07-17 03:37:00');
/*!40000 ALTER TABLE `grading_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `marks` double NOT NULL DEFAULT '0',
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `exam_id` bigint unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (63,50,2,1,1,20,28,1,'2025-08-28 01:28:46','2025-08-28 01:28:46');
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_05_03_052220_create_permission_tables',1),(5,'2024_05_04_103809_create_school_sessions_table',1),(6,'2024_05_04_134535_create_academic_settings_table',1),(7,'2024_05_04_134613_create_assigned_teachers_table',1),(8,'2024_05_04_134800_create_assignments_table',1),(9,'2024_05_04_134820_create_attendances_table',1),(10,'2024_05_04_135222_create_courses_table',1),(11,'2024_05_04_135237_create_exams_table',1),(12,'2024_05_04_135251_create_exam_rules_table',1),(13,'2024_05_04_135304_create_final_marks_table',1),(14,'2024_05_04_135320_create_grade_rules_table',1),(15,'2024_05_04_135334_create_grading_systems_table',1),(16,'2024_05_04_135359_create_marks_table',1),(17,'2024_05_04_135518_create_notices_table',1),(18,'2024_05_04_135534_create_promotions_table',1),(19,'2024_05_04_135552_create_routines_table',1),(20,'2024_05_04_135622_create_school_classes_table',1),(21,'2024_05_04_135645_create_sections_table',1),(22,'2024_05_04_135658_create_semesters_table',1),(23,'2024_05_04_135731_create_student_academic_infos_table',1),(24,'2024_05_04_135804_create_student_parent_infos_table',1),(25,'2024_05_04_135824_create_syllabi_table',1),(26,'2024_05_04_140159_create_events_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(3,'App\\Models\\User',1),(5,'App\\Models\\User',1),(6,'App\\Models\\User',1),(7,'App\\Models\\User',1),(8,'App\\Models\\User',1),(9,'App\\Models\\User',1),(10,'App\\Models\\User',1),(11,'App\\Models\\User',1),(12,'App\\Models\\User',1),(13,'App\\Models\\User',1),(14,'App\\Models\\User',1),(15,'App\\Models\\User',1),(16,'App\\Models\\User',1),(17,'App\\Models\\User',1),(18,'App\\Models\\User',1),(19,'App\\Models\\User',1),(20,'App\\Models\\User',1),(21,'App\\Models\\User',1),(22,'App\\Models\\User',1),(23,'App\\Models\\User',1),(25,'App\\Models\\User',1),(26,'App\\Models\\User',1),(27,'App\\Models\\User',1),(28,'App\\Models\\User',1),(30,'App\\Models\\User',1),(31,'App\\Models\\User',1),(32,'App\\Models\\User',1),(33,'App\\Models\\User',1),(34,'App\\Models\\User',1),(35,'App\\Models\\User',1),(36,'App\\Models\\User',1),(37,'App\\Models\\User',1),(38,'App\\Models\\User',1),(39,'App\\Models\\User',1),(40,'App\\Models\\User',1),(43,'App\\Models\\User',1),(45,'App\\Models\\User',1),(46,'App\\Models\\User',1),(47,'App\\Models\\User',1),(49,'App\\Models\\User',1),(50,'App\\Models\\User',1),(51,'App\\Models\\User',1),(52,'App\\Models\\User',1),(53,'App\\Models\\User',1),(54,'App\\Models\\User',1),(55,'App\\Models\\User',1),(56,'App\\Models\\User',1),(57,'App\\Models\\User',1),(58,'App\\Models\\User',1),(59,'App\\Models\\User',1),(60,'App\\Models\\User',1),(61,'App\\Models\\User',1),(62,'App\\Models\\User',1),(2,'App\\Models\\User',2),(7,'App\\Models\\User',2),(11,'App\\Models\\User',2),(15,'App\\Models\\User',2),(19,'App\\Models\\User',2),(23,'App\\Models\\User',2),(39,'App\\Models\\User',2),(41,'App\\Models\\User',2),(43,'App\\Models\\User',2),(45,'App\\Models\\User',2),(2,'App\\Models\\User',3),(7,'App\\Models\\User',3),(11,'App\\Models\\User',3),(15,'App\\Models\\User',3),(19,'App\\Models\\User',3),(23,'App\\Models\\User',3),(39,'App\\Models\\User',3),(41,'App\\Models\\User',3),(43,'App\\Models\\User',3),(45,'App\\Models\\User',3),(2,'App\\Models\\User',4),(7,'App\\Models\\User',4),(11,'App\\Models\\User',4),(15,'App\\Models\\User',4),(19,'App\\Models\\User',4),(22,'App\\Models\\User',4),(23,'App\\Models\\User',4),(25,'App\\Models\\User',4),(26,'App\\Models\\User',4),(27,'App\\Models\\User',4),(28,'App\\Models\\User',4),(38,'App\\Models\\User',4),(39,'App\\Models\\User',4),(42,'App\\Models\\User',4),(43,'App\\Models\\User',4),(44,'App\\Models\\User',4),(2,'App\\Models\\User',5),(7,'App\\Models\\User',5),(11,'App\\Models\\User',5),(15,'App\\Models\\User',5),(19,'App\\Models\\User',5),(23,'App\\Models\\User',5),(39,'App\\Models\\User',5),(41,'App\\Models\\User',5),(43,'App\\Models\\User',5),(45,'App\\Models\\User',5),(2,'App\\Models\\User',6),(7,'App\\Models\\User',6),(11,'App\\Models\\User',6),(15,'App\\Models\\User',6),(19,'App\\Models\\User',6),(23,'App\\Models\\User',6),(39,'App\\Models\\User',6),(41,'App\\Models\\User',6),(43,'App\\Models\\User',6),(45,'App\\Models\\User',6),(2,'App\\Models\\User',7),(7,'App\\Models\\User',7),(11,'App\\Models\\User',7),(15,'App\\Models\\User',7),(19,'App\\Models\\User',7),(22,'App\\Models\\User',7),(23,'App\\Models\\User',7),(25,'App\\Models\\User',7),(26,'App\\Models\\User',7),(27,'App\\Models\\User',7),(28,'App\\Models\\User',7),(38,'App\\Models\\User',7),(39,'App\\Models\\User',7),(42,'App\\Models\\User',7),(43,'App\\Models\\User',7),(44,'App\\Models\\User',7),(2,'App\\Models\\User',8),(7,'App\\Models\\User',8),(11,'App\\Models\\User',8),(15,'App\\Models\\User',8),(19,'App\\Models\\User',8),(23,'App\\Models\\User',8),(39,'App\\Models\\User',8),(41,'App\\Models\\User',8),(43,'App\\Models\\User',8),(45,'App\\Models\\User',8),(2,'App\\Models\\User',9),(7,'App\\Models\\User',9),(11,'App\\Models\\User',9),(15,'App\\Models\\User',9),(19,'App\\Models\\User',9),(23,'App\\Models\\User',9),(39,'App\\Models\\User',9),(41,'App\\Models\\User',9),(43,'App\\Models\\User',9),(45,'App\\Models\\User',9),(2,'App\\Models\\User',10),(7,'App\\Models\\User',10),(11,'App\\Models\\User',10),(15,'App\\Models\\User',10),(19,'App\\Models\\User',10),(23,'App\\Models\\User',10),(39,'App\\Models\\User',10),(41,'App\\Models\\User',10),(43,'App\\Models\\User',10),(45,'App\\Models\\User',10),(2,'App\\Models\\User',11),(7,'App\\Models\\User',11),(11,'App\\Models\\User',11),(15,'App\\Models\\User',11),(19,'App\\Models\\User',11),(23,'App\\Models\\User',11),(39,'App\\Models\\User',11),(41,'App\\Models\\User',11),(43,'App\\Models\\User',11),(45,'App\\Models\\User',11),(2,'App\\Models\\User',13),(7,'App\\Models\\User',13),(11,'App\\Models\\User',13),(15,'App\\Models\\User',13),(19,'App\\Models\\User',13),(23,'App\\Models\\User',13),(39,'App\\Models\\User',13),(41,'App\\Models\\User',13),(43,'App\\Models\\User',13),(45,'App\\Models\\User',13),(2,'App\\Models\\User',14),(7,'App\\Models\\User',14),(11,'App\\Models\\User',14),(15,'App\\Models\\User',14),(19,'App\\Models\\User',14),(22,'App\\Models\\User',14),(23,'App\\Models\\User',14),(25,'App\\Models\\User',14),(26,'App\\Models\\User',14),(27,'App\\Models\\User',14),(28,'App\\Models\\User',14),(38,'App\\Models\\User',14),(39,'App\\Models\\User',14),(42,'App\\Models\\User',14),(43,'App\\Models\\User',14),(44,'App\\Models\\User',14),(2,'App\\Models\\User',15),(7,'App\\Models\\User',15),(11,'App\\Models\\User',15),(15,'App\\Models\\User',15),(19,'App\\Models\\User',15),(22,'App\\Models\\User',15),(23,'App\\Models\\User',15),(25,'App\\Models\\User',15),(26,'App\\Models\\User',15),(27,'App\\Models\\User',15),(28,'App\\Models\\User',15),(38,'App\\Models\\User',15),(39,'App\\Models\\User',15),(42,'App\\Models\\User',15),(43,'App\\Models\\User',15),(44,'App\\Models\\User',15),(2,'App\\Models\\User',16),(7,'App\\Models\\User',16),(11,'App\\Models\\User',16),(15,'App\\Models\\User',16),(19,'App\\Models\\User',16),(23,'App\\Models\\User',16),(39,'App\\Models\\User',16),(41,'App\\Models\\User',16),(43,'App\\Models\\User',16),(45,'App\\Models\\User',16),(2,'App\\Models\\User',17),(7,'App\\Models\\User',17),(11,'App\\Models\\User',17),(15,'App\\Models\\User',17),(19,'App\\Models\\User',17),(22,'App\\Models\\User',17),(23,'App\\Models\\User',17),(25,'App\\Models\\User',17),(26,'App\\Models\\User',17),(27,'App\\Models\\User',17),(28,'App\\Models\\User',17),(38,'App\\Models\\User',17),(39,'App\\Models\\User',17),(42,'App\\Models\\User',17),(43,'App\\Models\\User',17),(44,'App\\Models\\User',17),(2,'App\\Models\\User',18),(7,'App\\Models\\User',18),(11,'App\\Models\\User',18),(15,'App\\Models\\User',18),(19,'App\\Models\\User',18),(23,'App\\Models\\User',18),(39,'App\\Models\\User',18),(41,'App\\Models\\User',18),(43,'App\\Models\\User',18),(45,'App\\Models\\User',18),(2,'App\\Models\\User',19),(7,'App\\Models\\User',19),(11,'App\\Models\\User',19),(15,'App\\Models\\User',19),(19,'App\\Models\\User',19),(23,'App\\Models\\User',19),(39,'App\\Models\\User',19),(41,'App\\Models\\User',19),(43,'App\\Models\\User',19),(45,'App\\Models\\User',19),(2,'App\\Models\\User',20),(7,'App\\Models\\User',20),(11,'App\\Models\\User',20),(15,'App\\Models\\User',20),(19,'App\\Models\\User',20),(22,'App\\Models\\User',20),(23,'App\\Models\\User',20),(25,'App\\Models\\User',20),(26,'App\\Models\\User',20),(27,'App\\Models\\User',20),(28,'App\\Models\\User',20),(38,'App\\Models\\User',20),(39,'App\\Models\\User',20),(42,'App\\Models\\User',20),(43,'App\\Models\\User',20),(44,'App\\Models\\User',20),(2,'App\\Models\\User',21),(7,'App\\Models\\User',21),(11,'App\\Models\\User',21),(15,'App\\Models\\User',21),(19,'App\\Models\\User',21),(23,'App\\Models\\User',21),(39,'App\\Models\\User',21),(41,'App\\Models\\User',21),(43,'App\\Models\\User',21),(45,'App\\Models\\User',21),(2,'App\\Models\\User',22),(7,'App\\Models\\User',22),(11,'App\\Models\\User',22),(15,'App\\Models\\User',22),(19,'App\\Models\\User',22),(23,'App\\Models\\User',22),(39,'App\\Models\\User',22),(41,'App\\Models\\User',22),(43,'App\\Models\\User',22),(45,'App\\Models\\User',22),(2,'App\\Models\\User',23),(7,'App\\Models\\User',23),(11,'App\\Models\\User',23),(15,'App\\Models\\User',23),(19,'App\\Models\\User',23),(23,'App\\Models\\User',23),(39,'App\\Models\\User',23),(41,'App\\Models\\User',23),(43,'App\\Models\\User',23),(45,'App\\Models\\User',23),(2,'App\\Models\\User',24),(7,'App\\Models\\User',24),(11,'App\\Models\\User',24),(15,'App\\Models\\User',24),(19,'App\\Models\\User',24),(23,'App\\Models\\User',24),(39,'App\\Models\\User',24),(41,'App\\Models\\User',24),(43,'App\\Models\\User',24),(45,'App\\Models\\User',24),(2,'App\\Models\\User',25),(7,'App\\Models\\User',25),(11,'App\\Models\\User',25),(15,'App\\Models\\User',25),(19,'App\\Models\\User',25),(22,'App\\Models\\User',25),(23,'App\\Models\\User',25),(25,'App\\Models\\User',25),(26,'App\\Models\\User',25),(27,'App\\Models\\User',25),(28,'App\\Models\\User',25),(38,'App\\Models\\User',25),(39,'App\\Models\\User',25),(42,'App\\Models\\User',25),(43,'App\\Models\\User',25),(44,'App\\Models\\User',25),(2,'App\\Models\\User',26),(7,'App\\Models\\User',26),(11,'App\\Models\\User',26),(15,'App\\Models\\User',26),(19,'App\\Models\\User',26),(22,'App\\Models\\User',26),(23,'App\\Models\\User',26),(25,'App\\Models\\User',26),(26,'App\\Models\\User',26),(27,'App\\Models\\User',26),(28,'App\\Models\\User',26),(38,'App\\Models\\User',26),(39,'App\\Models\\User',26),(42,'App\\Models\\User',26),(43,'App\\Models\\User',26),(44,'App\\Models\\User',26);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_cprs`
--

DROP TABLE IF EXISTS `monthly_cprs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_cprs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `assessment_month` date NOT NULL,
  `criteria_id` bigint NOT NULL,
  `grade` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `average_grade` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_student_month_criteria` (`student_id`,`assessment_month`,`criteria_id`),
  KEY `idx_student_month` (`student_id`,`assessment_month`),
  KEY `idx_class_month` (`class_id`,`assessment_month`),
  KEY `idx_criteria` (`criteria_id`),
  CONSTRAINT `monthly_cprs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `monthly_cprs_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`),
  CONSTRAINT `monthly_cprs_ibfk_3` FOREIGN KEY (`criteria_id`) REFERENCES `assessment_criteria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_cprs`
--

LOCK TABLES `monthly_cprs` WRITE;
/*!40000 ALTER TABLE `monthly_cprs` DISABLE KEYS */;
INSERT INTO `monthly_cprs` VALUES (96,2,1,'2025-02-01',1,'B',NULL,'Testing for edit','2025-08-28 01:47:30','2025-08-28 03:58:26'),(97,2,1,'2025-02-01',2,'D',NULL,'good','2025-08-28 01:47:30','2025-08-28 03:58:36'),(98,2,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(99,2,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(100,2,1,'2025-02-01',5,'B',NULL,'testing2','2025-08-28 01:47:30','2025-08-28 20:13:36'),(101,3,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(102,3,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(103,3,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(104,3,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(105,3,1,'2025-02-01',5,'A',NULL,'testing','2025-08-28 01:47:30','2025-08-28 01:47:30'),(106,8,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(107,8,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(108,8,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(109,8,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(110,8,1,'2025-02-01',5,'A',NULL,'testing','2025-08-28 01:47:30','2025-08-28 01:47:30'),(111,9,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(112,9,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(113,9,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(114,9,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(115,9,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(116,10,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(117,10,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(118,10,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(119,10,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(120,10,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(121,11,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(122,11,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(123,11,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(124,11,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(125,11,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(126,19,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(127,19,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(128,19,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(129,19,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(130,19,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(131,21,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(132,21,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(133,21,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(134,21,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(135,21,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(136,22,1,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(137,22,1,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(138,22,1,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(139,22,1,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(140,22,1,'2025-02-01',5,'A',NULL,NULL,'2025-08-28 01:47:30','2025-08-28 01:47:30'),(141,5,2,'2025-02-01',1,'B',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(142,5,2,'2025-02-01',2,'B',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(143,5,2,'2025-02-01',3,'B',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(144,5,2,'2025-02-01',4,'B',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(145,5,2,'2025-02-01',5,'B',NULL,'reviewed by MG','2025-08-28 02:16:49','2025-08-28 02:16:49'),(146,13,2,'2025-02-01',1,'A',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(147,13,2,'2025-02-01',2,'A',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(148,13,2,'2025-02-01',3,'A',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(149,13,2,'2025-02-01',4,'A',NULL,NULL,'2025-08-28 02:16:49','2025-08-28 02:16:49'),(150,13,2,'2025-02-01',5,'A',NULL,'reviewed by MG','2025-08-28 02:16:49','2025-08-28 02:16:49'),(151,5,2,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(152,5,2,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(153,5,2,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(154,5,2,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(155,5,2,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:34:50','2025-08-28 02:34:50'),(156,13,2,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(157,13,2,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(158,13,2,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(159,13,2,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:34:50','2025-08-28 02:34:50'),(160,13,2,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:34:50','2025-08-28 02:34:50'),(161,16,3,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:01','2025-08-28 02:35:01'),(162,16,3,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:01','2025-08-28 02:35:01'),(163,16,3,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:01','2025-08-28 02:35:01'),(164,16,3,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:01','2025-08-28 02:35:01'),(165,16,3,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:01','2025-08-28 02:35:01'),(166,2,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(167,2,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(168,2,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(170,2,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(171,3,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(172,3,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(173,3,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(174,3,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(175,3,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(176,8,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(177,8,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(178,8,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(179,8,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(180,8,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(181,9,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(182,9,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(183,9,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(184,9,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(185,9,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(186,10,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(187,10,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(188,10,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(189,10,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(190,10,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(191,11,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(192,11,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(193,11,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(194,11,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(195,11,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(196,19,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(197,19,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(198,19,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(199,19,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(200,19,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(201,21,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(202,21,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(203,21,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(204,21,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(205,21,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25'),(206,22,1,'2025-06-01',1,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(207,22,1,'2025-06-01',2,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(208,22,1,'2025-06-01',3,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(209,22,1,'2025-06-01',4,'A',NULL,NULL,'2025-08-28 02:35:25','2025-08-28 02:35:25'),(210,22,1,'2025-06-01',5,'A',NULL,'June','2025-08-28 02:35:25','2025-08-28 02:35:25');
/*!40000 ALTER TABLE `monthly_cprs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from_date` timestamp NULL DEFAULT NULL,
  `to_date` timestamp NULL DEFAULT NULL,
  `notice_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `class_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'<p><strong>December Holidays</strong></p>',1,'2025-06-12 10:35:04','2025-06-12 10:35:04',NULL,NULL,NULL,NULL),(5,'<p>စုံညီပွဲတော်</p>',1,'2025-07-01 21:19:24','2025-07-01 23:16:11','2025-07-02 01:30:00','2025-07-02 05:30:00','oncampus',NULL),(6,'<p>Class Activities</p>',1,'2025-07-01 21:58:08','2025-07-01 21:58:08','2025-07-03 03:30:00','2025-07-03 12:29:00','online',1),(7,'<p><strong>ကျောင်းကပွဲ</strong></p>',1,'2025-07-02 00:03:34','2025-07-02 00:38:00','2025-07-09 03:30:00','2025-07-09 11:30:00','oncampus',1),(8,'<p>Seminar</p>',1,'2025-07-02 00:09:26','2025-07-02 00:09:26','2025-07-10 03:30:00','2025-07-10 07:30:00','online',1),(9,'<p>ကျောင်းဖွင့်ပွဲ</p>',1,'2025-07-02 00:40:41','2025-07-02 00:40:41','2025-07-03 03:30:00','2025-07-03 06:10:00','oncampus',NULL),(10,'<p>Registeration</p>',1,'2025-07-02 00:58:18','2025-07-02 00:58:18','2025-06-30 07:27:00','2025-07-01 07:27:00','online',NULL),(11,'<p>Assembly to be arrived</p>',1,'2025-07-02 01:06:47','2025-07-02 01:06:47','2025-07-19 03:30:00','2025-07-19 07:35:00','oncampus',NULL),(12,'<p>Seminar only for grade1 students</p>',1,'2025-07-02 01:13:56','2025-07-02 01:13:56','2025-07-03 12:30:00','2025-07-03 17:30:00','online',2);
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'create users','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(2,'view users','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(3,'edit users','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(4,'delete users','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(5,'promote students','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(6,'create notices','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(7,'view notices','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(8,'edit notices','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(9,'delete notices','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(10,'create events','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(11,'view events','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(12,'edit events','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(13,'delete events','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(14,'create syllabi','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(15,'view syllabi','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(16,'edit syllabi','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(17,'delete syllabi','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(18,'create routines','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(19,'view routines','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(20,'edit routines','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(21,'delete routines','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(22,'create exams','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(23,'view exams','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(24,'delete exams','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(25,'create exams rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(26,'view exams rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(27,'edit exams rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(28,'delete exams rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(29,'view exams history','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(30,'create grading systems','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(31,'view grading systems','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(32,'edit grading systems','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(33,'delete grading systems','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(34,'create grading systems rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(35,'view grading systems rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(36,'edit grading systems rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(37,'delete grading systems rule','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(38,'take attendances','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(39,'view attendances','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(40,'update attendances type','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(41,'submit assignments','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(42,'create assignments','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(43,'view assignments','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(44,'save marks','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(45,'view marks','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(46,'create school sessions','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(47,'create semesters','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(48,'view semesters','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(49,'edit semesters','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(50,'assign teachers','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(51,'create courses','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(52,'view courses','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(53,'edit courses','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(54,'view academic settings','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(55,'update marks submission window','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(56,'update browse by session','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(57,'create classes','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(58,'view classes','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(59,'edit classes','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(60,'create sections','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(61,'view sections','web','2025-06-12 10:04:02','2025-06-12 10:04:02'),(62,'edit sections','web','2025-06-12 10:04:02','2025-06-12 10:04:02');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_types`
--

DROP TABLE IF EXISTS `personal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `personal_type_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `personal_type_category` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_types`
--

LOCK TABLES `personal_types` WRITE;
/*!40000 ALTER TABLE `personal_types` DISABLE KEYS */;
INSERT INTO `personal_types` VALUES (1,'စည်းကမ်းရိုသေမှု','စာရိတ္တဗလ','2025-08-25 22:17:09','2025-08-25 23:39:15'),(3,'တာဝန်သိမှု','စာရိတ္တဗလ','2025-08-26 02:45:31','2025-08-26 02:45:31'),(4,'ကိုယ်ကျင့်တရား','စာရိတ္တဗလ','2025-08-26 02:47:18','2025-08-26 02:47:18'),(5,'ဇွဲ','စာရိတ္တဗလ','2025-08-26 02:47:33','2025-08-26 02:47:33'),(6,'ပေါင်းသင်းဆက်ဆံမှု့','စာရိတ္တဗလ','2025-09-02 00:40:16','2025-09-02 00:40:16'),(7,'ကိုယ်ခန္ဓာဖွံ့ဖြိုးမှု့','ကာယဗလ','2025-09-02 00:41:09','2025-09-02 00:41:09'),(8,'လူမှူ့ရေးလုပ်ငန်းများ','မိတ္တဗလ','2025-09-02 00:42:22','2025-09-02 00:42:22'),(9,'ကျန်းမာမှု့','ကာယဗလ','2025-09-02 00:42:36','2025-09-02 00:42:36');
/*!40000 ALTER TABLE `personal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `id_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,2,1,1,1,'s-101-3','2025-06-12 10:20:58','2025-07-01 04:04:56'),(2,3,1,1,1,'s-101-3','2025-06-12 10:29:28','2025-06-30 00:37:36'),(3,5,2,1,1,'s-101-308','2025-06-24 08:34:03','2025-06-24 08:34:03'),(5,8,1,1,1,'SG-06-06','2025-06-30 03:10:16','2025-07-01 04:06:07'),(6,9,1,1,1,'SG-06-07','2025-06-30 03:25:25','2025-07-01 04:08:04'),(7,10,1,1,1,'SG-06-08','2025-07-01 04:21:01','2025-07-01 04:22:48'),(8,11,1,1,1,'SG-06-08','2025-07-01 04:30:04','2025-07-01 04:31:20'),(9,13,2,1,1,'SG-01-002','2025-07-02 21:26:20','2025-07-02 21:26:20'),(10,16,3,1,1,'SG-02-03','2025-07-06 02:24:34','2025-08-08 01:12:09'),(12,19,1,1,1,'SG-11-009','2025-08-07 22:01:15','2025-08-08 01:11:52'),(13,21,1,1,1,'SG-06-15','2025-08-08 00:46:52','2025-08-08 01:32:11'),(14,22,1,1,1,'SG-11-0023','2025-08-08 01:47:03','2025-08-08 01:47:03'),(28,2,5,4,4,'s-101-1','2025-08-12 04:37:51','2025-08-12 04:37:51'),(29,3,5,4,4,'s-101-2','2025-08-12 04:37:51','2025-08-12 04:37:51'),(30,8,5,4,4,'s-101-3','2025-08-12 04:37:51','2025-08-12 04:37:51'),(31,9,5,4,4,'s-101-4','2025-08-12 04:37:51','2025-08-12 04:37:51'),(32,10,5,4,4,'s-101-5','2025-08-12 04:37:51','2025-08-12 04:37:51'),(33,11,5,4,4,'s-101-6','2025-08-12 04:37:51','2025-08-12 04:37:51'),(34,19,5,4,4,'s-101-7','2025-08-12 04:37:51','2025-08-12 04:37:51'),(35,21,5,4,4,'s-101-8','2025-08-12 04:37:51','2025-08-12 04:37:51'),(36,22,5,4,4,'s-101-9','2025-08-12 04:37:51','2025-08-12 04:37:51'),(37,5,6,5,4,'s-101-308','2025-08-12 04:49:53','2025-08-12 04:49:53'),(38,13,6,5,4,'SG-01-002','2025-08-12 04:49:53','2025-08-12 04:49:53');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarly_cprs`
--

DROP TABLE IF EXISTS `quarly_cprs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarly_cprs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `chapter_end_type_id` bigint NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `grade` char(1) COLLATE utf8mb3_unicode_ci NOT NULL,
  `overall_grade_average` char(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `teacher_id` bigint unsigned NOT NULL,
  `class_teacher_signature` text COLLATE utf8mb3_unicode_ci,
  `session_id` bigint unsigned NOT NULL,
  `guardian_name` text COLLATE utf8mb3_unicode_ci,
  `total_attendance_percentage` float DEFAULT (0.0),
  `headmaster_signature` text COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_student_class_course_chapter` (`student_id`,`class_id`,`course_id`,`chapter_end_type_id`),
  KEY `idx_student_session` (`student_id`,`session_id`),
  KEY `idx_class_session` (`class_id`,`session_id`),
  KEY `idx_chapter_end_type` (`chapter_end_type_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `quarly_cprs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `quarly_cprs_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`),
  CONSTRAINT `quarly_cprs_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `quarly_cprs_ibfk_4` FOREIGN KEY (`chapter_end_type_id`) REFERENCES `chapter_end_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarly_cprs`
--

LOCK TABLES `quarly_cprs` WRITE;
/*!40000 ALTER TABLE `quarly_cprs` DISABLE KEYS */;
INSERT INTO `quarly_cprs` VALUES (16,1,2,1,20,'B',NULL,'TestingEdit',1,NULL,1,NULL,0,NULL,'2025-08-31 21:59:26','2025-09-02 00:59:13'),(17,1,2,1,21,'C',NULL,'testing3',1,NULL,1,NULL,0,NULL,'2025-08-31 21:59:26','2025-09-01 00:46:55'),(18,1,3,1,19,'A',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 21:59:52','2025-09-01 07:14:13'),(19,1,3,1,20,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 21:59:52','2025-09-01 07:14:13'),(20,1,3,1,21,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 21:59:52','2025-09-01 07:14:13'),(24,1,3,2,19,'A',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:13:59','2025-09-01 07:14:13'),(25,1,3,2,20,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:13:59','2025-09-01 07:14:13'),(26,1,3,2,21,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:13:59','2025-09-01 07:14:13'),(27,1,8,1,19,'A',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:32:44','2025-09-01 07:14:13'),(28,1,8,1,20,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:32:44','2025-09-01 07:14:13'),(29,1,8,1,21,'B',NULL,NULL,1,NULL,1,NULL,0,NULL,'2025-08-31 22:32:44','2025-09-01 07:14:13'),(30,1,2,1,19,'A',NULL,'Testing1',1,NULL,1,NULL,0,NULL,'2025-09-01 01:08:59','2025-09-01 01:08:59'),(34,2,5,1,23,'A',NULL,NULL,1,NULL,1,'U MG',0,NULL,'2025-09-01 03:32:19','2025-09-01 03:32:19'),(35,2,13,1,23,'B',NULL,NULL,1,NULL,1,'ဦးမြင့်ဆွေ',0,NULL,'2025-09-01 03:32:19','2025-09-01 03:32:19'),(36,1,22,1,19,'A',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(37,1,22,1,20,'B',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(38,1,22,1,21,'C',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(39,1,22,1,24,'A',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(40,1,22,1,25,'A',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(41,1,22,1,26,'B',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(42,1,22,1,27,'B',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54'),(43,1,22,1,28,'B',NULL,'CET1',1,NULL,1,'U MG',0,NULL,'2025-09-02 00:48:54','2025-09-02 00:48:54');
/*!40000 ALTER TABLE `quarly_cprs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web',NULL,NULL),(2,'student','web',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_asset_header`
--

DROP TABLE IF EXISTS `room_asset_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_asset_header` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_header_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint unsigned DEFAULT NULL,
  `section_id` bigint unsigned DEFAULT NULL,
  `voucher_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_room_asset_header_classs_id_section_id_key` (`class_id`,`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_asset_header`
--

LOCK TABLES `room_asset_header` WRITE;
/*!40000 ALTER TABLE `room_asset_header` DISABLE KEYS */;
INSERT INTO `room_asset_header` VALUES (7,'New Room 101 Asset',2,1,NULL,'New','2025-06-20 08:38:37','2025-06-20 08:38:37'),(8,'Grade-6 Room Assets',1,1,NULL,NULL,'2025-07-10 03:23:45','2025-07-10 03:23:45'),(9,'Room-A',3,1,NULL,'For new Student','2025-07-10 22:41:01','2025-07-10 22:41:01'),(10,'Head Mater Use',NULL,1,NULL,'for head master','2025-07-10 22:58:12','2025-07-10 22:58:12'),(11,'Science Lab Asset',NULL,1,NULL,'testing','2025-07-11 00:02:52','2025-07-11 00:02:52');
/*!40000 ALTER TABLE `room_asset_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_asset_items`
--

DROP TABLE IF EXISTS `room_asset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_asset_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_asset_header_id` bigint unsigned NOT NULL,
  `asset_id` int NOT NULL,
  `number_of_count` int NOT NULL,
  `asset_cost` decimal(18,2) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchased_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `asset_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `room_asset_items_fkey` (`room_asset_header_id`),
  CONSTRAINT `room_asset_header_class_section_fkey` FOREIGN KEY (`room_asset_header_id`) REFERENCES `room_asset_header` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_asset_items`
--

LOCK TABLES `room_asset_items` WRITE;
/*!40000 ALTER TABLE `room_asset_items` DISABLE KEYS */;
INSERT INTO `room_asset_items` VALUES (15,8,5,1,30000.00,'good','2025-07-10 03:26:27','2025-07-10 03:26:27','2025-04-30 17:30:00','Used'),(16,8,6,2,40000.00,NULL,'2025-07-10 03:26:27','2025-07-10 03:26:27','2025-06-08 17:30:00','Used'),(17,8,7,20,15000.00,NULL,'2025-07-10 03:26:27','2025-07-10 03:26:27','2025-04-30 17:30:00','Used'),(18,9,6,5,10000.00,NULL,'2025-07-10 22:41:01','2025-07-10 22:41:01','2025-07-08 17:30:00','Used'),(21,10,5,1,1000000.00,NULL,'2025-08-13 02:01:07','2025-08-13 02:01:07','2025-07-09 17:30:00','New'),(22,10,6,1,300000.00,NULL,'2025-08-13 02:01:07','2025-08-13 02:01:07','2025-08-12 17:30:00','New'),(23,11,5,1,20000.00,'good','2025-08-13 02:04:40','2025-08-13 02:04:40','2025-07-10 17:30:00','Used'),(24,11,8,1,5000.00,NULL,'2025-08-13 02:04:40','2025-08-13 02:04:40','2025-08-13 17:30:00','New'),(25,7,3,1,6000000.00,NULL,'2025-08-13 05:32:55','2025-08-13 05:32:55','2025-06-18 17:30:00','Used'),(26,7,6,1,30000.00,NULL,'2025-08-13 05:32:55','2025-08-13 05:32:55','2025-06-18 17:30:00','Used'),(27,7,5,1,5000.00,NULL,'2025-08-13 05:32:55','2025-08-13 05:32:55','2025-06-18 17:30:00','Used');
/*!40000 ALTER TABLE `room_asset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routines`
--

DROP TABLE IF EXISTS `routines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weekday` int NOT NULL,
  `class_id` int unsigned NOT NULL,
  `section_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routines`
--

LOCK TABLES `routines` WRITE;
/*!40000 ALTER TABLE `routines` DISABLE KEYS */;
INSERT INTO `routines` VALUES (16,'08:00','10:00',2,1,1,21,1,'2025-08-13 21:34:23','2025-08-13 22:20:22',NULL),(17,'10:00','12:00',1,1,1,19,1,'2025-08-14 02:03:06','2025-08-14 02:03:06',14),(18,'14:00','16:00',1,1,1,20,1,'2025-08-14 02:13:23','2025-08-14 02:13:23',17);
/*!40000 ALTER TABLE `routines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_assets`
--

DROP TABLE IF EXISTS `school_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_assets`
--

LOCK TABLES `school_assets` WRITE;
/*!40000 ALTER TABLE `school_assets` DISABLE KEYS */;
INSERT INTO `school_assets` VALUES (3,'ကျောင်းကား - YGN-101','Machine','2025-06-19 04:21:57','2025-06-19 04:21:57'),(5,'Clock','စာသင်ခန်းဆိုင်ရာ ပစ္စည်း','2025-06-19 04:24:36','2025-06-19 04:24:36'),(6,'Chair','furniture','2025-07-10 03:24:20','2025-07-10 03:24:20'),(7,'Student sitting table','furniture','2025-07-10 03:24:59','2025-07-10 03:24:59'),(8,'Earth Ballon','school use item','2025-08-13 02:03:36','2025-08-13 02:03:36');
/*!40000 ALTER TABLE `school_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_classes`
--

DROP TABLE IF EXISTS `school_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `class_fees` decimal(18,2) DEFAULT (0),
  `class_fees_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `class_fees_due_day` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'end_of_month',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_classes`
--

LOCK TABLES `school_classes` WRITE;
/*!40000 ALTER TABLE `school_classes` DISABLE KEYS */;
INSERT INTO `school_classes` VALUES (1,'Grade-6',1,'2025-06-12 10:16:16','2025-07-17 00:56:21',180000.00,'TheWholeYear','15th'),(2,'Grade-1',1,'2025-06-16 07:39:13','2025-06-16 07:39:13',120000.00,NULL,'end_of_month'),(3,'Grade-2',1,'2025-06-22 10:46:50','2025-06-22 10:46:50',120000.00,'TheWholeYear','end_of_month'),(4,'Grade-3',1,'2025-07-11 04:16:45','2025-07-11 04:16:45',120000.00,'TheWholeYear','15th'),(5,'Grade-7-new',4,'2025-08-12 03:10:04','2025-08-12 03:10:04',300000.00,'TheWholeYear','15th'),(6,'Grade-8-new',4,'2025-08-12 03:12:02','2025-08-12 03:12:02',300000.00,'TheWholeYear','end_of_month');
/*!40000 ALTER TABLE `school_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_fees_payments`
--

DROP TABLE IF EXISTS `school_fees_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_fees_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fees_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `section_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `section_id` (`section_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `school_fees_payments_class_id` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`),
  CONSTRAINT `school_fees_payments_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `school_fees_payments_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_fees_payments`
--

LOCK TABLES `school_fees_payments` WRITE;
/*!40000 ALTER TABLE `school_fees_payments` DISABLE KEYS */;
INSERT INTO `school_fees_payments` VALUES (7,8,100000.00,'2025-07-08','Cash','-','-','2025-07-07 23:18:51','2025-07-07 23:18:51','1stpayment',NULL,1,1),(8,5,120000.00,'2025-07-10','Bank Transfer','-','testing','2025-07-09 22:56:59','2025-08-12 22:57:52','unpaid',NULL,1,2),(9,16,100000.00,'2025-07-10','KPay','-','paid by aye','2025-07-10 00:22:45','2025-08-12 23:01:43','unpaid','/public/upload/schoolfeespayment/686f633dbae88.jpg',1,3),(10,2,100000.00,'2025-07-10','Cash','-','paid by Daw Aye','2025-07-10 00:40:04','2025-07-10 00:40:04','1stpayment',NULL,1,1),(11,5,120000.00,'2025-06-10','Cash','-','testing','2025-07-10 00:45:29','2025-07-10 00:45:29','1timeallcompletepayment',NULL,1,2),(12,13,120000.00,'2025-05-10','KPay','-','paid by Mom','2025-07-10 04:28:56','2025-07-10 04:28:56','1timeallcompletepayment',NULL,1,2);
/*!40000 ALTER TABLE `school_fees_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_sessions`
--

DROP TABLE IF EXISTS `school_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_sessions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_sessions`
--

LOCK TABLES `school_sessions` WRITE;
/*!40000 ALTER TABLE `school_sessions` DISABLE KEYS */;
INSERT INTO `school_sessions` VALUES (1,'2025-2026','2025-06-12 10:16:00','2025-06-12 10:16:00');
/*!40000 ALTER TABLE `school_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'Section=>A','Room=>1',1,1,'2025-06-12 10:17:12','2025-07-07 21:01:56'),(4,'Section-A','Room-1',5,4,'2025-08-12 03:10:17','2025-08-12 03:10:17'),(5,'Section-B','Room-2',6,4,'2025-08-12 03:12:21','2025-08-12 03:12:21');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `semester_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'Frist Semester','2025-06-01','2025-08-31',1,'2025-06-12 10:16:35','2025-06-12 10:16:35'),(2,'First semester','2025-08-14','2025-10-14',4,'2025-08-13 19:58:42','2025-08-13 19:58:42'),(3,'First semester','2025-09-03','2025-09-30',1,'2025-09-03 04:56:33','2025-09-03 04:56:33');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_academic_infos`
--

DROP TABLE IF EXISTS `student_academic_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_academic_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `board_reg_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_academic_infos`
--

LOCK TABLES `student_academic_infos` WRITE;
/*!40000 ALTER TABLE `student_academic_infos` DISABLE KEYS */;
INSERT INTO `student_academic_infos` VALUES (1,'303',2,'2025-06-12 10:20:58','2025-07-01 04:04:56'),(2,'304',3,'2025-06-12 10:29:28','2025-06-30 00:37:36'),(3,'101',5,'2025-06-24 08:34:03','2025-06-24 08:34:03'),(10,'No.6',8,'2025-06-30 03:10:16','2025-07-01 04:06:07'),(11,'No.7',9,'2025-06-30 03:25:25','2025-07-01 04:08:04'),(12,'305',10,'2025-07-01 04:21:01','2025-07-01 04:22:48'),(13,'306',11,'2025-07-01 04:30:04','2025-07-01 04:31:20'),(15,'309',13,'2025-07-02 21:26:20','2025-07-02 21:26:20'),(16,'0127',16,'2025-07-06 02:24:34','2025-08-08 01:12:09'),(18,'No.7',19,'2025-08-07 22:01:15','2025-08-08 01:11:52'),(19,'708',21,'2025-08-08 00:46:52','2025-08-08 01:32:11'),(20,'105',22,'2025-08-08 01:47:03','2025-08-08 01:47:03');
/*!40000 ALTER TABLE `student_academic_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_parent_infos`
--

DROP TABLE IF EXISTS `student_parent_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_parent_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int unsigned NOT NULL,
  `father_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mother_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nrc_father` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrc_mother` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_occupation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mother_occupation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_parent_infos`
--

LOCK TABLES `student_parent_infos` WRITE;
/*!40000 ALTER TABLE `student_parent_infos` DISABLE KEYS */;
INSERT INTO `student_parent_infos` VALUES (1,2,'U MG','09256275319','DAW SU SU','09256175319',NULL,'2025-06-12 10:20:57','2025-07-01 04:04:56','9/NATAKA(N)162219','9/NATAKA(N)162210',NULL,NULL),(2,3,'MG','+66908915843','Su','+66908915843',NULL,'2025-06-12 10:29:28','2025-06-30 00:37:36','9/NATAKA(N)162219','9/NATAKA(N)162210',NULL,NULL),(3,5,'U MG','+66908915843','DAW SU','+66908915843','YGN','2025-06-24 08:34:03','2025-06-24 08:34:03','9/NATAKA(N)1622197','9/NATAKA(N)1622109',NULL,NULL),(5,8,'ဦးဟန်မြင့်ထွန်း','+959796092890','ဒေါ်သီရိစိုး','+959796092890',NULL,'2025-06-30 03:10:16','2025-07-01 04:06:07','၉/လဝန(နိုင်) ၁၃၅၈၅၄','၉/လဝန(နိုင်) ၁၅၅၁၉၈','Doctor','no'),(6,9,'ဦးမြင့်ဆွေ','+959796092890','ဒေါ်သီရိစိုး','ဒေါ်သီရိစိုး',NULL,'2025-06-30 03:25:25','2025-07-01 04:08:04','၉/လဝန(နိုင်) 037660','၉/လဝန(နိုင်) ၁၅၅၁၉၈','Teacher','Teacher'),(7,10,'ဦးဟန်မြင့်ထွန်း','+959796092890','ဒေါ်သီရိစိုး','+95943043963',NULL,'2025-07-01 04:21:01','2025-07-01 04:22:48','၉/လဝန(နိုင်) ၁၅၉၀၁၄','၉/လဝန(နိုင်) ၀၃၇၆၅၉','Teacher','Teacher'),(8,11,'ဦးမြင့်ဆွေ','+959796092890','ဒေါ်မွှေးမွှေး','+959199198277',NULL,'2025-07-01 04:30:04','2025-07-01 04:31:20','၉/လဝန(နိုင်) ၀၀၀၆၀၈','၉/လဝန(နိုင်) ၁၅၀၅၈၀','Doctor','Teacher'),(10,13,'ဦးမြင့်ဆွေ','+959199198277','ဒေါ်သီရိစိုး','+959199198277',NULL,'2025-07-02 21:26:20','2025-07-02 21:26:20','၉/လဝန(နိုင်) ၁၅၉၀၁၀','၉/လဝန(နိုင်) ၁၅၅၁၉၄','Doctor','Teacher'),(11,16,'ဦးနေလင်းအောင်','+959420777050','ဒေါ်သီရိစိုး','+959796092890',NULL,'2025-07-06 02:24:34','2025-08-08 01:12:09','၉/လဝန(နိုင်) ၁၅၉၀၁၄','၉/လဝန(နိုင်) ၀၃၇၆၅၉','Doctor','Teacher'),(13,19,'U Hla Win','+959796092890','Daw Aye','+959420777050',NULL,'2025-08-07 22:01:15','2025-08-08 01:11:52','၉/လဝန(နိုင်) 037660','၉/လဝန(နိုင်) ၁၅၅၁၉၈',NULL,NULL),(14,21,'U MG','+959796092890','DAW SU SU','+959796092890',NULL,'2025-08-08 00:46:52','2025-08-08 01:32:11','၉/လဝန(နိုင်) ၁၃၅၈၅၄','၉/လဝန(နိုင်) ၁၅၅၁၉၈',NULL,NULL),(15,22,'U MG','+959796092890','DAW SU SU','+959796092890',NULL,'2025-08-08 01:47:03','2025-08-08 01:47:03','၉/လဝန(နိုင်) ၁၅၉၀၁၄','၉/လဝန(နိုင်) ၁၅၅၁၉၈','Doctor','Teacher');
/*!40000 ALTER TABLE `student_parent_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syllabi`
--

DROP TABLE IF EXISTS `syllabi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syllabi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `syllabus_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `syllabus_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `session_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syllabi`
--

LOCK TABLES `syllabi` WRITE;
/*!40000 ALTER TABLE `syllabi` DISABLE KEYS */;
INSERT INTO `syllabi` VALUES (1,'မြန်မာစာ','upload/syllabus/684b0bc2b1dff.png',1,1,1,'2025-06-12 10:17:54','2025-06-12 10:17:54'),(2,'မြန်မာစာ','upload/syllabus/6851902c41a9c.png',1,1,1,'2025-06-17 08:56:28','2025-06-17 08:56:28'),(3,'မြန်မာစာ','upload/syllabus/685199bd5ae50.png',1,1,1,'2025-06-17 09:37:17','2025-06-17 09:37:17'),(4,'မြန်မာစာ 3','upload/syllabus/685199dab0393.pdf',1,1,1,'2025-06-17 09:37:46','2025-06-17 09:37:46'),(5,'မြန်မာစာ 3','upload/syllabus/6856660165002.pdf',1,1,1,'2025-06-21 00:57:53','2025-06-21 00:57:53'),(6,'Myanmar Book','upload/syllabus/686c8ed9475af.pdf',1,1,1,'2025-07-07 20:52:01','2025-07-07 20:52:01'),(7,'Myanmar Book','upload/syllabus/689aae6ce1aa9.txt',1,1,1,'2025-08-11 20:31:00','2025-08-11 20:31:00'),(8,'Math Book','upload/syllabus/689aeec9be7e8.txt',1,5,1,'2025-08-12 01:05:37','2025-08-12 01:05:37'),(9,'Physics Book','upload/syllabus/689af009cdc8a.jpg',3,11,1,'2025-08-12 01:10:57','2025-08-12 01:10:57');
/*!40000 ALTER TABLE `syllabi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_lecture_fees_payments`
--

DROP TABLE IF EXISTS `teacher_lecture_fees_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_lecture_fees_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_for` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fees_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teacher_lecture_fees_payments_class_id` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`),
  CONSTRAINT `teacher_lecture_fees_payments_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_lecture_fees_payments`
--

LOCK TABLES `teacher_lecture_fees_payments` WRITE;
/*!40000 ALTER TABLE `teacher_lecture_fees_payments` DISABLE KEYS */;
INSERT INTO `teacher_lecture_fees_payments` VALUES (4,4,NULL,60000.00,'2025-06','2025-06-24','Cash','paid','Advance Money','2025-06-23 22:54:54','2025-07-10 03:10:38'),(7,14,NULL,500000.00,'2025-06','2025-06-30','Cash','paid',NULL,'2025-07-14 22:00:38','2025-07-14 22:00:38');
/*!40000 ALTER TABLE `teacher_lecture_fees_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `townships`
--

DROP TABLE IF EXISTS `townships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `townships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `township_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_township_name_city` (`township_name`,`city_id`),
  KEY `fk_townships_city_id` (`city_id`),
  CONSTRAINT `fk_townships_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `townships`
--

LOCK TABLES `townships` WRITE;
/*!40000 ALTER TABLE `townships` DISABLE KEYS */;
INSERT INTO `townships` VALUES (1,'Hlaing',3,'2025-06-16 08:42:56','2025-06-16 08:42:56'),(2,'အမရပူရ',4,'2025-06-16 08:43:11','2025-06-16 08:43:11'),(3,'ဇဗူသီရိ',5,'2025-06-16 08:43:37','2025-06-16 08:43:37'),(4,'ကမာရွတ်မြို့နယ်',3,'2025-06-16 19:54:02','2025-06-16 19:54:02');
/*!40000 ALTER TABLE `townships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_registered_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_fees` decimal(18,2) DEFAULT (0),
  `teacher_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `township_id` bigint unsigned DEFAULT NULL,
  `trc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `student_height` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_stay_hostel` tinyint(1) DEFAULT '0',
  `is_take_ferry` tinyint(1) DEFAULT '0',
  `distinct_geo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `division` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'MG','MG','admin@gmail.com','male','Bangladeshi','01771519627','ptk',NULL,'8640',NULL,NULL,NULL,NULL,'admin',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-06-12 10:04:03','2025-06-12 10:04:03',0.00,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(2,'မင်းမင်း','MG MIN MIN','MinMin2','Male','MMR','+66908915843','YGN','9/Nataka(N)162219','2025',NULL,'2025-06-13','A+','Islam','student',NULL,'$2y$12$pkt2C05iXwqg3J.6KO7r5umOOFnnVELWE3WV0.a0NGaWJWCE28Cxm',NULL,'2025-06-12 10:20:57','2025-07-22 02:42:40',0.00,NULL,3,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(3,'မစောယု','saw yu','saw@gmail.com','Male','MMR','+66908915843','YGN','9/Nataka(N)1622193','101','upload/student/686237b8b8106.png','2025-06-13','A+','Buddhism','student',NULL,'$2y$12$ceuYh3bpn0pauszgLBmiq.PDoNLa1drkiMQdbNEtbHTRcnEjXwvf.',NULL,'2025-06-12 10:29:28','2025-07-22 01:39:45',0.00,NULL,3,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(4,'ဒေါ်ကြူကြူ','Daw Kyu Kyu','KyuKyu','Female','MMR','+66908915843','YGN','BA,B.ED','၉/လဝန(နိုင်) ၀၃၂၈၀၉','/public/upload/teacher/686a3b3f4b473.jpg',NULL,NULL,NULL,'teacher',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-06-12 10:32:28','2025-07-06 02:30:47',10000000.00,'ကျောင်းအုပ်ကြီး',3,1,'A-1156','testing',NULL,0,0,NULL,NULL,NULL),(5,'အေးအေး','AYE AYE','ayeaye101@gmail.com','Female','MMR','+66908915843','YGN','-','101','upload/student/685ac56ab9c62.jpg','2001-10-10','A+','Islam','student',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-06-24 08:34:03','2025-06-24 08:34:03',0.00,NULL,3,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),(8,'မမေယွန်းမြင့်မိုရ်','May Yoon Myint Moe','MayYoon','Male',NULL,'+959199198277','အမှတ်-၅ လယ်ဝေးမြို့','-','101',NULL,'2010-02-28','A+',NULL,'student',NULL,'$2y$12$tiHH4cJ9MRJVebR0sj.NZOC2ZjDqdPwwIagemsZgiSS9DKEVxy46u',NULL,'2025-06-30 03:10:16','2025-07-22 01:28:16',0.00,NULL,3,1,NULL,NULL,'4\'',1,0,NULL,NULL,NULL),(9,'မောင်မင်းဆက်ဖြိုး','Min Set Phyo','Min Set','Male',NULL,'+959420777050','အမှတ်-၅ လယ်ဝေးမြို့','-','101',NULL,'2016-01-30','A+',NULL,'student',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-06-30 03:25:25','2025-07-01 04:08:04',0.00,NULL,3,1,NULL,NULL,NULL,0,1,NULL,NULL,NULL),(10,'Hnin','Hnin','HninHnin1','Male',NULL,'+959420777050','အမှတ်-၅ လယ်ဝေးမြို့','-','101',NULL,'2010-02-01','A+',NULL,'student',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-07-01 04:21:01','2025-07-01 04:22:48',0.00,NULL,3,1,NULL,NULL,'4\'',1,0,NULL,NULL,NULL),(11,'မမေမာန်လှိုင်း','May Mhan Hling','MayMhanHling','Male',NULL,'+95943043963','အမှတ်-၆  လယ်ဝေးမြို့','-','101',NULL,'2009-02-01','A+',NULL,'student',NULL,'$2y$12$f8cJ839KGt4RIGxQpsvo/OIKn67/7NnFuF72Hcmerf1iK.1Zdf8Xe',NULL,'2025-07-01 04:30:04','2025-07-01 04:31:20',0.00,NULL,3,1,NULL,NULL,'4\'',0,1,NULL,NULL,NULL),(13,'Mya','Mya','myamya','Female',NULL,'+959796092890','Sanchaung, Mingalar street, Yangon','-','2025',NULL,'2020-02-03','A-',NULL,'student',NULL,'$2y$12$cARV.3PKShg9cQcaXfA5Eu9.WLksUg3zVVNaApeuCGV4uG6y2p7Kq',NULL,'2025-07-02 21:26:20','2025-07-02 21:26:20',0.00,NULL,3,1,NULL,NULL,'3\'',1,0,NULL,NULL,NULL),(14,'Lat','Lat','LatLat','Male',NULL,'+95943043963','အမှတ်-၆  လယ်ဝေးမြို့','B.ED','12/katata(N)098767',NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$BGfRH7uDgyKOdePwynUoSOxFU5JnaDE0STOOPTF8e7AJrWJOvgQoK',NULL,'2025-07-03 04:46:46','2025-08-26 02:48:32',500000.00,'အလယ်တန်း​ပြ',3,1,'လျှောက်ထားဆဲ','good',NULL,0,0,NULL,NULL,NULL),(15,'Maw Maw','Maw Maw','MawMaw','Female',NULL,'+959199198277','အမှတ်-၅ လယ်ဝေးမြို့','passed grade-12','12/katata(N)098768',NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$3tJQ7hcPtzpJm0e0Js9b4OEWUVW5mPcovtY87eY2fhjkdbsQDMZkq',NULL,'2025-07-03 21:04:40','2025-07-03 21:04:40',500000.00,'ကျောင်းဝန်ထမ်း',3,1,'-','good',NULL,0,0,NULL,NULL,NULL),(16,'Aye Mya','Aye Mya','AyeMya','Male',NULL,'+95943043963','အမှတ်-၆  လယ်ဝေးမြို့','-','101',NULL,'2013-01-06','A+',NULL,'student',NULL,'$2y$12$i6XuaGsHokozEGeyOV0Jo.Yo..jMSKECWI/MmEfoDJWUQTob5xNP2',NULL,'2025-07-06 02:24:34','2025-08-08 01:12:09',0.00,NULL,3,1,NULL,NULL,'4\'',0,1,NULL,NULL,'malama234'),(17,'Tr.Mya','Tr.Mya','mya','Female',NULL,'+959796092890','Sanchaung, Mingalar street, Yangon','BA,B.ED','12345',NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$tIjuajTx8wC/5SLBqIRLDe7PeQReyF1vmu0aYPF3NTF4hNAhYSa5W',NULL,'2025-07-15 21:21:01','2025-08-26 02:33:33',700000.00,'အလယ်တန်း​ပြ',4,2,'လျှောက်ထားဆဲ',NULL,NULL,0,0,NULL,NULL,'taphaya2348765'),(19,'ZIN','PHYU','zinphyu','Male',NULL,'+959796092890','Sanchaung,Mingalar street',NULL,'101',NULL,'2008-10-08',NULL,NULL,'student',NULL,'$2y$12$GaEWYztRmVHz9pU3g1wUNO6GTk7XKhonf8QXgcNW0gpPVEEyYMQVy',NULL,'2025-08-07 22:01:15','2025-08-08 01:11:52',0.00,NULL,3,1,NULL,NULL,NULL,0,0,NULL,NULL,'taphaya2348765'),(20,'Hnin','phyu','hninphyu','Male',NULL,'+959796092890','Sanchaung, Mingalar street, Yangon','BED','12345',NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$D4ym46NrFNz/8WNRT8TPROD33.vWSbCiZWzaQHi4fb7Kjw7AiyrgG',NULL,'2025-08-08 00:30:15','2025-08-08 01:07:22',500000.00,'မူလတန်းပြ',4,2,'လျှောက်ထားဆဲ',NULL,NULL,0,0,NULL,NULL,'malama234'),(21,'win','aye','winaye','Male',NULL,'+959796092890','မောင်မောင်',NULL,'2025',NULL,'2015-01-08',NULL,NULL,'student',NULL,'$2y$12$DwqFpg7wof2WPuK/5IDBJuCLSKSWY/bLEWD0P8.J4vzJW0LmrbEaW',NULL,'2025-08-08 00:46:52','2025-08-08 01:32:11',0.00,NULL,4,2,NULL,NULL,NULL,1,0,NULL,NULL,'76896444'),(22,'May','War','maywar','Male',NULL,'+959199198277','Sanchaung, Mingalar street, Yangon',NULL,NULL,NULL,'2014-01-08',NULL,NULL,'student',NULL,'$2y$12$y3SP1gedAGLXTf95MvUcd.i5jCJnCqog0xBSdkjDERGP3jT52XQrG',NULL,'2025-08-08 01:47:03','2025-08-08 01:47:03',0.00,NULL,3,1,NULL,NULL,NULL,1,0,NULL,NULL,NULL),(25,'Hnin','Phyu','hninphyu11','Female',NULL,'+959796092890','Sanchaung, Mingalar street, Yangon',NULL,NULL,NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$z71jM8CK1Av/SKPf5TJsu.tqQbkClIMsmuDYHsAaD.BnBcYigJFaq',NULL,'2025-08-08 02:00:27','2025-08-08 02:00:27',500000.00,'မူလတန်းပြ',3,1,'လျှောက်ထားဆဲ',NULL,NULL,0,0,NULL,NULL,NULL),(26,'Tr.Su-Grade-1','Tr.Su-Grade-1','SuSu','Female',NULL,'+959420777050','အမှတ်-၅ လယ်ဝေးမြို့',NULL,NULL,NULL,NULL,NULL,NULL,'teacher',NULL,'$2y$12$JjzrZLViHzLi7.xHSBy6ueoIPfvRdDgIcHdWz75DBKw9BlDH8su46',NULL,'2025-08-27 01:08:41','2025-08-27 02:07:32',500000.00,'အထက်တန်းပြ',5,3,'လျှောက်ထားဆဲ',NULL,NULL,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-03 18:07:22
