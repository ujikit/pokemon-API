-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: PokemonMobile
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
INSERT INTO `adonis_schema` VALUES (1,'1503248427885_user',1,'2019-04-29 04:47:34'),(2,'1503248427886_token',1,'2019-04-29 04:47:35'),(3,'1556330470209_types_schema',2,'2019-04-29 04:48:17'),(4,'1556330496853_categories_schema',2,'2019-04-29 04:48:17'),(5,'1556505831011_pokemon_type_schema',2,'2019-04-29 04:48:17');
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Shellfish',NULL,NULL),(2,'Worm',NULL,NULL),(3,'Cocoon',NULL,NULL),(4,'Butterfly',NULL,NULL),(5,'Hairy Bug',NULL,NULL),(6,'Poison Bee',NULL,NULL),(7,'Tiny Bird',NULL,NULL),(8,'Bird',NULL,NULL),(9,'Mouse',NULL,NULL),(10,'Beak',NULL,NULL),(11,'Snake',NULL,NULL);
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
  KEY `pokemon_id` (`pokemon_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `pokemon_type_pokemon_id_foreign` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pokemon_type_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_type`
--

LOCK TABLES `pokemon_type` WRITE;
/*!40000 ALTER TABLE `pokemon_type` DISABLE KEYS */;
INSERT INTO `pokemon_type` VALUES (25,1,2),(26,2,4),(27,3,4),(28,4,4),(29,4,12),(30,5,4),(31,5,7),(32,6,4),(33,6,7),(34,6,4),(35,6,7),(36,7,13),(37,7,12),(38,8,13),(39,8,12),(40,8,13),(41,8,12),(42,9,13),(43,9,13),(44,7,13),(45,7,12),(46,10,13),(47,10,12),(48,11,7);
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
  `latitude_pokemon` varchar(80) DEFAULT NULL,
  `longitude_pokemon` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES (1,'Blastoise',1,'52.936191','4.726726','2019-04-29 04:49:01','2019-04-29 04:49:01'),(2,'Caterpie',2,'-37.7651298','145.3509665','2019-04-29 04:49:01','2019-04-29 04:49:01'),(3,'Metapod',3,'-37.72741180637553','144.83374804258347','2019-04-29 04:49:01','2019-04-29 04:49:01'),(4,'Butterfree',4,'38.191311424705','128.58497142791748','2019-04-29 04:49:01','2019-04-29 04:49:01'),(5,'Weedle',5,'38.199228957618566','128.59359741210938','2019-04-29 04:49:01','2019-04-29 04:49:01'),(6,'Kakuna',6,'51.503488','-0.018359','2019-04-29 04:49:01','2019-04-29 04:49:01'),(7,'Beedrill',6,'34.0092419','-118.49760370000001','2019-04-29 04:49:01','2019-04-29 04:49:01'),(8,'Pidgey',7,'51.529316','0.051945','2019-04-29 04:49:01','2019-04-29 04:49:01'),(9,'Pidgeotto',8,'30.264215','-97.754544','2019-04-29 04:49:01','2019-04-29 04:49:01'),(10,'Pidgeot',8,'52.406730','-1.765572','2019-04-29 04:49:01','2019-04-29 04:49:01'),(11,'Rattata',9,'45.47210','9.17722','2019-04-29 04:49:01','2019-04-29 04:49:01'),(12,'Raticate',9,'37.80198532630738','-122.41267204284668','2019-04-29 04:49:01','2019-04-29 04:49:01'),(13,'Spearow',7,'37.80198532630738','-122.412672042846683','2019-04-29 04:49:01','2019-04-29 04:49:01'),(14,'Fearow',10,'34.103059','-118.258854','2019-04-29 04:49:01','2019-04-29 04:49:01'),(15,'Ekans',11,'51.540822','0.045801','2019-04-29 04:49:01','2019-04-29 04:49:01');
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Physic',NULL,NULL),(2,'Water',NULL,NULL),(3,'Grass',NULL,NULL),(4,'Bug',NULL,NULL),(5,'Fire',NULL,NULL),(6,'Electric',NULL,NULL),(7,'Poison',NULL,NULL),(8,'Ground',NULL,NULL),(9,'Fairy',NULL,NULL),(10,'Fighting',NULL,NULL),(11,'Ice',NULL,NULL),(12,'Flying',NULL,NULL),(13,'Normal',NULL,NULL),(14,'Rock',NULL,NULL);
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
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
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

-- Dump completed on 2019-04-30  5:45:34
