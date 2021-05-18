-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: etogni_db
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hcpjqonizduxbqigbwouahopvuudxnxsnlhv` (`sessionId`,`volumeId`),
  KEY `idx_ahtguvxnpofkxfcigmtppymsuhyvclmokzmo` (`volumeId`),
  CONSTRAINT `fk_vzsmrpteyronfwvpcvdvbmeugupeukqxbvvd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_duxciudvhryqrwhgiwdpanamsivowyhlkzxn` (`filename`,`folderId`),
  KEY `idx_kgaebpeqtuhcklknmkxnkvlqerpxyrddbxfv` (`folderId`),
  KEY `idx_bbkworuvgqdcgxpznphqhadnuzomaniqxodh` (`volumeId`),
  KEY `fk_vkmofeblmaojkhyprfxxcrjtrkamhecareum` (`uploaderId`),
  CONSTRAINT `fk_immtjcxzbusgixtiqtmtnmagmahykszjqxdz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulifxsbfvfqxdyhnvgebosypiztvxwfthwjp` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vkmofeblmaojkhyprfxxcrjtrkamhecareum` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zoigmyopmkzkxkkbenkgshpazxqdqivswvvn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (10,1,1,1,'hero-image.jpg','image',5954,3969,14860703,NULL,NULL,NULL,'2021-05-12 18:04:14','2021-05-12 18:04:14','2021-05-12 18:04:14','e7a47767-18a6-4bc2-8668-ff9887a42b3b');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tdhzhwwdwslrutsulqutdtuyqqlixvrdauvv` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gbqzbuuqdfnrdtlhulzyvxoonsrwnpqcgzru` (`name`),
  KEY `idx_wfkxvmexrertaxjityvmdurhamvllkmhxwsf` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ljfmqaxqyjiwwdzfjmodkdiekqayjzevxsyz` (`groupId`),
  KEY `fk_gqkmfwwsbsbxywzjzpmglezkuruowkueyzrr` (`parentId`),
  CONSTRAINT `fk_gqkmfwwsbsbxywzjzpmglezkuruowkueyzrr` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pkoxgrikfugcnxivbpoymnsnsgxaxjimkbcx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysgxifgclhordoanvmbxfhmgtpjjrndyidbu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbkmqnvggorvxpxzazgdyjodefhscyiewdac` (`name`),
  KEY `idx_zphafiojttvrqwmxnsooxsvulhcfkxizuxjr` (`handle`),
  KEY `idx_twbsoqijtnxldycesiltzzsspxxuqmfsqjpk` (`structureId`),
  KEY `idx_levjjlcxcokgyfxasboptdexkubkkkbeucjq` (`fieldLayoutId`),
  KEY `idx_jgouxalfpkejequiuvmagpvbkeoaoqdasgzb` (`dateDeleted`),
  CONSTRAINT `fk_fbxxktxvvaiqocpzyqkjjuxvajlshczhvawr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mcckqiltcvzlzvbzumkfqxfazzmgqeowrrwn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fhgjugjgtwcxcitgeuafikwddewdbytxcynr` (`groupId`,`siteId`),
  KEY `idx_ydpyithmghlbhhdhigrptenwzfelhobeinht` (`siteId`),
  CONSTRAINT `fk_jrbsyrxvkorztlepmxiqdndihnfjfoxyziho` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lhxluvigukgbusnmshdlniueqqhslbtatqvb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_lstgbeaqlbcmmirgdzzolnsscofpdsxrugev` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_elyjpgeepfkwhjftdgaoiwnvukdhumpteoag` (`siteId`),
  KEY `fk_bxlvkwxupgxjgzzaxymahaquvnkolgapvtir` (`userId`),
  CONSTRAINT `fk_bxlvkwxupgxjgzzaxymahaquvnkolgapvtir` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_elyjpgeepfkwhjftdgaoiwnvukdhumpteoag` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qrdxlavziqxezbcizoqnmdzpwodomdsvlzos` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (52,1,'uri','2021-05-12 18:25:14',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_pvtjpvjjnaytoevuelxfalznxupazbnvrscp` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_opewjrpnjaraveqjqxcgtftgwmdsgadyyofv` (`siteId`),
  KEY `fk_oxxvdcasgvdzymsossjadcbgljxfqggbzzqn` (`fieldId`),
  KEY `fk_nebvlhajxxxvdezjtktbkumidtbhgpwhutky` (`userId`),
  CONSTRAINT `fk_fkegzvnbbdutjzsravdvwickaxptuwcmpllz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nebvlhajxxxvdezjtktbkumidtbhgpwhutky` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_opewjrpnjaraveqjqxcgtftgwmdsgadyyofv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oxxvdcasgvdzymsossjadcbgljxfqggbzzqn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (11,1,5,'2021-05-12 18:07:10',0,1),(18,1,5,'2021-05-12 18:07:10',0,1),(52,1,5,'2021-05-16 13:34:24',0,1),(52,1,10,'2021-05-12 18:25:15',0,1),(52,1,11,'2021-05-12 18:25:15',0,1),(52,1,12,'2021-05-12 18:25:15',0,1),(52,1,13,'2021-05-12 18:25:15',0,1),(52,1,14,'2021-05-12 18:25:15',0,1),(52,1,15,'2021-05-16 13:19:50',0,1),(52,1,16,'2021-05-16 13:19:50',0,1),(52,1,17,'2021-05-16 13:34:24',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_pageTitle` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_footerTitle` text COLLATE utf8_unicode_ci,
  `field_companyName` text COLLATE utf8_unicode_ci,
  `field_addressLineOne` text COLLATE utf8_unicode_ci,
  `field_addressLineTwo` text COLLATE utf8_unicode_ci,
  `field_phoneNumber` text COLLATE utf8_unicode_ci,
  `field_emailAddress` text COLLATE utf8_unicode_ci,
  `field_linkToMap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qgjarwppxxgktdjxmoonbcmrzrypxyiydpod` (`elementId`,`siteId`),
  KEY `idx_lfqzgzsthlljtrmzorryniwgvryfwyfpwnda` (`siteId`),
  KEY `idx_whutbdyapvjcmcdkocvajpfcowtlaecqpgbp` (`title`),
  CONSTRAINT `fk_suzosewpvwkonhpbmnsweweexdudcehgjwrb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ymqnthljyvljzcryaivupmfvsqocmomyalxw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-05-10 18:26:55','2021-05-10 18:26:55','e548f660-d75d-47fd-832d-73067ace0498',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,'2021-05-12 17:39:36','2021-05-12 17:39:36','8e773ad9-fc75-4095-b047-854ba307af65',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,NULL,'2021-05-12 17:50:59','2021-05-12 17:50:59','8d87156f-dcae-4bb7-9ff8-1f41c2731395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,10,1,'Hero image','2021-05-12 18:04:11','2021-05-12 18:04:11','cab9b4d4-d8c8-4964-ba0b-71eb23b32a65',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,11,1,'Panorama Godermo','2021-05-12 18:04:44','2021-05-12 18:07:10','57737e50-caf4-4df0-8488-3545764b575c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,13,1,'Panorama Godermo','2021-05-12 18:04:44','2021-05-12 18:04:44','5b07b589-8dd8-4b2b-9355-4e9f69f355c4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,18,1,'Ziele','2021-05-12 18:05:53','2021-05-12 18:07:10','4652e753-78a7-4efa-99ac-b2708fce8297',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,20,1,'Ziele','2021-05-12 18:05:53','2021-05-12 18:05:53','a01cd695-30f1-433c-b223-d932d3d47cba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,33,1,'Kompetenzen','2021-05-12 18:08:26','2021-05-12 18:08:26','34e2bae7-3a0e-40d5-a004-dce066afeafb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,35,1,'Kompetenzen','2021-05-12 18:08:26','2021-05-12 18:08:26','9bb82f13-6117-42c4-abb1-44051fcaa60c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,46,1,'Projekte','2021-05-12 18:10:08','2021-05-12 18:10:08','433571a8-8b1a-4d46-8ced-1a236eb5264e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,48,1,'Projekte','2021-05-12 18:10:08','2021-05-12 18:10:08','a687d688-7c1b-4037-9a0f-74b8ff302098',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,50,1,'Footer','2021-05-12 18:10:57','2021-05-12 18:10:57','9979f945-4c08-4c46-8305-09082595f043',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,51,1,'Footer','2021-05-12 18:10:57','2021-05-12 18:10:57','767995cb-2e28-4b9b-8490-8536c28093df',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,52,1,'Home Page','2021-05-12 18:11:31','2021-05-16 13:34:24','8ec0fdcd-0a9f-47da-8267-7d71e0e2f12b','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(24,53,1,'Home Page','2021-05-12 18:11:31','2021-05-12 18:11:31','628271d7-1de1-4b5c-9b6b-e941d12efcb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,54,1,'Home Page','2021-05-12 18:22:53','2021-05-12 18:22:53','6688c624-5ee3-41f6-842f-98ffcff7a810',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,55,1,'Home Page','2021-05-12 18:23:10','2021-05-12 18:23:10','52fda9c4-e955-41ad-aab7-416c48d12672','Energiestrategien',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,56,1,'Home Page','2021-05-12 18:24:20','2021-05-12 18:24:20','acf9f75d-8b0c-4e17-8d08-726fae15a1e5','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(28,57,1,'Home Page','2021-05-12 18:25:14','2021-05-12 18:25:14','b466c615-754d-48e6-a4b5-25d36684fdcb','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(29,58,1,'Home Page','2021-05-12 18:51:23','2021-05-12 18:51:23','276bf34c-4cf9-43a6-945b-8ba55a2b1713','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(30,59,1,'Home Page','2021-05-15 14:48:42','2021-05-15 14:48:42','e2f1a4e4-d33d-4fde-be4a-70fc47594c50','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(31,61,1,'Home Page','2021-05-15 14:49:49','2021-05-15 14:49:49','e26a4a63-d041-4ef7-8676-c423d5c166a7','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(32,66,1,'Home Page','2021-05-15 14:54:43','2021-05-15 14:54:43','4efa7b56-aa0a-4e2c-8c76-3124c2aa8875','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(33,71,1,'Home Page','2021-05-15 14:55:41','2021-05-15 14:55:41','5e8e8175-6b9a-4a84-a154-2db5651b6cde','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','tel:+41-44-273-08-61','mailto:info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(34,76,1,'Home Page','2021-05-16 13:19:50','2021-05-16 13:19:50','90f702da-3963-473b-847b-c09693c02475','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(35,81,1,'Home Page','2021-05-16 13:23:29','2021-05-16 13:23:29','71f861a6-7402-4df4-8e30-f7c7a0bbf33d','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(36,86,1,'Home Page','2021-05-16 13:23:55','2021-05-16 13:23:55','6d673568-77ca-4453-9168-d72c079331b8','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(37,91,1,'Home Page','2021-05-16 13:24:20','2021-05-16 13:24:20','959a4dd8-3a18-496f-82be-b4f840e86121','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(38,96,1,'Home Page','2021-05-16 13:24:34','2021-05-16 13:24:34','8bd6b5f3-430c-4e1c-b448-2ce2f384eb7f','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(39,101,1,'Home Page','2021-05-16 13:24:38','2021-05-16 13:24:38','af3f2c8d-7be4-4e07-bc07-0417ead4553b','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(40,107,1,'Home Page','2021-05-16 13:25:06','2021-05-16 13:25:06','81090e24-d8c7-47ee-b2eb-62cb58824dea','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(41,113,1,'Home Page','2021-05-16 13:31:03','2021-05-16 13:31:03','d0dc2c54-364c-4cf0-a990-0425e196ca67','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34'),(42,119,1,'Home Page','2021-05-16 13:34:24','2021-05-16 13:34:24','a75697ae-2ce5-4753-b89b-fd23f35f8949','Energiestrategien','Kontakt','eTeam Togni Energie GmbH','Schaffhauserstr. 34','8006 Zürich','+41 44 273 08 61','info@etogni.ch','https://map.search.ch/Z%C3%BCrich,Schaffhauserstr.34');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_oxhuwbpwrqkrtvdvstwkeejokdargsnicdhi` (`userId`),
  CONSTRAINT `fk_oxhuwbpwrqkrtvdvstwkeejokdargsnicdhi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jfteodpogeqqxlazuzblicvvglqagxaqjgjq` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
INSERT INTO `deprecationerrors` VALUES (1,'ElementQuery::getIterator()','/app/templates/home/_entry.twig:12','2021-05-15 14:33:01','/app/templates/home/_entry.twig',12,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":67,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-15 14:33:01','2021-05-15 14:33:01','88bcf312-3127-4e47-8975-ffff3b0f6f32'),(5,'ElementQuery::getIterator()','/app/templates/home/_entry.twig:24','2021-05-12 19:03:58','/app/templates/home/_entry.twig',24,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":104,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-12 19:03:58','2021-05-12 19:03:58','6dfb5b02-1694-42ef-98c7-a645a3f8636c'),(12,'ElementQuery::first()','/app/templates/home/_entry.twig:11','2021-05-16 13:12:43','/app/templates/home/_entry.twig',11,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":60,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-16 13:12:43','2021-05-16 13:12:43','f39b6ccd-ab3f-4421-8fae-0138a57a2d9a'),(14,'ElementQuery::first()','/app/templates/home/_entry.twig:24','2021-05-15 15:27:37','/app/templates/home/_entry.twig',24,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":93,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-15 15:27:37','2021-05-15 15:27:37','65dd8313-96f5-4ecc-bec5-a29c9d15a449'),(51,'ElementQuery::first()','/app/templates/home/_entry.twig:51','2021-05-15 15:16:32','/app/templates/home/_entry.twig',51,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":161,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-15 15:16:32','2021-05-15 15:16:32','05d93b8b-0b7f-476b-8477-bc8dcdbdcf3b'),(63,'ElementQuery::first()','/app/templates/home/_entry.twig:50','2021-05-15 15:16:59','/app/templates/home/_entry.twig',50,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\AssetQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":159,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\AssetQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-15 15:16:59','2021-05-15 15:16:59','38381d9c-cd28-4bd0-b3c6-c462450f5e06'),(92,'ElementQuery::first()','/app/templates/home/_entry.twig:23','2021-05-16 13:12:43','/app/templates/home/_entry.twig',23,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":92,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-16 13:12:43','2021-05-16 13:12:43','3a83be3a-ab66-4b3e-bf2d-2aef0bd023ae'),(113,'ElementQuery::first()','/app/templates/home/_entry.twig:7','2021-05-16 13:41:53','/app/templates/home/_entry.twig',7,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":56,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-16 13:41:54','2021-05-16 13:41:54','a2a5c182-26f2-45c1-af3e-7b5491ebe471'),(114,'ElementQuery::first()','/app/templates/home/_entry.twig:25','2021-05-16 13:41:53','/app/templates/home/_entry.twig',25,'The `first()` function used to query for elements is now deprecated. Use `one()` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/app/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1947,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The `first()` function used to query for elements is now depreca...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/app/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1507,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/app/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":99,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"block_content\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/80/800fc4b6a207fea5b60bd21c18f9c84dfea82fbc488e601f1c00fd383d2432be.php\",\"line\":89,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_384250f66f158ecb4f40d612e793f421d0e8209596a0ccb86c99a92b4e6d58d5\",\"file\":\"/app/storage/runtime/compiled_templates/02/022e3256d3600e486c18bb7329971a70e59c22d8fc011957a2a903804b6ca035.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_8c98e78204bca68fa4a8b0a7777b233500c426a6b9e31d98aa1ae246c76875db\",\"file\":\"/app/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/app/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"/home/_entry.twig\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/app/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"/home/_entry.twig\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/app/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/app/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":279,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"/home/_entry.twig\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/craftcms/cms/src/web/Application.php\",\"line\":264,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/app/web/index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-05-16 13:41:54','2021-05-16 13:41:54','3d5f8733-c001-45c5-8501-0a1356044ae8');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_yflviiwgdwxwilubjizpjbcjrtdxixluepxa` (`saved`),
  KEY `fk_xvimjjxbtyhxygwxlipwpyxchffztodrtivw` (`creatorId`),
  KEY `fk_aafroebvdwvyhymntletrqnrdbxxepqohmsr` (`sourceId`),
  CONSTRAINT `fk_aafroebvdwvyhymntletrqnrdbxxepqohmsr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvimjjxbtyhxygwxlipwpyxchffztodrtivw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
INSERT INTO `drafts` VALUES (1,NULL,1,'First draft',NULL,0,NULL,0),(2,NULL,1,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hgvdbiyjyglgyaivcgkjdjaqqsdsyklipkdq` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kyrilmiyxadniubpdfoyljrocnceptblazcn` (`dateDeleted`),
  KEY `idx_unzumpqenmjdiiobmdvkbmaywukcbtpuefar` (`fieldLayoutId`),
  KEY `idx_ilapuezwpbptpfejuliqhwvqpinppnmznmeq` (`type`),
  KEY `idx_lktundkhhlagbfsjuceifzgtsweqnfacoxux` (`enabled`),
  KEY `idx_fmepkitsssnotsanbmgbggyxdhfzczacrqzs` (`archived`,`dateCreated`),
  KEY `idx_wanhvagezparqgeeqwvrxiatttmuduskxgxx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_cruaprrzegkbrceipayjxwhhalqzsypneoed` (`draftId`),
  KEY `fk_guhnjqdkfnrflpehpjaxphrhmpjpfgngajzg` (`revisionId`),
  CONSTRAINT `fk_cruaprrzegkbrceipayjxwhhalqzsypneoed` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_guhnjqdkfnrflpehpjaxphrhmpjpfgngajzg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ozugmdvtopewegiczwfinqigtvzumkagunjf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-05-10 18:26:55','2021-05-10 18:26:55',NULL,'50479126-e13a-4e88-9f11-44807439e08c'),(2,1,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 17:39:36','2021-05-12 17:39:36',NULL,'08d270f3-9696-42ca-8707-3c3ee3dcc94c'),(3,2,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 17:50:59','2021-05-12 17:50:59',NULL,'949ed5c8-3d2e-4d4f-9b08-300c6a116a96'),(10,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2021-05-12 18:04:11','2021-05-12 18:04:11',NULL,'4fb54ff7-8d1a-4e58-928f-b30dac6ae9da'),(11,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:04:44','2021-05-12 18:04:44',NULL,'c4a58006-6cc8-4326-a30e-e0f3477a0a8a'),(12,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:04:44','2021-05-12 18:07:10',NULL,'1ab8d0c9-4db7-4559-a724-a3a1a4d7d5c0'),(13,NULL,1,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:04:44','2021-05-12 18:04:44',NULL,'50e5803c-fe37-4961-b58f-ffad87418f77'),(14,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:04:44','2021-05-12 18:04:31',NULL,'1c30d8af-3cf8-401b-a42c-06c030c49c85'),(16,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:04:55','2021-05-12 18:04:55','2021-05-12 18:05:07','20165d2f-a3dc-4db7-96ac-e154ff5617f5'),(18,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:05:53','2021-05-12 18:05:53',NULL,'d9915220-1a10-4313-a6b9-c7c84d6b6e4d'),(19,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:05:53','2021-05-12 18:07:10',NULL,'e9a6d64f-6784-495f-8500-5ef65617d299'),(20,NULL,2,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:05:53','2021-05-12 18:05:53',NULL,'618fde57-41da-42a9-a9ee-3b520034d1ad'),(21,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:05:53','2021-05-12 18:05:46',NULL,'ae8e9494-196b-4099-9335-1b3a907dc9e0'),(23,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:35','2021-05-12 18:07:35','2021-05-12 18:07:44','f981ee50-f997-436a-8d30-e99f304cdd33'),(24,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:44','2021-05-12 18:07:44','2021-05-12 18:07:49','b85a8d4d-6f22-4a53-b788-60663192066c'),(25,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:49','2021-05-12 18:07:49','2021-05-12 18:07:50','530cb258-7411-47ff-bf52-3ba5b4a04306'),(26,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:50','2021-05-12 18:07:50','2021-05-12 18:07:56','26dc6058-0120-412a-ad20-309622027ef1'),(27,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:55','2021-05-12 18:07:55','2021-05-12 18:07:57','9b9f6744-ce17-4ede-8f6a-cf879276e758'),(28,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:07:57','2021-05-12 18:07:57','2021-05-12 18:08:00','318fcb39-0c28-4c13-a27a-95149d3010a0'),(29,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:08:00','2021-05-12 18:08:00','2021-05-12 18:08:01','4385e03e-d46f-469a-a9ef-22fe9fc2a93f'),(30,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:08:01','2021-05-12 18:08:01','2021-05-12 18:08:05','6dbdb42b-6877-4443-9394-5f0f9dd700d7'),(31,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:08:05','2021-05-12 18:08:05','2021-05-12 18:08:07','8ef5e821-538d-4c49-93b4-20b99080d748'),(33,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:08:26','2021-05-12 18:08:26',NULL,'2cb47674-985b-48fb-a87a-ff2ae0ac69fd'),(34,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:08:26','2021-05-12 18:08:07',NULL,'c4b9e3a0-1bd8-4ecf-9b76-0701413b6038'),(35,NULL,3,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:08:26','2021-05-12 18:08:26',NULL,'b99b1aa6-97f0-4c9e-972c-bf3eb085da8d'),(36,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:08:26','2021-05-12 18:08:07',NULL,'74151a80-6569-4e71-b374-8c8cb82c2c3a'),(38,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:40','2021-05-12 18:09:40','2021-05-12 18:09:46','dd7f0596-63cf-43e7-90e0-a6728987faff'),(39,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:46','2021-05-12 18:09:46','2021-05-12 18:09:46','77b73c15-c2a0-4625-86f3-6ff065f6ac68'),(40,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:46','2021-05-12 18:09:46','2021-05-12 18:09:51','451abf0d-8be8-43af-a05d-211737e4a0c5'),(41,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:51','2021-05-12 18:09:51','2021-05-12 18:09:51','2dc2186e-27c8-480a-8779-86cda7d118c2'),(42,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:51','2021-05-12 18:09:51','2021-05-12 18:09:56','02bc2299-2a31-44e6-b8de-d0329a1b4384'),(43,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:56','2021-05-12 18:09:56','2021-05-12 18:09:57','8e53e7f6-7cb8-4493-830d-f0f157e45e21'),(44,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:09:57','2021-05-12 18:09:57','2021-05-12 18:10:02','602920b4-193e-4e60-ad07-7fea3768f7a8'),(46,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:10:08','2021-05-12 18:10:08',NULL,'2b7c9080-0e86-4db4-8df3-b668050e4506'),(47,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:10:08','2021-05-12 18:10:02',NULL,'520723f0-defa-46b0-8127-8115d175be03'),(48,NULL,4,3,'craft\\elements\\Entry',1,0,'2021-05-12 18:10:08','2021-05-12 18:10:08',NULL,'c5baa3f0-5e98-4b4c-9436-bf3ec0124d09'),(49,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-12 18:10:08','2021-05-12 18:10:02',NULL,'f155b843-9683-4ed0-9a99-c109e4ae8975'),(50,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2021-05-12 18:10:57','2021-05-12 18:10:57','2021-05-12 18:11:12','b57ab09e-fd11-4e66-8a38-f9ecdab803c8'),(51,NULL,5,8,'craft\\elements\\Entry',1,0,'2021-05-12 18:10:57','2021-05-12 18:10:57','2021-05-12 18:11:12','1848dcae-42ae-4be8-9b98-40d6a3688164'),(52,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:11:31','2021-05-16 13:34:24',NULL,'6f8000da-352b-492d-8319-d83bf79a46ca'),(53,NULL,6,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:11:31','2021-05-12 18:11:31',NULL,'61a7e71c-143b-463b-ab8f-0c028ebed643'),(54,NULL,7,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:22:53','2021-05-12 18:22:53',NULL,'61a8b065-ca90-43d7-9a60-f6f91c46dd3e'),(55,NULL,8,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:23:10','2021-05-12 18:23:10',NULL,'7ca15cda-e38d-476c-80da-6a7d1dadad0a'),(56,NULL,9,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:24:19','2021-05-12 18:24:19',NULL,'31e5eae6-723f-486a-8323-7e7d6c287798'),(57,NULL,10,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:25:14','2021-05-12 18:25:14',NULL,'ca2e9dce-6b5f-406d-a437-2265e31f13ba'),(58,NULL,11,9,'craft\\elements\\Entry',1,0,'2021-05-12 18:51:23','2021-05-12 18:51:23',NULL,'e2372b80-713e-436b-9310-8bdd053778da'),(59,NULL,12,9,'craft\\elements\\Entry',1,0,'2021-05-15 14:48:42','2021-05-15 14:48:42',NULL,'5be22945-daa2-4708-a848-5892095233cc'),(60,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:49:49','2021-05-16 13:34:24',NULL,'6015aea3-d583-4f7b-9430-6b99122952b4'),(61,NULL,13,9,'craft\\elements\\Entry',1,0,'2021-05-15 14:49:49','2021-05-15 14:49:49',NULL,'a9acbae6-fa1a-417c-ac22-1316af3dff5f'),(62,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:49:49','2021-05-15 14:49:49',NULL,'b877d752-4394-4db8-97ef-79d2073c9250'),(63,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-16 13:34:24',NULL,'b9238ec7-ef23-4b52-8966-fca4446828f3'),(64,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-16 13:34:24',NULL,'663018c1-773a-4c22-bf61-52204e2cbd32'),(65,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-16 13:34:24',NULL,'f8943fca-6364-4ded-9d1d-19f9285c000a'),(66,NULL,14,9,'craft\\elements\\Entry',1,0,'2021-05-15 14:54:43','2021-05-15 14:54:43',NULL,'ca584529-36be-4841-8f7a-a208f28e889b'),(67,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-15 14:54:43',NULL,'9004ad0f-548d-493a-9e49-5eb408fc68ae'),(68,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-15 14:54:43',NULL,'0a63ad0f-8304-448e-90eb-eebd020dd4bf'),(69,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-15 14:54:43',NULL,'fe41c262-c88a-477b-abc8-ef53f0ebebce'),(70,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:54:43','2021-05-15 14:54:43',NULL,'1e67eab6-b05e-4e6c-b601-d3cfffea44b6'),(71,NULL,15,9,'craft\\elements\\Entry',1,0,'2021-05-15 14:55:41','2021-05-15 14:55:41',NULL,'b4cbe57c-7712-439d-a532-1cb5346309ed'),(72,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:55:41','2021-05-15 14:54:43',NULL,'4428d421-1599-4abe-b001-010209ef1bee'),(73,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:55:41','2021-05-15 14:54:43',NULL,'44da14e1-dfd3-4915-9000-2e6ac0769276'),(74,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:55:41','2021-05-15 14:54:43',NULL,'4f61bda6-57c8-474a-abfd-5eccfc341f3b'),(75,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-15 14:55:41','2021-05-15 14:54:43',NULL,'96a38949-485c-4f27-aab6-23a50df9a5a1'),(76,NULL,16,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:19:50','2021-05-16 13:19:50',NULL,'8e093c62-483d-4af0-a68b-41abe8488a63'),(77,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:19:50','2021-05-15 14:54:43',NULL,'6a59df78-cb64-450d-bcfa-7d78cde8a0e7'),(78,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:19:50','2021-05-15 14:54:43',NULL,'6c4a4968-eda0-4dd3-b143-a3dc75a94e09'),(79,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:19:50','2021-05-15 14:54:43',NULL,'50b796a1-6b8a-4ffd-b5a9-66892e9809a1'),(80,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:19:50','2021-05-15 14:54:43',NULL,'d7762db2-8c42-45e7-94b6-7900b8cdf433'),(81,NULL,17,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:23:29','2021-05-16 13:23:29',NULL,'e3d163dd-77de-4a3f-90b4-e00784bfe39b'),(82,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:29','2021-05-15 14:54:43',NULL,'4d8306b2-1429-40af-8d52-bdc8014c044d'),(83,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:29','2021-05-15 14:54:43',NULL,'47c3b6e7-be2c-49d2-99d7-f2cbdb429371'),(84,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:29','2021-05-15 14:54:43',NULL,'77e9e414-e018-47a8-84ce-8ea71c9c2068'),(85,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:29','2021-05-15 14:54:43',NULL,'4c32649f-e9e6-4a73-99fa-b6269e7275ee'),(86,NULL,18,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:23:55','2021-05-16 13:23:55',NULL,'6e4014da-c571-48d4-a616-ee23c71b927c'),(87,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:55','2021-05-15 14:54:43',NULL,'69d33016-6439-4d11-8c01-93b13fb02c13'),(88,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:55','2021-05-15 14:54:43',NULL,'b9454c89-cfc2-4811-8053-524d6fc50cdc'),(89,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:55','2021-05-15 14:54:43',NULL,'fdfb801f-21f2-4c65-a4ab-bc6e06d7177d'),(90,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:23:55','2021-05-15 14:54:43',NULL,'4c22f9b6-7575-485f-9d7a-d1de7245c583'),(91,NULL,19,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:24:20','2021-05-16 13:24:20',NULL,'41787067-5e61-4a5e-b579-d80a41e31fe5'),(92,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:20','2021-05-15 14:54:43',NULL,'7cf8d227-5aee-4aa3-9f77-c799d693f834'),(93,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:20','2021-05-16 13:24:20',NULL,'d6921812-d024-45fc-84dd-3a19909b2597'),(94,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:20','2021-05-15 14:54:43',NULL,'ce9563f5-a1b9-4db7-b61e-ebb2dbb20a0b'),(95,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:20','2021-05-15 14:54:43',NULL,'2386f132-b660-4982-bd08-cfc41f5eedb1'),(96,NULL,20,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:24:34','2021-05-16 13:24:34',NULL,'08753859-b1f9-4c8a-bd72-8098e585e50b'),(97,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:34','2021-05-15 14:54:43',NULL,'1242d633-d9ab-45d3-ac66-1c7a185c76a1'),(98,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:34','2021-05-16 13:24:34',NULL,'d0185232-d00b-44a9-a9dc-dd02e8701c5f'),(99,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:34','2021-05-15 14:54:43',NULL,'2ea1e738-fe37-4b01-92d4-5f3057809254'),(100,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:34','2021-05-15 14:54:43',NULL,'60b462b4-e243-4c21-9071-76db6945dd70'),(101,NULL,21,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:24:38','2021-05-16 13:24:38',NULL,'7da98ee5-6696-49a2-b6fa-17de468cffa6'),(102,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:38','2021-05-15 14:54:43',NULL,'226830a8-6ef0-4813-aa1b-57a8b2a77abe'),(103,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:38','2021-05-16 13:24:34',NULL,'1d6fb945-1134-4e74-ae83-029209911f16'),(104,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:38','2021-05-15 14:54:43',NULL,'3352c510-ed91-4ec2-a564-c5cf3af8f660'),(105,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:24:38','2021-05-15 14:54:43',NULL,'2933fe04-9b6a-400a-acb2-407f46d74a9e'),(106,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06','2021-05-16 13:34:24','7e267113-65f8-4501-a8d2-fe3692c1f22e'),(107,NULL,22,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'ab7accf0-d545-499f-b778-c072dc1a5d10'),(108,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'4a01bbfa-c2d4-495a-82f4-51f5965a8022'),(109,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'2d077d1d-0d30-427d-b3cd-2a809331c62c'),(110,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'0cf6ad0c-f8cb-42e9-80bf-afd4846643bc'),(111,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'2aabc367-7483-43f1-bcd0-2dd39e432d49'),(112,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:25:06','2021-05-16 13:25:06',NULL,'9c66a8ab-3994-4c29-b6e6-b2514c1b9475'),(113,NULL,23,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:31:03','2021-05-16 13:31:03',NULL,'93bfb8ad-e2e9-44a8-9b77-80de3d3bfebb'),(114,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:31:03','2021-05-16 13:25:06',NULL,'ae950865-f13d-4ae3-895a-5d2fa4c0cf93'),(115,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:31:03','2021-05-16 13:31:03',NULL,'52575402-18ca-43c3-a897-be5692b629b7'),(116,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:31:03','2021-05-16 13:25:06',NULL,'b70733b4-d635-4c89-97c1-41ceb1c82d77'),(117,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:31:03','2021-05-16 13:25:06',NULL,'79fecbee-4f6a-49ef-b8d3-18be242c43ee'),(118,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:31:03','2021-05-16 13:25:06',NULL,'67e0620d-81e6-4a3e-81d1-3cddd046842c'),(119,NULL,24,9,'craft\\elements\\Entry',1,0,'2021-05-16 13:34:24','2021-05-16 13:34:24',NULL,'91dd4837-31bf-47cd-95ee-f0d2df0cb702'),(120,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:34:24','2021-05-16 13:34:24',NULL,'208cba1e-2762-47a6-aff1-b45f20ec9927'),(121,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:34:24','2021-05-16 13:34:24',NULL,'4f8b1702-61f3-421e-be09-a52a35fccabc'),(122,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:34:24','2021-05-16 13:34:24',NULL,'af0808e0-e8c2-4868-9322-5656b5f3e00d'),(123,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-05-16 13:34:24','2021-05-16 13:34:24',NULL,'b03cc1ba-7b45-4af5-af6e-0659e1b97d25');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_orxbmbooffsackuppfytsykkqirtltmrynmp` (`elementId`,`siteId`),
  KEY `idx_rwxszitjcbyugrofvwgjvphxedvrfnuixjsu` (`siteId`),
  KEY `idx_cjcpyppfzbzrgmwacuyblkcfrbkarwfbdpim` (`slug`,`siteId`),
  KEY `idx_ubrysmnwwqtxytavfgsnmgmkhfhvdjnrsdbb` (`enabled`),
  KEY `idx_jaxmuayemkaaktoldunddskrxftwwpehfalo` (`uri`,`siteId`),
  CONSTRAINT `fk_fdxqaamkteckvpmfckqbjvtlyxpbtfofqwzp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqmwktujinskbjsygmkvesrsxmygjkpsslgk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-05-10 18:26:55','2021-05-10 18:26:55','5966486e-1889-4f46-9d95-d6b298b942cb'),(2,2,1,'__temp_phuliqlkhrmisxkynmwtbnoknjghwfxilnvt','website-sections/__temp_phuliqlkhrmisxkynmwtbnoknjghwfxilnvt',1,'2021-05-12 17:39:36','2021-05-12 17:39:36','a95c5fc7-49be-4a5e-a1fa-00579da2ec09'),(3,3,1,'__temp_objccsmzifejkeoanripgbdmieemqvgfjdmf',NULL,1,'2021-05-12 17:50:59','2021-05-12 17:50:59','e83d8974-7e34-4eaf-9c9a-35e01ba80715'),(10,10,1,NULL,NULL,1,'2021-05-12 18:04:11','2021-05-12 18:04:11','dabfa8c0-55d4-4f47-bb23-9af0eb0fa1b6'),(11,11,1,'panorama-godermo',NULL,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','d1228f02-2f8f-4e4f-b45f-462467d707a2'),(12,12,1,NULL,NULL,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','849d7b2b-8c17-4b82-80dc-9503a49e05e3'),(13,13,1,'panorama-godermo',NULL,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','c772559c-4799-498f-8497-2296c72198f5'),(14,14,1,NULL,NULL,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','fd8d79de-8564-46bf-9e03-ee39e9cf67b4'),(16,16,1,NULL,NULL,1,'2021-05-12 18:04:55','2021-05-12 18:04:55','a0e702bb-e447-4b4a-9c24-3efd903176c3'),(18,18,1,'ziele',NULL,1,'2021-05-12 18:05:53','2021-05-12 18:05:53','43d27a8e-6a25-4ccc-9775-b04f3315b64a'),(19,19,1,NULL,NULL,1,'2021-05-12 18:05:53','2021-05-12 18:05:53','b69cffc4-28bf-473f-9d55-6816c350fb94'),(20,20,1,'ziele',NULL,1,'2021-05-12 18:05:53','2021-05-12 18:05:53','f6a6ea32-f5d5-433c-ba98-7da0e95dcc55'),(21,21,1,NULL,NULL,1,'2021-05-12 18:05:53','2021-05-12 18:05:53','8ebe9047-932a-41ed-b7a3-77630a15633b'),(23,23,1,NULL,NULL,1,'2021-05-12 18:07:35','2021-05-12 18:07:35','5582ba4c-13e5-4ea2-b4ea-b9d7ded1aed8'),(24,24,1,NULL,NULL,1,'2021-05-12 18:07:44','2021-05-12 18:07:44','799a6243-5818-4eb2-a868-83575406fb83'),(25,25,1,NULL,NULL,1,'2021-05-12 18:07:49','2021-05-12 18:07:49','a4e420cb-9d25-449a-a01a-423b90442abd'),(26,26,1,NULL,NULL,1,'2021-05-12 18:07:50','2021-05-12 18:07:50','3e343c30-69e1-4de0-99c0-da11b8421ca2'),(27,27,1,NULL,NULL,1,'2021-05-12 18:07:55','2021-05-12 18:07:55','abd73925-0e4c-4dc4-8374-7558cf7d43ba'),(28,28,1,NULL,NULL,1,'2021-05-12 18:07:57','2021-05-12 18:07:57','cadb2b7c-05f9-419c-8455-93735745eca9'),(29,29,1,NULL,NULL,1,'2021-05-12 18:08:00','2021-05-12 18:08:00','067d40c4-165a-472a-b06b-794015c343fc'),(30,30,1,NULL,NULL,1,'2021-05-12 18:08:01','2021-05-12 18:08:01','2fbdd985-62db-4eb1-bd61-53423d63c1ca'),(31,31,1,NULL,NULL,1,'2021-05-12 18:08:05','2021-05-12 18:08:05','c94d38b4-76ab-4f2b-a475-19e1f717e841'),(33,33,1,'kompetenzen',NULL,1,'2021-05-12 18:08:26','2021-05-12 18:08:27','c2221207-1261-42c6-a14e-3d356533b295'),(34,34,1,NULL,NULL,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','c0a75caa-8123-4b41-9763-96300aa83431'),(35,35,1,'kompetenzen',NULL,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','2ded7aac-d888-48bb-ac07-f15919fd979e'),(36,36,1,NULL,NULL,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','30b4a405-314f-48fa-8904-3c3e3adcb0ff'),(38,38,1,NULL,NULL,1,'2021-05-12 18:09:40','2021-05-12 18:09:40','61cafd8f-154e-499a-aba4-b1329ffaeb9e'),(39,39,1,NULL,NULL,1,'2021-05-12 18:09:46','2021-05-12 18:09:46','893a3fe7-6f06-486e-bf8d-147d7085b0c0'),(40,40,1,NULL,NULL,1,'2021-05-12 18:09:46','2021-05-12 18:09:46','64d5e367-7e28-4fee-869e-535395cdda52'),(41,41,1,NULL,NULL,1,'2021-05-12 18:09:51','2021-05-12 18:09:51','0c981497-b630-4d33-aaee-bc4274e163a3'),(42,42,1,NULL,NULL,1,'2021-05-12 18:09:51','2021-05-12 18:09:51','cfe60f72-eff7-4b2e-a2f6-80d897ba2878'),(43,43,1,NULL,NULL,1,'2021-05-12 18:09:56','2021-05-12 18:09:56','acb78542-6340-4384-88e5-542e743ed063'),(44,44,1,NULL,NULL,1,'2021-05-12 18:09:57','2021-05-12 18:09:57','9dad29e2-05ba-405c-b7a7-69d394aaa179'),(46,46,1,'projekte',NULL,1,'2021-05-12 18:10:08','2021-05-12 18:10:09','a451abfd-4fad-4d4a-9b6e-c0797b35ce76'),(47,47,1,NULL,NULL,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','91556508-c84c-4609-b567-60be49d962e2'),(48,48,1,'projekte',NULL,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','c96efa1c-fd0e-4205-bf8a-677312da13e6'),(49,49,1,NULL,NULL,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','63cb10a1-8cce-4275-9eb1-f3ff2cd5a4bf'),(50,50,1,'footer','footer',1,'2021-05-12 18:10:57','2021-05-12 18:10:57','4c001b36-f110-46f1-aa30-121aa736443a'),(51,51,1,'footer','footer',1,'2021-05-12 18:10:57','2021-05-12 18:10:57','7a82be8f-6654-473a-9242-861610046545'),(52,52,1,'home-page',NULL,1,'2021-05-12 18:11:31','2021-05-12 18:25:14','7a8fae89-65af-4fdb-92c5-b475b6410e18'),(53,53,1,'home-page','__home__',1,'2021-05-12 18:11:31','2021-05-12 18:11:31','86fbfcf4-75cb-4236-9cbd-5adc8f04ab26'),(54,54,1,'home-page','__home__',1,'2021-05-12 18:22:53','2021-05-12 18:22:53','2bddc8a0-c994-4a82-8366-4ad1ef99979b'),(55,55,1,'home-page','__home__',1,'2021-05-12 18:23:10','2021-05-12 18:23:10','1b6f4e12-09a5-40e2-83a5-400d19defc2f'),(56,56,1,'home-page','__home__',1,'2021-05-12 18:24:20','2021-05-12 18:24:20','66241882-e4cd-4763-8bb6-369fc2f2f170'),(57,57,1,'home-page',NULL,1,'2021-05-12 18:25:14','2021-05-12 18:25:14','3376cc8d-fb4e-4de1-a54a-587a3720258b'),(58,58,1,'home-page',NULL,1,'2021-05-12 18:51:23','2021-05-12 18:51:23','d3cc5473-0444-4f19-ac03-00e8341a0b0a'),(59,59,1,'home-page',NULL,1,'2021-05-15 14:48:42','2021-05-15 14:48:42','547301b7-5b1c-4d56-87f3-7005bc3bc507'),(60,60,1,NULL,NULL,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','eeddb078-3e3e-4421-8509-cb98152bf6a7'),(61,61,1,'home-page',NULL,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','091d37d4-e18f-4cc1-91cf-b04d288fe60d'),(62,62,1,NULL,NULL,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','41759bfa-f075-491d-95dc-4678e90c2104'),(63,63,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','5efc3cee-ce5a-4588-ad02-ff956082d6c2'),(64,64,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','44f534c3-ea32-48e7-b6db-66907eda1df8'),(65,65,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','656837dc-0e45-4cc1-bc80-700b4e5b53aa'),(66,66,1,'home-page',NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','db9ad46e-3f17-415b-9219-2322c0ce2211'),(67,67,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','e13c71e2-3b87-40de-a7f9-50723f754fec'),(68,68,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','7983a984-a679-4780-85b3-ac8b00ffeaf8'),(69,69,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','26c14422-b8bd-4f04-8aa7-f7b5d04e26aa'),(70,70,1,NULL,NULL,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','f8796302-d5ed-4a41-9a70-e9c29ebc09ae'),(71,71,1,'home-page',NULL,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','d5d62709-7f9a-440f-ae9c-8b2ce272c20f'),(72,72,1,NULL,NULL,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','8112c559-359f-4686-80db-64543a19d3a7'),(73,73,1,NULL,NULL,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','4c2d9cdd-2769-4c93-86b8-7de2436eab0d'),(74,74,1,NULL,NULL,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','2cceceea-5ec5-4dc7-8a4b-2b480bff7f15'),(75,75,1,NULL,NULL,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','b58e45b4-2dd1-47f3-924b-5c26be733dc0'),(76,76,1,'home-page',NULL,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','68e5f626-9387-42a3-9dae-02d74d7dcb5a'),(77,77,1,NULL,NULL,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','d9c8f0c6-5de9-4231-b0c9-95da30c1c7f3'),(78,78,1,NULL,NULL,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','d86ac656-505a-48ca-a766-9d9a8d80b650'),(79,79,1,NULL,NULL,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','c62b69cc-7b5d-48ba-a535-44f2d33938c6'),(80,80,1,NULL,NULL,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','94928ecd-f6a5-4767-9a16-0b0a5d76d77b'),(81,81,1,'home-page',NULL,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','3c1e920a-3a94-45bd-9a1c-7062931ca73a'),(82,82,1,NULL,NULL,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','bdaf8b65-f5e3-464f-8b18-32436e8bd5ee'),(83,83,1,NULL,NULL,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','6fb541ad-60f9-4531-b081-c8b2a44bbf9e'),(84,84,1,NULL,NULL,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','80c9fc43-5512-4141-8906-bbe9fb7619bc'),(85,85,1,NULL,NULL,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','812f1a34-d6a1-475e-809d-905c3af57638'),(86,86,1,'home-page',NULL,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','656cc196-0a04-4144-987a-fc4825fa2003'),(87,87,1,NULL,NULL,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','5ee24f82-7cd2-4b1c-8c84-30ab9c5dbe75'),(88,88,1,NULL,NULL,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','9392503d-6460-4024-b977-3bf8e6176e51'),(89,89,1,NULL,NULL,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','e8e6a3b5-eda1-4044-bc6d-28048b5e8157'),(90,90,1,NULL,NULL,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','4f4444e6-5855-49cc-870a-b2d1b6437247'),(91,91,1,'home-page',NULL,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','da5bdaf7-168e-4c04-b6db-343656408ccc'),(92,92,1,NULL,NULL,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','647b2a8a-2c34-4d84-aa10-71fb9a28f011'),(93,93,1,NULL,NULL,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','2c12b3d3-4958-45a2-837c-3adcf304babe'),(94,94,1,NULL,NULL,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','44f6f7cd-e06e-4c2c-8371-38612aa0fec0'),(95,95,1,NULL,NULL,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','1b920460-88e4-46b7-a6e9-d3aaa84510f5'),(96,96,1,'home-page',NULL,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','c68d05a9-44e0-4255-9b7b-e0e35d0a9586'),(97,97,1,NULL,NULL,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','14bc2c00-42ac-43a5-8013-d1fb25674e15'),(98,98,1,NULL,NULL,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','00f38b7e-a9a3-4ee4-a049-a462dd5eac47'),(99,99,1,NULL,NULL,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','b5c660a4-e86b-4eda-87f0-ecaa8371e4b1'),(100,100,1,NULL,NULL,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','8501843b-79e6-4518-bfc4-48b9dd6b0802'),(101,101,1,'home-page',NULL,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','e79057ca-e99b-4329-b87e-04ab5884bab8'),(102,102,1,NULL,NULL,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','b1748675-8d45-42cb-a496-8978c6d223ab'),(103,103,1,NULL,NULL,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','01ba30f4-0a43-4489-b5e7-31180563455c'),(104,104,1,NULL,NULL,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','69bcc897-778d-4943-8c9e-2d219dad3677'),(105,105,1,NULL,NULL,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','546426fd-3aad-47fc-8a4a-e8c9fc623e4f'),(106,106,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','3fce9729-50d0-450b-93b3-c12e62e2f2a9'),(107,107,1,'home-page',NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','fd14aef1-01d0-42cd-9415-272edc842502'),(108,108,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','8fb9ca17-b5ad-4e64-9958-10d28254c50d'),(109,109,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','379dad7a-9e50-4846-ba5b-27a519acabfa'),(110,110,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','fdde9374-5a96-4860-a3a3-788daae4a87b'),(111,111,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','a0953b42-c6d3-4bdb-a140-21abba42142b'),(112,112,1,NULL,NULL,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','7cca2638-ceda-414e-aa80-97b46545315c'),(113,113,1,'home-page',NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','bb39736e-f8f8-44d3-aac7-39711aebcf66'),(114,114,1,NULL,NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','c66769bd-a07e-4e57-b5f1-bb2d37e2a540'),(115,115,1,NULL,NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','6edb15d0-0639-43e9-9a15-7c0144af741c'),(116,116,1,NULL,NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','8f1bef92-84c0-49a1-a21e-c38b3cd4aefc'),(117,117,1,NULL,NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','c2af9644-4481-40a3-ab07-b405a90f5221'),(118,118,1,NULL,NULL,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','dab4a5aa-859e-4431-b4a5-44a7261d4da4'),(119,119,1,'home-page',NULL,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','8ebe45f7-bff4-4942-b415-c2e970e2a237'),(120,120,1,NULL,NULL,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','f90823fb-172b-4adf-a585-4e3c49091002'),(121,121,1,NULL,NULL,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','1f123204-72d7-4092-bd14-6559045779ac'),(122,122,1,NULL,NULL,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','91b21272-9b07-47f6-b9b7-d8e6984528c9'),(123,123,1,NULL,NULL,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','87a74076-afb5-455a-8f37-6c6969d31530');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yqwirukfyexfktwfabcfxzzkycihygoysahd` (`postDate`),
  KEY `idx_roebzsdkiqgaamuaeikaxkdpmfahtzuzvnxc` (`expiryDate`),
  KEY `idx_yvthplerihboqblppqollylkwakvwuqjemcs` (`authorId`),
  KEY `idx_uyaeqcyoafsqlzwhgdysbrglupsptwmyjpif` (`sectionId`),
  KEY `idx_isnajqjmoqnfvgiyojtsmktgugnjaomxpvuf` (`typeId`),
  KEY `fk_elwwjxzfbjxpuksoeypolcdclecynuhytbvp` (`parentId`),
  CONSTRAINT `fk_asxwwelhfnfvqwvmvxmmoiqiakkkqtaoixfo` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eavhiaguabaicjzsgsbmtxrkyxbqnrovemtd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_elwwjxzfbjxpuksoeypolcdclecynuhytbvp` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jcswduttqrmkumqibuktgmiyymdumirmwhnt` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ywogocwkmpkgojoxebzvgiygzvoqjciapdqr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2021-05-12 17:39:00',NULL,NULL,'2021-05-12 17:39:36','2021-05-12 17:39:36','c959f3f0-3f45-4764-b1b5-82252b3f4895'),(3,1,NULL,1,1,'2021-05-12 17:50:00',NULL,NULL,'2021-05-12 17:50:59','2021-05-12 17:50:59','b714c20b-7cf6-4b50-8ead-956087114162'),(11,1,NULL,1,1,'2021-05-12 17:51:00',NULL,NULL,'2021-05-12 18:04:44','2021-05-12 18:04:44','afbc7dc8-7e1c-496c-a828-bf307f291f67'),(13,1,NULL,1,1,'2021-05-12 17:51:00',NULL,NULL,'2021-05-12 18:04:44','2021-05-12 18:04:44','4ba2015f-f54f-4ded-9e85-93399029b05c'),(18,1,NULL,1,1,'2021-05-12 18:04:00',NULL,NULL,'2021-05-12 18:05:53','2021-05-12 18:05:53','e4d12617-df50-4ecc-9a3d-dd13d91f16ef'),(20,1,NULL,1,1,'2021-05-12 18:04:00',NULL,NULL,'2021-05-12 18:05:53','2021-05-12 18:05:53','d89b689d-d0d7-4814-9688-3feb01fe4a98'),(33,1,NULL,1,1,'2021-05-12 18:07:00',NULL,NULL,'2021-05-12 18:08:26','2021-05-12 18:08:26','f791be5d-b247-4803-9a16-e3bbb279b9d9'),(35,1,NULL,1,1,'2021-05-12 18:07:00',NULL,NULL,'2021-05-12 18:08:26','2021-05-12 18:08:26','fda67791-8dad-4880-a4e7-5a32db3d71b3'),(46,1,NULL,1,1,'2021-05-12 18:09:00',NULL,NULL,'2021-05-12 18:10:08','2021-05-12 18:10:08','39d4c478-f449-4d59-854b-c5d4027135d3'),(48,1,NULL,1,1,'2021-05-12 18:09:00',NULL,NULL,'2021-05-12 18:10:08','2021-05-12 18:10:08','f847b990-861f-4986-bcab-ab0a04862c8e'),(50,2,NULL,2,NULL,'2021-05-12 18:10:00',NULL,1,'2021-05-12 18:10:57','2021-05-12 18:10:57','5894c0ae-4aee-458c-8bc0-8e1c753adc29'),(51,2,NULL,2,NULL,'2021-05-12 18:10:00',NULL,NULL,'2021-05-12 18:10:57','2021-05-12 18:10:57','e3ba8fb6-84d7-4e90-945a-49cae32104b8'),(52,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:11:31','2021-05-12 18:11:31','6e5ce901-417c-4c7f-b935-f6c10ca75623'),(53,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:11:31','2021-05-12 18:11:31','22acb7da-2138-47df-8b76-095f05067e1d'),(54,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:22:53','2021-05-12 18:22:53','19afc62e-8b85-48ab-ae54-43d6dd6e35cc'),(55,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:23:10','2021-05-12 18:23:10','0138569a-6e0c-41b7-9aea-6ea2c75a97f0'),(56,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:24:20','2021-05-12 18:24:20','cd26e666-7814-43a7-b375-9e5223185bda'),(57,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:25:14','2021-05-12 18:25:14','835f4086-e23d-4862-ae50-982f6d1592ff'),(58,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-12 18:51:23','2021-05-12 18:51:23','1572bf5f-cf36-46e5-b3d0-63d258de5b01'),(59,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-15 14:48:42','2021-05-15 14:48:42','dc15e8fe-71e2-4a06-8abb-6225525bf4de'),(61,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-15 14:49:49','2021-05-15 14:49:49','f727deca-be94-4097-afd2-9382161c21a7'),(66,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','eb3d308e-658a-4e2c-aed5-b1c0b7663840'),(71,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-15 14:55:41','2021-05-15 14:55:41','296ca37e-9f14-452c-8c14-b64f29783320'),(76,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:19:50','2021-05-16 13:19:50','d9a891ae-9a4a-43a9-b068-ac7a589ef8bc'),(81,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:23:29','2021-05-16 13:23:29','4c97169e-2bbb-479c-bf34-ffc792e5d679'),(86,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:23:55','2021-05-16 13:23:55','9f675c26-28f4-4039-8d66-d466a23238af'),(91,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:24:20','2021-05-16 13:24:20','2ecfdea1-827e-40b0-aaf0-1c02fee47566'),(96,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:24:34','2021-05-16 13:24:34','a8b04918-3ea7-4d57-9384-dc3b256acef6'),(101,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:24:38','2021-05-16 13:24:38','bf6d4365-5b91-4e7b-88c3-81f45a16cb19'),(107,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','32169520-81f4-4f26-95f3-936cde9db527'),(113,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','871bd303-b8ce-4afa-82f8-895c0adf41b6'),(119,3,NULL,3,NULL,'2021-05-12 18:11:00',NULL,NULL,'2021-05-16 13:34:24','2021-05-16 13:34:24','2e0fbfbc-80be-47c1-8636-335e37405c88');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_guwvyhnjopogtcpaytihekswpubdradtvdbp` (`name`,`sectionId`),
  KEY `idx_dxjxhfmiwulvejmakmxxmrfrentlmjyjysxo` (`handle`,`sectionId`),
  KEY `idx_kerfgahcggbwfbrxjionzsuggxtxlbukmcce` (`sectionId`),
  KEY `idx_zkynwyarsojmqwlcyaajzlzqonfiztbulaqv` (`fieldLayoutId`),
  KEY `idx_lsnaaqeekrjlmzpjxidxnagoiniydywuxtcm` (`dateDeleted`),
  CONSTRAINT `fk_jvcgkopjlijbzkfanknoukikruevnmtbseno` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qpauydefykegipnptwwifgzajvjbqbqckrbl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,3,'Website Sections','websiteSections',1,'site',NULL,NULL,1,'2021-05-12 17:39:26','2021-05-12 17:39:26',NULL,'b815609f-4929-4a35-b7cf-38fe01a06172'),(2,2,8,'Footer','footer',0,'site',NULL,'{section.name|raw}',1,'2021-05-12 18:10:57','2021-05-12 18:10:57','2021-05-12 18:11:12','1f24e570-5426-4a9d-859c-d3dd1d74f1ed'),(3,3,9,'Home Page','homePage',0,'site',NULL,'{section.name|raw}',1,'2021-05-12 18:11:31','2021-05-12 18:11:31',NULL,'5c08fae1-04c0-442b-8936-81140f082c1f');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oiclbmoujwxabliskockgfpgqvkzvhftlmph` (`name`),
  KEY `idx_ipaupicjyecxjwsxsznlzclrtaqvksedxthf` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-05-10 18:26:55','2021-05-10 18:26:55',NULL,'3c1ef848-078a-4def-9b8b-b197d295d886'),(2,'Section 1','2021-05-12 17:23:18','2021-05-12 17:23:18','2021-05-12 17:30:51','8d45f6a0-dfb1-4020-8172-530bac1d07db'),(3,'Home','2021-05-12 18:11:54','2021-05-12 18:11:54',NULL,'ebaa5076-f414-41cb-a559-c66c8fe168f9');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xkwxjqebheslfupyibuccksboiqqrbpxufju` (`layoutId`,`fieldId`),
  KEY `idx_tcjrieokxruoxuegptlribhedtotcmhdskng` (`sortOrder`),
  KEY `idx_ymtvgzismisktcqxfnfatiqcwpowtuyrqwgp` (`tabId`),
  KEY `idx_pkielidpfgcdexszjcmhzrpawsctlziuaetj` (`fieldId`),
  CONSTRAINT `fk_agwodrlgwbbbuzucbkigmoogcqcbwcrchixi` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ajbhygjvdeacncredzzrklagzthnpefcornf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bpmtlcosakqjrkeqxwhlnyvcflmuacsajrnl` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (12,3,12,5,0,1,'2021-05-12 17:51:20','2021-05-12 17:51:20','f067c161-cb60-437b-9f2b-0a0ac0731e5b'),(66,9,46,10,0,1,'2021-05-15 14:48:42','2021-05-15 14:48:42','339f581a-f571-4575-a654-4420ed5aa613'),(67,9,47,5,0,0,'2021-05-15 14:48:42','2021-05-15 14:48:42','d3f8c484-bb61-40b6-a39b-8828e86daf7b'),(68,9,48,11,0,0,'2021-05-15 14:48:42','2021-05-15 14:48:42','9b12f12e-dfe3-4ab7-9e24-1ba4d6257340'),(69,9,48,12,0,1,'2021-05-15 14:48:42','2021-05-15 14:48:42','c5cef7e8-95b8-4b31-a58f-0d65eced03c0'),(70,9,48,13,0,2,'2021-05-15 14:48:42','2021-05-15 14:48:42','64795352-61ce-4255-b866-7bac91cc15d7'),(71,9,48,14,0,3,'2021-05-15 14:48:42','2021-05-15 14:48:42','a6f5bcec-e3f3-41b5-8268-74c07797594f'),(72,9,48,15,0,4,'2021-05-15 14:48:42','2021-05-15 14:48:42','4faa7cc4-6881-423a-92ad-0e99172cd407'),(73,9,48,16,0,5,'2021-05-15 14:48:42','2021-05-15 14:48:42','e6a35586-e0f9-4300-b923-32bad3b90ce9'),(74,9,48,17,0,6,'2021-05-15 14:48:42','2021-05-15 14:48:42','14402888-7289-48d7-9784-fa5c436c7bcc'),(92,4,65,6,1,0,'2021-05-16 13:23:01','2021-05-16 13:23:01','fde71f1a-d9ac-47a0-a347-be48e07fc061'),(93,4,65,7,0,1,'2021-05-16 13:23:01','2021-05-16 13:23:01','ed5e1e01-8180-469e-a72d-b7a273dd46e8'),(94,5,66,19,0,0,'2021-05-16 13:23:01','2021-05-16 13:23:01','0f844c78-5384-42d9-8dce-020cb5270e12'),(95,5,66,8,1,1,'2021-05-16 13:23:01','2021-05-16 13:23:01','ed55b439-c7b9-4803-8163-5ca4c463b2dd'),(96,6,67,20,0,0,'2021-05-16 13:23:01','2021-05-16 13:23:01','f33cd775-d71b-426f-ba37-c71888ec7cc5'),(97,6,67,9,0,1,'2021-05-16 13:23:01','2021-05-16 13:23:01','7d408d17-f3b3-46bd-857a-eabecaaeaa69');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzpvddmwqkkypcafeqbicybeuejkdnzfrycl` (`dateDeleted`),
  KEY `idx_ncbxtpyzhonusolyqrhdkpvigzmijofdzmau` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\MatrixBlock','2021-05-12 17:28:26','2021-05-12 17:28:26','2021-05-12 17:30:51','bc6f2af0-7b58-4370-8067-cd05f3a5f3ac'),(2,'craft\\elements\\MatrixBlock','2021-05-12 17:28:26','2021-05-12 17:28:26','2021-05-12 17:30:51','957ed171-1f46-415c-a205-9dd0a1d32242'),(3,'craft\\elements\\Entry','2021-05-12 17:39:26','2021-05-12 17:39:26',NULL,'c2a8fa47-de1d-451d-8571-4a3f4d920534'),(4,'craft\\elements\\MatrixBlock','2021-05-12 17:45:53','2021-05-12 17:45:53',NULL,'581fd8b7-b8e6-4e58-92e2-fc3e793b21fe'),(5,'craft\\elements\\MatrixBlock','2021-05-12 17:50:49','2021-05-12 17:50:49',NULL,'4823a2c7-cb89-45a7-b95a-f276fb6955b3'),(6,'craft\\elements\\MatrixBlock','2021-05-12 17:50:49','2021-05-12 17:50:49',NULL,'84497792-e2c5-409f-b717-d7a51bbb2fe8'),(7,'craft\\elements\\Asset','2021-05-12 17:59:47','2021-05-12 17:59:47',NULL,'f127bb51-bb00-4a16-aabe-67e808d64720'),(8,'craft\\elements\\Entry','2021-05-12 18:10:57','2021-05-12 18:10:57','2021-05-12 18:11:12','651bb3b5-902f-4441-b1f8-3dbc7c240fb2'),(9,'craft\\elements\\Entry','2021-05-12 18:11:31','2021-05-12 18:11:31',NULL,'a2231c90-7c45-42e8-a66f-9c14329caf7e');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cmlcvpnykfdkisawbrjzubjifpujskmlskzl` (`sortOrder`),
  KEY `idx_hrafqyudokqbohlejvkvxdhybkqjbtojlwcw` (`layoutId`),
  CONSTRAINT `fk_lkiayobakpmukleuqpcrlfuqaglbcemwlksp` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (5,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d30ba727-941a-457a-9ab6-6542c06c1377\"}]',1,'2021-05-12 17:29:54','2021-05-12 17:29:54','5da164df-44d9-4bed-92a0-be2a3bddb93b'),(6,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7137393b-b431-4ab1-9acc-c9fd6deb8269\"}]',1,'2021-05-12 17:29:54','2021-05-12 17:29:54','1c782a59-f671-4ac0-b5eb-fdc44c59cc5f'),(12,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"}]',1,'2021-05-12 17:51:20','2021-05-12 17:51:20','06827a87-9fdd-44a1-ac7d-ffc67e980c88'),(29,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-05-12 18:10:57','2021-05-12 18:10:57','71d30d38-cf03-4ab3-a98b-5ade85297e88'),(46,9,'General','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"__blank__\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad\"}]',1,'2021-05-15 14:48:42','2021-05-15 14:48:42','e13c9817-1469-434e-bde1-399bbaa64f81'),(47,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"}]',2,'2021-05-15 14:48:42','2021-05-15 14:48:42','22d44672-4d38-40d8-8540-ce8a91c64074'),(48,9,'Footer','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"322ed7f8-be28-4613-89ab-2d77cf52d0a4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ec080778-2317-4a18-b00b-958a7f187b45\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"cc658fa8-0eae-43f3-8d02-f4b445fe6f3d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fcc9c8f2-bec7-4faf-869d-4cfb5ed92967\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"15985ff4-01a5-457f-a358-630694804f69\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ef423ad9-6498-4474-beef-c39087170581\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"15feb567-3988-4b0c-80b9-46a50f11e025\"}]',3,'2021-05-15 14:48:42','2021-05-15 14:48:42','cc95e4e9-1a6c-4239-8296-e599bce9a05f'),(64,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-05-16 13:12:42','2021-05-16 13:12:42','e83b9d12-da71-4fd2-be11-4a11019fd706'),(65,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":50,\"fieldUid\":\"78053f97-2ddd-4e9d-bb43-4b6c2fc6df65\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"fieldUid\":\"5a5a485e-c81a-44a0-9cf9-5662870c8701\"}]',1,'2021-05-16 13:23:01','2021-05-16 13:23:01','07e99945-97c7-4c40-aa68-9a17d5b766fc'),(66,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f2e012df-7c9f-46da-a8e9-ca818fddc5a6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"02eb17b2-0472-44eb-8436-59fbd0594bc8\"}]',1,'2021-05-16 13:23:01','2021-05-16 13:23:01','76ac18c5-1b44-4489-9ad9-d4df729da67f'),(67,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6b10cf2e-14ee-4826-ba5e-9044a4630758\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"672fea06-1d58-4d3d-b8ff-9a9e34494210\"}]',1,'2021-05-16 13:23:01','2021-05-16 13:23:01','47a73e64-e986-44fe-8333-118e45901402');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wljbdzbkkdaifqvaolhufcyusnxluwdnxxlk` (`handle`,`context`),
  KEY `idx_sibtvlqpgpzsgftjqdqmwiqffjbitgoqpudz` (`groupId`),
  KEY `idx_gjlmuevgyzazhpdehmamhyyfidxpmomymvsg` (`context`),
  CONSTRAINT `fk_mxiekhshwodaiewrlkmxaoxstyiigalactnh` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (5,1,'Sections','sectionMatrix','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_sectionmatrix}}\",\"maxBlocks\":\"10\",\"minBlocks\":\"1\",\"propagationMethod\":\"all\"}','2021-05-12 17:45:53','2021-05-15 14:50:23','fd42b47e-8f15-48d2-8832-b748a02b27bf'),(6,NULL,'Image','image','matrixBlockType:5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca','Upload an image',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:b91d1e4e-8df2-4d07-90a4-706c6f443de4\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:b91d1e4e-8df2-4d07-90a4-706c6f443de4\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-05-12 17:45:53','2021-05-12 18:01:39','78053f97-2ddd-4e9d-bb43-4b6c2fc6df65'),(7,NULL,'Image Caption','imageCaption','matrixBlockType:5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 17:50:49','2021-05-12 17:50:49','5a5a485e-c81a-44a0-9cf9-5662870c8701'),(8,NULL,'Text Content','textContent','matrixBlockType:a277356f-c325-480a-b824-cb2f5ef22096','This is where the sections content will go',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-05-12 17:50:49','2021-05-16 13:23:01','02eb17b2-0472-44eb-8436-59fbd0594bc8'),(9,NULL,'List Content','listContent','matrixBlockType:c8c7c155-4f76-45af-b57a-1ed818512aed','',0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Line of Text\",\"handle\":\"lineOfText\",\"width\":\"100\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\"}],\"maxRows\":\"\",\"minRows\":\"\"}','2021-05-12 17:50:49','2021-05-12 17:50:49','672fea06-1d58-4d3d-b8ff-9a9e34494210'),(10,3,'Page Title','pageTitle','global','Energiestrategien, for example',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":30,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:13:09','2021-05-12 18:13:09','1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad'),(11,3,'Footer Title','footerTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:18:40','2021-05-12 18:18:40','322ed7f8-be28-4613-89ab-2d77cf52d0a4'),(12,3,'Footer Company Name','companyName','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:19:06','2021-05-12 18:19:27','ec080778-2317-4a18-b00b-958a7f187b45'),(13,3,'Address Line One','addressLineOne','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:19:45','2021-05-12 18:19:45','cc658fa8-0eae-43f3-8d02-f4b445fe6f3d'),(14,3,'Address Line Two','addressLineTwo','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:19:55','2021-05-12 18:19:55','fcc9c8f2-bec7-4faf-869d-4cfb5ed92967'),(15,3,'Phone Number','phoneNumber','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:20:26','2021-05-16 13:18:48','15985ff4-01a5-457f-a358-630694804f69'),(16,3,'Email Address','emailAddress','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-12 18:20:33','2021-05-16 13:18:32','ef423ad9-6498-4474-beef-c39087170581'),(17,3,'Link to Map','linkToMap','global','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}','2021-05-12 18:21:08','2021-05-12 18:21:08','15feb567-3988-4b0c-80b9-46a50f11e025'),(19,NULL,'Section Name','sectionName','matrixBlockType:a277356f-c325-480a-b824-cb2f5ef22096','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-15 14:52:33','2021-05-15 14:52:33','f2e012df-7c9f-46da-a8e9-ca818fddc5a6'),(20,NULL,'Section Name','sectionName','matrixBlockType:c8c7c155-4f76-45af-b57a-1ed818512aed','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-05-15 14:52:33','2021-05-15 14:52:33','6b10cf2e-14ee-4826-ba5e-9044a4630758');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hscqspewmwirzailpbilvawfcpytjcopnyqo` (`name`),
  KEY `idx_qarhhtwqbfljrfgqojwmsvdetsluygavmbps` (`handle`),
  KEY `idx_lnntycbhsitjppeurdcbzpzdukqkhwlbnpwh` (`fieldLayoutId`),
  CONSTRAINT `fk_icobarzunmthqwnxhkhzzzxhuyjnhtudwycd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtepsbnidkovtldxuozzdxrbxechxvmejtzt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_upclksxonawalvseeozeefgetcneikhojlhe` (`accessToken`),
  UNIQUE KEY `idx_sgwwrotyzeaqmhxpfnwoapxcfsyvbiopjmzc` (`name`),
  KEY `fk_jfkwnwansnouyenflujfuhkylcqnazcdsbaz` (`schemaId`),
  CONSTRAINT `fk_jfkwnwansnouyenflujfuhkylcqnazcdsbaz` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.6.13','3.6.8',0,'ljevrfkrtcxs','ogifnfznwafx','2021-05-10 18:26:55','2021-05-16 13:23:01','87751fae-358a-4e69-8d6a-59c40cf75106');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wpvehczukcopjldaztxeqjulzzzcoergmyio` (`ownerId`),
  KEY `idx_dtiswhyeynjbemgmokqpyovmbqtqxmnyoioq` (`fieldId`),
  KEY `idx_evftcbbcjogwyxswritpteyylafnodszaebk` (`typeId`),
  KEY `idx_oajbhrrzuzvjfdtxvobepgrssgqnatypufpm` (`sortOrder`),
  CONSTRAINT `fk_cgpplbtbyuvarfmoujcasvpbjbrjqtosniky` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mywaedfdjrrdmanuqimujdpqmbtnpzopnogf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_trzkyfxbeyxtwuysroxotcbswohnirtijipu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wctkhgbdgkazrxpbnhqqrdhigpkmovdjjzvw` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (12,11,5,3,1,NULL,'2021-05-12 18:04:44','2021-05-12 18:04:44','8e854ef3-40a1-4902-95bd-306e09c69bb5'),(14,13,5,3,1,NULL,'2021-05-12 18:04:44','2021-05-12 18:04:44','ca40bb91-4be9-49bc-bf50-b171eb0fb1fd'),(19,18,5,4,1,NULL,'2021-05-12 18:05:53','2021-05-12 18:05:53','d10558d9-636c-4276-ba83-278715b33a77'),(21,20,5,4,1,NULL,'2021-05-12 18:05:53','2021-05-12 18:05:53','05fe506d-9720-479a-b803-73844b59c8a7'),(34,33,5,5,1,NULL,'2021-05-12 18:08:26','2021-05-12 18:08:26','56b88fdc-3a53-495a-a375-f70b3debf5b0'),(36,35,5,5,1,NULL,'2021-05-12 18:08:26','2021-05-12 18:08:26','892e8729-96ce-4f2e-a255-185915657c0a'),(47,46,5,5,1,NULL,'2021-05-12 18:10:08','2021-05-12 18:10:08','2ea8f37e-102e-402f-b408-8b5aa873decd'),(49,48,5,5,1,NULL,'2021-05-12 18:10:08','2021-05-12 18:10:08','e30d091b-3994-42b6-a0b3-052af6207de1'),(60,52,5,3,1,NULL,'2021-05-15 14:49:49','2021-05-15 14:49:49','faa84e37-6b11-4eb6-9d53-a2e0c2ead6d7'),(62,61,5,3,1,NULL,'2021-05-15 14:49:49','2021-05-15 14:49:49','fd3be2b9-ed4e-4965-b685-777b8cccacbf'),(63,52,5,4,2,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','acc32127-dcb3-42ae-8fba-92e7e34a44e8'),(64,52,5,5,3,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','34d13e7c-870b-4b25-8c04-343f49928706'),(65,52,5,5,4,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','f51cde0e-7625-43d4-9e89-4504c97f04c1'),(67,66,5,3,1,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','a8104c76-fe9d-418a-91d2-d00326765603'),(68,66,5,4,2,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','9d4f3ab9-4697-4548-b66a-67498e2d5c5f'),(69,66,5,5,3,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','12af6eb7-33c2-4c65-b04a-c46323b79086'),(70,66,5,5,4,NULL,'2021-05-15 14:54:43','2021-05-15 14:54:43','f003f805-9959-4bee-a82c-2fc4b5313df5'),(72,71,5,3,1,NULL,'2021-05-15 14:55:41','2021-05-15 14:55:41','0d89c27e-a63a-4f70-8694-67fbe26b27a3'),(73,71,5,4,2,NULL,'2021-05-15 14:55:41','2021-05-15 14:55:41','448b0eb8-b06a-444f-a6ef-e78eb946ba0c'),(74,71,5,5,3,NULL,'2021-05-15 14:55:41','2021-05-15 14:55:41','88506ecf-2b5f-4a75-9052-220c1d997322'),(75,71,5,5,4,NULL,'2021-05-15 14:55:41','2021-05-15 14:55:41','c8fcc0ea-9ae5-4ce5-90b5-c84bfe7cad62'),(77,76,5,3,1,NULL,'2021-05-16 13:19:50','2021-05-16 13:19:50','67279386-78f0-45b7-acfe-7cc3f782b5df'),(78,76,5,4,2,NULL,'2021-05-16 13:19:50','2021-05-16 13:19:50','fbe35033-b13d-4f98-9406-55ffa6ee43a8'),(79,76,5,5,3,NULL,'2021-05-16 13:19:50','2021-05-16 13:19:50','ac7a7438-405b-441e-a716-c5f33ef420da'),(80,76,5,5,4,NULL,'2021-05-16 13:19:50','2021-05-16 13:19:50','9c39d8d3-44b9-4e9b-9f7e-5de466b2cdf6'),(82,81,5,3,1,NULL,'2021-05-16 13:23:29','2021-05-16 13:23:29','d446cb80-79ef-402d-86d3-3b35753639f2'),(83,81,5,4,2,NULL,'2021-05-16 13:23:29','2021-05-16 13:23:29','f99dc4ae-b249-46d4-9d8e-0d66d218be5d'),(84,81,5,5,3,NULL,'2021-05-16 13:23:29','2021-05-16 13:23:29','d8135f18-30da-472a-973e-4cef34197ca6'),(85,81,5,5,4,NULL,'2021-05-16 13:23:29','2021-05-16 13:23:29','b059f1fa-f08c-4797-bd29-1006791e8379'),(87,86,5,3,1,NULL,'2021-05-16 13:23:55','2021-05-16 13:23:55','9d86816a-4f6a-4393-a115-d45552fdf846'),(88,86,5,4,2,NULL,'2021-05-16 13:23:55','2021-05-16 13:23:55','c3eebd15-4f47-4f43-a1f5-aece0803d700'),(89,86,5,5,3,NULL,'2021-05-16 13:23:55','2021-05-16 13:23:55','fd66208e-9de6-4f2a-919e-ba306efd1277'),(90,86,5,5,4,NULL,'2021-05-16 13:23:55','2021-05-16 13:23:55','cefc2630-936e-4e0e-a8b2-8bb8934a5d4f'),(92,91,5,3,1,NULL,'2021-05-16 13:24:20','2021-05-16 13:24:20','de12359d-32e3-4aa3-b19c-2076b82be097'),(93,91,5,4,2,NULL,'2021-05-16 13:24:20','2021-05-16 13:24:20','1011fccc-8a22-4036-bacf-e4e2019a5346'),(94,91,5,5,3,NULL,'2021-05-16 13:24:20','2021-05-16 13:24:20','c9e2f97c-16c0-413d-90f2-96b701b893c6'),(95,91,5,5,4,NULL,'2021-05-16 13:24:20','2021-05-16 13:24:20','0d67821e-9679-4285-bbcb-057275e2f8a0'),(97,96,5,3,1,NULL,'2021-05-16 13:24:34','2021-05-16 13:24:34','353c604e-d149-48d4-8e84-82a015051e41'),(98,96,5,4,2,NULL,'2021-05-16 13:24:34','2021-05-16 13:24:34','aabdbc4a-bdef-4d49-9604-f72f12125ef8'),(99,96,5,5,3,NULL,'2021-05-16 13:24:34','2021-05-16 13:24:34','dca5f6b2-2fd9-4324-8cfd-8ec6a7972bd6'),(100,96,5,5,4,NULL,'2021-05-16 13:24:34','2021-05-16 13:24:34','d151b17a-04e5-4970-95b0-bafb13b83f3f'),(102,101,5,3,1,NULL,'2021-05-16 13:24:38','2021-05-16 13:24:38','b09a3db6-495d-4d18-a661-477de5ffa4b3'),(103,101,5,4,2,NULL,'2021-05-16 13:24:38','2021-05-16 13:24:38','ed760a05-bc38-41c1-a471-8da44ebddc27'),(104,101,5,5,3,NULL,'2021-05-16 13:24:38','2021-05-16 13:24:38','e70826c6-854e-4480-b859-a57303f3e380'),(105,101,5,5,4,NULL,'2021-05-16 13:24:38','2021-05-16 13:24:38','b15cbb6b-431e-4d65-aa98-a4f924a441f9'),(106,52,5,4,5,0,'2021-05-16 13:25:06','2021-05-16 13:25:06','1c68de5e-dece-42ca-8f49-6ae5525c4035'),(108,107,5,3,1,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','225739a8-760d-450e-81a3-d4ca518e204e'),(109,107,5,4,2,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','4fa3ce1f-0410-445d-9c86-8e2ac5423575'),(110,107,5,5,3,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','46e60e8e-a0f8-42b1-ac0c-93250310d0f2'),(111,107,5,5,4,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','25f89a05-5363-405d-8fee-396196389422'),(112,107,5,4,5,NULL,'2021-05-16 13:25:06','2021-05-16 13:25:06','a319a337-ac03-49d4-950f-30a611262bdf'),(114,113,5,3,1,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','dab68207-3fbd-495e-a611-547ad9284c45'),(115,113,5,4,2,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','7f3f0ab5-28e8-428f-a447-fd6cbe2e73ed'),(116,113,5,5,3,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','870e4f46-396d-4915-8c7b-f47e1e20f2fb'),(117,113,5,5,4,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','68d6347b-b397-4865-a4e1-74b8868e6b70'),(118,113,5,4,5,NULL,'2021-05-16 13:31:03','2021-05-16 13:31:03','6f573741-c2ef-4660-9360-9a267fec780b'),(120,119,5,3,1,NULL,'2021-05-16 13:34:24','2021-05-16 13:34:24','3e005575-a875-4954-b163-d6029780e867'),(121,119,5,4,2,NULL,'2021-05-16 13:34:24','2021-05-16 13:34:24','9d9f0dc7-8363-4922-8d68-2aada8b74c3e'),(122,119,5,5,3,NULL,'2021-05-16 13:34:24','2021-05-16 13:34:24','67c20481-4884-418f-96d8-11bfe6e72a44'),(123,119,5,5,4,NULL,'2021-05-16 13:34:24','2021-05-16 13:34:24','c52a34de-cb9a-48b2-90db-c02896a1c2ab');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wurkwaeqjypzccvlkozimngyjehvujkevynu` (`name`,`fieldId`),
  KEY `idx_oahfnuvwnntwxynmimwnlcxlhfpbtbwxxxnq` (`handle`,`fieldId`),
  KEY `idx_igfvcpnxtcgonjrnvezvvnwgggfqsoapbdtj` (`fieldId`),
  KEY `idx_lgimacwmqdakgdsrhfyabqqvwoykbixfjmqk` (`fieldLayoutId`),
  CONSTRAINT `fk_aezozsfouiacojywqbcdsreoqudkzgmzlqzf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_twjlfmchluogtmwhadnviyjocanfytelolic` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (3,5,4,'Image Section','image',1,'2021-05-12 17:45:53','2021-05-12 19:01:16','5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca'),(4,5,5,'Text Section','text',2,'2021-05-12 17:50:49','2021-05-12 19:01:16','a277356f-c325-480a-b824-cb2f5ef22096'),(5,5,6,'List Section','list',3,'2021-05-12 17:50:49','2021-05-12 19:01:16','c8c7c155-4f76-45af-b57a-1ed818512aed');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_sectionmatrix`
--

DROP TABLE IF EXISTS `matrixcontent_sectionmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_sectionmatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_image_imageCaption` text COLLATE utf8_unicode_ci,
  `field_text_textContent` text COLLATE utf8_unicode_ci,
  `field_list_listContent` text COLLATE utf8_unicode_ci,
  `field_text_sectionName` text COLLATE utf8_unicode_ci,
  `field_list_sectionName` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gnxfabtflngjbucovrtyxswiupioxqrpublf` (`elementId`,`siteId`),
  KEY `idx_ejnvxpmubpioducdyhqrkoupaovlrbyodupq` (`siteId`),
  CONSTRAINT `fk_duwuwvwybhqpppphyruzzzcwuisdwodrbzix` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ggrjfiblouawitqvhzdxdbviihazotxjmyys` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_sectionmatrix`
--

LOCK TABLES `matrixcontent_sectionmatrix` WRITE;
/*!40000 ALTER TABLE `matrixcontent_sectionmatrix` DISABLE KEYS */;
INSERT INTO `matrixcontent_sectionmatrix` VALUES (2,12,1,'2021-05-12 18:04:44','2021-05-12 18:07:10','7d06d61f-fd45-4e2e-9165-8a576cc0ebc3','Panorama Godermo',NULL,NULL,NULL,NULL),(3,14,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','e0de1a68-9f17-4f74-bc77-77ca495d619e','Panorama Godermo',NULL,NULL,NULL,NULL),(4,16,1,'2021-05-12 18:04:55','2021-05-12 18:04:55','fb9a7ca7-abc8-4732-9f1b-2dff0a12fe08',NULL,NULL,NULL,NULL,NULL),(6,19,1,'2021-05-12 18:05:53','2021-05-12 18:07:10','626c20df-431e-4856-a314-e29f32e48ffd',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,NULL,NULL),(7,21,1,'2021-05-12 18:05:53','2021-05-12 18:05:53','ac31ad17-59c7-4410-92d1-0cc2fe870a39',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,NULL,NULL),(8,23,1,'2021-05-12 18:07:35','2021-05-12 18:07:35','791de67b-1c78-46bb-90bf-fc76011f9df5',NULL,NULL,'[{\"col1\":\"\"}]',NULL,NULL),(9,24,1,'2021-05-12 18:07:44','2021-05-12 18:07:44','e1c33ac3-046d-4f5a-952a-606ea9e13528',NULL,NULL,'[{\"col1\":\"Projektleitung\"}]',NULL,NULL),(10,25,1,'2021-05-12 18:07:49','2021-05-12 18:07:49','b7028543-3442-4344-bb19-48ccc011404f',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"\"}]',NULL,NULL),(11,26,1,'2021-05-12 18:07:50','2021-05-12 18:07:50','0db5cb2d-f07b-4bb2-b26f-dcefc30d7ac7',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"}]',NULL,NULL),(12,27,1,'2021-05-12 18:07:55','2021-05-12 18:07:55','1781ddbe-a915-4800-86ed-17f48e1a176f',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"\"}]',NULL,NULL),(13,28,1,'2021-05-12 18:07:57','2021-05-12 18:07:57','2ea961b8-e252-437b-9b00-94addb4d8029',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"}]',NULL,NULL),(14,29,1,'2021-05-12 18:08:00','2021-05-12 18:08:00','f1d6e09b-9aa2-439c-be32-f1be60516fad',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"\"}]',NULL,NULL),(15,30,1,'2021-05-12 18:08:01','2021-05-12 18:08:01','53b732f7-006b-4a0e-8e36-ef5b9901ffa1',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"}]',NULL,NULL),(16,31,1,'2021-05-12 18:08:05','2021-05-12 18:08:05','3dedec3c-44de-4816-b7e0-3ae0ab691d2a',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"\"}]',NULL,NULL),(18,34,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','0974ca81-d3dc-4798-acb8-d1e9d63516b0',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,NULL),(19,36,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','e72c774d-9173-44e0-ae0b-0f3227b08785',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,NULL),(20,38,1,'2021-05-12 18:09:40','2021-05-12 18:09:40','37447a19-81c6-4cf3-b521-0f5d8f4b6f0e',NULL,NULL,'[{\"col1\":\"\"}]',NULL,NULL),(21,39,1,'2021-05-12 18:09:46','2021-05-12 18:09:46','0700defb-c36e-4571-b498-cc739ca3c096',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"}]',NULL,NULL),(22,40,1,'2021-05-12 18:09:46','2021-05-12 18:09:46','f5ab55b8-e0f5-43b7-b9bb-c6c5c9e213f6',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"\"}]',NULL,NULL),(23,41,1,'2021-05-12 18:09:51','2021-05-12 18:09:51','8b667bd2-0624-45c0-8da2-40cb96d3daa6',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"}]',NULL,NULL),(24,42,1,'2021-05-12 18:09:51','2021-05-12 18:09:51','8df04aec-63fc-45db-99a5-7dab4c7ba1b6',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"\"}]',NULL,NULL),(25,43,1,'2021-05-12 18:09:56','2021-05-12 18:09:56','69bc053a-f885-4c66-ab1d-6dba2702791f',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"}]',NULL,NULL),(26,44,1,'2021-05-12 18:09:57','2021-05-12 18:09:57','16427521-ec85-4ccb-98a5-a3c7c49c02ee',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"\"}]',NULL,NULL),(28,47,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','391d64c5-e73d-409c-9faf-a58d811cce86',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,NULL),(29,49,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','419f04e2-0005-4bcd-b7d2-303fd02069a7',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,NULL),(30,60,1,'2021-05-15 14:49:49','2021-05-16 13:34:24','39490294-8dca-4e1b-b5b8-e869e4a5a47f','Panorama Godermo',NULL,NULL,NULL,NULL),(31,62,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','d8cfd1e8-c210-455c-8025-fdfaa61241c4','Panorama Godermo',NULL,NULL,NULL,NULL),(32,63,1,'2021-05-15 14:54:43','2021-05-16 13:34:24','de9b52e9-10f9-47fc-8176-706bc3cd2d9e',NULL,'\n<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(33,64,1,'2021-05-15 14:54:43','2021-05-16 13:34:24','02ae561e-1e1e-49f8-9709-c4babe96caa5',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(34,65,1,'2021-05-15 14:54:43','2021-05-16 13:34:24','a2083c09-d701-4987-91ab-be46a473c5e7',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(35,67,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','e2dc4f91-2459-4e6d-9e48-812556688566','Panorama Godermo',NULL,NULL,NULL,NULL),(36,68,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','5d3c4455-1c6e-4122-a486-69dafe927ad3',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,'Ziele',NULL),(37,69,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','e177282f-7294-4c41-9d46-9bd0c2f2e18e',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(38,70,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','c13952d1-f06b-468e-86a5-ae9000e5bdc5',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(39,72,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','161a184c-57a9-4aaf-8c39-f25d3adf6fc1','Panorama Godermo',NULL,NULL,NULL,NULL),(40,73,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','20755912-58cf-4cc7-bd56-f04a59ab68a5',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,'Ziele',NULL),(41,74,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','b0a51c5a-b6e7-4454-aad3-0b2500c269db',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(42,75,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','e6a0eb3b-aa6c-49ea-9782-eca16c342e0f',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(43,77,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','b9548ebf-bb13-47ae-b4c2-f565ee24c72c','Panorama Godermo',NULL,NULL,NULL,NULL),(44,78,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','3bd3b9cf-9853-47d3-b1b6-2b0d972abffd',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,'Ziele',NULL),(45,79,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','7db01c2a-c128-4a5f-8377-f98a745b54c6',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(46,80,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','b08d9e7b-ebe6-4009-bae2-632f0db36ec8',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(47,82,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','e1a6bc77-185a-4385-91d2-b7e41f8e283c','Panorama Godermo',NULL,NULL,NULL,NULL),(48,83,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','04ca53f6-e53a-4b99-8e64-c2b351801866',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,'Ziele',NULL),(49,84,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','a5c59ccc-ed55-4931-a336-1e7af2634f73',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(50,85,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','a8309a09-6ea0-4f3c-84e4-8fddd4486232',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(51,87,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','bb58d3dd-b32c-467f-ac81-1498564d55da','Panorama Godermo',NULL,NULL,NULL,NULL),(52,88,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','042d1bc4-fdc3-4482-9324-0dd71f71332d',NULL,'Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.\nSie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.\nSie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.',NULL,'Ziele',NULL),(53,89,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','43f17c10-f086-4d33-80dd-a4ba9f0fece4',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(54,90,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','b85de5f8-cbdf-40bd-956e-03f895fd78f7',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(55,92,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','0c5e7e4c-0888-4a6c-8d79-c0d5ab7682f1','Panorama Godermo',NULL,NULL,NULL,NULL),(56,93,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','b525f8ca-e7a7-4c48-aaf2-1b6ca09a1130',NULL,'<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(57,94,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','ebd29111-7048-479d-8c69-b228ed3e71dd',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(58,95,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','cc1a1191-9367-4643-9894-39239990ce7a',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(59,97,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','c7a9d742-3cd3-41d5-b940-df60ab2db88d','Panorama Godermo',NULL,NULL,NULL,NULL),(60,98,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','b46791c1-101e-4e99-9845-c2d9edd1a078',NULL,'<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(61,99,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','1a3b2896-2ec2-4fbb-8508-ba1641c72874',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(62,100,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','fbadac4d-3ace-450c-a2ee-9ec19ac7452f',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(63,102,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','bbc00029-0d24-440b-99a6-c4b42ee66890','Panorama Godermo',NULL,NULL,NULL,NULL),(64,103,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','55167a5a-2776-429d-8a67-f986920c6906',NULL,'<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(65,104,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','1298fd44-922b-49ae-aaef-704805ae36c8',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(66,105,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','dc906214-592e-4a01-94bb-51a56ce0f1f2',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(67,106,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','aafc6959-4429-42f5-89b2-673e02927985',NULL,'<figure><a href=\"Image\"><img src=\"{asset:10:url||./assets/media/hero-image.jpg}\" alt=\"Image\" /></a><figcaption>Image</figcaption></figure>',NULL,'Same Text Section',NULL),(68,108,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','9cb93835-8a28-4e3f-ac56-94d7ebde8b7d','Panorama Godermo',NULL,NULL,NULL,NULL),(69,109,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','91380e2d-c5af-4d08-8e5c-b8bdd6600bf2',NULL,'<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(70,110,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','a993f5f1-9003-438f-91c3-6d74286560e8',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(71,111,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','bc10fe15-5adb-48a6-8fa8-45c85bfa9c77',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(72,112,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','8d306cc4-007f-4343-8da1-4d3ec8287c14',NULL,'<figure><a href=\"Image\"><img src=\"{asset:10:url||./assets/media/hero-image.jpg}\" alt=\"Image\" /></a><figcaption>Image</figcaption></figure>',NULL,'Same Text Section',NULL),(73,114,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','3e39f91c-7958-4cce-b7a2-2e9d6b111223','Panorama Godermo',NULL,NULL,NULL,NULL),(74,115,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','2e970a3b-fecf-4210-9362-f815ae55f81d',NULL,'<figure><iframe style=\"width:500px;height:281px;\" src=\"//www.youtube.com/embed/uXuweaj1bqg\" frameborder=\"0\"></iframe></figure>\n<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(75,116,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','98ed3d05-fd34-4e4f-af71-0b3795dad6d4',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(76,117,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','5ffc75bd-4d4f-45a8-8dcf-fb9dae1cf6c2',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte'),(77,118,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','075b2d86-97ff-496e-a474-3ffae7cef81b',NULL,'<figure><a href=\"Image\"><img src=\"{asset:10:url||./assets/media/hero-image.jpg}\" alt=\"Image\" /></a><figcaption>Image</figcaption></figure>',NULL,'Same Text Section',NULL),(78,120,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','f4f01ef3-2e32-414b-9081-41c8990996d2','Panorama Godermo',NULL,NULL,NULL,NULL),(79,121,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','84d74ffb-d95d-4d80-9ace-fd3d2c1c2ee9',NULL,'\n<p>Die eTeam Togni Energie GmbH wurde 1995 in Zürich (ZH) und in Gordola (TI) gegründet.</p>\n<p>Sie engagiert sich konsequent für nachhaltige Energiepolitik, Energieversorgung und Energieanwendungen, mit dem Schwerpunkt Elektrizitätseffizienz.</p>\n<p>Sie arbeitet im Netzwerk von S.A.F.E. – Schweizerische Agentur für Energieeffizienz und verfügt im Bereich Stromeffizienz über das neuste Knowhow.</p>',NULL,'Ziele',NULL),(80,122,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','ca31b29c-f3f8-4e37-beb9-cc3128f40985',NULL,NULL,'[{\"col1\":\"Projektleitung\"},{\"col1\":\"Strategien, Konzepte und Pflichtenhefte\"},{\"col1\":\"Kommunale Energieplanungen\"},{\"col1\":\"Erarbeitung von Leitbildern und Förderprogrammen\"},{\"col1\":\"Organisation und Durchführungen von Tagungen\"}]',NULL,'Kompetenzen'),(81,123,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','b75f2480-4fda-4b45-8ebe-9aea13c1c4f6',NULL,NULL,'[{\"col1\":\"Energieplanungen von Gemeinden und Regionen im Kt. ZH sowie Begleitung und Beratung von Energiestädten.\"},{\"col1\":\"Projektleitung von diversen Projekten im Bereich Stromeffizienz (LED, Strassenbeleuchtung, topstreetlight.ch, Stand-by, Elektroheizungen, etc.)\"},{\"col1\":\"Umsetzung von diversen Förderprogrammen von ProKilowatt (effeSTRADA, effeSPORT, alledin.ch)\"},{\"col1\":\"Fachartikel für diverse Zeitschriften (regelmässige Kolumne in der italienischen Coopzeitung)\"}]',NULL,'Projekte');
/*!40000 ALTER TABLE `matrixcontent_sectionmatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixsrlssvvjfhjvmpsqicpjszeuptotlwfvtp` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e82e5197-daf8-45e1-9260-f081987bb13b'),(2,'craft','m150403_183908_migrations_table_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','87fdd158-9f83-489f-b596-686b9ff97c3a'),(3,'craft','m150403_184247_plugins_table_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e58ee8da-1fe7-4d66-9fe2-3f1474381e87'),(4,'craft','m150403_184533_field_version','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a8c082d1-a02f-42d6-8c98-f480dc3c29e1'),(5,'craft','m150403_184729_type_columns','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8df9b666-202c-4d96-b8dc-10f00e78735d'),(6,'craft','m150403_185142_volumes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','bc1d514e-407f-4e3b-9f8f-70d710dd20e0'),(7,'craft','m150428_231346_userpreferences','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','dd858460-610a-4b04-acb2-0b097f98491e'),(8,'craft','m150519_150900_fieldversion_conversion','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f7a63f1c-2b5b-4d6b-b2df-b8681337e0b8'),(9,'craft','m150617_213829_update_email_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','73e51c2e-4600-442d-a647-874e65104d08'),(10,'craft','m150721_124739_templatecachequeries','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5c00eac9-413c-4682-85fd-623e5b62ea05'),(11,'craft','m150724_140822_adjust_quality_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4974ea58-34fc-40ba-8b3a-d8acd522c4c2'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b85da7ad-a144-406e-be50-9e77c057e242'),(13,'craft','m151002_095935_volume_cache_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a1deed7b-3c0a-49d2-87de-ce60fa449f4e'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','cf03c8a5-a458-4aed-b1f2-9efd28175512'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4875faa1-a60f-4b5f-9641-401f2a1f35ca'),(16,'craft','m151209_000000_move_logo','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ebaf3c2b-dae7-47ab-ac75-9cc425a3fe06'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2222d7ad-fe7d-483d-83aa-7050bba23b6a'),(18,'craft','m151215_000000_rename_asset_permissions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6d4d3b69-f41c-4929-83e9-e1a1def51c9f'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','eb1ab276-f998-4a60-8cdf-f30e54c51f86'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c22cb077-ab69-4959-b23b-82994ed65f86'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0e6d7ed5-ac7a-4048-a7e2-b66bd40870d2'),(22,'craft','m160727_194637_column_cleanup','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a19c80b6-cdb9-46f8-bd47-b18df245c3bf'),(23,'craft','m160804_110002_userphotos_to_assets','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6c8e8d9f-4184-4570-abeb-29a9b9743257'),(24,'craft','m160807_144858_sites','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','191730fe-1408-44ea-92d1-c8a4e3bff45f'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','29748865-edaf-4ad1-9a67-84cbf2eb0185'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f2d56407-8505-4f87-bc3a-62ac232f81a7'),(27,'craft','m160912_230520_require_entry_type_id','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d60acf94-dff3-43fa-aa67-7eee07c46a3e'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','608deecd-ff95-431d-92a8-ee3997b62249'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ee1f7fba-b5b7-4442-8ceb-cb0873c283a8'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','28fab8ba-9bbb-4f6c-8e36-7d0e6d00349f'),(31,'craft','m160925_113941_route_uri_parts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f04163ba-cffb-45f9-b3f6-f11ceee6e559'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d6f0c2de-4699-48c5-a826-f89c48811329'),(33,'craft','m161007_130653_update_email_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f600bc4d-3284-4e45-ab58-9b8f3477cba0'),(34,'craft','m161013_175052_newParentId','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2f37a6ea-9c9c-4f73-86fd-f5103a5816a0'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','1101ae78-b04e-4573-8ed6-8a1e1609200f'),(36,'craft','m161021_182140_rename_get_help_widget','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','008fe214-4ce2-4e37-9247-97c7e4cf79c6'),(37,'craft','m161025_000000_fix_char_columns','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2ab02f85-a3c5-4341-971e-21bc7e9a5a36'),(38,'craft','m161029_124145_email_message_languages','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a0564a4e-a324-4891-8bb0-ab6cf23a6afe'),(39,'craft','m161108_000000_new_version_format','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4ada6cb7-63d4-4252-acfd-4f8dcdad1b45'),(40,'craft','m161109_000000_index_shuffle','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','35e9a98e-d9e8-4bdd-b7f8-6b7f1e0d771b'),(41,'craft','m161122_185500_no_craft_app','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','86b33b5b-5f0c-4068-8bf4-520aa2899359'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a0d28f95-708b-45c2-9404-9e16fdf5e81a'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a9abfaea-f186-4b0f-837f-cf095174004e'),(44,'craft','m170114_161144_udates_permission','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','242213cd-bb69-4e76-89ae-69739863aec1'),(45,'craft','m170120_000000_schema_cleanup','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','3fcb071d-239c-413b-b1ae-d8fbcf65c966'),(46,'craft','m170126_000000_assets_focal_point','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','3bd7bb34-aa13-4d61-8764-a9b160f1faf8'),(47,'craft','m170206_142126_system_name','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','760e605d-d8e4-4687-b90a-2700231deef7'),(48,'craft','m170217_044740_category_branch_limits','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','74060264-2a39-4de4-847f-406ded01711b'),(49,'craft','m170217_120224_asset_indexing_columns','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','003f3ea9-7184-442f-b87c-e78bfeeb4926'),(50,'craft','m170223_224012_plain_text_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','98669a27-f6a8-4066-a174-b642e25930a5'),(51,'craft','m170227_120814_focal_point_percentage','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','087f000c-76a7-4327-ac7e-5e2119ce6973'),(52,'craft','m170228_171113_system_messages','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','34a7ac34-6392-40aa-83e7-b8bedcee8967'),(53,'craft','m170303_140500_asset_field_source_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b1f167b9-dc37-47d0-b243-f31e99999db3'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','921b5636-f6ba-433e-ab31-f29c5ec12b6a'),(55,'craft','m170523_190652_element_field_layout_ids','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','128eeb72-fff5-4021-a485-e51ad62f778b'),(56,'craft','m170621_195237_format_plugin_handles','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5aa411d3-dae4-48fe-a09c-5470aeb5b0ca'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','78d8b321-390b-48c3-83ca-a3fe2f315b96'),(58,'craft','m170630_161028_deprecation_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8f328113-906b-4ae8-b0c8-9f28c6b9a77e'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','482c8050-2172-4632-8e26-4150fa56060e'),(60,'craft','m170704_134916_sites_tables','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ed3759c2-2461-45a4-b2b3-55edabb00938'),(61,'craft','m170706_183216_rename_sequences','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c722e6ce-f4fc-485b-ada2-a175ec9cad78'),(62,'craft','m170707_094758_delete_compiled_traits','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e96ccd1b-2e45-4de5-aa77-900595e04602'),(63,'craft','m170731_190138_drop_asset_packagist','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','3bb537c1-df82-4656-9815-bddcef628897'),(64,'craft','m170810_201318_create_queue_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','eb50dbb7-2b98-4b9f-96d5-32eb25b3d74a'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5e844179-12a4-4be4-ab75-65c930d5c777'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','87f04f74-a530-4fc8-92f4-ee68445ad6e7'),(67,'craft','m171011_214115_site_groups','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2aacdf5c-db4d-448c-81f3-8a59f375efe0'),(68,'craft','m171012_151440_primary_site','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a9594388-5c68-4255-9064-6fbc4ebda177'),(69,'craft','m171013_142500_transform_interlace','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','9f0ef2d7-fea5-4469-8917-b1e9da1e5b88'),(70,'craft','m171016_092553_drop_position_select','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','7820c5d3-c246-41f7-b094-af32a19a7915'),(71,'craft','m171016_221244_less_strict_translation_method','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','162a74ae-30d0-404a-b2d6-3bb6ce3ec06b'),(72,'craft','m171107_000000_assign_group_permissions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','48668289-70ff-408c-9c1e-6afdc0e20ca7'),(73,'craft','m171117_000001_templatecache_index_tune','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8d0e4264-7715-4183-ac5a-4280b377ae38'),(74,'craft','m171126_105927_disabled_plugins','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','dd902969-429d-4d20-936f-e96295e2c55e'),(75,'craft','m171130_214407_craftidtokens_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2955fdea-debc-4795-ae03-e02faa467d61'),(76,'craft','m171202_004225_update_email_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','00f1992c-6f45-4afd-b871-d9c0764e029c'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','38a5b9b9-7128-471c-8416-92272bdafdf9'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','fd06c2c4-eade-44d7-b882-b93fed75cb0e'),(79,'craft','m171218_143135_longtext_query_column','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ea71eaee-c29b-41c4-a0c5-97c983f7e8b0'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f07edf47-a771-4349-8a92-861d5504a102'),(81,'craft','m180113_153740_drop_users_archived_column','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','9c03b1a5-c9d9-4706-902b-9b08b099fc37'),(82,'craft','m180122_213433_propagate_entries_setting','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','13e41d65-a866-4287-aa4b-4fdf41e5f88e'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','cfe7202e-f2c8-427f-a7d9-52ee8bdc8add'),(84,'craft','m180128_235202_set_tag_slugs','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','42f182dd-f0f6-4a88-9dd8-f080fa33583e'),(85,'craft','m180202_185551_fix_focal_points','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e5923025-5c4d-43b1-ad8b-abe25558282c'),(86,'craft','m180217_172123_tiny_ints','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a6ec8a75-1182-403c-9bf4-f7487009aa92'),(87,'craft','m180321_233505_small_ints','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a24c7739-ca30-4a11-a2f9-0a23da2ad1e4'),(88,'craft','m180404_182320_edition_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','57348995-b3c2-4425-8fab-e33f38224a09'),(89,'craft','m180411_102218_fix_db_routes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0e62d731-0190-45b4-89d5-814319c2e5ec'),(90,'craft','m180416_205628_resourcepaths_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','60593ba1-6596-4971-ab13-28f4280d5930'),(91,'craft','m180418_205713_widget_cleanup','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','919b4a92-6d03-438f-a37d-0d01970ab47d'),(92,'craft','m180425_203349_searchable_fields','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d496a156-8310-49e8-a6a1-79b6c9c85902'),(93,'craft','m180516_153000_uids_in_field_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','065f8467-89dc-448a-90f1-a6d67a64ac8d'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b1dcb574-f5bd-49e1-928e-06de6e812195'),(95,'craft','m180518_173000_permissions_to_uid','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','3c5998d4-f91b-4b7b-bc8e-7ed19b3bc87f'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','16aafd0e-07f4-43fa-b806-376c7ab5cad8'),(97,'craft','m180521_172900_project_config_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','aea44b16-24dc-44e1-8a0b-f2f9d3d75ce8'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5e32c68c-fd5a-4674-8e75-5f2426b952ad'),(99,'craft','m180731_162030_soft_delete_sites','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','877f143d-b62f-4e58-9fbf-d3d00eb89503'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','7c8d8bb7-ab72-4b2a-90a0-517ac0e43bbc'),(101,'craft','m180810_214439_soft_delete_elements','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f6bf93b7-60e1-411c-9087-9fdf955bb8c9'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a6405e7b-0847-4575-bc8d-ca77bd0e1b75'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','591f4671-b44e-4f3f-b663-34904b4eacc1'),(104,'craft','m180904_112109_permission_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6c18153a-9ed7-412c-acd0-b03a2a69b6fd'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','69fee7f8-c97b-48ec-8b2a-21073e7b060e'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e876a0b3-097e-48da-a5f4-ba2221e0e61a'),(107,'craft','m181016_183648_set_default_user_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','fb28d7ed-5373-4d67-8634-56a00e382a48'),(108,'craft','m181017_225222_system_config_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','9b04ccaf-c6fc-4f36-b7c3-f1b1d698af43'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4226c622-92ce-4d29-8ef3-5647101c6a34'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0065f06e-b4df-423e-bef9-d4d90a7a6a13'),(111,'craft','m181112_203955_sequences_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f9fef121-8ea9-40b9-8c61-d32dc1505aa7'),(112,'craft','m181121_001712_cleanup_field_configs','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','fbb3fb35-c2f7-4292-b2dc-a1a53d694a8a'),(113,'craft','m181128_193942_fix_project_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5bf1c10d-7923-4376-b165-ab1a8d672980'),(114,'craft','m181130_143040_fix_schema_version','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a2af00d7-f44a-4187-b2a1-ab8c066b245a'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6618dc40-e66c-432c-a8cd-7283e27a96a5'),(116,'craft','m181217_153000_fix_structure_uids','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','41097a76-509a-465e-935c-bebe7006f403'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','67ac1968-1bd3-43af-94a4-dd233658cf44'),(118,'craft','m190108_110000_cleanup_project_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2dfd0ea9-bf29-43ae-91cb-c60a2ae9a34a'),(119,'craft','m190108_113000_asset_field_setting_change','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2ecd703c-fc7d-4e92-a37a-7a77980c905a'),(120,'craft','m190109_172845_fix_colspan','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f34afe7c-14bb-4f72-a884-84b924ea6e42'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','afd40f30-3994-46a7-a07a-eb8dc9b4e9d9'),(122,'craft','m190110_214819_soft_delete_volumes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4634addb-7fed-4bb6-a7ea-48c561a0aba7'),(123,'craft','m190112_124737_fix_user_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8561e971-3531-4ddd-840e-02fd2124c2d5'),(124,'craft','m190112_131225_fix_field_layouts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a8a4f863-d5c3-4e32-9724-a805fe23984f'),(125,'craft','m190112_201010_more_soft_deletes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','337bc73d-7dfa-484b-abea-92a4b73e537e'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','73a71040-2ce8-48f4-8e41-658ee219f485'),(127,'craft','m190121_120000_rich_text_config_setting','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','34b589f6-c774-49db-8da5-b9567ceaed51'),(128,'craft','m190125_191628_fix_email_transport_password','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','005b70ff-c1aa-498f-85a2-b90d9d69a50f'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d8581bb2-c5a9-447a-b6e4-a1e75412a23f'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','25cd3d25-38d4-4931-bd62-2213cc5b7a2c'),(131,'craft','m190218_143000_element_index_settings_uid','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d2f16753-eb35-46b6-a8dd-9383a3b672a7'),(132,'craft','m190312_152740_element_revisions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','200b8681-1c61-4e0e-b5cc-9f5a42a56c77'),(133,'craft','m190327_235137_propagation_method','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b9ca366a-f498-4a13-961f-472903bb6db5'),(134,'craft','m190401_223843_drop_old_indexes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f89e03a0-06bf-4f93-98c2-02cc9b2ea005'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5fbe626b-57ca-4a49-a35e-bd6a9ee18571'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','621826f1-9dbe-4136-83c9-c4657df73df3'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','40b75e97-c9bc-4b8b-a630-d492172f33f3'),(138,'craft','m190504_150349_preview_targets','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','e9c6ce66-08ff-4a8b-8e90-33d5789f3da3'),(139,'craft','m190516_184711_job_progress_label','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a9427153-7763-4c8e-8a99-9e6a2dfb88cf'),(140,'craft','m190523_190303_optional_revision_creators','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','d1010a8e-33f8-4b87-a605-55f75df9364b'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','3f5e1a51-9a40-4047-bbd6-3e14b7088ff3'),(142,'craft','m190605_223807_unsaved_drafts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8e7b6a97-7d26-4f40-bdc9-4a42a5b63813'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5b93e631-726b-40b5-9e3c-b86614643b4a'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','f522ab37-b90d-4614-801f-375607dd80b5'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0d27ddab-2432-44cc-9356-65863fab0b30'),(146,'craft','m190624_234204_matrix_propagation_method','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4f7e8723-1877-4776-a363-51d6f8b55430'),(147,'craft','m190711_153020_drop_snapshots','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','848cf1da-0330-4359-a3ac-0e796ed66de3'),(148,'craft','m190712_195914_no_draft_revisions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4b9de7b3-8c51-4c29-b959-9426f952b199'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0667378d-be6d-4e81-b144-83ac3dbfda0d'),(150,'craft','m190820_003519_flush_compiled_templates','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ee72f82d-9d6a-430f-b067-986151385977'),(151,'craft','m190823_020339_optional_draft_creators','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4e8f2c97-1e78-4b55-ac40-31e177689c92'),(152,'craft','m190913_152146_update_preview_targets','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ade63cf8-0cca-493a-b959-69c8c913860c'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','ff4acf64-bf67-4637-b810-4214d1ba3bbf'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','79f29386-3aff-4ad3-8adc-773c82d74b13'),(155,'craft','m191206_001148_change_tracking','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','90a643a8-830f-418f-8e6a-50f20e6bcd21'),(156,'craft','m191216_191635_asset_upload_tracking','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b4cb18cb-cbdd-4b89-aa99-8bd5fd38dcbd'),(157,'craft','m191222_002848_peer_asset_permissions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','7f33ad70-3b82-42f6-9b3d-dfd95ad0bb8d'),(158,'craft','m200127_172522_queue_channels','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','417fd858-d067-470e-b604-3d822b1dfe80'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c89553f4-3474-46e1-a7c1-b66212d0cfa8'),(160,'craft','m200213_172522_new_elements_index','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','99dd0574-4c6a-4b45-be63-d5a9e8e2bd6a'),(161,'craft','m200228_195211_long_deprecation_messages','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0d37f6fa-44bd-4cfc-97ce-eef90b53c6ca'),(162,'craft','m200306_054652_disabled_sites','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','a75e18cf-8b9c-4663-944a-9699f907d0d6'),(163,'craft','m200522_191453_clear_template_caches','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','4e18748c-e363-4ffa-be99-0bb099f47531'),(164,'craft','m200606_231117_migration_tracks','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','76c2e336-eb64-4941-9718-c894e0af67a7'),(165,'craft','m200619_215137_title_translation_method','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b2067da8-3f2e-4ce1-a33e-f4213bbe7d44'),(166,'craft','m200620_005028_user_group_descriptions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c9516721-759c-4d95-be6f-ba784923673b'),(167,'craft','m200620_230205_field_layout_changes','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','7899fa6e-b1a6-4054-8816-33fefe87e722'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b956fdac-2f7a-4beb-b1ef-f04dcefb75fd'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','70acf89a-d4dd-4f09-a6fa-9d32a619e4f4'),(170,'craft','m200630_183000_drop_configmap','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b35bdeb4-c2b7-48a6-b002-13b99834dbaa'),(171,'craft','m200715_113400_transform_index_error_flag','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6e8b431a-04c0-4095-bc25-b93fddd110c4'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','44a1a6ed-afe2-4786-9389-c4f33001b70e'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b1b62ca1-1c8e-4db7-84ae-5004a9aa0cfd'),(174,'craft','m200720_175543_drop_unique_constraints','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','b07cf3f1-9b90-4809-970c-00ebd5bac9d4'),(175,'craft','m200825_051217_project_config_version','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','91fc8ab8-c94d-4a39-b93c-3bafe2d6fa0c'),(176,'craft','m201116_190500_asset_title_translation_method','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c1451e87-4229-4a22-b660-b1c6bebdec6c'),(177,'craft','m201124_003555_plugin_trials','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','5cc2e77e-944b-4d14-bfd3-7d3aaf844ca4'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','8b5c5c68-f559-4269-b749-3b670876f6ac'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','1fde0fe1-f937-4d90-b2aa-30a99bee1b6c'),(180,'craft','m210214_202731_track_saved_drafts','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','eb5c3630-5496-4b99-a806-c29820b04d90'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','0cdaf72c-c0f6-4a05-9645-9df4aaad5ccf'),(182,'craft','m210224_162000_add_projectconfignames_table','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','c6b9775f-c3cc-466f-b1a7-5e2296c6d482'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','2f0654f6-b597-4d43-8974-db6bae19a250'),(184,'craft','m210331_220322_null_author','2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-10 18:26:55','6dbc9871-dfa4-4924-9f42-f1c44148a1a1'),(185,'plugin:redactor','m180430_204710_remove_old_plugins','2021-05-10 18:28:16','2021-05-10 18:28:16','2021-05-10 18:28:16','4d4f454a-1660-467d-b45c-5ff071338137'),(186,'plugin:redactor','Install','2021-05-10 18:28:16','2021-05-10 18:28:16','2021-05-10 18:28:16','f78fa2bc-f82b-4549-a554-6627c4db38b5'),(187,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-05-10 18:28:16','2021-05-10 18:28:16','2021-05-10 18:28:16','c0e21aa9-722c-4eae-b165-12686495ebf9');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aflxoorgayfwojejrlciljdtfcfkewnzkefl` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.8.7','2.3.0','unknown',NULL,'2021-05-10 18:28:16','2021-05-10 18:28:16','2021-05-15 14:40:20','d2142123-5e1a-47b8-b8be-a5d21b2bc76f');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1621171381'),('email.fromEmail','\"giuse.togni@etogni.ch\"'),('email.fromName','\"etogni\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.autocomplete','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.autocorrect','true'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.class','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.disabled','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.id','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.instructions','\"\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.label','\"__blank__\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.max','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.min','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.name','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.orientation','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.placeholder','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.readonly','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.requirable','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.size','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.step','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.title','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.0.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.fieldUid','\"1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.elements.1.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.name','\"General\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.0.sortOrder','1'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.fieldUid','\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.elements.0.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.name','\"Content\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.1.sortOrder','2'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.fieldUid','\"322ed7f8-be28-4613-89ab-2d77cf52d0a4\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.0.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.fieldUid','\"ec080778-2317-4a18-b00b-958a7f187b45\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.1.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.fieldUid','\"cc658fa8-0eae-43f3-8d02-f4b445fe6f3d\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.2.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.fieldUid','\"fcc9c8f2-bec7-4faf-869d-4cfb5ed92967\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.3.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.fieldUid','\"15985ff4-01a5-457f-a358-630694804f69\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.4.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.fieldUid','\"ef423ad9-6498-4474-beef-c39087170581\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.5.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.fieldUid','\"15feb567-3988-4b0c-80b9-46a50f11e025\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.instructions','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.label','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.required','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.tip','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.warning','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.elements.6.width','100'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.name','\"Footer\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.fieldLayouts.a2231c90-7c45-42e8-a66f-9c14329caf7e.tabs.2.sortOrder','3'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.handle','\"homePage\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.hasTitleField','false'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.name','\"Home Page\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.section','\"3c5cecc0-7c62-4ae2-8413-da322ad1cee7\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.sortOrder','1'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.titleFormat','\"{section.name|raw}\"'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.titleTranslationKeyFormat','null'),('entryTypes.5c08fae1-04c0-442b-8936-81140f082c1f.titleTranslationMethod','\"site\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.autocomplete','false'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.autocorrect','true'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.class','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.disabled','false'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.id','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.instructions','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.label','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.max','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.min','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.name','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.orientation','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.placeholder','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.readonly','false'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.requirable','false'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.size','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.step','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.tip','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.title','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.warning','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.0.width','100'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.fieldUid','\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.instructions','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.label','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.required','false'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.tip','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.warning','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.elements.1.width','100'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.name','\"Content\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.fieldLayouts.c2a8fa47-de1d-451d-8571-4a3f4d920534.tabs.0.sortOrder','1'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.handle','\"websiteSections\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.hasTitleField','true'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.name','\"Website Sections\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.section','\"3e74bd8a-57a1-4d97-afc0-a5a44544c0c0\"'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.sortOrder','1'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.titleFormat','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.titleTranslationKeyFormat','null'),('entryTypes.b815609f-4929-4a35-b7cf-38fe01a06172.titleTranslationMethod','\"site\"'),('fieldGroups.3c1ef848-078a-4def-9b8b-b197d295d886.name','\"Common\"'),('fieldGroups.ebaa5076-f414-41cb-a559-c66c8fe168f9.name','\"Home\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.contentColumnType','\"text\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.handle','\"phoneNumber\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.instructions','\"\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.name','\"Phone Number\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.searchable','false'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.byteLimit','null'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.charLimit','null'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.code','\"\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.columnType','null'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.initialRows','\"4\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.multiline','\"\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.placeholder','null'),('fields.15985ff4-01a5-457f-a358-630694804f69.settings.uiMode','\"normal\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.translationKeyFormat','null'),('fields.15985ff4-01a5-457f-a358-630694804f69.translationMethod','\"none\"'),('fields.15985ff4-01a5-457f-a358-630694804f69.type','\"craft\\\\fields\\\\PlainText\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.contentColumnType','\"string(255)\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.handle','\"linkToMap\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.instructions','\"\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.name','\"Link to Map\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.searchable','false'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.settings.maxLength','\"255\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.settings.placeholder','null'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.settings.types.0','\"url\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.translationKeyFormat','null'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.translationMethod','\"none\"'),('fields.15feb567-3988-4b0c-80b9-46a50f11e025.type','\"craft\\\\fields\\\\Url\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.contentColumnType','\"string(120)\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.handle','\"pageTitle\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.instructions','\"Energiestrategien, for example\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.name','\"Page Title\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.searchable','false'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.byteLimit','null'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.charLimit','30'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.code','\"\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.columnType','null'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.initialRows','\"4\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.multiline','\"\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.placeholder','null'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.settings.uiMode','\"normal\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.translationKeyFormat','null'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.translationMethod','\"none\"'),('fields.1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad.type','\"craft\\\\fields\\\\PlainText\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.contentColumnType','\"text\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.handle','\"footerTitle\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.instructions','\"\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.name','\"Footer Title\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.searchable','false'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.byteLimit','null'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.charLimit','null'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.code','\"\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.columnType','null'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.initialRows','\"4\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.multiline','\"\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.placeholder','null'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.settings.uiMode','\"normal\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.translationKeyFormat','null'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.translationMethod','\"none\"'),('fields.322ed7f8-be28-4613-89ab-2d77cf52d0a4.type','\"craft\\\\fields\\\\PlainText\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.contentColumnType','\"text\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.handle','\"addressLineOne\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.instructions','\"\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.name','\"Address Line One\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.searchable','false'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.byteLimit','null'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.charLimit','null'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.code','\"\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.columnType','null'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.initialRows','\"4\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.multiline','\"\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.placeholder','null'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.settings.uiMode','\"normal\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.translationKeyFormat','null'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.translationMethod','\"none\"'),('fields.cc658fa8-0eae-43f3-8d02-f4b445fe6f3d.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.contentColumnType','\"text\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.handle','\"companyName\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.instructions','\"\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.name','\"Footer Company Name\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.searchable','false'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.byteLimit','null'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.charLimit','null'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.code','\"\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.columnType','null'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.initialRows','\"4\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.multiline','\"\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.placeholder','null'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.settings.uiMode','\"normal\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.translationKeyFormat','null'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.translationMethod','\"none\"'),('fields.ec080778-2317-4a18-b00b-958a7f187b45.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.contentColumnType','\"text\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.handle','\"emailAddress\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.instructions','\"\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.name','\"Email Address\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.searchable','false'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.byteLimit','null'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.charLimit','null'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.code','\"\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.columnType','null'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.initialRows','\"4\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.multiline','\"\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.placeholder','null'),('fields.ef423ad9-6498-4474-beef-c39087170581.settings.uiMode','\"normal\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.translationKeyFormat','null'),('fields.ef423ad9-6498-4474-beef-c39087170581.translationMethod','\"none\"'),('fields.ef423ad9-6498-4474-beef-c39087170581.type','\"craft\\\\fields\\\\PlainText\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.contentColumnType','\"text\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.fieldGroup','\"ebaa5076-f414-41cb-a559-c66c8fe168f9\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.handle','\"addressLineTwo\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.instructions','\"\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.name','\"Address Line Two\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.searchable','false'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.byteLimit','null'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.charLimit','null'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.code','\"\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.columnType','null'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.initialRows','\"4\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.multiline','\"\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.placeholder','null'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.settings.uiMode','\"normal\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.translationKeyFormat','null'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.translationMethod','\"none\"'),('fields.fcc9c8f2-bec7-4faf-869d-4cfb5ed92967.type','\"craft\\\\fields\\\\PlainText\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.contentColumnType','\"string\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.fieldGroup','\"3c1ef848-078a-4def-9b8b-b197d295d886\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.handle','\"sectionMatrix\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.instructions','\"\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.name','\"Sections\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.searchable','false'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.settings.contentTable','\"{{%matrixcontent_sectionmatrix}}\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.settings.maxBlocks','\"10\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.settings.minBlocks','\"1\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.settings.propagationMethod','\"all\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.translationKeyFormat','null'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.translationMethod','\"site\"'),('fields.fd42b47e-8f15-48d2-8832-b748a02b27bf.type','\"craft\\\\fields\\\\Matrix\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.field','\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.fieldUid','\"78053f97-2ddd-4e9d-bb43-4b6c2fc6df65\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.label','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.required','true'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.0.width','50'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.fieldUid','\"5a5a485e-c81a-44a0-9cf9-5662870c8701\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.label','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.required','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.elements.1.width','50'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.name','\"Content\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fieldLayouts.581fd8b7-b8e6-4e58-92e2-fc3e793b21fe.tabs.0.sortOrder','1'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.contentColumnType','\"text\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.fieldGroup','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.handle','\"imageCaption\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.instructions','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.name','\"Image Caption\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.searchable','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.byteLimit','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.charLimit','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.code','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.columnType','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.initialRows','\"4\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.multiline','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.placeholder','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.settings.uiMode','\"normal\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.translationKeyFormat','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.translationMethod','\"none\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.5a5a485e-c81a-44a0-9cf9-5662870c8701.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.contentColumnType','\"string\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.fieldGroup','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.handle','\"image\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.instructions','\"Upload an image\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.name','\"Image\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.searchable','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.allowSelfRelations','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.allowUploads','true'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.defaultUploadLocationSource','\"volume:b91d1e4e-8df2-4d07-90a4-706c6f443de4\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.limit','\"1\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.localizeRelations','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.previewMode','\"full\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.restrictFiles','\"1\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.selectionLabel','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.showSiteMenu','true'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.showUnpermittedFiles','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.singleUploadLocationSource','\"volume:b91d1e4e-8df2-4d07-90a4-706c6f443de4\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.source','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.sources','\"*\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.targetSiteId','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.useSingleFolder','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.validateRelatedElements','false'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.settings.viewMode','\"list\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.translationKeyFormat','null'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.translationMethod','\"site\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.fields.78053f97-2ddd-4e9d-bb43-4b6c2fc6df65.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.handle','\"image\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.name','\"Image Section\"'),('matrixBlockTypes.5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca.sortOrder','1'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.field','\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.fieldUid','\"f2e012df-7c9f-46da-a8e9-ca818fddc5a6\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.label','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.required','false'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.tip','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.warning','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.0.width','100'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.fieldUid','\"02eb17b2-0472-44eb-8436-59fbd0594bc8\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.label','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.required','true'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.tip','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.warning','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.elements.1.width','100'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.name','\"Content\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fieldLayouts.4823a2c7-cb89-45a7-b95a-f276fb6955b3.tabs.0.sortOrder','1'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.contentColumnType','\"text\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.fieldGroup','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.handle','\"textContent\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.instructions','\"This is where the sections content will go\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.name','\"Text Content\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.searchable','false'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.availableTransforms','\"*\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.availableVolumes','\"*\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.cleanupHtml','true'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.columnType','\"text\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.defaultTransform','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.manualConfig','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.purifierConfig','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.purifyHtml','\"1\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.redactorConfig','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.removeNbsp','\"1\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.showUnpermittedFiles','false'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.translationKeyFormat','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.translationMethod','\"none\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.02eb17b2-0472-44eb-8436-59fbd0594bc8.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.contentColumnType','\"text\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.fieldGroup','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.handle','\"sectionName\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.instructions','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.name','\"Section Name\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.searchable','false'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.byteLimit','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.charLimit','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.code','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.columnType','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.initialRows','\"4\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.multiline','\"\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.placeholder','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.settings.uiMode','\"normal\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.translationKeyFormat','null'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.translationMethod','\"none\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.fields.f2e012df-7c9f-46da-a8e9-ca818fddc5a6.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.handle','\"text\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.name','\"Text Section\"'),('matrixBlockTypes.a277356f-c325-480a-b824-cb2f5ef22096.sortOrder','2'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.field','\"fd42b47e-8f15-48d2-8832-b748a02b27bf\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.fieldUid','\"6b10cf2e-14ee-4826-ba5e-9044a4630758\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.label','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.required','false'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.tip','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.warning','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.0.width','100'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.fieldUid','\"672fea06-1d58-4d3d-b8ff-9a9e34494210\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.label','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.required','false'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.tip','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.warning','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.elements.1.width','100'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.name','\"Content\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fieldLayouts.84497792-e2c5-409f-b717-d7a51bbb2fe8.tabs.0.sortOrder','1'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.contentColumnType','\"text\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.fieldGroup','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.handle','\"listContent\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.instructions','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.name','\"List Content\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.searchable','false'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.addRowLabel','\"Add a row\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Line of Text\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.1.1','\"lineOfText\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.2.1','\"100\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.columnType','\"text\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.defaults.0.__assoc__.0.0','\"col1\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.defaults.0.__assoc__.0.1','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.maxRows','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.settings.minRows','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.translationKeyFormat','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.translationMethod','\"none\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.672fea06-1d58-4d3d-b8ff-9a9e34494210.type','\"craft\\\\fields\\\\Table\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.contentColumnType','\"text\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.fieldGroup','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.handle','\"sectionName\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.instructions','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.name','\"Section Name\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.searchable','false'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.byteLimit','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.charLimit','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.code','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.columnType','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.initialRows','\"4\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.multiline','\"\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.placeholder','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.settings.uiMode','\"normal\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.translationKeyFormat','null'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.translationMethod','\"none\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.fields.6b10cf2e-14ee-4826-ba5e-9044a4630758.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.handle','\"list\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.name','\"List Section\"'),('matrixBlockTypes.c8c7c155-4f76-45af-b57a-1ed818512aed.sortOrder','3'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('routes.10e9a1e6-9ea0-4472-b999-bb11fc320e9e.siteUid','null'),('routes.10e9a1e6-9ea0-4472-b999-bb11fc320e9e.sortOrder','1'),('routes.10e9a1e6-9ea0-4472-b999-bb11fc320e9e.template','\"/home/_entry.twig\"'),('routes.10e9a1e6-9ea0-4472-b999-bb11fc320e9e.uriPattern','\"\"'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.enableVersioning','true'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.handle','\"homePage\"'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.name','\"Home Page\"'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.propagationMethod','\"all\"'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.enabledByDefault','true'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.hasUrls','false'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.template','null'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.uriFormat','null'),('sections.3c5cecc0-7c62-4ae2-8413-da322ad1cee7.type','\"single\"'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.enableVersioning','true'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.handle','\"websiteSections\"'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.name','\"Website Sections\"'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.propagationMethod','\"all\"'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.enabledByDefault','true'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.hasUrls','false'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.template','null'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.siteSettings.7efe677d-a414-4b20-908f-07705825a31d.uriFormat','null'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.structure.maxLevels','null'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.structure.uid','\"423dcbd5-b6cb-4a3c-b5f4-9710c4b5f2b5\"'),('sections.3e74bd8a-57a1-4d97-afc0-a5a44544c0c0.type','\"structure\"'),('siteGroups.c53e501c-16ad-43ed-80dc-cf14e8ce532a.name','\"etogni\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.handle','\"default\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.hasUrls','true'),('sites.7efe677d-a414-4b20-908f-07705825a31d.language','\"en\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.name','\"etogni\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.primary','true'),('sites.7efe677d-a414-4b20-908f-07705825a31d.siteGroup','\"c53e501c-16ad-43ed-80dc-cf14e8ce532a\"'),('sites.7efe677d-a414-4b20-908f-07705825a31d.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"eTogni - Home\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.6.8\"'),('system.timeZone','\"Europe/Zurich\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.autocapitalize','true'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.autocomplete','false'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.autocorrect','true'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.class','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.disabled','false'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.id','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.instructions','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.label','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.max','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.min','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.name','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.orientation','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.placeholder','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.readonly','false'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.requirable','false'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.size','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.step','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.tip','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.title','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.warning','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.elements.0.width','100'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.name','\"Content\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.fieldLayouts.f127bb51-bb00-4a16-aabe-67e808d64720.tabs.0.sortOrder','1'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.handle','\"sectionPhotos\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.hasUrls','true'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.name','\"Section Photos\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.settings.path','\"@webroot/assets/media\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.sortOrder','0'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.titleTranslationKeyFormat','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.titleTranslationMethod','null'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.type','\"craft\\\\volumes\\\\Local\"'),('volumes.b91d1e4e-8df2-4d07-90a4-706c6f443de4.url','\"./assets/media\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
INSERT INTO `projectconfignames` VALUES ('02eb17b2-0472-44eb-8436-59fbd0594bc8','Text Content'),('15985ff4-01a5-457f-a358-630694804f69','Phone Number'),('15feb567-3988-4b0c-80b9-46a50f11e025','Link to Map'),('1ced93ec-2ece-49ef-80fc-25ed5cb1a6ad','Page Title'),('322ed7f8-be28-4613-89ab-2d77cf52d0a4','Footer Title'),('3c1ef848-078a-4def-9b8b-b197d295d886','Common'),('3c5cecc0-7c62-4ae2-8413-da322ad1cee7','Home Page'),('3e74bd8a-57a1-4d97-afc0-a5a44544c0c0','Website Sections'),('5221a8ce-f20a-4fdd-b3ab-c9d7600ec9ca','Image Section'),('5a5a485e-c81a-44a0-9cf9-5662870c8701','Image Caption'),('5c08fae1-04c0-442b-8936-81140f082c1f','Home Page'),('672fea06-1d58-4d3d-b8ff-9a9e34494210','List Content'),('6b10cf2e-14ee-4826-ba5e-9044a4630758','Section Name'),('7137393b-b431-4ab1-9acc-c9fd6deb8269','List'),('78053f97-2ddd-4e9d-bb43-4b6c2fc6df65','Image'),('7efe677d-a414-4b20-908f-07705825a31d','etogni'),('898a502c-9466-45eb-8671-fc43191a9a25','Section Name'),('a277356f-c325-480a-b824-cb2f5ef22096','Text Section'),('b815609f-4929-4a35-b7cf-38fe01a06172','Website Sections'),('b91d1e4e-8df2-4d07-90a4-706c6f443de4','Section Photos'),('c53e501c-16ad-43ed-80dc-cf14e8ce532a','etogni'),('c8c7c155-4f76-45af-b57a-1ed818512aed','List Section'),('cc658fa8-0eae-43f3-8d02-f4b445fe6f3d','Address Line One'),('d30ba727-941a-457a-9ab6-6542c06c1377','Text'),('ebaa5076-f414-41cb-a559-c66c8fe168f9','Home'),('ec080778-2317-4a18-b00b-958a7f187b45','Footer Company Name'),('ef423ad9-6498-4474-beef-c39087170581','Email Address'),('f2e012df-7c9f-46da-a8e9-ca818fddc5a6','Section Name'),('fcc9c8f2-bec7-4faf-869d-4cfb5ed92967','Address Line Two'),('fd42b47e-8f15-48d2-8832-b748a02b27bf','Sections');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_ajiamwntqkiywkvqknizcfhogqivjhupgsgm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_ggawwenbacoanudviqoiubelupvbamlpxkqv` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lfmvxutgaexuzxlcdnojswfgjpnrrhonabyt` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_bgoqfeekwpbcvqmtfmqagvqmucovhewblwka` (`sourceId`),
  KEY `idx_qbordbdtcubabwfhtgttwmhlbhuoqieingzq` (`targetId`),
  KEY `idx_eutlvmsotxdsaxuuetjdwjnyzzxpazlyoowo` (`sourceSiteId`),
  CONSTRAINT `fk_bhkloruqhmyxpajspezvndwvihvqwkqzpflb` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhcnikxwevaybcoefnsbbuhawfhksjwlikex` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qtqzerjgandhwrfstzgykeuaebdszyreaaxc` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rqudaadkzdgknecxhtrguvwstujlqxxumqam` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (2,6,12,NULL,10,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','31605494-e5ee-42e1-9cb3-850d00e305e9'),(3,6,14,NULL,10,1,'2021-05-12 18:04:44','2021-05-12 18:04:44','df9bcd4e-ab3c-475b-ab06-268990edb8c1'),(4,6,60,NULL,10,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','579216d6-8fbc-41b3-abea-dad8e2f2cbbc'),(5,6,62,NULL,10,1,'2021-05-15 14:49:49','2021-05-15 14:49:49','f1f29876-caea-428a-a756-a69e314d61c5'),(6,6,67,NULL,10,1,'2021-05-15 14:54:43','2021-05-15 14:54:43','e8e86e98-4f90-4774-9adf-3a3fca9bfab4'),(7,6,72,NULL,10,1,'2021-05-15 14:55:41','2021-05-15 14:55:41','f2c1cfdb-e70b-4081-8059-50d985148413'),(8,6,77,NULL,10,1,'2021-05-16 13:19:50','2021-05-16 13:19:50','66c74792-96d6-4c1b-a3d5-2db3426e5f63'),(9,6,82,NULL,10,1,'2021-05-16 13:23:29','2021-05-16 13:23:29','f2d12fae-2e80-44c4-89ad-02cdbc972e76'),(10,6,87,NULL,10,1,'2021-05-16 13:23:55','2021-05-16 13:23:55','ce671078-194d-4d8f-97a5-c13685a56907'),(11,6,92,NULL,10,1,'2021-05-16 13:24:20','2021-05-16 13:24:20','28e3627c-3070-409c-b315-400793a6137e'),(12,6,97,NULL,10,1,'2021-05-16 13:24:34','2021-05-16 13:24:34','17ce15c6-2cc0-4143-a3dd-afb8ace79611'),(13,6,102,NULL,10,1,'2021-05-16 13:24:38','2021-05-16 13:24:38','c81ef83b-0249-473b-98e1-5a300164ee06'),(14,6,108,NULL,10,1,'2021-05-16 13:25:06','2021-05-16 13:25:06','35c20cdc-a105-4c57-9d38-6c1fc5f609e2'),(15,6,114,NULL,10,1,'2021-05-16 13:31:03','2021-05-16 13:31:03','58aab830-a206-4f27-b8e9-93725b3a7d92'),(16,6,120,NULL,10,1,'2021-05-16 13:34:24','2021-05-16 13:34:24','495be74e-cac8-4e04-a70d-090953371fff');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('102f0bb6','@craft/web/assets/updater/dist'),('113ea4dc','@lib/axios'),('19ec4de9','@craft/web/assets/recententries/dist'),('1a953877','@craft/web/assets/editsection/dist'),('1be9e495','@lib/jquery-ui'),('1e89f9a','@craft/web/assets/feed/dist'),('22673ec0','@app/web/assets/pluginstore/dist'),('27560f87','@craft/web/assets/updateswidget/dist'),('316bb7d5','@lib/xregexp'),('3453e66b','@craft/web/assets/pluginstore/dist'),('36fb1513','@craft/web/assets/login/dist'),('395f73eb','@app/web/assets/cp/dist'),('3b07f35f','@lib/selectize'),('3cd507a9','@lib/vue'),('3d28d616','@craft/web/assets/cp/dist'),('3efda2de','@craft/web/assets/craftsupport/dist'),('417ae607','@craft/web/assets/updates/dist'),('44cf884d','@bower/jquery/dist'),('47273d32','@lib/fabric'),('472857ad','@craft/web/assets/deprecationerrors/dist'),('4967d0d8','@lib/jquery.payment'),('5261e90c','@lib/garnishjs'),('55407f30','@lib/velocity'),('57cad638','@craft/redactor/assets/field/dist'),('580d7b51','@craft/web/assets/editentry/dist'),('61dcfe8a','@lib/d3'),('67615a3d','@craft/web/assets/matrixsettings/dist'),('68dde219','@lib/jquery-touch-events'),('6b213df3','@craft/web/assets/routes/dist'),('6b5f23b8','@lib/element-resize-detector'),('6f42b1eb','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('6f79dedb','@lib/picturefill'),('7791df25','@lib/fileupload'),('78abb951','@craft/web/assets/dashboard/dist'),('7b32e032','@lib/iframe-resizer'),('80faf98e','@craft/web/assets/craftsupport/dist'),('832f8d46','@craft/web/assets/cp/dist'),('8a54bd3b','@craft/web/assets/pluginstore/dist'),('907e008c','@craft/web/assets/generalsettings/dist'),('9412778e','@craft/web/assets/fieldsettings/dist'),('9677ddc4','@lib/xregexp'),('995154d7','@craft/web/assets/updateswidget/dist'),('9bc96db8','@lib/vue'),('9c1b994e','@lib/selectize'),('a7eb16b9','@craft/web/assets/recententries/dist'),('a98885b1','@lib/timepicker'),('ae2850e6','@craft/web/assets/updater/dist'),('b622cecd','@lib/axios'),('b89970b4','@app/web/assets/plugins/dist'),('bcf58e84','@lib/jquery-ui'),('bfefc4ca','@craft/web/assets/feed/dist'),('c093ee02','@craft/redactor/assets/redactor-plugins/dist/video'),('c2c6fda1','@craft/redactor/assets/redactor/dist'),('c6ace201','@craft/web/assets/dashboard/dist'),('c6c0949b','@lib/d3'),('c865b4ca','@lib/picturefill'),('cc4349a9','@lib/element-resize-detector'),('cd478281','@lib/prismjs'),('cfc18808','@lib/jquery-touch-events'),('d08db534','@lib/fileupload'),('d10661f5','@craft/web/assets/matrix/dist'),('d1f71dfa','@craft/web/assets/tablesettings/dist'),('d9ddb58c','@craft/web/assets/utilities/dist'),('dc2e8a23','@lib/iframe-resizer'),('e03b5723','@lib/fabric'),('e3d3e25c','@bower/jquery/dist'),('ee7bbac9','@lib/jquery.payment'),('f0cb575a','@craft/web/assets/admintable/dist'),('f25c1521','@lib/velocity'),('f57d831d','@lib/garnishjs'),('f9e5af8f','@craft/web/assets/fields/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqvjtjjeuunevlkpindijdiwnevxmxytmwwg` (`sourceId`,`num`),
  KEY `fk_cnflwzvcmkiqeaiztpwtnbtegxrbmypjpeiw` (`creatorId`),
  CONSTRAINT `fk_cnflwzvcmkiqeaiztpwtnbtegxrbmypjpeiw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pqhnlpgismygvwwwscfgpcdnpcyesjggingg` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,11,1,1,''),(2,18,1,1,''),(3,33,1,1,''),(4,46,1,1,''),(5,50,1,1,NULL),(6,52,1,1,NULL),(7,52,1,2,NULL),(8,52,1,3,''),(9,52,1,4,''),(10,52,1,5,NULL),(11,52,1,6,NULL),(12,52,1,7,NULL),(13,52,1,8,''),(14,52,1,9,''),(15,52,1,10,''),(16,52,1,11,''),(17,52,1,12,''),(18,52,1,13,''),(19,52,1,14,''),(20,52,1,15,''),(21,52,1,16,''),(22,52,1,17,''),(23,52,1,18,''),(24,52,1,19,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vdmhjzygpvzbxlofsqbaoloemhepizznrrci` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' etogni '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' giuse togni etogni ch '),(1,'slug',0,1,''),(2,'slug',0,1,' temp phuliqlkhrmisxkynmwtbnoknjghwfxilnvt '),(2,'title',0,1,''),(3,'slug',0,1,' temp objccsmzifejkeoanripgbdmieemqvgfjdmf '),(3,'title',0,1,''),(11,'slug',0,1,' panorama godermo '),(11,'title',0,1,' panorama godermo '),(10,'filename',0,1,' hero image jpg '),(10,'extension',0,1,' jpg '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' hero image '),(12,'slug',0,1,''),(14,'slug',0,1,''),(18,'slug',0,1,' ziele '),(18,'title',0,1,' ziele '),(19,'slug',0,1,''),(21,'slug',0,1,''),(33,'slug',0,1,' kompetenzen '),(33,'title',0,1,' kompetenzen '),(34,'slug',0,1,''),(36,'slug',0,1,''),(46,'slug',0,1,' projekte '),(46,'title',0,1,' projekte '),(47,'slug',0,1,''),(49,'slug',0,1,''),(50,'title',0,1,' footer '),(50,'slug',0,1,' footer '),(52,'slug',0,1,' home page '),(52,'title',0,1,' home page '),(60,'slug',0,1,''),(62,'slug',0,1,''),(63,'slug',0,1,''),(64,'slug',0,1,''),(65,'slug',0,1,''),(67,'slug',0,1,''),(68,'slug',0,1,''),(69,'slug',0,1,''),(70,'slug',0,1,''),(72,'slug',0,1,''),(73,'slug',0,1,''),(74,'slug',0,1,''),(75,'slug',0,1,''),(77,'slug',0,1,''),(78,'slug',0,1,''),(79,'slug',0,1,''),(80,'slug',0,1,''),(82,'slug',0,1,''),(83,'slug',0,1,''),(84,'slug',0,1,''),(85,'slug',0,1,''),(87,'slug',0,1,''),(88,'slug',0,1,''),(89,'slug',0,1,''),(90,'slug',0,1,''),(92,'slug',0,1,''),(93,'slug',0,1,''),(94,'slug',0,1,''),(95,'slug',0,1,''),(97,'slug',0,1,''),(98,'slug',0,1,''),(99,'slug',0,1,''),(100,'slug',0,1,''),(102,'slug',0,1,''),(103,'slug',0,1,''),(104,'slug',0,1,''),(105,'slug',0,1,''),(106,'slug',0,1,''),(108,'slug',0,1,''),(109,'slug',0,1,''),(110,'slug',0,1,''),(111,'slug',0,1,''),(112,'slug',0,1,''),(114,'slug',0,1,''),(115,'slug',0,1,''),(116,'slug',0,1,''),(117,'slug',0,1,''),(118,'slug',0,1,''),(120,'slug',0,1,''),(121,'slug',0,1,''),(122,'slug',0,1,''),(123,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jmwfzztetrtijsszjbsuaaemfjylkujxxfbl` (`handle`),
  KEY `idx_ebbgoqhngrkclyxejzfapqrhbyfyxgyoiqrj` (`name`),
  KEY `idx_snhqlbyuutvfuuglgjouogeclqponyjfrmkj` (`structureId`),
  KEY `idx_swsghrfvaqddradpxhodbgicehkvmmmgycxz` (`dateDeleted`),
  CONSTRAINT `fk_dbwzcdlcckovovblgvcjvarppmzqjnwcxgvl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,'Website Sections','websiteSections','structure',1,'all',NULL,'2021-05-12 17:39:26','2021-05-12 18:07:09',NULL,'3e74bd8a-57a1-4d97-afc0-a5a44544c0c0'),(2,NULL,'Footer','footer','single',1,'all',NULL,'2021-05-12 18:10:57','2021-05-12 18:10:57','2021-05-12 18:11:12','1b0514d3-4a9c-48d9-80da-bafa3f1205cf'),(3,NULL,'Home Page','homePage','single',1,'all',NULL,'2021-05-12 18:11:31','2021-05-12 18:11:31',NULL,'3c5cecc0-7c62-4ae2-8413-da322ad1cee7');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wftkhrvxpumqkusqsdqiloxhfhnnkggohfhs` (`sectionId`,`siteId`),
  KEY `idx_ztplyqycjuyusjqomfqakpgbbasooilgdoym` (`siteId`),
  CONSTRAINT `fk_fbvytyirvtoapbclvvxxhpncqdppcpymwsrc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hzmzlacvjelscekcdnmgkxpzbjfkcybrhrfu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2021-05-12 17:39:26','2021-05-12 17:44:29','c99045d9-0c60-4269-b989-7e895fc6a687'),(2,2,1,1,'footer',NULL,1,'2021-05-12 18:10:57','2021-05-12 18:10:57','a8102603-99ff-405b-a472-364174f5be30'),(3,3,1,0,NULL,NULL,1,'2021-05-12 18:11:31','2021-05-12 18:25:14','15219ff3-90ac-4a54-b4df-441751e5a6d4');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ipspchirnqegqscuphhyxgfwhzeohzxadzty` (`uid`),
  KEY `idx_tmvhfbfajrhaessunjmghjterorpbbprlbln` (`token`),
  KEY `idx_skjnjxtvpobqpnskkheyzxnxyrtpnmhcrbll` (`dateUpdated`),
  KEY `idx_gtcorscgxfklaljqpvvxkajquyjldpdcsqph` (`userId`),
  CONSTRAINT `fk_pecwkzvfaqiocfuiiaejiewajagsjbunaknb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fdysorlifzgmmognavuivlavtuvbeaxcvsqf` (`userId`,`message`),
  CONSTRAINT `fk_fktsmgktsajsdtehtiptyxmwkraxinuhsatw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qszafrmjijxtnskywwkfhnhqjppdmtcsvled` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'etogni','2021-05-10 18:26:55','2021-05-10 18:26:55',NULL,'c53e501c-16ad-43ed-80dc-cf14e8ce532a');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bfqnyuffvusszngmppdsvtebzrptlavpnrql` (`dateDeleted`),
  KEY `idx_chsuudxjugjjshmmnhtztgomidkpsoiajaqp` (`handle`),
  KEY `idx_bxvcsgkczdfeoakamowgdtjvqczuzxmnldee` (`sortOrder`),
  KEY `fk_dyajzebensrmfmskoaockaghpwlibnibtrjg` (`groupId`),
  CONSTRAINT `fk_dyajzebensrmfmskoaockaghpwlibnibtrjg` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'etogni','default','en',1,'$PRIMARY_SITE_URL',1,'2021-05-10 18:26:55','2021-05-10 18:26:55',NULL,'7efe677d-a414-4b20-908f-07705825a31d');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uxafabsatfyrzftfbhxosjgllpjynlpowuvi` (`structureId`,`elementId`),
  KEY `idx_meajsogknmjpibdtrocdpwksmgzwoqnvtviu` (`root`),
  KEY `idx_mfgszhannrgmwamtmkgtpqcbdueyyvaabkbw` (`lft`),
  KEY `idx_qdheynwtzocsaxglzfaeimkcdedrsxvctnjz` (`rgt`),
  KEY `idx_daudtynuikxvmzbfjmqnzyvscqittogpbebo` (`level`),
  KEY `idx_cgaeucyzxyqtvtdiypyxlivfngknzgaiimln` (`elementId`),
  CONSTRAINT `fk_alehcoeqivkxowuirsroadpwwfyvembilyui` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_unyflzqtmcizzflsxsudqguoqgsuuukwbgqr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,14,0,'2021-05-12 18:07:09','2021-05-12 18:10:08','1cee128d-e9cc-4824-9613-cf73a935315c'),(2,1,11,1,2,3,1,'2021-05-12 18:07:09','2021-05-12 18:07:09','f2fdc92c-1af3-4c03-a393-918c429d59ee'),(3,1,18,1,4,5,1,'2021-05-12 18:07:09','2021-05-12 18:07:09','8de20002-3037-4dc6-be2f-4d4558528bc0'),(5,1,33,1,6,7,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','a1e5f22e-9c1e-45d6-9876-8c762cfb509a'),(6,1,35,1,8,9,1,'2021-05-12 18:08:26','2021-05-12 18:08:26','dd0513bc-bdde-4a8f-9265-3df258809806'),(8,1,46,1,10,11,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','0b5fb261-40ca-4c1d-97f3-decc3f5579c6'),(9,1,48,1,12,13,1,'2021-05-12 18:10:08','2021-05-12 18:10:08','c16816e0-a9a8-44df-9920-ba5a8edddfd8');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lxmdkyoiejaomjiteomacolqgqmuvyhtdzjt` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,NULL,'2021-05-12 18:07:09','2021-05-12 18:07:09',NULL,'423dcbd5-b6cb-4a3c-b5f4-9710c4b5f2b5');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fffidgfkxwwjqjzdfktelrjbvryvednqckdz` (`key`,`language`),
  KEY `idx_gpxeefezgjzwtztinmwnxwwnkhalyqpdzcjl` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vcwbkwvgknyffzpmnsvdgqyfgobyaekhgyqx` (`name`),
  KEY `idx_jmdpcasxumfuwuawrwhtwtwfdtcqygjugkns` (`handle`),
  KEY `idx_hpcirtlllbzawtowctlvmfoaonkftcesoxyv` (`dateDeleted`),
  KEY `fk_oxprysrouiqykuyixpsukmntlqvsmkdsqows` (`fieldLayoutId`),
  CONSTRAINT `fk_oxprysrouiqykuyixpsukmntlqvsmkdsqows` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iwjsixnbkdcsleznxrvimvgrvipgritluyim` (`groupId`),
  CONSTRAINT `fk_bblvvajrwdcxynvrdfllvcrirewjzuuztocx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lotpshtvkdcdukoukoidrkprskupytdmobsj` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tftxbsesysgjtfyxjxxwlkabphptcjwvkpex` (`cacheId`),
  KEY `idx_fgrcrvhcugvvawryfsjvtijkmnfydczgmtby` (`elementId`),
  CONSTRAINT `fk_xmlyhlxrfqnhnzlcrapanwcksivsfznxbtbd` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ygcfkbsaymaxaaabkysmaxdjcujlcpqzyupb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_luzyjpytohpzetlpvuuxuoifiiskwvvvvgya` (`cacheId`),
  KEY `idx_qnzpvxryjfcwvuineycdvjdljodhjafatklt` (`type`),
  CONSTRAINT `fk_crebazujgteavzsahzvrsnrtsifayfswbxyw` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ryjhdqwsgusewomkbchbrzzdjlevqmhtgjri` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_hsoiorfzcacfqlvugxhypbnbejrcrytufosg` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_ktwpiusikobsroawxpakzydgesiuyacgblwg` (`siteId`),
  CONSTRAINT `fk_dqxryfhjrecnbneakdosgqtfiqrfxvicxkhg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_glqnisykfgyrmviskrkajgxqgzswonrslggl` (`token`),
  KEY `idx_ukpsgelyqteffbzdesaiqrqtmmklsjiuuxro` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ykdlzgprlilfgjcujmgdzfcfrukbulomksot` (`handle`),
  KEY `idx_etkgmstdhsyzzjmciisbqentzkzhetfjiuur` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_amaxnukqxfllbqjqxaweamplihqpqqfmqlgc` (`groupId`,`userId`),
  KEY `idx_xssltrftwpudyiwtxxkegewdvulpyqegrifv` (`userId`),
  CONSTRAINT `fk_lyzbujtsknveppzivgivolcilfdwfaepsjhh` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uuwxkhdyotbmrdhxffrxbkjoqyspewxixhba` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zjybjfspzzpxcfvuhvkrqecmkygsdrowhiqt` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eyjfsfvzukuvobyingpgtssobmqsxoxltajg` (`permissionId`,`groupId`),
  KEY `idx_wyfdpagpuomgmcgslefnkjnuhwtwbuqlpjrd` (`groupId`),
  CONSTRAINT `fk_dphkapgvjaofweugvlxvdbtkmgdynuilmazg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzfnrxbhtvubeudsqaigpexeyifafbldenpg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aruirpbftsfiyztfrdftbconvwiihovuvrng` (`permissionId`,`userId`),
  KEY `idx_pfzkpfyhjozavcnvfpbbjzzhhiuccmgcgokr` (`userId`),
  CONSTRAINT `fk_ckvhmclltkosrwtaefchbyzpbfsehofweqmr` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dbxbubtukjctehhkjxipjcdrwzcifhzkmtuv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_rbikhyyglsvcvtdnaokafbvbhaeddqgqzuwv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unkyudobefsccifnkvgdujkpnxlxwsiqbrfc` (`uid`),
  KEY `idx_cbsnqzzlitfjhabnoqtrivmfsxuxmmgrvehe` (`verificationCode`),
  KEY `idx_acrdneglwrwvgzzujrikrgngkmbeafeczdgy` (`email`),
  KEY `idx_steodyjvwavehjgfrtuppfbebrshaayrwpvk` (`username`),
  KEY `fk_zaxdglvqaydtjvihkwqsaywlvohywhylzfiq` (`photoId`),
  CONSTRAINT `fk_fkhddvkxinojhtduufomncxmtzepwmjowwzz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zaxdglvqaydtjvihkwqsaywlvohywhylzfiq` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'etogni',NULL,NULL,NULL,'giuse.togni@etogni.ch','$2y$13$OGTKOJHuAtETOisNZsb68OsZ4LFbfAyoJF.8h97woZzreluehW/4u',1,0,0,0,'2021-05-16 13:03:29',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-05-10 18:26:55','2021-05-10 18:26:55','2021-05-16 13:03:29','6d3aa261-ef5e-4183-8bf2-5df97231b33a');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_akbavflwsrmgliwpywqopgforjvzqzjhtivt` (`name`,`parentId`,`volumeId`),
  KEY `idx_ewdukcauhwohdoaorxpfusbtngbhzggypweo` (`parentId`),
  KEY `idx_tgiimzuuwbcfqlfzcueuqhjhyvdqyvokbcto` (`volumeId`),
  CONSTRAINT `fk_ittfmmkntjqskcyvusyenrfokuskafkcpilh` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfdgswnlkwbqlsrdnrwkomifcmucvxsqbwuy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Section Photos','','2021-05-12 17:59:47','2021-05-12 17:59:47','99e9ffef-4f2d-4a63-8782-8bc24cb13a18'),(2,NULL,NULL,'Temporary source',NULL,'2021-05-12 17:59:51','2021-05-12 17:59:51','03fd742a-3f1c-45b7-bd2f-fd64455dad4f'),(3,2,NULL,'user_1','user_1/','2021-05-12 17:59:51','2021-05-12 17:59:51','56be28d0-6725-4680-9ecc-2f369b1cab2f'),(4,1,1,'assets','assets/','2021-05-12 18:01:12','2021-05-12 18:01:12','7a936817-df63-4ae1-96fb-000226c8c469');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hzqwuyofxdxciotowvnwtxljwtaasyzrrbkn` (`name`),
  KEY `idx_kgslyoxdqfpuxsebpznktcofixkyweolwxeq` (`handle`),
  KEY `idx_drwoiyunjkyxgyzvxtnawavpxhtoufafcikc` (`fieldLayoutId`),
  KEY `idx_xdssqctzwikaseychcyltfazfylpssnmjere` (`dateDeleted`),
  CONSTRAINT `fk_nrqccurqoboooiwujkfdlpspscaywnohbamz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,7,'Section Photos','sectionPhotos','craft\\volumes\\Local',1,'./assets/media','site',NULL,'{\"path\":\"@webroot/assets/media\"}',0,'2021-05-12 17:59:47','2021-05-16 13:12:42',NULL,'b91d1e4e-8df2-4d07-90a4-706c6f443de4');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gqylrfxrapueszcgzxoimhbfndbymmsvujkj` (`userId`),
  CONSTRAINT `fk_vedzsrjjfyediyicggnuocvyrotliscnskzg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-05-10 18:26:57','2021-05-10 18:26:57','65fc6e07-c7a2-4e83-a6ac-4c17bac68958'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-05-10 18:26:57','2021-05-10 18:26:57','2a7ae5fb-1285-4dd8-a646-73916edc7118'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-05-10 18:26:57','2021-05-10 18:26:57','c45787b9-d78e-4bc9-a068-93dbad2a7a64'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-05-10 18:26:57','2021-05-10 18:26:57','b6ec1ed2-0075-4aaa-91d9-1835e3a4d37d');
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

-- Dump completed on 2021-05-18 13:17:32
