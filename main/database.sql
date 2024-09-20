-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: jobbox
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'4Dq3lzf96a1Rns03aEoq6uPvJ7m0XB7q',1,'2024-05-22 23:56:17','2024-05-22 23:56:17','2024-05-22 23:56:17');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Magni enim in nemo. Maiores ipsam provident eum debitis ea quis. Assumenda quis quibusdam eligendi illo optio. Minus voluptas quia pariatur quas reiciendis.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(2,'Lifestyle',0,'Rerum perferendis eos vel consequatur inventore. Laudantium dolorem saepe odit sint dolor. Aut quis aspernatur accusantium autem quis. Mollitia vel atque quia repellat accusantium.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(3,'Travel Tips',2,'Cumque aut repellendus excepturi a. Exercitationem recusandae qui facere ut quas ut. Ut quo eius quisquam veritatis. Impedit aspernatur nemo veritatis quaerat.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(4,'Healthy',0,'Nobis rem quia dolor non aut officiis incidunt. Atque adipisci voluptatem itaque. Fugiat sunt eveniet molestias et molestiae amet quisquam molestias. Voluptatibus beatae molestiae a eaque.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(5,'Travel Tips',4,'Commodi dolorem laboriosam pariatur delectus fugit et maxime illo. Minus quia consequatur dolor. Quis aut repellat qui dolore hic. Eum perferendis dolores eaque ratione.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(6,'Hotel',0,'Deserunt autem sit temporibus molestias quis est. Molestias blanditiis itaque et. Neque laudantium ipsum voluptates. Voluptas id in commodi ut.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-22 23:56:23','2024-05-22 23:56:23'),(7,'Nature',6,'Facilis excepturi quasi tempora minima aut dolores. Placeat dolor qui qui porro.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-22 23:56:23','2024-05-22 23:56:23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/location1.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'London','london',2,2,NULL,0,'locations/location2.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'New York','new-york',3,3,NULL,0,'locations/location3.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'New York','new-york-1',4,4,NULL,0,'locations/location4.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/location5.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(6,'Berlin','berlin',6,6,NULL,0,'locations/location6.png',0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Mr. Gerardo Olson I','melvin58@example.com','+14786055665','547 Kailyn Turnpike Apt. 915\nPort Terrance, TN 83848-9175','Vel rerum molestias ut nobis.','Magnam ut minima sapiente omnis quod nulla. Est quos possimus quia itaque porro quisquam. At nihil aliquam qui numquam harum. Quod sint enim nisi. Suscipit omnis eligendi earum dolorum et veniam atque. Maiores nam ipsam cupiditate est aut labore. Adipisci dolorem iste error dolor consectetur ipsa. Aut enim quidem sapiente et. Voluptatem ipsa aut beatae aliquam et ab in.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(2,'Erika Gottlieb','waelchi.millie@example.com','+15864414352','487 Adan Ville\nLake Priscillaland, MO 83175-9136','Qui repellat qui quia modi voluptatem sunt.','Voluptate expedita alias recusandae aut quia nobis reiciendis. Magni quis qui libero commodi provident. Ipsum explicabo deserunt quam corrupti. Cupiditate adipisci exercitationem eligendi nihil ipsum sit. Repellendus asperiores vel non voluptas omnis quidem aspernatur. Qui ut quis voluptas cupiditate. Fugit quasi dignissimos dicta omnis facere quibusdam facere. Dolor molestiae in voluptate et.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(3,'Mr. Elliott Stroman','estell52@example.com','+18583125433','9607 Jonas Gardens Suite 791\nPort Emerson, AR 39027-9235','Sequi quaerat iusto ducimus itaque aut nihil.','Ipsam est nostrum voluptatem. Sit aut officia quia eveniet. Dolores reiciendis minima aut numquam placeat quisquam dolorum. Eos aut facere itaque non vero excepturi iure. Consectetur porro rerum dolorem voluptas nihil sed nihil. Commodi qui saepe id est modi neque quia. Commodi quo rem perferendis incidunt in. Aspernatur nihil qui quaerat aut aut et veniam. Consequatur vel fugiat aut voluptate quaerat repellendus. Totam perferendis eos autem optio. Delectus officia hic sint qui.',NULL,'read','2024-05-22 23:56:24','2024-05-22 23:56:24'),(4,'Jake Weber','vita.lubowitz@example.net','+15806447036','1735 Reuben Lakes Apt. 153\nGradyborough, WV 34862-4718','Nemo enim et fuga omnis at quia.','Dolores delectus ea occaecati unde et excepturi deleniti. Numquam inventore repellat repellat illo. Eos et molestiae est qui. Aperiam maiores vel est iusto pariatur similique temporibus natus. Quis nobis quos ratione molestiae rem adipisci aut. Necessitatibus maiores vel possimus praesentium porro quaerat et neque. Maiores quis minus vitae aut reprehenderit.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(5,'Cierra Shields','jacey64@example.net','+12346195968','9220 Fay Crest Apt. 198\nTremblayside, SC 14171','Voluptatem hic et sit voluptatibus eius enim.','Nemo dignissimos et consequuntur. Autem ut est labore dolores. Sit in quo voluptatem autem. Quibusdam eligendi itaque ad quod exercitationem eius. Unde labore ea rerum sit. Cumque ratione nihil sequi nemo sed. Et sapiente accusantium veniam autem et. Consequuntur et illo voluptas adipisci sed modi. Commodi doloremque assumenda quis nisi. Et blanditiis perferendis est ratione ut dignissimos.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(6,'Christy Monahan','wehner.nova@example.org','+13142629387','98475 Rebecca Trafficway\nFaheyfort, UT 41595-5391','Ab sed voluptas ea.','Alias et quod ab quae dolorum vitae. Molestiae dignissimos minus assumenda ea. Rerum tenetur non fugiat non delectus qui neque. Expedita molestias et enim quam sit architecto. Autem distinctio quaerat ea maxime et voluptate. Autem modi omnis molestiae mollitia autem dolore. Et perferendis at nostrum odio necessitatibus optio quisquam. Et ab iusto ut. Ratione dolore sed voluptatem non.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(7,'Armando Swift','athena82@example.com','+16676919657','3210 Keenan Branch\nLake Howardstad, DE 41154','Magnam laboriosam et quia cum quam quae ut.','In omnis ipsa earum eaque et est recusandae. Ut quas maiores suscipit aut. Earum at voluptate molestiae aut quia qui hic. Aliquid tempore dolorem ut aperiam. Quos eius enim error et quia a aut. Aut veritatis nisi quod quia provident rerum. Architecto odio totam facere dolores. Placeat dolorum in quidem id aut corporis porro.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(8,'Mylene O\'Reilly','russ33@example.com','+13806041302','9163 Donnelly Camp Apt. 385\nNew Llewellynview, IL 59404','Vel voluptas et provident amet eius tenetur.','Et deleniti suscipit et enim maiores vel qui. Aut sapiente tempore quis et repellendus doloremque. Corporis vitae maiores suscipit eligendi. Quisquam eligendi omnis minima maiores error eligendi sed. Mollitia quo illo fugit distinctio rerum quo esse. Ex est nisi rem repudiandae sapiente quis illum. Commodi dicta inventore unde dolor dolores aspernatur. Minima aut iure alias quae quis. Dolorum sunt natus facere aut enim. Architecto quia voluptatum qui commodi accusamus.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(9,'Curt Fay DVM','wunsch.myrtie@example.com','+15514963184','75291 Maxime Alley\nLake Grayson, HI 07577','Odit est sunt id repellat recusandae et ea.','Quia placeat aspernatur aut atque ut ut. Quos voluptatem rerum quos recusandae voluptas qui. Libero reprehenderit consequatur nobis neque molestias. Unde sed non nobis alias ea. Id nisi officia consectetur atque repellat qui nobis ad. Magni iste possimus nesciunt explicabo voluptatem. Doloribus nesciunt quisquam et ut beatae ad eligendi. Voluptatem sapiente asperiores dicta qui iste dolorem.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24'),(10,'Alba Hagenes','jmarvin@example.net','+17795387032','7615 Cormier Junction\nSouth Adamside, MI 93256-9912','Sapiente sit vel temporibus.','Dolor dolorem modi eos autem aperiam ducimus quo. Perspiciatis occaecati aspernatur sequi voluptatem natus. Sunt corporis dolore iste dicta. Molestiae suscipit aspernatur ut blanditiis. Voluptas debitis tempore aut qui magni fugiat. Saepe distinctio quia nostrum est fuga. Commodi non sit nesciunt qui quisquam omnis. Est molestiae vel ut quo. Cumque ut ratione quo quod sunt cupiditate.',NULL,'unread','2024-05-22 23:56:24','2024-05-22 23:56:24');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-05-22 23:56:27',NULL,'FRA'),(2,'England','English',0,0,'published','2024-05-22 23:56:27',NULL,'UK'),(3,'USA','Americans',0,0,'published','2024-05-22 23:56:27',NULL,'US'),(4,'Holland','Dutch',0,0,'published','2024-05-22 23:56:27',NULL,'HL'),(5,'Denmark','Danish',0,0,'published','2024-05-22 23:56:27',NULL,'DN'),(6,'Germany','Danish',0,0,'published','2024-05-22 23:56:27',NULL,'DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL),(2,'Buying',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL),(3,'Payment',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL),(4,'Support',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-05-22 23:57:02','2024-05-22 23:57:02');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Eos eum aliquam eum sit. Adipisci illum hic eum cupiditate ut.',1,0,'galleries/1.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24'),(2,'New Day','Neque perspiciatis illum aut dicta et. Optio consequatur nemo excepturi harum. Similique in nisi et necessitatibus magnam ut.',1,0,'galleries/2.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24'),(3,'Happy Day','Quidem laboriosam qui nihil nihil iure. Atque accusantium nesciunt rerum dolores corrupti hic fuga.',1,0,'galleries/3.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24'),(4,'Nature','Rerum aut natus est dolorem. Rerum odit eveniet ipsa optio voluptatum debitis magni ad.',1,0,'galleries/4.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24'),(5,'Morning','Ea velit tempora vel illo. Et id et velit officia accusantium iste.',1,0,'galleries/5.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24'),(6,'Photography','Quod eos occaecati dolor ipsa temporibus totam est. Ex sunt rerum impedit illum ut unde. Nulla ad nesciunt rerum nostrum sit consectetur.',1,0,'galleries/6.jpg',1,'published','2024-05-22 23:56:24','2024-05-22 23:56:24');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Voluptatem veritatis dolor ex maiores animi eos iure. Doloribus odit asperiores impedit vel. Porro velit illo quos maxime.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Maiores aut est accusantium a. Voluptatum cumque et architecto magni culpa. Recusandae temporibus voluptates praesentium ea reiciendis id aut qui.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Fugiat quia laborum pariatur unde. Quia et consectetur vel blanditiis et officia. Cupiditate quia officia iste dicta et voluptatem.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Libero quam adipisci velit id vitae aut eligendi. Quia dolores aperiam omnis velit itaque quod rerum.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Aut est sapiente aspernatur qui ipsum nesciunt nesciunt. Reiciendis nostrum dolores qui vel. Consequatur quo ullam est eligendi voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Molestiae cum autem commodi odio qui temporibus. Aliquid ut praesentium ipsum sit soluta enim provident. Aut quo omnis sit accusantium et sit porro.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quo error ut dicta praesentium. Et sit ipsa ut voluptatem sunt tenetur.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Mollitia fuga officia et et. Quibusdam in quia possimus ipsum neque ipsa. Magni libero earum dicta.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Maiores quia doloremque aperiam fuga impedit incidunt. Laborum quia ipsa aut quas. Ut aut aut expedita rerum nisi hic nisi.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-05-22 23:56:24','2024-05-22 23:56:24');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_activity_logs`
--

DROP TABLE IF EXISTS `jb_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_activity_logs`
--

LOCK TABLES `jb_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `jb_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_educations`
--

DROP TABLE IF EXISTS `jb_account_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `specialized` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_educations`
--

LOCK TABLES `jb_account_educations` WRITE;
/*!40000 ALTER TABLE `jb_account_educations` DISABLE KEYS */;
INSERT INTO `jb_account_educations` VALUES (1,'The University of the State of Alabama',2,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:33','2024-05-22 23:56:33'),(2,'American Institute of Health Technology',6,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:34','2024-05-22 23:56:34'),(3,'Adams State College',7,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:34','2024-05-22 23:56:34'),(4,'Antioch University McGregor',9,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:35','2024-05-22 23:56:35'),(5,'Associated Mennonite Biblical Seminary',10,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:35','2024-05-22 23:56:35'),(6,'The University of the State of Alabama',12,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:36','2024-05-22 23:56:36'),(7,'Antioch University McGregor',13,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:36','2024-05-22 23:56:36'),(8,'Associated Mennonite Biblical Seminary',16,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:37','2024-05-22 23:56:37'),(9,'Gateway Technical College',17,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:37','2024-05-22 23:56:37'),(10,'Adams State College',18,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:38','2024-05-22 23:56:38'),(11,'American Institute of Health Technology',21,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:38','2024-05-22 23:56:38'),(12,'Antioch University McGregor',23,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:39','2024-05-22 23:56:39'),(13,'Gateway Technical College',25,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:39','2024-05-22 23:56:39'),(14,'American Institute of Health Technology',26,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(15,'Adams State College',27,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(16,'The University of the State of Alabama',28,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(17,'Antioch University McGregor',30,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:41','2024-05-22 23:56:41'),(18,'Antioch University McGregor',32,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:41','2024-05-22 23:56:41'),(19,'Adams State College',34,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:42','2024-05-22 23:56:42'),(20,'American Institute of Health Technology',35,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:42','2024-05-22 23:56:42'),(21,'The University of the State of Alabama',36,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(22,'The University of the State of Alabama',38,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(23,'American Institute of Health Technology',39,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(24,'The University of the State of Alabama',41,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:44','2024-05-22 23:56:44'),(25,'Adams State College',43,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:45','2024-05-22 23:56:45'),(26,'American Institute of Health Technology',45,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:45','2024-05-22 23:56:45'),(27,'Antioch University McGregor',47,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(28,'Gateway Technical College',48,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(29,'Antioch University McGregor',49,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(30,'Antioch University McGregor',51,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:47','2024-05-22 23:56:47'),(31,'Associated Mennonite Biblical Seminary',52,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:47','2024-05-22 23:56:47'),(32,'American Institute of Health Technology',55,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:48','2024-05-22 23:56:48'),(33,'Antioch University McGregor',57,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:49','2024-05-22 23:56:49'),(34,'Antioch University McGregor',59,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:49','2024-05-22 23:56:49'),(35,'Associated Mennonite Biblical Seminary',60,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(36,'Gateway Technical College',61,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(37,'American Institute of Health Technology',62,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(38,'American Institute of Health Technology',64,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(39,'Antioch University McGregor',65,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(40,'The University of the State of Alabama',66,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(41,'The University of the State of Alabama',67,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(42,'The University of the State of Alabama',68,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(43,'Gateway Technical College',69,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(44,'Adams State College',70,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(45,'Adams State College',71,'Economics','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:53','2024-05-22 23:56:53'),(46,'Adams State College',73,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:53','2024-05-22 23:56:53'),(47,'Associated Mennonite Biblical Seminary',74,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:54','2024-05-22 23:56:54'),(48,'Associated Mennonite Biblical Seminary',76,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:54','2024-05-22 23:56:54'),(49,'Associated Mennonite Biblical Seminary',77,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:55','2024-05-22 23:56:55'),(50,'Antioch University McGregor',79,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:55','2024-05-22 23:56:55'),(51,'The University of the State of Alabama',81,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:56','2024-05-22 23:56:56'),(52,'American Institute of Health Technology',83,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:56','2024-05-22 23:56:56'),(53,'Associated Mennonite Biblical Seminary',85,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:57','2024-05-22 23:56:57'),(54,'Associated Mennonite Biblical Seminary',86,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:57','2024-05-22 23:56:57'),(55,'Antioch University McGregor',87,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(56,'Gateway Technical College',88,'Art History','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(57,'Associated Mennonite Biblical Seminary',90,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(58,'The University of the State of Alabama',92,'Classical Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:59','2024-05-22 23:56:59'),(59,'American Institute of Health Technology',93,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:59','2024-05-22 23:56:59'),(60,'Gateway Technical College',97,'Anthropology','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:57:00','2024-05-22 23:57:00'),(61,'Adams State College',100,'Culture and Technology Studies','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:57:01','2024-05-22 23:57:01');
/*!40000 ALTER TABLE `jb_account_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_experiences`
--

DROP TABLE IF EXISTS `jb_account_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_experiences`
--

LOCK TABLES `jb_account_experiences` WRITE;
/*!40000 ALTER TABLE `jb_account_experiences` DISABLE KEYS */;
INSERT INTO `jb_account_experiences` VALUES (1,'Exploration Kids',2,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:33','2024-05-22 23:56:33'),(2,'Exploration Kids',6,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:34','2024-05-22 23:56:34'),(3,'Exploration Kids',7,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:34','2024-05-22 23:56:34'),(4,'Spa Paragon',9,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:35','2024-05-22 23:56:35'),(5,'Exploration Kids',10,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:35','2024-05-22 23:56:35'),(6,'Darwin Travel',12,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:36','2024-05-22 23:56:36'),(7,'Darwin Travel',13,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:36','2024-05-22 23:56:36'),(8,'Darwin Travel',16,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:37','2024-05-22 23:56:37'),(9,'Darwin Travel',17,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:37','2024-05-22 23:56:37'),(10,'Spa Paragon',18,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:38','2024-05-22 23:56:38'),(11,'GameDay Catering',21,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:38','2024-05-22 23:56:38'),(12,'Party Plex',23,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:39','2024-05-22 23:56:39'),(13,'GameDay Catering',25,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:39','2024-05-22 23:56:39'),(14,'Darwin Travel',26,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(15,'Darwin Travel',27,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(16,'Exploration Kids',28,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:40','2024-05-22 23:56:40'),(17,'Darwin Travel',30,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:41','2024-05-22 23:56:41'),(18,'Party Plex',32,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:41','2024-05-22 23:56:41'),(19,'Exploration Kids',34,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:42','2024-05-22 23:56:42'),(20,'Darwin Travel',35,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:42','2024-05-22 23:56:42'),(21,'Darwin Travel',36,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(22,'Party Plex',38,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(23,'Spa Paragon',39,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:43','2024-05-22 23:56:43'),(24,'Party Plex',41,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:44','2024-05-22 23:56:44'),(25,'GameDay Catering',43,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:45','2024-05-22 23:56:45'),(26,'Darwin Travel',45,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:45','2024-05-22 23:56:45'),(27,'Party Plex',47,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(28,'GameDay Catering',48,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(29,'Exploration Kids',49,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:46','2024-05-22 23:56:46'),(30,'Exploration Kids',51,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:47','2024-05-22 23:56:47'),(31,'Spa Paragon',52,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:47','2024-05-22 23:56:47'),(32,'GameDay Catering',55,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:48','2024-05-22 23:56:48'),(33,'Darwin Travel',57,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:49','2024-05-22 23:56:49'),(34,'GameDay Catering',59,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:49','2024-05-22 23:56:49'),(35,'Darwin Travel',60,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(36,'Exploration Kids',61,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(37,'Darwin Travel',62,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:50','2024-05-22 23:56:50'),(38,'Darwin Travel',64,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(39,'Spa Paragon',65,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(40,'Spa Paragon',66,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:51','2024-05-22 23:56:51'),(41,'Darwin Travel',67,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(42,'GameDay Catering',68,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(43,'Party Plex',69,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(44,'Spa Paragon',70,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:52','2024-05-22 23:56:52'),(45,'Spa Paragon',71,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:53','2024-05-22 23:56:53'),(46,'Darwin Travel',73,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:53','2024-05-22 23:56:53'),(47,'Darwin Travel',74,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:54','2024-05-22 23:56:54'),(48,'Spa Paragon',76,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:54','2024-05-22 23:56:54'),(49,'GameDay Catering',77,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:55','2024-05-22 23:56:55'),(50,'Party Plex',79,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:55','2024-05-22 23:56:55'),(51,'Exploration Kids',81,'Dog Trainer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:56','2024-05-22 23:56:56'),(52,'GameDay Catering',83,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:56','2024-05-22 23:56:56'),(53,'Spa Paragon',85,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:57','2024-05-22 23:56:57'),(54,'Party Plex',86,'Project Manager','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:57','2024-05-22 23:56:57'),(55,'Spa Paragon',87,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(56,'Spa Paragon',88,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(57,'Spa Paragon',90,'Web Designer','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:58','2024-05-22 23:56:58'),(58,'Exploration Kids',92,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:59','2024-05-22 23:56:59'),(59,'Spa Paragon',93,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:56:59','2024-05-22 23:56:59'),(60,'GameDay Catering',97,'Marketing Coordinator','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:57:00','2024-05-22 23:57:00'),(61,'Darwin Travel',100,'President of Sales','2024-05-23','2024-05-23','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-22 23:57:01','2024-05-22 23:57:01');
/*!40000 ALTER TABLE `jb_account_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_skills`
--

DROP TABLE IF EXISTS `jb_account_favorite_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`skill_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_skills`
--

LOCK TABLES `jb_account_favorite_skills` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_tags`
--

DROP TABLE IF EXISTS `jb_account_favorite_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_tags`
--

LOCK TABLES `jb_account_favorite_tags` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_packages`
--

DROP TABLE IF EXISTS `jb_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_packages`
--

LOCK TABLES `jb_account_packages` WRITE;
/*!40000 ALTER TABLE `jb_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_password_resets`
--

DROP TABLE IF EXISTS `jb_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `jb_account_password_resets_email_index` (`email`),
  KEY `jb_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_password_resets`
--

LOCK TABLES `jb_account_password_resets` WRITE;
/*!40000 ALTER TABLE `jb_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_accounts`
--

DROP TABLE IF EXISTS `jb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job-seeker',
  `credits` int unsigned DEFAULT NULL,
  `resume` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint unsigned NOT NULL DEFAULT '0',
  `hide_cv` tinyint(1) NOT NULL DEFAULT '0',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `cover_letter` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_accounts_email_unique` (`email`),
  UNIQUE KEY `jb_accounts_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_accounts`
--

LOCK TABLES `jb_accounts` WRITE;
/*!40000 ALTER TABLE `jb_accounts` DISABLE KEYS */;
INSERT INTO `jb_accounts` VALUES (1,NULL,'Suzanne','Jerde','Software Developer',NULL,'employer@archielite.com','$2y$12$Csn7X1kDo/lZoStAT/Bfae4ROwPwIfdj79w57XO8PKIW2EceqE/bC',186,'2004-08-12','+13123171070','2024-05-23 06:56:32',NULL,'employer',NULL,NULL,'59162 Rempel Plain Suite 338\nMichaelabury, FL 75516-3624','I only wish they WOULD go with the other birds tittered audibly. \'What I was going to give the prizes?\' quite a new pair of gloves and a large cat which was full of smoke from one end of half an.',1,0,247,0,NULL,'2024-05-22 23:56:32','2024-05-22 23:56:32',1,1,NULL,NULL,NULL),(2,NULL,'Fabiola','Dicki','Creative Designer',NULL,'job_seeker@archielite.com','$2y$12$nWOF6ZPkNLOPIbxjE0.OfOZ3dEQ/ilhaCuMIKPD1zKoVlrb5W.NjW',185,'2013-07-18','+13135017890','2024-05-23 06:56:33',NULL,'job-seeker',NULL,'resume/01.pdf','123 Reymundo Cape Apt. 481\nLemketon, DE 75955','Serpent!\' \'But I\'m NOT a serpent!\' said Alice to herself. (Alice had no reason to be listening, so she went down on their slates, when the tide rises and sharks are around, His voice has a timid and.',1,0,2822,1,NULL,'2024-05-22 23:56:33','2024-05-22 23:56:33',0,1,NULL,NULL,NULL),(3,NULL,'Sarah','Harding','Creative Designer',NULL,'sarah_harding@archielite.com','$2y$12$hpuk1016x1kE/8XvK1u5EOBbBpQ0oZ7PYu0NkweEzXQGOt092n5A2',184,'2019-05-16','+17853162353','2024-05-23 06:56:33',NULL,'employer',NULL,NULL,'966 Erling Mountain Apt. 379\nTitusland, CO 59908','CHAPTER VI. Pig and Pepper For a minute or two, which gave the Pigeon the opportunity of showing off a bit afraid of it. Presently the Rabbit say to this: so she went on talking: \'Dear, dear! How.',1,0,921,1,NULL,'2024-05-22 23:56:33','2024-05-22 23:56:33',0,1,NULL,NULL,NULL),(4,NULL,'Steven','Jobs','Creative Designer',NULL,'steven_jobs@archielite.com','$2y$12$AqcEXyR3o43On/IDhQFLVejmDSioLg/xR0muKG.Czor6w1z.qjw0e',185,'2004-02-13','+13648513327','2024-05-23 06:56:33',NULL,'employer',NULL,NULL,'764 Emmerich Neck\nSengerberg, LA 10539-0622','There was a good character, But said I could not even room for YOU, and no room to grow up any more if you\'d like it very much,\' said Alice, and looking at it again: but he now hastily began again.',1,0,1140,0,NULL,'2024-05-22 23:56:33','2024-05-22 23:56:33',1,1,NULL,NULL,NULL),(5,NULL,'William','Kent','Creative Designer',NULL,'william_kent@archielite.com','$2y$12$9WKYVyV5l/TYhfzQeRjgKe9jYA01FWL0ygXnaoFim2HOTCIz06IgS',186,'1982-06-16','+15094577498','2024-05-23 06:56:34',NULL,'employer',NULL,NULL,'33267 Jaylon Walks\nAniyahchester, CO 20142-9843','Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it so quickly that the Gryphon hastily. \'Go on with the Queen,\' and she.',1,0,1622,1,NULL,'2024-05-22 23:56:34','2024-05-22 23:56:34',0,1,NULL,NULL,NULL),(6,NULL,'Camren','Considine','Poor Alice! It was.',NULL,'nkovacek@hotmail.com','$2y$12$wtQ7aOM86BIAj/WOa9FVkuwLO6UQehl3M9KAPu6UnyX9C7fXHM6m2',186,'1974-05-15','+16294656246','2024-05-23 06:56:34',NULL,'job-seeker',NULL,'resume/01.pdf','6133 Darron Springs\nKulasport, IL 89456-1128','The Dormouse had closed its eyes by this time?\' she said to the voice of the officers of the room. The cook threw a frying-pan after her as she could. The next thing was snorting like a sky-rocket!\'.',1,0,4864,0,NULL,'2024-05-22 23:56:34','2024-05-22 23:56:34',0,1,NULL,NULL,NULL),(7,NULL,'Noble','Zulauf','RABBIT\' engraved.',NULL,'keaton.bartoletti@hotmail.com','$2y$12$yGTmhZ4K7u.Zc8HFaw2LlOdHENI5rYhIN85E47G3pTgC11QMU39E6',184,'1977-11-03','+14324572332','2024-05-23 06:56:34',NULL,'job-seeker',NULL,'resume/01.pdf','495 Wyatt Isle\nSouth Mario, SD 59949-0665','I think that there was nothing on it were white, but there were three gardeners instantly jumped up, and began whistling. \'Oh, there\'s no room at all anxious to have no answers.\' \'If you knew Time.',1,0,4018,1,NULL,'2024-05-22 23:56:34','2024-05-22 23:56:34',1,1,NULL,NULL,NULL),(8,NULL,'Osbaldo','O\'Kon','Cheshire Cat: now.',NULL,'shanel70@yahoo.com','$2y$12$iPNDPtZlibNc3jIQHEcFpuT7oGwrMLIzy4n9SOwm.CHlVDH/NmB12',186,'2016-04-25','+17018362180','2024-05-23 06:56:34',NULL,'employer',NULL,NULL,'71387 Hilpert Path Apt. 590\nHagenesbury, KY 84821-4613','Alice. One of the suppressed guinea-pigs, filled the air, mixed up with the day and night! You see the Hatter were having tea at it: a Dormouse was sitting on a three-legged stool in the long hall.',1,0,1298,0,NULL,'2024-05-22 23:56:34','2024-05-22 23:56:34',1,1,NULL,NULL,NULL),(9,NULL,'Ludie','Schneider','Dormouse crossed.',NULL,'velda94@corwin.org','$2y$12$wpJXRa1TUkPrm7nPILRA.uCZJWTW03OU1UXF0r07uXANnROL..6y6',184,'2023-09-17','+14633615940','2024-05-23 06:56:35',NULL,'job-seeker',NULL,'resume/01.pdf','592 Simonis Ford Suite 643\nEast Omahaven, MD 08978','Alice. \'Come, let\'s try Geography. London is the reason they\'re called lessons,\' the Gryphon said, in a large kitchen, which was lit up by wild beasts and other unpleasant things, all because they.',1,0,4926,1,NULL,'2024-05-22 23:56:35','2024-05-22 23:56:35',0,1,NULL,NULL,NULL),(10,NULL,'Lavon','Altenwerth','Why, I wouldn\'t be.',NULL,'ohara.lisandro@gmail.com','$2y$12$K7mmuYugSYZ2fl5ufIOV7uWzNM3Rv71WaZWBWpHXNlsPbyr4HO34m',186,'1996-11-21','+17266459776','2024-05-23 06:56:35',NULL,'job-seeker',NULL,'resume/01.pdf','7378 Baumbach Views Suite 375\nWest Marcus, SD 41995-6715','This question the Dodo said, \'EVERYBODY has won, and all her coaxing. Hardly knowing what she was out of the house before she gave a sudden leap out of the song, she kept on puzzling about it just.',1,0,850,1,NULL,'2024-05-22 23:56:35','2024-05-22 23:56:35',1,1,NULL,NULL,NULL),(11,NULL,'Beryl','Vandervort','Please, Ma\'am, is.',NULL,'wiza.alfred@boyle.info','$2y$12$ZDXcoE/131bslVKdnqoG6uyt6jWfzqPgD0Gj7NKJpxSLV7pib6O.6',186,'1971-11-05','+15805047955','2024-05-23 06:56:35',NULL,'employer',NULL,NULL,'835 Crystal Walk\nPaytonport, MI 84578','Dormouse turned out, and, by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR.',1,0,4156,1,NULL,'2024-05-22 23:56:35','2024-05-22 23:56:35',0,1,NULL,NULL,NULL),(12,NULL,'Melyna','Leuschke','But there seemed.',NULL,'nikolas.bayer@casper.com','$2y$12$btqkfR367I8kWv58yiseruGtq5qIsOhrw0u.XxvfEAq2VKh.85Nyq',185,'1977-03-07','+16516186049','2024-05-23 06:56:36',NULL,'job-seeker',NULL,'resume/01.pdf','80242 Lesly Roads\nMikelview, OK 28095-9001','Dormouse, who seemed too much of a globe of goldfish she had accidentally upset the week before. \'Oh, I know!\' exclaimed Alice, who felt ready to ask the question?\' said the Gryphon. \'They can\'t.',1,0,2812,0,NULL,'2024-05-22 23:56:36','2024-05-22 23:56:36',0,1,NULL,NULL,NULL),(13,NULL,'Clair','Bernhard','Queen. \'I haven\'t.',NULL,'kreiger.rosella@reichel.org','$2y$12$IbiOwAa7en1jFUnh5G.Y8eA0VYgfQdGYjzPKjyuB9D/3v.FZHLmvK',184,'1991-07-12','+16102181166','2024-05-23 06:56:36',NULL,'job-seeker',NULL,'resume/01.pdf','99853 Selina Plaza Suite 500\nLeuschkeberg, VT 31219-9022','Dormouse, who seemed to think about stopping herself before she found herself safe in a melancholy way, being quite unable to move. She soon got it out into the sky all the things I used to know.',1,0,3611,1,NULL,'2024-05-22 23:56:36','2024-05-22 23:56:36',1,1,NULL,NULL,NULL),(14,NULL,'Zackary','Reynolds','So they couldn\'t.',NULL,'euna85@moen.com','$2y$12$gmVzGfQqGTARI4YwK4x0XO4Bu0RuCcnaZ9WsWuiF9Tl141suC.py2',184,'1972-11-01','+16418591840','2024-05-23 06:56:36',NULL,'employer',NULL,NULL,'237 Kali Light\nWest Deborah, CA 64916','Queen said to herself how this same little sister of hers that you had been looking at them with one eye, How the Owl and the pair of gloves and a Canary called out as loud as she added, to herself.',1,0,4367,0,NULL,'2024-05-22 23:56:36','2024-05-22 23:56:36',1,1,NULL,NULL,NULL),(15,NULL,'Rhiannon','Collins','Lizard as she had.',NULL,'sfriesen@gmail.com','$2y$12$ZQk/3Ulg5ViLtGIRHGXcheyOlhsB6OysLlbtpQsf0YFXPRksVKsxu',184,'1993-11-01','+15166906588','2024-05-23 06:56:36',NULL,'employer',NULL,NULL,'2485 Mozell Passage\nSouth Minamouth, SD 12150-3598','I\'d been the whiting,\' said Alice, (she had grown up,\' she said aloud. \'I shall sit here,\' the Footman went on growing, and she had put the Lizard in head downwards, and the turtles all advance!.',1,0,1739,1,NULL,'2024-05-22 23:56:36','2024-05-22 23:56:36',1,1,NULL,NULL,NULL),(16,NULL,'Wendy','Abernathy','Alice. \'Oh, don\'t.',NULL,'koelpin.easton@gmail.com','$2y$12$boZet3.Si/j.l33E/KsAq.xKGPprbqTs.efYwkoVwjFoo.Zu28mFK',185,'1980-11-03','+17439358344','2024-05-23 06:56:37',NULL,'job-seeker',NULL,'resume/01.pdf','554 Erik Plaza\nFadelfort, WI 68653-1858','Alice started to her to carry it further. So she sat on, with closed eyes, and feebly stretching out one paw, trying to put down her flamingo, and began staring at the jury-box, or they would call.',1,0,849,1,NULL,'2024-05-22 23:56:37','2024-05-22 23:56:37',1,1,NULL,NULL,NULL),(17,NULL,'Rhoda','Eichmann','Yet you finished.',NULL,'lgrant@kerluke.com','$2y$12$gOr4R.VhN7/wqozZ7USX/u.pZjk5ufZapb/v/.C48Lg54Xb29nJcO',185,'1984-06-01','+12565360475','2024-05-23 06:56:37',NULL,'job-seeker',NULL,'resume/01.pdf','6056 Rutherford Cape Apt. 081\nBergeside, AL 21566-5549','Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'or perhaps they won\'t walk the way the people that walk with their hands and feet at the Hatter, \'you wouldn\'t talk about her and to hear.',1,0,1995,1,NULL,'2024-05-22 23:56:37','2024-05-22 23:56:37',1,1,NULL,NULL,NULL),(18,NULL,'Arlo','Will','Lobster Quadrille.',NULL,'candace71@gmail.com','$2y$12$PCjNIbXWU3uZenfhZbQnPOAOvks0y9yfZ4fehsbXLxiGJhIDWJXQO',184,'1988-11-03','+12073312087','2024-05-23 06:56:37',NULL,'job-seeker',NULL,'resume/01.pdf','699 Santina Ridges\nPort Watsonchester, NV 68444','Queen will hear you! You see, she came in sight of the jurymen. \'No, they\'re not,\' said Alice to herself, \'in my going out altogether, like a thunderstorm. \'A fine day, your Majesty!\' the Duchess.',1,0,1176,0,NULL,'2024-05-22 23:56:37','2024-05-22 23:56:37',0,1,NULL,NULL,NULL),(19,NULL,'Demetrius','Bradtke','Alice very meekly.',NULL,'guido.keeling@watsica.com','$2y$12$vqNIuVYBGGvfvyR65gO7JuPOfEAWqPK3WJikgdVsm0NJuOpV8i4iK',185,'2002-03-18','+15758353600','2024-05-23 06:56:38',NULL,'employer',NULL,NULL,'36584 Sylvia Loaf\nSouth Rupert, WY 87504-5698','Alice. \'I\'m glad they don\'t seem to encourage the witness at all: he kept shifting from one of the sort!\' said Alice. \'And be quick about it,\' added the Queen. \'I haven\'t the least idea what you\'re.',1,0,2827,1,NULL,'2024-05-22 23:56:38','2024-05-22 23:56:38',0,1,NULL,NULL,NULL),(20,NULL,'Carolyne','Bernier','RED rose-tree, and.',NULL,'aherman@hotmail.com','$2y$12$9uGBM/Laaa8X5klZmAyFN.QHA2skG0Dp.lgHxaaU0UeSQqqNYYIhi',185,'2000-04-04','+19476924394','2024-05-23 06:56:38',NULL,'employer',NULL,NULL,'953 Donnie Springs Suite 760\nSouth Olliefurt, MN 94343-4507','The Mouse gave a look askance-- Said he thanked the whiting kindly, but he would deny it too: but the three were all turning into little cakes as they would die. \'The trial cannot proceed,\' said the.',1,0,2987,1,NULL,'2024-05-22 23:56:38','2024-05-22 23:56:38',1,1,NULL,NULL,NULL),(21,NULL,'Gail','Murray','The Queen had only.',NULL,'ischowalter@spencer.org','$2y$12$d2PnFYCUEvKMg0zTkU.Hjuxw4NYf/hGOFMdu6aptUOM56kvem2gM6',184,'2010-08-18','+13164405972','2024-05-23 06:56:38',NULL,'job-seeker',NULL,'resume/01.pdf','303 Michele Isle Suite 516\nSouth Jonathonburgh, LA 22591','So she began: \'O Mouse, do you know about this business?\' the King in a hurry: a large one, but it did not feel encouraged to ask them what the next thing was to find that she had read several nice.',1,0,2408,0,NULL,'2024-05-22 23:56:38','2024-05-22 23:56:38',1,1,NULL,NULL,NULL),(22,NULL,'Jamal','Hayes','King sharply. \'Do.',NULL,'hannah00@boyle.biz','$2y$12$HxIfHgTKrIvafn7JxDtSu.bXRTZ2Ft9.lSRnzp4WFaR5JZyHI9WFu',185,'1984-11-04','+17046009584','2024-05-23 06:56:39',NULL,'employer',NULL,NULL,'982 Eulah Walk Apt. 589\nLake Lauryn, MS 47693-7833','Gryphon. \'We can do without lobsters, you know. Come on!\' So they sat down, and the little golden key, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard it.',1,0,4947,0,NULL,'2024-05-22 23:56:39','2024-05-22 23:56:39',1,1,NULL,NULL,NULL),(23,NULL,'Jayde','Ullrich','Caterpillar. \'Is.',NULL,'ppadberg@yahoo.com','$2y$12$fdvMJx7.RhLJO66crMmqN.8Uf.LlXENYQdhY9J5pnATaO/w5QNDoS',185,'2010-09-05','+15513899450','2024-05-23 06:56:39',NULL,'job-seeker',NULL,'resume/01.pdf','414 Kihn Walk Apt. 554\nCorkerychester, WI 22890-6257','She hastily put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\'.',1,0,3440,1,NULL,'2024-05-22 23:56:39','2024-05-22 23:56:39',0,1,NULL,NULL,NULL),(24,NULL,'Elisa','Stoltenberg','I to do THAT in a.',NULL,'deckow.arden@goodwin.com','$2y$12$EFKbyECRuwuFttrhY0V7auqWpII40B2MpwaS9Fk8DmeZTzsurylpW',185,'1973-05-01','+15125801074','2024-05-23 06:56:39',NULL,'employer',NULL,NULL,'9171 Towne Knoll Apt. 632\nAmeliafurt, FL 59301-0369','Let me see: four times five is twelve, and four times seven is--oh dear! I shall have to ask help of any use, now,\' thought poor Alice, that she had never heard before, \'Sure then I\'m here! Digging.',1,0,3993,1,NULL,'2024-05-22 23:56:39','2024-05-22 23:56:39',0,1,NULL,NULL,NULL),(25,NULL,'Raoul','Weissnat','I can\'t be civil.',NULL,'fdooley@hotmail.com','$2y$12$rR9vmvwZJefluwapcipwnOJ9Ot0m6RMpP4Izgvj5m8u11W76oCs/6',186,'2000-12-21','+19545549919','2024-05-23 06:56:39',NULL,'job-seeker',NULL,'resume/01.pdf','829 Gene View\nAltenwerthshire, NE 34666','Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to its children, \'Come away, my dears! It\'s high time to see what was coming. It was the fan and two.',1,0,2894,1,NULL,'2024-05-22 23:56:39','2024-05-22 23:56:39',1,1,NULL,NULL,NULL),(26,NULL,'Emmalee','Bednar','Edgar Atheling to.',NULL,'ksteuber@gmail.com','$2y$12$YtZoJoFMarQ/MHKFqNR4KushbkteVoPHyGBlvVcofptVpx4dFAFyi',184,'1978-09-04','+15348547148','2024-05-23 06:56:40',NULL,'job-seeker',NULL,'resume/01.pdf','9063 Stanton Burgs\nPort Joanie, MA 47020','It was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Panther were sharing a pie--\' [later editions continued as follows When the pie was all dark overhead.',1,0,3468,1,NULL,'2024-05-22 23:56:40','2024-05-22 23:56:40',0,1,NULL,NULL,NULL),(27,NULL,'Katelynn','White','Alice, very much.',NULL,'velma.lubowitz@boehm.net','$2y$12$rruoW1TcjzFMsxPmlm/WfegypDh291w5/xp1mJYDDxv9awLWgWQCi',185,'1985-12-10','+17252228594','2024-05-23 06:56:40',NULL,'job-seeker',NULL,'resume/01.pdf','865 Connor Bypass\nNorth Chancemouth, AL 62652','I think?\' \'I had NOT!\' cried the Gryphon. Alice did not notice this last remark, \'it\'s a vegetable. It doesn\'t look like one, but the Mouse to tell me the list of singers. \'You may not have lived.',1,0,3479,1,NULL,'2024-05-22 23:56:40','2024-05-22 23:56:40',1,1,NULL,NULL,NULL),(28,NULL,'Furman','Morar','Mouse, who seemed.',NULL,'stehr.lillian@hotmail.com','$2y$12$AgY/DptH5xMBVDz6T4lmr.Hwt5awylx0W8Nlu0uaNFcTXFY6cIso2',184,'2008-03-27','+12835324042','2024-05-23 06:56:40',NULL,'job-seeker',NULL,'resume/01.pdf','967 Lura Tunnel\nAaronhaven, KY 62482-3874','King. \'When did you do lessons?\' said Alice, \'and why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do hope it\'ll make me smaller, I can remember feeling a.',1,0,542,1,NULL,'2024-05-22 23:56:40','2024-05-22 23:56:40',1,1,NULL,NULL,NULL),(29,NULL,'Annabell','Gorczany','Alice sadly. \'Hand.',NULL,'ahudson@simonis.com','$2y$12$GorpbLS2sRJzLHYI0B/a4.zeZuI.XlkWKQg/mC4D9GfBs5ZwiDnRO',186,'2014-12-25','+17089408162','2024-05-23 06:56:41',NULL,'employer',NULL,NULL,'7548 Katelin Square\nNorth Kennedychester, ND 35829','Alice. The poor little juror (it was Bill, the Lizard) could not swim. He sent them word I had to stoop to save her neck would bend about easily in any direction, like a snout than a pig, and she.',1,0,4670,0,NULL,'2024-05-22 23:56:41','2024-05-22 23:56:41',0,1,NULL,NULL,NULL),(30,NULL,'Jeanie','Schowalter','I must, I must,\'.',NULL,'mossie.lueilwitz@hotmail.com','$2y$12$ENVv2mW2klUWrqKBHP0hV.kQdBoXQgFmhJyu/emCD87MaOAlfmKOu',186,'2018-11-30','+13809359504','2024-05-23 06:56:41',NULL,'job-seeker',NULL,'resume/01.pdf','364 Amira Ranch\nEast Dora, MD 38414','Mock Turtle. \'Very much indeed,\' said Alice. \'It must be kind to them,\' thought Alice, \'and those twelve creatures,\' (she was obliged to write with one finger, as he spoke. \'A cat may look at the.',1,0,3451,0,NULL,'2024-05-22 23:56:41','2024-05-22 23:56:41',1,1,NULL,NULL,NULL),(31,NULL,'Reina','Gutmann','I\'m sure I don\'t.',NULL,'carolyn55@gmail.com','$2y$12$Z/DGilIOvl.EyUi.tHLtWeLl/09qmEyeD0r4G3pVg.Mb9WVFjPL1O',186,'1987-02-19','+17015418418','2024-05-23 06:56:41',NULL,'employer',NULL,NULL,'15769 Ignacio Row Apt. 121\nRaulshire, IN 00264-3977','So you see, Alice had been to a farmer, you know, this sort in her lessons in the morning, just time to wash the things being alive; for instance, there\'s the arch I\'ve got to grow larger again, and.',1,0,2780,1,NULL,'2024-05-22 23:56:41','2024-05-22 23:56:41',1,1,NULL,NULL,NULL),(32,NULL,'Ashtyn','Stehr','Alice had learnt.',NULL,'lacey47@hotmail.com','$2y$12$KlQdvi2HnmO0842247QDoeH6rz.7He5ZVvB3HjpChImkphS2.vnLW',185,'2010-10-29','+14808857548','2024-05-23 06:56:41',NULL,'job-seeker',NULL,'resume/01.pdf','736 Leuschke Underpass Apt. 571\nLake Cassandra, NE 11338','White Rabbit with pink eyes ran close by her. There was a paper label, with the tea,\' the March Hare. \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh, my poor little.',1,0,773,1,NULL,'2024-05-22 23:56:41','2024-05-22 23:56:41',1,1,NULL,NULL,NULL),(33,NULL,'Chet','Spencer','King replied. Here.',NULL,'dixie.rowe@oberbrunner.com','$2y$12$vZI7gzqrOVRPedHg0xKKbOJUH8PPuuLNfSre.H.v0l4Rdw0HaNEX2',184,'1997-07-30','+12342909059','2024-05-23 06:56:42',NULL,'employer',NULL,NULL,'62461 Alfonzo Estate Apt. 208\nTorphymouth, MT 31366-7367','Queen. \'Their heads are gone, if it makes rather a complaining tone, \'and they all looked puzzled.) \'He must have been changed several times since then.\' \'What do you call it purring, not growling,\'.',1,0,4067,0,NULL,'2024-05-22 23:56:42','2024-05-22 23:56:42',1,1,NULL,NULL,NULL),(34,NULL,'Rupert','Rosenbaum','Alice had not the.',NULL,'qlangosh@barton.org','$2y$12$Bwe8Gmr3kqm1dptBeEKWAe5p4UcUqukJXxplYbp3w0wj2RnCHfFKu',185,'2007-06-08','+18142771879','2024-05-23 06:56:42',NULL,'job-seeker',NULL,'resume/01.pdf','52536 Valentina Ramp Suite 458\nKarinaview, WV 37756-9444','WAS a narrow escape!\' said Alice, quite forgetting her promise. \'Treacle,\' said the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows When the procession came.',1,0,3455,0,NULL,'2024-05-22 23:56:42','2024-05-22 23:56:42',1,1,NULL,NULL,NULL),(35,NULL,'Lafayette','Lynch','Waiting in a long.',NULL,'kathryn.schultz@schuppe.com','$2y$12$yW.vx49UuekCZE0xgIWkSOXKd6XTrxsHXNTJGEcoryPWDK7Xum/ru',185,'1995-06-16','+14144476963','2024-05-23 06:56:42',NULL,'job-seeker',NULL,'resume/01.pdf','861 Schneider Rue Suite 581\nEast Alta, OH 86214','Time as well look and see what the name again!\' \'I won\'t have any pepper in my own tears! That WILL be a lesson to you never to lose YOUR temper!\' \'Hold your tongue!\' added the March Hare. \'Exactly.',1,0,2925,1,NULL,'2024-05-22 23:56:42','2024-05-22 23:56:42',0,1,NULL,NULL,NULL),(36,NULL,'Meredith','Skiles','Dodo, pointing to.',NULL,'estanton@hotmail.com','$2y$12$No2Ak/RgqR11gxzIbTWpTupDLTFIqxB.j2Jjj/UzUWwhkO0PkBlEq',185,'1985-01-13','+19517098566','2024-05-23 06:56:43',NULL,'job-seeker',NULL,'resume/01.pdf','1916 Considine Turnpike Suite 697\nNew Eltaview, DE 83930-5526','King very decidedly, and the others looked round also, and all dripping wet, cross, and uncomfortable. The first question of course had to double themselves up and ran till she had never been in a.',1,0,4610,1,NULL,'2024-05-22 23:56:43','2024-05-22 23:56:43',1,1,NULL,NULL,NULL),(37,NULL,'Travon','McLaughlin','Alice, jumping up.',NULL,'alta.west@schuppe.net','$2y$12$Qp5s81vTNx2.DDNeqa2bxODNGKx4BrC9gRa8OLaDhRsj/BjY1BV3m',185,'1995-01-21','+15714238174','2024-05-23 06:56:43',NULL,'employer',NULL,NULL,'4944 Erick Turnpike\nPort Dejuan, DE 35874-8641','I look like one, but it makes rather a handsome pig, I think.\' And she kept fanning herself all the jelly-fish out of sight; and an Eaglet, and several other curious creatures. Alice led the way.',1,0,142,0,NULL,'2024-05-22 23:56:43','2024-05-22 23:56:43',0,1,NULL,NULL,NULL),(38,NULL,'Frankie','Reinger','Lobster; I heard.',NULL,'nbuckridge@parisian.net','$2y$12$B5AP39IrCNBbFLA1QxXBuOHczJE16D/kA2UX7OmH97aIm.YuYRK2K',184,'1972-11-10','+19075414132','2024-05-23 06:56:43',NULL,'job-seeker',NULL,'resume/01.pdf','7855 Allan Plains\nNorth Sadyeberg, NH 08449-1939','I believe.\' \'Boots and shoes under the circumstances. There was a different person then.\' \'Explain all that,\' said the King was the same size for going through the doorway; \'and even if my head.',1,0,3503,0,NULL,'2024-05-22 23:56:43','2024-05-22 23:56:43',0,1,NULL,NULL,NULL),(39,NULL,'Lavina','Effertz','Alice the moment.',NULL,'wreilly@gmail.com','$2y$12$n7TsK9s2PBvebDkItXOXbO8MuWy98ECv.ODYk/hQt.DLKIJ2Hxruq',186,'1985-04-21','+14439357146','2024-05-23 06:56:43',NULL,'job-seeker',NULL,'resume/01.pdf','544 Gustave Islands\nKuphalland, ND 53195','I learn music.\' \'Ah! that accounts for it,\' said the Mock Turtle. \'She can\'t explain it,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and.',1,0,1346,0,NULL,'2024-05-22 23:56:43','2024-05-22 23:56:43',1,1,NULL,NULL,NULL),(40,NULL,'Wilhelm','Heidenreich','March Hare. \'Then.',NULL,'xkoepp@hotmail.com','$2y$12$aSu8ONXNmnobMWX0/mHh2u.g4TDix6c3KJo4a77vpGFNPm3Xhij22',185,'1987-11-11','+15807492798','2024-05-23 06:56:44',NULL,'employer',NULL,NULL,'877 Rice Orchard Apt. 757\nEast Jerrod, CA 67449','Duck. \'Found IT,\' the Mouse in the common way. So they had to stop and untwist it. After a time there could be beheaded, and that he had a vague sort of a sea of green leaves that lay far below her.',1,0,636,0,NULL,'2024-05-22 23:56:44','2024-05-22 23:56:44',0,1,NULL,NULL,NULL),(41,NULL,'Gail','Boyer','And concluded the.',NULL,'rosina63@spinka.com','$2y$12$n6Ns7pD9V5dfzpZOz84KZukUe5Bs8ArlAmb7H3pifXLnCrGMY.J8q',186,'1987-05-03','+19159617601','2024-05-23 06:56:44',NULL,'job-seeker',NULL,'resume/01.pdf','134 Kirlin Key\nLockmanhaven, NM 49659-5117','This seemed to have the experiment tried. \'Very true,\' said the King, and the others took the watch and looked at the Lizard as she went on, \'I must go and take it away!\' There was a bright brass.',1,0,3816,0,NULL,'2024-05-22 23:56:44','2024-05-22 23:56:44',1,1,NULL,NULL,NULL),(42,NULL,'Linda','Hirthe','Duchess: \'what a.',NULL,'amya.corwin@nader.com','$2y$12$LHN9.mp65ZL4FKoSGkAEx.Skwi.5XQhaPSsCiYDeQJv6iRUfeR93e',184,'2004-04-29','+18549065885','2024-05-23 06:56:44',NULL,'employer',NULL,NULL,'930 Mathias Viaduct Suite 171\nLowefort, NJ 18172','Queen of Hearts, she made out what she did, she picked up a little girl she\'ll think me for a great thistle, to keep back the wandering hair that WOULD always get into the garden at once; but, alas.',1,0,1769,0,NULL,'2024-05-22 23:56:44','2024-05-22 23:56:44',0,1,NULL,NULL,NULL),(43,NULL,'Edmund','Ullrich','Hatter, who turned.',NULL,'hharber@stamm.com','$2y$12$Ad2BaTGAdXEgaNU/n2PXK.sM2sGN01HOmuHSCl0a.tTiBtgGM5YJu',186,'2011-02-19','+17275524447','2024-05-23 06:56:45',NULL,'job-seeker',NULL,'resume/01.pdf','99991 Turner Stravenue Apt. 344\nNew Eliasview, NY 95680-2317','Has lasted the rest of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue!\' added the March Hare. \'Then it wasn\'t.',1,0,543,1,NULL,'2024-05-22 23:56:45','2024-05-22 23:56:45',0,1,NULL,NULL,NULL),(44,NULL,'Preston','Gottlieb','There was a sound.',NULL,'rempel.gabriel@hotmail.com','$2y$12$26AP5ThFT0DzrTo6qylzAuQMCw9lBlEqwIFlMqA/QhaBJbo3v5sUC',186,'1978-03-19','+16366233242','2024-05-23 06:56:45',NULL,'employer',NULL,NULL,'484 Wilderman Ports Apt. 180\nSouth Reagan, IA 92007-1533','Alice. \'I mean what I say--that\'s the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, \'or.',1,0,700,0,NULL,'2024-05-22 23:56:45','2024-05-22 23:56:45',1,1,NULL,NULL,NULL),(45,NULL,'Tiffany','Kilback','Hatter: \'but you.',NULL,'alfreda61@yahoo.com','$2y$12$rrEe2Wc/E9O624baY95YnueTCtNKevH/O4Ka8hxjDX1A2D8FoEsF.',184,'1985-08-28','+12623621045','2024-05-23 06:56:45',NULL,'job-seeker',NULL,'resume/01.pdf','50677 Fadel Stravenue Apt. 940\nNew Eunabury, AR 12428-3804','King said, for about the same side of the Gryphon, half to Alice. \'Nothing,\' said Alice. \'That\'s very important,\' the King triumphantly, pointing to the seaside once in the sun. (IF you don\'t know.',1,0,412,1,NULL,'2024-05-22 23:56:45','2024-05-22 23:56:45',0,1,NULL,NULL,NULL),(46,NULL,'Kristian','Beer','Soup of the words.',NULL,'laurence.bayer@kuvalis.com','$2y$12$47N39JXo4XEgHn6swVAsK.usIOthn6QlsFV2bA8cwZlCpc688w5.q',186,'2015-11-09','+19524956389','2024-05-23 06:56:45',NULL,'employer',NULL,NULL,'73544 Christ Trafficway Suite 552\nEast Princess, OH 05794-3217','Alice thought over all the same, shedding gallons of tears, \'I do wish I hadn\'t to bring tears into her eyes--and still as she could. \'The Dormouse is asleep again,\' said the Queen. \'Their heads are.',1,0,4025,0,NULL,'2024-05-22 23:56:45','2024-05-22 23:56:45',0,1,NULL,NULL,NULL),(47,NULL,'Delilah','King','And I declare it\'s.',NULL,'hschmitt@blanda.info','$2y$12$Fz.505grVbfXu5fg7guGJO0jza9ke2pWv2TomJWDE29.qxagiMIsm',185,'2000-10-11','+13303064859','2024-05-23 06:56:46',NULL,'job-seeker',NULL,'resume/01.pdf','12061 Reichert Alley\nCristianchester, OR 12037','Cat said, waving its right ear and left off when they met in the act of crawling away: besides all this, there was no use their putting their heads off?\' shouted the Gryphon, before Alice could.',1,0,1428,1,NULL,'2024-05-22 23:56:46','2024-05-22 23:56:46',0,1,NULL,NULL,NULL),(48,NULL,'Zachary','O\'Connell','Take your choice!\'.',NULL,'wtowne@koelpin.com','$2y$12$w2PmlCVgqpKBkYmH2N/ia.QdWok4SKSxtRUsCwXTyrOEsuzchlL2G',184,'2011-11-29','+15165562874','2024-05-23 06:56:46',NULL,'job-seeker',NULL,'resume/01.pdf','303 Reilly Alley\nColemanland, MO 44529','Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not give all else for two reasons. First, because I\'m on the top of it. She felt that this could not tell whether they.',1,0,496,0,NULL,'2024-05-22 23:56:46','2024-05-22 23:56:46',0,1,NULL,NULL,NULL),(49,NULL,'Reilly','Crona','I!\' said the Cat.',NULL,'orville.fisher@gmail.com','$2y$12$t1khNpRFLt2tLd7lfIgcROuXKWnH1OIhMc6/.rYWqShdN6wDFYnhO',184,'1998-02-16','+15866855064','2024-05-23 06:56:46',NULL,'job-seeker',NULL,'resume/01.pdf','29644 Pasquale Vista Suite 799\nNew Mariettachester, WV 11984','Cheshire cats always grinned; in fact, a sort of a muchness?\' \'Really, now you ask me,\' said Alice, \'because I\'m not myself, you see.\' \'I don\'t believe it,\' said Alice. \'What IS the use of this was.',1,0,2865,1,NULL,'2024-05-22 23:56:46','2024-05-22 23:56:46',1,1,NULL,NULL,NULL),(50,NULL,'Joanne','Jakubowski','When they take us.',NULL,'brooklyn.abshire@yahoo.com','$2y$12$l2Wr8nWcOECjkBHAsJfeYOXF6EEtq3RXQEqGUvVK3HBxoriShGsMW',184,'1981-01-28','+12725494856','2024-05-23 06:56:47',NULL,'employer',NULL,NULL,'544 Monahan Overpass Apt. 212\nLaruestad, MA 20349-2420','Let me see: that would be worth the trouble of getting up and beg for its dinner, and all of them can explain it,\' said the Gryphon, before Alice could hardly hear the Rabbit say to itself, half to.',1,0,2465,0,NULL,'2024-05-22 23:56:47','2024-05-22 23:56:47',1,1,NULL,NULL,NULL),(51,NULL,'Fay','Cormier','Alice went on, \'if.',NULL,'kaya.bartell@hotmail.com','$2y$12$BjJcBMOwAIydubkl08mOhuinIEjdPMWAdNLvb3AIHdvU208wg56FK',185,'1999-03-28','+15404611653','2024-05-23 06:56:47',NULL,'job-seeker',NULL,'resume/01.pdf','138 Mills Lodge Apt. 388\nPort Tysonshire, KS 74105','It did so indeed, and much sooner than she had made her next remark. \'Then the words did not appear, and after a fashion, and this was his first remark, \'It was the White Rabbit, jumping up in great.',1,0,689,1,NULL,'2024-05-22 23:56:47','2024-05-22 23:56:47',0,1,NULL,NULL,NULL),(52,NULL,'Madisyn','Murphy','I know all sorts.',NULL,'ernie04@treutel.com','$2y$12$/W8Q/m4YeUkaBwT7aCKtqeOe01aMo8TAQeUM6MesK41X6zDXBDKM6',185,'2012-12-09','+15862630991','2024-05-23 06:56:47',NULL,'job-seeker',NULL,'resume/01.pdf','4655 Howell Rapids\nClaudestad, SD 40875-8387','Duchess, digging her sharp little chin into Alice\'s head. \'Is that all?\' said Alice, and she had accidentally upset the milk-jug into his plate. Alice did not much surprised at her as hard as she.',1,0,3378,0,NULL,'2024-05-22 23:56:47','2024-05-22 23:56:47',0,1,NULL,NULL,NULL),(53,NULL,'Cicero','Gaylord','This speech caused.',NULL,'huels.nat@hotmail.com','$2y$12$EeiwUljws5M1lTqumMF/GuwEr6VgP9L/OZp6te0R9W2ZAbweInFtC',186,'1993-11-06','+17604721178','2024-05-23 06:56:48',NULL,'employer',NULL,NULL,'58994 Mikel Tunnel Apt. 607\nNew Tavares, DE 36009-6344','Queen. An invitation for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took no notice of her childhood: and how.',1,0,4751,1,NULL,'2024-05-22 23:56:48','2024-05-22 23:56:48',1,1,NULL,NULL,NULL),(54,NULL,'Rodrick','Jacobs','Cat, \'if you don\'t.',NULL,'kenton.graham@bayer.com','$2y$12$OQxNGoTYtOllapXY5WeVOOoVmLv7jPe7XS6yZqif8QXDgmWmgjS1.',184,'1970-10-13','+15202165421','2024-05-23 06:56:48',NULL,'employer',NULL,NULL,'28643 Kristian Ridges\nSouth Jodie, OH 02584','There was certainly too much frightened to say than his first remark, \'It was the matter with it. There was nothing on it in her life before, and she hastily dried her eyes immediately met those of.',1,0,4801,1,NULL,'2024-05-22 23:56:48','2024-05-22 23:56:48',0,1,NULL,NULL,NULL),(55,NULL,'Nellie','Champlin','Footman remarked.',NULL,'astehr@heller.com','$2y$12$hvDV0/uG1TiM/Foa44aEvuUaWl9BgcgN5/NIOOatJVOzvf8WHB/8G',184,'2016-11-06','+12143194447','2024-05-23 06:56:48',NULL,'job-seeker',NULL,'resume/01.pdf','785 Strosin Light Suite 306\nLake Archberg, MI 11846','Caterpillar. \'Well, perhaps you were or might have been changed in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she saw them, they were trying to.',1,0,1783,1,NULL,'2024-05-22 23:56:48','2024-05-22 23:56:48',1,1,NULL,NULL,NULL),(56,NULL,'Valentine','Howell','Don\'t let me hear.',NULL,'natalia.heller@gmail.com','$2y$12$OI3FwtPcH3ee5h8T3Nyudu4rR/JkAj0U3cmceCEuhv9ldjkB962Y.',186,'1988-12-24','+14109039769','2024-05-23 06:56:48',NULL,'employer',NULL,NULL,'50532 Huels Shoal Suite 565\nEast Tommiebury, NC 61045-6320','Jack-in-the-box, and up the chimney, has he?\' said Alice to herself, \'whenever I eat one of these cakes,\' she thought, \'till its ears have come, or at least one of its right ear and left foot, so as.',1,0,4934,1,NULL,'2024-05-22 23:56:48','2024-05-22 23:56:48',0,1,NULL,NULL,NULL),(57,NULL,'Jamison','Barton','Queen. \'It proves.',NULL,'hope.terry@gmail.com','$2y$12$JtEchesZEhWVsHoBOHgLyORYqlEOu3ewJfrllbxYz.g16Re3vZSnO',186,'1987-01-18','+19863986752','2024-05-23 06:56:49',NULL,'job-seeker',NULL,'resume/01.pdf','80633 Huel Estates Apt. 616\nNew Iliana, ME 11743-6892','Mock Turtle. \'Hold your tongue!\' said the King. \'Nothing whatever,\' said Alice. \'That\'s very curious.\' \'It\'s all her knowledge of history, Alice had been would have done that, you know,\' said Alice.',1,0,581,0,NULL,'2024-05-22 23:56:49','2024-05-22 23:56:49',1,1,NULL,NULL,NULL),(58,NULL,'Jonathan','Koch','Where CAN I have.',NULL,'royal.mosciski@stroman.org','$2y$12$ScMBeMoAgt1HB7FH/ydCs.qpsMY1gHupavPpiscH3Yu8kDYqV5LDm',185,'1999-03-10','+15417399533','2024-05-23 06:56:49',NULL,'employer',NULL,NULL,'28267 Megane River\nJailynstad, AL 47633-6549','Dormouse; \'VERY ill.\' Alice tried to speak, but for a minute or two. \'They couldn\'t have done that, you know,\' said the Duchess; \'I never saw one, or heard of one,\' said Alice. \'Who\'s making.',1,0,395,1,NULL,'2024-05-22 23:56:49','2024-05-22 23:56:49',1,1,NULL,NULL,NULL),(59,NULL,'Graham','Schamberger','I will prosecute.',NULL,'cornelius09@hotmail.com','$2y$12$8rTsYiZGjI73EXYdMSR99eS6enH0ANZu.i.p8ZfcYg6pgG1J6mzry',185,'1978-07-30','+14844349320','2024-05-23 06:56:49',NULL,'job-seeker',NULL,'resume/01.pdf','88315 Fisher Lakes Suite 689\nWittingport, TX 76533-4079','Alice, rather alarmed at the mushroom (she had grown in the newspapers, at the beginning,\' the King repeated angrily, \'or I\'ll have you got in your knocking,\' the Footman continued in the.',1,0,623,0,NULL,'2024-05-22 23:56:49','2024-05-22 23:56:49',1,1,NULL,NULL,NULL),(60,NULL,'Marisa','Hegmann','King, \'and don\'t.',NULL,'yhegmann@von.com','$2y$12$q8PyBFTcfsEOimdr0X11tuHLtlyPhoBBaaD1qB7Se.gR3ysiUKiwe',184,'1984-09-13','+15317670056','2024-05-23 06:56:50',NULL,'job-seeker',NULL,'resume/01.pdf','93906 Pollich Parkways\nKalliemouth, WI 90093','Lory positively refused to tell its age, there was a little timidly: \'but it\'s no use going back to the other side will make you a present of everything I\'ve said as yet.\' \'A cheap sort of people.',1,0,4159,0,NULL,'2024-05-22 23:56:50','2024-05-22 23:56:50',1,1,NULL,NULL,NULL),(61,NULL,'Elody','Batz','I\'m talking!\' Just.',NULL,'aemard@moore.biz','$2y$12$hbtiqu70TkAx2RdQ44jl8.KJgzSLqd5mYpIVIDl0lyuhxu6DSv8Ri',186,'2020-11-28','+12342440588','2024-05-23 06:56:50',NULL,'job-seeker',NULL,'resume/01.pdf','4226 Waelchi Circle\nDickinsonhaven, VA 22434','The judge, by the Hatter, it woke up again with a pair of gloves and the procession came opposite to Alice, flinging the baby at her feet, they seemed to be an advantage,\' said Alice, very.',1,0,3033,1,NULL,'2024-05-22 23:56:50','2024-05-22 23:56:50',0,1,NULL,NULL,NULL),(62,NULL,'Grace','Lemke','Let me see: I\'ll.',NULL,'dylan.cronin@cole.com','$2y$12$Ls2xVuIX.ENCQtSCb8UXCOx.fbMEo5Kl8VwxxISdRsJiWAwoZ2EEy',186,'1997-10-14','+16694563803','2024-05-23 06:56:50',NULL,'job-seeker',NULL,'resume/01.pdf','16369 Chadrick Pine Suite 743\nNorth Nedra, AK 65206','I can\'t put it more clearly,\' Alice replied eagerly, for she had drunk half the bottle, saying to her very much at first, but, after watching it a little while, however, she again heard a little.',1,0,835,0,NULL,'2024-05-22 23:56:50','2024-05-22 23:56:50',1,1,NULL,NULL,NULL),(63,NULL,'Sid','Graham','Alice, and looking.',NULL,'thackett@gmail.com','$2y$12$HeuDDFwCbzUdZrdtKszPW.Vn3xBe5rpt/yCFFWJemR80hRjW4pLCe',184,'1997-08-28','+12193754178','2024-05-23 06:56:50',NULL,'employer',NULL,NULL,'45944 Hayes Harbor\nNorth Bennettville, KS 24134','Mock Turtle drew a long silence after this, and Alice could think of what sort it was) scratching and scrambling about in the air, mixed up with the clock. For instance, if you could manage it?).',1,0,480,0,NULL,'2024-05-22 23:56:50','2024-05-22 23:56:50',0,1,NULL,NULL,NULL),(64,NULL,'Dean','Deckow','Gryphon. Alice did.',NULL,'kayleigh83@yahoo.com','$2y$12$97hMg0vNs25R4dOzlQy/EenoUD80nhhxmFKVI89/CU6oLZV7xS71G',185,'2011-04-14','+16822267379','2024-05-23 06:56:51',NULL,'job-seeker',NULL,'resume/01.pdf','40484 Daniela Manors\nWest Curt, MI 36551','Alice said nothing: she had grown to her ear, and whispered \'She\'s under sentence of execution. Then the Queen had ordered. They very soon finished off the top of the game, the Queen had never done.',1,0,2206,1,NULL,'2024-05-22 23:56:51','2024-05-22 23:56:51',1,1,NULL,NULL,NULL),(65,NULL,'Justice','Streich','Majesty,\' said the.',NULL,'deangelo81@hotmail.com','$2y$12$w7EeY/Zpj8Wc3XZDhOk9Ae2LHPIrSn33p2wZLaKzrtEqNBYz6nQMK',184,'1989-12-08','+16899944826','2024-05-23 06:56:51',NULL,'job-seeker',NULL,'resume/01.pdf','613 Johnny Ridge\nNew Dorotheastad, DC 52825','I goes like a telescope.\' And so it was good practice to say when I breathe\"!\' \'It IS a Caucus-race?\' said Alice; \'that\'s not at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice.',1,0,3628,1,NULL,'2024-05-22 23:56:51','2024-05-22 23:56:51',0,1,NULL,NULL,NULL),(66,NULL,'Drew','Wehner','Cat, \'if you don\'t.',NULL,'zbatz@gmail.com','$2y$12$cM7FFzAr7eetFuURgOXEdeDvuT0q8VM9IfwiqtjAmvprrNiPs42HK',184,'2012-10-07','+13527696033','2024-05-23 06:56:51',NULL,'job-seeker',NULL,'resume/01.pdf','75868 Harber Courts Apt. 239\nKshlerinland, SC 60832-9397','March Hare took the watch and looked anxiously at the sides of the day; and this Alice thought she had read several nice little histories about children who had spoken first. \'That\'s none of YOUR.',1,0,1203,0,NULL,'2024-05-22 23:56:51','2024-05-22 23:56:51',0,1,NULL,NULL,NULL),(67,NULL,'Chandler','Koch','Alice in a large.',NULL,'dhettinger@macejkovic.com','$2y$12$LTzk1h2eCDB.E2dwjLdIH.9QidBHe0lLV8VaGQv/8r8d6aonRjhHa',184,'1977-01-11','+12014478289','2024-05-23 06:56:52',NULL,'job-seeker',NULL,'resume/01.pdf','9592 Harber Bypass\nNew Vinnie, HI 03351','Bill! catch hold of this elegant thimble\'; and, when it had VERY long claws and a Canary called out as loud as she went on, yawning and rubbing its eyes, \'Of course, of course; just what I was a.',1,0,1543,1,NULL,'2024-05-22 23:56:52','2024-05-22 23:56:52',0,1,NULL,NULL,NULL),(68,NULL,'Zetta','Mohr','Adventures, till.',NULL,'esther65@gmail.com','$2y$12$dML/64epMYCkMuQTH/8sLe3HLsURqLg3h0/rkGIOtndRJGjb5T10i',184,'1995-10-15','+16802669855','2024-05-23 06:56:52',NULL,'job-seeker',NULL,'resume/01.pdf','132 Caleigh Causeway\nReyesstad, GA 75082','THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice sadly. \'Hand it over afterwards, it occurred to her very much at first, but, after.',1,0,1131,0,NULL,'2024-05-22 23:56:52','2024-05-22 23:56:52',0,1,NULL,NULL,NULL),(69,NULL,'Brandyn','Dooley','King said gravely.',NULL,'misael99@davis.com','$2y$12$GEP1GuE48FmcQN5P0AJaVeL119f9IHjhWjFmBbQazC0fA7NJX4V2a',185,'2017-01-10','+17579078015','2024-05-23 06:56:52',NULL,'job-seeker',NULL,'resume/01.pdf','883 Larissa Overpass Suite 044\nNorth Jaclyn, SD 27579-8845','M--\' \'Why with an anxious look at me like that!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she thought of herself, \'I wish you wouldn\'t have come here.\' Alice didn\'t think that will be.',1,0,4436,0,NULL,'2024-05-22 23:56:52','2024-05-22 23:56:52',0,1,NULL,NULL,NULL),(70,NULL,'Letitia','Aufderhar','Alice: \'--where\'s.',NULL,'gutkowski.eldora@yahoo.com','$2y$12$vTIAM5eV2r3CI1vpC.UKiOmalGds9mR46KHzejXVTMWvacnWk1aSi',184,'2012-03-17','+18788488570','2024-05-23 06:56:52',NULL,'job-seeker',NULL,'resume/01.pdf','547 Ellen Hill\nJacobiport, AL 20742','ME, and told me he was in the same thing as \"I get what I should understand that better,\' Alice said nothing; she had read about them in books, and she at once to eat or drink under the.',1,0,348,0,NULL,'2024-05-22 23:56:52','2024-05-22 23:56:52',0,1,NULL,NULL,NULL),(71,NULL,'Ashtyn','Stokes','ME.\' \'You!\' said.',NULL,'wolf.hailie@gmail.com','$2y$12$AbpfhgqxigB06EfDGmqjB.MNx.NtpQW2yuOP/vSEWbD3Sskb2FrCC',184,'1973-07-23','+16808686096','2024-05-23 06:56:53',NULL,'job-seeker',NULL,'resume/01.pdf','817 Bailey Circles\nPort Casperstad, CA 88407-0739','The King and Queen of Hearts were seated on their slates, and she jumped up on to her usual height. It was high time to be no sort of a tree a few minutes to see if she had never left off when they.',1,0,1249,0,NULL,'2024-05-22 23:56:53','2024-05-22 23:56:53',0,1,NULL,NULL,NULL),(72,NULL,'Araceli','Baumbach','And with that she.',NULL,'arlene00@yahoo.com','$2y$12$4nO7jQ7TCHpbwhS5uzV6Zu99d1fqKN0gcWOTIDawAAn0fsaxI/YI6',184,'2019-08-07','+14754213635','2024-05-23 06:56:53',NULL,'employer',NULL,NULL,'6695 Greenholt Crest\nSauerchester, UT 24842-7906','She generally gave herself very good height indeed!\' said the King. \'It began with the tea,\' the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister kissed her, and said.',1,0,233,1,NULL,'2024-05-22 23:56:53','2024-05-22 23:56:53',1,1,NULL,NULL,NULL),(73,NULL,'Brisa','Dibbert','March Hare,) \'--it.',NULL,'wrippin@hotmail.com','$2y$12$jAZ0q7lMsaa1OrvhjykLWOmVRvhTqUrase6mq8huDb9zyZpJE951.',186,'2005-01-01','+14707695820','2024-05-23 06:56:53',NULL,'job-seeker',NULL,'resume/01.pdf','114 Quitzon Landing\nCarrollmouth, VA 45608-9568','Rabbit noticed Alice, as she spoke. (The unfortunate little Bill had left off sneezing by this time, sat down with wonder at the March Hare meekly replied. \'Yes, but some crumbs must have been a.',1,0,763,0,NULL,'2024-05-22 23:56:53','2024-05-22 23:56:53',1,1,NULL,NULL,NULL),(74,NULL,'Leila','Goldner','Adventures, till.',NULL,'qcrooks@gmail.com','$2y$12$FQ.qNwVXYONpkPpUcYZfauB/0WosCeM1gw8J0EgS4f2tZfA9RpfTO',184,'1981-11-12','+13256810733','2024-05-23 06:56:54',NULL,'job-seeker',NULL,'resume/01.pdf','553 Alanis Manors Suite 504\nWest Myron, WY 79282-5340','So you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, the Queen, who were giving it a very little use without my shoulders. Oh, how I wish you could only hear.',1,0,2989,1,NULL,'2024-05-22 23:56:54','2024-05-22 23:56:54',0,1,NULL,NULL,NULL),(75,NULL,'Diego','Swaniawski','Alice noticed with.',NULL,'cparisian@luettgen.com','$2y$12$qkocL22UiBh/5nXMwVZ/3umVZ1DcOzWyK7rkAmd5MGeR9YawuImQe',186,'2017-06-25','+14132562293','2024-05-23 06:56:54',NULL,'employer',NULL,NULL,'6845 Reinger Hill\nNorth Ryleighton, WY 98117-6639','I suppose Dinah\'ll be sending me on messages next!\' And she began again. \'I wonder if I know all sorts of things, and she, oh! she knows such a rule at processions; \'and besides, what would be quite.',1,0,4310,1,NULL,'2024-05-22 23:56:54','2024-05-22 23:56:54',0,1,NULL,NULL,NULL),(76,NULL,'Kurtis','Little','Alice, swallowing.',NULL,'wisoky.thalia@stroman.biz','$2y$12$I5rOTCZ4KZyZAwYboq2ECuyjRS817D6OId7hWLR60/y.LoOCUEfvW',186,'1996-11-12','+16038152301','2024-05-23 06:56:54',NULL,'job-seeker',NULL,'resume/01.pdf','4679 Hickle Row Apt. 125\nNew Randy, MO 33537-9979','Alice; \'and I do so like that curious song about the reason they\'re called lessons,\' the Gryphon replied rather impatiently: \'any shrimp could have been changed several times since then.\' \'What do.',1,0,1466,1,NULL,'2024-05-22 23:56:54','2024-05-22 23:56:54',1,1,NULL,NULL,NULL),(77,NULL,'Berniece','Moen','Mock Turtle said.',NULL,'jhuels@bailey.com','$2y$12$.j7wr3sg5J9UffsIVIOXg.qJ9ApGf6f46jAFxsBtq/atEwezEhnTW',186,'2013-12-18','+14154808431','2024-05-23 06:56:55',NULL,'job-seeker',NULL,'resume/01.pdf','86208 Bayer Fords Apt. 443\nWest Dessieberg, WA 89907','Gryphon whispered in a day or two: wouldn\'t it be of any that do,\' Alice said very politely, \'for I never understood what it was good practice to say but \'It belongs to the porpoise, \"Keep back.',1,0,4603,1,NULL,'2024-05-22 23:56:55','2024-05-22 23:56:55',1,1,NULL,NULL,NULL),(78,NULL,'Ava','Spinka','How she longed to.',NULL,'nienow.jasmin@yahoo.com','$2y$12$F0ko1FEEGAp.WcW6PBzRHOFX8ID7kJPeJGbWLrAPu6D31LeFA24Gm',186,'2008-05-02','+16088334416','2024-05-23 06:56:55',NULL,'employer',NULL,NULL,'6987 Green Island Apt. 250\nNorth Freda, RI 40147','I begin, please your Majesty,\' said Alice angrily. \'It wasn\'t very civil of you to death.\"\' \'You are old,\' said the Hatter. This piece of rudeness was more hopeless than ever: she sat down and make.',1,0,2031,1,NULL,'2024-05-22 23:56:55','2024-05-22 23:56:55',1,1,NULL,NULL,NULL),(79,NULL,'Anahi','Kohler','I must be a queer.',NULL,'armstrong.melany@bosco.com','$2y$12$Hl1rhMNzHzS2X.jvK.MtAur/FXYJYSEPjVKC329uWVeeRB26dtm3u',184,'2011-08-18','+19472267122','2024-05-23 06:56:55',NULL,'job-seeker',NULL,'resume/01.pdf','2531 Simonis Roads Suite 454\nKathrynstad, ND 95215-4872','King: \'leave out that part.\' \'Well, at any rate, there\'s no room at all this time. \'I want a clean cup,\' interrupted the Gryphon. \'--you advance twice--\' \'Each with a growl, And concluded the.',1,0,2424,1,NULL,'2024-05-22 23:56:55','2024-05-22 23:56:55',1,1,NULL,NULL,NULL),(80,NULL,'Isaias','Ullrich','Dormouse: \'not in.',NULL,'kihn.vincent@yahoo.com','$2y$12$ClKv38vvKdfVcSx6Z0bpaOUtAdCPHHNM0PPJ9QBbts7o2yFDYgYMG',185,'2011-09-09','+17542606685','2024-05-23 06:56:56',NULL,'employer',NULL,NULL,'41372 Gracie Spring\nKavonside, PA 00573','YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the thought that SOMEBODY ought to be told so. \'It\'s really dreadful,\' she muttered to herself, and once again the tiny hands.',1,0,3184,0,NULL,'2024-05-22 23:56:56','2024-05-22 23:56:56',1,1,NULL,NULL,NULL),(81,NULL,'Orie','Franecki','IS it to make out.',NULL,'ethan.botsford@gmail.com','$2y$12$A0xtzn6vhX7sx5/e/mbBdeMWLTVErYnxe6YniNpVaBwxZsegb2tTG',184,'2015-05-23','+14353358380','2024-05-23 06:56:56',NULL,'job-seeker',NULL,'resume/01.pdf','31940 Molly Courts Apt. 372\nLetitiamouth, MN 24834-4617','Hatter, with an important air, \'are you all ready? This is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have imitated somebody else\'s hand,\' said the March Hare. The.',1,0,1373,0,NULL,'2024-05-22 23:56:56','2024-05-22 23:56:56',0,1,NULL,NULL,NULL),(82,NULL,'Golden','Schoen','Alice said with a.',NULL,'ceffertz@gmail.com','$2y$12$HxSccjplZc2ieZ1EZInqYeZxFozlFtb8HhSDAuggvxiB7U/Qw21yy',186,'1996-08-28','+18203450681','2024-05-23 06:56:56',NULL,'employer',NULL,NULL,'790 Stehr Lake\nKodyport, IA 34770','Hatter and the others looked round also, and all must have been was not quite sure whether it was only a pack of cards: the Knave of Hearts, and I had not as yet had any dispute with the words all.',1,0,4266,0,NULL,'2024-05-22 23:56:56','2024-05-22 23:56:56',0,1,NULL,NULL,NULL),(83,NULL,'Yadira','Schumm','If they had been.',NULL,'jschuppe@wehner.info','$2y$12$IZAakHg5WhMg0PyHuEBLbOqRDUEI3mvwqRqAlmCczL2lRZ.WMVzoC',186,'1985-05-17','+19207420723','2024-05-23 06:56:56',NULL,'job-seeker',NULL,'resume/01.pdf','143 Runolfsdottir Shoal\nEast Durwardtown, SD 36026','She was looking up into the air. She did it at all. However, \'jury-men\' would have made a dreadfully ugly child: but it was impossible to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was YOUR table,\'.',1,0,1190,0,NULL,'2024-05-22 23:56:56','2024-05-22 23:56:56',0,1,NULL,NULL,NULL),(84,NULL,'Kayli','Muller','Alice; \'but when.',NULL,'fwest@schaden.net','$2y$12$O4S4zi98/PhSKIDVIu26Xeg9C04vndlhV9PK2ryv4YhAFVUlVcrYK',186,'1986-09-01','+12195929099','2024-05-23 06:56:57',NULL,'employer',NULL,NULL,'3874 Bernhard Creek Suite 289\nWest Reedport, NY 47422','I\'m mad?\' said Alice. \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice, \'we learned French and music.\' \'And washing?\' said the youth, \'one would hardly suppose That your eye was as much.',1,0,1004,1,NULL,'2024-05-22 23:56:57','2024-05-22 23:56:57',1,1,NULL,NULL,NULL),(85,NULL,'Waylon','Brekke','The first witness.',NULL,'carroll.stracke@braun.com','$2y$12$RfiKz2kdCb/1Xl8HavECGeAe35ULXwViJinzQFiQXZY8WWHPc.0BS',184,'1981-10-20','+12032786118','2024-05-23 06:56:57',NULL,'job-seeker',NULL,'resume/01.pdf','35212 Bria Extension\nMurraytown, TX 06411','King and Queen of Hearts were seated on their slates, and she drew herself up on to the heads of the hall; but, alas! the little thing howled so, that Alice had never done such a hurry that she.',1,0,2646,0,NULL,'2024-05-22 23:56:57','2024-05-22 23:56:57',0,1,NULL,NULL,NULL),(86,NULL,'Kelvin','Bode','I almost think I.',NULL,'beer.geo@hotmail.com','$2y$12$Q3olgZvrRCV8r7SaCYps5O5I1/NY0khugkjzIlANnDxalL4CTBKQy',184,'2015-09-02','+16464291696','2024-05-23 06:56:57',NULL,'job-seeker',NULL,'resume/01.pdf','8742 Leannon Garden Apt. 757\nPort Faeport, WV 36611','Alice. \'Come on, then!\' roared the Queen, in a hot tureen! Who for such dainties would not open any of them. \'I\'m sure those are not attending!\' said the King. \'Nothing whatever,\' said Alice. \'Oh.',1,0,1698,1,NULL,'2024-05-22 23:56:57','2024-05-22 23:56:57',0,1,NULL,NULL,NULL),(87,NULL,'Hayden','Strosin','Why, I wouldn\'t be.',NULL,'rogelio.damore@ritchie.com','$2y$12$ucIZ9eaeeHEy8VuiqkQJNuzQcjB1ReBDlnsn8v6RI9muat8yoqotu',185,'2014-05-31','+15856093221','2024-05-23 06:56:58',NULL,'job-seeker',NULL,'resume/01.pdf','9684 Mariana Cliff\nJohnsonshire, AL 71546-1202','Alice. \'Of course they were\', said the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Gryphon hastily.',1,0,3104,0,NULL,'2024-05-22 23:56:58','2024-05-22 23:56:58',0,1,NULL,NULL,NULL),(88,NULL,'Misty','Feest','March Hare. Alice.',NULL,'ugrady@blanda.com','$2y$12$N9i4HIgq25B3FVkXON/bg./AYTO8ZWTdPLP63BUXlwfWDHymLgYmS',184,'1982-05-04','+17254565356','2024-05-23 06:56:58',NULL,'job-seeker',NULL,'resume/01.pdf','7197 Sheila Port Suite 098\nNorth Noemie, OR 38773-9630','VERY remarkable in that; nor did Alice think it would be very likely true.) Down, down, down. Would the fall was over. Alice was rather glad there WAS no one else seemed inclined to say \'I once.',1,0,957,1,NULL,'2024-05-22 23:56:58','2024-05-22 23:56:58',1,1,NULL,NULL,NULL),(89,NULL,'Hugh','Hills','Hatter. \'It isn\'t.',NULL,'schulist.peyton@hill.com','$2y$12$L3K9NhNLqyN4aEBMoCkSseRdUTEvMnYwl7zpi5LD0ctGG4YYlxMUe',184,'1998-11-22','+14453375907','2024-05-23 06:56:58',NULL,'employer',NULL,NULL,'815 Schoen Estates\nLilytown, OH 85060','Then it got down off the cake. * * * * * * * * * * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice again, for really I\'m quite tired of being such a.',1,0,878,1,NULL,'2024-05-22 23:56:58','2024-05-22 23:56:58',1,1,NULL,NULL,NULL),(90,NULL,'Marilie','Jenkins','Lizard, who seemed.',NULL,'owest@medhurst.com','$2y$12$uP6j8PQGb9o2vJjLw9X0l.YxLKhJiDM5myLBUZmapekW1QE2o9LOy',185,'2007-06-22','+16362885455','2024-05-23 06:56:58',NULL,'job-seeker',NULL,'resume/01.pdf','67665 Michele Mall Suite 915\nSouth Missouri, CA 30582','I beg your pardon!\' cried Alice in a voice sometimes choked with sobs, to sing \"Twinkle, twinkle, little bat! How I wonder if I chose,\' the Duchess to play croquet with the lobsters, out to sea as.',1,0,573,0,NULL,'2024-05-22 23:56:58','2024-05-22 23:56:58',1,1,NULL,NULL,NULL),(91,NULL,'Marjory','Ferry','Number One,\' said.',NULL,'mina40@blick.com','$2y$12$v4Ck0Y2KJDbW4YcM06M0zOPVdCQrmxiOjyztytFp2ta3o0NQSES/W',185,'2006-05-30','+12012698174','2024-05-23 06:56:59',NULL,'employer',NULL,NULL,'433 Theresia Junctions Suite 976\nWest Pamelafort, NY 24679','March Hare: she thought it must be on the other birds tittered audibly. \'What I was thinking I should frighten them out again. That\'s all.\' \'Thank you,\' said the Mock Turtle yawned and shut his.',1,0,1322,1,NULL,'2024-05-22 23:56:59','2024-05-22 23:56:59',0,1,NULL,NULL,NULL),(92,NULL,'Laurie','Effertz','But at any rate a.',NULL,'isaiah.oberbrunner@prosacco.com','$2y$12$0NQVe/kR5NC.verOpaATxei4lziozPzscHW66soVCALcCIKCt7ZpK',185,'1973-09-21','+18129174011','2024-05-23 06:56:59',NULL,'job-seeker',NULL,'resume/01.pdf','4714 Krajcik Ville Suite 219\nNew Ewellmouth, WY 84664-1320','I should frighten them out of its little eyes, but it makes me grow smaller, I suppose.\' So she stood watching them, and it\'ll sit up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Pigeon.',1,0,3823,1,NULL,'2024-05-22 23:56:59','2024-05-22 23:56:59',1,1,NULL,NULL,NULL),(93,NULL,'America','Hagenes','I do so like that.',NULL,'theodora.barton@morar.com','$2y$12$fdDSz8iNw98xE8T1dXzJ1uhEYOmXt6rx3CJwNbxbHzJH7ANNJ/jsS',184,'1970-11-08','+12347500209','2024-05-23 06:56:59',NULL,'job-seeker',NULL,'resume/01.pdf','491 Sipes Spurs\nLake Elinore, KY 63394','Alice felt a very short time the Queen of Hearts, she made it out again, and all must have a prize herself, you know,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was gone.',1,0,1737,1,NULL,'2024-05-22 23:56:59','2024-05-22 23:56:59',0,1,NULL,NULL,NULL),(94,NULL,'Clifton','Kohler','Alice very meekly.',NULL,'rippin.mike@metz.info','$2y$12$TLf2fFqQe9DJytAioUmbHO/9ldr2IcJCOmCPe9bacJyT5VpH7VfKG',186,'1995-02-23','+15592282635','2024-05-23 06:57:00',NULL,'employer',NULL,NULL,'98283 Sanford Mill\nAshleehaven, MI 27341-7707','I have ordered\'; and she felt certain it must be collected at once in the same words as before, \'It\'s all her riper years, the simple and loving heart of her favourite word \'moral,\' and the beak.',1,0,3881,1,NULL,'2024-05-22 23:57:00','2024-05-22 23:57:00',0,1,NULL,NULL,NULL),(95,NULL,'Aglae','Cartwright','THIS!\' (Sounds of.',NULL,'levi.ortiz@cremin.com','$2y$12$G8sr.x87WZ8RGxO34cX8p.vkj4TK/e1hWHrDoehRO8xeakjQrwa56',186,'2019-09-03','+19792679974','2024-05-23 06:57:00',NULL,'employer',NULL,NULL,'3268 Shanahan Crossing\nOtiliaport, RI 24793','Dormouse go on for some time with one finger, as he fumbled over the list, feeling very glad to do such a curious appearance in the distance, screaming with passion. She had quite forgotten the.',1,0,2603,0,NULL,'2024-05-22 23:57:00','2024-05-22 23:57:00',0,1,NULL,NULL,NULL),(96,NULL,'Josue','Bogisich','The hedgehog was.',NULL,'lizeth67@schulist.com','$2y$12$K7tT2/baIDzBwXM6SmyV6eL2TY2a9kPjrHw4hKP35l3f1du91Q/RK',185,'1984-10-04','+16102089820','2024-05-23 06:57:00',NULL,'employer',NULL,NULL,'382 Nikolaus Stravenue Apt. 531\nUlisesmouth, NE 26084','Hatter said, tossing his head sadly. \'Do I look like it?\' he said, turning to the Dormouse, not choosing to notice this last word two or three pairs of tiny white kid gloves while she ran, as well.',1,0,2989,1,NULL,'2024-05-22 23:57:00','2024-05-22 23:57:00',1,1,NULL,NULL,NULL),(97,NULL,'Virgie','Block','The Rabbit Sends.',NULL,'stroman.eldon@wuckert.biz','$2y$12$gTB6d3bKZodHg27REc0EQu4/PZdvXrDJLnyoGPdm217AlxbLZnWrO',186,'1971-07-31','+18504331305','2024-05-23 06:57:00',NULL,'job-seeker',NULL,'resume/01.pdf','732 Daugherty Street\nWest Hayleyberg, WA 52645-3148','Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon repeated impatiently: \'it begins \"I passed by his face only, she would get up and down looking for them, but they all.',1,0,4746,0,NULL,'2024-05-22 23:57:00','2024-05-22 23:57:00',0,1,NULL,NULL,NULL),(98,NULL,'Jaquelin','Marquardt','Dormouse began in.',NULL,'jaeden05@yahoo.com','$2y$12$mulJQXzalC3rh9njEfrVqe7sTYn403YdrJJ3wEUwZKfBzmdBCc6w2',186,'1976-03-15','+19195229895','2024-05-23 06:57:01',NULL,'employer',NULL,NULL,'76261 Cronin Heights\nNorth Brad, RI 24770','Gryphon. \'The reason is,\' said the Footman. \'That\'s the most important piece of bread-and-butter in the distance, screaming with passion. She had already heard her sentence three of the game.',1,0,4554,1,NULL,'2024-05-22 23:57:01','2024-05-22 23:57:01',0,1,NULL,NULL,NULL),(99,NULL,'Genoveva','Deckow','Footman remarked.',NULL,'mtremblay@gmail.com','$2y$12$o6XJe.eMQIzK5.xZVNJT/O0STAstjD6cclZ8EAZzeeULDOnJQlmAm',186,'1980-09-30','+19787967019','2024-05-23 06:57:01',NULL,'employer',NULL,NULL,'6733 Schowalter Pine\nNorth Alva, TN 98718','I do hope it\'ll make me larger, it must be growing small again.\' She got up very sulkily and crossed over to herself, and once she remembered that she looked back once or twice, half hoping that.',1,0,3278,0,NULL,'2024-05-22 23:57:01','2024-05-22 23:57:01',1,1,NULL,NULL,NULL),(100,NULL,'Allene','Corwin','Rabbit was still.',NULL,'muhammad.hills@wisoky.info','$2y$12$3kwdtJVfF4PtmxBoBgJBzuBOSoU8dCXu6/F/N48FKuM5rF/OUFMey',184,'1999-01-18','+14195506444','2024-05-23 06:57:01',NULL,'job-seeker',NULL,'resume/01.pdf','550 Roberts Lake Suite 510\nBreitenbergborough, IA 10143','King, the Queen, who were lying round the neck of the court,\" and I had to double themselves up and down looking for the accident of the same age as herself, to see if he were trying to explain the.',1,0,2258,1,NULL,'2024-05-22 23:57:01','2024-05-22 23:57:01',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_analytics`
--

DROP TABLE IF EXISTS `jb_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_analytics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_full` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_analytics`
--

LOCK TABLES `jb_analytics` WRITE;
/*!40000 ALTER TABLE `jb_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_applications`
--

DROP TABLE IF EXISTS `jb_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `job_id` bigint unsigned NOT NULL,
  `resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_applications`
--

LOCK TABLES `jb_applications` WRITE;
/*!40000 ALTER TABLE `jb_applications` DISABLE KEYS */;
INSERT INTO `jb_applications` VALUES (1,'Jayde','Ullrich','+15513899450','ppadberg@yahoo.com','Let me see: that would happen: \'\"Miss Alice! Come here directly, and get in at the thought that SOMEBODY ought to be done, I wonder?\' Alice guessed in a low curtain she had been running half an hour.',24,'resume/01.pdf','resume/01.pdf',23,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(2,'Reilly','Crona','+15866855064','orville.fisher@gmail.com','No room!\' they cried out when they liked, and left off when they saw the White Rabbit blew three blasts on the breeze that followed them, the melancholy words:-- \'Soo--oop of the court. \'What do you.',44,'resume/01.pdf','resume/01.pdf',49,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(3,'Lavon','Altenwerth','+17266459776','ohara.lisandro@gmail.com','Alice went on in the house opened, and a crash of broken glass. \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as she could, \'If you can\'t swim, can you?\' he added, turning to Alice.',17,'resume/01.pdf','resume/01.pdf',10,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(4,'Melyna','Leuschke','+16516186049','nikolas.bayer@casper.com','THAT in a bit.\' \'Perhaps it doesn\'t matter much,\' thought Alice, and she sat on, with closed eyes, and half believed herself in a tone of this was his first remark, \'It was the BEST butter, you.',32,'resume/01.pdf','resume/01.pdf',12,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(5,'Gail','Boyer','+19159617601','rosina63@spinka.com','Majesty,\' said the Mock Turtle Soup is made from,\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and.',15,'resume/01.pdf','resume/01.pdf',41,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(6,'Brandyn','Dooley','+17579078015','misael99@davis.com','I\'m sure she\'s the best cat in the same thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Then it wasn\'t very civil of you to learn?\' \'Well, there was hardly room for this, and Alice was.',49,'resume/01.pdf','resume/01.pdf',69,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(7,'Frankie','Reinger','+19075414132','nbuckridge@parisian.net','Alice didn\'t think that will be much the same thing as a cushion, resting their elbows on it, or at any rate a book written about me, that there was silence for some minutes. Alice thought the whole.',13,'resume/01.pdf','resume/01.pdf',38,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(8,'Kelvin','Bode','+16464291696','beer.geo@hotmail.com','Hatter and the bright flower-beds and the Hatter with a growl, And concluded the banquet--] \'What IS the fun?\' said Alice. \'Why, you don\'t like the name: however, it only grinned when it saw mine.',47,'resume/01.pdf','resume/01.pdf',86,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(9,'Anahi','Kohler','+19472267122','armstrong.melany@bosco.com','Alice, quite forgetting that she began fancying the sort of use in knocking,\' said the Duchess, \'and that\'s why. Pig!\' She said the Pigeon; \'but if they do, why then they\'re a kind of sob, \'I\'ve.',20,'resume/01.pdf','resume/01.pdf',79,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(10,'Ashtyn','Stehr','+14808857548','lacey47@hotmail.com','Queen?\' said the Mock Turtle. \'Certainly not!\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I don\'t know where Dinn may be,\' said the Dormouse: \'not in that ridiculous fashion.\'.',30,'resume/01.pdf','resume/01.pdf',32,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(11,'Clair','Bernhard','+16102181166','kreiger.rosella@reichel.org','Alice thought), and it set to work shaking him and punching him in the world! Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have.',51,'resume/01.pdf','resume/01.pdf',13,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(12,'Hayden','Strosin','+15856093221','rogelio.damore@ritchie.com','There were doors all round her head. Still she went round the table, but there were three little sisters--they were learning to draw, you know--\' She had quite forgotten the little golden key was.',16,'resume/01.pdf','resume/01.pdf',87,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(13,'Letitia','Aufderhar','+18788488570','gutkowski.eldora@yahoo.com','Queen, the royal children, and make one repeat lessons!\' thought Alice; but she stopped hastily, for the Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to speak, and no more to.',6,'resume/01.pdf','resume/01.pdf',70,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(14,'Elody','Batz','+12342440588','aemard@moore.biz','Mock Turtle at last, more calmly, though still sobbing a little now and then turned to the door, staring stupidly up into the book her sister on the slate. \'Herald, read the accusation!\' said the.',11,'resume/01.pdf','resume/01.pdf',61,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(15,'Tiffany','Kilback','+12623621045','alfreda61@yahoo.com','Why, I wouldn\'t say anything about it, so she sat down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the Queen,\' and she crossed her hands on her hand, watching.',45,'resume/01.pdf','resume/01.pdf',45,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(16,'Gail','Murray','+13164405972','ischowalter@spencer.org','Alice took up the little magic bottle had now had its full effect, and she ran with all speed back to yesterday, because I was a little three-legged table, all made a dreadfully ugly child: but it.',23,'resume/01.pdf','resume/01.pdf',21,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(17,'Rupert','Rosenbaum','+18142771879','qlangosh@barton.org','Queen, who were giving it something out of it, and on it were white, but there were no tears. \'If you\'re going to leave the room, when her eye fell upon a low voice, \'Why the fact is, you know.',43,'resume/01.pdf','resume/01.pdf',34,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(18,'Kurtis','Little','+16038152301','wisoky.thalia@stroman.biz','Dormouse! Turn that Dormouse out of sight: \'but it seems to be no sort of thing never happened, and now here I am so VERY nearly at the moment, \'My dear! I shall have to turn into a cucumber-frame.',2,'resume/01.pdf','resume/01.pdf',76,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(19,'Brisa','Dibbert','+14707695820','wrippin@hotmail.com','CHORUS. \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King added in a low curtain she had hurt the poor child, \'for I never was so long that they were IN the well,\' Alice said to a mouse, That he.',31,'resume/01.pdf','resume/01.pdf',73,1,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03'),(20,'Noble','Zulauf','+14324572332','keaton.bartoletti@hotmail.com','Duchess\'s voice died away, even in the middle, wondering how she would get up and down looking for the next thing is, to get her head through the neighbouring pool--she could hear the words:-- \'I.',33,'resume/01.pdf','resume/01.pdf',7,0,'checked','2024-05-22 23:57:03','2024-05-22 23:57:03');
/*!40000 ALTER TABLE `jb_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels`
--

DROP TABLE IF EXISTS `jb_career_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels`
--

LOCK TABLES `jb_career_levels` WRITE;
/*!40000 ALTER TABLE `jb_career_levels` DISABLE KEYS */;
INSERT INTO `jb_career_levels` VALUES (1,'Department Head',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'Entry Level',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'Experienced Professional',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'GM / CEO / Country Head / President',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Intern/Student',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27');
/*!40000 ALTER TABLE `jb_career_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels_translations`
--

DROP TABLE IF EXISTS `jb_career_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_career_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_career_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels_translations`
--

LOCK TABLES `jb_career_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_career_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_career_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories`
--

DROP TABLE IF EXISTS `jb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories`
--

LOCK TABLES `jb_categories` WRITE;
/*!40000 ALTER TABLE `jb_categories` DISABLE KEYS */;
INSERT INTO `jb_categories` VALUES (1,'Content Writer',NULL,0,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(2,'Market Research',NULL,1,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(3,'Marketing &amp; Sale',NULL,2,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(4,'Customer Help',NULL,3,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(5,'Finance',NULL,4,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(6,'Software',NULL,5,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(7,'Human Resource',NULL,6,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(8,'Management',NULL,7,0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(9,'Retail &amp; Products',NULL,8,0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0),(10,'Security Analyst',NULL,9,0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29',0);
/*!40000 ALTER TABLE `jb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories_translations`
--

DROP TABLE IF EXISTS `jb_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories_translations`
--

LOCK TABLES `jb_categories_translations` WRITE;
/*!40000 ALTER TABLE `jb_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies`
--

DROP TABLE IF EXISTS `jb_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_founded` int unsigned DEFAULT NULL,
  `ceo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_offices` int unsigned DEFAULT NULL,
  `number_of_employees` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_revenue` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_companies_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies`
--

LOCK TABLES `jb_companies` WRITE;
/*!40000 ALTER TABLE `jb_companies` DISABLE KEYS */;
INSERT INTO `jb_companies` VALUES (1,NULL,'LinkedIn',NULL,'Consequatur totam iusto sit ipsa eaque totam beatae. Quaerat vel aperiam nam commodi. Rerum eum alias perferendis.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/1.png','43.870866','-76.718399','4415 Fermin Camp Suite 937\nFriesenland, MO 44256-1945',6,6,6,NULL,'+14705156741',2005,'John Doe',5,'3','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(2,NULL,'Adobe Illustrator',NULL,'Nobis autem expedita necessitatibus est. Accusamus reiciendis est harum quisquam eveniet sit. Animi est omnis modi dicta.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.adobe.com/','companies/2.png','43.473623','-75.612612','24558 Little Rest\nRubyeport, GA 59924-8576',2,2,2,NULL,'+13169240373',1977,'Jeff Werner',6,'2','10M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(3,NULL,'Bing Search',NULL,'Fugit sequi maxime modi eum cupiditate animi. Veniam placeat est necessitatibus. Minima et atque et voluptas rerum. Tempora vero omnis et fugit.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.bing.com/','companies/3.png','43.314689','-75.085169','86941 Block Mills Apt. 393\nNew Dale, CT 50183',2,2,2,NULL,'+13522224129',2019,'Nakamura',8,'10','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(4,NULL,'Dailymotion',NULL,'Aut sint molestias qui. Animi voluptatem ut ratione voluptatibus voluptate. Delectus ut ea eos non facere.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.dailymotion.com/','companies/4.png','42.785792','-76.634013','88669 Morissette Mill\nPort Amanishire, SC 06849-9548',6,6,6,NULL,'+12766712923',2024,'John Doe',6,'3','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(5,NULL,'Linkedin',NULL,'Veritatis voluptatem non est enim dolorum itaque iusto rerum. Sit delectus ullam ad numquam. Doloremque qui officiis non cumque voluptas dicta nemo. Eius necessitatibus ratione autem dolore optio id.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/5.png','43.727686','-75.766731','49105 Watsica Lock\nPhoebeburgh, IN 67944',5,5,5,NULL,'+16163353714',2011,'John Doe',3,'6','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(6,NULL,'Quora JSC',NULL,'Voluptate aut est esse libero impedit. Qui et pariatur minus facere iste ullam ducimus. Delectus quo voluptas sint temporibus.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.quora.com/','companies/6.png','43.851757','-76.255807','931 Kuhn Trail\nGottliebfurt, SD 62263',6,6,6,NULL,'+19092989055',2003,'John Doe',9,'3','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(7,NULL,'Nintendo',NULL,'Quia facilis ullam voluptatem praesentium magni tenetur. Cumque rem maiores libero. Ad cupiditate eos repellat ea. In aut corporis sed ipsa eos aut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.nintendo.com/','companies/7.png','43.975444','-76.133152','6464 Amina Lakes Suite 826\nIdahaven, CA 34482-6477',5,5,5,NULL,'+19365248232',1995,'Steve Jobs',3,'4','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(8,NULL,'Periscope',NULL,'Quia quia facere voluptatem cupiditate iste voluptatem. Inventore et est quia nesciunt aperiam consequuntur saepe. Aut quisquam quia saepe fuga.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/8.png','42.719666','-76.017088','490 Sally Mills Suite 770\nWest Yoshikoborough, IL 15364',5,5,5,NULL,'+17017399026',1988,'John Doe',5,'7','3M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(9,NULL,'NewSum',NULL,'Rem velit illo earum aperiam sint tempora aperiam. Voluptas debitis asperiores est qui ad enim repudiandae rerum. Eligendi rem minus omnis cum. Quidem magni quia nam est ut quia.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://newsum.us/','companies/4.png','43.772383','-75.651661','780 Breitenberg Key Suite 829\nRolfsonland, NC 69393',1,1,1,NULL,'+13239887498',2019,'John Doe',8,'6','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(10,NULL,'PowerHome',NULL,'Vitae perferendis facere animi ut exercitationem. Et quo quam libero ex. Dolorum et accusamus sint et quia reprehenderit. Ipsum ut corrupti quod sed.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/5.png','42.722492','-75.357035','867 Kale Cove Suite 275\nLake Buford, DC 84512-9792',5,5,5,NULL,'+17544038644',2018,'John Doe',1,'2','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(11,NULL,'Whop.com',NULL,'Corrupti eligendi qui occaecati suscipit corrupti delectus ut. Ex natus magnam unde odit laboriosam fuga ducimus. In aut dicta et culpa harum aut aut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://whop.com/','companies/6.png','43.153782','-74.8084','15524 Mann Cliffs\nStammside, WA 10091-7423',1,1,1,NULL,'+13516257203',1974,'John Doe',4,'10','2M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(12,NULL,'Greenwood',NULL,'Reprehenderit sequi eos fugiat quo porro in tempora. Est velit ipsam vel sapiente asperiores. Unde ut id incidunt ut expedita consequatur temporibus. Minus voluptatibus iure ut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.greenwoodjs.io/','companies/7.png','43.895246','-76.203867','9756 Collins Coves Suite 171\nBaileychester, VA 49708',4,4,4,NULL,'+13414742040',1972,'John Doe',4,'8','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(13,NULL,'Kentucky',NULL,'Repellat asperiores beatae expedita quis rem suscipit voluptatibus. Tenetur doloremque dolore quaerat molestiae. Sapiente laudantium voluptatem libero et minima.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.kentucky.gov/','companies/8.png','43.971273','-75.933','140 Gracie Cove\nEast Frederiquefurt, PA 15953-8557',1,1,1,NULL,'+19172100430',1973,'John Doe',1,'4','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(14,NULL,'Equity',NULL,'Culpa aut debitis reiciendis. Qui iste tenetur eos vel. Aut in dolorum amet assumenda voluptatem reiciendis.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.equity.org.uk/','companies/6.png','43.834418','-75.681339','314 Aditya Ferry\nBeattyside, LA 49058-8850',2,2,2,NULL,'+16826422302',1996,'John Doe',1,'4','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(15,NULL,'Honda',NULL,'Et aut sit sed autem corporis molestiae eos in. Ut ea rerum enim aut eos. Voluptas saepe exercitationem vero consequatur ut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.honda.com/','companies/9.png','42.782802','-76.528584','57063 Tillman Mews Suite 361\nPort Beaulahhaven, ID 87386',5,5,5,NULL,'+12569564549',2008,'John Doe',6,'2','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(16,NULL,'Toyota',NULL,'Ea et quia qui ipsam. Tempore omnis recusandae consequatur ad aspernatur sed consequatur. Excepturi quia laudantium deleniti soluta rem quam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.toyota.com/','companies/5.png','42.739256','-75.200768','3872 Williamson Spurs Apt. 587\nHalleton, OH 26210-5435',2,2,2,NULL,'+17575824877',2002,'John Doe',10,'10','5M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(17,NULL,'Lexus',NULL,'Quis earum consectetur saepe ea qui qui. Ut iure mollitia vel dolore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/3.png','43.650068','-76.403737','295 Lavern Field Apt. 035\nLewisstad, GA 63466',6,6,6,NULL,'+17162719982',1980,'John Doe',10,'8','9M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(18,NULL,'Ondo',NULL,'Hic voluptatibus minima in recusandae in. Ipsa itaque ratione rerum tempore et sed. Nulla repudiandae incidunt totam nemo et hic.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://ondo.mn/','companies/6.png','42.632188','-75.995094','970 Ward Squares\nEast Rogermouth, DC 46595-9105',4,4,4,NULL,'+12248724871',1986,'John Doe',10,'9','9M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(19,NULL,'Square',NULL,'Et aspernatur quia consequatur. Et laborum nostrum omnis. Dolores accusantium vel cupiditate hic laboriosam et.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://squareup.com/','companies/2.png','43.771417','-75.87558','59327 Terry Cove\nEast Sydnibury, OK 99730-7009',5,5,5,NULL,'+14582465641',1973,'John Doe',5,'3','9M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(20,NULL,'Visa',NULL,'Consequatur qui commodi fugiat earum dolorum vero. Occaecati et quibusdam vitae natus aliquam laboriosam. Asperiores sit suscipit culpa ut est exercitationem voluptatem.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://visa.com/','companies/8.png','43.679561','-74.957168','459 Haley Shore Suite 228\nAraceliville, OK 13728-8711',6,6,6,NULL,'+15808434722',2000,'John Doe',1,'7','5M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL);
/*!40000 ALTER TABLE `jb_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies_accounts`
--

DROP TABLE IF EXISTS `jb_companies_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies_accounts`
--

LOCK TABLES `jb_companies_accounts` WRITE;
/*!40000 ALTER TABLE `jb_companies_accounts` DISABLE KEYS */;
INSERT INTO `jb_companies_accounts` VALUES (1,1),(1,4),(2,1),(2,4),(3,1),(3,4),(4,1),(4,4),(5,1),(5,4),(6,1),(6,4),(7,1),(7,4),(8,1),(8,4),(9,1),(9,4),(10,1),(10,4),(11,1),(11,4),(12,1),(12,4),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,1),(16,4),(17,1),(17,4),(18,1),(18,4),(19,1),(19,4),(20,1),(20,4);
/*!40000 ALTER TABLE `jb_companies_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_coupons`
--

DROP TABLE IF EXISTS `jb_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_coupons`
--

LOCK TABLES `jb_coupons` WRITE;
/*!40000 ALTER TABLE `jb_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_currencies`
--

DROP TABLE IF EXISTS `jb_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_currencies`
--

LOCK TABLES `jb_currencies` WRITE;
/*!40000 ALTER TABLE `jb_currencies` DISABLE KEYS */;
INSERT INTO `jb_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-05-22 23:56:31','2024-05-22 23:56:31'),(2,'EUR','€',0,2,1,0,0.91,'2024-05-22 23:56:31','2024-05-22 23:56:31'),(3,'VND','₫',0,0,2,0,23717.5,'2024-05-22 23:56:31','2024-05-22 23:56:31');
/*!40000 ALTER TABLE `jb_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options`
--

DROP TABLE IF EXISTS `jb_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options`
--

LOCK TABLES `jb_custom_field_options` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options_translations`
--

LOCK TABLES `jb_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values`
--

DROP TABLE IF EXISTS `jb_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values`
--

LOCK TABLES `jb_custom_field_values` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values_translations`
--

LOCK TABLES `jb_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields`
--

DROP TABLE IF EXISTS `jb_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields`
--

LOCK TABLES `jb_custom_fields` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields_translations`
--

DROP TABLE IF EXISTS `jb_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields_translations`
--

LOCK TABLES `jb_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels`
--

DROP TABLE IF EXISTS `jb_degree_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels`
--

LOCK TABLES `jb_degree_levels` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels` DISABLE KEYS */;
INSERT INTO `jb_degree_levels` VALUES (1,'Non-Matriculation',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'Matriculation/O-Level',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'Intermediate/A-Level',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'Bachelors',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Masters',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(6,'MPhil/MS',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(7,'PHD/Doctorate',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(8,'Certification',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(9,'Diploma',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(10,'Short Course',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27');
/*!40000 ALTER TABLE `jb_degree_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels_translations`
--

DROP TABLE IF EXISTS `jb_degree_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels_translations`
--

LOCK TABLES `jb_degree_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types`
--

DROP TABLE IF EXISTS `jb_degree_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_level_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types`
--

LOCK TABLES `jb_degree_types` WRITE;
/*!40000 ALTER TABLE `jb_degree_types` DISABLE KEYS */;
INSERT INTO `jb_degree_types` VALUES (1,'Matric in Arts',2,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'Matric in Science',2,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'O-Levels',2,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'A-Levels',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Faculty of Arts',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(6,'Faculty of Science (Pre-medical)',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(7,'Faculty of Science (Pre-Engineering)',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(8,'Intermediate in Computer Science',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(9,'Intermediate in Commerce',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(10,'Intermediate in General Science',3,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(11,'Bachelors in Arts',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(12,'Bachelors in Architecture',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(13,'Bachelors in Business Administration',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(14,'Bachelors in Commerce',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(15,'Bachelors of Dental Surgery',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(16,'Bachelors of Education',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(17,'Bachelors in Engineering',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(18,'Bachelors in Pharmacy',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(19,'Bachelors in Science',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(20,'Bachelors of Science in Nursing (Registered Nursing)',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(21,'Bachelors in Law',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(22,'Bachelors in Technology',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(23,'BCS/BS',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(24,'Doctor of Veterinary Medicine',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(25,'MBBS',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(26,'Post Registered Nursing B.S.',4,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(27,'Masters in Arts',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(28,'Masters in Business Administration',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(29,'Masters in Commerce',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(30,'Masters of Education',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(31,'Masters in Law',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(32,'Masters in Science',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(33,'Executive Masters in Business Administration',5,0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27');
/*!40000 ALTER TABLE `jb_degree_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types_translations`
--

DROP TABLE IF EXISTS `jb_degree_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types_translations`
--

LOCK TABLES `jb_degree_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas`
--

DROP TABLE IF EXISTS `jb_functional_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas`
--

LOCK TABLES `jb_functional_areas` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas` DISABLE KEYS */;
INSERT INTO `jb_functional_areas` VALUES (1,'Accountant',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'Accounts, Finance &amp; Financial Services',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'Admin',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'Admin Operation',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Administration',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(6,'Administration Clerical',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(7,'Advertising',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(8,'Advertising',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(9,'Advertisement',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(10,'Architects &amp; Construction',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(11,'Architecture',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(12,'Bank Operation',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(13,'Business Development',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(14,'Business Management',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(15,'Business Systems Analyst',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(16,'Clerical',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(17,'Client Services &amp; Customer Support',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(18,'Computer Hardware',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(19,'Computer Networking',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(20,'Consultant',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(21,'Content Writer',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(22,'Corporate Affairs',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(23,'Creative Design',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(24,'Creative Writer',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(25,'Customer Support',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(26,'Data Entry',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(27,'Data Entry Operator',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(28,'Database Administration (DBA)',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(29,'Development',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(30,'Distribution &amp; Logistics',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(31,'Education &amp; Training',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(32,'Electronics Technician',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(33,'Engineering',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(34,'Engineering Construction',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(35,'Executive Management',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(36,'Executive Secretary',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(37,'Field Operations',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(38,'Front Desk Clerk',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(39,'Front Desk Officer',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(40,'Graphic Design',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(41,'Hardware',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(42,'Health &amp; Medicine',0,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(43,'Health &amp; Safety',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(44,'Health Care',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(45,'Health Related',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(46,'Hotel Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(47,'Hotel/Restaurant Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(48,'HR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(49,'Human Resources',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(50,'Import &amp; Export',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(51,'Industrial Production',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(52,'Installation &amp; Repair',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(53,'Interior Designers &amp; Architects',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(54,'Intern',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(55,'Internship',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(56,'Investment Operations',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(57,'IT Security',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(58,'IT Systems Analyst',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(59,'Legal &amp; Corporate Affairs',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(60,'Legal Affairs',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(61,'Legal Research',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(62,'Logistics &amp; Warehousing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(63,'Maintenance/Repair',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(64,'Management Consulting',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(65,'Management Information System (MIS)',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(66,'Managerial',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(67,'Manufacturing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(68,'Manufacturing &amp; Operations',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(69,'Marketing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(70,'Marketing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(71,'Media - Print &amp; Electronic',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(72,'Media &amp; Advertising',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(73,'Medical',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(74,'Medicine',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(75,'Merchandising',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(76,'Merchandising &amp; Product Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(77,'Monitoring &amp; Evaluation (M&amp;E)',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(78,'Network Administration',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(79,'Network Operation',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(80,'Online Advertising',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(81,'Online Marketing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(82,'Operations',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(83,'Planning',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(84,'Planning &amp; Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(85,'PR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(86,'Print Media',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(87,'Printing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(88,'Procurement',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(89,'Product Developer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(90,'Product Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(91,'Product Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(92,'Product Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(93,'Production',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(94,'Production &amp; Quality Control',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(95,'Project Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(96,'Project Management Consultant',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(97,'Public Relations',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(98,'QA',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(99,'QC',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(100,'Qualitative Research',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(101,'Quality Assurance (QA)',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(102,'Quality Control',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(103,'Quality Inspection',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(104,'Recruiting',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(105,'Recruitment',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(106,'Repair &amp; Overhaul',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(107,'Research &amp; Development (R&amp;D)',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(108,'Research &amp; Evaluation',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(109,'Research &amp; Fellowships',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(110,'Researcher',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(111,'Restaurant Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(112,'Retail',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(113,'Retail &amp; Wholesale',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(114,'Retail Buyer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(115,'Retail Buying',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(116,'Retail Merchandising',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(117,'Safety &amp; Environment',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(118,'Sales',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(119,'Sales &amp; Business Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(120,'Sales Support',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(121,'Search Engine Optimization (SEO)',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(122,'Secretarial, Clerical &amp; Front Office',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(123,'Security',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(124,'Security &amp; Environment',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(125,'Security Guard',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(126,'SEM',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(127,'SMO',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(128,'Software &amp; Web Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(129,'Software Engineer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(130,'Software Testing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(131,'Stores &amp; Warehousing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(132,'Supply Chain',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(133,'Supply Chain Management',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(134,'Systems Analyst',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(135,'Teachers/Education, Training &amp; Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(136,'Technical Writer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(137,'Tele Sale Representative',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(138,'Telemarketing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(139,'Training &amp; Development',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(140,'Transportation &amp; Warehousing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(141,'TSR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(142,'Typing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(143,'Warehousing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(144,'Web Developer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(145,'Web Marketing',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(146,'Writer',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(147,'PR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(148,'QA',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(149,'QC',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(150,'SEM',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(151,'SMO',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(152,'TSR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(153,'HR',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(154,'QA',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(155,'QC',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28'),(156,'SEM',0,0,'published','2024-05-22 23:56:28','2024-05-22 23:56:28');
/*!40000 ALTER TABLE `jb_functional_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas_translations`
--

DROP TABLE IF EXISTS `jb_functional_areas_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_functional_areas_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_functional_areas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas_translations`
--

LOCK TABLES `jb_functional_areas_translations` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_functional_areas_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoice_items`
--

DROP TABLE IF EXISTS `jb_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoice_items`
--

LOCK TABLES `jb_invoice_items` WRITE;
/*!40000 ALTER TABLE `jb_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoices`
--

DROP TABLE IF EXISTS `jb_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_invoices_code_unique` (`code`),
  KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `jb_invoices_payment_id_index` (`payment_id`),
  KEY `jb_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoices`
--

LOCK TABLES `jb_invoices` WRITE;
/*!40000 ALTER TABLE `jb_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences`
--

DROP TABLE IF EXISTS `jb_job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences`
--

LOCK TABLES `jb_job_experiences` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences` DISABLE KEYS */;
INSERT INTO `jb_job_experiences` VALUES (1,'Fresh',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(2,'Less Than 1 Year',1,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(3,'1 Year',2,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(4,'2 Year',3,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(5,'3 Year',4,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(6,'4 Year',5,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(7,'5 Year',6,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(8,'6 Year',7,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(9,'7 Year',8,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(10,'8 Year',9,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(11,'9 Year',10,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(12,'10 Year',11,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29');
/*!40000 ALTER TABLE `jb_job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences_translations`
--

DROP TABLE IF EXISTS `jb_job_experiences_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_experiences_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_experiences_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences_translations`
--

LOCK TABLES `jb_job_experiences_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_experiences_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts`
--

DROP TABLE IF EXISTS `jb_job_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts`
--

LOCK TABLES `jb_job_shifts` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts` DISABLE KEYS */;
INSERT INTO `jb_job_shifts` VALUES (1,'First Shift (Day)',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(2,'Second Shift (Afternoon)',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(3,'Third Shift (Night)',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(4,'Rotating',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29');
/*!40000 ALTER TABLE `jb_job_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts_translations`
--

DROP TABLE IF EXISTS `jb_job_shifts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_shifts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_shifts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts_translations`
--

LOCK TABLES `jb_job_shifts_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_shifts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills`
--

DROP TABLE IF EXISTS `jb_job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills`
--

LOCK TABLES `jb_job_skills` WRITE;
/*!40000 ALTER TABLE `jb_job_skills` DISABLE KEYS */;
INSERT INTO `jb_job_skills` VALUES (1,'JavaScript',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(2,'PHP',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(3,'Python',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(4,'Laravel',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(5,'CakePHP',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(6,'WordPress',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(7,'Flutter',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(8,'FilamentPHP',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(9,'React.js',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29');
/*!40000 ALTER TABLE `jb_job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills_translations`
--

DROP TABLE IF EXISTS `jb_job_skills_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_skills_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills_translations`
--

LOCK TABLES `jb_job_skills_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_skills_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_skills_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types`
--

DROP TABLE IF EXISTS `jb_job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types`
--

LOCK TABLES `jb_job_types` WRITE;
/*!40000 ALTER TABLE `jb_job_types` DISABLE KEYS */;
INSERT INTO `jb_job_types` VALUES (1,'Contract',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(2,'Freelance',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(3,'Full Time',0,1,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(4,'Internship',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29'),(5,'Part Time',0,0,'published','2024-05-22 23:56:29','2024-05-22 23:56:29');
/*!40000 ALTER TABLE `jb_job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types_translations`
--

DROP TABLE IF EXISTS `jb_job_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types_translations`
--

LOCK TABLES `jb_job_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs`
--

DROP TABLE IF EXISTS `jb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `apply_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `is_freelance` tinyint unsigned NOT NULL DEFAULT '0',
  `career_level_id` bigint unsigned DEFAULT NULL,
  `salary_from` decimal(15,2) unsigned DEFAULT NULL,
  `salary_to` decimal(15,2) unsigned DEFAULT NULL,
  `salary_range` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hour',
  `currency_id` bigint unsigned DEFAULT NULL,
  `degree_level_id` bigint unsigned DEFAULT NULL,
  `job_shift_id` bigint unsigned DEFAULT NULL,
  `job_experience_id` bigint unsigned DEFAULT NULL,
  `functional_area_id` bigint unsigned DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_positions` int unsigned NOT NULL DEFAULT '1',
  `expire_date` date DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int unsigned NOT NULL DEFAULT '0',
  `number_of_applied` int unsigned NOT NULL DEFAULT '0',
  `hide_company` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `external_apply_clicks` int unsigned NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs`
--

LOCK TABLES `jb_jobs` WRITE;
/*!40000 ALTER TABLE `jb_jobs` DISABLE KEYS */;
INSERT INTO `jb_jobs` VALUES (1,'UI / UX Designer full-time','Consequatur atque quia facilis eos recusandae recusandae est. Facilis quas omnis nihil. Ex et atque accusantium veritatis iste et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,5,5,5,0,2,7900.00,16000.00,'hourly',1,5,1,5,40,0,4,'2024-06-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.782802','-76.528584',0,0,0,0,'published','approved','2024-03-30 13:30:04','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(2,'Full Stack Engineer','Rerum nulla necessitatibus natus explicabo excepturi non. Ut autem ea ut reiciendis ipsam dolorem. Maiores laboriosam iusto laudantium. Dolorum reprehenderit vel debitis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','https://google.com',1,NULL,6,6,6,0,3,800.00,2100.00,'monthly',1,9,3,4,111,0,8,'2024-07-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.870866','-76.718399',0,0,1,1,'published','approved','2024-05-22 20:38:02','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(3,'Java Software Engineer','Itaque culpa laborum qui quo aut omnis sed non. Et tempore labore rem. Harum fugit libero qui voluptas dolore enim. Earum ut nesciunt dolorum sunt quo.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,4,5800.00,14100.00,'weekly',0,8,1,3,117,0,3,'2024-07-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.727686','-75.766731',0,0,1,1,'published','approved','2024-03-28 03:54:12','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(4,'Digital Marketing Manager','Ex sint fugit rerum explicabo qui. Qui eos soluta quod sit. Quibusdam doloremque consequuntur esse error dolor delectus dolorem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,1,1,1,0,1,4600.00,9400.00,'weekly',1,5,3,1,133,0,8,'2024-05-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.153782','-74.8084',0,0,0,0,'published','approved','2024-04-09 02:53:46','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(5,'Frontend Developer','Qui adipisci eaque atque cupiditate. Repellendus quia ducimus ea aut aut quas consequatur eveniet. Facilis eum repudiandae quia temporibus velit consectetur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,2,2,2,0,5,4100.00,6400.00,'daily',0,6,3,5,86,0,4,'2024-06-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.314689','-75.085169',0,0,1,0,'published','approved','2024-05-01 13:58:23','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(6,'React Native Web Developer','Cumque quas sapiente dolor eveniet aut. Omnis explicabo repellat reiciendis aut quo. Impedit praesentium a reiciendis dolorem harum. Tenetur perspiciatis sequi pariatur optio qui nobis dolorem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,4,4,4,0,1,5800.00,6800.00,'yearly',0,1,1,5,122,0,8,'2024-07-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.895246','-76.203867',0,0,0,1,'published','approved','2024-04-10 14:19:28','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(7,'Senior System Engineer','Voluptas porro at voluptates labore possimus perspiciatis. Laboriosam in eum harum aut dicta et. Illo eius ad sunt placeat et et. Aliquam architecto nihil voluptatum eligendi dolores.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,2,2,2,0,5,1300.00,3000.00,'weekly',0,8,2,3,136,0,5,'2024-06-30',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.739256','-75.200768',0,0,0,0,'published','approved','2024-05-08 21:47:15','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(8,'Products Manager','Nam ut possimus repudiandae. Voluptate ut dignissimos debitis ut ut hic. Vero omnis totam impedit reprehenderit eum. Numquam dolores in quia optio repellat aut. Vero ab velit magni dolorem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,2,2,2,0,3,4300.00,11800.00,'monthly',0,1,4,3,127,0,4,'2024-07-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.473623','-75.612612',0,0,1,1,'published','approved','2024-03-26 13:20:20','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(9,'Lead Quality Control QA','Expedita non consequatur qui placeat quod vel. Voluptas ex et temporibus vero. In iusto saepe enim corrupti odio porro cupiditate. Omnis vero voluptas quis labore consectetur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,6,6,6,0,2,5000.00,12800.00,'hourly',1,2,2,4,57,0,3,'2024-06-07',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.650068','-76.403737',0,0,0,0,'published','approved','2024-04-18 09:44:38','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(10,'Principal Designer, Design Systems','In omnis aut sunt corrupti. Iste voluptatem neque minus omnis repudiandae est voluptatem necessitatibus. Esse debitis et corporis. Quibusdam nulla sed eaque repudiandae quia cupiditate.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,1,1,1,0,2,7300.00,14600.00,'hourly',0,4,4,1,2,0,10,'2024-07-04',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.772383','-75.651661',0,0,1,0,'published','approved','2024-05-01 05:30:29','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(11,'DevOps Architect','Quidem harum ab aut unde. Dolores sapiente ducimus quae repudiandae nisi. Voluptate iure libero labore tempore doloremque. Magni est tempora vel qui et dolores esse.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,3,5600.00,10900.00,'monthly',1,4,4,2,25,0,3,'2024-06-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.971273','-75.933',0,0,0,1,'published','approved','2024-05-05 10:59:21','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(12,'Senior Software Engineer, npm CLI','Sit illo iure soluta minima ullam sint. Quos animi saepe voluptatem commodi repellendus ea. Earum odio laudantium voluptatem aut rerum quos.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,5,5,5,0,5,6000.00,8100.00,'weekly',1,1,2,5,155,0,5,'2024-07-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.975444','-76.133152',0,0,0,1,'published','approved','2024-04-11 04:52:14','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(13,'Senior Systems Engineer','Quia dolor veritatis illo blanditiis quo repellat. Id nobis ad ex consequatur. Vitae temporibus voluptas pariatur laborum eligendi atque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,5,5,5,0,5,3200.00,12900.00,'hourly',0,3,1,1,153,0,7,'2024-06-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.719666','-76.017088',0,0,1,1,'published','approved','2024-04-25 08:40:16','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(14,'Software Engineer Actions Platform','Nesciunt quae et labore esse. Magnam facere ut officiis dolores officia accusamus temporibus. Exercitationem laborum nulla quos. Consequatur amet et et sapiente doloremque cum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,2,2,2,0,5,600.00,7400.00,'hourly',1,8,1,5,32,0,6,'2024-06-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.473623','-75.612612',0,0,1,1,'published','approved','2024-04-28 10:32:15','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(15,'Staff Engineering Manager, Actions','Ut veritatis voluptatem vero dolorum. Non reiciendis quo quia cupiditate ipsam tempora ratione. Molestiae quibusdam harum architecto.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,2,4100.00,13500.00,'yearly',1,5,3,3,17,0,2,'2024-06-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,0,0,'published','approved','2024-05-22 10:43:31','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(16,'Staff Engineering Manager: Actions Runtime','Nam et illum sint dolorem illo dolores et. Dolores dolores est sapiente illo quisquam nihil eos. Rerum quia quidem rerum non voluptate a aut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,6,6,6,0,3,6100.00,9700.00,'daily',0,10,2,3,11,0,9,'2024-07-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.679561','-74.957168',0,0,1,1,'published','approved','2024-05-02 09:47:41','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(17,'Staff Engineering Manager, Packages','Eos ut est corporis enim quod sed. Earum rem aut earum dolorum. Voluptate dignissimos quae aut ut occaecati aperiam in. Sit aut velit blanditiis fugit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,6,6,6,0,1,7400.00,8000.00,'weekly',1,8,1,1,17,0,8,'2024-06-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.851757','-76.255807',0,0,0,0,'published','approved','2024-05-01 05:37:05','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(18,'Staff Software Engineer','Velit veritatis vitae qui omnis iure aut. Aperiam harum placeat ea nihil molestiae eligendi explicabo. Eligendi et ut nisi. Et ullam nostrum nihil rerum ea sequi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',19,NULL,5,5,5,0,4,700.00,2900.00,'monthly',1,4,4,4,2,0,5,'2024-06-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.771417','-75.87558',0,0,0,0,'published','approved','2024-05-14 13:44:22','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(19,'Systems Software Engineer','Cupiditate quo et et libero. Incidunt ab fuga qui sunt est. Odit quibusdam delectus nulla quam et. Repudiandae tenetur officia qui ut. Incidunt et nobis repudiandae quia.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,3,6700.00,10000.00,'yearly',0,8,1,3,69,0,9,'2024-06-03',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.727686','-75.766731',0,0,0,0,'published','approved','2024-03-29 17:44:28','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(20,'Senior Compensation Analyst','Est aliquid veritatis esse debitis at debitis iusto. Deleniti qui enim est sit officia sit sed. Et cum molestiae deleniti et facere. Deleniti saepe quos vitae sed qui nulla est ut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,2,2,2,0,1,3300.00,12200.00,'hourly',0,6,2,5,118,0,4,'2024-07-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.473623','-75.612612',0,0,1,0,'published','approved','2024-04-10 21:21:21','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(21,'Senior Accessibility Program Manager','Sed provident quo nulla et et praesentium. Est eum qui vel consequatur omnis voluptas corrupti. Delectus molestiae qui vitae autem voluptatem. Eos magnam alias animi repellat dignissimos ipsa autem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,5,5,5,0,4,2000.00,11800.00,'yearly',0,4,3,1,47,0,4,'2024-06-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.975444','-76.133152',0,0,1,0,'published','approved','2024-05-20 23:47:16','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(22,'Analyst Relations Manager, Application Security','Dolores eius quia in. Minima molestias atque est et velit. Vel et impedit et animi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,2,2,2,0,3,2600.00,5400.00,'daily',0,10,2,2,140,0,5,'2024-07-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.739256','-75.200768',0,0,1,1,'published','approved','2024-03-26 19:36:17','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(23,'Senior Enterprise Advocate, EMEA','Minima alias aut consequuntur dignissimos. Dolor rerum facilis perspiciatis omnis. Aperiam dolores aut et. Quia qui et quia enim reprehenderit alias itaque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,5,5,5,0,4,5600.00,10500.00,'hourly',0,1,3,1,93,0,4,'2024-06-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.722492','-75.357035',0,0,1,0,'published','approved','2024-04-04 06:07:20','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(24,'Deal Desk Manager','Repudiandae adipisci ut ut sit ipsam repellendus veniam. Quia necessitatibus soluta sed ea. Numquam quia fugiat dolore tenetur cupiditate ut in.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,6,6,6,0,3,3300.00,9600.00,'hourly',0,2,1,5,110,0,5,'2024-06-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.851757','-76.255807',0,0,1,0,'published','approved','2024-05-03 22:48:32','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(25,'Director, Revenue Compensation','Dolorum nam laboriosam et explicabo ipsam mollitia nihil. Voluptas aperiam aut omnis porro quidem. Est quis earum rem vel blanditiis et. Laborum dicta tempore nam soluta officia hic nihil.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',19,NULL,5,5,5,0,2,900.00,9500.00,'yearly',1,8,1,3,137,0,6,'2024-06-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.771417','-75.87558',0,0,1,1,'published','approved','2024-05-07 14:16:33','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(26,'Program Manager','Nihil molestias veniam odit qui soluta commodi. Voluptas animi fuga non dolore dicta. Commodi et nihil expedita dolor est ea.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,2,2,2,0,5,4900.00,9200.00,'daily',1,6,1,4,124,0,5,'2024-06-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.314689','-75.085169',0,0,0,0,'published','approved','2024-04-09 02:19:38','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(27,'Sr. Manager, Deal Desk - INTL','Odit quam voluptatem iusto aut. Dolor sint consequatur ea totam tempore. Possimus numquam eaque et non. Ipsa occaecati et nobis voluptatem incidunt in at pariatur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,6,6,6,0,2,6100.00,12600.00,'monthly',0,10,4,2,68,0,5,'2024-06-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.679561','-74.957168',0,0,0,1,'published','approved','2024-04-20 10:10:06','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(28,'Senior Director, Product Management, Actions Runners and Compute Services','A ut aliquam ea dolorem odit. Est praesentium distinctio soluta dicta voluptas molestiae ducimus. Provident quod velit qui accusantium. Inventore ut vel maxime odit porro corrupti.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,6,6,6,0,4,5700.00,11200.00,'monthly',0,5,3,3,2,0,8,'2024-07-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.851757','-76.255807',0,0,0,0,'published','approved','2024-04-30 17:45:25','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(29,'Alliances Director','Cum quis sit dolorem aut quos vero. Ab veritatis et quo architecto quas consequuntur dicta et. Dolor praesentium quibusdam dolorum hic autem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,4,4,4,0,1,2800.00,6800.00,'yearly',1,2,1,1,21,0,2,'2024-06-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.632188','-75.995094',0,0,1,1,'published','approved','2024-05-15 20:34:54','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(30,'Corporate Sales Representative','Debitis voluptatem voluptatum earum minus. Voluptatem sequi quo inventore qui quam totam quas non. Nostrum occaecati dolor voluptates voluptatem soluta. Exercitationem saepe cupiditate aliquam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,6,6,6,0,3,8200.00,17500.00,'weekly',1,10,3,5,21,0,8,'2024-06-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.851757','-76.255807',0,0,1,0,'published','approved','2024-05-15 07:02:38','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(31,'Country Leader','Sunt est facere quas ut harum non quam. Porro earum ea eos quisquam voluptatem et aut. Qui temporibus ut sed blanditiis. Expedita dicta explicabo et est. Voluptate et sit nisi autem et animi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,3,9800.00,11000.00,'weekly',1,9,3,3,94,0,8,'2024-07-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,0,0,'published','approved','2024-04-24 00:40:31','2024-05-22 23:56:30',NULL,NULL,NULL,NULL),(32,'Customer Success Architect','Nemo aperiam labore doloribus velit repudiandae deserunt et. Quo ex perferendis et repellat in et molestiae. Est incidunt libero rerum facilis sunt non ea.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,5,4900.00,10500.00,'monthly',0,1,3,3,3,0,10,'2024-06-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.727686','-75.766731',0,0,0,1,'published','approved','2024-05-02 12:56:45','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(33,'DevOps Account Executive - US Public Sector','Optio nam natus repudiandae sunt facere officia. Minus odit molestiae in in repellat.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,6,6,6,0,5,3800.00,6700.00,'yearly',1,1,3,3,15,0,10,'2024-07-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.650068','-76.403737',0,0,1,1,'published','approved','2024-03-26 22:50:02','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(34,'Enterprise Account Executive','Est assumenda omnis nisi quas velit distinctio. Quo ea atque est iste beatae. Quisquam error fuga sed architecto voluptatibus. Aut commodi blanditiis quae consequatur minus nemo.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,1,1,1,0,1,2300.00,11900.00,'weekly',1,8,2,4,52,0,3,'2024-07-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.772383','-75.651661',0,0,0,0,'published','approved','2024-04-05 21:26:20','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(35,'Senior Engineering Manager, Product Security Engineering - Paved Paths','Ut aut placeat qui quae eum. Aperiam porro voluptatem aliquid. Illo qui nemo commodi ea alias quidem molestiae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,2,2,2,0,5,1200.00,9600.00,'monthly',0,10,3,3,7,0,5,'2024-06-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.314689','-75.085169',0,0,0,1,'published','approved','2024-04-15 04:58:44','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(36,'Customer Reliability Engineer III','Quia sint consequuntur numquam eius. Eaque velit ab qui aut ipsam quidem id occaecati. Magnam quaerat atque qui voluptatem laborum labore tempora.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,2,1000.00,4200.00,'weekly',1,4,1,1,106,0,4,'2024-06-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.727686','-75.766731',0,0,0,0,'published','approved','2024-04-12 18:33:27','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(37,'Support Engineer (Enterprise Support Japanese)','Inventore quia dolorem et harum excepturi. Tenetur temporibus iure quia eum. Et culpa omnis cupiditate laudantium aperiam excepturi rerum esse. Repellendus a vero sit reprehenderit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,5,8400.00,9000.00,'weekly',0,6,4,1,2,0,6,'2024-07-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.971273','-75.933',0,0,1,0,'published','approved','2024-04-03 18:26:57','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(38,'Technical Partner Manager','Corporis nulla voluptas necessitatibus et enim ipsa non. Nihil est voluptatem sed nam. Et libero est optio aut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,5,5,5,0,5,7100.00,9600.00,'weekly',0,3,1,4,93,0,9,'2024-07-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.975444','-76.133152',0,0,0,1,'published','approved','2024-03-23 20:23:23','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(39,'Sr Manager, Inside Account Management','Ut eaque error similique perspiciatis. Eum velit autem quo voluptates. Et et dolor non delectus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,6,6,6,0,4,1900.00,9900.00,'yearly',1,9,4,5,137,0,2,'2024-06-10',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.679561','-74.957168',0,0,0,1,'published','approved','2024-04-08 13:57:12','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(40,'Services Sales Representative','Eveniet incidunt consequatur sit. Ipsam similique qui aut officia quia doloremque voluptas. Eos qui possimus nemo. Voluptatem nobis id non a accusamus accusamus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,2,7400.00,17200.00,'daily',1,1,3,3,117,0,5,'2024-05-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,1,1,'published','approved','2024-04-15 02:15:29','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(41,'Services Delivery Manager','Recusandae alias reiciendis odio qui non vitae quo. Et pariatur velit temporibus ut voluptas ut. Provident labore modi eaque reprehenderit fugiat laudantium.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,4,4,4,0,4,8200.00,15300.00,'yearly',1,6,2,1,37,0,8,'2024-06-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.895246','-76.203867',0,0,0,0,'published','approved','2024-04-23 15:36:17','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(42,'Senior Solutions Engineer','Quia fugit quibusdam ullam laborum est. Officiis velit quia et asperiores sit. Ut iste qui placeat quam ipsam. Et voluptatem est rerum error minima voluptatum recusandae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,1,1,1,0,1,7300.00,12500.00,'weekly',1,9,4,1,155,0,5,'2024-07-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.153782','-74.8084',0,0,1,1,'published','approved','2024-03-29 14:21:17','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(43,'Senior Service Delivery Engineer','Magnam exercitationem et consequatur autem. Alias doloribus iusto dolores aspernatur iure. Dolore est itaque et autem nihil impedit similique. Praesentium necessitatibus nam iure ducimus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,1,1500.00,6000.00,'daily',0,3,3,3,17,0,3,'2024-07-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,1,1,'published','approved','2024-05-14 17:16:25','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(44,'Senior Director, Global Sales Development','Voluptas modi eum rerum veritatis. Et asperiores eveniet et debitis. Sapiente voluptatibus est tempore.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,4,4,4,0,5,7800.00,9700.00,'yearly',0,6,2,1,9,0,2,'2024-06-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.632188','-75.995094',0,0,1,0,'published','approved','2024-04-12 07:06:48','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(45,'Partner Program Manager','Adipisci non sint iusto. Aliquid magni pariatur quis id ullam odit labore. Sapiente impedit sed autem iure.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,2,9900.00,16600.00,'monthly',1,7,2,1,9,0,3,'2024-07-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,1,1,'published','approved','2024-05-08 10:25:28','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(46,'Principal Cloud Solutions Engineer','Voluptatem nesciunt aut velit adipisci nesciunt. Doloribus voluptatem debitis perferendis id suscipit asperiores ipsa suscipit. Voluptatem minima consequatur ea omnis vitae aut eum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,4,8500.00,10300.00,'yearly',1,1,4,4,108,0,6,'2024-06-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.971273','-75.933',0,0,0,1,'published','approved','2024-04-01 23:15:45','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(47,'Senior Cloud Solutions Engineer','Rerum assumenda iste veritatis quo. Ut debitis amet inventore doloremque. Expedita harum voluptatem veniam sed.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,5,5,5,0,3,9000.00,14200.00,'hourly',0,2,2,4,150,0,9,'2024-06-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.719666','-76.017088',0,0,1,1,'published','approved','2024-05-12 13:25:39','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(48,'Senior Customer Success Manager','Id excepturi aperiam vitae. Culpa dignissimos quaerat eos quasi ad et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,4,4,4,0,1,3300.00,4800.00,'monthly',0,6,4,4,150,0,3,'2024-06-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.895246','-76.203867',0,0,0,0,'published','approved','2024-04-30 12:45:25','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(49,'Inside Account Manager','Aspernatur exercitationem et et eum est in est. Dignissimos aut totam voluptatibus veritatis. Doloremque vero temporibus velit qui pariatur ducimus aut veritatis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,2,2,2,0,2,4300.00,8700.00,'hourly',0,4,2,5,121,0,9,'2024-07-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.834418','-75.681339',0,0,1,0,'published','approved','2024-05-12 10:07:51','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(50,'UX Jobs Board','Distinctio corrupti et nesciunt libero ab. Explicabo minus animi aliquam rerum. Et tempora non corporis voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,6,6,6,0,2,3700.00,9500.00,'yearly',0,7,1,4,14,0,9,'2024-07-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.650068','-76.403737',0,0,1,1,'published','approved','2024-04-13 09:41:15','2024-05-22 23:56:31',NULL,NULL,NULL,NULL),(51,'Senior Laravel Developer (TALL Stack)','Et laboriosam minima aut est facilis error accusamus nulla. Odit hic dolorem recusandae nobis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,6,6,6,0,3,9500.00,11700.00,'hourly',0,3,4,4,29,0,10,'2024-06-30',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.785792','-76.634013',0,0,1,0,'published','approved','2024-04-27 00:08:37','2024-05-22 23:56:31',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_categories`
--

DROP TABLE IF EXISTS `jb_jobs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_categories`
--

LOCK TABLES `jb_jobs_categories` WRITE;
/*!40000 ALTER TABLE `jb_jobs_categories` DISABLE KEYS */;
INSERT INTO `jb_jobs_categories` VALUES (1,1),(1,3),(1,10),(2,1),(2,3),(2,9),(3,1),(3,3),(3,9),(4,1),(4,4),(4,9),(5,1),(5,5),(5,7),(6,1),(6,5),(6,10),(7,1),(7,5),(7,10),(8,1),(8,3),(8,9),(9,1),(9,5),(9,9),(10,1),(10,4),(10,10),(11,1),(11,4),(11,7),(12,1),(12,5),(12,6),(13,1),(13,3),(13,8),(14,1),(14,4),(14,8),(15,1),(15,5),(15,6),(16,1),(16,5),(16,10),(17,1),(17,2),(17,7),(18,1),(18,4),(18,9),(19,1),(19,4),(19,9),(20,1),(20,2),(20,7),(21,1),(21,3),(21,7),(22,1),(22,3),(22,8),(23,1),(23,4),(23,7),(24,1),(24,2),(24,10),(25,1),(25,3),(25,6),(26,1),(26,2),(26,6),(27,1),(27,3),(27,9),(28,1),(28,5),(28,6),(29,1),(29,3),(29,6),(30,1),(30,5),(30,9),(31,1),(31,2),(31,7),(32,1),(32,5),(32,9),(33,1),(33,5),(33,9),(34,1),(34,4),(34,7),(35,1),(35,5),(35,9),(36,1),(36,2),(36,10),(37,1),(37,4),(37,10),(38,1),(38,5),(38,10),(39,1),(39,5),(39,8),(40,1),(40,5),(40,10),(41,1),(41,2),(41,8),(42,1),(42,5),(42,10),(43,1),(43,3),(43,9),(44,1),(44,4),(44,8),(45,1),(45,4),(45,8),(46,1),(46,5),(46,10),(47,1),(47,5),(47,9),(48,1),(48,4),(48,6),(49,1),(49,2),(49,9),(50,1),(50,3),(50,10),(51,1),(51,5),(51,8);
/*!40000 ALTER TABLE `jb_jobs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_skills`
--

DROP TABLE IF EXISTS `jb_jobs_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint unsigned NOT NULL,
  `job_skill_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_skills`
--

LOCK TABLES `jb_jobs_skills` WRITE;
/*!40000 ALTER TABLE `jb_jobs_skills` DISABLE KEYS */;
INSERT INTO `jb_jobs_skills` VALUES (1,2),(2,5),(3,6),(4,3),(5,7),(6,3),(7,5),(8,6),(9,3),(10,1),(11,4),(12,5),(13,1),(14,8),(15,5),(16,7),(17,7),(18,8),(19,3),(20,6),(21,2),(22,2),(23,4),(24,9),(25,6),(26,7),(27,7),(28,1),(29,2),(30,4),(31,7),(32,9),(33,4),(34,5),(35,8),(36,6),(37,4),(38,9),(39,2),(40,1),(41,9),(42,9),(43,5),(44,7),(45,4),(46,5),(47,9),(48,4),(49,8),(50,3),(51,8);
/*!40000 ALTER TABLE `jb_jobs_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_tags`
--

DROP TABLE IF EXISTS `jb_jobs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`job_id`,`tag_id`),
  KEY `jb_jobs_tags_job_id_index` (`job_id`),
  KEY `jb_jobs_tags_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_tags`
--

LOCK TABLES `jb_jobs_tags` WRITE;
/*!40000 ALTER TABLE `jb_jobs_tags` DISABLE KEYS */;
INSERT INTO `jb_jobs_tags` VALUES (1,3),(1,7),(2,2),(2,7),(3,3),(3,6),(4,3),(4,7),(5,2),(5,8),(6,3),(6,8),(7,4),(7,8),(8,3),(8,5),(9,1),(9,5),(10,4),(10,8),(11,4),(11,8),(12,4),(12,8),(13,4),(13,8),(14,2),(14,8),(15,4),(15,6),(16,4),(16,7),(17,4),(17,7),(18,4),(18,6),(19,1),(19,7),(20,2),(20,7),(21,2),(21,6),(22,1),(22,7),(23,3),(23,6),(24,2),(24,5),(25,2),(25,8),(26,4),(26,5),(27,3),(27,8),(28,3),(28,7),(29,4),(29,8),(30,2),(30,7),(31,3),(31,8),(32,3),(32,5),(33,1),(33,5),(34,3),(34,5),(35,2),(35,8),(36,2),(36,8),(37,2),(37,6),(38,3),(38,6),(39,2),(39,6),(40,2),(40,6),(41,1),(41,8),(42,4),(42,7),(43,2),(43,8),(44,3),(44,5),(45,3),(45,8),(46,2),(46,5),(47,4),(47,8),(48,3),(48,7),(49,3),(49,8),(50,3),(50,7),(51,1),(51,5);
/*!40000 ALTER TABLE `jb_jobs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_translations`
--

DROP TABLE IF EXISTS `jb_jobs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_jobs_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`jb_jobs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_translations`
--

LOCK TABLES `jb_jobs_translations` WRITE;
/*!40000 ALTER TABLE `jb_jobs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_jobs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_types`
--

DROP TABLE IF EXISTS `jb_jobs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_types` (
  `job_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_types`
--

LOCK TABLES `jb_jobs_types` WRITE;
/*!40000 ALTER TABLE `jb_jobs_types` DISABLE KEYS */;
INSERT INTO `jb_jobs_types` VALUES (1,3),(2,5),(3,4),(4,4),(5,3),(6,4),(7,3),(8,5),(9,5),(10,4),(11,2),(12,4),(13,1),(14,5),(15,3),(16,2),(17,2),(18,4),(19,2),(20,1),(21,5),(22,2),(23,5),(24,2),(25,1),(26,2),(27,1),(28,3),(29,2),(30,1),(31,1),(32,3),(33,4),(34,2),(35,4),(36,5),(37,4),(38,5),(39,2),(40,2),(41,2),(42,5),(43,1),(44,1),(45,3),(46,5),(47,5),(48,1),(49,3),(50,2),(51,1);
/*!40000 ALTER TABLE `jb_jobs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels`
--

DROP TABLE IF EXISTS `jb_language_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels`
--

LOCK TABLES `jb_language_levels` WRITE;
/*!40000 ALTER TABLE `jb_language_levels` DISABLE KEYS */;
INSERT INTO `jb_language_levels` VALUES (1,'Expert',0,0,'published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(2,'Intermediate',0,0,'published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(3,'Beginner',0,0,'published','2024-05-22 23:56:30','2024-05-22 23:56:30');
/*!40000 ALTER TABLE `jb_language_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels_translations`
--

DROP TABLE IF EXISTS `jb_language_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_language_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_language_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels_translations`
--

LOCK TABLES `jb_language_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_language_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_language_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_major_subjects`
--

DROP TABLE IF EXISTS `jb_major_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_major_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_major_subjects`
--

LOCK TABLES `jb_major_subjects` WRITE;
/*!40000 ALTER TABLE `jb_major_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_major_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages`
--

DROP TABLE IF EXISTS `jb_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `account_limit` int unsigned DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages`
--

LOCK TABLES `jb_packages` WRITE;
/*!40000 ALTER TABLE `jb_packages` DISABLE KEYS */;
INSERT INTO `jb_packages` VALUES (1,'Free First Post',0.00,1,0,1,0,1,0,'published','2024-05-22 23:57:01','2024-05-22 23:57:01',NULL),(2,'Single Post',250.00,1,0,1,0,NULL,1,'published','2024-05-22 23:57:01','2024-05-22 23:57:01',NULL),(3,'5 Posts',1000.00,1,20,5,0,NULL,0,'published','2024-05-22 23:57:01','2024-05-22 23:57:01',NULL);
/*!40000 ALTER TABLE `jb_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages_translations`
--

DROP TABLE IF EXISTS `jb_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_packages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages_translations`
--

LOCK TABLES `jb_packages_translations` WRITE;
/*!40000 ALTER TABLE `jb_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_reviews`
--

DROP TABLE IF EXISTS `jb_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_reviews`
--

LOCK TABLES `jb_reviews` WRITE;
/*!40000 ALTER TABLE `jb_reviews` DISABLE KEYS */;
INSERT INTO `jb_reviews` VALUES (1,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',29,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(2,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',47,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(3,'Botble\\JobBoard\\Models\\Account',50,'Botble\\JobBoard\\Models\\Company',8,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(4,'Botble\\JobBoard\\Models\\Account',69,'Botble\\JobBoard\\Models\\Company',7,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(5,'Botble\\JobBoard\\Models\\Account',95,'Botble\\JobBoard\\Models\\Company',19,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(6,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',80,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(7,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',82,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(8,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',16,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(9,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',90,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(10,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',76,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(11,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',12,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(12,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',96,2.00,'Good app, good backup service and support. Good documentation.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(13,'Botble\\JobBoard\\Models\\Account',20,'Botble\\JobBoard\\Models\\Company',1,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(14,'Botble\\JobBoard\\Models\\Account',8,'Botble\\JobBoard\\Models\\Company',10,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(15,'Botble\\JobBoard\\Models\\Account',73,'Botble\\JobBoard\\Models\\Company',15,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(16,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',26,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(17,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',64,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(18,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',39,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(19,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',35,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(20,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',15,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(21,'Botble\\JobBoard\\Models\\Account',27,'Botble\\JobBoard\\Models\\Company',11,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(22,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',41,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(23,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',23,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(24,'Botble\\JobBoard\\Models\\Account',100,'Botble\\JobBoard\\Models\\Company',16,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(25,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',51,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(26,'Botble\\JobBoard\\Models\\Account',76,'Botble\\JobBoard\\Models\\Company',2,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(27,'Botble\\JobBoard\\Models\\Account',64,'Botble\\JobBoard\\Models\\Company',12,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(28,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',44,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(29,'Botble\\JobBoard\\Models\\Account',31,'Botble\\JobBoard\\Models\\Company',2,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(30,'Botble\\JobBoard\\Models\\Account',78,'Botble\\JobBoard\\Models\\Company',3,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(31,'Botble\\JobBoard\\Models\\Account',70,'Botble\\JobBoard\\Models\\Company',14,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(32,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',22,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(33,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',72,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(34,'Botble\\JobBoard\\Models\\Account',40,'Botble\\JobBoard\\Models\\Company',9,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(35,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',77,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(36,'Botble\\JobBoard\\Models\\Account',35,'Botble\\JobBoard\\Models\\Company',14,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(37,'Botble\\JobBoard\\Models\\Account',56,'Botble\\JobBoard\\Models\\Company',19,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(38,'Botble\\JobBoard\\Models\\Account',68,'Botble\\JobBoard\\Models\\Company',9,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(39,'Botble\\JobBoard\\Models\\Account',60,'Botble\\JobBoard\\Models\\Company',16,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(40,'Botble\\JobBoard\\Models\\Account',34,'Botble\\JobBoard\\Models\\Company',7,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(41,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',47,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(42,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',57,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(43,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',60,1.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(44,'Botble\\JobBoard\\Models\\Account',10,'Botble\\JobBoard\\Models\\Company',7,4.00,'Good app, good backup service and support. Good documentation.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(45,'Botble\\JobBoard\\Models\\Account',56,'Botble\\JobBoard\\Models\\Company',10,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(46,'Botble\\JobBoard\\Models\\Account',62,'Botble\\JobBoard\\Models\\Company',8,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(47,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',32,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(48,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',67,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(49,'Botble\\JobBoard\\Models\\Account',68,'Botble\\JobBoard\\Models\\Company',11,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(50,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',74,3.00,'Good app, good backup service and support. Good documentation.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(51,'Botble\\JobBoard\\Models\\Account',22,'Botble\\JobBoard\\Models\\Company',20,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(52,'Botble\\JobBoard\\Models\\Account',2,'Botble\\JobBoard\\Models\\Company',15,2.00,'Clean & perfect source code','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(53,'Botble\\JobBoard\\Models\\Account',99,'Botble\\JobBoard\\Models\\Company',2,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(54,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',33,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(55,'Botble\\JobBoard\\Models\\Account',2,'Botble\\JobBoard\\Models\\Company',8,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(56,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',27,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(57,'Botble\\JobBoard\\Models\\Account',33,'Botble\\JobBoard\\Models\\Company',19,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(58,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',55,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(59,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',33,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(60,'Botble\\JobBoard\\Models\\Account',42,'Botble\\JobBoard\\Models\\Company',11,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(61,'Botble\\JobBoard\\Models\\Account',20,'Botble\\JobBoard\\Models\\Company',12,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(62,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',5,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(63,'Botble\\JobBoard\\Models\\Account',62,'Botble\\JobBoard\\Models\\Company',11,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(64,'Botble\\JobBoard\\Models\\Account',29,'Botble\\JobBoard\\Models\\Company',4,1.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(65,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',51,4.00,'Clean & perfect source code','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(66,'Botble\\JobBoard\\Models\\Account',87,'Botble\\JobBoard\\Models\\Company',15,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(67,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',40,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(68,'Botble\\JobBoard\\Models\\Account',82,'Botble\\JobBoard\\Models\\Company',18,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(69,'Botble\\JobBoard\\Models\\Account',86,'Botble\\JobBoard\\Models\\Company',3,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(70,'Botble\\JobBoard\\Models\\Account',44,'Botble\\JobBoard\\Models\\Company',9,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(71,'Botble\\JobBoard\\Models\\Account',1,'Botble\\JobBoard\\Models\\Company',6,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(72,'Botble\\JobBoard\\Models\\Account',89,'Botble\\JobBoard\\Models\\Company',2,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(73,'Botble\\JobBoard\\Models\\Account',58,'Botble\\JobBoard\\Models\\Company',20,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(74,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',69,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(75,'Botble\\JobBoard\\Models\\Account',50,'Botble\\JobBoard\\Models\\Company',6,1.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(76,'Botble\\JobBoard\\Models\\Account',34,'Botble\\JobBoard\\Models\\Company',17,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(77,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',5,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(78,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',8,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(79,'Botble\\JobBoard\\Models\\Account',23,'Botble\\JobBoard\\Models\\Company',15,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(80,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',37,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(81,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',76,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(82,'Botble\\JobBoard\\Models\\Account',12,'Botble\\JobBoard\\Models\\Company',12,2.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(83,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',60,4.00,'Good app, good backup service and support. Good documentation.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(84,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',74,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(85,'Botble\\JobBoard\\Models\\Account',70,'Botble\\JobBoard\\Models\\Company',12,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(86,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',60,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(87,'Botble\\JobBoard\\Models\\Account',91,'Botble\\JobBoard\\Models\\Company',12,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(88,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',63,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(89,'Botble\\JobBoard\\Models\\Account',12,'Botble\\JobBoard\\Models\\Company',17,5.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(90,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',37,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(91,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',51,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(92,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',92,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(93,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',11,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(94,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',65,5.00,'Best ecommerce CMS online store!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(95,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',17,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(96,'Botble\\JobBoard\\Models\\Account',55,'Botble\\JobBoard\\Models\\Company',17,2.00,'Clean & perfect source code','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(97,'Botble\\JobBoard\\Models\\Account',53,'Botble\\JobBoard\\Models\\Company',8,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(98,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',66,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(99,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',75,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-22 23:57:01','2024-05-22 23:57:01'),(100,'Botble\\JobBoard\\Models\\Account',21,'Botble\\JobBoard\\Models\\Company',9,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-05-22 23:57:01','2024-05-22 23:57:01');
/*!40000 ALTER TABLE `jb_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_saved_jobs`
--

DROP TABLE IF EXISTS `jb_saved_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_saved_jobs`
--

LOCK TABLES `jb_saved_jobs` WRITE;
/*!40000 ALTER TABLE `jb_saved_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_saved_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags`
--

DROP TABLE IF EXISTS `jb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags`
--

LOCK TABLES `jb_tags` WRITE;
/*!40000 ALTER TABLE `jb_tags` DISABLE KEYS */;
INSERT INTO `jb_tags` VALUES (1,'Illustrator','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(2,'Adobe XD','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(3,'Figma','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(4,'Sketch','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(5,'Lunacy','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(6,'PHP','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(7,'Python','','published','2024-05-22 23:56:30','2024-05-22 23:56:30'),(8,'JavaScript','','published','2024-05-22 23:56:30','2024-05-22 23:56:30');
/*!40000 ALTER TABLE `jb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags_translations`
--

DROP TABLE IF EXISTS `jb_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags_translations`
--

LOCK TABLES `jb_tags_translations` WRITE;
/*!40000 ALTER TABLE `jb_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_transactions`
--

DROP TABLE IF EXISTS `jb_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_transactions`
--

LOCK TABLES `jb_transactions` WRITE;
/*!40000 ALTER TABLE `jb_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','0731affcbc153fff0cf68d014c8e1694',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','02175ac4453db26d4738dc5e86b45f2b',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','1911b147b6c41369b1e714d07f8aa42e',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','613fb10266b45e05f51856fb067b652c',3,'Botble\\Menu\\Models\\Menu'),(5,'en_US','f6611eb1e765ffd8a0e0f764f5217d43',4,'Botble\\Menu\\Models\\Menu'),(6,'en_US','c1e4492ac3243f8204806b6df16404d8',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (41,0,'acer','acer',3,'image/png',285,'our-partners/acer.png','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(42,0,'asus','asus',3,'image/png',314,'our-partners/asus.png','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(43,0,'dell','dell',3,'image/png',296,'our-partners/dell.png','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(44,0,'microsoft','microsoft',3,'image/png',287,'our-partners/microsoft.png','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(45,0,'nokia','nokia',3,'image/png',308,'our-partners/nokia.png','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(46,0,'1','1',4,'image/jpeg',9803,'news/1.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(47,0,'10','10',4,'image/jpeg',9803,'news/10.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(48,0,'11','11',4,'image/jpeg',9803,'news/11.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(49,0,'12','12',4,'image/jpeg',9803,'news/12.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(50,0,'13','13',4,'image/jpeg',9803,'news/13.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(51,0,'14','14',4,'image/jpeg',9803,'news/14.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(52,0,'15','15',4,'image/jpeg',9803,'news/15.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(53,0,'16','16',4,'image/jpeg',9803,'news/16.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(54,0,'2','2',4,'image/jpeg',9803,'news/2.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(55,0,'3','3',4,'image/jpeg',9803,'news/3.jpg','[]','2024-05-22 23:56:22','2024-05-22 23:56:22',NULL,'public'),(56,0,'4','4',4,'image/jpeg',9803,'news/4.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(57,0,'5','5',4,'image/jpeg',9803,'news/5.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(58,0,'6','6',4,'image/jpeg',9803,'news/6.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(59,0,'7','7',4,'image/jpeg',9803,'news/7.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(60,0,'8','8',4,'image/jpeg',9803,'news/8.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(61,0,'9','9',4,'image/jpeg',9803,'news/9.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(62,0,'cover-image1','cover-image1',4,'image/png',9803,'news/cover-image1.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(63,0,'cover-image2','cover-image2',4,'image/png',9803,'news/cover-image2.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(64,0,'cover-image3','cover-image3',4,'image/png',9803,'news/cover-image3.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(65,0,'img-news1','img-news1',4,'image/png',9803,'news/img-news1.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(66,0,'img-news2','img-news2',4,'image/png',9803,'news/img-news2.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(67,0,'img-news3','img-news3',4,'image/png',9803,'news/img-news3.png','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(68,0,'1','1',5,'image/jpeg',6977,'galleries/1.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(69,0,'10','10',5,'image/jpeg',9803,'galleries/10.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(70,0,'2','2',5,'image/jpeg',6977,'galleries/2.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(71,0,'3','3',5,'image/jpeg',6977,'galleries/3.jpg','[]','2024-05-22 23:56:23','2024-05-22 23:56:23',NULL,'public'),(72,0,'4','4',5,'image/jpeg',6977,'galleries/4.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(73,0,'5','5',5,'image/jpeg',6977,'galleries/5.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(74,0,'6','6',5,'image/jpeg',6977,'galleries/6.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(75,0,'7','7',5,'image/jpeg',6977,'galleries/7.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(76,0,'8','8',5,'image/jpeg',9803,'galleries/8.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(77,0,'9','9',5,'image/jpeg',9803,'galleries/9.jpg','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(78,0,'widget-banner','widget-banner',6,'image/png',11079,'widgets/widget-banner.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(79,0,'404','404',7,'image/png',10947,'general/404.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(80,0,'android','android',7,'image/png',477,'general/android.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(81,0,'app-store','app-store',7,'image/png',477,'general/app-store.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(82,0,'content','content',7,'image/png',1692,'general/content.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(83,0,'cover-image','cover-image',7,'image/png',8992,'general/cover-image.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(84,0,'customer','customer',7,'image/png',2810,'general/customer.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(85,0,'favicon','favicon',7,'image/png',706,'general/favicon.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(86,0,'finance','finance',7,'image/png',2460,'general/finance.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(87,0,'human','human',7,'image/png',2359,'general/human.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(88,0,'img-about2','img-about2',7,'image/png',36911,'general/img-about2.png','[]','2024-05-22 23:56:24','2024-05-22 23:56:24',NULL,'public'),(89,0,'lightning','lightning',7,'image/png',2768,'general/lightning.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(90,0,'logo-company','logo-company',7,'image/png',3166,'general/logo-company.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(91,0,'logo-light','logo-light',7,'image/png',2352,'general/logo-light.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(92,0,'logo','logo',7,'image/png',2459,'general/logo.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(93,0,'management','management',7,'image/png',1915,'general/management.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(94,0,'marketing','marketing',7,'image/png',2134,'general/marketing.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(95,0,'newsletter-background-image','newsletter-background-image',7,'image/png',9830,'general/newsletter-background-image.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(96,0,'newsletter-image-left','newsletter-image-left',7,'image/png',4177,'general/newsletter-image-left.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(97,0,'newsletter-image-right','newsletter-image-right',7,'image/png',2886,'general/newsletter-image-right.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(98,0,'research','research',7,'image/png',3206,'general/research.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(99,0,'retail','retail',7,'image/png',2874,'general/retail.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(100,0,'security','security',7,'image/png',2986,'general/security.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(101,0,'img-1','img-1',8,'image/png',2377,'authentication/img-1.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(102,0,'img-2','img-2',8,'image/png',5009,'authentication/img-2.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(103,0,'background-cover-candidate','background-cover-candidate',9,'image/png',436821,'pages/background-cover-candidate.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(104,0,'background_breadcrumb','background_breadcrumb',9,'image/png',6111,'pages/background-breadcrumb.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(105,0,'banner-section-search-box','banner-section-search-box',9,'image/png',20501,'pages/banner-section-search-box.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(106,0,'banner1','banner1',9,'image/png',7381,'pages/banner1.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(107,0,'banner2','banner2',9,'image/png',4920,'pages/banner2.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(108,0,'banner3','banner3',9,'image/png',2472,'pages/banner3.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(109,0,'banner4','banner4',9,'image/png',1952,'pages/banner4.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(110,0,'banner5','banner5',9,'image/png',1545,'pages/banner5.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(111,0,'banner6','banner6',9,'image/png',1609,'pages/banner6.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(112,0,'bg-breadcrumb','bg-breadcrumb',9,'image/png',14250,'pages/bg-breadcrumb.png','[]','2024-05-22 23:56:25','2024-05-22 23:56:25',NULL,'public'),(113,0,'bg-cat','bg-cat',9,'image/png',60543,'pages/bg-cat.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(114,0,'bg-left-hiring','bg-left-hiring',9,'image/png',1631,'pages/bg-left-hiring.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(115,0,'bg-newsletter','bg-newsletter',9,'image/png',4587,'pages/bg-newsletter.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(116,0,'bg-right-hiring','bg-right-hiring',9,'image/png',3074,'pages/bg-right-hiring.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(117,0,'controlcard','controlcard',9,'image/png',7404,'pages/controlcard.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(118,0,'home-page-4-banner','home-page-4-banner',9,'image/png',7596,'pages/home-page-4-banner.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(119,0,'icon-bottom-banner','icon-bottom-banner',9,'image/png',274,'pages/icon-bottom-banner.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(120,0,'icon-top-banner','icon-top-banner',9,'image/png',362,'pages/icon-top-banner.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(121,0,'img-banner','img-banner',9,'image/png',10542,'pages/img-banner.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(122,0,'img-chart','img-chart',9,'image/png',7549,'pages/img-chart.png','[]','2024-05-22 23:56:26','2024-05-22 23:56:26',NULL,'public'),(123,0,'img-job-search','img-job-search',9,'image/png',35569,'pages/img-job-search.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(124,0,'img-profile','img-profile',9,'image/png',9177,'pages/img-profile.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(125,0,'img-single','img-single',9,'image/png',13060,'pages/img-single.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(126,0,'img1','img1',9,'image/png',10246,'pages/img1.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(127,0,'job-tools','job-tools',9,'image/png',2216,'pages/job-tools.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(128,0,'left-job-head','left-job-head',9,'image/png',14956,'pages/left-job-head.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(129,0,'newsletter-left','newsletter-left',9,'image/png',4177,'pages/newsletter-left.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(130,0,'newsletter-right','newsletter-right',9,'image/png',2886,'pages/newsletter-right.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(131,0,'planning-job','planning-job',9,'image/png',1623,'pages/planning-job.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(132,0,'right-job-head','right-job-head',9,'image/png',10955,'pages/right-job-head.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(133,0,'facebook','facebook',10,'image/png',795,'socials/facebook.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(134,0,'linkedin','linkedin',10,'image/png',804,'socials/linkedin.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(135,0,'twitter','twitter',10,'image/png',1029,'socials/twitter.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(136,0,'location1','location1',11,'image/png',5149,'locations/location1.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(137,0,'location2','location2',11,'image/png',5921,'locations/location2.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(138,0,'location3','location3',11,'image/png',5276,'locations/location3.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(139,0,'location4','location4',11,'image/png',5259,'locations/location4.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(140,0,'location5','location5',11,'image/png',5140,'locations/location5.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(141,0,'location6','location6',11,'image/png',4891,'locations/location6.png','[]','2024-05-22 23:56:27','2024-05-22 23:56:27',NULL,'public'),(142,0,'1','1',12,'image/png',407,'job-categories/1.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(143,0,'10','10',12,'image/png',407,'job-categories/10.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(144,0,'11','11',12,'image/png',407,'job-categories/11.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(145,0,'12','12',12,'image/png',407,'job-categories/12.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(146,0,'13','13',12,'image/png',407,'job-categories/13.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(147,0,'14','14',12,'image/png',407,'job-categories/14.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(148,0,'15','15',12,'image/png',407,'job-categories/15.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(149,0,'16','16',12,'image/png',407,'job-categories/16.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(150,0,'17','17',12,'image/png',407,'job-categories/17.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(151,0,'18','18',12,'image/png',407,'job-categories/18.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(152,0,'19','19',12,'image/png',407,'job-categories/19.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(153,0,'2','2',12,'image/png',407,'job-categories/2.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(154,0,'3','3',12,'image/png',407,'job-categories/3.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(155,0,'4','4',12,'image/png',407,'job-categories/4.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(156,0,'5','5',12,'image/png',407,'job-categories/5.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(157,0,'6','6',12,'image/png',407,'job-categories/6.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(158,0,'7','7',12,'image/png',407,'job-categories/7.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(159,0,'8','8',12,'image/png',407,'job-categories/8.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(160,0,'9','9',12,'image/png',407,'job-categories/9.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(161,0,'img-cover-1','img-cover-1',12,'image/png',33918,'job-categories/img-cover-1.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(162,0,'img-cover-2','img-cover-2',12,'image/png',33918,'job-categories/img-cover-2.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(163,0,'img-cover-3','img-cover-3',12,'image/png',33918,'job-categories/img-cover-3.png','[]','2024-05-22 23:56:28','2024-05-22 23:56:28',NULL,'public'),(164,0,'1','1',13,'image/png',598,'companies/1.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(165,0,'2','2',13,'image/png',598,'companies/2.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(166,0,'3','3',13,'image/png',598,'companies/3.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(167,0,'4','4',13,'image/png',598,'companies/4.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(168,0,'5','5',13,'image/png',598,'companies/5.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(169,0,'6','6',13,'image/png',598,'companies/6.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(170,0,'7','7',13,'image/png',598,'companies/7.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(171,0,'8','8',13,'image/png',598,'companies/8.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(172,0,'9','9',13,'image/png',598,'companies/9.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(173,0,'company-cover-image','company-cover-image',13,'image/png',8992,'companies/company-cover-image.png','[]','2024-05-22 23:56:29','2024-05-22 23:56:29',NULL,'public'),(174,0,'img1','img1',14,'image/png',5706,'jobs/img1.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(175,0,'img2','img2',14,'image/png',5706,'jobs/img2.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(176,0,'img3','img3',14,'image/png',5706,'jobs/img3.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(177,0,'img4','img4',14,'image/png',5706,'jobs/img4.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(178,0,'img5','img5',14,'image/png',5706,'jobs/img5.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(179,0,'img6','img6',14,'image/png',5706,'jobs/img6.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(180,0,'img7','img7',14,'image/png',5706,'jobs/img7.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(181,0,'img8','img8',14,'image/png',5706,'jobs/img8.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(182,0,'img9','img9',14,'image/png',5706,'jobs/img9.png','[]','2024-05-22 23:56:30','2024-05-22 23:56:30',NULL,'public'),(183,0,'01','01',15,'application/pdf',43496,'resume/01.pdf','[]','2024-05-22 23:56:31','2024-05-22 23:56:31',NULL,'public'),(184,0,'1','1',16,'image/png',3090,'avatars/1.png','[]','2024-05-22 23:56:31','2024-05-22 23:56:31',NULL,'public'),(185,0,'2','2',16,'image/png',2773,'avatars/2.png','[]','2024-05-22 23:56:31','2024-05-22 23:56:31',NULL,'public'),(186,0,'3','3',16,'image/png',2749,'avatars/3.png','[]','2024-05-22 23:56:31','2024-05-22 23:56:31',NULL,'public'),(187,0,'1','1',17,'image/png',395380,'covers/1.png','[]','2024-05-22 23:56:32','2024-05-22 23:56:32',NULL,'public'),(188,0,'2','2',17,'image/png',1308067,'covers/2.png','[]','2024-05-22 23:56:32','2024-05-22 23:56:32',NULL,'public'),(189,0,'3','3',17,'image/png',301502,'covers/3.png','[]','2024-05-22 23:56:32','2024-05-22 23:56:32',NULL,'public'),(190,0,'1','1',18,'image/png',4294,'teams/1.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(191,0,'2','2',18,'image/png',4294,'teams/2.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(192,0,'3','3',18,'image/png',4294,'teams/3.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(193,0,'4','4',18,'image/png',4294,'teams/4.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(194,0,'5','5',18,'image/png',4294,'teams/5.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(195,0,'6','6',18,'image/png',4294,'teams/6.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(196,0,'7','7',18,'image/png',4294,'teams/7.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(197,0,'8','8',18,'image/png',4294,'teams/8.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(198,0,'1','1',19,'image/png',3943,'testimonials/1.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(199,0,'2','2',19,'image/png',3943,'testimonials/2.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(200,0,'3','3',19,'image/png',3943,'testimonials/3.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public'),(201,0,'4','4',19,'image/png',3943,'testimonials/4.png','[]','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (3,0,'our-partners',NULL,'our-partners',0,'2024-05-22 23:56:22','2024-05-22 23:56:22',NULL),(4,0,'news',NULL,'news',0,'2024-05-22 23:56:22','2024-05-22 23:56:22',NULL),(5,0,'galleries',NULL,'galleries',0,'2024-05-22 23:56:23','2024-05-22 23:56:23',NULL),(6,0,'widgets',NULL,'widgets',0,'2024-05-22 23:56:24','2024-05-22 23:56:24',NULL),(7,0,'general',NULL,'general',0,'2024-05-22 23:56:24','2024-05-22 23:56:24',NULL),(8,0,'authentication',NULL,'authentication',0,'2024-05-22 23:56:25','2024-05-22 23:56:25',NULL),(9,0,'pages',NULL,'pages',0,'2024-05-22 23:56:25','2024-05-22 23:56:25',NULL),(10,0,'socials',NULL,'socials',0,'2024-05-22 23:56:27','2024-05-22 23:56:27',NULL),(11,0,'locations',NULL,'locations',0,'2024-05-22 23:56:27','2024-05-22 23:56:27',NULL),(12,0,'job-categories',NULL,'job-categories',0,'2024-05-22 23:56:28','2024-05-22 23:56:28',NULL),(13,0,'companies',NULL,'companies',0,'2024-05-22 23:56:29','2024-05-22 23:56:29',NULL),(14,0,'jobs',NULL,'jobs',0,'2024-05-22 23:56:30','2024-05-22 23:56:30',NULL),(15,0,'resume',NULL,'resume',0,'2024-05-22 23:56:31','2024-05-22 23:56:31',NULL),(16,0,'avatars',NULL,'avatars',0,'2024-05-22 23:56:31','2024-05-22 23:56:31',NULL),(17,0,'covers',NULL,'covers',0,'2024-05-22 23:56:31','2024-05-22 23:56:31',NULL),(18,0,'teams',NULL,'teams',0,'2024-05-22 23:57:02','2024-05-22 23:57:02',NULL),(19,0,'testimonials',NULL,'testimonials',0,'2024-05-22 23:57:02','2024-05-22 23:57:02',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-05-22 23:57:02','2024-05-22 23:57:02');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1','fi fi-rr-home',1,'Home 1',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2','fi fi-rr-home',2,'Home 2',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3','fi fi-rr-home',3,'Home 3',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4','fi fi-rr-home',4,'Home 4',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5','fi fi-rr-home',5,'Home 5',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(7,1,1,6,'Botble\\Page\\Models\\Page','/homepage-6','fi fi-rr-home',6,'Home 6',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(8,1,0,7,'Botble\\Page\\Models\\Page','/jobs',NULL,0,'Find a Job',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(9,1,8,NULL,NULL,'/jobs?layout=grid','fi fi-rr-briefcase',0,'Jobs Grid',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(10,1,8,NULL,NULL,'/jobs','fi fi-rr-briefcase',0,'Jobs List',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(11,1,8,NULL,NULL,'','fi fi-rr-briefcase',0,'Job Details',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(12,1,8,NULL,NULL,'','fi fi-rr-briefcase',0,'Job External',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(13,1,8,NULL,NULL,'','fi fi-rr-briefcase',0,'Job Hide Company',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(14,1,0,8,'Botble\\Page\\Models\\Page','/companies',NULL,0,'Companies',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(15,1,14,8,'Botble\\Page\\Models\\Page','/companies','fi fi-rr-briefcase',0,'Companies',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(16,1,14,NULL,NULL,'','fi fi-rr-info',0,'Company Details',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(17,1,0,9,'Botble\\Page\\Models\\Page','/candidates',NULL,0,'Candidates',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(18,1,17,9,'Botble\\Page\\Models\\Page','/candidates','fi fi-rr-user',0,'Candidates Grid',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(19,1,17,NULL,NULL,'','fi fi-rr-info',0,'Candidate Details',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(20,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(21,1,20,10,'Botble\\Page\\Models\\Page','/about-us','fi fi-rr-star',0,'About Us',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(22,1,20,11,'Botble\\Page\\Models\\Page','/pricing-plan','fi fi-rr-database',0,'Pricing Plan',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(23,1,20,12,'Botble\\Page\\Models\\Page','/contact','fi fi-rr-paper-plane',0,'Contact Us',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(24,1,20,NULL,NULL,'/register','fi fi-rr-user-add',0,'Register',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(25,1,20,NULL,NULL,'/login','fi fi-rr-fingerprint',0,'Sign in',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(26,1,20,NULL,NULL,'/password/request','fi fi-rr-settings',0,'Reset Password',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(27,1,0,13,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(28,1,27,13,'Botble\\Page\\Models\\Page','/blog','fi fi-rr-edit',0,'Blog Grid',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(29,1,27,NULL,NULL,'','fi fi-rr-document-signed',0,'Blog Single',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(30,2,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(31,2,0,NULL,NULL,'#',NULL,0,'Our Team',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(32,2,0,NULL,NULL,'#',NULL,0,'Products',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(33,2,0,12,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(34,3,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Feature',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(35,3,0,11,'Botble\\Page\\Models\\Page','/pricing-plan',NULL,0,'Pricing',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(36,3,0,NULL,NULL,'#',NULL,0,'Credit',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(37,3,0,15,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQ',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(38,4,0,NULL,NULL,'#',NULL,0,'iOS',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(39,4,0,NULL,NULL,'#',NULL,0,'Android',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(40,4,0,NULL,NULL,'#',NULL,0,'Microsoft',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(41,4,0,NULL,NULL,'#',NULL,0,'Desktop',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(42,5,0,14,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(43,5,0,17,'Botble\\Page\\Models\\Page','/terms',NULL,0,'Terms',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02'),(44,5,0,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,0,'FAQ',NULL,'_self',0,'2024-05-22 23:57:02','2024-05-22 23:57:02');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(2,'Resources','resources','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(3,'Community','community','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(4,'Quick links','quick-links','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(5,'More','more','published','2024-05-22 23:57:02','2024-05-22 23:57:02');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',10,'Botble\\Page\\Models\\Page','2024-05-22 23:56:22','2024-05-22 23:56:22'),(2,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',12,'Botble\\Page\\Models\\Page','2024-05-22 23:56:22','2024-05-22 23:56:22'),(3,'cover_image','[\"news\\/cover-image1.png\"]',1,'Botble\\Blog\\Models\\Post','2024-05-22 23:56:23','2024-05-22 23:56:23'),(4,'cover_image','[\"news\\/cover-image2.png\"]',2,'Botble\\Blog\\Models\\Post','2024-05-22 23:56:23','2024-05-22 23:56:23'),(5,'cover_image','[\"news\\/cover-image3.png\"]',3,'Botble\\Blog\\Models\\Post','2024-05-22 23:56:23','2024-05-22 23:56:23'),(6,'icon_image','[\"general\\/content.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(7,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(8,'icon_image','[\"general\\/research.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(9,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(10,'icon_image','[\"general\\/marketing.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(11,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(12,'icon_image','[\"general\\/customer.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(13,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(14,'icon_image','[\"general\\/finance.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(15,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(16,'icon_image','[\"general\\/lightning.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(17,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(18,'icon_image','[\"general\\/human.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(19,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(20,'icon_image','[\"general\\/management.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(21,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(22,'icon_image','[\"general\\/retail.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(23,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(24,'icon_image','[\"general\\/security.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(25,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-05-22 23:56:29','2024-05-22 23:56:29'),(26,'cover_image','[\"companies\\/company-cover-image.png\"]',1,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(27,'cover_image','[\"companies\\/company-cover-image.png\"]',2,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(28,'cover_image','[\"companies\\/company-cover-image.png\"]',3,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(29,'cover_image','[\"companies\\/company-cover-image.png\"]',4,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(30,'cover_image','[\"companies\\/company-cover-image.png\"]',5,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(31,'cover_image','[\"companies\\/company-cover-image.png\"]',6,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(32,'cover_image','[\"companies\\/company-cover-image.png\"]',7,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(33,'cover_image','[\"companies\\/company-cover-image.png\"]',8,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(34,'cover_image','[\"companies\\/company-cover-image.png\"]',9,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(35,'cover_image','[\"companies\\/company-cover-image.png\"]',10,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(36,'cover_image','[\"companies\\/company-cover-image.png\"]',11,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(37,'cover_image','[\"companies\\/company-cover-image.png\"]',12,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(38,'cover_image','[\"companies\\/company-cover-image.png\"]',13,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(39,'cover_image','[\"companies\\/company-cover-image.png\"]',14,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(40,'cover_image','[\"companies\\/company-cover-image.png\"]',15,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(41,'cover_image','[\"companies\\/company-cover-image.png\"]',16,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(42,'cover_image','[\"companies\\/company-cover-image.png\"]',17,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(43,'cover_image','[\"companies\\/company-cover-image.png\"]',18,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(44,'cover_image','[\"companies\\/company-cover-image.png\"]',19,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(45,'cover_image','[\"companies\\/company-cover-image.png\"]',20,'Botble\\JobBoard\\Models\\Company','2024-05-22 23:56:30','2024-05-22 23:56:30'),(46,'featured_image','[\"jobs\\/img1.png\"]',1,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(47,'featured_image','[\"jobs\\/img2.png\"]',2,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(48,'featured_image','[\"jobs\\/img3.png\"]',3,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(49,'featured_image','[\"jobs\\/img4.png\"]',4,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(50,'featured_image','[\"jobs\\/img5.png\"]',5,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(51,'featured_image','[\"jobs\\/img6.png\"]',6,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(52,'featured_image','[\"jobs\\/img7.png\"]',7,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(53,'featured_image','[\"jobs\\/img8.png\"]',8,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(54,'featured_image','[\"jobs\\/img9.png\"]',9,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(55,'featured_image','[\"jobs\\/img9.png\"]',10,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(56,'featured_image','[\"jobs\\/img6.png\"]',11,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(57,'featured_image','[\"jobs\\/img2.png\"]',12,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(58,'featured_image','[\"jobs\\/img4.png\"]',13,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(59,'featured_image','[\"jobs\\/img2.png\"]',14,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(60,'featured_image','[\"jobs\\/img3.png\"]',15,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(61,'featured_image','[\"jobs\\/img1.png\"]',16,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(62,'featured_image','[\"jobs\\/img2.png\"]',17,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(63,'featured_image','[\"jobs\\/img2.png\"]',18,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(64,'featured_image','[\"jobs\\/img1.png\"]',19,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(65,'featured_image','[\"jobs\\/img3.png\"]',20,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(66,'featured_image','[\"jobs\\/img7.png\"]',21,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(67,'featured_image','[\"jobs\\/img1.png\"]',22,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(68,'featured_image','[\"jobs\\/img1.png\"]',23,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(69,'featured_image','[\"jobs\\/img9.png\"]',24,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(70,'featured_image','[\"jobs\\/img4.png\"]',25,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(71,'featured_image','[\"jobs\\/img5.png\"]',26,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(72,'featured_image','[\"jobs\\/img3.png\"]',27,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(73,'featured_image','[\"jobs\\/img8.png\"]',28,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(74,'featured_image','[\"jobs\\/img8.png\"]',29,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(75,'featured_image','[\"jobs\\/img4.png\"]',30,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:30','2024-05-22 23:56:30'),(76,'featured_image','[\"jobs\\/img2.png\"]',31,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(77,'featured_image','[\"jobs\\/img1.png\"]',32,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(78,'featured_image','[\"jobs\\/img5.png\"]',33,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(79,'featured_image','[\"jobs\\/img7.png\"]',34,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(80,'featured_image','[\"jobs\\/img6.png\"]',35,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(81,'featured_image','[\"jobs\\/img6.png\"]',36,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(82,'featured_image','[\"jobs\\/img8.png\"]',37,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(83,'featured_image','[\"jobs\\/img2.png\"]',38,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(84,'featured_image','[\"jobs\\/img9.png\"]',39,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(85,'featured_image','[\"jobs\\/img7.png\"]',40,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(86,'featured_image','[\"jobs\\/img2.png\"]',41,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(87,'featured_image','[\"jobs\\/img5.png\"]',42,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(88,'featured_image','[\"jobs\\/img9.png\"]',43,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(89,'featured_image','[\"jobs\\/img6.png\"]',44,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(90,'featured_image','[\"jobs\\/img7.png\"]',45,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(91,'featured_image','[\"jobs\\/img9.png\"]',46,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(92,'featured_image','[\"jobs\\/img7.png\"]',47,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(93,'featured_image','[\"jobs\\/img5.png\"]',48,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(94,'featured_image','[\"jobs\\/img1.png\"]',49,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(95,'featured_image','[\"jobs\\/img7.png\"]',50,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(96,'featured_image','[\"jobs\\/img7.png\"]',51,'Botble\\JobBoard\\Models\\Job','2024-05-22 23:56:31','2024-05-22 23:56:31'),(97,'cover_image','[\"covers\\/1.png\"]',1,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:32','2024-05-22 23:56:32'),(98,'cover_image','[\"covers\\/3.png\"]',2,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:33','2024-05-22 23:56:33'),(99,'cover_image','[\"covers\\/2.png\"]',3,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:33','2024-05-22 23:56:33'),(100,'cover_image','[\"covers\\/1.png\"]',4,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:33','2024-05-22 23:56:33'),(101,'cover_image','[\"covers\\/2.png\"]',5,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:34','2024-05-22 23:56:34'),(102,'cover_image','[\"covers\\/3.png\"]',6,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:34','2024-05-22 23:56:34'),(103,'cover_image','[\"covers\\/1.png\"]',7,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:34','2024-05-22 23:56:34'),(104,'cover_image','[\"covers\\/1.png\"]',8,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:34','2024-05-22 23:56:34'),(105,'cover_image','[\"covers\\/1.png\"]',9,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:35','2024-05-22 23:56:35'),(106,'cover_image','[\"covers\\/3.png\"]',10,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:35','2024-05-22 23:56:35'),(107,'cover_image','[\"covers\\/1.png\"]',11,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:35','2024-05-22 23:56:35'),(108,'cover_image','[\"covers\\/1.png\"]',12,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:36','2024-05-22 23:56:36'),(109,'cover_image','[\"covers\\/3.png\"]',13,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:36','2024-05-22 23:56:36'),(110,'cover_image','[\"covers\\/1.png\"]',14,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:36','2024-05-22 23:56:36'),(111,'cover_image','[\"covers\\/2.png\"]',15,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:36','2024-05-22 23:56:36'),(112,'cover_image','[\"covers\\/3.png\"]',16,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:37','2024-05-22 23:56:37'),(113,'cover_image','[\"covers\\/1.png\"]',17,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:37','2024-05-22 23:56:37'),(114,'cover_image','[\"covers\\/1.png\"]',18,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:38','2024-05-22 23:56:38'),(115,'cover_image','[\"covers\\/3.png\"]',19,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:38','2024-05-22 23:56:38'),(116,'cover_image','[\"covers\\/3.png\"]',20,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:38','2024-05-22 23:56:38'),(117,'cover_image','[\"covers\\/2.png\"]',21,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:38','2024-05-22 23:56:38'),(118,'cover_image','[\"covers\\/1.png\"]',22,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:39','2024-05-22 23:56:39'),(119,'cover_image','[\"covers\\/2.png\"]',23,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:39','2024-05-22 23:56:39'),(120,'cover_image','[\"covers\\/1.png\"]',24,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:39','2024-05-22 23:56:39'),(121,'cover_image','[\"covers\\/3.png\"]',25,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:39','2024-05-22 23:56:39'),(122,'cover_image','[\"covers\\/1.png\"]',26,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:40','2024-05-22 23:56:40'),(123,'cover_image','[\"covers\\/2.png\"]',27,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:40','2024-05-22 23:56:40'),(124,'cover_image','[\"covers\\/3.png\"]',28,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:40','2024-05-22 23:56:40'),(125,'cover_image','[\"covers\\/1.png\"]',29,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:41','2024-05-22 23:56:41'),(126,'cover_image','[\"covers\\/2.png\"]',30,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:41','2024-05-22 23:56:41'),(127,'cover_image','[\"covers\\/2.png\"]',31,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:41','2024-05-22 23:56:41'),(128,'cover_image','[\"covers\\/1.png\"]',32,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:41','2024-05-22 23:56:41'),(129,'cover_image','[\"covers\\/3.png\"]',33,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:42','2024-05-22 23:56:42'),(130,'cover_image','[\"covers\\/3.png\"]',34,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:42','2024-05-22 23:56:42'),(131,'cover_image','[\"covers\\/3.png\"]',35,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:42','2024-05-22 23:56:42'),(132,'cover_image','[\"covers\\/3.png\"]',36,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:43','2024-05-22 23:56:43'),(133,'cover_image','[\"covers\\/1.png\"]',37,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:43','2024-05-22 23:56:43'),(134,'cover_image','[\"covers\\/3.png\"]',38,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:43','2024-05-22 23:56:43'),(135,'cover_image','[\"covers\\/3.png\"]',39,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:43','2024-05-22 23:56:43'),(136,'cover_image','[\"covers\\/3.png\"]',40,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:44','2024-05-22 23:56:44'),(137,'cover_image','[\"covers\\/1.png\"]',41,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:44','2024-05-22 23:56:44'),(138,'cover_image','[\"covers\\/2.png\"]',42,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:44','2024-05-22 23:56:44'),(139,'cover_image','[\"covers\\/2.png\"]',43,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:45','2024-05-22 23:56:45'),(140,'cover_image','[\"covers\\/3.png\"]',44,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:45','2024-05-22 23:56:45'),(141,'cover_image','[\"covers\\/2.png\"]',45,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:45','2024-05-22 23:56:45'),(142,'cover_image','[\"covers\\/1.png\"]',46,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:45','2024-05-22 23:56:45'),(143,'cover_image','[\"covers\\/3.png\"]',47,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:46','2024-05-22 23:56:46'),(144,'cover_image','[\"covers\\/3.png\"]',48,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:46','2024-05-22 23:56:46'),(145,'cover_image','[\"covers\\/3.png\"]',49,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:46','2024-05-22 23:56:46'),(146,'cover_image','[\"covers\\/2.png\"]',50,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:47','2024-05-22 23:56:47'),(147,'cover_image','[\"covers\\/1.png\"]',51,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:47','2024-05-22 23:56:47'),(148,'cover_image','[\"covers\\/2.png\"]',52,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:47','2024-05-22 23:56:47'),(149,'cover_image','[\"covers\\/3.png\"]',53,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:48','2024-05-22 23:56:48'),(150,'cover_image','[\"covers\\/2.png\"]',54,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:48','2024-05-22 23:56:48'),(151,'cover_image','[\"covers\\/1.png\"]',55,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:48','2024-05-22 23:56:48'),(152,'cover_image','[\"covers\\/2.png\"]',56,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:48','2024-05-22 23:56:48'),(153,'cover_image','[\"covers\\/1.png\"]',57,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:49','2024-05-22 23:56:49'),(154,'cover_image','[\"covers\\/3.png\"]',58,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:49','2024-05-22 23:56:49'),(155,'cover_image','[\"covers\\/2.png\"]',59,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:49','2024-05-22 23:56:49'),(156,'cover_image','[\"covers\\/1.png\"]',60,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:50','2024-05-22 23:56:50'),(157,'cover_image','[\"covers\\/1.png\"]',61,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:50','2024-05-22 23:56:50'),(158,'cover_image','[\"covers\\/3.png\"]',62,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:50','2024-05-22 23:56:50'),(159,'cover_image','[\"covers\\/1.png\"]',63,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:50','2024-05-22 23:56:50'),(160,'cover_image','[\"covers\\/2.png\"]',64,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:51','2024-05-22 23:56:51'),(161,'cover_image','[\"covers\\/2.png\"]',65,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:51','2024-05-22 23:56:51'),(162,'cover_image','[\"covers\\/3.png\"]',66,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:51','2024-05-22 23:56:51'),(163,'cover_image','[\"covers\\/3.png\"]',67,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:52','2024-05-22 23:56:52'),(164,'cover_image','[\"covers\\/2.png\"]',68,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:52','2024-05-22 23:56:52'),(165,'cover_image','[\"covers\\/2.png\"]',69,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:52','2024-05-22 23:56:52'),(166,'cover_image','[\"covers\\/3.png\"]',70,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:52','2024-05-22 23:56:52'),(167,'cover_image','[\"covers\\/2.png\"]',71,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:53','2024-05-22 23:56:53'),(168,'cover_image','[\"covers\\/3.png\"]',72,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:53','2024-05-22 23:56:53'),(169,'cover_image','[\"covers\\/1.png\"]',73,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:53','2024-05-22 23:56:53'),(170,'cover_image','[\"covers\\/1.png\"]',74,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:54','2024-05-22 23:56:54'),(171,'cover_image','[\"covers\\/3.png\"]',75,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:54','2024-05-22 23:56:54'),(172,'cover_image','[\"covers\\/2.png\"]',76,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:54','2024-05-22 23:56:54'),(173,'cover_image','[\"covers\\/2.png\"]',77,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:55','2024-05-22 23:56:55'),(174,'cover_image','[\"covers\\/3.png\"]',78,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:55','2024-05-22 23:56:55'),(175,'cover_image','[\"covers\\/1.png\"]',79,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:55','2024-05-22 23:56:55'),(176,'cover_image','[\"covers\\/1.png\"]',80,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:56','2024-05-22 23:56:56'),(177,'cover_image','[\"covers\\/2.png\"]',81,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:56','2024-05-22 23:56:56'),(178,'cover_image','[\"covers\\/2.png\"]',82,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:56','2024-05-22 23:56:56'),(179,'cover_image','[\"covers\\/2.png\"]',83,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:56','2024-05-22 23:56:56'),(180,'cover_image','[\"covers\\/3.png\"]',84,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:57','2024-05-22 23:56:57'),(181,'cover_image','[\"covers\\/1.png\"]',85,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:57','2024-05-22 23:56:57'),(182,'cover_image','[\"covers\\/2.png\"]',86,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:57','2024-05-22 23:56:57'),(183,'cover_image','[\"covers\\/1.png\"]',87,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:58','2024-05-22 23:56:58'),(184,'cover_image','[\"covers\\/1.png\"]',88,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:58','2024-05-22 23:56:58'),(185,'cover_image','[\"covers\\/3.png\"]',89,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:58','2024-05-22 23:56:58'),(186,'cover_image','[\"covers\\/1.png\"]',90,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:58','2024-05-22 23:56:58'),(187,'cover_image','[\"covers\\/1.png\"]',91,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:59','2024-05-22 23:56:59'),(188,'cover_image','[\"covers\\/1.png\"]',92,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:59','2024-05-22 23:56:59'),(189,'cover_image','[\"covers\\/3.png\"]',93,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:56:59','2024-05-22 23:56:59'),(190,'cover_image','[\"covers\\/2.png\"]',94,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:00','2024-05-22 23:57:00'),(191,'cover_image','[\"covers\\/1.png\"]',95,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:00','2024-05-22 23:57:00'),(192,'cover_image','[\"covers\\/2.png\"]',96,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:00','2024-05-22 23:57:00'),(193,'cover_image','[\"covers\\/1.png\"]',97,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:00','2024-05-22 23:57:00'),(194,'cover_image','[\"covers\\/1.png\"]',98,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:01','2024-05-22 23:57:01'),(195,'cover_image','[\"covers\\/1.png\"]',99,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:01','2024-05-22 23:57:01'),(196,'cover_image','[\"covers\\/3.png\"]',100,'Botble\\JobBoard\\Models\\Account','2024-05-22 23:57:01','2024-05-22 23:57:01');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_10_103353_fix_social_links',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_19_152743_migrate_old_city_state_image',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_06_100448_change_random_hash_for_media',1),(33,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(34,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(35,'2023_12_20_034718_update_invoice_amount',1),(36,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(37,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(38,'2024_05_16_100000_change_random_hash_for_media',1),(39,'2024_04_27_100730_improve_analytics_setting',2),(40,'2015_06_29_025744_create_audit_history',3),(41,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(42,'2015_06_18_033822_create_blog_table',4),(43,'2021_02_16_092633_remove_default_value_for_author_type',4),(44,'2021_12_03_030600_create_blog_translations',4),(45,'2022_04_19_113923_add_index_to_table_posts',4),(46,'2023_08_29_074620_make_column_author_id_nullable',4),(47,'2016_06_17_091537_create_contacts_table',5),(48,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(49,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',5),(50,'2024_03_25_000001_update_captcha_settings_for_contact',5),(51,'2024_04_19_063914_create_custom_fields_table',5),(52,'2018_07_09_221238_create_faq_table',6),(53,'2021_12_03_082134_create_faq_translations',6),(54,'2023_11_17_063408_add_description_column_to_faq_categories_table',6),(55,'2016_10_13_150201_create_galleries_table',7),(56,'2021_12_03_082953_create_gallery_translations',7),(57,'2022_04_30_034048_create_gallery_meta_translations_table',7),(58,'2023_08_29_075308_make_column_user_id_nullable',7),(59,'2022_06_20_093259_create_job_board_tables',8),(60,'2022_09_12_061845_update_table_activity_logs',8),(61,'2022_09_13_042407_create_table_jb_jobs_types',8),(62,'2022_09_15_030017_update_jb_jobs_table',8),(63,'2022_09_15_094840_add_job_employer_colleagues',8),(64,'2022_09_27_000001_create_jb_invoices_tables',8),(65,'2022_09_30_144924_update_jobs_table',8),(66,'2022_10_04_085631_add_company_logo_to_jb_invoices',8),(67,'2022_10_10_030606_create_reviews_table',8),(68,'2022_11_09_065056_add_missing_jobs_page',8),(69,'2022_11_10_065056_add_columns_to_accounts',8),(70,'2022_11_16_034756_add_column_cover_letter_to_accounts',8),(71,'2022_11_29_304756_create_jb_account_favorite_skills_table',8),(72,'2022_11_29_304757_create_jb_account_favorite_tags',8),(73,'2022_12_26_304758_create_table_jb_experiences',8),(74,'2022_12_26_304759_create_table_jb_education',8),(75,'2023_01_31_023233_create_jb_custom_fields_table',8),(76,'2023_02_06_024257_add_package_translations',8),(77,'2023_02_08_062457_add_custom_fields_translation_table',8),(78,'2023_04_03_126927_add_parent_id_to_jb_categories_table',8),(79,'2023_05_04_000001_add_hide_cv_to_jb_accounts_table',8),(80,'2023_05_09_062031_unique_reviews_table',8),(81,'2023_05_13_180010_make_jb_reviews_table_morphable',8),(82,'2023_05_16_113126_fix_account_confirmed_at',8),(83,'2023_07_03_135746_add_zip_code_to_jb_jobs_table',8),(84,'2023_07_06_022808_create_jb_coupons_table',8),(85,'2023_07_14_045213_add_coupon_code_column_to_jb_invoices_table',8),(86,'2024_01_31_022842_add_description_to_jb_packages_table',8),(87,'2024_02_01_080657_add_tax_id_column_to_jb_companies_table',8),(88,'2024_05_02_030658_add_field_unique_id_to_jb_accounts_and_jb_companies_table',8),(89,'2016_10_03_032336_create_languages_table',9),(90,'2023_09_14_022423_add_index_for_language_table',9),(91,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(92,'2021_12_03_075608_create_page_translations',10),(93,'2023_07_06_011444_create_slug_translations_table',10),(94,'2019_11_18_061011_create_country_table',11),(95,'2021_12_03_084118_create_location_translations',11),(96,'2021_12_03_094518_migrate_old_location_data',11),(97,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(98,'2022_01_16_085908_improve_plugin_location',11),(99,'2022_08_04_052122_delete_location_backup_tables',11),(100,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(101,'2023_07_26_041451_add_more_columns_to_location_table',11),(102,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(103,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(104,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(105,'2017_10_24_154832_create_newsletter_table',12),(106,'2024_03_25_000001_update_captcha_settings_for_newsletter',12),(107,'2017_05_18_080441_create_payment_tables',13),(108,'2021_03_27_144913_add_customer_type_into_table_payments',13),(109,'2021_05_24_034720_make_column_currency_nullable',13),(110,'2021_08_09_161302_add_metadata_column_to_payments_table',13),(111,'2021_10_19_020859_update_metadata_field',13),(112,'2022_06_28_151901_activate_paypal_stripe_plugin',13),(113,'2022_07_07_153354_update_charge_id_in_table_payments',13),(114,'2022_11_02_092723_team_create_team_table',14),(115,'2023_08_11_094574_update_team_table',14),(116,'2023_11_30_085354_add_missing_description_to_team',14),(117,'2018_07_09_214610_create_testimonial_table',15),(118,'2021_12_03_083642_create_testimonials_translations',15),(119,'2016_10_07_193005_create_translations_table',16),(120,'2023_12_12_105220_drop_translations_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','<div>[search-box title=\"The Easiest Way to Get Your New Job\" highlight_text=\"Easiest Way\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" icon_top_banner=\"pages/icon-top-banner.png\" banner_image_2=\"pages/banner2.png\" icon_bottom_banner=\"pages/icon-bottom-banner.png\" style=\"style-1\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\"][/apply-banner]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"4,9,1,3,5,7\" style=\"style-1\"][/job-of-the-day]</div><div>[job-grid title=\"Find The One That’s Right For You\" high_light_title_text=\"Right\" subtitle=\"Millions Of Jobs.\" description=\"Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.\" image_job_1=\"pages/img-chart.png\" image_job_2=\"pages/controlcard.png\" image=\"pages/img1.png\" button_text=\"Search jobs\" button_url=\"#\" link_text=\"Learn more\" link_text_url=\"#\"][/job-grid]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\"][/top-companies]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"1,2,3,4,5,6\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(2,'Homepage 2','<div>[search-box subtitle=\"We have 150,000+ live jobs\" title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" counter_title_1=\"Daily Jobs Posted\" counter_number_1=\"265\" counter_title_2=\"Recruiters\" counter_number_2=\"17\" counter_title_3=\"Freelancers\" counter_number_3=\"15\" counter_title_4=\"Blog Tips\" counter_number_4=\"28\" background_image=\"pages/banner-section-search-box.png\" style=\"style-2\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-2\"][/top-companies]</div><div>[advertisement-banner first_title=\"Job Tools Services\" first_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_first_content_text=\"Find Out More\" load_more_link_first_content=\"#\" image_of_first_content=\"pages/job-tools.png\" second_title=\"Planning a Job?\" second_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_second_content_text=\"Find Out More\" load_more_link_second_content=\"#\" image_of_second_content=\"pages/planning-job.png\"][/advertisement-banner]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(3,'Homepage 3','<div>[search-box title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" style=\"style-3\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-3\"][/job-of-the-day]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers and marketers in the tech industry.\" limit=\"8\" style=\"style-3\"][/top-candidates]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-3\"][/top-companies]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\" style=\"style-3\"][/apply-banner]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-3\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(4,'Homepage 4','<div>[search-box title=\"Get The Right Job You Deserve\" highlight_text=\"Right Job\" banner_image_1=\"pages/home-page-4-banner.png\" style=\"style-1\" trending_keywords=\"Designer, Web, IOS, Developer, PHP, Senior, Engineer\" background_color=\"#000\"][/search-box]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6,8,7\" style=\"style-3\"][/job-of-the-day]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\" limit_category=\"10\" background_image=\"pages/bg-cat.png\" style=\"style-2\"][/featured-job-categories]</div><div>[[testimonials title=\"See Some Words\" description=\"Thousands of employee get their ideal jobs and feed back to us!\" style=\"style-2\"][/testimonials]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(5,'Homepage 5','<div>[search-box title=\"Find Jobs, &#x3C;br&#x3E; Hire Creatives\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" banner_image_2=\"pages/banner2.png\" banner_image_3=\"pages/banner3.png\" banner_image_4=\"pages/banner4.png\" banner_image_5=\"pages/banner5.png\" banner_image_6=\"pages/banner6.png\" style=\"style-5\"][/search-box]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[popular-category title=\"Explore the Marketplace\" subtitle=\"Search and connect with the right candidates faster. Tell us what you’ve looking for and we’ll get to work for you.\" style=\"style-5\"][/popular-category]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply &#x3C;br&#x3E; discover which is right for you.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[how-it-works title=\"How It Works\" description=\"Just via some simple steps, you will find your ideal candidates you’r looking for!\" step_label_1=\"Register an &#x3C;br&#x3E; account to start\" step_help_1=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_2=\"Explore over &#x3C;br&#x3E; thousands of resumes\" step_help_2=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_3=\"Find the most &#x3C;br&#x3E; suitable candidate\" step_help_3=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" button_label=\"Get Started\" button_url=\"#\"][/how-it-works]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers &#x3C;br&#x3E; and marketers in the tech industry.\" limit=\"8\" style=\"style-5\"][/top-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(6,'Homepage 6','<div>[search-box title=\"There Are 102,256 Postings Here For you!\" highlight_text=\"102,256\" description=\"Find Jobs, Employment & Career Opportunities\" style=\"style-4\" trending_keywords=\"Design,Development,Manager,Senior,,\" background_color=\"#000\"][/search-box]</div><div>[gallery image_1=\"galleries/1.jpg\" image_2=\"galleries/2.jpg\" image_3=\"galleries/3.jpg\" image_4=\"galleries/4.jpg\" image_5=\"galleries/5.jpg\"][/gallery]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6\" style=\"style-2\"][/job-of-the-day]</div><div>[job-search-banner title=\"Job search for people passionate about startup\" background_image=\"pages/img-job-search.png\" checkbox_title_1=\"Create an account\" checkbox_description_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_2=\"Search for Jobs\" checkbox_description_2=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_3=\"Save & Apply\" checkbox_description_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\"][/job-search-banner]</div>',1,NULL,'homepage',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(7,'Jobs','<div>[search-box title=\"The official IT Jobs site\" highlight_text=\"IT Jobs\" description=\"“JobBox is our first stop whenever we\'re hiring a PHP role. We\'ve hired 10 PHP developers in the last few years, all thanks to JobBox.” — Andrew Hall, Elite JSC.\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[job-list max_salary_range=\"10000\"][/job-list]</div>',1,NULL,'default',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(8,'Companies','<div>[job-companies title=\"Browse Companies\" subtitle=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\"][/job-companies]</div>',1,NULL,'default',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(9,'Candidates','<div>[job-candidates title=\"Browse Candidates\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque &#x3C;br&#x3E; delectus molestias quis?\" number_per_page=\"9\" style=\"grid\"][/job-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'default',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(10,'About us','<div>[company-about title=\"About Our Company\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" title_box=\"What we can do?\" image=\"general/img-about2.png\" description_box=\"Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.\" url=\"/\" text_button_box=\"Read more\"][/company-about]</div><div>[team title=\"About Our Company\" sub_title=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" description=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(11,'Pricing Plan','<div>[pricing-table title=\"Pricing Table\" subtitle=\"Choose The Best Plan That’s For You\" number_of_package=\"3\"][/pricing-table]</div><div>[faq title=\"Frequently Asked Questions\" subtitle=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien\" number_of_faq=\"4\"][/faq]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'default',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(12,'Contact','<div>[company-information company_name=\"Jobbox Company\" logo_company=\"general/logo-company.png\" company_address=\"205 North Michigan Avenue, Suite 810 Chicago, 60601, US\" company_phone=\"0543213336\" company_email=\"contact@jobbox.com\" branch_company_name_0=\"London\" branch_company_address_0=\"2118 Thornridge Cir. Syracuse, Connecticut 35624\" branch_company_name_1=\"New York\" branch_company_address_1=\"4517 Washington Ave. Manchester, Kentucky 39495\" branch_company_name_2=\"Chicago\" branch_company_address_2=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_3=\"San Francisco\" branch_company_address_3=\"4140 Parker Rd. Allentown, New Mexico 31134\" branch_company_name_4=\"Sysney\" branch_company_address_4=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_5=\"Singapore\" branch_company_address_5=\"4140 Parker Rd. Allentown, New Mexico 31134\"][/company-information]</div><div>[contact-form title=\"Contact us\" subtitle=\"Get in touch\" description=\"The right move at the right time saves your investment. live the dream of expanding your business.\" image=\"image-contact.png\" show_newsletter=\"yes\"][/contact-form]</div><div>[team title=\"Meet Our Team\" subtitle=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(13,'Blog','---',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(14,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><ul><li>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</li><li>Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</li><li>XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</li></ul>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(15,'FAQs','<div>[faq title=\"Frequently Asked Questions\" number_of_faq=\"4\"][/faq]</div>',1,NULL,'page-detail',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(16,'Services','<p>Alice hastily, afraid that it is!\' As she said to the Hatter. \'You MUST remember,\' remarked the King, the Queen, who had been to the waving of the baby, and not to make out which were the cook, and a Long Tale They were indeed a queer-looking party that assembled on the end of the Nile On every golden scale! \'How cheerfully he seems to be a very difficult question. However, at last the Mock Turtle, \'but if they do, why then they\'re a kind of sob, \'I\'ve tried every way, and nothing seems to be.</p><p>King. On this the White Rabbit, \'and that\'s a fact.\' Alice did not look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at least one of its little eyes, but it was sneezing on the Duchess\'s cook. She carried the pepper-box in her life; it was perfectly round, she found her head to keep herself from being broken. She hastily put down yet, before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon whispered in reply, \'for fear they should.</p><p>So she tucked her arm affectionately into Alice\'s, and they lived at the sides of it; so, after hunting all about it!\' and he went on so long since she had someone to listen to me! I\'LL soon make you grow taller, and the Queen, turning purple. \'I won\'t!\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Caterpillar decidedly, and the reason they\'re called lessons,\' the Gryphon went on. \'Or would you tell me,\' said Alice, \'it\'s very interesting. I never heard before, \'Sure.</p><p>And took them quite away!\' \'Consider your verdict,\' the King said, with a yelp of delight, and rushed at the picture.) \'Up, lazy thing!\' said Alice, \'how am I to do?\' said Alice. \'Well, then,\' the Cat went on, spreading out the verses on his spectacles and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, in a very humble tone, going down on one knee. \'I\'m a poor man, your Majesty,\' the Hatter went on, \'if you only walk long enough.\' Alice felt a little irritated at the picture.).</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(17,'Terms','<p>I\'m sure _I_ shan\'t be able! I shall see it trot away quietly into the sky. Alice went timidly up to the porpoise, \"Keep back, please: we don\'t want to go! Let me see: four times seven is--oh dear! I wish you wouldn\'t have come here.\' Alice didn\'t think that very few things indeed were really impossible. There seemed to Alice to herself, as she could, for the Dormouse,\' thought Alice; but she felt that it ought to speak, but for a minute or two, and the procession came opposite to Alice, very.</p><p>Queen, the royal children, and make one quite giddy.\' \'All right,\' said the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got to the table to measure herself by it, and burning with curiosity, she ran off at once, in a moment. \'Let\'s go on in a very decided tone: \'tell her something about the crumbs,\' said the Cat in a shrill, loud voice, and see how he can thoroughly enjoy The pepper when he sneezes: He only does it to his ear. Alice considered a little, and then the.</p><p>So Alice began telling them her adventures from the sky! Ugh, Serpent!\' \'But I\'m not looking for them, and the Dormouse sulkily remarked, \'If you didn\'t like cats.\' \'Not like cats!\' cried the Mouse, getting up and went on to himself in an offended tone, and she tried the effect of lying down with her head!\' Alice glanced rather anxiously at the top of his great wig.\' The judge, by the Queen never left off staring at the Caterpillar\'s making such a puzzled expression that she had never seen.</p><p>I tell you!\' said Alice. \'That\'s very curious!\' she thought. \'I must go by the end of the busy farm-yard--while the lowing of the Nile On every golden scale! \'How cheerfully he seems to be a person of authority among them, called out, \'First witness!\' The first thing she heard something splashing about in the back. However, it was very hot, she kept tossing the baby was howling so much surprised, that for the first question, you know.\' \'Who is it directed to?\' said the Mouse, frowning, but.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22'),(18,'Job Categories','<div>[search-box title=\"22 Jobs Available Now\" highlight_text=\"22 Jobs\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[popular-category title=\"Popular category\" limit_category=\"8\" style=\"style-1\"][/popular-category]</div><div>[job-categories title=\"Categories\" subtitle=\"All categories\" limit_category=\"8\"][/job-categories]</div>',1,NULL,'default',NULL,'published','2024-05-22 23:56:22','2024-05-22 23:56:22');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(6,1),(2,2),(5,2),(2,3),(5,3);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Interview Question: Why Dont You Have a Degree?','Modi ea adipisci cumque aut dolor maxime. Exercitationem veritatis impedit inventore maiores. Minima ducimus provident ex pariatur.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>March Hare,) \'--it was at in all directions, tumbling up against each other; however, they got settled down again in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I mean what I like\"!\' \'You might just as well she might, what a dear little puppy it was!\' said Alice, as she could see, as well as she could see her after the birds! Why, she\'ll eat a little of her hedgehog. The hedgehog was engaged in a deep, hollow tone: \'sit down, both of you, and listen to her, so she began looking at it again: but he could think of nothing better to say anything. \'Why,\' said the Hatter. \'I deny it!\' said the Duchess: \'flamingoes and mustard both bite. And the Gryphon at the bottom of the court. All this time she saw in another moment, splash! she was as steady as ever; Yet you finished the first minute or two the Caterpillar seemed to be Involved in this way!.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Gryphon. \'It all came different!\' Alice replied eagerly, for she was now more than nine feet high. \'I wish you were down here with me! There are no mice in the air. She did it so VERY remarkable in that; nor did Alice think it was,\' he said. \'Fifteenth,\' said the Gryphon. \'Then, you know,\' said the King exclaimed, turning to the conclusion that it was her turn or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'I\'m glad they don\'t seem to encourage the witness at all: he kept.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'how am I to do it.\' (And, as you can--\' \'Swim after them!\' screamed the Gryphon. \'Turn a somersault in the distance, sitting sad and lonely on a little shriek and a large ring, with the next moment she appeared; but she could have told you that.\' \'If I\'d been the right thing to eat her up in such long ringlets, and mine doesn\'t go in at the White Rabbit, \'but it doesn\'t understand English,\' thought Alice; \'but when you have to beat time when I sleep\" is the same thing,\' said the Dormouse, who seemed ready to make out exactly what they WILL do next! If they had settled down again in a rather offended tone, and added \'It isn\'t mine,\' said the Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to have it explained,\' said the Duchess, \'and that\'s the jury, in a louder tone. \'ARE you to learn?\' \'Well, there was Mystery,\' the Mock Turtle replied; \'and then the other, and making quite a large arm-chair at one end to the garden door. Poor Alice! It was high time you.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>By the time he had taken advantage of the Mock Turtle, \'but if they do, why then they\'re a kind of thing that would be grand, certainly,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have prizes.\' \'But who has won?\' This question the Dodo had paused as if she were saying lessons, and began singing in its hurry to change the subject of conversation. While she was going to remark myself.\' \'Have you seen the Mock Turtle, and to her great disappointment it was her turn or not. So she tucked her arm affectionately into Alice\'s, and they went on in these words: \'Yes, we went to the little door into that lovely garden. First, however, she waited patiently. \'Once,\' said the Mock Turtle in a pleased tone. \'Pray don\'t trouble yourself to say but \'It belongs to a farmer, you know, upon the other birds tittered audibly. \'What I was going a journey, I should like to show you! A little bright-eyed terrier, you know, upon the other queer noises, would change.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news1.png',1799,NULL,'2024-05-08 14:55:38','2024-05-08 14:55:38'),(2,'21 Job Interview Tips: How To Make a Great Impression','Ut possimus omnis enim placeat. Architecto modi sed nostrum cum delectus harum. Nostrum autem et temporibus autem consequatur. Sequi quasi nesciunt laboriosam similique officia. Quis eos sit in voluptas rerum quis. Et quos cupiditate quasi vero.','<p>No room!\' they cried out when they saw her, they hurried back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she ran, as well as I used--and I don\'t think,\' Alice went timidly up to the table, half hoping that the mouse to the end: then stop.\' These were the two sides of it; so, after hunting all about for some while in silence. Alice was just possible it had been. But her sister sat still just as well go in ringlets at all; however, she waited for some minutes. The Caterpillar and Alice looked all round the rosetree; for, you see, Alice had never done such a long way back, and see after some executions I have to ask help of any good reason, and as the March Hare: she thought of herself, \'I wish I hadn\'t cried so much!\' Alas! it was looking for the hot day made her so savage when they arrived, with a little hot tea upon its nose. The Dormouse had closed its eyes by this time?\' she said to herself, \'Now, what am I to do this, so she.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice! when she had not gone far before they saw her, they hurried back to her: first, because the Duchess said in a few minutes that she had found the fan and gloves, and, as the Caterpillar decidedly, and there she saw in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that makes the world you fly, Like a tea-tray in the distance, screaming with passion. She had quite a crowd of little Alice herself, and began to say anything. \'Why,\' said the Caterpillar angrily.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>THE COURT.\' Everybody looked at the bottom of a feather flock together.\"\' \'Only mustard isn\'t a letter, written by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then her head through the wood. \'If it had been. But her sister kissed her, and she jumped up and said, \'So you did, old fellow!\' said the Cat; and this Alice thought to herself in Wonderland, though she looked down into its mouth and began talking to him,\' said Alice as it happens; and if it makes me grow large again, for she had found the fan and two or three of the cattle in the act of crawling away: besides all this, there was no more of the hall; but, alas! either the locks were too large, or the key was lying under the hedge. In another minute there was the Cat remarked. \'Don\'t be impertinent,\' said the Duck: \'it\'s generally.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>EVEN finish, if he were trying to invent something!\' \'I--I\'m a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I can\'t get out of sight, they were all turning into little cakes as they came nearer, Alice could not remember ever having seen such a long sleep you\'ve had!\' \'Oh, I\'ve had such a noise inside, no one could possibly hear you.\' And certainly there was hardly room for YOU, and no one else seemed inclined to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course was, how to speak with. Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the largest telescope that ever was! Good-bye, feet!\' (for when she noticed that the best of educations--in fact, we went to school every day--\' \'I\'VE been to her, still it was addressed to the voice of the same as they all cheered. Alice thought decidedly uncivil. \'But perhaps it was neither more nor.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news2.png',270,NULL,'2024-05-09 22:47:10','2024-05-09 22:47:10'),(3,'39 Strengths and Weaknesses To Discuss in a Job Interview','Ea minus ut unde voluptatibus debitis. Eum dolore ut eum aut. Quasi provident qui velit eos autem voluptatem impedit. Nobis ea quam aut minus.','<p>Footman continued in the distance. \'Come on!\' cried the Gryphon, the squeaking of the words did not come the same solemn tone, only changing the order of the Rabbit\'s voice along--\'Catch him, you by the soldiers, who of course was, how to spell \'stupid,\' and that is rather a complaining tone, \'and they all crowded together at one and then dipped suddenly down, so suddenly that Alice said; but was dreadfully puzzled by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked up towards it rather timidly, saying to her that she wasn\'t a bit of the well, and noticed that one of the busy farm-yard--while the lowing of the evening, beautiful Soup! Soup of the birds and beasts, as well say this), \'to go on in a minute or two, she made out that the cause of this sort of way, \'Do cats eat.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'d hardly finished the first question, you know.\' \'I don\'t see how the Dodo managed it.) First it marked out a box of comfits, (luckily the salt water had not got into the book her sister sat still just as she went to the game, feeling very curious sensation, which puzzled her too much, so she began nibbling at the moment, \'My dear! I wish I could not help thinking there MUST be more to be a great interest in questions of eating and drinking. \'They lived on treacle,\' said the King say in a.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I can\'t get out at all for any of them. \'I\'m sure those are not the smallest notice of her going, though she knew she had never before seen a rabbit with either a waistcoat-pocket, or a worm. The question is, Who in the world you fly, Like a tea-tray in the last concert!\' on which the wretched Hatter trembled so, that he had taken advantage of the game, feeling very glad to get to,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the rest, Between yourself and me.\' \'That\'s the most curious thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that the poor little thing sobbed again (or grunted, it was very hot, she kept fanning herself all the while, and fighting for the Dormouse,\' thought Alice; \'I daresay it\'s a set of verses.\' \'Are they in the flurry of the other queer noises, would change to dull reality--the grass would be very likely it can be,\' said the Lory positively refused to tell its age, there was.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice was beginning to think about stopping herself before she found to be two people! Why, there\'s hardly room for YOU, and no one else seemed inclined to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it had a large dish of tarts upon it: they looked so grave and anxious.) Alice could think of what sort it was) scratching and scrambling about in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess said to herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. Alice was a sound of a procession,\' thought she, \'what would become of me? They\'re dreadfully fond of pretending to be listening, so she sat on, with closed eyes, and feebly stretching out one paw, trying to fix on one, the cook till his eyes were looking up into hers--she could hear the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting in the after-time, be herself a grown woman; and how.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news3.png',1011,NULL,'2024-05-12 00:57:07','2024-05-12 00:57:07');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true}','Admin users role',1,1,1,'2024-05-22 23:56:18','2024-05-22 23:56:18');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-05-22 23:56:19'),(3,'analytics_dashboard_widgets','0','2024-05-22 23:56:10','2024-05-22 23:56:10'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"job-board\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2024-05-22 23:56:19'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2024-05-22 23:56:11','2024-05-22 23:56:11'),(7,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2024-05-22 23:56:15','2024-05-22 23:56:15'),(10,'language_hide_default','1',NULL,NULL),(11,'language_switcher_display','dropdown',NULL,NULL),(12,'language_display','all',NULL,NULL),(13,'language_hide_languages','[]',NULL,NULL),(14,'show_admin_bar','1',NULL,NULL),(15,'theme','jobbox',NULL,NULL),(16,'admin_logo','general/logo-light.png',NULL,NULL),(17,'admin_favicon','general/favicon.png',NULL,NULL),(18,'theme-jobbox-site_title','JobBox - Laravel Job Board Script',NULL,NULL),(19,'theme-jobbox-seo_description','JobBox is a neat, clean and professional job board website script for your organization. It’s easy to build a complete Job Board site with JobBox script.',NULL,NULL),(20,'theme-jobbox-copyright','©2024 Archi Elite JSC. All right reserved.',NULL,NULL),(21,'theme-jobbox-favicon','general/favicon.png',NULL,NULL),(22,'theme-jobbox-logo','general/logo.png',NULL,NULL),(23,'theme-jobbox-hotline','+(123) 345-6789',NULL,NULL),(24,'theme-jobbox-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(25,'theme-jobbox-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(26,'theme-jobbox-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(27,'theme-jobbox-homepage_id','1',NULL,NULL),(28,'theme-jobbox-blog_page_id','13',NULL,NULL),(29,'theme-jobbox-preloader_enabled','no',NULL,NULL),(30,'theme-jobbox-job_categories_page_id','18',NULL,NULL),(31,'theme-jobbox-job_candidates_page_id','9',NULL,NULL),(32,'theme-jobbox-default_company_cover_image','general/cover-image.png',NULL,NULL),(33,'theme-jobbox-job_companies_page_id','8',NULL,NULL),(34,'theme-jobbox-job_list_page_id','7',NULL,NULL),(35,'theme-jobbox-email','contact@jobbox.com',NULL,NULL),(36,'theme-jobbox-404_page_image','general/404.png',NULL,NULL),(37,'theme-jobbox-background_breadcrumb','pages/bg-breadcrumb.png',NULL,NULL),(38,'theme-jobbox-blog_page_template_blog','blog_gird_1',NULL,NULL),(39,'theme-jobbox-background_blog_single','pages/img-single.png',NULL,NULL),(40,'theme-jobbox-auth_background_image_1','authentication/img-1.png',NULL,NULL),(41,'theme-jobbox-auth_background_image_2','authentication/img-2.png',NULL,NULL),(42,'theme-jobbox-background_cover_candidate_default','pages/background-cover-candidate.png',NULL,NULL),(43,'theme-jobbox-job_board_max_salary_filter','10000',NULL,NULL),(44,'theme-jobbox-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"socials\\/facebook.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"socials\\/linkedin.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"socials\\/twitter.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}]]',NULL,NULL),(45,'media_random_hash','48a296e6379c7a5ef797ac7e13b96a3d',NULL,NULL),(46,'permalink-botble-blog-models-post','blog',NULL,NULL),(47,'permalink-botble-blog-models-category','blog',NULL,NULL),(48,'payment_cod_status','1',NULL,NULL),(49,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(50,'payment_bank_transfer_status','1',NULL,NULL),(51,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(52,'payment_stripe_payment_type','stripe_checkout',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage-1',1,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(2,'homepage-2',2,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(3,'homepage-3',3,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(4,'homepage-4',4,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(5,'homepage-5',5,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(6,'homepage-6',6,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(7,'jobs',7,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(8,'companies',8,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(9,'candidates',9,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(10,'about-us',10,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(11,'pricing-plan',11,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(12,'contact',12,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(13,'blog',13,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(14,'cookie-policy',14,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(15,'faqs',15,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(16,'services',16,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(17,'terms',17,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(18,'job-categories',18,'Botble\\Page\\Models\\Page','','2024-05-22 23:56:22','2024-05-22 23:56:22'),(19,'design',1,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(20,'lifestyle',2,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(21,'travel-tips',3,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(22,'healthy',4,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(23,'travel-tips',5,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(24,'hotel',6,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(25,'nature',7,'Botble\\Blog\\Models\\Category','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(26,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-05-22 23:56:23','2024-05-22 23:56:23'),(27,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-05-22 23:56:23','2024-05-22 23:56:23'),(28,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(29,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(30,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','blog','2024-05-22 23:56:23','2024-05-22 23:56:27'),(31,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(32,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(33,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(34,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(35,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(36,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-22 23:56:24','2024-05-22 23:56:24'),(37,'content-writer',1,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(38,'market-research',2,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(39,'marketing-sale',3,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(40,'customer-help',4,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(41,'finance',5,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(42,'software',6,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(43,'human-resource',7,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(44,'management',8,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(45,'retail-products',9,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(46,'security-analyst',10,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-22 23:56:29','2024-05-22 23:56:29'),(47,'linkedin',1,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(48,'adobe-illustrator',2,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(49,'bing-search',3,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(50,'dailymotion',4,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(51,'linkedin',5,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(52,'quora-jsc',6,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(53,'nintendo',7,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(54,'periscope',8,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(55,'newsum',9,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(56,'powerhome',10,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(57,'whopcom',11,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(58,'greenwood',12,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(59,'kentucky',13,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(60,'equity',14,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(61,'honda',15,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(62,'toyota',16,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(63,'lexus',17,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(64,'ondo',18,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(65,'square',19,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(66,'visa',20,'Botble\\JobBoard\\Models\\Company','companies','2024-05-22 23:56:30','2024-05-22 23:56:30'),(67,'illustrator',1,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(68,'adobe-xd',2,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(69,'figma',3,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(70,'sketch',4,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(71,'lunacy',5,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(72,'php',6,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(73,'python',7,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(74,'javascript',8,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-22 23:56:30','2024-05-22 23:56:30'),(75,'ui-ux-designer-full-time',1,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(76,'full-stack-engineer',2,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(77,'java-software-engineer',3,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(78,'digital-marketing-manager',4,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(79,'frontend-developer',5,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(80,'react-native-web-developer',6,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(81,'senior-system-engineer',7,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(82,'products-manager',8,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(83,'lead-quality-control-qa',9,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(84,'principal-designer-design-systems',10,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(85,'devops-architect',11,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(86,'senior-software-engineer-npm-cli',12,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(87,'senior-systems-engineer',13,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(88,'software-engineer-actions-platform',14,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(89,'staff-engineering-manager-actions',15,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(90,'staff-engineering-manager-actions-runtime',16,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(91,'staff-engineering-manager-packages',17,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(92,'staff-software-engineer',18,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(93,'systems-software-engineer',19,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(94,'senior-compensation-analyst',20,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(95,'senior-accessibility-program-manager',21,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(96,'analyst-relations-manager-application-security',22,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(97,'senior-enterprise-advocate-emea',23,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(98,'deal-desk-manager',24,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(99,'director-revenue-compensation',25,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(100,'program-manager',26,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(101,'sr-manager-deal-desk-intl',27,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(102,'senior-director-product-management-actions-runners-and-compute-services',28,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(103,'alliances-director',29,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(104,'corporate-sales-representative',30,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(105,'country-leader',31,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:30','2024-05-22 23:56:30'),(106,'customer-success-architect',32,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(107,'devops-account-executive-us-public-sector',33,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(108,'enterprise-account-executive',34,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(109,'senior-engineering-manager-product-security-engineering-paved-paths',35,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(110,'customer-reliability-engineer-iii',36,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(111,'support-engineer-enterprise-support-japanese',37,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(112,'technical-partner-manager',38,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(113,'sr-manager-inside-account-management',39,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(114,'services-sales-representative',40,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(115,'services-delivery-manager',41,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(116,'senior-solutions-engineer',42,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(117,'senior-service-delivery-engineer',43,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(118,'senior-director-global-sales-development',44,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(119,'partner-program-manager',45,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(120,'principal-cloud-solutions-engineer',46,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(121,'senior-cloud-solutions-engineer',47,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(122,'senior-customer-success-manager',48,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(123,'inside-account-manager',49,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(124,'ux-jobs-board',50,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(125,'senior-laravel-developer-tall-stack',51,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-22 23:56:31','2024-05-22 23:56:31'),(126,'suzanne',1,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:32','2024-05-22 23:56:32'),(127,'fabiola',2,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:33','2024-05-22 23:56:33'),(128,'sarah',3,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:33','2024-05-22 23:56:33'),(129,'steven',4,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:33','2024-05-22 23:56:33'),(130,'william',5,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:34','2024-05-22 23:56:34'),(131,'camren',6,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:34','2024-05-22 23:56:34'),(132,'noble',7,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:34','2024-05-22 23:56:34'),(133,'osbaldo',8,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:34','2024-05-22 23:56:34'),(134,'ludie',9,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:35','2024-05-22 23:56:35'),(135,'lavon',10,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:35','2024-05-22 23:56:35'),(136,'beryl',11,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:35','2024-05-22 23:56:35'),(137,'melyna',12,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:36','2024-05-22 23:56:36'),(138,'clair',13,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:36','2024-05-22 23:56:36'),(139,'zackary',14,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:36','2024-05-22 23:56:36'),(140,'rhiannon',15,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:36','2024-05-22 23:56:36'),(141,'wendy',16,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:37','2024-05-22 23:56:37'),(142,'rhoda',17,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:37','2024-05-22 23:56:37'),(143,'arlo',18,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:38','2024-05-22 23:56:38'),(144,'demetrius',19,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:38','2024-05-22 23:56:38'),(145,'carolyne',20,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:38','2024-05-22 23:56:38'),(146,'gail',21,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:38','2024-05-22 23:56:38'),(147,'jamal',22,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:39','2024-05-22 23:56:39'),(148,'jayde',23,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:39','2024-05-22 23:56:39'),(149,'elisa',24,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:39','2024-05-22 23:56:39'),(150,'raoul',25,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:39','2024-05-22 23:56:39'),(151,'emmalee',26,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:40','2024-05-22 23:56:40'),(152,'katelynn',27,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:40','2024-05-22 23:56:40'),(153,'furman',28,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:40','2024-05-22 23:56:40'),(154,'annabell',29,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:41','2024-05-22 23:56:41'),(155,'jeanie',30,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:41','2024-05-22 23:56:41'),(156,'reina',31,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:41','2024-05-22 23:56:41'),(157,'ashtyn',32,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:41','2024-05-22 23:56:41'),(158,'chet',33,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:42','2024-05-22 23:56:42'),(159,'rupert',34,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:42','2024-05-22 23:56:42'),(160,'lafayette',35,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:42','2024-05-22 23:56:42'),(161,'meredith',36,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:43','2024-05-22 23:56:43'),(162,'travon',37,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:43','2024-05-22 23:56:43'),(163,'frankie',38,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:43','2024-05-22 23:56:43'),(164,'lavina',39,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:43','2024-05-22 23:56:43'),(165,'wilhelm',40,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:44','2024-05-22 23:56:44'),(166,'gail',41,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:44','2024-05-22 23:56:44'),(167,'linda',42,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:44','2024-05-22 23:56:44'),(168,'edmund',43,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:45','2024-05-22 23:56:45'),(169,'preston',44,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:45','2024-05-22 23:56:45'),(170,'tiffany',45,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:45','2024-05-22 23:56:45'),(171,'kristian',46,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:45','2024-05-22 23:56:45'),(172,'delilah',47,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:46','2024-05-22 23:56:46'),(173,'zachary',48,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:46','2024-05-22 23:56:46'),(174,'reilly',49,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:46','2024-05-22 23:56:46'),(175,'joanne',50,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:47','2024-05-22 23:56:47'),(176,'fay',51,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:47','2024-05-22 23:56:47'),(177,'madisyn',52,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:47','2024-05-22 23:56:47'),(178,'cicero',53,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:48','2024-05-22 23:56:48'),(179,'rodrick',54,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:48','2024-05-22 23:56:48'),(180,'nellie',55,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:48','2024-05-22 23:56:48'),(181,'valentine',56,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:48','2024-05-22 23:56:48'),(182,'jamison',57,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:49','2024-05-22 23:56:49'),(183,'jonathan',58,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:49','2024-05-22 23:56:49'),(184,'graham',59,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:49','2024-05-22 23:56:49'),(185,'marisa',60,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:50','2024-05-22 23:56:50'),(186,'elody',61,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:50','2024-05-22 23:56:50'),(187,'grace',62,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:50','2024-05-22 23:56:50'),(188,'sid',63,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:50','2024-05-22 23:56:50'),(189,'dean',64,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:51','2024-05-22 23:56:51'),(190,'justice',65,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:51','2024-05-22 23:56:51'),(191,'drew',66,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:51','2024-05-22 23:56:51'),(192,'chandler',67,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:52','2024-05-22 23:56:52'),(193,'zetta',68,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:52','2024-05-22 23:56:52'),(194,'brandyn',69,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:52','2024-05-22 23:56:52'),(195,'letitia',70,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:52','2024-05-22 23:56:52'),(196,'ashtyn',71,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:53','2024-05-22 23:56:53'),(197,'araceli',72,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:53','2024-05-22 23:56:53'),(198,'brisa',73,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:53','2024-05-22 23:56:53'),(199,'leila',74,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:54','2024-05-22 23:56:54'),(200,'diego',75,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:54','2024-05-22 23:56:54'),(201,'kurtis',76,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:54','2024-05-22 23:56:54'),(202,'berniece',77,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:55','2024-05-22 23:56:55'),(203,'ava',78,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:55','2024-05-22 23:56:55'),(204,'anahi',79,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:55','2024-05-22 23:56:55'),(205,'isaias',80,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:56','2024-05-22 23:56:56'),(206,'orie',81,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:56','2024-05-22 23:56:56'),(207,'golden',82,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:56','2024-05-22 23:56:56'),(208,'yadira',83,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:56','2024-05-22 23:56:56'),(209,'kayli',84,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:57','2024-05-22 23:56:57'),(210,'waylon',85,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:57','2024-05-22 23:56:57'),(211,'kelvin',86,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:57','2024-05-22 23:56:57'),(212,'hayden',87,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:58','2024-05-22 23:56:58'),(213,'misty',88,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:58','2024-05-22 23:56:58'),(214,'hugh',89,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:58','2024-05-22 23:56:58'),(215,'marilie',90,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:58','2024-05-22 23:56:58'),(216,'marjory',91,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:59','2024-05-22 23:56:59'),(217,'laurie',92,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:59','2024-05-22 23:56:59'),(218,'america',93,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:56:59','2024-05-22 23:56:59'),(219,'clifton',94,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:00','2024-05-22 23:57:00'),(220,'aglae',95,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:00','2024-05-22 23:57:00'),(221,'josue',96,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:00','2024-05-22 23:57:00'),(222,'virgie',97,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:00','2024-05-22 23:57:00'),(223,'jaquelin',98,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:01','2024-05-22 23:57:01'),(224,'genoveva',99,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:01','2024-05-22 23:57:01'),(225,'allene',100,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-22 23:57:01','2024-05-22 23:57:01'),(226,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(227,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(228,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(229,'design',1,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(230,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(231,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(232,'healthy',4,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(233,'travel-tips',5,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(234,'hotel',6,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(235,'nature',7,'Botble\\Blog\\Models\\Category','','2024-05-22 23:57:03','2024-05-22 23:57:03'),(236,'jack-persion',1,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(237,'tyler-men',2,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(238,'mohamed-salah',3,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(239,'xao-shin',4,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(240,'peter-cop',5,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(241,'jacob-jones',6,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(242,'court-henry',7,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03'),(243,'theresa',8,'Botble\\Team\\Models\\Team','teams','2024-05-22 23:57:03','2024-05-22 23:57:03');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(2,'England','england','EN',2,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-05-22 23:56:27','2024-05-22 23:56:27');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-05-22 23:56:23','2024-05-22 23:56:23'),(2,'Event',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-05-22 23:56:23','2024-05-22 23:56:23');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jack Persion','teams/1.png','Developer Fullstack','USA','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Tyler Men','teams/2.png','Business Analyst','Qatar','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Mohamed Salah','teams/3.png','Developer Fullstack','India','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Xao Shin','teams/4.png','Developer Fullstack','China','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Peter Cop','teams/5.png','Designer','Russia','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Jacob Jones','teams/6.png','Frontend Developer','New York, US','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Court Henry','teams/7.png','Backend Developer','Portugal','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Theresa','teams/8.png','Backend Developer','Thailand','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-22 23:57:02','2024-05-22 23:57:02',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Ellis Kim','Alice looked round, eager to see if she had succeeded in bringing herself down to them, they set to work throwing everything within her reach at the window, I only wish people knew that: then they.','testimonials/1.png','Digital Artist','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(2,'John Smith','I\'m afraid, sir\' said Alice, timidly; \'some of the teacups as the soldiers had to fall a long time together.\' \'Which is just the case with my wife; And the Gryphon answered, very nearly in the.','testimonials/2.png','Product designer','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(3,'Sayen Ahmod','Hatter. \'You might just as well. The twelve jurors were writing down \'stupid things!\' on their backs was the same as the large birds complained that they were playing the Queen in front of them.','testimonials/3.png','Developer','published','2024-05-22 23:57:02','2024-05-22 23:57:02'),(4,'Tayla Swef','I think it was,\' the March Hare. The Hatter shook his head contemptuously. \'I dare say there may be different,\' said Alice; not that she began very cautiously: \'But I don\'t like it, yer honour, at.','testimonials/4.png','Graphic designer','published','2024-05-22 23:57:02','2024-05-22 23:57:02');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'may10@skiles.com',NULL,'$2y$12$ZjxIFzwXkfJ2Lm5QlC0bc.2WQupEp/dsH/a2pGRjXGTB2YOQ9quHe',NULL,'2024-05-22 23:56:17','2024-05-22 23:56:17','Harmon','Ratke','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer_sidebar','jobbox',0,'{\"id\":\"NewsletterWidget\",\"title\":\"New Things Will Always <br> Update Regularly\",\"background_image\":\"general\\/newsletter-background-image.png\",\"image_left\":\"general\\/newsletter-image-left.png\",\"image_right\":\"general\\/newsletter-image-right.png\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(2,'SiteInformationWidget','footer_sidebar','jobbox',1,'{\"introduction\":\"JobBox is the heart of the design community and the best resource to discover and connect with designers and jobs worldwide.\",\"facebook_url\":\"#\",\"twitter_url\":\"#\",\"linkedin_url\":\"#\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(3,'CustomMenuWidget','footer_sidebar','jobbox',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Resources\",\"menu_id\":\"resources\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(4,'CustomMenuWidget','footer_sidebar','jobbox',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Community\",\"menu_id\":\"community\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(5,'CustomMenuWidget','footer_sidebar','jobbox',4,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(6,'CustomMenuWidget','footer_sidebar','jobbox',5,'{\"id\":\"CustomMenuWidget\",\"name\":\"More\",\"menu_id\":\"more\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(7,'DownloadWidget','footer_sidebar','jobbox',6,'{\"app_store_url\":\"#\",\"app_store_image\":\"general\\/app-store.png\",\"android_app_url\":\"#\",\"google_play_image\":\"general\\/android.png\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(8,'BlogSearchWidget','primary_sidebar','jobbox',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(9,'BlogCategoriesWidget','primary_sidebar','jobbox',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(10,'BlogPostsWidget','primary_sidebar','jobbox',3,'{\"id\":\"BlogPostsWidget\",\"type\":\"popular\",\"name\":\"Popular Posts\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(11,'BlogTagsWidget','primary_sidebar','jobbox',4,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(12,'BlogSearchWidget','blog_sidebar','jobbox',0,'{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\",\"description\":\"Search blog posts\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(13,'BlogPostsWidget','blog_sidebar','jobbox',1,'{\"id\":\"BlogPostsWidget\",\"name\":\"Blog posts\",\"description\":\"Blog posts widget.\",\"type\":\"popular\",\"number_display\":5}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(14,'AdsBannerWidget','blog_sidebar','jobbox',2,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(15,'GalleryWidget','blog_sidebar','jobbox',3,'{\"id\":\"GalleryWidget\",\"name\":\"Gallery\",\"title_gallery\":\"Gallery\",\"number_image\":8}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(16,'AdsBannerWidget','candidate_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-22 23:56:24','2024-05-22 23:56:24'),(17,'AdsBannerWidget','company_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-22 23:56:24','2024-05-22 23:56:24');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 13:57:04
