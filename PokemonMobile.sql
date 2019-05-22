-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: PokemonMobile
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adonis_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'1503248427885_user',1,'2019-05-08 04:42:48'),(2,'1503248427886_token',1,'2019-05-08 04:42:49'),(3,'1556330470209_types_schema',1,'2019-05-08 04:42:49'),(4,'1556330496853_categories_schema',1,'2019-05-08 04:42:49'),(5,'1556330462603_pokemons_schema',2,'2019-05-08 04:43:28');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_category` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Shellfish','2019-05-08 05:09:04','2019-05-08 05:09:04'),(2,'Worm','2019-05-08 05:09:04','2019-05-08 05:09:04'),(3,'Cocoon','2019-05-08 05:09:04','2019-05-08 05:09:04'),(4,'Butterfly','2019-05-08 05:09:04','2019-05-08 05:09:04'),(5,'Hairy Bug','2019-05-08 05:09:04','2019-05-08 05:09:04'),(6,'Poison Bee','2019-05-08 05:09:04','2019-05-08 05:09:04'),(7,'Tiny Bird','2019-05-08 05:09:04','2019-05-08 05:09:04'),(8,'Bird','2019-05-08 05:09:04','2019-05-08 05:09:04'),(9,'Mouse','2019-05-08 05:09:04','2019-05-08 05:09:04'),(10,'Beak','2019-05-08 05:09:04','2019-05-08 05:09:04'),(11,'Snake','2019-05-08 05:09:04','2019-05-08 05:09:04');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_type`
--

DROP TABLE IF EXISTS `pokemon_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pokemon_id` int(10) unsigned DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pokemon_id` (`pokemon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_type`
--

LOCK TABLES `pokemon_type` WRITE;
/*!40000 ALTER TABLE `pokemon_type` DISABLE KEYS */;
INSERT INTO `pokemon_type` VALUES (25,1,2),(26,2,4),(27,3,4),(28,4,4),(29,4,12),(30,5,4),(31,5,7),(32,6,4),(33,6,7),(34,6,4),(35,6,7),(36,7,13),(37,7,12),(38,8,13),(39,8,12),(40,8,13),(41,8,12),(42,9,13),(43,9,13),(44,7,13),(45,7,12),(46,10,13),(47,10,12),(48,11,7),(49,1,4),(50,1,12),(51,12,8);
/*!40000 ALTER TABLE `pokemon_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemons`
--

DROP TABLE IF EXISTS `pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pokemon` varchar(80) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `img_format_pokemon` varchar(6) DEFAULT NULL,
  `latitude_pokemon` varchar(80) DEFAULT NULL,
  `longitude_pokemon` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `pokemons_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES (1,'Blastoise',1,'.png','31.78336','35.23388','2019-04-29 04:49:01','2019-05-04 17:05:57'),(2,'Caterpie',2,'.png','31.5','34.46667','2019-04-29 04:49:01','2019-04-29 04:49:01'),(3,'Metapod',3,'.png','31.34018','34.30627','2019-04-29 04:49:01','2019-04-29 04:49:01'),(4,'Butterfree',4,'.png','31.89964','35.20422','2019-04-29 04:49:01','2019-04-29 04:49:01'),(5,'Weedle',5,'.png','31.31913','34.34005','2019-04-29 04:49:01','2019-05-04 16:20:55'),(6,'Kakuna',6,'.png','31.76215','35.26166','2019-04-29 04:49:01','2019-04-29 04:49:01'),(7,'Beedrill',6,'.png','31.77078','35.26917','2019-04-29 04:49:01','2019-04-29 04:49:01'),(8,'Pidgey',7,'.png','31.91001','35.21645','2019-04-29 04:49:01','2019-05-04 16:18:25'),(9,'Pidgeotto',8,'.png','31.43944','34.40306','2019-04-29 04:49:01','2019-04-29 04:49:01'),(10,'Pidgeot',8,'.png','31.39671','35.06611','2019-04-29 04:49:01','2019-04-29 04:49:01'),(11,'Rattata',9,'.png','31.40967','34.97329','2019-04-29 04:49:01','2019-04-29 04:49:01'),(12,'Raticate',9,'.png','31.43954','34.38053','2019-04-29 04:49:01','2019-04-29 04:49:01'),(13,'Spearow',7,'.png','32.21207','35.28561','2019-04-29 04:49:01','2019-05-04 17:04:40'),(15,'Ekans',11,'.png','31.51591','35.16416','2019-04-29 04:49:01','2019-04-29 04:49:01');
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  KEY `tokens_token_index` (`token`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_type` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Physic','2019-05-08 05:14:14','2019-05-08 05:14:14'),(2,'Water','2019-05-08 05:14:14','2019-05-08 05:14:14'),(3,'Grass','2019-05-08 05:14:14','2019-05-08 05:14:14'),(4,'Bug','2019-05-08 05:14:14','2019-05-08 05:14:14'),(5,'Fire','2019-05-08 05:14:14','2019-05-08 05:14:14'),(6,'Electric','2019-05-08 05:14:14','2019-05-08 05:14:14'),(7,'Poison','2019-05-08 05:14:14','2019-05-08 05:14:14'),(8,'Ground','2019-05-08 05:14:14','2019-05-08 05:14:14'),(9,'Fairy','2019-05-08 05:14:14','2019-05-08 05:14:14'),(10,'Fighting','2019-05-08 05:14:14','2019-05-08 05:14:14'),(11,'Ice','2019-05-08 05:14:14','2019-05-08 05:14:14'),(12,'Flying','2019-05-08 05:14:14','2019-05-08 05:14:14'),(13,'Normal','2019-05-08 05:14:14','2019-05-08 05:14:14'),(14,'Rock','2019-05-08 05:14:14','2019-05-08 05:14:14');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ujikit','ujikit@gmail.com','$2a$10$RSTyRqG5Fl.bMdRxDSTTjOynKb/BJxzWjbXmrZsaYTlJ4MbkQoceK','2019-04-30 00:29:00','2019-04-30 00:29:00');
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

-- Dump completed on 2019-05-22 21:39:26
