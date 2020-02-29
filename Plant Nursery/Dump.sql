-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: plant_nursery
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs` (
  `pot_id` varchar(20) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `feeding` decimal(5,0) DEFAULT NULL,
  `watering` decimal(5,0) DEFAULT NULL,
  `move` varchar(30) DEFAULT NULL,
  `measure_time` datetime DEFAULT NULL,
  KEY `pot_id` (`pot_id`),
  KEY `location` (`location`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`pot_id`) REFERENCES `pots` (`pot_id`) ON DELETE CASCADE,
  CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`location`) REFERENCES `weather_station` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('p-659a24','0,0',3,2,NULL,'2019-05-15 09:00:00'),('p-038j65','0,0',3,2,NULL,'2019-05-15 09:01:00'),('p-937q03','0,0',3,2,NULL,'2019-05-15 09:02:00'),('p-837t82','0,0',3,2,NULL,'2019-05-15 09:03:00'),('p-847y39','0,0',3,2,NULL,'2019-05-15 09:04:00'),('p-682h28','0,0',3,2,NULL,'2019-05-15 09:05:00'),('p-374y38','0,0',3,2,NULL,'2019-05-15 09:06:00'),('p-572z43','0,0',3,2,NULL,'2019-05-15 09:07:00'),('p-681n32','0,0',3,2,NULL,'2019-05-15 09:08:00'),('p-018k32','0,0',4,4,NULL,'2019-04-13 10:00:00'),('p-634u19','0,0',3,4,NULL,'2019-04-13 10:03:00'),('p-822v69','0,0',3,3,NULL,'2019-04-20 10:05:00'),('p-062r26','0,0',4,5,NULL,'2019-05-03 10:28:00'),('p-888w11','0,0',4,5,NULL,'2019-05-08 11:00:00'),('p-281x84','3,0',3,3,NULL,'2019-05-12 09:00:00'),('p-928k17','3,0',3,3,NULL,'2019-05-12 09:01:00'),('p-572e86','3,0',3,3,NULL,'2019-05-12 09:02:00'),('p-682u33','3,0',2,1,NULL,'2019-05-09 10:00:00'),('p-772b11','3,0',2,1,NULL,'2019-05-07 10:05:00'),('p-883p42','3,0',2,1,NULL,'2019-05-07 10:06:00'),('p-132a55','3,0',2,1,NULL,'2019-05-08 10:10:00'),('p-029l22','3,0',2,1,NULL,'2019-05-08 10:11:00'),('p-202u21','3,0',2,1,NULL,'2019-05-09 10:00:00'),('p-667p12','0,3',1,1,NULL,'2019-02-03 13:00:00'),('p-909j11','0,3',2,2,NULL,'2019-02-10 12:01:00'),('p-522w75','0,3',2,3,NULL,'2019-02-27 11:01:00'),('p-003d12','0,3',3,3,NULL,'2019-03-09 01:09:00'),('p-638h32','0,3',3,4,NULL,'2019-03-30 15:21:00'),('p-856y21','0,3',4,4,NULL,'2019-04-10 12:33:00'),('p-673y21','0,3',4,4,NULL,'2019-04-15 11:54:00'),('p-572b43','0,3',4,4,NULL,'2019-04-28 16:38:00'),('p-682u55','0,3',4,5,NULL,'2019-05-10 13:43:00'),('p-445s98','0,3',3,3,NULL,'2019-04-10 13:43:00'),('p-055w99','0,3',1,2,NULL,'2019-04-21 13:43:00'),('p-582g47','0,3',3,4,NULL,'2019-05-03 13:43:00'),('p-917j32','0,3',3,3,NULL,'2019-04-23 13:43:00'),('p-012n38','0,3',3,3,NULL,'2019-05-10 13:43:00'),('p-662f28','3,3',1,1,NULL,'2019-04-03 10:00:00'),('p-112b43','3,3',1,1,NULL,'2019-04-03 10:01:00'),('p-884f21','3,3',2,2,NULL,'2019-04-25 12:43:00'),('p-466j23','3,3',2,2,NULL,'2019-04-25 12:44:00'),('p-383z49','3,3',3,3,NULL,'2019-04-10 13:22:00'),('p-673d56','3,3',3,3,NULL,'2019-04-15 12:33:00'),('p-883c32','3,3',3,4,NULL,'2019-04-23 11:32:00'),('p-244h96','3,3',4,4,NULL,'2019-04-20 15:30:00');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `measurement` (
  `location` varchar(5) DEFAULT NULL,
  `temperature` varchar(25) DEFAULT NULL,
  `air_moisture` varchar(15) DEFAULT NULL,
  `light` decimal(10,0) DEFAULT NULL,
  KEY `location` (`location`),
  CONSTRAINT `measurement_ibfk_1` FOREIGN KEY (`location`) REFERENCES `weather_station` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
INSERT INTO `measurement` VALUES ('0,0','75°F','80%',2500),('0,0','75°F','81%',2400),('0,0','80°F','80%',3700),('0,0','80°F','80%',4000),('0,0','80°F','80%',3950),('3,0','75°F','59%',2800),('3,0','76°F','60%',2600),('3,0','75°F','60%',2300),('3,0','76°F','60%',2500),('3,0','76°F','62%',2500),('3,0','76°F','58%',3000),('3,0','75°F','60%',2900),('3,0','75°F','60%',2750),('0,3','80°F','80%',3500),('0,3','80°F','79%',3650),('0,3','81°F','79%',3600),('0,3','81°F','79%',3400),('0,3','80°F','80%',3500),('0,3','80°F','80%',3500),('0,3','80°F','80%',3500),('0,3','80°F','80%',3300),('0,3','80°F','80%',3550),('0,3','80°F','80%',3350),('3,3','80°F','80%',3800),('3,3','80°F','80%',3700),('3,3','80°F','80%',3900),('3,3','80°F','80%',3600),('3,3','80°F','80%',3850),('3,3','80°F','80%',3650),('3,3','80°F','80%',3550),('3,3','80°F','80%',3550),('3,3','80°F','80%',3450);
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plants` (
  `species_name` varchar(30) NOT NULL,
  `common_name` varchar(25) DEFAULT NULL,
  `variety` varchar(25) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `germ_days` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`species_name`,`variety`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES ('Allium Cepa L','Onion','Red Onion','vegetable','Bulb shaped, oval, Deep red colour, strong smell and taste','7-10 days'),('Allium Cepa L','Onion','Sweet Onion','vegetable','Bulb shaped, oval, white color, mild smell and taste','7-10 days'),('Ananas Comosus','Pineapple','Hilo','fruit','Compact, cylindrical, sweet/sour flavor','100-180 days'),('Ananas Comosus','Pineapple','Kona Sugarloaf','fruit','Cylindrical, white flesh, sweet flavor','100-180 days'),('Brassica Oleracea','Wild Cabbage','Broccoli','vegetable','Dark green, tree-like structure coming out of a thick stalk','10-14 days'),('Brassica Oleracea','Wild Cabbage','Cabbage','vegetable','Light green, dense leaves, spherical','3-4 days'),('Capsicum Annuum','Chile Pepper','Bell Pepper','fruit','Variety of colors, oval shape with longitudinal ridges, mild taste','7-8 days'),('Capsicum Annuum','Chile Pepper','Jalapeno','fruit','Medium sized pepper, dark green, firm smooth flesh, spicy taste','10-14 days'),('Coriandrum Sativum','Coriander','European Coriander','herb','Tart taste, light grean leaves','7-9 days'),('Coriandrum Sativum','Coriander','Indian Coriander','herb','Tart taste, light grean leaves, skinny stalk','7-9 days'),('Cucumis Melo','Muskmelon','Cantaloupe','fruit','Slightly oval, light brown husk, pale orange flesh, sweet taste','7-14 days'),('Cucumis Melo','Muskmelon','Honeydew','fruit','Slightly oval, light green/brown husk, pale green flesh, sweet taste','8-10 days'),('Cucurbita Pepo','Squash','Acorn Squash','vegetable','Dark green, round with longitudinal ridges, with yellow-orange inside','7-12 days'),('Cucurbita Pepo','Squash','Pumpkin','vegetable','Round, spherical, deep orange color, thick shell, rich full taste','5-10 days'),('Cuminum Cyminum','Cumin','Indian Cumin','herb','Slender stem, small pink flowers','7-14 days'),('Cuminum Cyminum','Cumin','Morrocon Cumin','herb','Slender stem, small white flowers','7-14 days'),('Daucus Carota','Carrot','Chantenay Carrot','vegetable','Short, thick, orange color, sweet and crisp','14-21 days'),('Daucus Carota','Carrot','Danvers Carrot','vegetable','Medium size, longer root, dark orange color, \"half size\"','14-21 days'),('Fragaria Ananassa','Strawberry','Allstar','fruit','Bright orange/red berries, sweet flavor','7-14 days'),('Fragaria Ananassa','Strawberry','Honeoye','fruit','Glossy red appearance, firm, mild/sweet flavor','7-14 days'),('Laurus Nobilis','Bayleaf','California Bay Leaf','herb','Green ,crinkly leaves','14-180 days'),('Laurus Nobilis','Bayleaf','Mediterranean Bay Leaf','herb','Dull green, clean leaves','14-180 days'),('Ocimum Basilicum','Basil','Cinnamon Basil','herb','Dark green, shiny leaves, short plant, spicy flavor','5-10 days'),('Ocimum Basilicum','Basil','Lettuce Leaf Basil','herb','Large crinkled leaves, short plant, sweet flavor','5-10 days'),('Origanum Vulgare','Oregano','Aureum','herb','Mild taste,','7-14 days'),('Origanum Vulgare','Oregano','Greek Kaliter','herb','Mild taste, small, hardy, dark, compact, thick, silvery-haired leaves, strong taste','7-14 days'),('Petroselinum Crispum','Parsley','Leaf Parsley','herb','Deep light green, leafy, strong flavor','10-25 days'),('Petroselinum Crispum','Parsley','Root Parsley','herb','Green, deep roots','10-25 days'),('Rubus Ursinus','Blackberry','California Blackberry','fruit','Shrub with dark black/purple berries, slightly sour tasting berries','15-20 days'),('Rubus Ursinus','Blackberry','Pacific Dewberry','fruit','Shrub with dark purple berries, sweet/sour tasting berries','15-20 days'),('Solanum Lycopersicum','Tomato','Cherry Tomato','vegetable','Small, round, sweet, red color, 1-2cm large','5-6 days'),('Solanum Lycopersicum','Tomato','Plum Tomato','vegetable','Oval shape, red in color, low number of seed compartments, high solid content','5-6 days'),('Solanum Melongena','Eggplant','Casper Eggplant','vegetable','Shorter length, thick, white in color','7-14 days'),('Solanum Melongena','Eggplant','Purple Eggplant','vegetable','Elongated oval shape, thicker at bottom, Dark purple color','7-14 days'),('Vitis Labrusca','Fox Grape','Concord Grape','fruit','Light brown leaves, dark blue/purple grapes, sweet flavor','14-56 days'),('Vitis Labrusca','Fox Grape','Delaware Grape','fruit','Light greenleaves, light purple grapes, sweet flavor','21-46 days');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pots`
--

DROP TABLE IF EXISTS `pots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pots` (
  `pot_id` varchar(20) NOT NULL,
  `tray_id` varchar(20) NOT NULL,
  `plant_date` date DEFAULT NULL,
  `germ_date` date DEFAULT NULL,
  `volume` decimal(2,0) NOT NULL,
  `height` decimal(2,0) NOT NULL,
  PRIMARY KEY (`pot_id`),
  UNIQUE KEY `pot_id` (`pot_id`),
  KEY `tray_id` (`tray_id`),
  CONSTRAINT `pots_ibfk_1` FOREIGN KEY (`tray_id`) REFERENCES `tray` (`tray_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pots`
--

LOCK TABLES `pots` WRITE;
/*!40000 ALTER TABLE `pots` DISABLE KEYS */;
INSERT INTO `pots` VALUES ('p-003d12','t-9928i12','2019-02-03','2019-02-08',15,12),('p-012n38','t-1154e28','2019-03-01','2019-04-02',7,12),('p-018k32','t-8572k92','2019-03-10','2019-04-22',7,12),('p-029l22','t-2512i22','2019-05-01','2019-05-08',5,6),('p-038j65','t-1433b89','2019-05-15',NULL,1,3),('p-055w99','t-1154e28','2019-03-01','2019-03-26',7,12),('p-062r26','t-8572k92','2019-03-10','2019-04-14',7,12),('p-111s53','t-0903l11','2019-04-03','2019-04-08',10,8),('p-112b43','t-0903l11','2019-04-03','2019-04-08',10,8),('p-132a55','t-2512i22','2019-05-01','2019-05-08',5,6),('p-202u21','t-2512i22','2019-05-01','2019-05-09',5,6),('p-244h96','t-0903l11','2019-04-03','2019-04-09',10,8),('p-281x84','t-2512i22','2019-05-12',NULL,2,4),('p-374y38','t-1433b89','2019-05-15',NULL,1,3),('p-383z49','t-0903l11','2019-04-03','2019-04-08',10,8),('p-445s98','t-1154e28','2019-03-01','2019-03-30',7,12),('p-466j23','t-0903l11','2019-04-03','2019-04-09',10,8),('p-522w75','t-9928i12','2019-02-03','2019-02-08',15,12),('p-572b43','t-9928i12','2019-02-03','2019-02-08',15,12),('p-572e86','t-2512i22','2019-05-12',NULL,2,4),('p-572z43','t-1433b89','2019-05-15',NULL,1,3),('p-573d22','t-1154e28','2019-03-01','2019-04-11',7,12),('p-582g47','t-1154e28','2019-03-01','2019-04-20',7,12),('p-634u19','t-8572k92','2019-03-10','2019-04-08',7,12),('p-638h32','t-9928i12','2019-02-03','2019-02-08',15,12),('p-659a24','t-1433b89','2019-05-15',NULL,1,3),('p-662f28','t-0903l11','2019-04-03','2019-04-09',10,8),('p-667p12','t-9928i12','2019-02-03','2019-02-09',15,12),('p-673d56','t-0903l11','2019-04-03','2019-04-08',10,8),('p-673y21','t-9928i12','2019-02-03','2019-02-09',15,12),('p-681n32','t-1433b89','2019-05-15',NULL,1,3),('p-682h28','t-1433b89','2019-05-15',NULL,1,3),('p-682u33','t-2512i22','2019-05-01','2019-05-09',5,6),('p-682u55','t-9928i12','2019-02-03','2019-02-08',15,12),('p-764q01','t-8572k92','2019-03-10','2019-04-01',7,12),('p-772b11','t-2512i22','2019-05-01','2019-05-07',5,6),('p-822v69','t-8572k92','2019-03-10','2019-04-21',7,12),('p-837t82','t-1433b89','2019-05-15',NULL,1,3),('p-847y39','t-1433b89','2019-05-15',NULL,1,3),('p-856y21','t-9928i12','2019-02-03','2019-02-09',15,12),('p-883c32','t-0903l11','2019-04-03','2019-04-10',10,8),('p-883p42','t-2512i22','2019-05-01','2019-05-07',5,6),('p-884f21','t-0903l11','2019-04-03','2019-04-08',10,8),('p-888w11','t-8572k92','2019-03-10','2019-04-02',7,12),('p-909j11','t-9928i12','2019-02-03','2019-02-08',15,12),('p-917j32','t-1154e28','2019-03-01','2019-03-28',7,12),('p-928k17','t-2512i22','2019-05-12',NULL,2,4),('p-937q03','t-1433b89','2019-05-15',NULL,1,3);
/*!40000 ALTER TABLE `pots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potted`
--

DROP TABLE IF EXISTS `potted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `potted` (
  `species_name` varchar(25) DEFAULT NULL,
  `variety` varchar(25) DEFAULT NULL,
  `pot_id` varchar(20) DEFAULT NULL,
  KEY `species_name` (`species_name`,`variety`),
  KEY `pot_id` (`pot_id`),
  CONSTRAINT `potted_ibfk_1` FOREIGN KEY (`species_name`, `variety`) REFERENCES `plants` (`species_name`, `variety`),
  CONSTRAINT `potted_ibfk_2` FOREIGN KEY (`pot_id`) REFERENCES `pots` (`pot_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potted`
--

LOCK TABLES `potted` WRITE;
/*!40000 ALTER TABLE `potted` DISABLE KEYS */;
INSERT INTO `potted` VALUES ('Ocimum Basilicum','Lettuce Leaf Basil','p-659a24'),('Ocimum Basilicum','Lettuce Leaf Basil','p-038j65'),('Ocimum Basilicum','Lettuce Leaf Basil','p-937q03'),('Ocimum Basilicum','Lettuce Leaf Basil','p-837t82'),('Ocimum Basilicum','Lettuce Leaf Basil','p-847y39'),('Ocimum Basilicum','Lettuce Leaf Basil','p-682h28'),('Ocimum Basilicum','Lettuce Leaf Basil','p-374y38'),('Ocimum Basilicum','Lettuce Leaf Basil','p-572z43'),('Ocimum Basilicum','Lettuce Leaf Basil','p-681n32'),('Ocimum Basilicum','Cinnamon Basil','p-281x84'),('Ocimum Basilicum','Cinnamon Basil','p-928k17'),('Ocimum Basilicum','Cinnamon Basil','p-572e86'),('Ocimum Basilicum','Cinnamon Basil','p-682u33'),('Ocimum Basilicum','Cinnamon Basil','p-772b11'),('Ocimum Basilicum','Cinnamon Basil','p-883p42'),('Ocimum Basilicum','Cinnamon Basil','p-132a55'),('Ocimum Basilicum','Cinnamon Basil','p-029l22'),('Ocimum Basilicum','Cinnamon Basil','p-202u21'),('Solanum Lycopersicum','Plum Tomato','p-667p12'),('Solanum Lycopersicum','Plum Tomato','p-909j11'),('Solanum Lycopersicum','Plum Tomato','p-522w75'),('Solanum Lycopersicum','Plum Tomato','p-003d12'),('Solanum Lycopersicum','Plum Tomato','p-638h32'),('Solanum Lycopersicum','Plum Tomato','p-856y21'),('Solanum Lycopersicum','Plum Tomato','p-673y21'),('Solanum Lycopersicum','Plum Tomato','p-572b43'),('Solanum Lycopersicum','Plum Tomato','p-682u55'),('Solanum Lycopersicum','Cherry Tomato','p-662f28'),('Solanum Lycopersicum','Cherry Tomato','p-112b43'),('Solanum Lycopersicum','Cherry Tomato','p-884f21'),('Solanum Lycopersicum','Cherry Tomato','p-466j23'),('Solanum Lycopersicum','Cherry Tomato','p-383z49'),('Solanum Lycopersicum','Cherry Tomato','p-673d56'),('Solanum Lycopersicum','Cherry Tomato','p-883c32'),('Solanum Lycopersicum','Cherry Tomato','p-244h96'),('Solanum Lycopersicum','Cherry Tomato','p-111s53'),('Vitis Labrusca','Delaware Grape','p-018k32'),('Vitis Labrusca','Delaware Grape','p-764q01'),('Vitis Labrusca','Delaware Grape','p-888w11'),('Vitis Labrusca','Delaware Grape','p-634u19'),('Vitis Labrusca','Delaware Grape','p-062r26'),('Vitis Labrusca','Delaware Grape','p-822v69'),('Vitis Labrusca','Concord Grape','p-917j32'),('Vitis Labrusca','Concord Grape','p-573d22'),('Vitis Labrusca','Concord Grape','p-445s98'),('Vitis Labrusca','Concord Grape','p-582g47'),('Vitis Labrusca','Concord Grape','p-012n38'),('Vitis Labrusca','Concord Grape','p-055w99');
/*!40000 ALTER TABLE `potted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `requirements` (
  `species_name` varchar(30) NOT NULL,
  `feeding` varchar(200) DEFAULT NULL,
  `watering` varchar(200) DEFAULT NULL,
  `temperature` varchar(200) DEFAULT NULL,
  `air_moisture` varchar(200) DEFAULT NULL,
  `light` varchar(200) DEFAULT NULL,
  KEY `species_name` (`species_name`),
  CONSTRAINT `requirements_ibfk_1` FOREIGN KEY (`species_name`) REFERENCES `plants` (`species_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES ('Solanum Lycopersicum','Fertilize right after planting. Fertilize once every one to two weeks after fruit.','Water once every morning until flowered, then twice a day once flowered.','Daytime: 65-85 degrees Fahrenheit | Nighttime: below 85 degrees farenheight.','Daytime: 80%-90% | Nighttime: 65%-75%','Normal light hours | Shorten daytime to ripen faster'),('Solanum Melongena','Fertilize right after planting, Fertilize once a week after fruit.','Water once every morning','Daytime: 70-80 degrees farenheight | Nighttime: below 80 degrees farenheight','Daytime: 70%-90% | Nighttime: 60%-70%','Normal light hours'),('Allium Cepa L','Fertilize every 2 weeks','Water every morning','Daytime: 70-90 degrees farenheight| Nighttime: below 80 degrees farenheight','Daytime: 80% | Nighttime: 60%','6-8 hours a day'),('Daucus Carota','Fertilize every 2 weeks','Water twice a day','70-90 degrees farenheight','80%','6-8 hours a day'),('Brassica Oleracea','Fertilize every week once flowered','Water twice a day','50-70 degrees farenheight','80%-90%','6 hours a day'),('Cucurbita Pepo','Fertilize once every week once flowered','Water twice a day','65-80 degrees farenheight','80%','6-8 hours a day'),('Capsicum Annuum','Fertilize once every two weeks','Water once a day','70-90 degrees farenheight','70%-80%','6-8 hours a day'),('Cucumis Melo','Fertilize once a week','Water once a day','80-90 degrees farenheight','80%-90%','7-8 hours a day'),('Rubus Ursinus','Fertilize once every two weeks','Water twice a day','70-80 degrees farenheight','70%-80%','6-8 hours a day'),('Fragaria Ananassa','Fertilize once every two weeks','Water twice a day','60degrees farenheight','70%-80%','6-8 hours a day'),('Vitis Labrusca','Fertilize once every two weeks','Water twice a day','50 degrees farenheight','80%-90%','6 hours a day'),('Ananas Comosus','Fertilize every week','Water once a day','70-90 degrees farenheight','80%','6-8 hours a day'),('Ocimum Basilicum','once every 4-6 weeks','once every 3-4 days','70-80 degrees farenheight','60%','6 hours a day'),('Laurus Nobilis','once every 3-4 weeks','once every 3-4 days','above 50 degrees farenheight','60%','6 hours a day'),('Coriandrum Sativum','once every 4 weeks','once every 3 days','70 degrees farenheight','70%','6 hours a day'),('Cuminum Cyminum','once every 3-5 weeks','once every 4-5 days','80 degrees farenheight','50%','6-8 hours a day'),('Petroselinum Crispum','once every 4 weeks','once every 2 days','80 degrees farenheight','60%','6 hours a day'),('Origanum Vulgare','once every 4-6 weeks','once every 4 days','70-90 degrees farenheight','50%','6-8 hours a day');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tray`
--

DROP TABLE IF EXISTS `tray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tray` (
  `tray_id` varchar(20) NOT NULL,
  `current_location` varchar(5) DEFAULT NULL,
  `last_action` datetime DEFAULT NULL,
  PRIMARY KEY (`tray_id`),
  UNIQUE KEY `tray_id` (`tray_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tray`
--

LOCK TABLES `tray` WRITE;
/*!40000 ALTER TABLE `tray` DISABLE KEYS */;
INSERT INTO `tray` VALUES ('t-0903l11','3,3','2019-05-01 09:51:31'),('t-1154e28','0,3','2019-04-29 10:31:12'),('t-1433b89','0,0','2019-05-13 12:32:02'),('t-2512i22','3,0','2019-04-11 14:20:15'),('t-8572k92','0,0','2019-03-04 12:11:25'),('t-9928i12','0,3','2019-05-02 13:45:50');
/*!40000 ALTER TABLE `tray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_station`
--

DROP TABLE IF EXISTS `weather_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `weather_station` (
  `location` varchar(5) NOT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_station`
--

LOCK TABLES `weather_station` WRITE;
/*!40000 ALTER TABLE `weather_station` DISABLE KEYS */;
INSERT INTO `weather_station` VALUES ('0,0'),('0,3'),('3,0'),('3,3');
/*!40000 ALTER TABLE `weather_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'plant_nursery'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-15 22:13:12
