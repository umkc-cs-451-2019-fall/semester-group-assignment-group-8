-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: kc-sce-appdb01    Database: stv_services
-- ------------------------------------------------------
-- Server version	5.6.39-enterprise-commercial-advanced-log

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

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `ChannelName` varchar(30) NOT NULL DEFAULT '',
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ChannelName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES ('ABC','The American Broadcasting Company is an American commercial broadcast radio and television networks'),('Amazon Prime Original','Amazon Prime exclusive content'),('AMC','AMC is an American pay television channel that is an owned flagship property of AMC Networks.'),('Cartoon Network','Cartoon Network is an American pay television channel owned by Warner Bros. Entertainment, a division of AT&T\'s WarnerMedia'),('CNN','CNN is an American news-based pay television channel owned by AT&T\'s WarnerMedia'),('Disney','The Walt Disney Company, commonly known as Disney, is an American diversified multinational mass media and entertainment conglomerate'),('ESPN','Get up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more'),('FOX','The Fox Broadcasting Company is an American free-to-air television network that is a flagship property of the Fox Corporation'),('FX','FX is an American pay television channel owned by the Walt Disney Television unit of The Walt Disney Company through FX Networks, LLC.'),('Hulu Original','Hulu exclusive conent'),('MTV','MTV is an American pay television channel launched on August 1, 1981 based in New York City.'),('NBC','The National Broadcasting Company is an American English-language commercial terrestrial radio and television networks'),('Netflix Series','Netflix exclusive content'),('OmanTV','Oman TV is the national television channel broadcaster in Sultanate of Oman. Since 1997, Oman TV has broadcast its programs through its website. Wikipedia'),('PBS','The Public Broadcasting Service is an American public broadcaster and television program distributor.'),('The CW','The CW Television Network is an American English-language free-to-air television network that is operated by The CW Network, LLC'),('TNT','TNT is an American pay television network that is owned by WarnerMedia Entertainment'),('USA','USA Network is an American pay television channel that is owned by the NBCUniversal Cable Entertainment Group division of NBCUniversal, a subsidiary of Comcast.'),('Warner Bros','Warner Bros. Entertainment Inc. is an American entertainment company headquartered in Burbank, California and the flagship property of AT&T\'s WarnerMedia.');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `EpisodeID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonID` int(11) DEFAULT NULL,
  `EpisodeTitle` varchar(20) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`EpisodeID`),
  KEY `fk_seasonID` (`SeasonID`),
  CONSTRAINT `fk_seasonID` FOREIGN KEY (`SeasonID`) REFERENCES `seasons` (`SeasonID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favlist`
--

DROP TABLE IF EXISTS `favlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favlist` (
  `FavID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `ShowName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FavID`),
  KEY `fk_username` (`username`),
  KEY `fk_showName_fav` (`ShowName`),
  CONSTRAINT `fk_showName_fav` FOREIGN KEY (`ShowName`) REFERENCES `shows` (`ShowName`) ON DELETE CASCADE,
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favlist`
--

LOCK TABLES `favlist` WRITE;
/*!40000 ALTER TABLE `favlist` DISABLE KEYS */;
INSERT INTO `favlist` VALUES (2,'ahmed','Four Weddings and a Funeral'),(3,'ahmed','House'),(4,'johnwick','American Horror Story'),(5,'johnwick','Four Weddings and a Funeral'),(6,'johnwick','House'),(7,'johnwick','Bobs Burgers'),(8,'johnwick','Downton Abbey'),(10,'ma123','American Horror Story'),(12,'ahmed','American Horror Story');
/*!40000 ALTER TABLE `favlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagechannel`
--

DROP TABLE IF EXISTS `packagechannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagechannel` (
  `PackChannelID` int(11) NOT NULL AUTO_INCREMENT,
  `PackageID` int(11) DEFAULT NULL,
  `ChannelName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PackChannelID`),
  KEY `fk_package_pack` (`PackageID`),
  KEY `fk_package_channel` (`ChannelName`),
  CONSTRAINT `fk_package_channel` FOREIGN KEY (`ChannelName`) REFERENCES `channels` (`ChannelName`) ON DELETE CASCADE,
  CONSTRAINT `fk_package_pack` FOREIGN KEY (`PackageID`) REFERENCES `packages` (`PackageID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagechannel`
--

LOCK TABLES `packagechannel` WRITE;
/*!40000 ALTER TABLE `packagechannel` DISABLE KEYS */;
INSERT INTO `packagechannel` VALUES (1,1,'NBC'),(2,2,'NBC'),(3,3,'NBC'),(4,4,'NBC'),(5,1,'FOX'),(6,2,'FOX'),(7,3,'FOX'),(8,4,'FOX'),(9,1,'ABC'),(10,2,'ABC'),(11,3,'ABC'),(12,4,'ABC'),(46,18,'ABC'),(47,18,'Cartoon Network'),(48,18,'ESPN'),(49,18,'MTV'),(50,18,'OmanTV'),(51,18,'PBS'),(52,18,'Warner Bros');
/*!40000 ALTER TABLE `packagechannel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `PackageID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(20) DEFAULT NULL,
  `PackName` varchar(20) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`PackageID`),
  KEY `fk_servicename` (`ServiceName`),
  CONSTRAINT `fk_servicename` FOREIGN KEY (`ServiceName`) REFERENCES `serviceprovider` (`ServiceName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Hulu','Basic','Access to catalogue, Access to premium add-ons',5.99),(2,'Hulu','Premium','Ad-free, Access to catalogue, Access to premium add-ons',11.99),(3,'Hulu','Basic + Live TV','Access to catalogue, Access to 60+ channels, Access to premium add-ons',44.99),(4,'Hulu','Premium + Live TV','Access to catalogue, Access to 60+ channels, Access to premium add-ons',50.99),(5,'Netflix','Basic','Stream TV shows and movies from Netflix on one device at a time in standard definition (SD).',8.99),(6,'Netflix','Standard Plan','Stream TV shows and movies from Netflix on two devices at the same time and in high definition (HD) when available.',12.99),(7,'Netflix','Premium Plan','Stream TV shows and movies from Netflix on four devices at the same time and in high definition (HD) and ultra high definition (UHD) when available',15.99),(8,'Amazon Prime Video','Basic Plan','Included with an Amazon Prime Membership',12.99),(9,'Amazon Prime Video','Student Plan','Included with an Amazon Prime Student Membership',6.49),(18,'Hulu','Golden Pack','Hulu.',12.00);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `ProblemID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(20) DEFAULT NULL,
  `Description` text,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ProblemID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'Registring Problem!','Whenever I click on the submit button, it says that I cannot create new account. \r\nCan you please fix this problem?\r\nThanks!','Problem'),(2,'New Report Test!','New Report Test!','1'),(5,'drop list test v.3','drop list test v.3','Feedback'),(6,'Test','this a test!','Feedback');
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `SeasonID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowName` varchar(50) DEFAULT NULL,
  `Episodes` int(11) DEFAULT NULL,
  `SeasonTitle` varchar(20) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`SeasonID`),
  KEY `fk_showID` (`ShowName`),
  CONSTRAINT `fk_showID` FOREIGN KEY (`ShowName`) REFERENCES `shows` (`ShowName`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'Oman Daily News',0,'These are no seasons','These are no seasons!');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceprovider`
--

DROP TABLE IF EXISTS `serviceprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceprovider` (
  `ServiceName` varchar(20) NOT NULL DEFAULT '',
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ServiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceprovider`
--

LOCK TABLES `serviceprovider` WRITE;
/*!40000 ALTER TABLE `serviceprovider` DISABLE KEYS */;
INSERT INTO `serviceprovider` VALUES ('Amazon Prime Video','Check out what\'s included with your Prime membership.Prime Video is the only place where you can watch Amazon Original series'),('Hulu','Watch Thousands of Shows and Movies Anytime, Anywhere'),('Netflix','Watch Netflix movies & TV shows online or stream right to your smart TV, game console, PC, Mac, mobile, tablet and more.'),('Sling','Sling Television, commonly known as Sling TV, is an American over-the-top internet television service owned by Dish Network. Wikipedia');
/*!40000 ALTER TABLE `serviceprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showlist`
--

DROP TABLE IF EXISTS `showlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showlist` (
  `ShowListID` int(11) NOT NULL AUTO_INCREMENT,
  `ShowName` varchar(50) DEFAULT NULL,
  `ServiceName` varchar(20) DEFAULT NULL,
  `Seasons` int(11) DEFAULT NULL,
  `Episodes` int(11) DEFAULT NULL,
  PRIMARY KEY (`ShowListID`),
  KEY `fk_ShowName` (`ShowName`),
  KEY `fk_showlist_servicename` (`ServiceName`),
  CONSTRAINT `fk_ShowName` FOREIGN KEY (`ShowName`) REFERENCES `shows` (`ShowName`),
  CONSTRAINT `fk_showlist_servicename` FOREIGN KEY (`ServiceName`) REFERENCES `serviceprovider` (`ServiceName`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showlist`
--

LOCK TABLES `showlist` WRITE;
/*!40000 ALTER TABLE `showlist` DISABLE KEYS */;
INSERT INTO `showlist` VALUES (1,'This Is Us','Hulu',4,60),(2,'Bobs Burgers','Hulu',10,177),(3,'The Masked Singer','Hulu',3,15),(4,'The Good Doctor','Hulu',3,41),(5,'Saturday Night Live','Hulu',22,420),(6,'Four Weddings and a Funeral','Hulu',1,10),(7,'Superstore','Hulu',5,83),(8,'How to Get Away With Murder','Hulu',1,6),(9,'American Horror Story','Hulu',8,94),(10,'Parks and Recreation','Hulu',7,125),(11,'The Walking Dead','Netflix',9,131),(12,'The Office','Netflix',9,201),(13,'The Flash','Netflix',5,114),(14,'Once Upon A Time','Netflix',7,155),(15,'How to Get Away With Murder','Netflix',5,75),(16,'Friends','Netflix',10,236),(17,'American Horror Story','Netflix',8,94),(18,'Stranger Things','Netflix',3,25),(19,'Parks and Recreation','Netflix',7,125),(20,'American Horror Story','Amazon Prime Video',8,94),(21,'Psych','Amazon Prime Video',8,120),(22,'Downton Abbey','Amazon Prime Video',6,52),(23,'Teen Wolf','Amazon Prime Video',9,100),(24,'Good Omens','Amazon Prime Video',1,6),(25,'House','Amazon Prime Video',8,177),(26,'Parks and Recreation','Amazon Prime Video',7,125),(27,'Mr Robot','Amazon Prime Video',3,32);
/*!40000 ALTER TABLE `showlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `ShowName` varchar(50) NOT NULL DEFAULT '',
  `ChannelName` varchar(30) DEFAULT NULL,
  `Description` varchar(350) DEFAULT NULL,
  `DateOfRelease` date DEFAULT NULL,
  PRIMARY KEY (`ShowName`),
  KEY `fk_channelName` (`ChannelName`),
  CONSTRAINT `fk_channelName` FOREIGN KEY (`ChannelName`) REFERENCES `channels` (`ChannelName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES ('American Horror Story','FX','This twisted Emmy-winning drama plays upon the power of supernatural fears and everyday horrors, exploring humankind\'s unsettling capacity for evil.','2011-10-05'),('Bobs Burgers','FOX','Bob runs Bob\'s Burgers with the help of his wife and their three kids. Business may be slow, but they never give up hope.','2011-01-09'),('Downton Abbey','PBS','Downton Abbey -- a sprawling, lavish Edwardian mansion nestled in the Yorkshire landscape -- needs an heir. Dame Maggy Smith stars as Violet, the stubborn Dowager Countess of Grantham matriarch of Downton.','2010-09-26'),('Four Weddings and a Funeral','Hulu Original','Four American friends reunite for a fabulous London wedding, but after a bombshell at the altar throws their lives into turmoil, they must weather a tumultuous year of romance and heartbreak.','2019-07-31'),('Friends','Warner Bros','This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan.','1994-09-22'),('Good Omens','Amazon Prime Original','This fantasy series sees fussy angel Aziraphale and loose-living demon Crowley team up to form an unlikely duo. The two have become overly fond of life on Earth, and they are forced into forming an alliance in an attempt to stop the approaching Armageddon.','2019-05-31'),('House','FOX','At fictional Princeton Plainsboro Teaching Hospital in New Jersey, prickly genius Dr. Gregory House tackles health mysteries as would a medical Sherlock Holmes, all the while playing mind games with colleagues that include his best friend, oncologist James Wilson.','2004-11-16'),('How to Get Away With Murder','ABC','Brilliant criminal defense attorney and law professor Annalise Keating, plus five of her students, become involved in a twisted murder case','2014-10-25'),('Mr Robot','USA','Young, anti-social computer programmer Elliot works as a cybersecurity engineer during the day, but at night he is a vigilante hacker. He is recruited by the mysterious leader of an underground group of hackers to join their organization.','2015-06-24'),('Oman Daily News','OmanTV','Oman Daily News starts at 10:00 pm everyday!','1970-01-01'),('Once Upon A Time','ABC','In this fantasy series, a young woman is drawn to a small Maine town and discovers that it\'s filled with elements of the fairy tale world.','2011-10-23'),('Parks and Recreation','NBC','In this Emmy-nominated comedy, an employee with a rural Parks and Recreation department is full of energy and ideas but bogged down by bureaucracy.','2009-04-09'),('Psych','USA','Shawn Spencer happens to possess some uncanny powers of observation thanks to his father, Henry, a former police officer who taught his son to remember even the smallest details of his surroundings.','2006-07-07'),('Saturday Night Live','NBC','NBC in association with Broadway Video Enterprises bring you the landmark sketch comedy series.','2017-09-25'),('Stranger Things','Netflix Series','When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.','2016-07-15'),('Superstore','NBC','Revolving around a group of employees at a big-box store, it examines love, friendship and the beauty of everyday moments.','2015-11-30'),('Teen Wolf','MTV','The high-school anonymity Scott McCall was trying to break free from couldn\'t have happened in a more mysterious, complicated way. While walking in the woods one night Scott encounters a creature, is bitten in the side, and his life is forever changed. Is he a human or a werewolf? Or a little bit of both?','2011-06-05'),('Test Show','AMC','Test Show','2019-12-04'),('The Flash','The CW','A forensics expert who wakes from a coma with amazing new powers squares off against forces threatening the city in this live-action superhero romp.','2014-10-07'),('The Good Doctor','ABC','Shaun Murphy, a young surgeon with autism and savant syndrome, relocates from a quiet country life to join a prestigious hospital’s surgical unit.','1975-10-11'),('The Masked Singer','FOX','Based on an international hit, which already is a viral phenomenon with more than half a billion fans worldwide, and the No. 1 top-trending video of 2017 on YouTube, THE MASKED SINGER features celebrities facing off against one another with one major twist','2019-01-02'),('The Office','NBC','This hit comedy chronicles the foibles of disgruntled office workers -- led by deluded boss Michael Scott -- at the Dunder Mifflin paper company.','2005-03-24'),('The Walking Dead','AMC','In the wake of a zombie apocalypse, survivors hold on to the hope of humanity by banding together to wage a fight for their own survival.','2010-10-31'),('This Is Us','NBC','Jack and his wife - who is very pregnant with triplets - have just moved into their new home in Pittsburgh.','2016-09-20');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `usrFirstName` varchar(20) NOT NULL,
  `usrLastName` varchar(20) NOT NULL,
  `usrEmail` varchar(20) NOT NULL,
  `usrpassword` varchar(20) NOT NULL,
  `usrPermission` char(1) NOT NULL,
  `usrDateOfBirth` date NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ahmed','Ahmed','Mohammed','ahmed1970@mail.com','123456','u','1975-10-12'),('johnwick','John','Wick','johnwick@mail.com','123abc','u','1990-01-21'),('ma123','Maria','Luiz','butterfly@mail.com','qazwsx','a','1995-05-01'),('test','Chale','Abad','chale@gmail.com','chaletest','u','2019-12-01'),('test123','test','test','test@mail.com','123','u','2019-12-04'),('test2','Chale','Abads','chale.abad@gmail.com','testing','u','2019-12-01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'stv_services'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddChannelToPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `AddChannelToPackage`(IN pkgID int, IN chnl nvarchar(50))
BEGIN
insert into packagechannel(PackageID, ChannelName)
values (pkgID, chnl);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_channel`(IN chnl_name nvarchar(30), IN dscrp nvarchar(250))
BEGIN
insert into channels (ChannelName,Description)
values(chnl_name,dscrp);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_NewPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_NewPackage`(IN servicename nvarchar(20), IN pkgname nvarchar(20), IN descr nvarchar(20), IN prc decimal)
BEGIN
insert into packages(ServiceName, PackName, Description, Price)
values (servicename, pkgname, descr,prc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_new_report`(IN ttl nvarchar(20), IN descr text,  IN type varchar(10))
BEGIN
insert into problems (Title,Description,Type )
values(ttl,descr,type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_new_user`(IN usrnm nvarchar(20), In Fname nvarchar(20), IN Lname nvarchar(20), IN email nvarchar(20), IN password nvarchar(20), IN dob date)
BEGIN
insert into users (username,usrFirstName,usrLastName,usrEmail,usrpassword, usrPermission , usrDateOfBirth )
values (usrnm, Fname, Lname, email, password,'u', dob);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_season` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_season`(IN showname nvarchar(50), IN epsd int, IN SesnTitle nvarchar(20), IN descrp nvarchar(250))
BEGIN
insert into seasons(ShowName, Episodes, SeasonTitle, Description)
values (showname, epsd, SesnTitle, descrp);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_show`(IN name nvarchar(50), IN chnl nvarchar(30) , IN descr nvarchar(350), IN DOR date)
BEGIN
insert into shows (ShowName, ChannelName, Description, DateOfRelease)
values (name, chnl, descr, DOR);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_StreamingService` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `create_StreamingService`(IN servicename nvarchar(20), IN descr nvarchar(250))
BEGIN
insert into serviceprovider (ServiceName,Description )
values (servicename,descr);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `delete_report`(IN reportID int)
BEGIN
delete from problems where ProblemID = reportID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_all_reports`()
BEGIN
select ProblemID, Title, Description, Type from problems;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_channel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_channel`(IN name nvarchar(45))
BEGIN
select ChannelName, Description from channels where ChannelName = name ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_channels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_channels`()
BEGIN
select ChannelName, Description from channels;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_favShows` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_favShows`(IN usrnm varchar(20))
BEGIN
select shows.ShowName, shows.ChannelName, shows.Description, shows.DateOfRelease from favlist
inner join shows on shows.ShowName = favlist.ShowName
inner join users on users.username = favlist.username 
where users.username = usrnm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_package` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_package`()
BEGIN
select PackageID, ServiceName, PackName, Description, Price from packages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_packageInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_packageInfo`(IN name nvarchar(20))
BEGIN
select PackageID, PackName from packages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_shows` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_shows`()
BEGIN
select ShowName, ChannelName, Description, DateOfRelease from shows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_StreamingServiceInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_StreamingServiceInfo`(IN ss nvarchar(20))
BEGIN
select ServiceName, Description from serviceprovider where ServiceName = ss;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_StreamingServices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_StreamingServices`()
BEGIN
select ServiceName, Description from serviceprovider;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_userFav` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_userFav`(IN usrnam nvarchar(20))
BEGIN
select shows.ShowName, shows.ChannelName, shows.Description, shows.DateOfRelease from favlist
inner join shows on shows.ShowName = favlist.ShowName
inner join users on users.username = favlist.username
where users.username = usrnam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_UserInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `get_UserInfo`(IN user_name nvarchar(20))
BEGIN
select username, usrFirstName, usrLastName, usrEmail, usrpassword, usrPermission, usrDateOfBirth from users
where username = user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_userInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `update_userInfo`(IN usrname nvarchar(20), IN firstname nvarchar(20),IN lastname nvarchar(20),
 IN email varchar(20) , IN password nvarchar(20) , IN dob date )
BEGIN
Update users 
set usrFirstName = firstname ,  usrLastName = lastname, usrEmail = email, usrpassword = password, usrDateOfBirth = dob
where username = usrname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verfiy_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cla7b6`@`%` PROCEDURE `verfiy_user`(IN user_name nvarchar(20), IN pass varchar(20))
BEGIN
select username , usrPermission from users where username = user_name and usrpassword = pass ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-05 16:56:45
