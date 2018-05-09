-- MySQL dump 10.13  Distrib 5.7.18-15, for Linux (x86_64)
--
-- Host: localhost    Database: dbvietgocar
-- ------------------------------------------------------
-- Server version	5.7.18-15

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
/*!50717 SET @rocksdb_bulk_load_var_name='rocksdb_bulk_load' */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=?', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s USING @rocksdb_bulk_load_var_name */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `b_agent`
--

DROP TABLE IF EXISTS `b_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_agent`
--

LOCK TABLES `b_agent` WRITE;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` VALUES (1,'main',100,'CEvent::CleanUpAgent();','Y','2018-04-13 03:25:15','2018-04-14 00:00:00',NULL,86400,'Y',NULL),(2,'main',100,'CUser::CleanUpHitAuthAgent();','Y','2018-04-13 03:25:15','2018-04-14 00:00:00',NULL,86400,'Y',NULL),(3,'main',100,'CCaptchaAgent::DeleteOldCaptcha(3600);','Y','2018-04-13 18:13:26','2018-04-13 19:13:26',NULL,3600,'N',NULL),(4,'main',100,'CUndo::CleanUpOld();','Y','2018-04-13 03:25:15','2018-04-14 00:00:00',NULL,86400,'Y',NULL),(5,'search',10,'CSearchSuggest::CleanUpAgent();','Y','2018-04-13 09:31:35','2018-04-14 09:31:35',NULL,86400,'N',NULL),(6,'search',10,'CSearchStatistic::CleanUpAgent();','Y','2018-04-13 09:31:35','2018-04-14 09:31:35',NULL,86400,'N',NULL),(7,'main',100,'CEventLog::CleanUpAgent();','Y','2018-04-13 09:31:34','2018-04-14 09:31:34',NULL,86400,'N',NULL);
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_cache_tag`
--

DROP TABLE IF EXISTS `b_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_cache_tag`
--

LOCK TABLES `b_cache_tag` WRITE;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_captcha`
--

DROP TABLE IF EXISTS `b_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_captcha`
--

LOCK TABLES `b_captcha` WRITE;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event`
--

DROP TABLE IF EXISTS `b_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event`
--

LOCK TABLES `b_event` WRITE;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_log`
--

DROP TABLE IF EXISTS `b_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_log`
--

LOCK TABLES `b_event_log` WRITE;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message`
--

DROP TABLE IF EXISTS `b_event_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message`
--

LOCK TABLES `b_event_message` WRITE;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` VALUES (1,'2010-11-08 05:08:16','NEW_USER','s1','Y','#DEFAULT_EMAIL_FROM#','#DEFAULT_EMAIL_FROM#','#SITE_NAME#: New user has been registered on the site','Informational message from #SITE_NAME#\n---------------------------------------\n\nNew user has been successfully registered on the site #SERVER_NAME#.\n\nUser details:\nUser ID: #USER_ID#\n\nName: #NAME#\nLast Name: #LAST_NAME#\nUser\'s E-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2010-11-08 05:08:16','USER_INFO','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Registration info','Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/bitrix/admin/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2010-11-08 05:08:16','NEW_USER_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: New user registration confirmation','Greetings from #SITE_NAME#!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at #SERVER_NAME#.\n\nYour registration confirmation code: #CONFIRM_CODE#\n\nPlease use the link below to verify and activate your registration:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2010-11-08 05:08:16','USER_INVITE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Invitation to site','Informational message from site #SITE_NAME#\n------------------------------------------\nHello #NAME# #LAST_NAME#!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: #ID#\nLogin: #LOGIN#\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'2010-11-08 05:08:16','FEEDBACK_FORM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: A feedback form message','Notification from #SITE_NAME#\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: #AUTHOR#\nSender\'s e-mail: #AUTHOR_EMAIL#\n\nMessage text:\n#TEXT#\n\nThis notification has been generated automatically.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_site`
--

DROP TABLE IF EXISTS `b_event_message_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_site`
--

LOCK TABLES `b_event_message_site` WRITE;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_type`
--

DROP TABLE IF EXISTS `b_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` varchar(201) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_type`
--

LOCK TABLES `b_event_type` WRITE;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` VALUES (1,'en','NEW_USER','New user was registered','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',1),(2,'en','USER_INFO','Account Information','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',2),(3,'en','NEW_USER_CONFIRM','New user registration confirmation','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',3),(4,'en','USER_INVITE','Invitation of a new site user','#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',4),(5,'en','FEEDBACK_FORM','Sending a message using a feedback form','#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',5);
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_favorite`
--

DROP TABLE IF EXISTS `b_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_favorite`
--

LOCK TABLES `b_favorite` WRITE;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file`
--

DROP TABLE IF EXISTS `b_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` int(18) NOT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file`
--

LOCK TABLES `b_file` WRITE;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` VALUES (38,'2018-03-30 17:54:55','iblock',333,500,105601,'image/jpeg','iblock/a4d','a4df7a45019eb15468c51f9f818df124.jpg','U23.jpg',''),(39,'2018-03-30 17:36:05','iblock',333,500,105601,'image/jpeg','iblock/f5d','f5de5614bc69e0487cbcd52571573176.jpg','U23.jpg',''),(40,'2018-03-30 17:59:51','fileman',534,800,171387,'image/jpeg','medialibrary/02a','02a193fda1e0e1930445a407041d61bf.jpg','DoiNgu.jpg','');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_search`
--

DROP TABLE IF EXISTS `b_file_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_search`
--

LOCK TABLES `b_file_search` WRITE;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group`
--

DROP TABLE IF EXISTS `b_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group`
--

LOCK TABLES `b_group` WRITE;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` VALUES (1,'2010-11-08 05:08:16','Y',1,'N','Administrators','Full access.',NULL,NULL),(2,'2010-11-08 05:08:16','Y',2,'Y','All users (with non-authorized users)','All users (including non-authorized users).',NULL,NULL),(3,'2018-04-13 09:38:40','Y',100,'N','Quản trị web','','a:0:{}','');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_collection_task`
--

DROP TABLE IF EXISTS `b_group_collection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_collection_task`
--

LOCK TABLES `b_group_collection_task` WRITE;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_subordinate`
--

DROP TABLE IF EXISTS `b_group_subordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_subordinate`
--

LOCK TABLES `b_group_subordinate` WRITE;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_task`
--

DROP TABLE IF EXISTS `b_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_task`
--

LOCK TABLES `b_group_task` WRITE;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
INSERT INTO `b_group_task` VALUES (3,6,'');
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock`
--

DROP TABLE IF EXISTS `b_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock`
--

LOCK TABLES `b_iblock` WRITE;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` VALUES (5,'2017-12-08 06:35:30','vn','s1','','Đặt xe','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element'),(6,'2017-12-08 06:47:38','vn','s1','khachhang','Khách hàng','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element'),(7,'2017-12-08 06:51:32','vn','s1','thongtinchuyen','Thông tin chuyến đi','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element'),(8,'2017-12-20 13:35:47','vn','s1','tin-tuc','Tin tức và báo chí','Y',500,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element'),(9,'2017-12-24 03:10:53','vn','s1','thong-tin','Thông tin','Y',600,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element'),(10,'2017-12-24 04:51:34','vn','s1','cam-nan-di-lai','Cẩm nan đi lại','Y',600,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_cache`
--

DROP TABLE IF EXISTS `b_iblock_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_cache`
--

LOCK TABLES `b_iblock_cache` WRITE;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element`
--

DROP TABLE IF EXISTS `b_iblock_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element`
--

LOCK TABLES `b_iblock_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` VALUES (140,'2018-03-31 00:36:05',1,'2018-03-31 00:54:55',1,8,NULL,'Y','2018-01-17 00:00:00',NULL,500,'Người đẹp và siêu xe APKA đồng hành cùng U23',38,'Dàn siêu xe và người mẫu An Phát Khánh luôn sát cánh cùng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của dân tộc Việt Nam, hòa chung vào không khí đó tập thể 4000 anh em lái xe đã đồng hành cùng đội tuyển trong suốt quá trình thi đấu cho đến ngày vinh quang hôm nay ','text',39,'<span style=\"color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">D&agrave;n si&ecirc;u xe và người mẫu An Ph&aacute;t Khánh lu&ocirc;n sát cánh c&ugrave;ng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của d&acirc;n tộc Việt Nam, h&ograve;a chung vào không kh&iacute; đ&oacute; tập thể 4000 anh em lái xe đ&atilde; đồng hành cùng đội tuyển trong suốt quá tr&igrave;nh thi đấu cho đến ngày vinh quang hôm nay </span> \r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"> \r\n  <br style=\"box-sizing: border-box;\" />\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/329/32972c45bdc52090ad8cdba1364aaed3.JPG\" title=\"MRD_5817.JPG\" border=\"0\" alt=\"MRD_5817.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\">Trong suốt quá trình thi đấu từ trận đầu tiên cho đến trận chung kết 4000 anh em không ngừng  khuấy đông phong trào cổ vũ cho đội nhà, cụ thể là anh em dán những hình ảnh khich lệ động viên và bày tỏ sự tôn trọng những thành quả mà toàn đội bóng đã đạt được</div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/135/1356d0d3884200445fa2757ace129521.JPG\" title=\"MRD_6115.JPG\" border=\"0\" alt=\"MRD_6115.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Hình ảnh xe dán  hình ảnh cổ vũ cùng với cờ đỏ sao vàng trên phố đã mang lại hiệu ứng to lớn góp phần nhỏ b&eacute; vào tinh thần bất diệt gửi đến các câu thủ đang thi đấu xa nhà.</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/ff0/ff016676dc504f86f3ede3e3e2bc48a4.JPG\" title=\"MRD_5963.JPG\" border=\"0\" alt=\"MRD_5963.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Qua sự kiện trên chứng tỏ một điều những anh em lái xe của An Phát Khánh ngoài chăm chỉ làm việc với cái tâm nghề nghiệp ra ch&uacute;ng tôi còn rất yêu thể thao, yêu đất nước và sẵn sàng hòa chung vào niềm vui của dân tộc</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/307/307d2498b619a32e2fbf51de5bbb5154.JPG\" title=\"MRD_5836.JPG\" border=\"0\" alt=\"MRD_5836.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Đội xe An Phát Khánh luôn sẵn sàng chào đón thêm các thành viên, những anh em trong một gia đình mới, với khẩu hiệu \'\'</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Đoàn Kết Là Sức Mạnh &quot;  một lòng hướng đến tinh thần yêu nước, yêu thể thao</div>\r\n   </div>\r\n </div>\r\n ','html','NGƯỜI ĐẸP VÀ SIÊU XE APKA ĐỒNG HÀNH CÙNG U23\r\nDÀN SIÊU XE VÀ NGƯỜI MẪU AN PHÁT KHÁNH LUÔN SÁT CÁNH CÙNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DÂN TỘC VIỆT NAM, HÒA CHUNG VÀO KHÔNG KHÍ ĐÓ TẬP THỂ 4000 ANH EM LÁI XE ĐÃ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRÌNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \r\nD&AGRAVE;N SI&ECIRC;U XE VÀ NGƯỜI MẪU AN PH&AACUTE;T KHÁNH LU&OCIRC;N \r\nSÁT CÁNH C&UGRAVE;NG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO \r\nLÀ NIỀM TỰ HÀO CỦA D&ACIRC;N TỘC VIỆT NAM, H&OGRAVE;A CHUNG \r\nVÀO KHÔNG KH&IACUTE; Đ&OACUTE; TẬP THỂ 4000 ANH EM LÁI XE Đ&ATILDE; \r\nĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TR&IGRAVE;NH THI ĐẤU \r\nCHO ĐẾN NGÀY VINH QUANG HÔM NAY  \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/329/32972C45BDC52090AD8CDBA1364AAED3.JPG ]\r\n \r\nTRONG SUỐT QUÁ TRÌNH THI ĐẤU TỪ TRẬN ĐẦU TIÊN CHO ĐẾN \r\nTRẬN CHUNG KẾT 4000 ANH EM KHÔNG NGỪNG  KHUẤY ĐÔNG PHONG TRÀO \r\nCỔ VŨ CHO ĐỘI NHÀ, CỤ THỂ LÀ ANH EM DÁN NHỮNG HÌNH ẢNH \r\nKHICH LỆ ĐỘNG VIÊN VÀ BÀY TỎ SỰ TÔN TRỌNG NHỮNG THÀNH \r\nQUẢ MÀ TOÀN ĐỘI BÓNG ĐÃ ĐẠT ĐƯỢC \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/135/1356D0D3884200445FA2757ACE129521.JPG ]\r\n \r\nHÌNH ẢNH XE DÁN  HÌNH ẢNH CỔ VŨ CÙNG VỚI CỜ ĐỎ SAO VÀNG \r\nTRÊN PHỐ ĐÃ MANG LẠI HIỆU ỨNG TO LỚN GÓP PHẦN NHỎ B&EACUTE; \r\nVÀO TINH THẦN BẤT DIỆT GỬI ĐẾN CÁC CÂU THỦ ĐANG THI ĐẤU \r\nXA NHÀ. \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/FF0/FF016676DC504F86F3EDE3E3E2BC48A4.JPG ]\r\n \r\nQUA SỰ KIỆN TRÊN CHỨNG TỎ MỘT ĐIỀU NHỮNG ANH EM LÁI XE \r\nCỦA AN PHÁT KHÁNH NGOÀI CHĂM CHỈ LÀM VIỆC VỚI CÁI TÂM NGHỀ \r\nNGHIỆP RA CH&UACUTE;NG TÔI CÒN RẤT YÊU THỂ THAO, YÊU ĐẤT NƯỚC \r\nVÀ SẴN SÀNG HÒA CHUNG VÀO NIỀM VUI CỦA DÂN TỘC \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/307/307D2498B619A32E2FBF51DE5BBB5154.JPG ]\r\n \r\nĐỘI XE AN PHÁT KHÁNH LUÔN SẴN SÀNG CHÀO ĐÓN THÊM CÁC THÀNH \r\nVIÊN, NHỮNG ANH EM TRONG MỘT GIA ĐÌNH MỚI, VỚI KHẨU HIỆU \r\n\'\' ĐOÀN KẾT LÀ SỨC MẠNH \"  MỘT LÒNG HƯỚNG ĐẾN TINH THẦN \r\nYÊU NƯỚC, YÊU THỂ THAO',1,NULL,NULL,NULL,NULL,NULL,'N','140','apka-dong-hanh-u23','',NULL,NULL,10,'2018-03-31 00:55:02'),(130,'2018-01-25 08:00:51',0,'2018-01-25 08:00:51',0,5,NULL,'Y',NULL,NULL,500,'4CDNTRYK',NULL,NULL,'text',NULL,NULL,'text','4CDNTRYK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','130',NULL,NULL,NULL,NULL,NULL,NULL),(131,'2018-01-25 08:04:36',1,'2018-01-25 08:04:36',1,7,NULL,'Y',NULL,NULL,500,'ULDRSVTB',NULL,NULL,'text',NULL,NULL,'text','ULDRSVTB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','131',NULL,NULL,NULL,NULL,NULL,NULL),(132,'2018-01-25 08:04:36',1,'2018-01-25 08:04:36',1,6,NULL,'Y',NULL,NULL,500,'ULDRSVTB',NULL,NULL,'text',NULL,NULL,'text','ULDRSVTB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','132',NULL,NULL,NULL,NULL,NULL,NULL),(133,'2018-01-25 08:04:36',1,'2018-01-25 08:04:36',1,5,NULL,'Y',NULL,NULL,500,'ULDRSVTB',NULL,NULL,'text',NULL,NULL,'text','ULDRSVTB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','133',NULL,NULL,NULL,NULL,NULL,NULL),(134,'2018-01-31 23:07:03',0,'2018-01-31 23:07:03',0,7,NULL,'Y',NULL,NULL,500,'W7BMLBJ7',NULL,NULL,'text',NULL,NULL,'text','W7BMLBJ7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','134',NULL,NULL,NULL,NULL,NULL,NULL),(135,'2018-01-31 23:07:03',0,'2018-01-31 23:07:03',0,6,NULL,'Y',NULL,NULL,500,'W7BMLBJ7',NULL,NULL,'text',NULL,NULL,'text','W7BMLBJ7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','135',NULL,NULL,NULL,NULL,NULL,NULL),(136,'2018-01-31 23:07:03',0,'2018-01-31 23:07:03',0,5,NULL,'Y',NULL,NULL,500,'W7BMLBJ7',NULL,NULL,'text',NULL,NULL,'text','W7BMLBJ7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','136',NULL,NULL,NULL,NULL,NULL,NULL),(138,'2018-03-16 11:51:23',0,'2018-03-16 11:51:23',0,6,NULL,'Y',NULL,NULL,500,'HN9E2WRA',NULL,NULL,'text',NULL,NULL,'text','HN9E2WRA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','138',NULL,NULL,NULL,NULL,NULL,NULL),(139,'2018-03-16 11:51:23',0,'2018-03-16 11:51:23',0,5,NULL,'Y',NULL,NULL,500,'HN9E2WRA',NULL,NULL,'text',NULL,NULL,'text','HN9E2WRA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','139',NULL,NULL,NULL,NULL,NULL,NULL),(128,'2018-01-25 08:00:51',0,'2018-01-25 08:00:51',0,7,NULL,'Y',NULL,NULL,500,'4CDNTRYK',NULL,NULL,'text',NULL,NULL,'text','4CDNTRYK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','128',NULL,NULL,NULL,NULL,NULL,NULL),(129,'2018-01-25 08:00:51',0,'2018-01-25 08:00:51',0,6,NULL,'Y',NULL,NULL,500,'4CDNTRYK',NULL,NULL,'text',NULL,NULL,'text','4CDNTRYK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','129',NULL,NULL,NULL,NULL,NULL,NULL),(125,'2018-01-24 09:33:53',1,'2018-01-24 09:33:53',1,7,NULL,'Y',NULL,NULL,500,'FOYMFKOZ',NULL,NULL,'text',NULL,NULL,'text','FOYMFKOZ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','125',NULL,NULL,NULL,NULL,NULL,NULL),(126,'2018-01-24 09:33:53',1,'2018-01-24 09:33:53',1,6,NULL,'Y',NULL,NULL,500,'FOYMFKOZ',NULL,NULL,'text',NULL,NULL,'text','FOYMFKOZ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','126',NULL,NULL,NULL,NULL,NULL,NULL),(127,'2018-01-24 09:33:53',1,'2018-01-24 09:33:53',1,5,NULL,'Y',NULL,NULL,500,'FOYMFKOZ',NULL,NULL,'text',NULL,NULL,'text','FOYMFKOZ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','127',NULL,NULL,NULL,NULL,NULL,NULL),(122,'2018-01-24 09:10:34',0,'2018-01-24 09:10:34',0,7,NULL,'Y',NULL,NULL,500,'004QWAIA',NULL,NULL,'text',NULL,NULL,'text','004QWAIA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','122',NULL,NULL,NULL,NULL,NULL,NULL),(123,'2018-01-24 09:10:34',0,'2018-01-24 09:10:34',0,6,NULL,'Y',NULL,NULL,500,'004QWAIA',NULL,NULL,'text',NULL,NULL,'text','004QWAIA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','123',NULL,NULL,NULL,NULL,NULL,NULL),(124,'2018-01-24 09:10:34',0,'2018-01-24 09:10:34',0,5,NULL,'Y',NULL,NULL,500,'004QWAIA',NULL,NULL,'text',NULL,NULL,'text','004QWAIA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','124',NULL,NULL,NULL,NULL,NULL,NULL),(80,'2018-03-31 01:00:45',1,'2017-12-24 10:11:22',1,9,NULL,'Y',NULL,NULL,500,'Tuyển dụng',NULL,'','text',NULL,'\r\n<p align=\"center\"> <img src=\"/upload/medialibrary/02a/02a193fda1e0e1930445a407041d61bf.jpg\" title=\"DoiNgu.jpg\" border=\"0\" alt=\"DoiNgu.jpg\" width=\"800px\" height=\"534px\"  /> </p>\r\n \r\n<table> \r\n  <tbody> \r\n    <tr> <td style=\"border-image: initial;\"> \r\n        <p>C&ocirc;ng ty cổ phần đầu tư <b>An Ph&aacute;t Khánh</b> l&agrave; một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (tr&ecirc;n nền tảng Grab). </p>\r\n       \r\n        <p>Các lĩnh vực hoạt động: </p>\r\n       \r\n        <p>1. Mua Bán xe ô tô cũ mới, mua xe trả g&oacute;p: <i><u>apkauto.vn</u></i> </p>\r\n       \r\n        <p>2. Gara bảo dưỡng, sửa chữa xe ô tô: <i><u>anphatauto.com</u></i> </p>\r\n       \r\n        <p>3. Đầu tư, cho thuê và hợp tác xe Grab: <i><u>anphatkhanh.vn</u></i> </p>\r\n       \r\n        <p>4. Mua bán bảo hiểm ô tô: <i><u>anphatkhanh.vn</u></i> </p>\r\n       \r\n        <p>5. Dự án xe Nội Bài, xe chạy tỉnh: <i><u>apka.vn</u></i> </p>\r\n       \r\n        <p>APKA.VN hiện nay với hơn <b>4000</b> đối tác lái xe tham gia hợp tác, gi&uacute;p hành khách t&igrave;m được xe giá tốt, luôn giúp chuyến đi vui th&iacute;ch. </p>\r\n       \r\n        <p>Dựa trên nền tảng công nghệ website và di động, <u>www.apka.vn</u> phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. </p>\r\n       </td> </tr>\r\n   </tbody>\r\n </table>\r\n \r\n<p> </p>\r\n \r\n<p><u>Apka.vn</u> là thành viên công ty cổ phần đầu tư An Phát Khánh (<a href=\"http://www.anphatkhanh.vn/\" >www.anphatkhanh.vn</a>). Với nhu cầu phát triển, Apka.vn cần tuyển dụng nh&acirc;n sự cho dự án xe Nội Bài và xe tỉnh như sau: </p>\r\n \r\n<p><b> </b></p>\r\n \r\n<p><b>1. </b><b>Nhân viên kinh doanh </b></p>\r\n \r\n<p>Mô tả công việc: </p>\r\n \r\n<p>- Liên hệ hợp tác với đối tác đại l&yacute;: </p>\r\n \r\n<p>- Thống nhất phương án hợp tác, chốt ký hợp đồng </p>\r\n \r\n<p>- Kết nối với đối tác để lấy thông tin khách hàng có nhu cầu sử dụng dịch vụ. </p>\r\n \r\n<p>- Chuyển thông tin khách hàng về ph&ograve;ng chăm sóc khách hàng để nhân viên CSKH liên hệ tư vấn, chăm sóc. </p>\r\n \r\n<p>- Đánh giá kết quả, tỉ lệ thành công. Xây dựng phương án, kế hoạch công việc. </p>\r\n \r\n<p><b>2. </b><b>Nhân viên Tổ chức hành chính và Chăm sóc khách hàng. </b></p>\r\n \r\n<p>Mô tả công việc: </p>\r\n \r\n<p>- Soạn thảo công văn, giấy tờ, văn bản </p>\r\n \r\n<p>- Theo d&otilde;i hợp đồng </p>\r\n \r\n<p>- Chăm sóc khách hàng (khách hàng sử dụng dịch vụ xe đưa đón sân bay, đi tỉnh và các khách hàng đại lý, công ty) </p>\r\n \r\n<p>- Tư vấn, giải đáp thắc mắc, thuyết phục khách hàng tiềm năng sử dụng dịch vụ </p>\r\n \r\n<p>- Đăng tin dịch vụ công ty trên các website mua bán, rao vặt, website và facebook (sẽ được hướng dẫn đầy đủ) </p>\r\n \r\n<p>- Xử lý các công việc hành chính của phòng Tổng hợp \r\n  <br />\r\n \r\n  <br />\r\n </p>\r\n \r\n<p><b>3. </b><b>Nhân viên Điều Hành Xe </b></p>\r\n \r\n<p>- Tổ chức sắp xếp và điều phối xe cho khách hàng </p>\r\n \r\n<p>- Bảo đảm lái xe chấp hành đúng quy định, tiêu chuẩn phục vụ khách hàng của công ty </p>\r\n \r\n<p>- Quản lý thông tin của lái xe và cập nhật thông tin lái xe lên hệ thống phần mềm </p>\r\n \r\n<p> </p>\r\n \r\n<p><b>4. </b><b>Nhân viên Marketing </b></p>\r\n \r\n<p>- Tìm kiếm, phát triển khách hàng cho sản phẩm qua các kênh Marketing Online như SMS Brandname, Email Marketing, Facebook, Google kênh sms brandname và các kênh quảng cáo khác... </p>\r\n \r\n<p>- Lập các kế hoạch truyền thông, khuyến mại để hoàn thành chỉ tiêu doanh thu cho dịch vụ mình quản lý. </p>\r\n \r\n<p>- Chăm sóc, hỗ trợ khách hàng do mình phát triển để đảm bảo doanh số cá nhân định kỳ. </p>\r\n \r\n<p>- Chủ động, sáng kiến trong việc đưa ra các ý tưởng mới. </p>\r\n \r\n<p><b>5. </b><b>Thực Tập viên </b></p>\r\n \r\n<p>- Tham gia hỗ trợ nhân viên chính thức </p>\r\n \r\n<p>- Tham gia hoạt động nhóm, đưa ý tưởng, sang tạo cho dự án </p>\r\n \r\n<p><b>QUYỀN LỢI: </b></p>\r\n \r\n<p>v Làm việc môi trường trẻ trung, năng động và ngành đang &ldquo;Hot&rdquo; hiện nay: taxi công nghệ </p>\r\n \r\n<p>v Có cơ hội học hỏi, phát triển, thăng tiến cao </p>\r\n \r\n<p>v Lương thưởng xứng đáng theo năng lực </p>\r\n \r\n<p>v Được tham quan, du lịch năm 1-2 lần </p>\r\n \r\n<p>v Được luân chuyển giữa các mảng của công ty khi có nguyện vọng </p>\r\n \r\n<p><b>Y&Ecirc;U CẦU HỒ SƠ &amp; ỨNG VIÊN </b></p>\r\n \r\n<p>&uuml; Công ty mong muốn tìm các bạn năng động, nhiệt huyết, sáng tạo, ứng viên chưa kinh nghiệm sẽ được đào tạo, hướng nghiệp. Có kinh nghiệm là điểm cộng khi phỏng vấn </p>\r\n \r\n<p>ü Hồ sơ gồm: Đơn xin việc, sơ yếu lý lịch. </p>\r\n \r\n<p>ü Các bằng cấp có liên quan. </p>\r\n \r\n<p>ü Hồ sơ ứng viên gửi về theo địa chỉ email: <b>contact@apka.vn</b> </p>\r\n \r\n<p>ü Hoặc liên hệ theo số điện thoại <b>0914.198.008/ 0981.370.360</b> để nộp hồ sơ tại văn phòng công ty tại Tòa nhà Nàng Hương, 583 Nguyễn Trãi, Thanh Xuân, Hà Nội. </p>\r\n \r\n<div> </div>\r\n ','html','TUYỂN DỤNG\r\n\r\n[ /UPLOAD/MEDIALIBRARY/02A/02A193FDA1E0E1930445A407041D61BF.JPG ] \r\n \r\n\r\nC&OCIRC;NG TY CỔ PHẦN ĐẦU TƯ AN PH&AACUTE;T KHÁNH L&AGRAVE; MỘT \r\nDOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG \r\nCÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TR&ECIRC;N NỀN TẢNG \r\nGRAB). \r\n\r\nCÁC LĨNH VỰC HOẠT ĐỘNG: \r\n\r\n1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ G&OACUTE;P: APKAUTO.VN \r\n\r\n2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: ANPHATAUTO.COM \r\n\r\n3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: ANPHATKHANH.VN \r\n\r\n4. MUA BÁN BẢO HIỂM Ô TÔ: ANPHATKHANH.VN \r\n\r\n5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: APKA.VN \r\n\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI TÁC LÁI XE THAM GIA HỢP TÁC, \r\nGI&UACUTE;P HÀNH KHÁCH T&IGRAVE;M ĐƯỢC XE GIÁ TỐT, LUÔN GIÚP \r\nCHUYẾN ĐI VUI TH&IACUTE;CH. \r\n\r\nDỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN \r\nPHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI \r\nKHÁCH HÀNG, CÁC H&ATILDE;NG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH \r\nTHỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI \r\nCHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. \r\n     \r\n \r\n\r\n \r\n\r\nAPKA.VN LÀ THÀNH VIÊN CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH \r\n(WWW.ANPHATKHANH.VN [ HTTP://WWW.ANPHATKHANH.VN/ ] ). VỚI NHU CẦU PHÁT \r\nTRIỂN, APKA.VN CẦN TUYỂN DỤNG NH&ACIRC;N SỰ CHO DỰ ÁN XE NỘI \r\nBÀI VÀ XE TỈNH NHƯ SAU: \r\n\r\n \r\n\r\n1. NHÂN VIÊN KINH DOANH \r\n\r\nMÔ TẢ CÔNG VIỆC: \r\n\r\n- LIÊN HỆ HỢP TÁC VỚI ĐỐI TÁC ĐẠI L&YACUTE;: \r\n\r\n- THỐNG NHẤT PHƯƠNG ÁN HỢP TÁC, CHỐT KÝ HỢP ĐỒNG \r\n\r\n- KẾT NỐI VỚI ĐỐI TÁC ĐỂ LẤY THÔNG TIN KHÁCH HÀNG CÓ \r\nNHU CẦU SỬ DỤNG DỊCH VỤ. \r\n\r\n- CHUYỂN THÔNG TIN KHÁCH HÀNG VỀ PH&OGRAVE;NG CHĂM SÓC KHÁCH \r\nHÀNG ĐỂ NHÂN VIÊN CSKH LIÊN HỆ TƯ VẤN, CHĂM SÓC. \r\n\r\n- ĐÁNH GIÁ KẾT QUẢ, TỈ LỆ THÀNH CÔNG. XÂY DỰNG PHƯƠNG \r\nÁN, KẾ HOẠCH CÔNG VIỆC. \r\n\r\n2. NHÂN VIÊN TỔ CHỨC HÀNH CHÍNH VÀ CHĂM SÓC KHÁCH HÀNG. \r\n\r\nMÔ TẢ CÔNG VIỆC: \r\n\r\n- SOẠN THẢO CÔNG VĂN, GIẤY TỜ, VĂN BẢN \r\n\r\n- THEO D&OTILDE;I HỢP ĐỒNG \r\n\r\n- CHĂM SÓC KHÁCH HÀNG (KHÁCH HÀNG SỬ DỤNG DỊCH VỤ XE ĐƯA \r\nĐÓN SÂN BAY, ĐI TỈNH VÀ CÁC KHÁCH HÀNG ĐẠI LÝ, CÔNG TY) \r\n\r\n- TƯ VẤN, GIẢI ĐÁP THẮC MẮC, THUYẾT PHỤC KHÁCH HÀNG TIỀM \r\nNĂNG SỬ DỤNG DỊCH VỤ \r\n\r\n- ĐĂNG TIN DỊCH VỤ CÔNG TY TRÊN CÁC WEBSITE MUA BÁN, RAO VẶT, \r\nWEBSITE VÀ FACEBOOK (SẼ ĐƯỢC HƯỚNG DẪN ĐẦY ĐỦ) \r\n\r\n- XỬ LÝ CÁC CÔNG VIỆC HÀNH CHÍNH CỦA PHÒNG TỔNG HỢP \r\n\r\n \r\n\r\n3. NHÂN VIÊN ĐIỀU HÀNH XE \r\n\r\n- TỔ CHỨC SẮP XẾP VÀ ĐIỀU PHỐI XE CHO KHÁCH HÀNG \r\n\r\n- BẢO ĐẢM LÁI XE CHẤP HÀNH ĐÚNG QUY ĐỊNH, TIÊU CHUẨN PHỤC \r\nVỤ KHÁCH HÀNG CỦA CÔNG TY \r\n\r\n- QUẢN LÝ THÔNG TIN CỦA LÁI XE VÀ CẬP NHẬT THÔNG TIN LÁI \r\nXE LÊN HỆ THỐNG PHẦN MỀM \r\n\r\n \r\n\r\n4. NHÂN VIÊN MARKETING \r\n\r\n- TÌM KIẾM, PHÁT TRIỂN KHÁCH HÀNG CHO SẢN PHẨM QUA CÁC KÊNH \r\nMARKETING ONLINE NHƯ SMS BRANDNAME, EMAIL MARKETING, FACEBOOK, GOOGLE KÊNH \r\nSMS BRANDNAME VÀ CÁC KÊNH QUẢNG CÁO KHÁC... \r\n\r\n- LẬP CÁC KẾ HOẠCH TRUYỀN THÔNG, KHUYẾN MẠI ĐỂ HOÀN THÀNH \r\nCHỈ TIÊU DOANH THU CHO DỊCH VỤ MÌNH QUẢN LÝ. \r\n\r\n- CHĂM SÓC, HỖ TRỢ KHÁCH HÀNG DO MÌNH PHÁT TRIỂN ĐỂ ĐẢM \r\nBẢO DOANH SỐ CÁ NHÂN ĐỊNH KỲ. \r\n\r\n- CHỦ ĐỘNG, SÁNG KIẾN TRONG VIỆC ĐƯA RA CÁC Ý TƯỞNG MỚI. \r\n\r\n5. THỰC TẬP VIÊN \r\n\r\n- THAM GIA HỖ TRỢ NHÂN VIÊN CHÍNH THỨC \r\n\r\n- THAM GIA HOẠT ĐỘNG NHÓM, ĐƯA Ý TƯỞNG, SANG TẠO CHO DỰ \r\nÁN \r\n\r\nQUYỀN LỢI: \r\n\r\nV LÀM VIỆC MÔI TRƯỜNG TRẺ TRUNG, NĂNG ĐỘNG VÀ NGÀNH ĐANG \r\n&LDQUO;HOT&RDQUO; HIỆN NAY: TAXI CÔNG NGHỆ \r\n\r\nV CÓ CƠ HỘI HỌC HỎI, PHÁT TRIỂN, THĂNG TIẾN CAO \r\n\r\nV LƯƠNG THƯỞNG XỨNG ĐÁNG THEO NĂNG LỰC \r\n\r\nV ĐƯỢC THAM QUAN, DU LỊCH NĂM 1-2 LẦN \r\n\r\nV ĐƯỢC LUÂN CHUYỂN GIỮA CÁC MẢNG CỦA CÔNG TY KHI CÓ NGUYỆN \r\nVỌNG \r\n\r\nY&ECIRC;U CẦU HỒ SƠ &AMP; ỨNG VIÊN \r\n\r\n&UUML; CÔNG TY MONG MUỐN TÌM CÁC BẠN NĂNG ĐỘNG, NHIỆT HUYẾT, \r\nSÁNG TẠO, ỨNG VIÊN CHƯA KINH NGHIỆM SẼ ĐƯỢC ĐÀO TẠO, \r\nHƯỚNG NGHIỆP. CÓ KINH NGHIỆM LÀ ĐIỂM CỘNG KHI PHỎNG VẤN \r\n\r\nÜ HỒ SƠ GỒM: ĐƠN XIN VIỆC, SƠ YẾU LÝ LỊCH. \r\n\r\nÜ CÁC BẰNG CẤP CÓ LIÊN QUAN. \r\n\r\nÜ HỒ SƠ ỨNG VIÊN GỬI VỀ THEO ĐỊA CHỈ EMAIL: CONTACT@APKA.VN \r\n\r\nÜ HOẶC LIÊN HỆ THEO SỐ ĐIỆN THOẠI 0914.198.008/ 0981.370.360 \r\nĐỂ NỘP HỒ SƠ TẠI VĂN PHÒNG CÔNG TY TẠI TÒA NHÀ NÀNG HƯƠNG, \r\n583 NGUYỄN TRÃI, THANH XUÂN, HÀ NỘI. ',1,NULL,NULL,NULL,NULL,NULL,'N','80','tuyen-dung','',NULL,NULL,56,'2017-12-24 10:24:41'),(81,'2018-04-13 16:43:52',8,'2017-12-24 10:54:33',1,9,NULL,'Y',NULL,NULL,500,'Đối tác của chúng tôi',NULL,'','text',NULL,' <font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\">Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</span></font> \r\n<div align=\"center\" style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px;\"> </div>\r\n ','html','ĐỐI TÁC CỦA CHÚNG TÔI\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI \r\nSAU',1,NULL,NULL,NULL,NULL,NULL,'N','81','doi-tac-cua-chung-toi','',NULL,NULL,50,'2017-12-24 10:54:55'),(82,'2018-04-13 16:46:32',8,'2017-12-24 11:08:24',1,9,NULL,'Y',NULL,NULL,500,'Khách hàng thường xuyên',NULL,'','text',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Chương tr&igrave;nh <span style=\"box-sizing: border-box; font-weight: 700;\">Kh&aacute;ch h&agrave;ng thường xuy&ecirc;n</span> mong muốn đem tới những ưu đ&atilde;i cho những khách hàng thường xuyên sử dụng dịch vụ v&acirc;̣n chuyển của <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a>. Nếu bạn là Hội viên của Chương trình Khách hàng thường xuyên, sau mỗi chuyến đi với <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a> hoặc sau mỗi lần sử dụng sản phẩm, dịch vụ, điểm (s&ocirc;́ km đã đi) sẽ được t&iacute;ch luỹ vào tài khoản của Bạn và bạn c&oacute; thể dễ dàng chuyển điểm thành những phần thưởng giá trị cho mình và cho người thân.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Lợi ích khi tham gia chương trình Khách hàng Thường xuyên: </span></p>\r\n \r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> \r\n  <li style=\"box-sizing: border-box;\">Khách hàng sử dụng dịch vụ 10 lần (mỗi chiều tính là 1 lần) thì sẽ được giảm 20.000 đ cho lần sử dụng dịch vụ thứ 11</li>\r\n \r\n  <li style=\"box-sizing: border-box;\">Nhận thông báo thường xuyên về các chương trình khuyến mãi, giảm giá của apka.vn và ưu tiên đăng k&yacute; tham gia nếu có nhu cầu.</li>\r\n \r\n  <li style=\"box-sizing: border-box;\">Nâng hạng xe, hạng chỗ nếu trên Hệ thống của <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a> c&ograve;n xe/ còn chỗ trống c&ugrave;ng hành trình.</li>\r\n </ul>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Để trở thành hội viên Chương trình Khách hàng thường xuyên, Quý khách chỉ cần tạo tài khoản và mỗi lần đặt xe sẽ được tích điểm trong thông tin tài khoản.</p>\r\n ','html','KHÁCH HÀNG THƯỜNG XUYÊN\r\n\r\nCHƯƠNG TR&IGRAVE;NH KH&AACUTE;CH H&AGRAVE;NG THƯỜNG XUY&ECIRC;N MONG \r\nMUỐN ĐEM TỚI NHỮNG ƯU Đ&ATILDE;I CHO NHỮNG KHÁCH HÀNG THƯỜNG \r\nXUYÊN SỬ DỤNG DỊCH VỤ V&ACIRC;̣N CHUYỂN CỦA HTTP://APKA.VN \r\n[ HTTP://APKA.VN ] . NẾU BẠN LÀ HỘI VIÊN CỦA CHƯƠNG TRÌNH \r\nKHÁCH HÀNG THƯỜNG XUYÊN, SAU MỖI CHUYẾN ĐI VỚI HTTP://APKA.VN \r\n[ HTTP://APKA.VN ]  HOẶC SAU MỖI LẦN SỬ DỤNG SẢN PHẨM, DỊCH \r\nVỤ, ĐIỂM (S&OCIRC;́ KM ĐÃ ĐI) SẼ ĐƯỢC T&IACUTE;CH LUỸ \r\nVÀO TÀI KHOẢN CỦA BẠN VÀ BẠN C&OACUTE; THỂ DỄ DÀNG CHUYỂN \r\nĐIỂM THÀNH NHỮNG PHẦN THƯỞNG GIÁ TRỊ CHO MÌNH VÀ CHO NGƯỜI \r\nTHÂN. \r\n\r\nLỢI ÍCH KHI THAM GIA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN:  \r\n\r\n- KHÁCH HÀNG SỬ DỤNG DỊCH VỤ 10 LẦN (MỖI CHIỀU TÍNH LÀ \r\n1 LẦN) THÌ SẼ ĐƯỢC GIẢM 20.000 Đ CHO LẦN SỬ DỤNG DỊCH \r\nVỤ THỨ 11 \r\n- NHẬN THÔNG BÁO THƯỜNG XUYÊN VỀ CÁC CHƯƠNG TRÌNH KHUYẾN \r\nMÃI, GIẢM GIÁ CỦA APKA.VN VÀ ƯU TIÊN ĐĂNG K&YACUTE; THAM GIA \r\nNẾU CÓ NHU CẦU. \r\n- NÂNG HẠNG XE, HẠNG CHỖ NẾU TRÊN HỆ THỐNG CỦA HTTP://APKA.VN \r\n[ HTTP://APKA.VN ]  C&OGRAVE;N XE/ CÒN CHỖ TRỐNG C&UGRAVE;NG HÀNH \r\nTRÌNH. \r\n\r\nĐỂ TRỞ THÀNH HỘI VIÊN CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, \r\nQUÝ KHÁCH CHỈ CẦN TẠO TÀI KHOẢN VÀ MỖI LẦN ĐẶT XE SẼ \r\nĐƯỢC TÍCH ĐIỂM TRONG THÔNG TIN TÀI KHOẢN.',1,NULL,NULL,NULL,NULL,NULL,'N','82','khach-hang-thuong-xuyen','',NULL,NULL,55,'2017-12-24 11:08:41'),(83,'2018-03-31 01:07:46',1,'2017-12-24 11:10:03',1,9,NULL,'Y',NULL,NULL,500,'Khách hàng tổ chức',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> \r\n  <br />\r\n </p>\r\n \r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> </ul>\r\n ','html',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; background-color: rgb(250, 250, 250); text-align: justify;\"><font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\">Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</span></font></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> </ul>\r\n ','html','KHÁCH HÀNG TỔ CHỨC\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','83','khach-hang-to-chuc','',NULL,NULL,48,'2017-12-24 11:10:08'),(84,'2018-03-31 01:07:32',1,'2017-12-24 11:14:36',1,9,NULL,'Y',NULL,NULL,500,'Chia sẻ doanh thu',NULL,'','text',NULL,' \r\n<div align=\"center\" style=\"box-sizing: border-box; background-color: rgb(250, 250, 250);\"> \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\"><font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</b></span></font></p>\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <div style=\"box-sizing: border-box;\">\r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> </ul>\r\n   </div>\r\n </div>\r\n ','html','CHIA SẺ DOANH THU\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','84','chia-se-doanh-thu','',NULL,NULL,42,'2017-12-24 11:14:55'),(85,'2018-03-31 01:04:31',1,'2017-12-24 11:17:24',1,9,NULL,'N',NULL,NULL,500,'Đối tác vận chuyển',NULL,'','text',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">C&ocirc;ng ty cổ phần Vietgocar xin gửi lời ch&agrave;o tr&acirc;n trọng tới c&aacute;c Đối tác,</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Với mạng lưới đối tác vận chuyển tại nhiều tỉnh thành/ sân bay trong cả nước bao gồm các công ty taxi, cho thu&ecirc; xe hàng đầu, ch&uacute;ng tôi c&oacute; khả năng cung cấp các dịch vận chuyển đa dạng, đáp ứng tất cả nhu cầu đi lại từ dịch vụ Taxi thông thường đến dịch vụ Dịch vụ tiết kiệm (đi chung taxi,minibus) và Dịch vụ cao cấp (xe hạng sang).</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><o:p style=\"box-sizing: border-box;\"></o:p></p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Với những tổ chức/ cá nhân có phương tiện và khả năng đảm bảo chất lượng dịch vụ vận chuyển h&atilde;y tham gia vào chương tr&igrave;nh đối tác vận chuyển của chúng tôi để có thêm doanh thu và nhiều lợi &iacute;ch giá trị khác:</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Lợi ích khi tham gia Đối tác vận chuyển:</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Có khả năng tiếp cận hàng triệu khách hàng qua kênh trực tuyến của Vietgocar và thường xuyên nhận được đặt hàng vận chuyển, gia tăng doanh thu và tối ưu năng lực vận chuyển.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Theo kịp xu hướng tiêu d&ugrave;ng mới của hành khách là tìm kiếm và đặt xe trực tuyến hoặc qua ứng dụng di động</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Được Vietgocar hỗ trợ phát triển kênh đặt xe trực tuyến mà không mất chi phí đầu tư, chi phí bảo trì hệ thống và không cần nhân sự IT chuyên trách(đối với hãng vận tải)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Cho ph&eacute;p đặt chỗ và trả tiền trước, đảm bảo doanh thu và chủ động trong kinh doanh.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Có Hệ thống phản hồi của hành khách về tài xế và chăm sóc khách hàng tự động cho phép cải thiện chất lượng dịch vụ </li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> <span style=\"box-sizing: border-box; font-weight: 700;\">Cách tham gia chương trình:</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Đăng k&yacute; tham gia cách điền vào Form Đăng ký làm đối tác của Vietgocar</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Vietgocar kiểm tra năng lực cung cấp dịch vụ (đối với tổ chức) và trình độ chuyên môn liên quan đến vận chuyển hành khách(đối với tài xế tham gia với tư cách cá nhân)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Ký hợp đồng hợp tác vận chuyển và chia sẻ doanh thu</li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Điều kiện tham gia: </span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Các công ty cung cấp dịch vụ vận chuyển chuyên nghiệp </li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Các tài xế mong muốn tham gia hệ thống của Vietgocar để cung cấp dịch vụ vận chuyển và kiếm thêm thu nhập</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Tham khảo các đối tác đã tham gia hệ thống của chúng tôi tại <a href=\"/thong-tin/doi-tac-cua-chung-toi.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">đây</a></li>\r\n</ul>\r\n','html','ĐỐI TÁC VẬN CHUYỂN\r\n\r\nC&OCIRC;NG TY CỔ PHẦN VIETGOCAR XIN GỬI LỜI CH&AGRAVE;O TR&ACIRC;N \r\nTRỌNG TỚI C&AACUTE;C ĐỐI TÁC, \r\n\r\nVỚI MẠNG LƯỚI ĐỐI TÁC VẬN CHUYỂN TẠI NHIỀU TỈNH THÀNH/ \r\nSÂN BAY TRONG CẢ NƯỚC BAO GỒM CÁC CÔNG TY TAXI, CHO THU&ECIRC; \r\nXE HÀNG ĐẦU, CH&UACUTE;NG TÔI C&OACUTE; KHẢ NĂNG CUNG CẤP CÁC \r\nDỊCH VẬN CHUYỂN ĐA DẠNG, ĐÁP ỨNG TẤT CẢ NHU CẦU ĐI LẠI \r\nTỪ DỊCH VỤ TAXI THÔNG THƯỜNG ĐẾN DỊCH VỤ DỊCH VỤ \r\nTIẾT KIỆM (ĐI CHUNG TAXI,MINIBUS) VÀ DỊCH VỤ CAO CẤP (XE \r\nHẠNG SANG). \r\n\r\n \r\n\r\nVỚI NHỮNG TỔ CHỨC/ CÁ NHÂN CÓ PHƯƠNG TIỆN VÀ KHẢ NĂNG \r\nĐẢM BẢO CHẤT LƯỢNG DỊCH VỤ VẬN CHUYỂN H&ATILDE;Y THAM \r\nGIA VÀO CHƯƠNG TR&IGRAVE;NH ĐỐI TÁC VẬN CHUYỂN CỦA CHÚNG TÔI \r\nĐỂ CÓ THÊM DOANH THU VÀ NHIỀU LỢI &IACUTE;CH GIÁ TRỊ KHÁC: \r\n\r\nLỢI ÍCH KHI THAM GIA ĐỐI TÁC VẬN CHUYỂN: \r\n\r\n- CÓ KHẢ NĂNG TIẾP CẬN HÀNG TRIỆU KHÁCH HÀNG QUA KÊNH TRỰC \r\nTUYẾN CỦA VIETGOCAR VÀ THƯỜNG XUYÊN NHẬN ĐƯỢC ĐẶT HÀNG \r\nVẬN CHUYỂN, GIA TĂNG DOANH THU VÀ TỐI ƯU NĂNG LỰC VẬN CHUYỂN. \r\n- THEO KỊP XU HƯỚNG TIÊU D&UGRAVE;NG MỚI CỦA HÀNH KHÁCH LÀ \r\nTÌM KIẾM VÀ ĐẶT XE TRỰC TUYẾN HOẶC QUA ỨNG DỤNG DI ĐỘNG \r\n- ĐƯỢC VIETGOCAR HỖ TRỢ PHÁT TRIỂN KÊNH ĐẶT XE TRỰC TUYẾN \r\nMÀ KHÔNG MẤT CHI PHÍ ĐẦU TƯ, CHI PHÍ BẢO TRÌ HỆ THỐNG VÀ \r\nKHÔNG CẦN NHÂN SỰ IT CHUYÊN TRÁCH(ĐỐI VỚI HÃNG VẬN TẢI) \r\n- CHO PH&EACUTE;P ĐẶT CHỖ VÀ TRẢ TIỀN TRƯỚC, ĐẢM BẢO \r\nDOANH THU VÀ CHỦ ĐỘNG TRONG KINH DOANH. \r\n- CÓ HỆ THỐNG PHẢN HỒI CỦA HÀNH KHÁCH VỀ TÀI XẾ VÀ CHĂM \r\nSÓC KHÁCH HÀNG TỰ ĐỘNG CHO PHÉP CẢI THIỆN CHẤT LƯỢNG DỊCH \r\nVỤ  \r\n\r\n CÁCH THAM GIA CHƯƠNG TRÌNH: \r\n\r\n- ĐĂNG K&YACUTE; THAM GIA CÁCH ĐIỀN VÀO FORM ĐĂNG KÝ LÀM ĐỐI \r\nTÁC CỦA VIETGOCAR \r\n- VIETGOCAR KIỂM TRA NĂNG LỰC CUNG CẤP DỊCH VỤ (ĐỐI VỚI \r\nTỔ CHỨC) VÀ TRÌNH ĐỘ CHUYÊN MÔN LIÊN QUAN ĐẾN VẬN CHUYỂN \r\nHÀNH KHÁCH(ĐỐI VỚI TÀI XẾ THAM GIA VỚI TƯ CÁCH CÁ NHÂN) \r\n- KÝ HỢP ĐỒNG HỢP TÁC VẬN CHUYỂN VÀ CHIA SẺ DOANH THU \r\n\r\nĐIỀU KIỆN THAM GIA:  \r\n\r\n- CÁC CÔNG TY CUNG CẤP DỊCH VỤ VẬN CHUYỂN CHUYÊN NGHIỆP  \r\n- CÁC TÀI XẾ MONG MUỐN THAM GIA HỆ THỐNG CỦA VIETGOCAR ĐỂ \r\nCUNG CẤP DỊCH VỤ VẬN CHUYỂN VÀ KIẾM THÊM THU NHẬP \r\n- THAM KHẢO CÁC ĐỐI TÁC ĐÃ THAM GIA HỆ THỐNG CỦA CHÚNG \r\nTÔI TẠI ĐÂY [ /THONG-TIN/DOI-TAC-CUA-CHUNG-TOI.HTML ]',1,NULL,NULL,NULL,NULL,NULL,'N','85','doi-tac-van-chuyen','',NULL,NULL,27,'2017-12-24 11:17:26'),(86,'2018-03-31 01:04:31',1,'2017-12-24 11:18:36',1,9,NULL,'N',NULL,NULL,500,'Vận chuyển hành khách',NULL,'','text',NULL,'\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">I. Quy định về kiểm tra th&ocirc;ng tin</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Qu&yacute; kh&aacute;ch cần xuất tr&igrave;nh m&atilde; đặt xe trước khi l&ecirc;n xe. Mã đặt xe n&agrave;y được ch&uacute;ng tôi gửi cho Quý khách qua ứng dụng di động, tin nhắn SMS hoặc bằng Email </li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách không nhớ hoặc quên mã đặt xe, quý khách vẫn c&oacute; thể đi xe nếu có thông tin khớp với thông tin đã sử dụng khi đặt chỗ ( điện thoại, CMND, hộ chiếu..) </li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">II. Quy định về thời gian tài xế chờ với từng dịch vụ.</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách đi taxi thông thường, tài xế taxi sẽ chờ Quý khách tối đa 15 phút tại điểm đón bạn yêu c&acirc;̀u. Ngoài thời gian này, chúng tôi có quyền hủy chuyến mà không phải bồi thường hoặc t&iacute;nh thêm tiền cước chờ khách (từ 40.000 đến 60.000đ/ giờ)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách chọn dịch vụ đi gh&eacute;p với hành khách khác. Quý khách phải có mặt đúng giờ đã thống nhất với tài xế tại điểm đón Quý khách yêu cầu. Thời gian chờ tối đa là 15 phút trong trường hợp Hành khách đi chung đồng ý đợi.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Khi quý khách cung cấp đầy đủ thông tin như: Mã hiệu chuyến bay, thời gian hạ cánh, cất cánh, sảnh ra. Tài xế sẽ chờ hoặc chúng tôi sẽ xắp sếp sẵn xe đón quý khách ngay cả khi quý khách bị chậm chuyến bay.</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">III. Quy định về thời gian Quý khách chờ với từng dịch vụ</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách đặt dịch vụ taxi thông thường, taxi sẽ đến đón đúng giờ và đúng địa điểm Quý khách yêu cầu.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách chọn dịch vụ đi ghép taxi, taxi sẽ đến đón tại địa điểm Quý khách yêu cầu trong khoảng  +/-15 phút so với giờ yếu cầu đón. Chúng tôi sẽ thông báo chính xác thời gian đón trước 60 phút so với giờ khởi hành. Thời gian đi đón Hành khách khác là tối đa 30 phút.</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">IV. Quy định về hủy đặt xe/ Thay đổi lịch trình: Quý khách có quyền hủy đặt xe hoặc thay đổi giờ đi mà không mất thêm chi phí. Chọn một trong các cách sau để thực hiện hủy/ thay đổi.</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Truy cập <a href=\"http://www.dichungtaxi.com/\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://vietgocar.com/</a>, đăng nhập bằng tài khoản, quản lý giao dịch, chọn chuyến đi cần thay đổi lịch trình.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện tới Tổng đài 19006022 để thông báo thay đổi hoặc hủy chuyến nếu cần</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">V. Quy định khác</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Quý khách không mang theo những hàng hóa cấm trong danh mục quy định hàng cấm của nước Cộng Hoà Xã Hội Chủ Nghĩa Việt Nam</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Quý khách không được hút thuốc và ăn uống gây mất vệ sinh ở trên xe.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong điều kiện bất khả kháng(động đất, bão lũ..), chúng tôi được quyền hủy hoặc thay đổi lịch và giờ chạy mà không chịu bất cứ trách nhiệm nào.</li>\r\n</ol>\r\n','html','VẬN CHUYỂN HÀNH KHÁCH\r\n\r\nI. QUY ĐỊNH VỀ KIỂM TRA TH&OCIRC;NG TIN \r\n- QU&YACUTE; KH&AACUTE;CH CẦN XUẤT TR&IGRAVE;NH M&ATILDE; ĐẶT XE TRƯỚC \r\nKHI L&ECIRC;N XE. MÃ ĐẶT XE N&AGRAVE;Y ĐƯỢC CH&UACUTE;NG TÔI GỬI \r\nCHO QUÝ KHÁCH QUA ỨNG DỤNG DI ĐỘNG, TIN NHẮN SMS HOẶC BẰNG \r\nEMAIL  \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH KHÔNG NHỚ HOẶC QUÊN MÃ ĐẶT \r\nXE, QUÝ KHÁCH VẪN C&OACUTE; THỂ ĐI XE NẾU CÓ THÔNG TIN KHỚP \r\nVỚI THÔNG TIN ĐÃ SỬ DỤNG KHI ĐẶT CHỖ ( ĐIỆN THOẠI, CMND, \r\nHỘ CHIẾU..)  II. QUY ĐỊNH VỀ THỜI GIAN TÀI XẾ CHỜ VỚI \r\nTỪNG DỊCH VỤ. \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH ĐI TAXI THÔNG THƯỜNG, TÀI XẾ \r\nTAXI SẼ CHỜ QUÝ KHÁCH TỐI ĐA 15 PHÚT TẠI ĐIỂM ĐÓN BẠN \r\nYÊU C&ACIRC;̀U. NGOÀI THỜI GIAN NÀY, CHÚNG TÔI CÓ QUYỀN HỦY \r\nCHUYẾN MÀ KHÔNG PHẢI BỒI THƯỜNG HOẶC T&IACUTE;NH THÊM TIỀN \r\nCƯỚC CHỜ KHÁCH (TỪ 40.000 ĐẾN 60.000Đ/ GIỜ) \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH CHỌN DỊCH VỤ ĐI GH&EACUTE;P \r\nVỚI HÀNH KHÁCH KHÁC. QUÝ KHÁCH PHẢI CÓ MẶT ĐÚNG GIỜ ĐÃ \r\nTHỐNG NHẤT VỚI TÀI XẾ TẠI ĐIỂM ĐÓN QUÝ KHÁCH YÊU CẦU. \r\nTHỜI GIAN CHỜ TỐI ĐA LÀ 15 PHÚT TRONG TRƯỜNG HỢP HÀNH KHÁCH \r\nĐI CHUNG ĐỒNG Ý ĐỢI. \r\n- KHI QUÝ KHÁCH CUNG CẤP ĐẦY ĐỦ THÔNG TIN NHƯ: MÃ HIỆU CHUYẾN \r\nBAY, THỜI GIAN HẠ CÁNH, CẤT CÁNH, SẢNH RA. TÀI XẾ SẼ CHỜ \r\nHOẶC CHÚNG TÔI SẼ XẮP SẾP SẴN XE ĐÓN QUÝ KHÁCH NGAY CẢ \r\nKHI QUÝ KHÁCH BỊ CHẬM CHUYẾN BAY. III. QUY ĐỊNH VỀ THỜI GIAN \r\nQUÝ KHÁCH CHỜ VỚI TỪNG DỊCH VỤ \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH ĐẶT DỊCH VỤ TAXI THÔNG THƯỜNG, \r\nTAXI SẼ ĐẾN ĐÓN ĐÚNG GIỜ VÀ ĐÚNG ĐỊA ĐIỂM QUÝ KHÁCH \r\nYÊU CẦU. \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH CHỌN DỊCH VỤ ĐI GHÉP TAXI, \r\nTAXI SẼ ĐẾN ĐÓN TẠI ĐỊA ĐIỂM QUÝ KHÁCH YÊU CẦU TRONG \r\nKHOẢNG  +/-15 PHÚT SO VỚI GIỜ YẾU CẦU ĐÓN. CHÚNG TÔI SẼ \r\nTHÔNG BÁO CHÍNH XÁC THỜI GIAN ĐÓN TRƯỚC 60 PHÚT SO VỚI GIỜ \r\nKHỞI HÀNH. THỜI GIAN ĐI ĐÓN HÀNH KHÁCH KHÁC LÀ TỐI ĐA 30 \r\nPHÚT. IV. QUY ĐỊNH VỀ HỦY ĐẶT XE/ THAY ĐỔI LỊCH TRÌNH: \r\nQUÝ KHÁCH CÓ QUYỀN HỦY ĐẶT XE HOẶC THAY ĐỔI GIỜ ĐI MÀ \r\nKHÔNG MẤT THÊM CHI PHÍ. CHỌN MỘT TRONG CÁC CÁCH SAU ĐỂ THỰC \r\nHIỆN HỦY/ THAY ĐỔI. \r\n- TRUY CẬP HTTP://VIETGOCAR.COM/ [ HTTP://WWW.DICHUNGTAXI.COM/ ] , ĐĂNG \r\nNHẬP BẰNG TÀI KHOẢN, QUẢN LÝ GIAO DỊCH, CHỌN CHUYẾN ĐI \r\nCẦN THAY ĐỔI LỊCH TRÌNH. \r\n- GỌI ĐIỆN TỚI TỔNG ĐÀI 19006022 ĐỂ THÔNG BÁO THAY ĐỔI \r\nHOẶC HỦY CHUYẾN NẾU CẦN V. QUY ĐỊNH KHÁC \r\n- QUÝ KHÁCH KHÔNG MANG THEO NHỮNG HÀNG HÓA CẤM TRONG DANH MỤC \r\nQUY ĐỊNH HÀNG CẤM CỦA NƯỚC CỘNG HOÀ XÃ HỘI CHỦ NGHĨA \r\nVIỆT NAM \r\n- QUÝ KHÁCH KHÔNG ĐƯỢC HÚT THUỐC VÀ ĂN UỐNG GÂY MẤT VỆ \r\nSINH Ở TRÊN XE. \r\n- TRONG ĐIỀU KIỆN BẤT KHẢ KHÁNG(ĐỘNG ĐẤT, BÃO LŨ..), \r\nCHÚNG TÔI ĐƯỢC QUYỀN HỦY HOẶC THAY ĐỔI LỊCH VÀ GIỜ CHẠY \r\nMÀ KHÔNG CHỊU BẤT CỨ TRÁCH NHIỆM NÀO.',1,NULL,NULL,NULL,NULL,NULL,'N','86','van-chuyen-hanh-khach','',NULL,NULL,30,'2017-12-24 11:18:56'),(87,'2018-03-31 01:08:33',1,'2017-12-24 11:20:19',1,9,NULL,'Y',NULL,NULL,500,'Bảo vệ quyền riêng tư',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Phạm vi &aacute;p dụng:</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Phần Qui định bảo vệ Quyền ri&ecirc;ng tư n&agrave;y tr&igrave;nh bày về việc ch&uacute;ng t&ocirc;i xử l&yacute; thông tin nhận dạng cá nh&acirc;n mà chúng tôi thu thập được khi bạn ở trong trang web hoặc ứng dụng di động của chúng tôi , và khi bạn sử dụng các dịch vụ của chúng tôi hoặc dịch vụ của các đối tác nhưng c&oacute; liên kết với dịch vụ của chúng tôi.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Quy định này không áp dụng cho những cách thức xử lý thông tin của các công ty mà chúng tôi không sở hữu hoặc kiểm soát, hoặc những người không phải là nhân viên của chúng tôi hay những người không do chúng tôi quản lý.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Cách thức chúng tôi thu thập thông tin:</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi thu thập các thông tin nhận dạng cá nhân khi bạn đăng ký sử dụng hoặc sử dụng một số dịch vụ của chúng tôi. Chúng tôi cũng có thể nhận được các thông tin nhận dạng cá nhân do các đối tác cung cấp khi bạn sử dụng dịch vụ của họ nhưng có sự liên kết phối hợp cung cấp của chúng tôi Chúng tôi cũng tự động nhận được và ghi lại các thông tin trong các tập tin ghi ch&eacute;p trong máy chủ của chúng tôi từ cửa sổ trình duyệt của bạn, trong đó bao gồm địa chỉ IP, thông tin về tập tin cookie.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Dữ liệu chúng tôi thu thập:</h4>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Để vận hành trang web và cung cấp cho bạn thông tin về sản phẩm hoặc dịch vụ có thể được bạn quan tâm, chúng tôi có thể thu thập:</p>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu cá nhân: tức là thông tin có thể được sử dụng để liên lạc với bạn trực tiếp mà không sử dụng trang web bao gồm họ tên, địa chỉ bưu ch&iacute;nh, số điện thoại, thông tin tài khoản ngân hàng/thẻ tín dụng / thẻ ghi nợ, hoặc địa chỉ email.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu Nhân khẩu học: (những thông tin không phải là thông tin cá nhân, bao gồm nhưng không giới hạn ở m&atilde; v&ugrave;ng, quê hương, giới tính, tuổi, ngày tháng năm sinh, lịch sử duyệt web, lịch sử tìm kiếm thông tin.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu vị trí: Dịch vụ của chúng tôi có thể sử dụng các công nghệ hỗ trợ định vị như Google Maps. Nếu bạn sử dụng các dịch vụ này, Google có thể nhận thông tin về vị trí thực của bạn (ví dụ như tín hiệu GPS được gửi qua thiết bị di động) hoặc thông tin có thể được sử dụng để xác định vị trí (như ID điện thoại di động).</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Chúng tôi sử dụng thông tin của bạn cho mục đích gì?</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi sử dụng địa chỉ email của bạn và các thông tin cá nhân của bạn để giúp chúng vận hành một cách có hiệu quả các trang web và dịch vụ, liên lạc với bạn khi bạn thực hiện các giao dịch đặt chỗ, để chuyển tiếp thông tin chuyến đi từ những người dùng trang web khác đến cho bạn;  và các hoạt động khác trên trang web (ví dụ gửi tin tức quan trọng mà có thể bạn quan tâm. Trong một số trường hợp, chúng tôi có thể gửi cho bạn các hoạt động truyền thông chứa nội dung thương mại, chẳng hạn như các banner quảng cáo và cung cấp đặc biệt dạng giảm giá hoặc khuyến mại).</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi có thể sử dụng các thông tin về vị trí để tối ưu hóa các hoạt động được thiết kế cho các thiết bị cầm tay thông minh. Các ứng dụng này sẽ làm cho việc đặt chỗ và theo d&otilde;i xe đến đón cũng như tìm kiếm hành khách một cách thuận lợi và linh hoạt hơn phương thức qua website.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Tiết lộ và chia sẻ thông tin</h4>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Chúng tôi chỉ chia sẻ thông tin cá nhân với các công ty hoặc cá nhân khác bên ngoài trong những trường hợp giới hạn sau:</p>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi được bạn đồng ý cho tiết lộ thông tin đó.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi cần tiết lộ thông tin của bạn để cung cấp các sản phẩm hoặc dịch vụ mà bạn yêu cầu.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi cần gửi thông tin đó cho những công ty hoạt động thay mặt cho chúng tôi để cung cấp sản phẩm hoặc dịch vụ cho bạn. (Trừ khi chúng tôi thông báo cho bạn biết nội dung khác, các công ty này không có quyền sử dụng các thông tin nhận dạng cá nhân mà chúng tôi cung cấp cho họ vượt quá phạm vi cần thiết để trợ giúp chúng tôi).</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi tuân theo các trát lệnh, lệnh t&ograve;a án hoặc thủ tục pháp lý.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Cập nhật hoặc xóa thông tin</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Khi bạn sử dụng các dịch vụ của chúng tôi, chúng tôi thật sự cố gắng cung cấp cho bạn quyền truy cập vào thông tin cá nhân của bạn hoặc để chỉnh sửa dữ liệu này nếu chưa chính xác hoặc xoá dữ liệu đó theo yêu cầu của bạn nếu dữ liệu này không được luật pháp yêu cầu giữ lại. Bạn có thể chỉnh sửa hồ sơ của bạn bất cứ lúc nào. Tất cả những gì bạn cần là tên người dùng và mật khẩu của bạn.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Bảo mật thông tin</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi sử dụng các biện pháp bảo mật thích hợp để bảo vệ việc truy cập hoặc sửa đổi, tiết lộ hoặc huỷ dữ liệu một cách trái phép. Các biện pháp này bao gồm xem xét nội bộ các thực tiễn thu thập, lưu trữ và xử lý dữ liệu cũng như các biện pháp bảo mật, bao gồm các biện pháp bảo mật vật lý và mã hoá thích hợp để bảo vệ chống truy cập trái phép vào hệ thống lưu trữ dữ liệu cá nhân của chúng tôi.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Những thay đổi về Quy định bảo vệ Quyền riêng tư này</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Đôi khi chúng tôi có thể sửa đổi qui định này. Nếu có những thay đổi, chúng tôi sẽ thông báo cho bạn bằng cách đăng thông báo ở vị trí dễ nhận thấy trên các trang web của chúng tôi. Bạn đồng ý rằng thông báo được đăng như vậy sẽ được coi như là bản thông báo đầy đủ và thỏa đáng cho bạn về những thay đổi nói trên.Bạn đồng ý rằng nếu bạn tiếp tục sử dụng các dịch vụ và sản phẩm của chúng tôi sau khi có sự sửa đổi đó, điều đó có nghĩa là bạn chấp nhận và đồng ý tuân theo qui định được sửa đổi.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Các thắc mắc hoặc gợi ý</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào cho chúng tôi về Quyền riêng tư, bạn có thể liên lạc với chúng tôi tại <a href=\"mailto:contact@apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >contact@apka.vn</a>.</li>\r\n   </ul>\r\n </div>\r\n ','html','BẢO VỆ QUYỀN RIÊNG TƯ\r\n\r\nPHẠM VI &AACUTE;P DỤNG: \r\n\r\n- PHẦN QUI ĐỊNH BẢO VỆ QUYỀN RI&ECIRC;NG TƯ N&AGRAVE;Y TR&IGRAVE;NH \r\nBÀY VỀ VIỆC CH&UACUTE;NG T&OCIRC;I XỬ L&YACUTE; THÔNG TIN NHẬN \r\nDẠNG CÁ NH&ACIRC;N MÀ CHÚNG TÔI THU THẬP ĐƯỢC KHI BẠN Ở \r\nTRONG TRANG WEB HOẶC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI , VÀ \r\nKHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HOẶC DỊCH VỤ \r\nCỦA CÁC ĐỐI TÁC NHƯNG C&OACUTE; LIÊN KẾT VỚI DỊCH VỤ CỦA \r\nCHÚNG TÔI. \r\n- QUY ĐỊNH NÀY KHÔNG ÁP DỤNG CHO NHỮNG CÁCH THỨC XỬ LÝ \r\nTHÔNG TIN CỦA CÁC CÔNG TY MÀ CHÚNG TÔI KHÔNG SỞ HỮU HOẶC \r\nKIỂM SOÁT, HOẶC NHỮNG NGƯỜI KHÔNG PHẢI LÀ NHÂN VIÊN CỦA \r\nCHÚNG TÔI HAY NHỮNG NGƯỜI KHÔNG DO CHÚNG TÔI QUẢN LÝ. CÁCH \r\nTHỨC CHÚNG TÔI THU THẬP THÔNG TIN: \r\n\r\n- CHÚNG TÔI THU THẬP CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN KHI BẠN \r\nĐĂNG KÝ SỬ DỤNG HOẶC SỬ DỤNG MỘT SỐ DỊCH VỤ CỦA CHÚNG \r\nTÔI. CHÚNG TÔI CŨNG CÓ THỂ NHẬN ĐƯỢC CÁC THÔNG TIN NHẬN \r\nDẠNG CÁ NHÂN DO CÁC ĐỐI TÁC CUNG CẤP KHI BẠN SỬ DỤNG DỊCH \r\nVỤ CỦA HỌ NHƯNG CÓ SỰ LIÊN KẾT PHỐI HỢP CUNG CẤP CỦA \r\nCHÚNG TÔI CHÚNG TÔI CŨNG TỰ ĐỘNG NHẬN ĐƯỢC VÀ GHI LẠI \r\nCÁC THÔNG TIN TRONG CÁC TẬP TIN GHI CH&EACUTE;P TRONG MÁY CHỦ CỦA \r\nCHÚNG TÔI TỪ CỬA SỔ TRÌNH DUYỆT CỦA BẠN, TRONG ĐÓ BAO GỒM \r\nĐỊA CHỈ IP, THÔNG TIN VỀ TẬP TIN COOKIE. DỮ LIỆU CHÚNG TÔI \r\nTHU THẬP: \r\n\r\nĐỂ VẬN HÀNH TRANG WEB VÀ CUNG CẤP CHO BẠN THÔNG TIN VỀ SẢN \r\nPHẨM HOẶC DỊCH VỤ CÓ THỂ ĐƯỢC BẠN QUAN TÂM, CHÚNG TÔI \r\nCÓ THỂ THU THẬP: \r\n\r\n- DỮ LIỆU CÁ NHÂN: TỨC LÀ THÔNG TIN CÓ THỂ ĐƯỢC SỬ \r\nDỤNG ĐỂ LIÊN LẠC VỚI BẠN TRỰC TIẾP MÀ KHÔNG SỬ DỤNG \r\nTRANG WEB BAO GỒM HỌ TÊN, ĐỊA CHỈ BƯU CH&IACUTE;NH, SỐ ĐIỆN \r\nTHOẠI, THÔNG TIN TÀI KHOẢN NGÂN HÀNG/THẺ TÍN DỤNG / THẺ GHI \r\nNỢ, HOẶC ĐỊA CHỈ EMAIL. \r\n- DỮ LIỆU NHÂN KHẨU HỌC: (NHỮNG THÔNG TIN KHÔNG PHẢI LÀ \r\nTHÔNG TIN CÁ NHÂN, BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở M&ATILDE; \r\nV&UGRAVE;NG, QUÊ HƯƠNG, GIỚI TÍNH, TUỔI, NGÀY THÁNG NĂM SINH, \r\nLỊCH SỬ DUYỆT WEB, LỊCH SỬ TÌM KIẾM THÔNG TIN. \r\n- DỮ LIỆU VỊ TRÍ: DỊCH VỤ CỦA CHÚNG TÔI CÓ THỂ SỬ \r\nDỤNG CÁC CÔNG NGHỆ HỖ TRỢ ĐỊNH VỊ NHƯ GOOGLE MAPS. NẾU \r\nBẠN SỬ DỤNG CÁC DỊCH VỤ NÀY, GOOGLE CÓ THỂ NHẬN THÔNG \r\nTIN VỀ VỊ TRÍ THỰC CỦA BẠN (VÍ DỤ NHƯ TÍN HIỆU GPS ĐƯỢC \r\nGỬI QUA THIẾT BỊ DI ĐỘNG) HOẶC THÔNG TIN CÓ THỂ ĐƯỢC \r\nSỬ DỤNG ĐỂ XÁC ĐỊNH VỊ TRÍ (NHƯ ID ĐIỆN THOẠI DI ĐỘNG). \r\nCHÚNG TÔI SỬ DỤNG THÔNG TIN CỦA BẠN CHO MỤC ĐÍCH GÌ? \r\n\r\n- CHÚNG TÔI SỬ DỤNG ĐỊA CHỈ EMAIL CỦA BẠN VÀ CÁC THÔNG \r\nTIN CÁ NHÂN CỦA BẠN ĐỂ GIÚP CHÚNG VẬN HÀNH MỘT CÁCH CÓ \r\nHIỆU QUẢ CÁC TRANG WEB VÀ DỊCH VỤ, LIÊN LẠC VỚI BẠN KHI \r\nBẠN THỰC HIỆN CÁC GIAO DỊCH ĐẶT CHỖ, ĐỂ CHUYỂN TIẾP \r\nTHÔNG TIN CHUYẾN ĐI TỪ NHỮNG NGƯỜI DÙNG TRANG WEB KHÁC ĐẾN \r\nCHO BẠN;  VÀ CÁC HOẠT ĐỘNG KHÁC TRÊN TRANG WEB (VÍ DỤ GỬI \r\nTIN TỨC QUAN TRỌNG MÀ CÓ THỂ BẠN QUAN TÂM. TRONG MỘT SỐ TRƯỜNG \r\nHỢP, CHÚNG TÔI CÓ THỂ GỬI CHO BẠN CÁC HOẠT ĐỘNG TRUYỀN \r\nTHÔNG CHỨA NỘI DUNG THƯƠNG MẠI, CHẲNG HẠN NHƯ CÁC BANNER \r\nQUẢNG CÁO VÀ CUNG CẤP ĐẶC BIỆT DẠNG GIẢM GIÁ HOẶC KHUYẾN \r\nMẠI). \r\n- CHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC THÔNG TIN VỀ VỊ TRÍ ĐỂ \r\nTỐI ƯU HÓA CÁC HOẠT ĐỘNG ĐƯỢC THIẾT KẾ CHO CÁC THIẾT \r\nBỊ CẦM TAY THÔNG MINH. CÁC ỨNG DỤNG NÀY SẼ LÀM CHO VIỆC \r\nĐẶT CHỖ VÀ THEO D&OTILDE;I XE ĐẾN ĐÓN CŨNG NHƯ TÌM KIẾM \r\nHÀNH KHÁCH MỘT CÁCH THUẬN LỢI VÀ LINH HOẠT HƠN PHƯƠNG THỨC \r\nQUA WEBSITE. TIẾT LỘ VÀ CHIA SẺ THÔNG TIN \r\n\r\nCHÚNG TÔI CHỈ CHIA SẺ THÔNG TIN CÁ NHÂN VỚI CÁC CÔNG TY HOẶC \r\nCÁ NHÂN KHÁC BÊN NGOÀI TRONG NHỮNG TRƯỜNG HỢP GIỚI HẠN SAU: \r\n\r\n- CHÚNG TÔI ĐƯỢC BẠN ĐỒNG Ý CHO TIẾT LỘ THÔNG TIN ĐÓ. \r\n- CHÚNG TÔI CẦN TIẾT LỘ THÔNG TIN CỦA BẠN ĐỂ CUNG CẤP \r\nCÁC SẢN PHẨM HOẶC DỊCH VỤ MÀ BẠN YÊU CẦU. \r\n- CHÚNG TÔI CẦN GỬI THÔNG TIN ĐÓ CHO NHỮNG CÔNG TY HOẠT ĐỘNG \r\nTHAY MẶT CHO CHÚNG TÔI ĐỂ CUNG CẤP SẢN PHẨM HOẶC DỊCH VỤ \r\nCHO BẠN. (TRỪ KHI CHÚNG TÔI THÔNG BÁO CHO BẠN BIẾT NỘI DUNG \r\nKHÁC, CÁC CÔNG TY NÀY KHÔNG CÓ QUYỀN SỬ DỤNG CÁC THÔNG TIN \r\nNHẬN DẠNG CÁ NHÂN MÀ CHÚNG TÔI CUNG CẤP CHO HỌ VƯỢT QUÁ \r\nPHẠM VI CẦN THIẾT ĐỂ TRỢ GIÚP CHÚNG TÔI). \r\n- CHÚNG TÔI TUÂN THEO CÁC TRÁT LỆNH, LỆNH T&OGRAVE;A ÁN HOẶC \r\nTHỦ TỤC PHÁP LÝ. CẬP NHẬT HOẶC XÓA THÔNG TIN \r\n\r\n- KHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI, CHÚNG TÔI \r\nTHẬT SỰ CỐ GẮNG CUNG CẤP CHO BẠN QUYỀN TRUY CẬP VÀO THÔNG \r\nTIN CÁ NHÂN CỦA BẠN HOẶC ĐỂ CHỈNH SỬA DỮ LIỆU NÀY NẾU \r\nCHƯA CHÍNH XÁC HOẶC XOÁ DỮ LIỆU ĐÓ THEO YÊU CẦU CỦA BẠN \r\nNẾU DỮ LIỆU NÀY KHÔNG ĐƯỢC LUẬT PHÁP YÊU CẦU GIỮ LẠI. \r\nBẠN CÓ THỂ CHỈNH SỬA HỒ SƠ CỦA BẠN BẤT CỨ LÚC NÀO. \r\nTẤT CẢ NHỮNG GÌ BẠN CẦN LÀ TÊN NGƯỜI DÙNG VÀ MẬT KHẨU \r\nCỦA BẠN. BẢO MẬT THÔNG TIN \r\n\r\n- CHÚNG TÔI SỬ DỤNG CÁC BIỆN PHÁP BẢO MẬT THÍCH HỢP ĐỂ \r\nBẢO VỆ VIỆC TRUY CẬP HOẶC SỬA ĐỔI, TIẾT LỘ HOẶC HUỶ \r\nDỮ LIỆU MỘT CÁCH TRÁI PHÉP. CÁC BIỆN PHÁP NÀY BAO GỒM XEM \r\nXÉT NỘI BỘ CÁC THỰC TIỄN THU THẬP, LƯU TRỮ VÀ XỬ LÝ DỮ \r\nLIỆU CŨNG NHƯ CÁC BIỆN PHÁP BẢO MẬT, BAO GỒM CÁC BIỆN PHÁP \r\nBẢO MẬT VẬT LÝ VÀ MÃ HOÁ THÍCH HỢP ĐỂ BẢO VỆ CHỐNG \r\nTRUY CẬP TRÁI PHÉP VÀO HỆ THỐNG LƯU TRỮ DỮ LIỆU CÁ NHÂN \r\nCỦA CHÚNG TÔI. NHỮNG THAY ĐỔI VỀ QUY ĐỊNH BẢO VỆ QUYỀN \r\nRIÊNG TƯ NÀY \r\n\r\n- ĐÔI KHI CHÚNG TÔI CÓ THỂ SỬA ĐỔI QUI ĐỊNH NÀY. NẾU \r\nCÓ NHỮNG THAY ĐỔI, CHÚNG TÔI SẼ THÔNG BÁO CHO BẠN BẰNG CÁCH \r\nĐĂNG THÔNG BÁO Ở VỊ TRÍ DỄ NHẬN THẤY TRÊN CÁC TRANG WEB \r\nCỦA CHÚNG TÔI. BẠN ĐỒNG Ý RẰNG THÔNG BÁO ĐƯỢC ĐĂNG NHƯ \r\nVẬY SẼ ĐƯỢC COI NHƯ LÀ BẢN THÔNG BÁO ĐẦY ĐỦ VÀ THỎA \r\nĐÁNG CHO BẠN VỀ NHỮNG THAY ĐỔI NÓI TRÊN.BẠN ĐỒNG Ý RẰNG \r\nNẾU BẠN TIẾP TỤC SỬ DỤNG CÁC DỊCH VỤ VÀ SẢN PHẨM CỦA \r\nCHÚNG TÔI SAU KHI CÓ SỰ SỬA ĐỔI ĐÓ, ĐIỀU ĐÓ CÓ NGHĨA \r\nLÀ BẠN CHẤP NHẬN VÀ ĐỒNG Ý TUÂN THEO QUI ĐỊNH ĐƯỢC SỬA \r\nĐỔI. CÁC THẮC MẮC HOẶC GỢI Ý \r\n\r\n- NẾU BẠN CÓ BẤT KỲ CÂU HỎI HOẶC GÓP Ý NÀO CHO CHÚNG \r\nTÔI VỀ QUYỀN RIÊNG TƯ, BẠN CÓ THỂ LIÊN LẠC VỚI CHÚNG TÔI \r\nTẠI CONTACT@APKA.VN [ MAILTO:CONTACT@APKA.VN ] .',1,NULL,NULL,NULL,NULL,NULL,'N','87','bao-ve-quyen-rieng-tu','',NULL,NULL,40,'2017-12-24 11:20:21'),(88,'2018-04-13 17:11:00',8,'2017-12-24 11:42:17',1,9,NULL,'Y',NULL,NULL,500,'Sử dụng dịch vụ',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">1. CHẤP NHẬN C&Aacute;C ĐIỀU KHOẢN</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Thỏa thuận sau đ&acirc;y l&agrave; một thỏa thuận ràng buộc ph&aacute;p l&yacute; giữa Bạn và <a id=\"bxid_282727\" href=\"http://apka.vn/\" style=\"font-style: normal; box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://apka.vn</a>(&quot;Ch&uacute;ng t&ocirc;i&rdquo;). Thỏa thuận bao gồm các điều khoản dịch vụ mà bạn phải tuân thủ để được quyền tiếp cận và sử dụng dịch vụ  tr&ecirc;n trang Web  và các ứng dụng di động của chúng tôi.  Tại từng thời điểm, chúng tôi c&oacute; thể cập nhật Điều khoản dịch vụ theo quyết định của m&igrave;nh mà không cần thông báo trực tiếp cho bạn. Bạn chịu trách nhiệm tìm hiểu phiên bản mới nhất bằng cách truy cập website http://apka.vn/.</em></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">XIN VUI L&Ograve;NG ĐỌC ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K&Yacute; LÀM THÀNH VI&Ecirc;N. NẾU BẠN KH&Ocirc;NG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CH&Uacute;NG TÔI.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Bạn sẽ nhận được một mật khẩu và tài khoản sau khi hoàn tất thủ tục đăng ký làm thành viên. Bạn có trách nhiệm bảo mật mật khẩu và tài khoản, và hoàn toàn chịu trách nhiệm đối với tất cả các hoạt động diễn ra dưới việc sử dụng mật khẩu hoặc tài khoản của mình. Bạn đồng ý (a) thông báo ngay cho chúng tôi về bất cứ trường hợp nào sử dụng trái ph&eacute;p mật khẩu hoặc tài khoản của bạn hoặc bất cứ trường hợp nào khác vi phạm sự bảo mật, và (b) bảo đảm rằng Bạn luôn thoát khỏi tài khoản của mình sau mỗi lần sử dụng. Chúng tôi không thể và sẽ không chịu trách nhiệm đối với bất cứ tổn thất hoặc thiệt hại nào phát sinh do Bạn không tuân thủ quy định này.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">V<em style=\"box-sizing: border-box;\">ới tư cách là người sử dụng dịch vụ, Bạn phải cam kết:</em> \r\n      <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"> \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(a) bạn có đủ tư cách pháp lý và tư cách hành vi khi sử dụng dịch vụ</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(b) cung cấp các thông tin đầy đủ, trung thực và ch&iacute;nh xác về bản thân trong Hồ sơ cá nhân</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(c) duy trì và cập nhật kịp thời Hồ sơ cá nhân để bảo đảm rằng dữ liệu này là đầy đủ, trung thực và chính xác.</em></li>\r\n       </ul>\r\n     </li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Nếu Bạn cung cấp bất cứ thông tin nào không phải là không trung thực hoặc không chính xác, hoặc nếu chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin đó không trung thực hoặc không chính xác, chúng tôi có quyền đình chỉ hoặc chấm dứt tài khoản của Bạn; từ chối một phần hoặc toàn bộ việc sử dụng Dịch vụ tại thời điểm hiện tại hoặc trong tương lai.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Bạn hiểu rằng bạn hoàn toàn chịu trách nhiệm trước pháp luật về các Nội dung bạn tạo ra bao gồm nhưng không giới hạn ở dữ liệu, văn bản, phần mềm, âm thanh, hình ảnh, video, email. Chúng tôi không có nghĩa vụ theo d&otilde;i các tài liệu được đăng và vì vậy, không bảo đảm về tính hợp pháp, chính xác, nguyên vẹn hoặc chất lượng của Nội Dung đó. Tại các khu vực được phép đăng tải Nội dung, bạn có thể chia sẻ thông tin được phép dưới các định dạng chúng tôi mặc định và bạn phải tự chịu trách nhiệm đối với các nội dung, thông tin, hình ảnh và bất kỳ sự chia sẻ nào khác của bạn với cá nhân người sử dụng hoặc nhóm người sử dụng. Tuy nhiên, trong mọi trường hợp, chúng tôi vẫn được bảo lưu quyền xử lý các thông tin đăng tải cho ph&ugrave; hợp với thuần phong mỹ tục, các quy tắc đạo đức và các quy tắc đảm bảo an ninh quốc gia, và chúng tôi có toàn quyền cho phép hoặc không cho phép bài viết của bạn xuất hiện hay tồn tại tại các khu vực được phép chia sẻ thông tin.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">5. HẠN CHẾ HOẠT ĐỘNG</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Không giới hạn các biện pháp khắc phục hậu quả khác, chúng tôi có thể chấm dứt sự tham gia của bạn, loại bỏ thông tin của bạn  và từ chối cung cấp dịch vụ nếu:</em> \r\n      <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"> \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(a). Bạn đ&atilde; sử dụng sai mục đích các các dịch vụ, có hành vi trái pháp luật hoặc đạo đức.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(b). chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin bạn cung cấp không trung thực hoặc không chính xác.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(c). chúng tôi tin rằng hành động của bạn là gian lận, lừa đảo và có thể gây ra tổn thất tài chính hoặc trách nhiệm pháp lý cho  chúng tôi.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(d). sử dụng các dịch vụ với mục đích thương mại mà không có sự đồng ý trước bằng văn bản đồng ý của chúng tôi.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(e). vi phạm các quyền của chúng tôi hoặc bên thứ ba, bao gồm nhưng không giới hạn quyền sở hữu trí tuệ, quyền tác giả, bằng sáng chế, thương hiệu, bí mật thương mại hoặc các quyền riêng tư.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(f). phát tán các ứng dụng độc hại hoặc tấn công chiếm đoạt quyền điều khiển hệ thống, dữ liệu hoặc thông tin cá nhân.</em></li>\r\n       </ul>\r\n     </li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">6. BẢO MẬT</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Chúng tôi không bán hoặc cho thuê thông tin của bạn cho bên thứ ba mà không có sự cho phép của bạn và chúng tôi chỉ sử dụng thông tin của bạn như được mô tả trong <a href=\"/thong-tin/bao-ve-quyen-rieng-tu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Điều khoản riêng tư</a></em></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Chúng tôi xem bảo vệ sự riêng tư của người sử dụng như một nguyên tắc quan trọng hàng đầu. Bạn có thể xem xét lại chính sách bảo mật hiện tại của chúng tôi tại <a href=\"/thong-tin/bao-ve-quyen-rieng-tu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Điều khoản riêng tư</a></em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">7. SỞ HỮU TR&Iacute; TUỆ</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Trừ phi được sự đồng ý của chúng tôi, bạn không được phép tải lên, gửi, xuất bản, sửa đổi, tái sản xuất, truyền hoặc phân phát bằng bất cứ hình thức nào bất cứ thành phần nào của Dịch vụ mà chúng tôi cung cấp. Chúng tôi có toàn quyền, bao gồm nhưng không chỉ giới hạn trong các quyền tác giả, thương hiệu, và các quyền sở hữu khác mà chúng tôi có trong các Dịch vụ này .Tất cả các yếu tố cấu thành lên Dịch vụ mà chúng tôi cung cấp đều thuộc phạm vị sở hữu của chúng tôi cho dù đã đăng ký hoặc chưa đăng ký. Việc sử dụng quyền và sở hữu của chúng tôi cần phải được chúng tôi cho phép trước bằng văn bản. Ngoài việc cấp phép bằng văn bản, chúng tôi không cấp phép dưới bất kỳ hình thức nào khác cho dù đó là hình thức công bố hay hàm ý, hoặc thông qua việc để bạn sử dụng dịch vụ. Và do vậy, bạn không có quyền sử dụng Dịch vụ của chúng tôi vào mục đích thương mại mà không có sự cho phép bằng văn bản của chúng tôi trước đó.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Thông qua việc đăng ký hoặc sử dụng website và dịch vụ của chúng tôi, bạn mặc nhiên đồng ý và tuân thủ toàn bộ các quy định của Luật pháp Việt Nam . Trong trường hợp một hoặc một số điều khoản của bản Quy định sử dụng này xung đột với các quy định của luật pháp và bị T&ograve;a án coi là vô hiệu, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định của pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.</em></li>\r\n   </ul>\r\n </div>\r\n ','html','SỬ DỤNG DỊCH VỤ\r\n\r\n1. CHẤP NHẬN C&AACUTE;C ĐIỀU KHOẢN \r\n\r\n- THỎA THUẬN SAU Đ&ACIRC;Y L&AGRAVE; MỘT THỎA THUẬN RÀNG BUỘC \r\nPH&AACUTE;P L&YACUTE; GIỮA BẠN VÀ ĐIỀU KHOẢN RIÊNG TƯ [ /THONG-TIN/BAO-VE-QUYEN-RIENG-TU.HTML ]\r\n \r\n- CHÚNG TÔI XEM BẢO VỆ SỰ RIÊNG TƯ CỦA NGƯỜI SỬ DỤNG \r\nNHƯ MỘT NGUYÊN TẮC QUAN TRỌNG HÀNG ĐẦU. BẠN CÓ THỂ XEM \r\nXÉT LẠI CHÍNH SÁCH BẢO MẬT HIỆN TẠI CỦA CHÚNG TÔI TẠI ĐIỀU \r\nKHOẢN RIÊNG TƯ [ /THONG-TIN/BAO-VE-QUYEN-RIENG-TU.HTML ] 7. SỞ HỮU \r\nTR&IACUTE; TUỆ \r\n\r\n- TRỪ PHI ĐƯỢC SỰ ĐỒNG Ý CỦA CHÚNG TÔI, BẠN KHÔNG ĐƯỢC \r\nPHÉP TẢI LÊN, GỬI, XUẤT BẢN, SỬA ĐỔI, TÁI SẢN XUẤT, \r\nTRUYỀN HOẶC PHÂN PHÁT BẰNG BẤT CỨ HÌNH THỨC NÀO BẤT CỨ \r\nTHÀNH PHẦN NÀO CỦA DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP. CHÚNG \r\nTÔI CÓ TOÀN QUYỀN, BAO GỒM NHƯNG KHÔNG CHỈ GIỚI HẠN TRONG \r\nCÁC QUYỀN TÁC GIẢ, THƯƠNG HIỆU, VÀ CÁC QUYỀN SỞ HỮU KHÁC \r\nMÀ CHÚNG TÔI CÓ TRONG CÁC DỊCH VỤ NÀY .TẤT CẢ CÁC YẾU TỐ \r\nCẤU THÀNH LÊN DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP ĐỀU THUỘC \r\nPHẠM VỊ SỞ HỮU CỦA CHÚNG TÔI CHO DÙ ĐÃ ĐĂNG KÝ HOẶC \r\nCHƯA ĐĂNG KÝ. VIỆC SỬ DỤNG QUYỀN VÀ SỞ HỮU CỦA CHÚNG \r\nTÔI CẦN PHẢI ĐƯỢC CHÚNG TÔI CHO PHÉP TRƯỚC BẰNG VĂN BẢN. \r\nNGOÀI VIỆC CẤP PHÉP BẰNG VĂN BẢN, CHÚNG TÔI KHÔNG CẤP PHÉP \r\nDƯỚI BẤT KỲ HÌNH THỨC NÀO KHÁC CHO DÙ ĐÓ LÀ HÌNH THỨC \r\nCÔNG BỐ HAY HÀM Ý, HOẶC THÔNG QUA VIỆC ĐỂ BẠN SỬ DỤNG \r\nDỊCH VỤ. VÀ DO VẬY, BẠN KHÔNG CÓ QUYỀN SỬ DỤNG DỊCH VỤ \r\nCỦA CHÚNG TÔI VÀO MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ CHO \r\nPHÉP BẰNG VĂN BẢN CỦA CHÚNG TÔI TRƯỚC ĐÓ. 8. KHIẾU NẠI \r\nVÀ GIẢI QUYẾT TRANH CHẤP \r\n\r\n- THÔNG QUA VIỆC ĐĂNG KÝ HOẶC SỬ DỤNG WEBSITE VÀ DỊCH VỤ \r\nCỦA CHÚNG TÔI, BẠN MẶC NHIÊN ĐỒNG Ý VÀ TUÂN THỦ TOÀN BỘ \r\nCÁC QUY ĐỊNH CỦA LUẬT PHÁP VIỆT NAM . TRONG TRƯỜNG HỢP MỘT \r\nHOẶC MỘT SỐ ĐIỀU KHOẢN CỦA BẢN QUY ĐỊNH SỬ DỤNG NÀY \r\nXUNG ĐỘT VỚI CÁC QUY ĐỊNH CỦA LUẬT PHÁP VÀ BỊ T&OGRAVE;A \r\nÁN COI LÀ VÔ HIỆU, ĐIỀU KHOẢN ĐÓ SẼ ĐƯỢC CHỈNH SỬA \r\nCHO PHÙ HỢP VỚI QUY ĐỊNH CỦA PHÁP LUẬT HIỆN HÀNH, VÀ PHẦN \r\nCÒN LẠI CỦA QUY ĐỊNH SỬ DỤNG VẪN GIỮ NGUYÊN GIÁ TRỊ.',1,NULL,NULL,NULL,NULL,NULL,'N','88','su-dung-dich-vu','',NULL,NULL,42,'2017-12-24 11:42:19'),(89,'2018-04-13 16:54:26',8,'2017-12-24 11:47:27',1,9,NULL,'Y',NULL,NULL,500,'Giải quyết sự cố và khiếu nại',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">1. Sự cố ph&aacute;t sinh trong quá tr&igrave;nh đặt chỗ, hủy chỗ</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\"> Trong quá trình đặt chỗ tr&ecirc;n website <a href=\"http://apka.vn\" >http://apka.vn</a>, nếu c&oacute; bất kì sự cố n&agrave;o trong quá trình đặt chỗ bao gồm nhưng kh&ocirc;ng giới hạn ở :</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Điền và xác nhận thông tin về xe/chỗ cần đặt</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Quá trình thanh toán</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Hủy chỗ và hoàn tiền</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Phát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến khách hàng không hoàn tất giao dịch đặt chỗ</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\">Khách hàng h&atilde;y sử dụng một trong những hình thức  hỗ trợ sau:</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Chat với bộ phận hỗ trợ khách hàng trực tuyến </li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gửi mail về contact@apka.vn</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện về Tổng đài 0981.370.360</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <h4 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.4; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; text-align: justify;\">2. Sự cố phát sinh khi sử dụng dịch vụ</h4>\r\n \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Nếu có trục trặc xảy ra trong việc xác nhận v&eacute; điện tử giữa khách hàng và tài xế, Cơ sở để giải quyết tranh chấp dựa trên các thông tin, chứng từ (mã vé điện tử hoặc thông tin cá nh&acirc;n) do khách hàng cung cấp và đối chiếu, so sánh với thông tin khách hàng cung cấp khi đặt chỗ đã được được lưu trữ trên hệ thống cơ sở dữ liệu của <a id=\"bxid_282727\" href=\"http://apka.vn/\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://apka.vn</a></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp xảy ra khiếu nại liên quan đến thời gian phục vụ. Cơ sở để giải quyết tranh chấp là thông tin khách hàng đã cung cấp về thời gian đón đã ghi nhận trên hệ thống và thời gian chờ được qui định chi tiết trong <a href=\"/thong-tin/van-chuyen-hanh-khach.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Ch&iacute;nh sách vận chuyển</a> của ch&uacute;ng tôi. Nếu tài xế  vi phạm về thời gian đã qui định, khách hàng có quyền khiếu nại đ&ograve;i bồi thường.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp xảy ra những khiếu nại liên quan đến thái độ và chất lượng phục vụ của tài xế cũng như chất lượng phương tiện. Cơ sở để giải quyết tranh chấp là những nội dung Quí khách trao đổi trực tiếp với tổng đài ( đã được ghi âm)  hoặc các tài liệu chứng minh như ảnh chụp, file âm thanh, lời khai của bên thứ ba.. do Quí khách cung cấp.</li>\r\n   </ul>\r\n \r\n  <div style=\"box-sizing: border-box; text-align: justify;\">Tất cả các sự cố phát sinh khi sử dụng dịch vụ, Quí khách vui lòng liên hệ để được hỗ trợ bằng một trong các cách sau:</div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Phản ánh trực tiếp với hãng vận chuyển trực tiếp phục vụ</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <h4 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.4; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; text-align: justify;\">3. Sự cố phát sinh khác</h4>\r\n \r\n  <div style=\"box-sizing: border-box; text-align: justify;\">Khi có bất kỳ sự cố nào phát sinh, cơ sở đầu tiên để giải quyết tranh chấp căn cứ vào <a href=\"/thong-tin/van-chuyen-hanh-khach.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Chính sách vận chuyển</a> và các <a href=\"/thong-tin/su-dung-dich-vu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Hướng dẫn sử dụng dịch vụ</a> của chúng tôi. Chúng tôi sẽ thực hiện mọi nỗ lực hợp l&yacute; để giải quyết các khiếu nại của khách hàng sử dụng dịch vụ đặt chỗ trực tuyến. Nếu những nỗ lực đó thất bại, khách hàng phải đồng ý rằng bất kỳ khiếu nại, tranh chấp của khách hàng đối với chúng tôi đều được giải quyết theo đúng quy định của pháp luật Việt Nam. </div>\r\n \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\">Vui lòng liên hệ bằng một trong các cách sau khi cần hỗ trợ:</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gửi mail về contact@apka.vn</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện về số hỗ trợ 0981.370.360</li>\r\n     </ul>\r\n   </div>\r\n </div>\r\n ','html','GIẢI QUYẾT SỰ CỐ VÀ KHIẾU NẠI\r\n\r\n1. SỰ CỐ PH&AACUTE;T SINH TRONG QUÁ TR&IGRAVE;NH ĐẶT CHỖ, HỦY \r\nCHỖ \r\n\r\n TRONG QUÁ TRÌNH ĐẶT CHỖ TR&ECIRC;N WEBSITE CH&IACUTE;NH SÁCH \r\nVẬN CHUYỂN [ /THONG-TIN/VAN-CHUYEN-HANH-KHACH.HTML ]  CỦA CH&UACUTE;NG \r\nTÔI. NẾU TÀI XẾ  VI PHẠM VỀ THỜI GIAN ĐÃ QUI ĐỊNH, KHÁCH \r\nHÀNG CÓ QUYỀN KHIẾU NẠI Đ&OGRAVE;I BỒI THƯỜNG. \r\n- TRONG TRƯỜNG HỢP XẢY RA NHỮNG KHIẾU NẠI LIÊN QUAN ĐẾN THÁI \r\nĐỘ VÀ CHẤT LƯỢNG PHỤC VỤ CỦA TÀI XẾ CŨNG NHƯ CHẤT \r\nLƯỢNG PHƯƠNG TIỆN. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ \r\nNHỮNG NỘI DUNG QUÍ KHÁCH TRAO ĐỔI TRỰC TIẾP VỚI TỔNG ĐÀI \r\n( ĐÃ ĐƯỢC GHI ÂM)  HOẶC CÁC TÀI LIỆU CHỨNG MINH NHƯ ẢNH \r\nCHỤP, FILE ÂM THANH, LỜI KHAI CỦA BÊN THỨ BA.. DO QUÍ KHÁCH \r\nCUNG CẤP. TẤT CẢ CÁC SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH \r\nVỤ, QUÍ KHÁCH VUI LÒNG LIÊN HỆ ĐỂ ĐƯỢC HỖ TRỢ BẰNG \r\nMỘT TRONG CÁC CÁCH SAU: \r\n\r\n- PHẢN ÁNH TRỰC TIẾP VỚI HÃNG VẬN CHUYỂN TRỰC TIẾP PHỤC \r\nVỤ 3. SỰ CỐ PHÁT SINH KHÁC KHI CÓ BẤT KỲ SỰ CỐ NÀO PHÁT \r\nSINH, CƠ SỞ ĐẦU TIÊN ĐỂ GIẢI QUYẾT TRANH CHẤP CĂN CỨ \r\nVÀO CHÍNH SÁCH VẬN CHUYỂN [ /THONG-TIN/VAN-CHUYEN-HANH-KHACH.HTML ] \r\n VÀ CÁC HƯỚNG DẪN SỬ DỤNG DỊCH VỤ [ /THONG-TIN/SU-DUNG-DICH-VU.HTML ] \r\n CỦA CHÚNG TÔI. CHÚNG TÔI SẼ THỰC HIỆN MỌI NỖ LỰC HỢP \r\nL&YACUTE; ĐỂ GIẢI QUYẾT CÁC KHIẾU NẠI CỦA KHÁCH HÀNG SỬ \r\nDỤNG DỊCH VỤ ĐẶT CHỖ TRỰC TUYẾN. NẾU NHỮNG NỖ LỰC \r\nĐÓ THẤT BẠI, KHÁCH HÀNG PHẢI ĐỒNG Ý RẰNG BẤT KỲ KHIẾU \r\nNẠI, TRANH CHẤP CỦA KHÁCH HÀNG ĐỐI VỚI CHÚNG TÔI ĐỀU ĐƯỢC \r\nGIẢI QUYẾT THEO ĐÚNG QUY ĐỊNH CỦA PHÁP LUẬT VIỆT NAM.  \r\n\r\nVUI LÒNG LIÊN HỆ BẰNG MỘT TRONG CÁC CÁCH SAU KHI CẦN HỖ TRỢ: \r\n\r\n- GỬI MAIL VỀ CONTACT@APKA.VN \r\n- GỌI ĐIỆN VỀ SỐ HỖ TRỢ 0981.370.360',1,NULL,NULL,NULL,NULL,NULL,'N','89','giai-quyet-su-co-va-khieu-nai','',NULL,NULL,40,'2017-12-24 11:47:29'),(90,'2018-03-31 01:06:31',1,'2017-12-24 11:48:50',1,9,NULL,'Y',NULL,NULL,500,'Hướng dẫn đặt xe',NULL,'Hướng dẫn đặt xe...','html',NULL,'Thông tin đang cập nhật. Bạn vui lòng trở lại sau','text','HƯỚNG DẪN ĐẶT XE\r\nHƯỚNG DẪN ĐẶT XE...\r\nTHÔNG TIN ĐANG CẬP NHẬT. BẠN VUI LÒNG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','90','huong-dan-dat-xe','',NULL,NULL,46,'2017-12-24 11:50:57'),(91,'2017-12-24 11:49:11',1,'2017-12-24 11:49:11',1,9,NULL,'Y',NULL,NULL,500,'Hướng dẫn sử dụng',NULL,'','text',NULL,'Nội dung','text','HƯỚNG DẪN SỬ DỤNG\r\n\r\nNỘI DUNG',1,NULL,NULL,NULL,NULL,NULL,'N','91','huong-dan-su-dung','',NULL,NULL,43,'2017-12-24 11:50:59'),(92,'2017-12-24 11:49:38',1,'2017-12-24 11:49:38',1,9,NULL,'Y',NULL,NULL,500,'Câu hỏi thường gặp',NULL,'','text',NULL,'Câu 1: \r\nTrả lời:','text','CÂU HỎI THƯỜNG GẶP\r\n\r\nCÂU 1: \r\nTRẢ LỜI:',1,NULL,NULL,NULL,NULL,NULL,'N','92','cau-hoi-thuong-gap','',NULL,NULL,44,'2017-12-24 11:51:01'),(93,'2018-03-31 01:03:58',1,'2017-12-24 11:52:35',1,10,NULL,'N',NULL,NULL,500,'ĐI CHUNG XE VỀ QUÊ TẾT ĐINH DẬU 2017',NULL,'','html',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">\r\n  <br />\r\n</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Sau 2 năm 2015 v&agrave; 2016 triển khai chương tr&igrave;nh &quot;Đi chung Xe về qu&ecirc; Tết Nguyên Đ&aacute;n&quot;, DichungTaxi đ&atilde; đạt được nhiều thành c&ocirc;ng lớn. Hàng trăm chuyến đi thành công đã gi&uacute;p hàng nghìn hành khách c&oacute; cơ hội trở về sum họp bên gia đình được an toàn, tiện nghi và tiết kiệm.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Để tiếp nối những thành công này, DichungTaxi đã tìm kiếm và hợp tác với nhiều hãng taxi giá rẻ, các đơn vị vận tải hành khách để triển khai chương trình &quot;<span style=\"box-sizing: border-box; color: rgb(255, 0, 0);\">Đi chung Xe về quê Tết Đinh Dậu 2017</span>&quot;.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\">-----</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Để đảm bảo dịch vụ tốt nhất cho mọi hành khách, DichungTaxi sẽ triển khai Đi chung Xe về quê các tuyến đường trọng điểm từ Hà Nội đi các tỉnh như Thái Bình, Nam Định, Ninh Bình, Hải Dương, Hải Ph&ograve;ng, Quảng Ninh, Thanh Hóa,...</p>\r\n ','html','ĐI CHUNG XE VỀ QUÊ TẾT ĐINH DẬU 2017\r\n\r\nSAU 2 NĂM 2015 V&AGRAVE; 2016 TRIỂN KHAI CHƯƠNG TR&IGRAVE;NH \"ĐI \r\nCHUNG XE VỀ QU&ECIRC; TẾT NGUYÊN Đ&AACUTE;N\", DICHUNGTAXI Đ&ATILDE; \r\nĐẠT ĐƯỢC NHIỀU THÀNH C&OCIRC;NG LỚN. HÀNG TRĂM CHUYẾN \r\nĐI THÀNH CÔNG ĐÃ GI&UACUTE;P HÀNG NGHÌN HÀNH KHÁCH C&OACUTE; CƠ \r\nHỘI TRỞ VỀ SUM HỌP BÊN GIA ĐÌNH ĐƯỢC AN TOÀN, TIỆN NGHI \r\nVÀ TIẾT KIỆM. \r\n\r\nĐỂ TIẾP NỐI NHỮNG THÀNH CÔNG NÀY, DICHUNGTAXI ĐÃ TÌM KIẾM \r\nVÀ HỢP TÁC VỚI NHIỀU HÃNG TAXI GIÁ RẺ, CÁC ĐƠN VỊ VẬN \r\nTẢI HÀNH KHÁCH ĐỂ TRIỂN KHAI CHƯƠNG TRÌNH \"ĐI CHUNG XE VỀ \r\nQUÊ TẾT ĐINH DẬU 2017\". \r\n\r\n----- \r\n\r\nĐỂ ĐẢM BẢO DỊCH VỤ TỐT NHẤT CHO MỌI HÀNH KHÁCH, DICHUNGTAXI \r\nSẼ TRIỂN KHAI ĐI CHUNG XE VỀ QUÊ CÁC TUYẾN ĐƯỜNG TRỌNG \r\nĐIỂM TỪ HÀ NỘI ĐI CÁC TỈNH NHƯ THÁI BÌNH, NAM ĐỊNH, NINH \r\nBÌNH, HẢI DƯƠNG, HẢI PH&OGRAVE;NG, QUẢNG NINH, THANH HÓA,...',1,NULL,NULL,NULL,NULL,NULL,'N','93','i-chung-xe-ve-que-tet-2017','',NULL,NULL,18,'2017-12-24 11:53:37'),(94,'2018-03-31 01:03:45',1,'2017-12-24 11:55:19',1,10,NULL,'Y',NULL,NULL,500,'Về chúng tôi',NULL,'','text',NULL,' \r\n<p style=\"text-align: center; box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\"> <img src=\"/upload/medialibrary/02a/02a193fda1e0e1930445a407041d61bf.jpg\" title=\"DoiNgu.jpg\" border=\"0\" alt=\"DoiNgu.jpg\" width=\"800px\" height=\"534px\"  /></p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\"> \r\n  <br />\r\n APKA.VN hiện nay với hơn 4000 đối t&aacute;c lái xe tham gia hợp tác, gi&uacute;p h&agrave;nh khách t&igrave;m được xe giá tốt, lu&ocirc;n giúp chuy&ecirc;n đi vui th&iacute;ch. Dựa trên nền tảng công nghệ website và di động, www.apka.vn phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. Hành khách c&oacute; thể sử dụng các công nghệ của APKA để tìm kiếm, lựa chọn và đặt các loại xe từ 4 chỗ đến 8 chỗ với cả hai hình thức di chuyển đi riêng xe và đi chung xe. Giải pháp của APKA cũng giúp cho các hãng taxi và xe hợp đồng thúc đẩy sự trung thành của khách hàng và tối ưu lợi nhuận cho từng chuyến đi. \r\n  <br />\r\n </p>\r\n \r\n<p>APKA trực thuộc Công ty cổ phần đầu tư <b>An Phát Khánh</b> là một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (trên nền tảng Grab).</p>\r\n \r\n<p>Các lĩnh vực hoạt động: </p>\r\n \r\n<p>1. Mua Bán xe ô tô cũ mới, mua xe trả góp: <i><u>apkauto.vn</u></i> </p>\r\n \r\n<p>2. Gara bảo dưỡng, sửa chữa xe ô tô: <i><u>anphatauto.com</u></i> </p>\r\n \r\n<p>3. Đầu tư, cho thuê và hợp tác xe Grab: <i><u>anphatkhanh.vn</u></i> </p>\r\n \r\n<p>4. Mua bán bảo hiểm ô tô: <i><u>anphatkhanh.vn</u></i> </p>\r\n \r\n<p>5. Dự án xe Nội Bài, xe chạy tỉnh: <i><u>apka.vn</u></i></p>\r\n ','html','VỀ CHÚNG TÔI\r\n\r\n[ /UPLOAD/MEDIALIBRARY/02A/02A193FDA1E0E1930445A407041D61BF.JPG ] \r\n\r\n\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI T&AACUTE;C LÁI XE THAM GIA HỢP \r\nTÁC, GI&UACUTE;P H&AGRAVE;NH KHÁCH T&IGRAVE;M ĐƯỢC XE GIÁ TỐT, \r\nLU&OCIRC;N GIÚP CHUY&ECIRC;N ĐI VUI TH&IACUTE;CH. DỰA TRÊN NỀN TẢNG \r\nCÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN PHÁT TRIỂN MỘT GIẢI \r\nPHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC H&ATILDE;NG \r\nTAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC \r\nTIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG \r\nTÁC ĐỘNG ĐẾN MÔI TRƯỜNG. HÀNH KHÁCH C&OACUTE; THỂ SỬ DỤNG \r\nCÁC CÔNG NGHỆ CỦA APKA ĐỂ TÌM KIẾM, LỰA CHỌN VÀ ĐẶT \r\nCÁC LOẠI XE TỪ 4 CHỖ ĐẾN 8 CHỖ VỚI CẢ HAI HÌNH THỨC DI CHUYỂN \r\nĐI RIÊNG XE VÀ ĐI CHUNG XE. GIẢI PHÁP CỦA APKA CŨNG GIÚP CHO \r\nCÁC HÃNG TAXI VÀ XE HỢP ĐỒNG THÚC ĐẨY SỰ TRUNG THÀNH CỦA \r\nKHÁCH HÀNG VÀ TỐI ƯU LỢI NHUẬN CHO TỪNG CHUYẾN ĐI. \r\n \r\n\r\nAPKA TRỰC THUỘC CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH LÀ \r\nMỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU \r\nHƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRÊN NỀN \r\nTẢNG GRAB). \r\n\r\nCÁC LĨNH VỰC HOẠT ĐỘNG: \r\n\r\n1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GÓP: APKAUTO.VN \r\n\r\n2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: ANPHATAUTO.COM \r\n\r\n3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: ANPHATKHANH.VN \r\n\r\n4. MUA BÁN BẢO HIỂM Ô TÔ: ANPHATKHANH.VN \r\n\r\n5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: APKA.VN',1,NULL,NULL,NULL,NULL,NULL,'N','94','ve-chung-toi','',NULL,NULL,82,'2017-12-24 11:55:35'),(137,'2018-03-16 11:51:23',0,'2018-03-16 11:51:23',0,7,NULL,'Y',NULL,NULL,500,'HN9E2WRA',NULL,NULL,'text',NULL,NULL,'text','HN9E2WRA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','137',NULL,NULL,NULL,NULL,NULL,NULL),(141,'2018-03-31 00:56:40',1,'2018-03-31 00:56:40',1,8,NULL,'Y',NULL,NULL,500,'Mừng sinh nhật An Phát Khánh tròn 02 tuổi',NULL,'Thời gian trôi qua và chứng kiến những đổi thay trong từng bước đi của An Phát Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nhân viên đã cùng nhau đoàn tụ tổng kết, chúc mừng công ty tròn hai tuổi.\r\n','text',NULL,'\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Thời gian tr&ocirc;i qua v&agrave; chứng kiến những đổi thay trong từng bước đi của An Ph&aacute;t Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nh&acirc;n vi&ecirc;n đ&atilde; c&ugrave;ng nhau đoàn tụ tổng kết, ch&uacute;c mừng công ty tr&ograve;n hai tuổi.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/636/63632d22eb7d67bdd913a51a3c51ebfc.jpg\" title=\"z872224025533_d3c741535a3d6e53fdc711185c1a8bb8.jpg\" border=\"0\" alt=\"z872224025533_d3c741535a3d6e53fdc711185c1a8bb8.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Mở đầu những tiếng cười n&oacute;i hổ hởi chuẩn bị cho một bữa tiệc hoành tráng, tiếp sau đó là một khoảng thời gian tĩnh lặng cùng nh&igrave;n những khó khăn, thành quả đạt được trong hai năm vừa qua và cùng nhau hướng đến một tương lai mới khi bước sang tuổi thứ ba.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/409/40998231cd3ddf3e98b019453b69463e.jpg\" title=\"z873375723605_4340b609f46b31b1ae716948ceb89c1e.jpg\" border=\"0\" alt=\"z873375723605_4340b609f46b31b1ae716948ceb89c1e.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Thay mặt toàn thể công ty Giám đốc công ty đã có một bài phát biểu với nội dung khẳng định thế mạnh của những dịch vụ công ty đang cung cấp trên thị trường hiện nay. Tiếp theo đó là những mục tiêu đặt ra trong năm tới, đạt được những thành tựu như đã đặt ra </div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/1a5/1a5c63581a5e7f6da7911b006bd28bec.jpg\" title=\"z873385778112_b79039b4e64033f7cd6c5fa0d8bf5fcb.jpg\" border=\"0\" alt=\"z873385778112_b79039b4e64033f7cd6c5fa0d8bf5fcb.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Với đội ngũ nhân viên trẻ trung năng động, 99% là thế hệ 9X nên không có gì làm khó được tinh thần tuổi trẻ, trên con đường thành công của công ty là những đóng góp vô cùng to lớn của những người mang tâm huyết của trẻ này.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/a13/a13549aa432cfef14b7f1a37aa7aed4d.jpg\" title=\"z873375748820_2cac92d774bb341f86698854a552c12c.jpg\" border=\"0\" alt=\"z873375748820_2cac92d774bb341f86698854a552c12c.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Bữa tiệc đã diễn ra với không kh&iacute; vui vẻ, hòa chung với niềm vui đó là những đại diện khách mời từ các đối tác, bạn b&egrave; chiến hữu gần xa cùng chúc nhau thêm những thành công mới, công ty lên một tầm cao mới </div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Lời cuối xin chúc cho toàn thể cán bộ nhân viên công ty luôn khỏe mạnh, tinh thần sảng khoái để hoàn thành công việc tốt nhất, phát triển bản thân mình một tầm cao mới.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Cùng nhau đưa công ty trở thành một trong những công ty đứng đầu về ngành vận tải trong thời gian tới.</div>\r\n','html','MỪNG SINH NHẬT AN PHÁT KHÁNH TRÒN 02 TUỔI\r\nTHỜI GIAN TRÔI QUA VÀ CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHÁT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHÂN VIÊN ĐÃ CÙNG NHAU ĐOÀN TỤ TỔNG KẾT, CHÚC MỪNG CÔNG TY TRÒN HAI TUỔI.\r\n\r\nTHỜI GIAN TR&OCIRC;I QUA V&AGRAVE; CHỨNG KIẾN NHỮNG ĐỔI THAY \r\nTRONG TỪNG BƯỚC ĐI CỦA AN PH&AACUTE;T KHÁNH. HÔM NAY NGÀY 04/1/2018 \r\nLÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ \r\nMỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NH&ACIRC;N VI&ECIRC;N Đ&ATILDE; \r\nC&UGRAVE;NG NHAU ĐOÀN TỤ TỔNG KẾT, CH&UACUTE;C MỪNG CÔNG TY TR&OGRAVE;N \r\nHAI TUỔI. \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/636/63632D22EB7D67BDD913A51A3C51EBFC.JPG ]\r\n \r\nMỞ ĐẦU NHỮNG TIẾNG CƯỜI N&OACUTE;I HỔ HỞI CHUẨN BỊ \r\nCHO MỘT BỮA TIỆC HOÀNH TRÁNG, TIẾP SAU ĐÓ LÀ MỘT KHOẢNG \r\nTHỜI GIAN TĨNH LẶNG CÙNG NH&IGRAVE;N NHỮNG KHÓ KHĂN, THÀNH QUẢ \r\nĐẠT ĐƯỢC TRONG HAI NĂM VỪA QUA VÀ CÙNG NHAU HƯỚNG ĐẾN \r\nMỘT TƯƠNG LAI MỚI KHI BƯỚC SANG TUỔI THỨ BA. \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/409/40998231CD3DDF3E98B019453B69463E.JPG ]\r\n \r\nTHAY MẶT TOÀN THỂ CÔNG TY GIÁM ĐỐC CÔNG TY ĐÃ CÓ MỘT BÀI \r\nPHÁT BIỂU VỚI NỘI DUNG KHẲNG ĐỊNH THẾ MẠNH CỦA NHỮNG \r\nDỊCH VỤ CÔNG TY ĐANG CUNG CẤP TRÊN THỊ TRƯỜNG HIỆN NAY. \r\nTIẾP THEO ĐÓ LÀ NHỮNG MỤC TIÊU ĐẶT RA TRONG NĂM TỚI, ĐẠT \r\nĐƯỢC NHỮNG THÀNH TỰU NHƯ ĐÃ ĐẶT RA  \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/1A5/1A5C63581A5E7F6DA7911B006BD28BEC.JPG ]\r\n \r\n\r\nVỚI ĐỘI NGŨ NHÂN VIÊN TRẺ TRUNG NĂNG ĐỘNG, 99% LÀ THẾ \r\nHỆ 9X NÊN KHÔNG CÓ GÌ LÀM KHÓ ĐƯỢC TINH THẦN TUỔI TRẺ, \r\nTRÊN CON ĐƯỜNG THÀNH CÔNG CỦA CÔNG TY LÀ NHỮNG ĐÓNG GÓP \r\nVÔ CÙNG TO LỚN CỦA NHỮNG NGƯỜI MANG TÂM HUYẾT CỦA TRẺ \r\nNÀY. \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/A13/A13549AA432CFEF14B7F1A37AA7AED4D.JPG ]\r\n \r\n\r\nBỮA TIỆC ĐÃ DIỄN RA VỚI KHÔNG KH&IACUTE; VUI VẺ, HÒA CHUNG \r\nVỚI NIỀM VUI ĐÓ LÀ NHỮNG ĐẠI DIỆN KHÁCH MỜI TỪ CÁC ĐỐI \r\nTÁC, BẠN B&EGRAVE; CHIẾN HỮU GẦN XA CÙNG CHÚC NHAU THÊM NHỮNG \r\nTHÀNH CÔNG MỚI, CÔNG TY LÊN MỘT TẦM CAO MỚI  LỜI CUỐI XIN \r\nCHÚC CHO TOÀN THỂ CÁN BỘ NHÂN VIÊN CÔNG TY LUÔN KHỎE MẠNH, \r\nTINH THẦN SẢNG KHOÁI ĐỂ HOÀN THÀNH CÔNG VIỆC TỐT NHẤT, \r\nPHÁT TRIỂN BẢN THÂN MÌNH MỘT TẦM CAO MỚI. CÙNG NHAU ĐƯA \r\nCÔNG TY TRỞ THÀNH MỘT TRONG NHỮNG CÔNG TY ĐỨNG ĐẦU VỀ NGÀNH \r\nVẬN TẢI TRONG THỜI GIAN TỚI.',1,NULL,NULL,NULL,NULL,NULL,'N','141','chuc-mung-sinh-nhat-02-tuoi','',NULL,NULL,10,'2018-03-31 00:56:57');
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_lock`
--

DROP TABLE IF EXISTS `b_iblock_element_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_lock`
--

LOCK TABLES `b_iblock_element_lock` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_property`
--

DROP TABLE IF EXISTS `b_iblock_element_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=764 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_property`
--

LOCK TABLES `b_iblock_element_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
INSERT INTO `b_iblock_element_property` VALUES (738,35,136,'6','text',6,NULL,NULL),(739,10,136,'134','text',NULL,134.0000,NULL),(740,12,136,'4','text',4,NULL,NULL),(741,13,136,'135','text',NULL,135.0000,NULL),(742,25,136,'tesst','text',NULL,0.0000,NULL),(743,36,137,'20.9895258,105.80014690000007','text',NULL,20.9895,NULL),(744,17,137,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL),(745,18,137,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL),(746,19,137,'2018-03-17 11:22:00','text',NULL,2018.0000,''),(747,20,137,'5','text',NULL,5.0000,NULL),(748,21,137,'Bất kỳ','text',NULL,0.0000,NULL),(749,23,137,'1','text',NULL,1.0000,NULL),(750,33,137,'200000','text',NULL,200000.0000,NULL),(751,37,137,'21.2187149,105.80417090000003','text',NULL,21.2187,NULL),(752,38,137,'9','text',9,NULL,NULL),(753,40,137,'30.781','text',NULL,30.7810,NULL),(754,34,138,'nguyen minh chinh','text',NULL,0.0000,NULL),(755,14,138,'0973870671','text',NULL,973870671.0000,NULL),(756,15,138,'net.ldvinci@gmail.com','text',NULL,0.0000,NULL),(757,16,138,'2','text',NULL,2.0000,''),(758,35,139,'6','text',6,NULL,NULL),(759,10,139,'137','text',NULL,137.0000,NULL),(760,12,139,'4','text',4,NULL,NULL),(761,13,139,'138','text',NULL,138.0000,NULL),(762,25,139,'583 nguyen trai','text',NULL,583.0000,NULL),(763,26,139,'tesst','text',NULL,0.0000,NULL),(724,36,134,'21.2187149,105.80417090000003','text',NULL,21.2187,NULL),(725,17,134,'Sân bay Nội Bài, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL),(726,18,134,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL),(727,19,134,'2018-02-08 22:49:00','text',NULL,2018.0000,''),(728,20,134,'Bất kỳ','text',NULL,0.0000,NULL),(729,21,134,'Bất kỳ','text',NULL,0.0000,NULL),(730,23,134,'1','text',NULL,1.0000,NULL),(731,33,134,'150000','text',NULL,150000.0000,NULL),(732,37,134,'20.9853673,105.79432350000002','text',NULL,20.9854,NULL),(733,38,134,'9','text',9,NULL,NULL),(734,40,134,'30.112','text',NULL,30.1120,NULL),(735,34,135,'tesst','text',NULL,0.0000,NULL),(736,14,135,'111','text',NULL,111.0000,NULL),(737,16,135,'2','text',NULL,2.0000,''),(723,25,133,'168 thái hà, hà nội','text',NULL,168.0000,NULL),(722,13,133,'132','text',NULL,132.0000,NULL),(721,12,133,'4','text',4,NULL,NULL),(720,10,133,'131','text',NULL,131.0000,NULL),(719,35,133,'6','text',6,NULL,NULL),(717,14,132,'090123123','text',NULL,90123123.0000,NULL),(718,16,132,'1','text',NULL,1.0000,''),(716,34,132,'Demo','text',NULL,0.0000,NULL),(715,40,131,'672.878','text',NULL,672.8780,NULL),(714,38,131,'9','text',9,NULL,NULL),(713,37,131,'21.0277644,105.83415979999995','text',NULL,21.0278,NULL),(712,33,131,'5000000','text',NULL,5000000.0000,NULL),(711,23,131,'1','text',NULL,1.0000,NULL),(710,21,131,'Bất kỳ','text',NULL,0.0000,NULL),(709,20,131,'Bất kỳ','text',NULL,0.0000,NULL),(706,17,131,'Huế, Thừa Thiên Huế, Việt Nam','text',NULL,0.0000,NULL),(707,18,131,'Hà Nội, Việt Nam','text',NULL,0.0000,NULL),(708,19,131,'2018-01-26 07:46:00','text',NULL,2018.0000,''),(697,34,129,'Demo','text',NULL,0.0000,NULL),(698,14,129,'090123123','text',NULL,90123123.0000,NULL),(699,16,129,'2','text',NULL,2.0000,''),(700,35,130,'6','text',6,NULL,NULL),(701,10,130,'128','text',NULL,128.0000,NULL),(702,12,130,'4','text',4,NULL,NULL),(703,13,130,'129','text',NULL,129.0000,NULL),(704,25,130,'ngo 168, ha noi','text',NULL,0.0000,NULL),(705,36,131,'16.4498,107.5623501','text',NULL,16.4498,NULL),(696,38,128,'9','text',9,NULL,NULL),(689,18,128,'Hà Nội, Việt Nam','text',NULL,0.0000,NULL),(690,19,128,'2018-01-26 07:42:00','text',NULL,2018.0000,''),(691,20,128,'Bất kỳ','text',NULL,0.0000,NULL),(692,21,128,'Bất kỳ','text',NULL,0.0000,NULL),(693,23,128,'1','text',NULL,1.0000,NULL),(694,33,128,'600000','text',NULL,600000.0000,NULL),(695,37,128,'21.0277644,105.83415979999995','text',NULL,21.0278,NULL),(687,36,128,'16.4498,107.5623501','text',NULL,16.4498,NULL),(688,17,128,'Huế, Thừa Thiên Huế, Việt Nam','text',NULL,0.0000,NULL),(685,26,127,'Don sớm','text',NULL,0.0000,NULL),(684,25,127,'Hoang Dieu','text',NULL,0.0000,NULL),(683,13,127,'126','text',NULL,126.0000,NULL),(682,12,127,'4','text',4,NULL,NULL),(681,10,127,'125','text',NULL,125.0000,NULL),(686,35,127,'7','text',7,NULL,NULL),(679,16,126,'1','text',NULL,1.0000,''),(678,15,126,'tram@yahoo.com','text',NULL,0.0000,NULL),(677,14,126,'0935011220','text',NULL,935011220.0000,NULL),(676,34,126,'Quynh Tram','text',NULL,0.0000,NULL),(675,40,125,'33.699','text',NULL,33.6990,NULL),(674,39,125,'7600','text',NULL,7600.0000,NULL),(673,38,125,'9','text',9,NULL,NULL),(672,33,125,'256000','text',NULL,256000.0000,NULL),(671,32,125,'82980','text',NULL,82980.0000,NULL),(653,10,124,'122','text',NULL,122.0000,NULL),(654,12,124,'4','text',4,NULL,NULL),(655,13,124,'123','text',NULL,123.0000,NULL),(656,25,124,'Nguyen van linh','text',NULL,0.0000,NULL),(659,17,125,'Sân bay Nội Bài, Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL),(660,18,125,'An Phát Khánh, Ngõ 583 - Nguyễn Trãi, P. Văn Quán, Hanoi, Vietnam','text',NULL,0.0000,NULL),(661,19,125,'2018-01-24 08:52:00','text',NULL,2018.0000,''),(662,20,125,'4','text',NULL,4.0000,NULL),(663,21,125,'Kia','text',NULL,0.0000,NULL),(664,22,125,'Trắng','text',NULL,0.0000,NULL),(665,23,125,'1','text',NULL,1.0000,NULL),(666,24,125,'Quỳnh Trâm','text',NULL,0.0000,NULL),(667,28,125,'256000','text',NULL,256000.0000,NULL),(668,29,125,'Morning','text',NULL,0.0000,NULL),(669,30,125,'Sedan','text',NULL,0.0000,NULL),(670,31,125,'316','text',NULL,316.0000,NULL),(658,35,124,'8','text',8,NULL,NULL),(646,37,122,'20.984868,105.795793','text',NULL,20.9849,NULL),(651,16,123,'2','text',NULL,2.0000,''),(650,15,123,'hung@yahoo.com','text',NULL,0.0000,NULL),(649,14,123,'0935509900','text',NULL,935509900.0000,NULL),(648,34,123,'Dao Quang Hung','text',NULL,0.0000,NULL),(647,38,122,'9','text',9,NULL,NULL),(645,33,122,'235000','text',NULL,235000.0000,NULL),(644,23,122,'2','text',NULL,2.0000,NULL),(643,21,122,'Bất kỳ','text',NULL,0.0000,NULL),(642,20,122,'Bất kỳ','text',NULL,0.0000,NULL),(641,19,122,'2018-01-24 08:52:00','text',NULL,2018.0000,''),(640,18,122,'An Phát Khánh, Ngõ 583 - Nguyễn Trãi, P. Văn Quán, Hanoi, Vietnam','text',NULL,0.0000,NULL),(639,17,122,'Sân bay Nội Bài, Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL),(638,36,122,'21.2187149,105.80417090000003','text',NULL,21.2187,NULL);
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_fields`
--

DROP TABLE IF EXISTS `b_iblock_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_fields`
--

LOCK TABLES `b_iblock_fields` WRITE;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'SECTION_XML_ID','N',''),(5,'SECTION_DESCRIPTION_TYPE','Y','text'),(5,'SECTION_DESCRIPTION','N',''),(5,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(5,'SECTION_NAME','Y',''),(5,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(5,'TAGS','N',''),(5,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(5,'XML_ID','N',''),(5,'DETAIL_TEXT','N',''),(5,'PREVIEW_TEXT','N',''),(5,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(5,'DETAIL_TEXT_TYPE','Y','text'),(5,'PREVIEW_TEXT_TYPE','Y','text'),(5,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(5,'NAME','Y',''),(5,'SORT','N','0'),(5,'ACTIVE_TO','N',''),(5,'ACTIVE_FROM','N',''),(5,'ACTIVE','Y','Y'),(5,'IBLOCK_SECTION','N',''),(6,'IBLOCK_SECTION','N',''),(6,'ACTIVE','Y','Y'),(6,'ACTIVE_FROM','N',''),(6,'ACTIVE_TO','N',''),(6,'SORT','N','0'),(6,'NAME','Y',''),(6,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(6,'PREVIEW_TEXT_TYPE','Y','text'),(6,'PREVIEW_TEXT','N',''),(6,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(6,'DETAIL_TEXT_TYPE','Y','text'),(6,'DETAIL_TEXT','N',''),(6,'XML_ID','N',''),(6,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(6,'TAGS','N',''),(6,'SECTION_NAME','Y',''),(6,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(6,'SECTION_DESCRIPTION_TYPE','Y','text'),(6,'SECTION_DESCRIPTION','N',''),(6,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(6,'SECTION_XML_ID','N',''),(6,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(7,'IBLOCK_SECTION','N',''),(7,'ACTIVE','Y','Y'),(7,'ACTIVE_FROM','N',''),(7,'ACTIVE_TO','N',''),(7,'SORT','N','0'),(7,'NAME','Y',''),(7,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(7,'PREVIEW_TEXT_TYPE','Y','text'),(7,'PREVIEW_TEXT','N',''),(7,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(7,'DETAIL_TEXT_TYPE','Y','text'),(7,'DETAIL_TEXT','N',''),(7,'XML_ID','N',''),(7,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(7,'TAGS','N',''),(7,'SECTION_NAME','Y',''),(7,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(7,'SECTION_DESCRIPTION_TYPE','Y','text'),(7,'SECTION_DESCRIPTION','N',''),(7,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(7,'SECTION_XML_ID','N',''),(7,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(8,'IBLOCK_SECTION','N',''),(8,'ACTIVE','Y','Y'),(8,'ACTIVE_FROM','N',''),(8,'ACTIVE_TO','N',''),(8,'SORT','N','0'),(8,'NAME','Y',''),(8,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(8,'PREVIEW_TEXT_TYPE','Y','text'),(8,'PREVIEW_TEXT','N',''),(8,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(8,'DETAIL_TEXT_TYPE','Y','text'),(8,'DETAIL_TEXT','N',''),(8,'XML_ID','N',''),(8,'CODE','Y','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(8,'TAGS','N',''),(8,'SECTION_NAME','Y',''),(8,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(8,'SECTION_DESCRIPTION_TYPE','Y','text'),(8,'SECTION_DESCRIPTION','N',''),(8,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(8,'SECTION_XML_ID','N',''),(8,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(9,'IBLOCK_SECTION','N',''),(9,'ACTIVE','Y','Y'),(9,'ACTIVE_FROM','N',''),(9,'ACTIVE_TO','N',''),(9,'SORT','N','0'),(9,'NAME','Y',''),(9,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(9,'PREVIEW_TEXT_TYPE','Y','text'),(9,'PREVIEW_TEXT','N',''),(9,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(9,'DETAIL_TEXT_TYPE','Y','text'),(9,'DETAIL_TEXT','N',''),(9,'XML_ID','N',''),(9,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(9,'TAGS','N',''),(9,'SECTION_NAME','Y',''),(9,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(9,'SECTION_DESCRIPTION_TYPE','Y','text'),(9,'SECTION_DESCRIPTION','N',''),(9,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(9,'SECTION_XML_ID','N',''),(9,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(10,'IBLOCK_SECTION','N',''),(10,'ACTIVE','Y','Y'),(10,'ACTIVE_FROM','N',''),(10,'ACTIVE_TO','N',''),(10,'SORT','N','0'),(10,'NAME','Y',''),(10,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(10,'PREVIEW_TEXT_TYPE','Y','text'),(10,'PREVIEW_TEXT','N',''),(10,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(10,'DETAIL_TEXT_TYPE','Y','text'),(10,'DETAIL_TEXT','N',''),(10,'XML_ID','N',''),(10,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(10,'TAGS','N',''),(10,'SECTION_NAME','Y',''),(10,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(10,'SECTION_DESCRIPTION_TYPE','Y','text'),(10,'SECTION_DESCRIPTION','N',''),(10,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}'),(10,'SECTION_XML_ID','N',''),(10,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_group`
--

DROP TABLE IF EXISTS `b_iblock_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_group`
--

LOCK TABLES `b_iblock_group` WRITE;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` VALUES (5,1,'X'),(5,2,'R'),(6,2,'R'),(6,1,'X'),(7,2,'R'),(7,1,'X'),(8,2,'R'),(8,1,'X'),(9,2,'R'),(9,1,'X'),(10,2,'R'),(10,1,'X'),(9,3,'X');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_messages`
--

DROP TABLE IF EXISTS `b_iblock_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_messages`
--

LOCK TABLES `b_iblock_messages` WRITE;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` VALUES (5,'SECTION_DELETE','Delete section'),(5,'SECTION_EDIT','Modify section'),(5,'SECTION_ADD','Add section'),(5,'SECTIONS_NAME','Sections'),(5,'SECTION_NAME','Section'),(5,'ELEMENT_DELETE','Delete element'),(5,'ELEMENT_EDIT','Modify element'),(5,'ELEMENT_ADD','Add element'),(5,'ELEMENTS_NAME','Elements'),(5,'ELEMENT_NAME','Element'),(6,'SECTION_EDIT','Modify section'),(6,'SECTION_DELETE','Delete section'),(6,'SECTION_ADD','Add section'),(6,'SECTIONS_NAME','Sections'),(6,'ELEMENT_DELETE','Delete element'),(6,'SECTION_NAME','Section'),(6,'ELEMENT_EDIT','Modify element'),(6,'ELEMENT_ADD','Add element'),(6,'ELEMENTS_NAME','Elements'),(6,'ELEMENT_NAME','Element'),(7,'SECTION_DELETE','Delete section'),(7,'SECTION_EDIT','Modify section'),(7,'SECTION_ADD','Add section'),(7,'SECTIONS_NAME','Sections'),(7,'SECTION_NAME','Section'),(7,'ELEMENT_DELETE','Delete element'),(7,'ELEMENT_EDIT','Modify element'),(7,'ELEMENT_ADD','Add element'),(7,'ELEMENTS_NAME','Elements'),(7,'ELEMENT_NAME','Element'),(8,'SECTION_DELETE','Delete section'),(8,'SECTION_EDIT','Modify section'),(8,'SECTION_ADD','Add section'),(8,'SECTIONS_NAME','Sections'),(8,'SECTION_NAME','Section'),(8,'ELEMENT_DELETE','Delete element'),(8,'ELEMENT_EDIT','Modify element'),(8,'ELEMENT_ADD','Add element'),(8,'ELEMENTS_NAME','Elements'),(8,'ELEMENT_NAME','Element'),(9,'SECTION_DELETE','Delete section'),(9,'SECTION_EDIT','Modify section'),(9,'SECTION_ADD','Add section'),(9,'SECTIONS_NAME','Sections'),(9,'SECTION_NAME','Section'),(9,'ELEMENT_DELETE','Delete element'),(9,'ELEMENT_EDIT','Modify element'),(9,'ELEMENT_ADD','Add element'),(9,'ELEMENTS_NAME','Elements'),(9,'ELEMENT_NAME','Element'),(10,'ELEMENT_NAME','Element'),(10,'ELEMENTS_NAME','Elements'),(10,'ELEMENT_ADD','Add element'),(10,'ELEMENT_EDIT','Modify element'),(10,'ELEMENT_DELETE','Delete element'),(10,'SECTION_NAME','Section'),(10,'SECTIONS_NAME','Sections'),(10,'SECTION_ADD','Add section'),(10,'SECTION_EDIT','Modify section'),(10,'SECTION_DELETE','Delete section');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property`
--

DROP TABLE IF EXISTS `b_iblock_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property`
--

LOCK TABLES `b_iblock_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
INSERT INTO `b_iblock_property` VALUES (36,'2017-12-12 06:25:58',7,'Tọa độ điểm đi','Y',500,'TOA_DO_DIEM_DON','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(35,'2017-12-12 02:17:00',5,'Trạng thái','Y',500,'TRANG_THAI','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(10,'2017-12-08 06:44:03',5,'Thông tin chuyến','Y',500,'CHUYEN_ID','','E',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(12,'2017-12-08 06:44:55',5,'Hình thức thanh toán','Y',500,'HINH_THUC_TT','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(34,'2017-12-12 01:38:51',6,'Họ và tên','Y',500,'FULL_NAME','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(13,'2017-12-08 06:46:21',5,'Thông tin khách hàng','Y',500,'KHACH_HANG_ID','','E',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(14,'2017-12-12 01:12:39',6,'Điện thoại','Y',500,'PHONE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(15,'2017-12-08 06:47:38',6,'Email','Y',500,'EMAIL','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(16,'2017-12-08 06:48:00',6,'Người dùng hệ thống','Y',500,'USER_ID',NULL,'S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,'UserID',NULL),(17,'2017-12-12 01:05:44',7,'Điểm đi','Y',500,'DIA_DIEM_DON','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(18,'2017-12-12 01:05:44',7,'Điểm đến','Y',500,'DIA_DIEM_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(19,'2017-12-08 06:51:32',7,'Thời gian','Y',500,'THOI_GIAN',NULL,'S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,'DateTime',NULL),(20,'2017-12-08 06:51:32',7,'Số chỗ ngồi','Y',500,'SO_CHO_NGOI','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(21,'2017-12-12 01:05:44',7,'Hãng xe','Y',500,'HANG_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(22,'2017-12-08 06:52:23',7,'Màu xe','Y',500,'MAU_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(23,'2017-12-08 06:52:23',7,'Số lượng khách','Y',500,'SO_LUONG','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(24,'2017-12-12 01:07:02',7,'Tài xế','Y',500,'TAI_XE_NAME','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(25,'2017-12-12 01:11:24',5,'Địa chỉ trả chi tiết','Y',500,'DIA_CHI_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(26,'2017-12-12 00:48:56',5,'Ghi chú','Y',500,'GHI_CHU','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(27,'2017-12-12 01:11:24',5,'Muốn đăng ký ?','Y',500,'DANG_KY_THANH_VIEN','','L',1,30,'C','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(28,'2017-12-12 01:09:15',7,'Giá chuẩn','Y',500,'GIA_CHUAN','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(29,'2017-12-12 01:05:44',7,'Loại xe','Y',500,'LOAI_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(30,'2017-12-12 01:07:02',7,'Kiểu xe','Y',500,'KIEU_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(31,'2017-12-12 01:07:02',7,'Tài xế ID','Y',500,'TAI_XE_ID','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(32,'2017-12-12 01:07:02',7,'Xe ID','Y',500,'XE_ID','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(33,'2017-12-12 01:09:15',7,'Giá yêu cầu','Y',500,'GIA_YEU_CAU','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(37,'2017-12-12 06:25:58',7,'Tọa đổ điểm đến','Y',500,'TOA_DO_DIEM_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(38,'2017-12-12 06:28:22',7,'Trạng thái','Y',500,'TRANG_THAI','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(39,'2017-12-14 09:04:45',7,'Giá thu mỗi km','Y',500,'GIA_MOT_KM','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL),(40,'2017-12-14 09:04:45',7,'Khoảng cách','Y',500,'KHOANG_CACH','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property_enum`
--

DROP TABLE IF EXISTS `b_iblock_property_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property_enum`
--

LOCK TABLES `b_iblock_property_enum` WRITE;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
INSERT INTO `b_iblock_property_enum` VALUES (4,12,'Trả sau','N',500,'tra_sau',NULL),(5,27,'Y','N',500,'f32a1f4cd6aa30649271bddfd3498ab2',NULL),(6,35,'Đang chờ xác nhận','N',500,'confirm',NULL),(7,35,'APK Đã xác nhận','N',500,'confirmed',NULL),(8,35,'Hủy chuyến','N',500,'cancel',NULL),(9,38,'Chưa xuất phát','N',500,'chua_bat_dau',NULL),(10,38,'Đang chạy','N',500,'dang_chay',NULL),(11,38,'Hủy chạy','N',500,'huy_chay',NULL),(12,38,'Kết thúc','N',500,'ket_thuc',NULL),(13,38,'Đã xác nhận','N',500,'da_xac_nhan',NULL);
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_rss`
--

DROP TABLE IF EXISTS `b_iblock_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_rss`
--

LOCK TABLES `b_iblock_rss` WRITE;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section`
--

DROP TABLE IF EXISTS `b_iblock_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section`
--

LOCK TABLES `b_iblock_section` WRITE;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_element`
--

DROP TABLE IF EXISTS `b_iblock_section_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_element`
--

LOCK TABLES `b_iblock_section_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_sequence`
--

DROP TABLE IF EXISTS `b_iblock_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_sequence`
--

LOCK TABLES `b_iblock_sequence` WRITE;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_site`
--

DROP TABLE IF EXISTS `b_iblock_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_site`
--

LOCK TABLES `b_iblock_site` WRITE;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` VALUES (5,'s1'),(6,'s1'),(7,'s1'),(8,'s1'),(9,'s1'),(10,'s1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type`
--

DROP TABLE IF EXISTS `b_iblock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type`
--

LOCK TABLES `b_iblock_type` WRITE;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` VALUES ('vn','Y','','','N',500);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type_lang`
--

DROP TABLE IF EXISTS `b_iblock_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type_lang`
--

LOCK TABLES `b_iblock_type_lang` WRITE;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` VALUES ('vn','en','Tieng Viet','','');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang`
--

DROP TABLE IF EXISTS `b_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang`
--

LOCK TABLES `b_lang` WRITE;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` VALUES ('s1',1,'Y','Y','Web Go','/','DD/MM/YYYY','DD/MM/YYYY HH:MI:SS','UTF-8','en','','N','','Web Go','');
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang_domain`
--

DROP TABLE IF EXISTS `b_lang_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang_domain`
--

LOCK TABLES `b_lang_domain` WRITE;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_language`
--

DROP TABLE IF EXISTS `b_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_language`
--

LOCK TABLES `b_language` WRITE;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` VALUES ('en',1,'Y','Y','English','MM/DD/YYYY','MM/DD/YYYY HH:MI:SS','UTF-8','Y');
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection`
--

DROP TABLE IF EXISTS `b_medialib_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection`
--

LOCK TABLES `b_medialib_collection` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
INSERT INTO `b_medialib_collection` VALUES (1,'TuyenDung','','Y','2018-03-31 00:59:43',1,0,NULL,'',NULL,1);
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection_item`
--

DROP TABLE IF EXISTS `b_medialib_collection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection_item`
--

LOCK TABLES `b_medialib_collection_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
INSERT INTO `b_medialib_collection_item` VALUES (1,1);
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_item`
--

DROP TABLE IF EXISTS `b_medialib_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_item`
--

LOCK TABLES `b_medialib_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
INSERT INTO `b_medialib_item` VALUES (1,'DoiNgu.jpg','','','2018-03-31 00:59:51','2018-03-31 00:59:51',40,'','{DOINGU}{JPG}');
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_type`
--

DROP TABLE IF EXISTS `b_medialib_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_type`
--

LOCK TABLES `b_medialib_type` WRITE;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` VALUES (1,'image_name','image','jpg,jpeg,gif,png','Y','image_desc'),(2,'video_name','video','flv,mp4,wmv','Y','video_desc'),(3,'sound_name','sound','mp3,wma,aac','Y','sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module`
--

DROP TABLE IF EXISTS `b_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module`
--

LOCK TABLES `b_module` WRITE;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` VALUES ('main','2010-11-08 05:08:16'),('compression','2010-11-08 05:08:49'),('fileman','2010-11-08 05:08:52'),('iblock','2010-11-08 05:09:13'),('perfmon','2010-11-08 05:09:43'),('search','2010-11-08 05:09:47'),('seo','2010-11-08 05:09:52'),('sitecorporate','2010-11-08 05:09:57');
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_group`
--

DROP TABLE IF EXISTS `b_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_group`
--

LOCK TABLES `b_module_group` WRITE;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
INSERT INTO `b_module_group` VALUES (3,'perfmon',3,'R'),(2,'main',3,'W'),(4,'sitecorporate',3,'R');
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_to_module`
--

DROP TABLE IF EXISTS `b_module_to_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`,`MESSAGE_ID`,`TO_MODULE_ID`,`TO_CLASS`,`TO_METHOD`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_to_module`
--

LOCK TABLES `b_module_to_module` WRITE;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` VALUES (1,'2010-11-08 05:08:16',100,'iblock','OnIBlockPropertyBuildList','main','/modules/main/tools/prop_userid.php','CIBlockPropertyUserID','GetUserTypeDescription',''),(2,'2010-11-08 05:08:16',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnUserDelete',''),(3,'2010-11-08 05:08:16',100,'main','OnLanguageDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnLanguageDelete',''),(4,'2010-11-08 05:08:16',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CUserOptions','OnUserDelete',''),(5,'2010-11-08 05:08:16',100,'main','OnChangeFile','main','','CMain','OnChangeFileComponent',''),(6,'2010-11-08 05:08:16',100,'main','OnUserTypeRightsCheck','main','','CUser','UserTypeRightsCheck',''),(7,'2010-11-08 05:08:16',100,'main','OnUserLogin','main','','UpdateTools','CheckUpdates',''),(8,'2010-11-08 05:08:16',100,'main','OnModuleUpdate','main','','UpdateTools','SetUpdateResult',''),(9,'2010-11-08 05:08:16',100,'main','OnUpdateCheck','main','','UpdateTools','SetUpdateError',''),(10,'2010-11-08 05:08:16',100,'main','OnPanelCreate','main','','CUndo','CheckNotifyMessage',''),(11,'2010-11-08 05:08:49',1,'main','OnPageStart','compression','','CCompress','OnPageStart',''),(12,'2010-11-08 05:08:49',10000,'main','OnAfterEpilog','compression','','CCompress','OnAfterEpilog',''),(13,'2010-11-08 05:08:52',100,'main','OnGroupDelete','fileman','','CFileman','OnGroupDelete',''),(14,'2010-11-08 05:08:52',100,'main','OnPanelCreate','fileman','','CFileman','OnPanelCreate',''),(15,'2010-11-08 05:08:52',100,'main','OnModuleUpdate','fileman','','CFileman','OnModuleUpdate',''),(16,'2010-11-08 05:08:52',100,'main','OnModuleInstalled','fileman','','CFileman','ClearComponentsListCache',''),(17,'2010-11-08 05:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapGoogle','GetUserTypeDescription',''),(18,'2010-11-08 05:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapYandex','GetUserTypeDescription',''),(19,'2010-11-08 05:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyVideo','GetUserTypeDescription',''),(20,'2010-11-08 05:08:52',100,'main','OnUserTypeBuildList','fileman','','CUserTypeVideo','GetUserTypeDescription',''),(21,'2010-11-08 05:09:13',100,'main','OnGroupDelete','iblock','','CIBlock','OnGroupDelete',''),(22,'2010-11-08 05:09:13',100,'main','OnBeforeLangDelete','iblock','','CIBlock','OnBeforeLangDelete',''),(23,'2010-11-08 05:09:13',100,'main','OnLangDelete','iblock','','CIBlock','OnLangDelete',''),(24,'2010-11-08 05:09:13',100,'main','OnUserTypeRightsCheck','iblock','','CIBlockSection','UserTypeRightsCheck',''),(25,'2010-11-08 05:09:13',100,'search','OnReindex','iblock','','CIBlock','OnSearchReindex',''),(26,'2010-11-08 05:09:13',100,'search','OnSearchGetURL','iblock','','CIBlock','OnSearchGetURL',''),(27,'2010-11-08 05:09:47',100,'main','OnChangePermissions','search','','CSearch','OnChangeFilePermissions',''),(28,'2010-11-08 05:09:47',100,'main','OnChangeFile','search','','CSearch','OnChangeFile',''),(29,'2010-11-08 05:09:47',100,'main','OnGroupDelete','search','','CSearch','OnGroupDelete',''),(30,'2010-11-08 05:09:47',100,'main','OnLangDelete','search','','CSearch','OnLangDelete',''),(31,'2010-11-08 05:09:47',90,'main','OnEpilog','search','','CSearchStatistic','OnEpilog',''),(32,'2010-11-08 05:09:52',100,'main','OnPanelCreate','seo','','CSeoEventHandlers','SeoOnPanelCreate',''),(33,'2010-11-08 05:09:57',100,'main','OnBeforeProlog','sitecorporate','','CSiteCorporate','ShowPanel',''),(34,'2010-11-08 05:10:50',100,'main','OnBeforeProlog','main','/modules/main/install/wizard_sol/panel_button.php','CWizardSolPanel','ShowPanel','');
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_operation`
--

DROP TABLE IF EXISTS `b_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_operation`
--

LOCK TABLES `b_operation` WRITE;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` VALUES (1,'view_own_profile','main',NULL,'module'),(2,'view_subordinate_users','main',NULL,'module'),(3,'view_all_users','main',NULL,'module'),(4,'view_groups','main',NULL,'module'),(5,'view_tasks','main',NULL,'module'),(6,'view_other_settings','main',NULL,'module'),(7,'edit_own_profile','main',NULL,'module'),(8,'edit_all_users','main',NULL,'module'),(9,'edit_subordinate_users','main',NULL,'module'),(10,'edit_groups','main',NULL,'module'),(11,'edit_tasks','main',NULL,'module'),(12,'edit_other_settings','main',NULL,'module'),(13,'cache_control','main',NULL,'module'),(14,'edit_php','main',NULL,'module'),(15,'fm_view_permission','main',NULL,'file'),(16,'fm_edit_permission','main',NULL,'file'),(17,'fm_edit_existent_folder','main',NULL,'file'),(18,'fm_create_new_file','main',NULL,'file'),(19,'fm_edit_existent_file','main',NULL,'file'),(20,'fm_create_new_folder','main',NULL,'file'),(21,'fm_delete_file','main',NULL,'file'),(22,'fm_delete_folder','main',NULL,'file'),(23,'fm_view_file','main',NULL,'file'),(24,'fm_view_listing','main',NULL,'file'),(25,'fm_edit_in_workflow','main',NULL,'file'),(26,'fm_rename_file','main',NULL,'file'),(27,'fm_rename_folder','main',NULL,'file'),(28,'fm_upload_file','main',NULL,'file'),(29,'fm_add_to_menu','main',NULL,'file'),(30,'fm_download_file','main',NULL,'file'),(31,'fm_lpa','main',NULL,'file'),(32,'lpa_template_edit','main',NULL,'module'),(33,'view_event_log','main',NULL,'module'),(34,'fileman_view_all_settings','fileman','','module'),(35,'fileman_edit_menu_types','fileman','','module'),(36,'fileman_add_element_to_menu','fileman','','module'),(37,'fileman_edit_menu_elements','fileman','','module'),(38,'fileman_edit_existent_files','fileman','','module'),(39,'fileman_edit_existent_folders','fileman','','module'),(40,'fileman_admin_files','fileman','','module'),(41,'fileman_admin_folders','fileman','','module'),(42,'fileman_view_permissions','fileman','','module'),(43,'fileman_edit_all_settings','fileman','','module'),(44,'fileman_upload_files','fileman','','module'),(45,'fileman_view_file_structure','fileman','','module'),(46,'fileman_install_control','fileman','','module'),(47,'medialib_view_collection','fileman','','medialib'),(48,'medialib_new_collection','fileman','','medialib'),(49,'medialib_edit_collection','fileman','','medialib'),(50,'medialib_del_collection','fileman','','medialib'),(51,'medialib_access','fileman','','medialib'),(52,'medialib_new_item','fileman','','medialib'),(53,'medialib_edit_item','fileman','','medialib'),(54,'medialib_del_item','fileman','','medialib'),(55,'seo_settings','seo','','module'),(56,'seo_tools','seo','','module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option`
--

DROP TABLE IF EXISTS `b_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option`
--

LOCK TABLES `b_option` WRITE;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` VALUES ('main','auth_comp2','Y','Use Components 2.0 for authorization and registration:',NULL),('main','PARAM_MAX_SITES','2','',NULL),('main','PARAM_MAX_USERS','0','',NULL),('main','distributive6','Y','',NULL),('main','new_license7_sign','Y','',NULL),('main','GROUP_DEFAULT_TASK','1','Task for groups by default',NULL),('main','vendor','bitrix','',NULL),('main','admin_lid','en','',NULL),('main','update_site','www.bitrixsoft.com','Name of system update server:',NULL),('main','update_site_ns','Y','',NULL),('main','server_uniq_id','961954a83f50903dc1616f729ece7ad7','',NULL),('main','email_from','dqhung.ec@gmail.com','E-mail of the site administrator (default sender address)',NULL),('fileman','different_set','Y','',NULL),('fileman','menutypes','a:3:{s:4:\\\"left\\\";s:12:\\\"Section menu\\\";s:3:\\\"top\\\";s:9:\\\"Main menu\\\";s:6:\\\"bottom\\\";s:11:\\\"Bottom Menu\\\";}','','s1'),('main','wizard_template_id','furniture','','s1'),('main','wizard_site_logo','0','','s1'),('main','wizard_furniture_theme_id','dark-blue','','s1'),('main','wizard_firstcorp_furniture_s1','Y','',NULL),('main','wizard_solution','corp_furniture','','s1'),('main','site_name','Webmin','Site name',NULL),('main','server_name','localhost','Site URL (without http://). E.g., www.mysite.com',NULL),('main','cookie_name','BITRIX_SM','Cookies name prefix (without dots and spaces):',NULL),('main','ALLOW_SPREAD_COOKIE','Y','Spread cookies to all sites:',NULL),('main','header_200','N','Replace status 404 with 200 in header:',NULL),('main','error_reporting','85','Error report mode:',NULL),('main','templates_visual_editor','N','Use WYSIWYG editor for Site Templates:',NULL),('main','all_bcc','','One or comma-separated list of E-mail addresses to receive copies of all outcoming messages',NULL),('main','send_mid','N','Send email event and template identifiers in message:',NULL),('main','fill_to_mail','N','E-mail address in caption',NULL),('main','CONVERT_UNIX_NEWLINE_2_WINDOWS','N','Convert Unix new lines to Windows format when sending messages:',NULL),('main','convert_mail_header','Y','Convert 8-bit characters in the message header:',NULL),('main','mail_event_period','14','Days to keep e-mail events:',NULL),('main','mail_event_bulk','5','Messages to send at a page request:',NULL),('main','mail_additional_parameters','','Additional parameter for mail() function:',NULL),('main','disk_space','','Available disk space (MB):',NULL),('main','upload_dir','upload','File upload default folder',NULL),('main','save_original_file_name','N','Keep the original names for uploaded files:',NULL),('main','convert_original_file_name','Y','Automatically replace non-valid symbols in the names of uploaded files:',NULL),('main','image_resize_quality','95','JPEG compression quality (percentage):',NULL),('main','map_top_menu_type','top','Menu type for the top level of the site map:',NULL),('main','map_left_menu_type','left','Menu type for other levels of the site map:',NULL),('main','update_site_proxy_addr','','Proxy address for update system:',NULL),('main','update_site_proxy_port','','Proxy port for update system:',NULL),('main','update_site_proxy_user','admin','Proxy user name (if auth requied)',NULL),('main','update_site_proxy_pass','123456','Proxy user password (if auth requied)',NULL),('main','strong_update_check','Y','Stress checking the integrity of the updates installation:',NULL),('main','stable_versions_only','Y','Download only stable updates:',NULL),('main','update_autocheck','','Autocheck For Updates:',NULL),('main','update_stop_autocheck','N','Abort Authocheck When Error(s) Occur:',NULL),('main','update_is_gzip_installed','Y','Don\'t Use Compression:',NULL),('main','update_load_timeout','30','Download Step Duration (sec):',NULL),('main','store_password','Y','Allow authorization caching:',NULL),('main','use_secure_password_cookies','N','Use secure storing of the authorization data in cookies:',NULL),('main','auth_multisite','N','Global authentication for all site domains:',NULL),('main','captcha_registration','N','Use CAPTCHA:',NULL),('main','auth_openid','N','Use OpenID',NULL),('main','auth_liveid','N','Use Live ID authentication:',NULL),('main','liveid_appid','','Live ID Application ID:',NULL),('main','liveid_secret','','Live ID Secret Key:',NULL),('main','new_user_registration','Y','Allow users to self-register?',NULL),('main','new_user_registration_def_group','','Upon registration, add to group:',NULL),('main','new_user_registration_email_confirmation','N','Send request for registration confirmation:</label><br><a href=\"/webmin/admin/message_admin.php?lang=en&set_filter=Y&find_type_id=NEW_USER_CONFIRM\">Edit e-mail templates</a><label>',NULL),('main','new_user_registration_cleanup_days','7','Delete unconfirmed registrations after (days):',NULL),('main','new_user_email_uniq_check','N','Check e-mail uniqueness:',NULL),('main','event_log_cleanup_days','7','Keep events (days):',NULL),('main','event_log_logout','N','Logout',NULL),('main','event_log_login_success','N','Successful login',NULL),('main','event_log_login_fail','N','Login failure',NULL),('main','event_log_register','N','Log new user registrations',NULL),('main','event_log_register_fail','N','Log registration errors',NULL),('main','event_log_password_request','N','Log password change requests',NULL),('main','event_log_password_change','N','Log password changes',NULL),('main','event_log_user_delete','N','Log user deletion',NULL),('main','event_log_user_groups','N','Log user group changes',NULL),('main','event_log_group_policy','N','Log group security policy changes',NULL),('main','event_log_module_access','N','Log module access permission changes',NULL),('main','event_log_file_access','N','Log file access permission changes',NULL),('main','event_log_task','N','Log access permission changes',NULL),('main','auth_controller_prefix','','Controller side authorization prefix:',NULL),('main','auth_controller_sso','N','Authorize users of other client sites at this site:',NULL),('main','GROUP_DEFAULT_RIGHT','D','Right for groups by default',NULL),('main','~update_autocheck_result','a:3:{s:10:\"check_date\";i:0;s:6:\"result\";b:0;s:5:\"error\";s:44:\"[LICENSE_NOT_FOUND] License key is not found\";}','',NULL),('main','update_system_check','11/30/2015 10:37:35','',NULL),('main','dump_max_exec_time_sleep','3','',NULL),('main','dump_disable_gzip','N','',NULL),('main','dump_integrity_check','Y','',NULL),('main','dump_max_file_size','0','',NULL),('main','dump_max_exec_time','20','',NULL),('main','dump_file_public','Y','',NULL),('main','dump_file_kernel','Y','',NULL),('main','dump_base_true','Y','',NULL),('main','dump_base_stat','','',NULL),('main','dump_base_index','','',NULL),('main','skip_symlinks','Y','',NULL),('main','skip_mask','','',NULL),('iblock','use_htmledit','Y','Use visual editor',NULL),('iblock','show_xml_id','','Show code from external DB source',NULL),('iblock','path2rss','/upload/','Path to exported RSS files',NULL),('iblock','combined_list_mode','Y','Combined view of sections and elements',NULL),('iblock','iblock_menu_max_sections','50','Maximum number of sections in menu',NULL),('perfmon','bitrix_optimal','N','',NULL),('perfmon','total_mark_value','calc','',NULL),('perfmon','total_mark_duration','300','',NULL),('perfmon','mark_php_page_rate','0.86','',NULL),('perfmon','mark_php_page_time','1.1679','',NULL),('perfmon','mark_php_session_time_value','0.0005','',NULL),('perfmon','mark_php_mail_value','0.7656','',NULL),('perfmon','mark_php_files_value','1 000.0','',NULL),('perfmon','mark_php_cpu_value','10.9','',NULL),('perfmon','total_mark_time','01/04/2016 08:25:10','',NULL),('perfmon','total_mark_hits','0','',NULL),('perfmon','end_time','1451892610','',NULL),('perfmon','mark_php_page_date','22.03.2016 17:25:51','',NULL),('perfmon','mark_php_is_good','N','',NULL),('perfmon','mark_db_insert_value','7 131','',NULL),('perfmon','mark_db_read_value','6 274','',NULL),('perfmon','mark_db_update_value','6 848','',NULL),('main','component_cache_on','N','',NULL),('fileman','use_pspell','N','',NULL),('fileman','GROUP_DEFAULT_TASK','12','',NULL),('search','sm_max_execution_time','30','',NULL),('search','sm_record_limit','5000','',NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_component`
--

DROP TABLE IF EXISTS `b_perf_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_component`
--

LOCK TABLES `b_perf_component` WRITE;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_error`
--

DROP TABLE IF EXISTS `b_perf_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_error`
--

LOCK TABLES `b_perf_error` WRITE;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_hit`
--

DROP TABLE IF EXISTS `b_perf_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_hit`
--

LOCK TABLES `b_perf_hit` WRITE;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
INSERT INTO `b_perf_hit` VALUES (1,'2016-01-04 14:25:37','Y','GET','demo.dev',80,'/bitrix/admin/user_admin.php','/bitrix/admin/user_admin.php?lang=en',154,8296664,'Y',34341,14,0.0293114,0,0,'Y',1.45017,1.4012,1.2953,0.00658989,0.112528,0.0286291,0.01371,0.00269794,0.0001688,0.0108433,0),(2,'2016-01-04 14:25:37','Y','GET','demo.dev',80,'/bitrix/admin/user_options.php','/bitrix/admin/user_options.php?p[0][c]=admin_menu&p[0][n]=pos&p[0][v][sections]=menu_iblock_%2Fnews%2Cmenu_iblock%2Cmenu_perfmon%2Cmenu_fileman%2Ciblock_import%2Cmenu_iblock_%2Fvn%2Cmenu_util%2Cmenu_module_settings%2Cmenu_users&sessid=98c0f30967b28f01a50ea5f482e0549c',90,6123016,'Y',26927,3,0.00124788,0,0,'Y',1.2155,NULL,NULL,0.00641108,NULL,NULL,NULL,NULL,0.000146151,NULL,0),(3,'2016-01-04 14:25:39','Y','GET','demo.dev',80,'/bitrix/admin/task_admin.php','/bitrix/admin/task_admin.php?lang=en',156,8389480,'Y',40788,10,0.00667191,0,0,'Y',1.44835,1.4047,1.30992,0.0051949,0.100016,0.00751209,0.0309079,0.00222898,0.000168085,0.0285108,0),(4,'2016-01-04 14:25:48','Y','GET','demo.dev',80,'/bitrix/admin/user_admin.php','/bitrix/admin/user_admin.php?lang=en',155,8253456,'Y',34341,10,0.00869226,0,0,'Y',1.32273,1.2935,1.18392,0.00585508,0.115477,0.009794,0.0135379,0.00265694,0.0000751019,0.0108058,0),(5,'2016-01-04 14:25:54','Y','GET','demo.dev',80,'/bitrix/admin/user_edit.php','/bitrix/admin/user_edit.php?ID=1&lang=en',157,8750648,'Y',35037,15,0.0110178,0,0,'Y',1.53195,1.3254,1.22356,0.0058651,0.107726,0.159898,0.040766,0.00680995,0.000165939,0.0337901,0),(6,'2016-01-04 14:26:06','Y','GET','demo.dev',80,'/bitrix/admin/iblock_list_admin.php','/bitrix/admin/iblock_list_admin.php?IBLOCK_ID=5&type=vn&lang=en&find_section_section=0',167,10120296,'Y',34341,18,0.0287323,0,0,'Y',1.47969,1.4474,1.36854,0.00665903,0.085485,0.0141339,0.0115409,0.0021801,0.000293016,0.00906777,0),(7,'2016-01-04 14:26:12','Y','GET','demo.dev',80,'/bitrix/admin/user_options.php','/bitrix/admin/user_options.php?p[0][c]=filter&p[0][n]=tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter&p[0][v][rows]=IBLIST_A_PARENT&sessid=98c0f30967b28f01a50ea5f482e0549c',90,6122288,'Y',26927,3,0.00143862,0,0,'Y',1.17178,NULL,NULL,0.00768805,NULL,NULL,NULL,NULL,0.0000829697,NULL,0);
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql`
--

DROP TABLE IF EXISTS `b_perf_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql`
--

LOCK TABLES `b_perf_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
INSERT INTO `b_perf_sql` VALUES (1,1,NULL,0,0.000739813,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(2,1,NULL,1,0.000562191,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'admin_menu\' 	AND NAME=\'pos\''),(3,1,NULL,2,0.000725985,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:8:\\\"sections\\\";s:127:\\\"menu_iblock_/news,menu_iblock,menu_perfmon,menu_fileman,iblock_import,menu_iblock_/vn,menu_util,menu_module_settings,menu_users\\\";}\', `NAME` = \'pos\', `CATEGORY` = \'admin_menu\', `USER_ID` = 1 WHERE ID=3'),(4,1,NULL,3,0.000618696,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(5,1,NULL,4,0.021512,'main',NULL,'\n			SELECT\n				UF.ID\n				,UF.ENTITY_ID\n				,UF.FIELD_NAME\n				,UF.USER_TYPE_ID\n				,UF.XML_ID\n				,UF.SORT\n				,UF.MULTIPLE\n				,UF.MANDATORY\n				,UF.SHOW_FILTER\n				,UF.SHOW_IN_LIST\n				,UF.EDIT_IN_LIST\n				,UF.IS_SEARCHABLE\n				,UF.SETTINGS\n				\n					,UFL.EDIT_FORM_LABEL\n					,UFL.LIST_COLUMN_LABEL\n					,UFL.LIST_FILTER_LABEL\n					,UFL.ERROR_MESSAGE\n					,UFL.HELP_MESSAGE\n				\n			FROM\n				b_user_field UF\n				LEFT JOIN b_user_field_lang UFL on UFL.LANGUAGE_ID = \'en\' AND UFL.USER_FIELD_ID = UF.ID\n			\nWHERE UF.ENTITY_ID LIKE \'USER\'\nORDER BY UF.SORT ASC, UF.ID ASC'),(6,1,NULL,5,0.000386,'main',NULL,'SELECT COUNT(U.ID) as C \n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			'),(7,1,NULL,6,0.000684977,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			 ORDER BY U.TIMESTAMP_X desc  LIMIT 0, 20'),(8,1,NULL,7,0.000418902,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT '),(9,1,NULL,8,0.000661135,'fileman',NULL,'SELECT * FROM b_medialib_type'),(10,1,NULL,9,0.000748157,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(11,1,NULL,10,0.000533581,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(12,1,NULL,11,0.000482082,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT'),(13,1,NULL,12,0.000547886,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),(14,1,NULL,13,0.000689983,'main',NULL,'\n			SELECT\n				ID as REFERENCE_ID,\n				concat(NAME, \' [\', ID, \']\') as REFERENCE\n			FROM\n				b_group\n			WHERE\n				1=1\n			AND ID!=2\n			ORDER BY C_SORT, NAME, ID\n			'),(15,2,NULL,0,0.000586986,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(16,2,NULL,1,0.000272989,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'admin_menu\' 	AND NAME=\'pos\''),(17,2,NULL,2,0.000387907,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:8:\\\"sections\\\";s:127:\\\"menu_iblock_/news,menu_iblock,menu_perfmon,menu_fileman,iblock_import,menu_iblock_/vn,menu_util,menu_module_settings,menu_users\\\";}\', `NAME` = \'pos\', `CATEGORY` = \'admin_menu\', `USER_ID` = 1 WHERE ID=3'),(18,3,NULL,0,0.000709772,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(19,3,NULL,1,0.000874996,'main',NULL,'SELECT DISTINCT O.MODULE_ID FROM b_operation O'),(20,3,NULL,2,0.000696898,'main',NULL,'\n			SELECT\n				T.ID, T.NAME, T.DESCRIPTION, T.MODULE_ID, T.LETTER, T.SYS, T.BINDING\n			FROM\n				b_task T\n			WHERE\n				(1=1)\n			'),(21,3,NULL,3,0.000883818,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT '),(22,3,NULL,4,0.000407219,'fileman',NULL,'SELECT * FROM b_medialib_type'),(23,3,NULL,5,0.000736713,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(24,3,NULL,6,0.000537157,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(25,3,NULL,7,0.000411034,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT'),(26,3,NULL,8,0.000622988,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),(27,3,NULL,9,0.000791311,'main',NULL,'SELECT DISTINCT O.BINDING FROM b_operation O'),(28,4,NULL,0,0.000586986,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(29,4,NULL,1,0.000352144,'main',NULL,'SELECT COUNT(U.ID) as C \n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			'),(30,4,NULL,2,0.00052309,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			 ORDER BY U.TIMESTAMP_X desc  LIMIT 0, 20'),(31,4,NULL,3,0.000598192,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT '),(32,4,NULL,4,0.000404119,'fileman',NULL,'SELECT * FROM b_medialib_type'),(33,4,NULL,5,0.00337076,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(34,4,NULL,6,0.00140595,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(35,4,NULL,7,0.000393629,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT'),(36,4,NULL,8,0.000497103,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),(37,4,NULL,9,0.000560284,'main',NULL,'\n			SELECT\n				ID as REFERENCE_ID,\n				concat(NAME, \' [\', ID, \']\') as REFERENCE\n			FROM\n				b_group\n			WHERE\n				1=1\n			AND ID!=2\n			ORDER BY C_SORT, NAME, ID\n			'),(38,5,NULL,0,0.00268292,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(39,5,NULL,1,0.000381947,'main',NULL,'SELECT UG.GROUP_ID FROM b_user_group UG WHERE UG.USER_ID = 1 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) '),(40,5,NULL,2,0.000183821,'main',NULL,'SELECT UG.GROUP_ID FROM b_user_group UG WHERE UG.USER_ID = 1 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) '),(41,5,NULL,3,0.00117612,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1\n					AND\n					(\n						U.ID=\'1\'\n					)\n					)\n			 ORDER BY U.ID'),(42,5,NULL,4,0.001019,'main',NULL,'\n			SELECT\n				UG.GROUP_ID,\n				DATE_FORMAT(UG.DATE_ACTIVE_FROM, \'%m/%d/%Y %H:%i:%s\') as DATE_ACTIVE_FROM,\n				DATE_FORMAT(UG.DATE_ACTIVE_TO, \'%m/%d/%Y %H:%i:%s\') as DATE_ACTIVE_TO\n			FROM\n				b_user_group UG\n			WHERE\n				UG.USER_ID = 1\n			UNION SELECT 2, NULL, NULL\n			FROM b_user_group '),(43,5,NULL,5,0.000437021,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT '),(44,5,NULL,6,0.000406265,'fileman',NULL,'SELECT * FROM b_medialib_type'),(45,5,NULL,7,0.00113583,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(46,5,NULL,8,0.000705242,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(47,5,NULL,9,0.000416994,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT'),(48,5,NULL,10,0.000400066,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),(49,5,NULL,11,0.000621796,'main',NULL,'\n			SELECT \n				L.*,\n				L.LID ID,\n				length(L.DIR),\n				ifnull(length(L.DOC_ROOT), 0)\n			FROM\n				b_lang L\n				\n			WHERE\n				 1=1\n\n			 ORDER BY L.SORT '),(50,5,NULL,12,0.000594854,'main',NULL,'\n			SELECT\n				G.ID, G.ACTIVE, G.C_SORT, G.ANONYMOUS, G.NAME, G.DESCRIPTION, G.STRING_ID,\n				\n				G.ID										REFERENCE_ID,\n				concat(G.NAME, \' [\', G.ID, \']\')					REFERENCE,\n				DATE_FORMAT(G.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X\n			FROM\n				b_group G\n			\n			WHERE\n			(1=1\n					AND\n					(\n						G.ANONYMOUS=\'N\'\n					)\n					)\n			GROUP BY\n				G.ID, G.ACTIVE, G.C_SORT, G.TIMESTAMP_X, G.ANONYMOUS, G.NAME, G.STRING_ID, G.DESCRIPTION\n			HAVING\n				1=1\n				\n			 ORDER BY G.C_SORT  asc \n			'),(51,5,NULL,13,0.000464201,'main',NULL,'SELECT G.SECURITY_POLICY FROM b_group G WHERE G.ID=2'),(52,5,NULL,14,0.000391722,'main',NULL,'SELECT UG.GROUP_ID, G.SECURITY_POLICY FROM b_user_group UG, b_group G WHERE UG.USER_ID = 1 	AND UG.GROUP_ID = G.ID 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) '),(53,6,NULL,0,0.000833511,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(54,6,NULL,1,0.00054121,'iblock',NULL,'SELECT BP.* FROM b_iblock_property BP, b_iblock B WHERE BP.IBLOCK_ID=B.ID AND BP.ACTIVE=\'Y\'\nAND BP.IBLOCK_ID=5\n ORDER BY BP.SORT ASC,BP.NAME ASC'),(55,6,NULL,2,0.000383854,'main',NULL,'\n			SELECT\n				UF.ID\n				,UF.ENTITY_ID\n				,UF.FIELD_NAME\n				,UF.USER_TYPE_ID\n				,UF.XML_ID\n				,UF.SORT\n				,UF.MULTIPLE\n				,UF.MANDATORY\n				,UF.SHOW_FILTER\n				,UF.SHOW_IN_LIST\n				,UF.EDIT_IN_LIST\n				,UF.IS_SEARCHABLE\n				,UF.SETTINGS\n				\n			FROM\n				b_user_field UF\n				\n			\nWHERE UF.ENTITY_ID LIKE \'IBLOCK_5_SECTION\'\nORDER BY UF.SORT ASC, UF.ID ASC'),(56,6,NULL,3,0.0186059,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((BS.IBLOCK_SECTION_ID IS NULL)))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.TIMESTAMP_X desc '),(57,6,NULL,4,0.000644922,'iblock',NULL,'SELECT  BE.NAME as NAME,BE.ACTIVE as ACTIVE,BE.SORT as SORT,DATE_FORMAT(BE.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,BE.ID as ID,BE.CREATED_BY as CREATED_BY,L.DIR as LANG_DIR,B.LID as LID,BE.WF_PARENT_ELEMENT_ID as WF_PARENT_ELEMENT_ID,if (BE.WF_DATE_LOCK is null, \'green\', if(DATE_ADD(BE.WF_DATE_LOCK, interval 60 MINUTE)<now(), \'green\', if(BE.WF_LOCKED_BY=1, \'yellow\', \'red\'))) as LOCK_STATUS,BE.WF_NEW as WF_NEW,BE.WF_STATUS_ID as WF_STATUS_ID,B.DETAIL_PAGE_URL as DETAIL_PAGE_URL,BE.CODE as CODE,BE.XML_ID as EXTERNAL_ID,BE.IBLOCK_SECTION_ID as IBLOCK_SECTION_ID,B.IBLOCK_TYPE_ID as IBLOCK_TYPE_ID,BE.IBLOCK_ID as IBLOCK_ID,B.CODE as IBLOCK_CODE,B.XML_ID as IBLOCK_EXTERNAL_ID \n			FROM b_iblock B\n			INNER JOIN b_lang L ON B.LID=L.LID\n			INNER JOIN b_iblock_element BE ON BE.IBLOCK_ID = B.ID\n			\n			WHERE 1=1 \n			AND (\n			\n				((((BE.IBLOCK_ID = \'5\'))))\n				AND (BE.IN_SECTIONS=\'N\')\n			)\n			AND (((BE.WF_STATUS_ID=1 AND BE.WF_PARENT_ELEMENT_ID IS NULL) OR (BE.WF_NEW=\'Y\')))\n			\n		 ORDER BY BE.TIMESTAMP_X desc '),(58,6,NULL,5,0.000552177,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc '),(59,6,NULL,6,0.000468016,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT '),(60,6,NULL,7,0.000450134,'fileman',NULL,'SELECT * FROM b_medialib_type'),(61,6,NULL,8,0.000766754,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(62,6,NULL,9,0.000555038,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc '),(63,6,NULL,10,0.000610113,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((BS.IBLOCK_SECTION_ID IS NULL)))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc '),(64,6,NULL,11,0.000491858,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT'),(65,6,NULL,12,0.000650883,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),(66,6,NULL,13,0.00100803,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc '),(67,6,NULL,14,0.000452995,'iblock',NULL,'SELECT * FROM b_iblock_group WHERE IBLOCK_ID = \'5\''),(68,6,NULL,15,0.000793934,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				 INNER JOIN (SELECT DISTINCT UG.USER_ID FROM b_user_group UG\n							WHERE UG.GROUP_ID in (1)\n								and (UG.DATE_ACTIVE_FROM is null or	UG.DATE_ACTIVE_FROM <= now())\n								and (UG.DATE_ACTIVE_TO is null or UG.DATE_ACTIVE_TO >= now())\n							) UG ON UG.USER_ID=U.ID \n			WHERE\n				(1=1)\n			 ORDER BY U.NAME desc '),(69,6,NULL,16,0.000268936,'iblock',NULL,'SELECT * FROM b_iblock_group WHERE IBLOCK_ID = \'5\''),(70,6,NULL,17,0.000653982,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				 INNER JOIN (SELECT DISTINCT UG.USER_ID FROM b_user_group UG\n							WHERE UG.GROUP_ID in (1)\n								and (UG.DATE_ACTIVE_FROM is null or	UG.DATE_ACTIVE_FROM <= now())\n								and (UG.DATE_ACTIVE_TO is null or UG.DATE_ACTIVE_TO >= now())\n							) UG ON UG.USER_ID=U.ID \n			WHERE\n				(1=1)\n			 ORDER BY U.NAME desc '),(71,7,NULL,0,0.000611782,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') '),(72,7,NULL,1,0.000360966,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'filter\' 	AND NAME=\'tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter\''),(73,7,NULL,2,0.00046587,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:4:\\\"rows\\\";s:15:\\\"IBLIST_A_PARENT\\\";}\', `NAME` = \'tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter\', `CATEGORY` = \'filter\', `USER_ID` = 1 WHERE ID=6');
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_test`
--

DROP TABLE IF EXISTS `b_perf_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_test`
--

LOCK TABLES `b_perf_test` WRITE;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
INSERT INTO `b_perf_test` VALUES (1,2,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(2,3,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(3,4,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(4,5,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(5,6,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(6,7,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(7,8,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(8,9,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(9,10,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(10,11,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(11,12,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(12,13,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(13,14,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(14,15,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(15,16,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(16,17,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(17,18,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(18,19,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(19,20,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(20,21,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(21,22,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(22,23,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(23,24,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(24,25,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(25,26,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(26,27,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(27,28,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(28,29,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(29,30,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(30,31,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(31,32,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(32,33,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(33,34,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(34,35,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(35,36,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(36,37,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(37,38,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(38,39,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(39,40,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(40,41,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(41,42,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(42,43,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(43,44,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(44,45,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(45,46,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(46,47,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(47,48,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(48,49,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(49,50,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(50,51,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(51,52,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(52,53,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(53,54,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(54,55,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(55,56,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(56,57,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(57,58,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(58,59,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(59,60,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(60,61,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(61,62,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(62,63,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(63,64,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(64,65,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(65,66,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(66,67,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(67,68,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(68,69,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(69,70,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(70,71,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(71,72,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(72,73,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(73,74,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(74,75,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(75,76,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(76,77,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(77,78,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(78,79,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(79,80,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(80,81,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(81,82,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(82,83,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(83,84,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(84,85,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(85,86,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(86,87,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(87,88,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(88,89,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(89,90,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(90,91,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(91,92,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(92,93,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(93,94,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(94,95,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(95,96,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(96,97,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(97,98,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(98,99,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(99,100,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),(100,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(101,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(102,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(103,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(104,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(105,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(106,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(107,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(108,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(109,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(110,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(111,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(112,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(113,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(114,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(115,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(116,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(117,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(118,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(119,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(120,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(121,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(122,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(123,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(124,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(125,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(126,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(127,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(128,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(129,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(130,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(131,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(132,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(133,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(134,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(135,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(136,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(137,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(138,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(139,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(140,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(141,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(142,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(143,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(144,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(145,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(146,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(147,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(148,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(149,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(150,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(151,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(152,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(153,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(154,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(155,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(156,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(157,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(158,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(159,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(160,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(161,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(162,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(163,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(164,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(165,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(166,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(167,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(168,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(169,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(170,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(171,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(172,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(173,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(174,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(175,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(176,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(177,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(178,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(179,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(180,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(181,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(182,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(183,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(184,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(185,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(186,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(187,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(188,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(189,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(190,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(191,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(192,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(193,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(194,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(195,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(196,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(197,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(198,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(199,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(200,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(201,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(202,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(203,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(204,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(205,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(206,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(207,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(208,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(209,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(210,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(211,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(212,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(213,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(214,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(215,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(216,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(217,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(218,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(219,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(220,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(221,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(222,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(223,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(224,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(225,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(226,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(227,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(228,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(229,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(230,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(231,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(232,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(233,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(234,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(235,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(236,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(237,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(238,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(239,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(240,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(241,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(242,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(243,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(244,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(245,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(246,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(247,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(248,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(249,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(250,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(251,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(252,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(253,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(254,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(255,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(256,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(257,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(258,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(259,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(260,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(261,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(262,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(263,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(264,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(265,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(266,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(267,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(268,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(269,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(270,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(271,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(272,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(273,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(274,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(275,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(276,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(277,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(278,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(279,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(280,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(281,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(282,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(283,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(284,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(285,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(286,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(287,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(288,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(289,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(290,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(291,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(292,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(293,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(294,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(295,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(296,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(297,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(298,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(299,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(300,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(301,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(302,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(303,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(304,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(305,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(306,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(307,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(308,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(309,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(310,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(311,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(312,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(313,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(314,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(315,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(316,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(317,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(318,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(319,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(320,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(321,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(322,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(323,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(324,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(325,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(326,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(327,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(328,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(329,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(330,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(331,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(332,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(333,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(334,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(335,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(336,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(337,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(338,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(339,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(340,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(341,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(342,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(343,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(344,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(345,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(346,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(347,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(348,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(349,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(350,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(351,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(352,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(353,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(354,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(355,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(356,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(357,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(358,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(359,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(360,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(361,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(362,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(363,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(364,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(365,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(366,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(367,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(368,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(369,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(370,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(371,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(372,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(373,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(374,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(375,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(376,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(377,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(378,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(379,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(380,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(381,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(382,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(383,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(384,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(385,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(386,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(387,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(388,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(389,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(390,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(391,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(392,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(393,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(394,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(395,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(396,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(397,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(398,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(399,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),(400,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating`
--

DROP TABLE IF EXISTS `b_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating`
--

LOCK TABLES `b_rating` WRITE;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component`
--

DROP TABLE IF EXISTS `b_rating_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component`
--

LOCK TABLES `b_rating_component` WRITE;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component_results`
--

DROP TABLE IF EXISTS `b_rating_component_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component_results`
--

LOCK TABLES `b_rating_component_results` WRITE;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_results`
--

DROP TABLE IF EXISTS `b_rating_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,2) NOT NULL,
  `PREVIOUS_VALUE` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_results`
--

LOCK TABLES `b_rating_results` WRITE;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote`
--

DROP TABLE IF EXISTS `b_rating_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `VALUE` decimal(18,2) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTING_ID` (`RATING_VOTING_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote`
--

LOCK TABLES `b_rating_vote` WRITE;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting`
--

DROP TABLE IF EXISTS `b_rating_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,2) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting`
--

LOCK TABLES `b_rating_voting` WRITE;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content`
--

DROP TABLE IF EXISTS `b_search_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` text COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50))
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content`
--

LOCK TABLES `b_search_content` WRITE;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` VALUES (60,'2018-01-17 00:00:00','iblock','140','s1',0,'=ID=140&EXTERNAL_ID=140&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=8&IBLOCK_CODE=tin-tuc&IBLOCK_EXTERNAL_ID=&CODE=apka-dong-hanh-u23','Người đẹp và siêu xe APKA đồng hành cùng U23','Dàn siêu xe và người mẫu An Phát Khánh luôn sát cánh cùng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của dân tộc Việt Nam, hòa chung vào không khí đó tập thể 4000 anh em lái xe đã đồng hành cùng đội tuyển trong suốt quá trình thi đấu cho đến ngày vinh quang hôm nay \r\n\rD&agrave;n si&ecirc;u xe và người mẫu An Ph&aacute;t Khánh lu&ocirc;n sát cánh c&ugrave;ng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của d&acirc;n tộc Việt Nam, h&ograve;a chung vào không kh&iacute; đ&oacute; tập thể 4000 anh em lái xe đ&atilde; đồng hành cùng đội tuyển trong suốt quá tr&igrave;nh thi đấu cho đến ngày vinh quang hôm nay \rTrong suốt quá trình thi đấu từ trận đầu tiên cho đến trận chung kết 4000 anh em không ngừng  khuấy đông phong trào cổ vũ cho đội nhà, cụ thể là anh em dán những hình ảnh khich lệ động viên và bày tỏ sự tôn trọng những thành quả mà toàn đội bóng đã đạt được\rHình ảnh xe dán  hình ảnh cổ vũ cùng với cờ đỏ sao vàng trên phố đã mang lại hiệu ứng to lớn góp phần nhỏ b&eacute; vào tinh thần bất diệt gửi đến các câu thủ đang thi đấu xa nhà.\rQua sự kiện trên chứng tỏ một điều những anh em lái xe của An Phát Khánh ngoài chăm chỉ làm việc với cái tâm nghề nghiệp ra ch&uacute;ng tôi còn rất yêu thể thao, yêu đất nước và sẵn sàng hòa chung vào niềm vui của dân tộc\rĐội xe An Phát Khánh luôn sẵn sàng chào đón thêm các thành viên, những anh em trong một gia đình mới, với khẩu hiệu \'\'\rĐoàn Kết Là Sức Mạnh \"  một lòng hướng đến tinh thần yêu nước, yêu thể thao','','NGƯỜI ĐẸP VÀ SIÊU XE APKA ĐỒNG HÀNH CÙNG U23\r\nDÀN SIÊU XE VÀ NGƯỜI MẪU AN PHÁT KHÁNH LUÔN SÁT CÁNH CÙNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DÂN TỘC VIỆT NAM, HÒA CHUNG VÀO KHÔNG KHÍ ĐÓ TẬP THỂ 4000 ANH EM LÁI XE ĐÃ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRÌNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \r\n\rDN SIU XE VÀ NGƯỜI MẪU AN PHT KHÁNH LUN SÁT CÁNH CNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DN TỘC VIỆT NAM, HA CHUNG VÀO KHÔNG KH Đ TẬP THỂ 4000 ANH EM LÁI XE Đ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \rTRONG SUỐT QUÁ TRÌNH THI ĐẤU TỪ TRẬN ĐẦU TIÊN CHO ĐẾN TRẬN CHUNG KẾT 4000 ANH EM KHÔNG NGỪNG  KHUẤY ĐÔNG PHONG TRÀO CỔ VŨ CHO ĐỘI NHÀ, CỤ THỂ LÀ ANH EM DÁN NHỮNG HÌNH ẢNH KHICH LỆ ĐỘNG VIÊN VÀ BÀY TỎ SỰ TÔN TRỌNG NHỮNG THÀNH QUẢ MÀ TOÀN ĐỘI BÓNG ĐÃ ĐẠT ĐƯỢC\rHÌNH ẢNH XE DÁN  HÌNH ẢNH CỔ VŨ CÙNG VỚI CỜ ĐỎ SAO VÀNG TRÊN PHỐ ĐÃ MANG LẠI HIỆU ỨNG TO LỚN GÓP PHẦN NHỎ B VÀO TINH THẦN BẤT DIỆT GỬI ĐẾN CÁC CÂU THỦ ĐANG THI ĐẤU XA NHÀ.\rQUA SỰ KIỆN TRÊN CHỨNG TỎ MỘT ĐIỀU NHỮNG ANH EM LÁI XE CỦA AN PHÁT KHÁNH NGOÀI CHĂM CHỈ LÀM VIỆC VỚI CÁI TÂM NGHỀ NGHIỆP RA CHNG TÔI CÒN RẤT YÊU THỂ THAO, YÊU ĐẤT NƯỚC VÀ SẴN SÀNG HÒA CHUNG VÀO NIỀM VUI CỦA DÂN TỘC\rĐỘI XE AN PHÁT KHÁNH LUÔN SẴN SÀNG CHÀO ĐÓN THÊM CÁC THÀNH VIÊN, NHỮNG ANH EM TRONG MỘT GIA ĐÌNH MỚI, VỚI KHẨU HIỆU \'\'\rĐOÀN KẾT LÀ SỨC MẠNH \"  MỘT LÒNG HƯỚNG ĐẾN TINH THẦN YÊU NƯỚC, YÊU THỂ THAO\r\n','vn','8',NULL,'2018-01-17 00:00:00',NULL),(44,'2018-03-31 01:00:45','iblock','80','s1',0,'=ID=80&EXTERNAL_ID=80&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=tuyen-dung','Tuyển dụng','C&ocirc;ng ty cổ phần đầu tư \rAn Ph&aacute;t Khánh\rl&agrave; một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (tr&ecirc;n nền tảng Grab). \rCác lĩnh vực hoạt động: \r1. Mua Bán xe ô tô cũ mới, mua xe trả g&oacute;p: \rapkauto.vn\r2. Gara bảo dưỡng, sửa chữa xe ô tô: \ranphatauto.com\r3. Đầu tư, cho thuê và hợp tác xe Grab: \ranphatkhanh.vn\r4. Mua bán bảo hiểm ô tô: \ranphatkhanh.vn\r5. Dự án xe Nội Bài, xe chạy tỉnh: \rapka.vn\rAPKA.VN hiện nay với hơn \r4000\rđối tác lái xe tham gia hợp tác, gi&uacute;p hành khách t&igrave;m được xe giá tốt, luôn giúp chuyến đi vui th&iacute;ch. \rDựa trên nền tảng công nghệ website và di động, \rwww.apka.vn\rphát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. \rApka.vn\rlà thành viên công ty cổ phần đầu tư An Phát Khánh (\rwww.anphatkhanh.vn\r). Với nhu cầu phát triển, Apka.vn cần tuyển dụng nh&acirc;n sự cho dự án xe Nội Bài và xe tỉnh như sau: \r1. \rNhân viên kinh doanh \rMô tả công việc: \r- Liên hệ hợp tác với đối tác đại l&yacute;: \r- Thống nhất phương án hợp tác, chốt ký hợp đồng \r- Kết nối với đối tác để lấy thông tin khách hàng có nhu cầu sử dụng dịch vụ. \r- Chuyển thông tin khách hàng về ph&ograve;ng chăm sóc khách hàng để nhân viên CSKH liên hệ tư vấn, chăm sóc. \r- Đánh giá kết quả, tỉ lệ thành công. Xây dựng phương án, kế hoạch công việc. \r2. \rNhân viên Tổ chức hành chính và Chăm sóc khách hàng. \rMô tả công việc: \r- Soạn thảo công văn, giấy tờ, văn bản \r- Theo d&otilde;i hợp đồng \r- Chăm sóc khách hàng (khách hàng sử dụng dịch vụ xe đưa đón sân bay, đi tỉnh và các khách hàng đại lý, công ty) \r- Tư vấn, giải đáp thắc mắc, thuyết phục khách hàng tiềm năng sử dụng dịch vụ \r- Đăng tin dịch vụ công ty trên các website mua bán, rao vặt, website và facebook (sẽ được hướng dẫn đầy đủ) \r- Xử lý các công việc hành chính của phòng Tổng hợp \r3. \rNhân viên Điều Hành Xe \r- Tổ chức sắp xếp và điều phối xe cho khách hàng \r- Bảo đảm lái xe chấp hành đúng quy định, tiêu chuẩn phục vụ khách hàng của công ty \r- Quản lý thông tin của lái xe và cập nhật thông tin lái xe lên hệ thống phần mềm \r4. \rNhân viên Marketing \r- Tìm kiếm, phát triển khách hàng cho sản phẩm qua các kênh Marketing Online như SMS Brandname, Email Marketing, Facebook, Google kênh sms brandname và các kênh quảng cáo khác... \r- Lập các kế hoạch truyền thông, khuyến mại để hoàn thành chỉ tiêu doanh thu cho dịch vụ mình quản lý. \r- Chăm sóc, hỗ trợ khách hàng do mình phát triển để đảm bảo doanh số cá nhân định kỳ. \r- Chủ động, sáng kiến trong việc đưa ra các ý tưởng mới. \r5. \rThực Tập viên \r- Tham gia hỗ trợ nhân viên chính thức \r- Tham gia hoạt động nhóm, đưa ý tưởng, sang tạo cho dự án \rQUYỀN LỢI: \rv Làm việc môi trường trẻ trung, năng động và ngành đang &ldquo;Hot&rdquo; hiện nay: taxi công nghệ \rv Có cơ hội học hỏi, phát triển, thăng tiến cao \rv Lương thưởng xứng đáng theo năng lực \rv Được tham quan, du lịch năm 1-2 lần \rv Được luân chuyển giữa các mảng của công ty khi có nguyện vọng \rY&Ecirc;U CẦU HỒ SƠ & ỨNG VIÊN \r&uuml; Công ty mong muốn tìm các bạn năng động, nhiệt huyết, sáng tạo, ứng viên chưa kinh nghiệm sẽ được đào tạo, hướng nghiệp. Có kinh nghiệm là điểm cộng khi phỏng vấn \rü Hồ sơ gồm: Đơn xin việc, sơ yếu lý lịch. \rü Các bằng cấp có liên quan. \rü Hồ sơ ứng viên gửi về theo địa chỉ email: \rcontact@apka.vn\rü Hoặc liên hệ theo số điện thoại \r0914.198.008/ 0981.370.360\rđể nộp hồ sơ tại văn phòng công ty tại Tòa nhà Nàng Hương, 583 Nguyễn Trãi, Thanh Xuân, Hà Nội. ','','TUYỂN DỤNG\r\nCNG TY CỔ PHẦN ĐẦU TƯ \rAN PHT KHÁNH\rL MỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRN NỀN TẢNG GRAB). \rCÁC LĨNH VỰC HOẠT ĐỘNG: \r1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GP: \rAPKAUTO.VN\r2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: \rANPHATAUTO.COM\r3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: \rANPHATKHANH.VN\r4. MUA BÁN BẢO HIỂM Ô TÔ: \rANPHATKHANH.VN\r5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: \rAPKA.VN\rAPKA.VN HIỆN NAY VỚI HƠN \r4000\rĐỐI TÁC LÁI XE THAM GIA HỢP TÁC, GIP HÀNH KHÁCH TM ĐƯỢC XE GIÁ TỐT, LUÔN GIÚP CHUYẾN ĐI VUI THCH. \rDỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, \rWWW.APKA.VN\rPHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC HNG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. \rAPKA.VN\rLÀ THÀNH VIÊN CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH (\rWWW.ANPHATKHANH.VN\r). VỚI NHU CẦU PHÁT TRIỂN, APKA.VN CẦN TUYỂN DỤNG NHN SỰ CHO DỰ ÁN XE NỘI BÀI VÀ XE TỈNH NHƯ SAU: \r1. \rNHÂN VIÊN KINH DOANH \rMÔ TẢ CÔNG VIỆC: \r- LIÊN HỆ HỢP TÁC VỚI ĐỐI TÁC ĐẠI L: \r- THỐNG NHẤT PHƯƠNG ÁN HỢP TÁC, CHỐT KÝ HỢP ĐỒNG \r- KẾT NỐI VỚI ĐỐI TÁC ĐỂ LẤY THÔNG TIN KHÁCH HÀNG CÓ NHU CẦU SỬ DỤNG DỊCH VỤ. \r- CHUYỂN THÔNG TIN KHÁCH HÀNG VỀ PHNG CHĂM SÓC KHÁCH HÀNG ĐỂ NHÂN VIÊN CSKH LIÊN HỆ TƯ VẤN, CHĂM SÓC. \r- ĐÁNH GIÁ KẾT QUẢ, TỈ LỆ THÀNH CÔNG. XÂY DỰNG PHƯƠNG ÁN, KẾ HOẠCH CÔNG VIỆC. \r2. \rNHÂN VIÊN TỔ CHỨC HÀNH CHÍNH VÀ CHĂM SÓC KHÁCH HÀNG. \rMÔ TẢ CÔNG VIỆC: \r- SOẠN THẢO CÔNG VĂN, GIẤY TỜ, VĂN BẢN \r- THEO DI HỢP ĐỒNG \r- CHĂM SÓC KHÁCH HÀNG (KHÁCH HÀNG SỬ DỤNG DỊCH VỤ XE ĐƯA ĐÓN SÂN BAY, ĐI TỈNH VÀ CÁC KHÁCH HÀNG ĐẠI LÝ, CÔNG TY) \r- TƯ VẤN, GIẢI ĐÁP THẮC MẮC, THUYẾT PHỤC KHÁCH HÀNG TIỀM NĂNG SỬ DỤNG DỊCH VỤ \r- ĐĂNG TIN DỊCH VỤ CÔNG TY TRÊN CÁC WEBSITE MUA BÁN, RAO VẶT, WEBSITE VÀ FACEBOOK (SẼ ĐƯỢC HƯỚNG DẪN ĐẦY ĐỦ) \r- XỬ LÝ CÁC CÔNG VIỆC HÀNH CHÍNH CỦA PHÒNG TỔNG HỢP \r3. \rNHÂN VIÊN ĐIỀU HÀNH XE \r- TỔ CHỨC SẮP XẾP VÀ ĐIỀU PHỐI XE CHO KHÁCH HÀNG \r- BẢO ĐẢM LÁI XE CHẤP HÀNH ĐÚNG QUY ĐỊNH, TIÊU CHUẨN PHỤC VỤ KHÁCH HÀNG CỦA CÔNG TY \r- QUẢN LÝ THÔNG TIN CỦA LÁI XE VÀ CẬP NHẬT THÔNG TIN LÁI XE LÊN HỆ THỐNG PHẦN MỀM \r4. \rNHÂN VIÊN MARKETING \r- TÌM KIẾM, PHÁT TRIỂN KHÁCH HÀNG CHO SẢN PHẨM QUA CÁC KÊNH MARKETING ONLINE NHƯ SMS BRANDNAME, EMAIL MARKETING, FACEBOOK, GOOGLE KÊNH SMS BRANDNAME VÀ CÁC KÊNH QUẢNG CÁO KHÁC... \r- LẬP CÁC KẾ HOẠCH TRUYỀN THÔNG, KHUYẾN MẠI ĐỂ HOÀN THÀNH CHỈ TIÊU DOANH THU CHO DỊCH VỤ MÌNH QUẢN LÝ. \r- CHĂM SÓC, HỖ TRỢ KHÁCH HÀNG DO MÌNH PHÁT TRIỂN ĐỂ ĐẢM BẢO DOANH SỐ CÁ NHÂN ĐỊNH KỲ. \r- CHỦ ĐỘNG, SÁNG KIẾN TRONG VIỆC ĐƯA RA CÁC Ý TƯỞNG MỚI. \r5. \rTHỰC TẬP VIÊN \r- THAM GIA HỖ TRỢ NHÂN VIÊN CHÍNH THỨC \r- THAM GIA HOẠT ĐỘNG NHÓM, ĐƯA Ý TƯỞNG, SANG TẠO CHO DỰ ÁN \rQUYỀN LỢI: \rV LÀM VIỆC MÔI TRƯỜNG TRẺ TRUNG, NĂNG ĐỘNG VÀ NGÀNH ĐANG HOT HIỆN NAY: TAXI CÔNG NGHỆ \rV CÓ CƠ HỘI HỌC HỎI, PHÁT TRIỂN, THĂNG TIẾN CAO \rV LƯƠNG THƯỞNG XỨNG ĐÁNG THEO NĂNG LỰC \rV ĐƯỢC THAM QUAN, DU LỊCH NĂM 1-2 LẦN \rV ĐƯỢC LUÂN CHUYỂN GIỮA CÁC MẢNG CỦA CÔNG TY KHI CÓ NGUYỆN VỌNG \rYU CẦU HỒ SƠ & ỨNG VIÊN \r CÔNG TY MONG MUỐN TÌM CÁC BẠN NĂNG ĐỘNG, NHIỆT HUYẾT, SÁNG TẠO, ỨNG VIÊN CHƯA KINH NGHIỆM SẼ ĐƯỢC ĐÀO TẠO, HƯỚNG NGHIỆP. CÓ KINH NGHIỆM LÀ ĐIỂM CỘNG KHI PHỎNG VẤN \rÜ HỒ SƠ GỒM: ĐƠN XIN VIỆC, SƠ YẾU LÝ LỊCH. \rÜ CÁC BẰNG CẤP CÓ LIÊN QUAN. \rÜ HỒ SƠ ỨNG VIÊN GỬI VỀ THEO ĐỊA CHỈ EMAIL: \rCONTACT@APKA.VN\rÜ HOẶC LIÊN HỆ THEO SỐ ĐIỆN THOẠI \r0914.198.008/ 0981.370.360\rĐỂ NỘP HỒ SƠ TẠI VĂN PHÒNG CÔNG TY TẠI TÒA NHÀ NÀNG HƯƠNG, 583 NGUYỄN TRÃI, THANH XUÂN, HÀ NỘI. \r\n','vn','9',NULL,NULL,NULL),(45,'2018-04-13 16:43:52','iblock','81','s1',0,'=ID=81&EXTERNAL_ID=81&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=doi-tac-cua-chung-toi','Đối tác của chúng tôi','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','ĐỐI TÁC CỦA CHÚNG TÔI\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL),(46,'2018-04-13 16:46:32','iblock','82','s1',0,'=ID=82&EXTERNAL_ID=82&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=khach-hang-thuong-xuyen','Khách hàng thường xuyên','Chương tr&igrave;nh \rKh&aacute;ch h&agrave;ng thường xuy&ecirc;n\r mong muốn đem tới những ưu đ&atilde;i cho những khách hàng thường xuyên sử dụng dịch vụ v&acirc;̣n chuyển của \rhttp://apka.vn\r. Nếu bạn là Hội viên của Chương trình Khách hàng thường xuyên, sau mỗi chuyến đi với \rhttp://apka.vn\r hoặc sau mỗi lần sử dụng sản phẩm, dịch vụ, điểm (s&ocirc;́ km đã đi) sẽ được t&iacute;ch luỹ vào tài khoản của Bạn và bạn c&oacute; thể dễ dàng chuyển điểm thành những phần thưởng giá trị cho mình và cho người thân.\rLợi ích khi tham gia chương trình Khách hàng Thường xuyên: \rKhách hàng sử dụng dịch vụ 10 lần (mỗi chiều tính là 1 lần) thì sẽ được giảm 20.000 đ cho lần sử dụng dịch vụ thứ 11\rNhận thông báo thường xuyên về các chương trình khuyến mãi, giảm giá của apka.vn và ưu tiên đăng k&yacute; tham gia nếu có nhu cầu.\rNâng hạng xe, hạng chỗ nếu trên Hệ thống của \rhttp://apka.vn\r c&ograve;n xe/ còn chỗ trống c&ugrave;ng hành trình.\rĐể trở thành hội viên Chương trình Khách hàng thường xuyên, Quý khách chỉ cần tạo tài khoản và mỗi lần đặt xe sẽ được tích điểm trong thông tin tài khoản.','','KHÁCH HÀNG THƯỜNG XUYÊN\r\nCHƯƠNG TRNH \rKHCH HNG THƯỜNG XUYN\r MONG MUỐN ĐEM TỚI NHỮNG ƯU ĐI CHO NHỮNG KHÁCH HÀNG THƯỜNG XUYÊN SỬ DỤNG DỊCH VỤ ṾN CHUYỂN CỦA \rHTTP://APKA.VN\r. NẾU BẠN LÀ HỘI VIÊN CỦA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, SAU MỖI CHUYẾN ĐI VỚI \rHTTP://APKA.VN\r HOẶC SAU MỖI LẦN SỬ DỤNG SẢN PHẨM, DỊCH VỤ, ĐIỂM (Ś KM ĐÃ ĐI) SẼ ĐƯỢC TCH LUỸ VÀO TÀI KHOẢN CỦA BẠN VÀ BẠN C THỂ DỄ DÀNG CHUYỂN ĐIỂM THÀNH NHỮNG PHẦN THƯỞNG GIÁ TRỊ CHO MÌNH VÀ CHO NGƯỜI THÂN.\rLỢI ÍCH KHI THAM GIA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN: \rKHÁCH HÀNG SỬ DỤNG DỊCH VỤ 10 LẦN (MỖI CHIỀU TÍNH LÀ 1 LẦN) THÌ SẼ ĐƯỢC GIẢM 20.000 Đ CHO LẦN SỬ DỤNG DỊCH VỤ THỨ 11\rNHẬN THÔNG BÁO THƯỜNG XUYÊN VỀ CÁC CHƯƠNG TRÌNH KHUYẾN MÃI, GIẢM GIÁ CỦA APKA.VN VÀ ƯU TIÊN ĐĂNG K THAM GIA NẾU CÓ NHU CẦU.\rNÂNG HẠNG XE, HẠNG CHỖ NẾU TRÊN HỆ THỐNG CỦA \rHTTP://APKA.VN\r CN XE/ CÒN CHỖ TRỐNG CNG HÀNH TRÌNH.\rĐỂ TRỞ THÀNH HỘI VIÊN CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, QUÝ KHÁCH CHỈ CẦN TẠO TÀI KHOẢN VÀ MỖI LẦN ĐẶT XE SẼ ĐƯỢC TÍCH ĐIỂM TRONG THÔNG TIN TÀI KHOẢN.\r\n','vn','9',NULL,NULL,NULL),(47,'2018-03-31 01:07:46','iblock','83','s1',0,'=ID=83&EXTERNAL_ID=83&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=khach-hang-to-chuc','Khách hàng tổ chức','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','KHÁCH HÀNG TỔ CHỨC\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL),(48,'2018-03-31 01:07:32','iblock','84','s1',0,'=ID=84&EXTERNAL_ID=84&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=chia-se-doanh-thu','Chia sẻ doanh thu','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','CHIA SẺ DOANH THU\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL),(51,'2018-03-31 01:08:33','iblock','87','s1',0,'=ID=87&EXTERNAL_ID=87&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=bao-ve-quyen-rieng-tu','Bảo vệ quyền riêng tư','Phạm vi &aacute;p dụng:\rPhần Qui định bảo vệ Quyền ri&ecirc;ng tư n&agrave;y tr&igrave;nh bày về việc ch&uacute;ng t&ocirc;i xử l&yacute; thông tin nhận dạng cá nh&acirc;n mà chúng tôi thu thập được khi bạn ở trong trang web hoặc ứng dụng di động của chúng tôi , và khi bạn sử dụng các dịch vụ của chúng tôi hoặc dịch vụ của các đối tác nhưng c&oacute; liên kết với dịch vụ của chúng tôi.\rQuy định này không áp dụng cho những cách thức xử lý thông tin của các công ty mà chúng tôi không sở hữu hoặc kiểm soát, hoặc những người không phải là nhân viên của chúng tôi hay những người không do chúng tôi quản lý.\rCách thức chúng tôi thu thập thông tin:\rChúng tôi thu thập các thông tin nhận dạng cá nhân khi bạn đăng ký sử dụng hoặc sử dụng một số dịch vụ của chúng tôi. Chúng tôi cũng có thể nhận được các thông tin nhận dạng cá nhân do các đối tác cung cấp khi bạn sử dụng dịch vụ của họ nhưng có sự liên kết phối hợp cung cấp của chúng tôi Chúng tôi cũng tự động nhận được và ghi lại các thông tin trong các tập tin ghi ch&eacute;p trong máy chủ của chúng tôi từ cửa sổ trình duyệt của bạn, trong đó bao gồm địa chỉ IP, thông tin về tập tin cookie.\rDữ liệu chúng tôi thu thập:\rĐể vận hành trang web và cung cấp cho bạn thông tin về sản phẩm hoặc dịch vụ có thể được bạn quan tâm, chúng tôi có thể thu thập:\rDữ liệu cá nhân: tức là thông tin có thể được sử dụng để liên lạc với bạn trực tiếp mà không sử dụng trang web bao gồm họ tên, địa chỉ bưu ch&iacute;nh, số điện thoại, thông tin tài khoản ngân hàng/thẻ tín dụng / thẻ ghi nợ, hoặc địa chỉ email.\rDữ liệu Nhân khẩu học: (những thông tin không phải là thông tin cá nhân, bao gồm nhưng không giới hạn ở m&atilde; v&ugrave;ng, quê hương, giới tính, tuổi, ngày tháng năm sinh, lịch sử duyệt web, lịch sử tìm kiếm thông tin.\rDữ liệu vị trí: Dịch vụ của chúng tôi có thể sử dụng các công nghệ hỗ trợ định vị như Google Maps. Nếu bạn sử dụng các dịch vụ này, Google có thể nhận thông tin về vị trí thực của bạn (ví dụ như tín hiệu GPS được gửi qua thiết bị di động) hoặc thông tin có thể được sử dụng để xác định vị trí (như ID điện thoại di động).\rChúng tôi sử dụng thông tin của bạn cho mục đích gì?\rChúng tôi sử dụng địa chỉ email của bạn và các thông tin cá nhân của bạn để giúp chúng vận hành một cách có hiệu quả các trang web và dịch vụ, liên lạc với bạn khi bạn thực hiện các giao dịch đặt chỗ, để chuyển tiếp thông tin chuyến đi từ những người dùng trang web khác đến cho bạn;  và các hoạt động khác trên trang web (ví dụ gửi tin tức quan trọng mà có thể bạn quan tâm. Trong một số trường hợp, chúng tôi có thể gửi cho bạn các hoạt động truyền thông chứa nội dung thương mại, chẳng hạn như các banner quảng cáo và cung cấp đặc biệt dạng giảm giá hoặc khuyến mại).\rChúng tôi có thể sử dụng các thông tin về vị trí để tối ưu hóa các hoạt động được thiết kế cho các thiết bị cầm tay thông minh. Các ứng dụng này sẽ làm cho việc đặt chỗ và theo d&otilde;i xe đến đón cũng như tìm kiếm hành khách một cách thuận lợi và linh hoạt hơn phương thức qua website.\rTiết lộ và chia sẻ thông tin\rChúng tôi chỉ chia sẻ thông tin cá nhân với các công ty hoặc cá nhân khác bên ngoài trong những trường hợp giới hạn sau:\rChúng tôi được bạn đồng ý cho tiết lộ thông tin đó.\rChúng tôi cần tiết lộ thông tin của bạn để cung cấp các sản phẩm hoặc dịch vụ mà bạn yêu cầu.\rChúng tôi cần gửi thông tin đó cho những công ty hoạt động thay mặt cho chúng tôi để cung cấp sản phẩm hoặc dịch vụ cho bạn. (Trừ khi chúng tôi thông báo cho bạn biết nội dung khác, các công ty này không có quyền sử dụng các thông tin nhận dạng cá nhân mà chúng tôi cung cấp cho họ vượt quá phạm vi cần thiết để trợ giúp chúng tôi).\rChúng tôi tuân theo các trát lệnh, lệnh t&ograve;a án hoặc thủ tục pháp lý.\rCập nhật hoặc xóa thông tin\rKhi bạn sử dụng các dịch vụ của chúng tôi, chúng tôi thật sự cố gắng cung cấp cho bạn quyền truy cập vào thông tin cá nhân của bạn hoặc để chỉnh sửa dữ liệu này nếu chưa chính xác hoặc xoá dữ liệu đó theo yêu cầu của bạn nếu dữ liệu này không được luật pháp yêu cầu giữ lại. Bạn có thể chỉnh sửa hồ sơ của bạn bất cứ lúc nào. Tất cả những gì bạn cần là tên người dùng và mật khẩu của bạn.\rBảo mật thông tin\rChúng tôi sử dụng các biện pháp bảo mật thích hợp để bảo vệ việc truy cập hoặc sửa đổi, tiết lộ hoặc huỷ dữ liệu một cách trái phép. Các biện pháp này bao gồm xem xét nội bộ các thực tiễn thu thập, lưu trữ và xử lý dữ liệu cũng như các biện pháp bảo mật, bao gồm các biện pháp bảo mật vật lý và mã hoá thích hợp để bảo vệ chống truy cập trái phép vào hệ thống lưu trữ dữ liệu cá nhân của chúng tôi.\rNhững thay đổi về Quy định bảo vệ Quyền riêng tư này\rĐôi khi chúng tôi có thể sửa đổi qui định này. Nếu có những thay đổi, chúng tôi sẽ thông báo cho bạn bằng cách đăng thông báo ở vị trí dễ nhận thấy trên các trang web của chúng tôi. Bạn đồng ý rằng thông báo được đăng như vậy sẽ được coi như là bản thông báo đầy đủ và thỏa đáng cho bạn về những thay đổi nói trên.Bạn đồng ý rằng nếu bạn tiếp tục sử dụng các dịch vụ và sản phẩm của chúng tôi sau khi có sự sửa đổi đó, điều đó có nghĩa là bạn chấp nhận và đồng ý tuân theo qui định được sửa đổi.\rCác thắc mắc hoặc gợi ý\rNếu bạn có bất kỳ câu hỏi hoặc góp ý nào cho chúng tôi về Quyền riêng tư, bạn có thể liên lạc với chúng tôi tại \rcontact@apka.vn\r.','','BẢO VỆ QUYỀN RIÊNG TƯ\r\nPHẠM VI P DỤNG:\rPHẦN QUI ĐỊNH BẢO VỆ QUYỀN RING TƯ NY TRNH BÀY VỀ VIỆC CHNG TI XỬ L THÔNG TIN NHẬN DẠNG CÁ NHN MÀ CHÚNG TÔI THU THẬP ĐƯỢC KHI BẠN Ở TRONG TRANG WEB HOẶC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI , VÀ KHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HOẶC DỊCH VỤ CỦA CÁC ĐỐI TÁC NHƯNG C LIÊN KẾT VỚI DỊCH VỤ CỦA CHÚNG TÔI.\rQUY ĐỊNH NÀY KHÔNG ÁP DỤNG CHO NHỮNG CÁCH THỨC XỬ LÝ THÔNG TIN CỦA CÁC CÔNG TY MÀ CHÚNG TÔI KHÔNG SỞ HỮU HOẶC KIỂM SOÁT, HOẶC NHỮNG NGƯỜI KHÔNG PHẢI LÀ NHÂN VIÊN CỦA CHÚNG TÔI HAY NHỮNG NGƯỜI KHÔNG DO CHÚNG TÔI QUẢN LÝ.\rCÁCH THỨC CHÚNG TÔI THU THẬP THÔNG TIN:\rCHÚNG TÔI THU THẬP CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN KHI BẠN ĐĂNG KÝ SỬ DỤNG HOẶC SỬ DỤNG MỘT SỐ DỊCH VỤ CỦA CHÚNG TÔI. CHÚNG TÔI CŨNG CÓ THỂ NHẬN ĐƯỢC CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN DO CÁC ĐỐI TÁC CUNG CẤP KHI BẠN SỬ DỤNG DỊCH VỤ CỦA HỌ NHƯNG CÓ SỰ LIÊN KẾT PHỐI HỢP CUNG CẤP CỦA CHÚNG TÔI CHÚNG TÔI CŨNG TỰ ĐỘNG NHẬN ĐƯỢC VÀ GHI LẠI CÁC THÔNG TIN TRONG CÁC TẬP TIN GHI CHP TRONG MÁY CHỦ CỦA CHÚNG TÔI TỪ CỬA SỔ TRÌNH DUYỆT CỦA BẠN, TRONG ĐÓ BAO GỒM ĐỊA CHỈ IP, THÔNG TIN VỀ TẬP TIN COOKIE.\rDỮ LIỆU CHÚNG TÔI THU THẬP:\rĐỂ VẬN HÀNH TRANG WEB VÀ CUNG CẤP CHO BẠN THÔNG TIN VỀ SẢN PHẨM HOẶC DỊCH VỤ CÓ THỂ ĐƯỢC BẠN QUAN TÂM, CHÚNG TÔI CÓ THỂ THU THẬP:\rDỮ LIỆU CÁ NHÂN: TỨC LÀ THÔNG TIN CÓ THỂ ĐƯỢC SỬ DỤNG ĐỂ LIÊN LẠC VỚI BẠN TRỰC TIẾP MÀ KHÔNG SỬ DỤNG TRANG WEB BAO GỒM HỌ TÊN, ĐỊA CHỈ BƯU CHNH, SỐ ĐIỆN THOẠI, THÔNG TIN TÀI KHOẢN NGÂN HÀNG/THẺ TÍN DỤNG / THẺ GHI NỢ, HOẶC ĐỊA CHỈ EMAIL.\rDỮ LIỆU NHÂN KHẨU HỌC: (NHỮNG THÔNG TIN KHÔNG PHẢI LÀ THÔNG TIN CÁ NHÂN, BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở M VNG, QUÊ HƯƠNG, GIỚI TÍNH, TUỔI, NGÀY THÁNG NĂM SINH, LỊCH SỬ DUYỆT WEB, LỊCH SỬ TÌM KIẾM THÔNG TIN.\rDỮ LIỆU VỊ TRÍ: DỊCH VỤ CỦA CHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC CÔNG NGHỆ HỖ TRỢ ĐỊNH VỊ NHƯ GOOGLE MAPS. NẾU BẠN SỬ DỤNG CÁC DỊCH VỤ NÀY, GOOGLE CÓ THỂ NHẬN THÔNG TIN VỀ VỊ TRÍ THỰC CỦA BẠN (VÍ DỤ NHƯ TÍN HIỆU GPS ĐƯỢC GỬI QUA THIẾT BỊ DI ĐỘNG) HOẶC THÔNG TIN CÓ THỂ ĐƯỢC SỬ DỤNG ĐỂ XÁC ĐỊNH VỊ TRÍ (NHƯ ID ĐIỆN THOẠI DI ĐỘNG).\rCHÚNG TÔI SỬ DỤNG THÔNG TIN CỦA BẠN CHO MỤC ĐÍCH GÌ?\rCHÚNG TÔI SỬ DỤNG ĐỊA CHỈ EMAIL CỦA BẠN VÀ CÁC THÔNG TIN CÁ NHÂN CỦA BẠN ĐỂ GIÚP CHÚNG VẬN HÀNH MỘT CÁCH CÓ HIỆU QUẢ CÁC TRANG WEB VÀ DỊCH VỤ, LIÊN LẠC VỚI BẠN KHI BẠN THỰC HIỆN CÁC GIAO DỊCH ĐẶT CHỖ, ĐỂ CHUYỂN TIẾP THÔNG TIN CHUYẾN ĐI TỪ NHỮNG NGƯỜI DÙNG TRANG WEB KHÁC ĐẾN CHO BẠN;  VÀ CÁC HOẠT ĐỘNG KHÁC TRÊN TRANG WEB (VÍ DỤ GỬI TIN TỨC QUAN TRỌNG MÀ CÓ THỂ BẠN QUAN TÂM. TRONG MỘT SỐ TRƯỜNG HỢP, CHÚNG TÔI CÓ THỂ GỬI CHO BẠN CÁC HOẠT ĐỘNG TRUYỀN THÔNG CHỨA NỘI DUNG THƯƠNG MẠI, CHẲNG HẠN NHƯ CÁC BANNER QUẢNG CÁO VÀ CUNG CẤP ĐẶC BIỆT DẠNG GIẢM GIÁ HOẶC KHUYẾN MẠI).\rCHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC THÔNG TIN VỀ VỊ TRÍ ĐỂ TỐI ƯU HÓA CÁC HOẠT ĐỘNG ĐƯỢC THIẾT KẾ CHO CÁC THIẾT BỊ CẦM TAY THÔNG MINH. CÁC ỨNG DỤNG NÀY SẼ LÀM CHO VIỆC ĐẶT CHỖ VÀ THEO DI XE ĐẾN ĐÓN CŨNG NHƯ TÌM KIẾM HÀNH KHÁCH MỘT CÁCH THUẬN LỢI VÀ LINH HOẠT HƠN PHƯƠNG THỨC QUA WEBSITE.\rTIẾT LỘ VÀ CHIA SẺ THÔNG TIN\rCHÚNG TÔI CHỈ CHIA SẺ THÔNG TIN CÁ NHÂN VỚI CÁC CÔNG TY HOẶC CÁ NHÂN KHÁC BÊN NGOÀI TRONG NHỮNG TRƯỜNG HỢP GIỚI HẠN SAU:\rCHÚNG TÔI ĐƯỢC BẠN ĐỒNG Ý CHO TIẾT LỘ THÔNG TIN ĐÓ.\rCHÚNG TÔI CẦN TIẾT LỘ THÔNG TIN CỦA BẠN ĐỂ CUNG CẤP CÁC SẢN PHẨM HOẶC DỊCH VỤ MÀ BẠN YÊU CẦU.\rCHÚNG TÔI CẦN GỬI THÔNG TIN ĐÓ CHO NHỮNG CÔNG TY HOẠT ĐỘNG THAY MẶT CHO CHÚNG TÔI ĐỂ CUNG CẤP SẢN PHẨM HOẶC DỊCH VỤ CHO BẠN. (TRỪ KHI CHÚNG TÔI THÔNG BÁO CHO BẠN BIẾT NỘI DUNG KHÁC, CÁC CÔNG TY NÀY KHÔNG CÓ QUYỀN SỬ DỤNG CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN MÀ CHÚNG TÔI CUNG CẤP CHO HỌ VƯỢT QUÁ PHẠM VI CẦN THIẾT ĐỂ TRỢ GIÚP CHÚNG TÔI).\rCHÚNG TÔI TUÂN THEO CÁC TRÁT LỆNH, LỆNH TA ÁN HOẶC THỦ TỤC PHÁP LÝ.\rCẬP NHẬT HOẶC XÓA THÔNG TIN\rKHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI, CHÚNG TÔI THẬT SỰ CỐ GẮNG CUNG CẤP CHO BẠN QUYỀN TRUY CẬP VÀO THÔNG TIN CÁ NHÂN CỦA BẠN HOẶC ĐỂ CHỈNH SỬA DỮ LIỆU NÀY NẾU CHƯA CHÍNH XÁC HOẶC XOÁ DỮ LIỆU ĐÓ THEO YÊU CẦU CỦA BẠN NẾU DỮ LIỆU NÀY KHÔNG ĐƯỢC LUẬT PHÁP YÊU CẦU GIỮ LẠI. BẠN CÓ THỂ CHỈNH SỬA HỒ SƠ CỦA BẠN BẤT CỨ LÚC NÀO. TẤT CẢ NHỮNG GÌ BẠN CẦN LÀ TÊN NGƯỜI DÙNG VÀ MẬT KHẨU CỦA BẠN.\rBẢO MẬT THÔNG TIN\rCHÚNG TÔI SỬ DỤNG CÁC BIỆN PHÁP BẢO MẬT THÍCH HỢP ĐỂ BẢO VỆ VIỆC TRUY CẬP HOẶC SỬA ĐỔI, TIẾT LỘ HOẶC HUỶ DỮ LIỆU MỘT CÁCH TRÁI PHÉP. CÁC BIỆN PHÁP NÀY BAO GỒM XEM XÉT NỘI BỘ CÁC THỰC TIỄN THU THẬP, LƯU TRỮ VÀ XỬ LÝ DỮ LIỆU CŨNG NHƯ CÁC BIỆN PHÁP BẢO MẬT, BAO GỒM CÁC BIỆN PHÁP BẢO MẬT VẬT LÝ VÀ MÃ HOÁ THÍCH HỢP ĐỂ BẢO VỆ CHỐNG TRUY CẬP TRÁI PHÉP VÀO HỆ THỐNG LƯU TRỮ DỮ LIỆU CÁ NHÂN CỦA CHÚNG TÔI.\rNHỮNG THAY ĐỔI VỀ QUY ĐỊNH BẢO VỆ QUYỀN RIÊNG TƯ NÀY\rĐÔI KHI CHÚNG TÔI CÓ THỂ SỬA ĐỔI QUI ĐỊNH NÀY. NẾU CÓ NHỮNG THAY ĐỔI, CHÚNG TÔI SẼ THÔNG BÁO CHO BẠN BẰNG CÁCH ĐĂNG THÔNG BÁO Ở VỊ TRÍ DỄ NHẬN THẤY TRÊN CÁC TRANG WEB CỦA CHÚNG TÔI. BẠN ĐỒNG Ý RẰNG THÔNG BÁO ĐƯỢC ĐĂNG NHƯ VẬY SẼ ĐƯỢC COI NHƯ LÀ BẢN THÔNG BÁO ĐẦY ĐỦ VÀ THỎA ĐÁNG CHO BẠN VỀ NHỮNG THAY ĐỔI NÓI TRÊN.BẠN ĐỒNG Ý RẰNG NẾU BẠN TIẾP TỤC SỬ DỤNG CÁC DỊCH VỤ VÀ SẢN PHẨM CỦA CHÚNG TÔI SAU KHI CÓ SỰ SỬA ĐỔI ĐÓ, ĐIỀU ĐÓ CÓ NGHĨA LÀ BẠN CHẤP NHẬN VÀ ĐỒNG Ý TUÂN THEO QUI ĐỊNH ĐƯỢC SỬA ĐỔI.\rCÁC THẮC MẮC HOẶC GỢI Ý\rNẾU BẠN CÓ BẤT KỲ CÂU HỎI HOẶC GÓP Ý NÀO CHO CHÚNG TÔI VỀ QUYỀN RIÊNG TƯ, BẠN CÓ THỂ LIÊN LẠC VỚI CHÚNG TÔI TẠI \rCONTACT@APKA.VN\r.\r\n','vn','9',NULL,NULL,NULL),(52,'2018-04-13 17:11:00','iblock','88','s1',0,'=ID=88&EXTERNAL_ID=88&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=su-dung-dich-vu','Sử dụng dịch vụ','1. CHẤP NHẬN C&Aacute;C ĐIỀU KHOẢN\rThỏa thuận sau đ&acirc;y l&agrave; một thỏa thuận ràng buộc ph&aacute;p l&yacute; giữa Bạn và \rhttp://apka.vn\r(\"Ch&uacute;ng t&ocirc;i&rdquo;). Thỏa thuận bao gồm các điều khoản dịch vụ mà bạn phải tuân thủ để được quyền tiếp cận và sử dụng dịch vụ  tr&ecirc;n trang Web  và các ứng dụng di động của chúng tôi.  Tại từng thời điểm, chúng tôi c&oacute; thể cập nhật Điều khoản dịch vụ theo quyết định của m&igrave;nh mà không cần thông báo trực tiếp cho bạn. Bạn chịu trách nhiệm tìm hiểu phiên bản mới nhất bằng cách truy cập website http://apka.vn/.\rXIN VUI L&Ograve;NG ĐỌC ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K&Yacute; LÀM THÀNH VI&Ecirc;N. NẾU BẠN KH&Ocirc;NG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CH&Uacute;NG TÔI.\r2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP\rBạn sẽ nhận được một mật khẩu và tài khoản sau khi hoàn tất thủ tục đăng ký làm thành viên. Bạn có trách nhiệm bảo mật mật khẩu và tài khoản, và hoàn toàn chịu trách nhiệm đối với tất cả các hoạt động diễn ra dưới việc sử dụng mật khẩu hoặc tài khoản của mình. Bạn đồng ý (a) thông báo ngay cho chúng tôi về bất cứ trường hợp nào sử dụng trái ph&eacute;p mật khẩu hoặc tài khoản của bạn hoặc bất cứ trường hợp nào khác vi phạm sự bảo mật, và (b) bảo đảm rằng Bạn luôn thoát khỏi tài khoản của mình sau mỗi lần sử dụng. Chúng tôi không thể và sẽ không chịu trách nhiệm đối với bất cứ tổn thất hoặc thiệt hại nào phát sinh do Bạn không tuân thủ quy định này.\r3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN\rV\rới tư cách là người sử dụng dịch vụ, Bạn phải cam kết:\r(a) bạn có đủ tư cách pháp lý và tư cách hành vi khi sử dụng dịch vụ\r(b) cung cấp các thông tin đầy đủ, trung thực và ch&iacute;nh xác về bản thân trong Hồ sơ cá nhân\r(c) duy trì và cập nhật kịp thời Hồ sơ cá nhân để bảo đảm rằng dữ liệu này là đầy đủ, trung thực và chính xác.\rNếu Bạn cung cấp bất cứ thông tin nào không phải là không trung thực hoặc không chính xác, hoặc nếu chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin đó không trung thực hoặc không chính xác, chúng tôi có quyền đình chỉ hoặc chấm dứt tài khoản của Bạn; từ chối một phần hoặc toàn bộ việc sử dụng Dịch vụ tại thời điểm hiện tại hoặc trong tương lai.\r4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI\rBạn hiểu rằng bạn hoàn toàn chịu trách nhiệm trước pháp luật về các Nội dung bạn tạo ra bao gồm nhưng không giới hạn ở dữ liệu, văn bản, phần mềm, âm thanh, hình ảnh, video, email. Chúng tôi không có nghĩa vụ theo d&otilde;i các tài liệu được đăng và vì vậy, không bảo đảm về tính hợp pháp, chính xác, nguyên vẹn hoặc chất lượng của Nội Dung đó. Tại các khu vực được phép đăng tải Nội dung, bạn có thể chia sẻ thông tin được phép dưới các định dạng chúng tôi mặc định và bạn phải tự chịu trách nhiệm đối với các nội dung, thông tin, hình ảnh và bất kỳ sự chia sẻ nào khác của bạn với cá nhân người sử dụng hoặc nhóm người sử dụng. Tuy nhiên, trong mọi trường hợp, chúng tôi vẫn được bảo lưu quyền xử lý các thông tin đăng tải cho ph&ugrave; hợp với thuần phong mỹ tục, các quy tắc đạo đức và các quy tắc đảm bảo an ninh quốc gia, và chúng tôi có toàn quyền cho phép hoặc không cho phép bài viết của bạn xuất hiện hay tồn tại tại các khu vực được phép chia sẻ thông tin.\r5. HẠN CHẾ HOẠT ĐỘNG\rKhông giới hạn các biện pháp khắc phục hậu quả khác, chúng tôi có thể chấm dứt sự tham gia của bạn, loại bỏ thông tin của bạn  và từ chối cung cấp dịch vụ nếu:\r(a). Bạn đ&atilde; sử dụng sai mục đích các các dịch vụ, có hành vi trái pháp luật hoặc đạo đức.\r(b). chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin bạn cung cấp không trung thực hoặc không chính xác.\r(c). chúng tôi tin rằng hành động của bạn là gian lận, lừa đảo và có thể gây ra tổn thất tài chính hoặc trách nhiệm pháp lý cho  chúng tôi.\r(d). sử dụng các dịch vụ với mục đích thương mại mà không có sự đồng ý trước bằng văn bản đồng ý của chúng tôi.\r(e). vi phạm các quyền của chúng tôi hoặc bên thứ ba, bao gồm nhưng không giới hạn quyền sở hữu trí tuệ, quyền tác giả, bằng sáng chế, thương hiệu, bí mật thương mại hoặc các quyền riêng tư.\r(f). phát tán các ứng dụng độc hại hoặc tấn công chiếm đoạt quyền điều khiển hệ thống, dữ liệu hoặc thông tin cá nhân.\r6. BẢO MẬT\rChúng tôi không bán hoặc cho thuê thông tin của bạn cho bên thứ ba mà không có sự cho phép của bạn và chúng tôi chỉ sử dụng thông tin của bạn như được mô tả trong \rĐiều khoản riêng tư\rChúng tôi xem bảo vệ sự riêng tư của người sử dụng như một nguyên tắc quan trọng hàng đầu. Bạn có thể xem xét lại chính sách bảo mật hiện tại của chúng tôi tại \rĐiều khoản riêng tư\r7. SỞ HỮU TR&Iacute; TUỆ\rTrừ phi được sự đồng ý của chúng tôi, bạn không được phép tải lên, gửi, xuất bản, sửa đổi, tái sản xuất, truyền hoặc phân phát bằng bất cứ hình thức nào bất cứ thành phần nào của Dịch vụ mà chúng tôi cung cấp. Chúng tôi có toàn quyền, bao gồm nhưng không chỉ giới hạn trong các quyền tác giả, thương hiệu, và các quyền sở hữu khác mà chúng tôi có trong các Dịch vụ này .Tất cả các yếu tố cấu thành lên Dịch vụ mà chúng tôi cung cấp đều thuộc phạm vị sở hữu của chúng tôi cho dù đã đăng ký hoặc chưa đăng ký. Việc sử dụng quyền và sở hữu của chúng tôi cần phải được chúng tôi cho phép trước bằng văn bản. Ngoài việc cấp phép bằng văn bản, chúng tôi không cấp phép dưới bất kỳ hình thức nào khác cho dù đó là hình thức công bố hay hàm ý, hoặc thông qua việc để bạn sử dụng dịch vụ. Và do vậy, bạn không có quyền sử dụng Dịch vụ của chúng tôi vào mục đích thương mại mà không có sự cho phép bằng văn bản của chúng tôi trước đó.\r8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP\rThông qua việc đăng ký hoặc sử dụng website và dịch vụ của chúng tôi, bạn mặc nhiên đồng ý và tuân thủ toàn bộ các quy định của Luật pháp Việt Nam . Trong trường hợp một hoặc một số điều khoản của bản Quy định sử dụng này xung đột với các quy định của luật pháp và bị T&ograve;a án coi là vô hiệu, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định của pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.','','SỬ DỤNG DỊCH VỤ\r\n1. CHẤP NHẬN CC ĐIỀU KHOẢN\rTHỎA THUẬN SAU ĐY L MỘT THỎA THUẬN RÀNG BUỘC PHP L GIỮA BẠN VÀ \rHTTP://APKA.VN\r(\"CHNG TI). THỎA THUẬN BAO GỒM CÁC ĐIỀU KHOẢN DỊCH VỤ MÀ BẠN PHẢI TUÂN THỦ ĐỂ ĐƯỢC QUYỀN TIẾP CẬN VÀ SỬ DỤNG DỊCH VỤ  TRN TRANG WEB  VÀ CÁC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI.  TẠI TỪNG THỜI ĐIỂM, CHÚNG TÔI C THỂ CẬP NHẬT ĐIỀU KHOẢN DỊCH VỤ THEO QUYẾT ĐỊNH CỦA MNH MÀ KHÔNG CẦN THÔNG BÁO TRỰC TIẾP CHO BẠN. BẠN CHỊU TRÁCH NHIỆM TÌM HIỂU PHIÊN BẢN MỚI NHẤT BẰNG CÁCH TRUY CẬP WEBSITE HTTP://APKA.VN/.\rXIN VUI LNG ĐỌC ĐIỀU KHOẢN DỊCH VỤ NY MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K LÀM THÀNH VIN. NẾU BẠN KHNG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CHNG TÔI.\r2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP\rBẠN SẼ NHẬN ĐƯỢC MỘT MẬT KHẨU VÀ TÀI KHOẢN SAU KHI HOÀN TẤT THỦ TỤC ĐĂNG KÝ LÀM THÀNH VIÊN. BẠN CÓ TRÁCH NHIỆM BẢO MẬT MẬT KHẨU VÀ TÀI KHOẢN, VÀ HOÀN TOÀN CHỊU TRÁCH NHIỆM ĐỐI VỚI TẤT CẢ CÁC HOẠT ĐỘNG DIỄN RA DƯỚI VIỆC SỬ DỤNG MẬT KHẨU HOẶC TÀI KHOẢN CỦA MÌNH. BẠN ĐỒNG Ý (A) THÔNG BÁO NGAY CHO CHÚNG TÔI VỀ BẤT CỨ TRƯỜNG HỢP NÀO SỬ DỤNG TRÁI PHP MẬT KHẨU HOẶC TÀI KHOẢN CỦA BẠN HOẶC BẤT CỨ TRƯỜNG HỢP NÀO KHÁC VI PHẠM SỰ BẢO MẬT, VÀ (B) BẢO ĐẢM RẰNG BẠN LUÔN THOÁT KHỎI TÀI KHOẢN CỦA MÌNH SAU MỖI LẦN SỬ DỤNG. CHÚNG TÔI KHÔNG THỂ VÀ SẼ KHÔNG CHỊU TRÁCH NHIỆM ĐỐI VỚI BẤT CỨ TỔN THẤT HOẶC THIỆT HẠI NÀO PHÁT SINH DO BẠN KHÔNG TUÂN THỦ QUY ĐỊNH NÀY.\r3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN\rV\rỚI TƯ CÁCH LÀ NGƯỜI SỬ DỤNG DỊCH VỤ, BẠN PHẢI CAM KẾT:\r(A) BẠN CÓ ĐỦ TƯ CÁCH PHÁP LÝ VÀ TƯ CÁCH HÀNH VI KHI SỬ DỤNG DỊCH VỤ\r(B) CUNG CẤP CÁC THÔNG TIN ĐẦY ĐỦ, TRUNG THỰC VÀ CHNH XÁC VỀ BẢN THÂN TRONG HỒ SƠ CÁ NHÂN\r(C) DUY TRÌ VÀ CẬP NHẬT KỊP THỜI HỒ SƠ CÁ NHÂN ĐỂ BẢO ĐẢM RẰNG DỮ LIỆU NÀY LÀ ĐẦY ĐỦ, TRUNG THỰC VÀ CHÍNH XÁC.\rNẾU BẠN CUNG CẤP BẤT CỨ THÔNG TIN NÀO KHÔNG PHẢI LÀ KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC, HOẶC NẾU CHÚNG TÔI CÓ CĂN CỨ HỢP LÝ ĐỂ NGHI NGỜ RẰNG THÔNG TIN ĐÓ KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC, CHÚNG TÔI CÓ QUYỀN ĐÌNH CHỈ HOẶC CHẤM DỨT TÀI KHOẢN CỦA BẠN; TỪ CHỐI MỘT PHẦN HOẶC TOÀN BỘ VIỆC SỬ DỤNG DỊCH VỤ TẠI THỜI ĐIỂM HIỆN TẠI HOẶC TRONG TƯƠNG LAI.\r4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI\rBẠN HIỂU RẰNG BẠN HOÀN TOÀN CHỊU TRÁCH NHIỆM TRƯỚC PHÁP LUẬT VỀ CÁC NỘI DUNG BẠN TẠO RA BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở DỮ LIỆU, VĂN BẢN, PHẦN MỀM, ÂM THANH, HÌNH ẢNH, VIDEO, EMAIL. CHÚNG TÔI KHÔNG CÓ NGHĨA VỤ THEO DI CÁC TÀI LIỆU ĐƯỢC ĐĂNG VÀ VÌ VẬY, KHÔNG BẢO ĐẢM VỀ TÍNH HỢP PHÁP, CHÍNH XÁC, NGUYÊN VẸN HOẶC CHẤT LƯỢNG CỦA NỘI DUNG ĐÓ. TẠI CÁC KHU VỰC ĐƯỢC PHÉP ĐĂNG TẢI NỘI DUNG, BẠN CÓ THỂ CHIA SẺ THÔNG TIN ĐƯỢC PHÉP DƯỚI CÁC ĐỊNH DẠNG CHÚNG TÔI MẶC ĐỊNH VÀ BẠN PHẢI TỰ CHỊU TRÁCH NHIỆM ĐỐI VỚI CÁC NỘI DUNG, THÔNG TIN, HÌNH ẢNH VÀ BẤT KỲ SỰ CHIA SẺ NÀO KHÁC CỦA BẠN VỚI CÁ NHÂN NGƯỜI SỬ DỤNG HOẶC NHÓM NGƯỜI SỬ DỤNG. TUY NHIÊN, TRONG MỌI TRƯỜNG HỢP, CHÚNG TÔI VẪN ĐƯỢC BẢO LƯU QUYỀN XỬ LÝ CÁC THÔNG TIN ĐĂNG TẢI CHO PH HỢP VỚI THUẦN PHONG MỸ TỤC, CÁC QUY TẮC ĐẠO ĐỨC VÀ CÁC QUY TẮC ĐẢM BẢO AN NINH QUỐC GIA, VÀ CHÚNG TÔI CÓ TOÀN QUYỀN CHO PHÉP HOẶC KHÔNG CHO PHÉP BÀI VIẾT CỦA BẠN XUẤT HIỆN HAY TỒN TẠI TẠI CÁC KHU VỰC ĐƯỢC PHÉP CHIA SẺ THÔNG TIN.\r5. HẠN CHẾ HOẠT ĐỘNG\rKHÔNG GIỚI HẠN CÁC BIỆN PHÁP KHẮC PHỤC HẬU QUẢ KHÁC, CHÚNG TÔI CÓ THỂ CHẤM DỨT SỰ THAM GIA CỦA BẠN, LOẠI BỎ THÔNG TIN CỦA BẠN  VÀ TỪ CHỐI CUNG CẤP DỊCH VỤ NẾU:\r(A). BẠN Đ SỬ DỤNG SAI MỤC ĐÍCH CÁC CÁC DỊCH VỤ, CÓ HÀNH VI TRÁI PHÁP LUẬT HOẶC ĐẠO ĐỨC.\r(B). CHÚNG TÔI CÓ CĂN CỨ HỢP LÝ ĐỂ NGHI NGỜ RẰNG THÔNG TIN BẠN CUNG CẤP KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC.\r(C). CHÚNG TÔI TIN RẰNG HÀNH ĐỘNG CỦA BẠN LÀ GIAN LẬN, LỪA ĐẢO VÀ CÓ THỂ GÂY RA TỔN THẤT TÀI CHÍNH HOẶC TRÁCH NHIỆM PHÁP LÝ CHO  CHÚNG TÔI.\r(D). SỬ DỤNG CÁC DỊCH VỤ VỚI MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ ĐỒNG Ý TRƯỚC BẰNG VĂN BẢN ĐỒNG Ý CỦA CHÚNG TÔI.\r(E). VI PHẠM CÁC QUYỀN CỦA CHÚNG TÔI HOẶC BÊN THỨ BA, BAO GỒM NHƯNG KHÔNG GIỚI HẠN QUYỀN SỞ HỮU TRÍ TUỆ, QUYỀN TÁC GIẢ, BẰNG SÁNG CHẾ, THƯƠNG HIỆU, BÍ MẬT THƯƠNG MẠI HOẶC CÁC QUYỀN RIÊNG TƯ.\r(F). PHÁT TÁN CÁC ỨNG DỤNG ĐỘC HẠI HOẶC TẤN CÔNG CHIẾM ĐOẠT QUYỀN ĐIỀU KHIỂN HỆ THỐNG, DỮ LIỆU HOẶC THÔNG TIN CÁ NHÂN.\r6. BẢO MẬT\rCHÚNG TÔI KHÔNG BÁN HOẶC CHO THUÊ THÔNG TIN CỦA BẠN CHO BÊN THỨ BA MÀ KHÔNG CÓ SỰ CHO PHÉP CỦA BẠN VÀ CHÚNG TÔI CHỈ SỬ DỤNG THÔNG TIN CỦA BẠN NHƯ ĐƯỢC MÔ TẢ TRONG \rĐIỀU KHOẢN RIÊNG TƯ\rCHÚNG TÔI XEM BẢO VỆ SỰ RIÊNG TƯ CỦA NGƯỜI SỬ DỤNG NHƯ MỘT NGUYÊN TẮC QUAN TRỌNG HÀNG ĐẦU. BẠN CÓ THỂ XEM XÉT LẠI CHÍNH SÁCH BẢO MẬT HIỆN TẠI CỦA CHÚNG TÔI TẠI \rĐIỀU KHOẢN RIÊNG TƯ\r7. SỞ HỮU TR TUỆ\rTRỪ PHI ĐƯỢC SỰ ĐỒNG Ý CỦA CHÚNG TÔI, BẠN KHÔNG ĐƯỢC PHÉP TẢI LÊN, GỬI, XUẤT BẢN, SỬA ĐỔI, TÁI SẢN XUẤT, TRUYỀN HOẶC PHÂN PHÁT BẰNG BẤT CỨ HÌNH THỨC NÀO BẤT CỨ THÀNH PHẦN NÀO CỦA DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP. CHÚNG TÔI CÓ TOÀN QUYỀN, BAO GỒM NHƯNG KHÔNG CHỈ GIỚI HẠN TRONG CÁC QUYỀN TÁC GIẢ, THƯƠNG HIỆU, VÀ CÁC QUYỀN SỞ HỮU KHÁC MÀ CHÚNG TÔI CÓ TRONG CÁC DỊCH VỤ NÀY .TẤT CẢ CÁC YẾU TỐ CẤU THÀNH LÊN DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP ĐỀU THUỘC PHẠM VỊ SỞ HỮU CỦA CHÚNG TÔI CHO DÙ ĐÃ ĐĂNG KÝ HOẶC CHƯA ĐĂNG KÝ. VIỆC SỬ DỤNG QUYỀN VÀ SỞ HỮU CỦA CHÚNG TÔI CẦN PHẢI ĐƯỢC CHÚNG TÔI CHO PHÉP TRƯỚC BẰNG VĂN BẢN. NGOÀI VIỆC CẤP PHÉP BẰNG VĂN BẢN, CHÚNG TÔI KHÔNG CẤP PHÉP DƯỚI BẤT KỲ HÌNH THỨC NÀO KHÁC CHO DÙ ĐÓ LÀ HÌNH THỨC CÔNG BỐ HAY HÀM Ý, HOẶC THÔNG QUA VIỆC ĐỂ BẠN SỬ DỤNG DỊCH VỤ. VÀ DO VẬY, BẠN KHÔNG CÓ QUYỀN SỬ DỤNG DỊCH VỤ CỦA CHÚNG TÔI VÀO MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ CHO PHÉP BẰNG VĂN BẢN CỦA CHÚNG TÔI TRƯỚC ĐÓ.\r8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP\rTHÔNG QUA VIỆC ĐĂNG KÝ HOẶC SỬ DỤNG WEBSITE VÀ DỊCH VỤ CỦA CHÚNG TÔI, BẠN MẶC NHIÊN ĐỒNG Ý VÀ TUÂN THỦ TOÀN BỘ CÁC QUY ĐỊNH CỦA LUẬT PHÁP VIỆT NAM . TRONG TRƯỜNG HỢP MỘT HOẶC MỘT SỐ ĐIỀU KHOẢN CỦA BẢN QUY ĐỊNH SỬ DỤNG NÀY XUNG ĐỘT VỚI CÁC QUY ĐỊNH CỦA LUẬT PHÁP VÀ BỊ TA ÁN COI LÀ VÔ HIỆU, ĐIỀU KHOẢN ĐÓ SẼ ĐƯỢC CHỈNH SỬA CHO PHÙ HỢP VỚI QUY ĐỊNH CỦA PHÁP LUẬT HIỆN HÀNH, VÀ PHẦN CÒN LẠI CỦA QUY ĐỊNH SỬ DỤNG VẪN GIỮ NGUYÊN GIÁ TRỊ.\r\n','vn','9',NULL,NULL,NULL),(53,'2018-04-13 16:54:26','iblock','89','s1',0,'=ID=89&EXTERNAL_ID=89&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=giai-quyet-su-co-va-khieu-nai','Giải quyết sự cố và khiếu nại','1. Sự cố ph&aacute;t sinh trong quá tr&igrave;nh đặt chỗ, hủy chỗ\r Trong quá trình đặt chỗ tr&ecirc;n website \rhttp://apka.vn\r, nếu c&oacute; bất kì sự cố n&agrave;o trong quá trình đặt chỗ bao gồm nhưng kh&ocirc;ng giới hạn ở :\rĐiền và xác nhận thông tin về xe/chỗ cần đặt\rQuá trình thanh toán\rHủy chỗ và hoàn tiền\rPhát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến khách hàng không hoàn tất giao dịch đặt chỗ\rKhách hàng h&atilde;y sử dụng một trong những hình thức  hỗ trợ sau:\rChat với bộ phận hỗ trợ khách hàng trực tuyến \rGửi mail về contact@apka.vn\rGọi điện về Tổng đài 0981.370.360\r2. Sự cố phát sinh khi sử dụng dịch vụ\rNếu có trục trặc xảy ra trong việc xác nhận v&eacute; điện tử giữa khách hàng và tài xế, Cơ sở để giải quyết tranh chấp dựa trên các thông tin, chứng từ (mã vé điện tử hoặc thông tin cá nh&acirc;n) do khách hàng cung cấp và đối chiếu, so sánh với thông tin khách hàng cung cấp khi đặt chỗ đã được được lưu trữ trên hệ thống cơ sở dữ liệu của \rhttp://apka.vn\rTrong trường hợp xảy ra khiếu nại liên quan đến thời gian phục vụ. Cơ sở để giải quyết tranh chấp là thông tin khách hàng đã cung cấp về thời gian đón đã ghi nhận trên hệ thống và thời gian chờ được qui định chi tiết trong \rCh&iacute;nh sách vận chuyển\r của ch&uacute;ng tôi. Nếu tài xế  vi phạm về thời gian đã qui định, khách hàng có quyền khiếu nại đ&ograve;i bồi thường.\rTrong trường hợp xảy ra những khiếu nại liên quan đến thái độ và chất lượng phục vụ của tài xế cũng như chất lượng phương tiện. Cơ sở để giải quyết tranh chấp là những nội dung Quí khách trao đổi trực tiếp với tổng đài ( đã được ghi âm)  hoặc các tài liệu chứng minh như ảnh chụp, file âm thanh, lời khai của bên thứ ba.. do Quí khách cung cấp.\rTất cả các sự cố phát sinh khi sử dụng dịch vụ, Quí khách vui lòng liên hệ để được hỗ trợ bằng một trong các cách sau:\rPhản ánh trực tiếp với hãng vận chuyển trực tiếp phục vụ\r3. Sự cố phát sinh khác\rKhi có bất kỳ sự cố nào phát sinh, cơ sở đầu tiên để giải quyết tranh chấp căn cứ vào \rChính sách vận chuyển\r và các \rHướng dẫn sử dụng dịch vụ\r của chúng tôi. Chúng tôi sẽ thực hiện mọi nỗ lực hợp l&yacute; để giải quyết các khiếu nại của khách hàng sử dụng dịch vụ đặt chỗ trực tuyến. Nếu những nỗ lực đó thất bại, khách hàng phải đồng ý rằng bất kỳ khiếu nại, tranh chấp của khách hàng đối với chúng tôi đều được giải quyết theo đúng quy định của pháp luật Việt Nam. \rVui lòng liên hệ bằng một trong các cách sau khi cần hỗ trợ:\rGửi mail về contact@apka.vn\rGọi điện về số hỗ trợ 0981.370.360','','GIẢI QUYẾT SỰ CỐ VÀ KHIẾU NẠI\r\n1. SỰ CỐ PHT SINH TRONG QUÁ TRNH ĐẶT CHỖ, HỦY CHỖ\r TRONG QUÁ TRÌNH ĐẶT CHỖ TRN WEBSITE \rHTTP://APKA.VN\r, NẾU C BẤT KÌ SỰ CỐ NO TRONG QUÁ TRÌNH ĐẶT CHỖ BAO GỒM NHƯNG KHNG GIỚI HẠN Ở :\rĐIỀN VÀ XÁC NHẬN THÔNG TIN VỀ XE/CHỖ CẦN ĐẶT\rQUÁ TRÌNH THANH TOÁN\rHỦY CHỖ VÀ HOÀN TIỀN\rPHÁT SINH LỖI KỸ THUẬT, LỖI PHẦN MỀM HOẶC CÁC LỖI KHÁCH QUAN KHÁC DẪN ĐẾN KHÁCH HÀNG KHÔNG HOÀN TẤT GIAO DỊCH ĐẶT CHỖ\rKHÁCH HÀNG HY SỬ DỤNG MỘT TRONG NHỮNG HÌNH THỨC  HỖ TRỢ SAU:\rCHAT VỚI BỘ PHẬN HỖ TRỢ KHÁCH HÀNG TRỰC TUYẾN \rGỬI MAIL VỀ CONTACT@APKA.VN\rGỌI ĐIỆN VỀ TỔNG ĐÀI 0981.370.360\r2. SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH VỤ\rNẾU CÓ TRỤC TRẶC XẢY RA TRONG VIỆC XÁC NHẬN V ĐIỆN TỬ GIỮA KHÁCH HÀNG VÀ TÀI XẾ, CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP DỰA TRÊN CÁC THÔNG TIN, CHỨNG TỪ (MÃ VÉ ĐIỆN TỬ HOẶC THÔNG TIN CÁ NHN) DO KHÁCH HÀNG CUNG CẤP VÀ ĐỐI CHIẾU, SO SÁNH VỚI THÔNG TIN KHÁCH HÀNG CUNG CẤP KHI ĐẶT CHỖ ĐÃ ĐƯỢC ĐƯỢC LƯU TRỮ TRÊN HỆ THỐNG CƠ SỞ DỮ LIỆU CỦA \rHTTP://APKA.VN\rTRONG TRƯỜNG HỢP XẢY RA KHIẾU NẠI LIÊN QUAN ĐẾN THỜI GIAN PHỤC VỤ. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ THÔNG TIN KHÁCH HÀNG ĐÃ CUNG CẤP VỀ THỜI GIAN ĐÓN ĐÃ GHI NHẬN TRÊN HỆ THỐNG VÀ THỜI GIAN CHỜ ĐƯỢC QUI ĐỊNH CHI TIẾT TRONG \rCHNH SÁCH VẬN CHUYỂN\r CỦA CHNG TÔI. NẾU TÀI XẾ  VI PHẠM VỀ THỜI GIAN ĐÃ QUI ĐỊNH, KHÁCH HÀNG CÓ QUYỀN KHIẾU NẠI ĐI BỒI THƯỜNG.\rTRONG TRƯỜNG HỢP XẢY RA NHỮNG KHIẾU NẠI LIÊN QUAN ĐẾN THÁI ĐỘ VÀ CHẤT LƯỢNG PHỤC VỤ CỦA TÀI XẾ CŨNG NHƯ CHẤT LƯỢNG PHƯƠNG TIỆN. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ NHỮNG NỘI DUNG QUÍ KHÁCH TRAO ĐỔI TRỰC TIẾP VỚI TỔNG ĐÀI ( ĐÃ ĐƯỢC GHI ÂM)  HOẶC CÁC TÀI LIỆU CHỨNG MINH NHƯ ẢNH CHỤP, FILE ÂM THANH, LỜI KHAI CỦA BÊN THỨ BA.. DO QUÍ KHÁCH CUNG CẤP.\rTẤT CẢ CÁC SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH VỤ, QUÍ KHÁCH VUI LÒNG LIÊN HỆ ĐỂ ĐƯỢC HỖ TRỢ BẰNG MỘT TRONG CÁC CÁCH SAU:\rPHẢN ÁNH TRỰC TIẾP VỚI HÃNG VẬN CHUYỂN TRỰC TIẾP PHỤC VỤ\r3. SỰ CỐ PHÁT SINH KHÁC\rKHI CÓ BẤT KỲ SỰ CỐ NÀO PHÁT SINH, CƠ SỞ ĐẦU TIÊN ĐỂ GIẢI QUYẾT TRANH CHẤP CĂN CỨ VÀO \rCHÍNH SÁCH VẬN CHUYỂN\r VÀ CÁC \rHƯỚNG DẪN SỬ DỤNG DỊCH VỤ\r CỦA CHÚNG TÔI. CHÚNG TÔI SẼ THỰC HIỆN MỌI NỖ LỰC HỢP L ĐỂ GIẢI QUYẾT CÁC KHIẾU NẠI CỦA KHÁCH HÀNG SỬ DỤNG DỊCH VỤ ĐẶT CHỖ TRỰC TUYẾN. NẾU NHỮNG NỖ LỰC ĐÓ THẤT BẠI, KHÁCH HÀNG PHẢI ĐỒNG Ý RẰNG BẤT KỲ KHIẾU NẠI, TRANH CHẤP CỦA KHÁCH HÀNG ĐỐI VỚI CHÚNG TÔI ĐỀU ĐƯỢC GIẢI QUYẾT THEO ĐÚNG QUY ĐỊNH CỦA PHÁP LUẬT VIỆT NAM. \rVUI LÒNG LIÊN HỆ BẰNG MỘT TRONG CÁC CÁCH SAU KHI CẦN HỖ TRỢ:\rGỬI MAIL VỀ CONTACT@APKA.VN\rGỌI ĐIỆN VỀ SỐ HỖ TRỢ 0981.370.360\r\n','vn','9',NULL,NULL,NULL),(62,'2018-04-13 17:27:57','main','s1|/app.book/index.php','s1',0,'/app.book/index.php','Furniture Company','Thoải m&aacute;i như xe nh&agrave;. Giá rẻ như xe khách\rS&acirc;n bay\r&times;\r×\rXEM GI&Aacute;\rĐảm bảo Giá tốt nhất\rSo sánh h&atilde;ng để chọn giá tốt nhất\rB&ugrave; giá nếu t&igrave;m được giá tốt hơn\rĐặt sớm tiết kiệm th&ecirc;m 30%\rCam kết chất lượng\rLu&ocirc;n có xe nếu đặt trước\rBồi thường nếu đón muộn\rHoàn tiền nếu không hài l&ograve;ng\rTiện ích đặc biệt\rDịch vụ đi gh&eacute;p giá siêu rẻ\rThể hiện phong cách sống xanh\rĐi lại thân thiện với môi trường','','FURNITURE COMPANY\r\nTHOẢI MI NHƯ XE NH. GIÁ RẺ NHƯ XE KHÁCH\rSN BAY\r\r×\rXEM GI\rĐẢM BẢO GIÁ TỐT NHẤT\rSO SÁNH HNG ĐỂ CHỌN GIÁ TỐT NHẤT\rB GIÁ NẾU TM ĐƯỢC GIÁ TỐT HƠN\rĐẶT SỚM TIẾT KIỆM THM 30%\rCAM KẾT CHẤT LƯỢNG\rLUN CÓ XE NẾU ĐẶT TRƯỚC\rBỒI THƯỜNG NẾU ĐÓN MUỘN\rHOÀN TIỀN NẾU KHÔNG HÀI LNG\rTIỆN ÍCH ĐẶC BIỆT\rDỊCH VỤ ĐI GHP GIÁ SIÊU RẺ\rTHỂ HIỆN PHONG CÁCH SỐNG XANH\rĐI LẠI THÂN THIỆN VỚI MÔI TRƯỜNG\r\n','','','s1',NULL,NULL),(54,'2018-03-31 01:06:31','iblock','90','s1',0,'=ID=90&EXTERNAL_ID=90&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=huong-dan-dat-xe','Hướng dẫn đặt xe','Hướng dẫn đặt xe...\r\nThông tin đang cập nhật. Bạn vui lòng trở lại sau','','HƯỚNG DẪN ĐẶT XE\r\nHƯỚNG DẪN ĐẶT XE...\r\nTHÔNG TIN ĐANG CẬP NHẬT. BẠN VUI LÒNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL),(55,'2017-12-24 11:49:11','iblock','91','s1',0,'=ID=91&EXTERNAL_ID=91&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=huong-dan-su-dung','Hướng dẫn sử dụng','Nội dung','','HƯỚNG DẪN SỬ DỤNG\r\nNỘI DUNG\r\n','vn','9',NULL,NULL,NULL),(56,'2017-12-24 11:49:38','iblock','92','s1',0,'=ID=92&EXTERNAL_ID=92&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=cau-hoi-thuong-gap','Câu hỏi thường gặp','Câu 1: \r\nTrả lời:','','CÂU HỎI THƯỜNG GẶP\r\nCÂU 1: \r\nTRẢ LỜI:\r\n','vn','9',NULL,NULL,NULL),(58,'2018-03-31 01:03:45','iblock','94','s1',0,'=ID=94&EXTERNAL_ID=94&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=10&IBLOCK_CODE=cam-nan-di-lai&IBLOCK_EXTERNAL_ID=&CODE=ve-chung-toi','Về chúng tôi','APKA.VN hiện nay với hơn 4000 đối t&aacute;c lái xe tham gia hợp tác, gi&uacute;p h&agrave;nh khách t&igrave;m được xe giá tốt, lu&ocirc;n giúp chuy&ecirc;n đi vui th&iacute;ch. Dựa trên nền tảng công nghệ website và di động, www.apka.vn phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. Hành khách c&oacute; thể sử dụng các công nghệ của APKA để tìm kiếm, lựa chọn và đặt các loại xe từ 4 chỗ đến 8 chỗ với cả hai hình thức di chuyển đi riêng xe và đi chung xe. Giải pháp của APKA cũng giúp cho các hãng taxi và xe hợp đồng thúc đẩy sự trung thành của khách hàng và tối ưu lợi nhuận cho từng chuyến đi. \rAPKA trực thuộc Công ty cổ phần đầu tư \rAn Phát Khánh\rlà một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (trên nền tảng Grab).\rCác lĩnh vực hoạt động: \r1. Mua Bán xe ô tô cũ mới, mua xe trả góp: \rapkauto.vn\r2. Gara bảo dưỡng, sửa chữa xe ô tô: \ranphatauto.com\r3. Đầu tư, cho thuê và hợp tác xe Grab: \ranphatkhanh.vn\r4. Mua bán bảo hiểm ô tô: \ranphatkhanh.vn\r5. Dự án xe Nội Bài, xe chạy tỉnh: \rapka.vn','','VỀ CHÚNG TÔI\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI TC LÁI XE THAM GIA HỢP TÁC, GIP HNH KHÁCH TM ĐƯỢC XE GIÁ TỐT, LUN GIÚP CHUYN ĐI VUI THCH. DỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN PHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC HNG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. HÀNH KHÁCH C THỂ SỬ DỤNG CÁC CÔNG NGHỆ CỦA APKA ĐỂ TÌM KIẾM, LỰA CHỌN VÀ ĐẶT CÁC LOẠI XE TỪ 4 CHỖ ĐẾN 8 CHỖ VỚI CẢ HAI HÌNH THỨC DI CHUYỂN ĐI RIÊNG XE VÀ ĐI CHUNG XE. GIẢI PHÁP CỦA APKA CŨNG GIÚP CHO CÁC HÃNG TAXI VÀ XE HỢP ĐỒNG THÚC ĐẨY SỰ TRUNG THÀNH CỦA KHÁCH HÀNG VÀ TỐI ƯU LỢI NHUẬN CHO TỪNG CHUYẾN ĐI. \rAPKA TRỰC THUỘC CÔNG TY CỔ PHẦN ĐẦU TƯ \rAN PHÁT KHÁNH\rLÀ MỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRÊN NỀN TẢNG GRAB).\rCÁC LĨNH VỰC HOẠT ĐỘNG: \r1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GÓP: \rAPKAUTO.VN\r2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: \rANPHATAUTO.COM\r3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: \rANPHATKHANH.VN\r4. MUA BÁN BẢO HIỂM Ô TÔ: \rANPHATKHANH.VN\r5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: \rAPKA.VN\r\n','vn','10',NULL,NULL,NULL),(59,'2018-01-31 23:10:54','main','s1|/index.php','s1',0,'/index.php','Furniture Company','Thoải mái như xe nhà. Giá rẻ như xe khách\rSân bay\rĐường dài\rTrong thành phố\r×\r×\rXEM GIÁ\rĐảm bảo Giá tốt nhất\rSo sánh hãng để chọn giá tốt nhất\rBù giá nếu tìm được giá tốt hơn\rĐặt sớm tiết kiệm thêm 30%\rCam kết chất lượng\rLuôn có xe nếu đặt trước\rBồi thường nếu đón muộn\rHoàn tiền nếu không hài lòng\rTiện ích đặc biệt\rDịch vụ đi ghép giá siêu rẻ\rThể hiện phong cách sống xanh\rĐi lại thân thiện với môi trường','','FURNITURE COMPANY\r\nTHOẢI MÁI NHƯ XE NHÀ. GIÁ RẺ NHƯ XE KHÁCH\rSÂN BAY\rĐƯỜNG DÀI\rTRONG THÀNH PHỐ\r×\r×\rXEM GIÁ\rĐẢM BẢO GIÁ TỐT NHẤT\rSO SÁNH HÃNG ĐỂ CHỌN GIÁ TỐT NHẤT\rBÙ GIÁ NẾU TÌM ĐƯỢC GIÁ TỐT HƠN\rĐẶT SỚM TIẾT KIỆM THÊM 30%\rCAM KẾT CHẤT LƯỢNG\rLUÔN CÓ XE NẾU ĐẶT TRƯỚC\rBỒI THƯỜNG NẾU ĐÓN MUỘN\rHOÀN TIỀN NẾU KHÔNG HÀI LÒNG\rTIỆN ÍCH ĐẶC BIỆT\rDỊCH VỤ ĐI GHÉP GIÁ SIÊU RẺ\rTHỂ HIỆN PHONG CÁCH SỐNG XANH\rĐI LẠI THÂN THIỆN VỚI MÔI TRƯỜNG\r\n','','',NULL,NULL,NULL),(61,'2018-03-31 00:56:40','iblock','141','s1',0,'=ID=141&EXTERNAL_ID=141&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=8&IBLOCK_CODE=tin-tuc&IBLOCK_EXTERNAL_ID=&CODE=chuc-mung-sinh-nhat-02-tuoi','Mừng sinh nhật An Phát Khánh tròn 02 tuổi','Thời gian trôi qua và chứng kiến những đổi thay trong từng bước đi của An Phát Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nhân viên đã cùng nhau đoàn tụ tổng kết, chúc mừng công ty tròn hai tuổi.\r\n\r\n\rThời gian tr&ocirc;i qua v&agrave; chứng kiến những đổi thay trong từng bước đi của An Ph&aacute;t Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nh&acirc;n vi&ecirc;n đ&atilde; c&ugrave;ng nhau đoàn tụ tổng kết, ch&uacute;c mừng công ty tr&ograve;n hai tuổi.\rMở đầu những tiếng cười n&oacute;i hổ hởi chuẩn bị cho một bữa tiệc hoành tráng, tiếp sau đó là một khoảng thời gian tĩnh lặng cùng nh&igrave;n những khó khăn, thành quả đạt được trong hai năm vừa qua và cùng nhau hướng đến một tương lai mới khi bước sang tuổi thứ ba.\rThay mặt toàn thể công ty Giám đốc công ty đã có một bài phát biểu với nội dung khẳng định thế mạnh của những dịch vụ công ty đang cung cấp trên thị trường hiện nay. Tiếp theo đó là những mục tiêu đặt ra trong năm tới, đạt được những thành tựu như đã đặt ra \rVới đội ngũ nhân viên trẻ trung năng động, 99% là thế hệ 9X nên không có gì làm khó được tinh thần tuổi trẻ, trên con đường thành công của công ty là những đóng góp vô cùng to lớn của những người mang tâm huyết của trẻ này.\rBữa tiệc đã diễn ra với không kh&iacute; vui vẻ, hòa chung với niềm vui đó là những đại diện khách mời từ các đối tác, bạn b&egrave; chiến hữu gần xa cùng chúc nhau thêm những thành công mới, công ty lên một tầm cao mới \rLời cuối xin chúc cho toàn thể cán bộ nhân viên công ty luôn khỏe mạnh, tinh thần sảng khoái để hoàn thành công việc tốt nhất, phát triển bản thân mình một tầm cao mới.\rCùng nhau đưa công ty trở thành một trong những công ty đứng đầu về ngành vận tải trong thời gian tới.','','MỪNG SINH NHẬT AN PHÁT KHÁNH TRÒN 02 TUỔI\r\nTHỜI GIAN TRÔI QUA VÀ CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHÁT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHÂN VIÊN ĐÃ CÙNG NHAU ĐOÀN TỤ TỔNG KẾT, CHÚC MỪNG CÔNG TY TRÒN HAI TUỔI.\r\n\r\n\rTHỜI GIAN TRI QUA V CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHN VIN Đ CNG NHAU ĐOÀN TỤ TỔNG KẾT, CHC MỪNG CÔNG TY TRN HAI TUỔI.\rMỞ ĐẦU NHỮNG TIẾNG CƯỜI NI HỔ HỞI CHUẨN BỊ CHO MỘT BỮA TIỆC HOÀNH TRÁNG, TIẾP SAU ĐÓ LÀ MỘT KHOẢNG THỜI GIAN TĨNH LẶNG CÙNG NHN NHỮNG KHÓ KHĂN, THÀNH QUẢ ĐẠT ĐƯỢC TRONG HAI NĂM VỪA QUA VÀ CÙNG NHAU HƯỚNG ĐẾN MỘT TƯƠNG LAI MỚI KHI BƯỚC SANG TUỔI THỨ BA.\rTHAY MẶT TOÀN THỂ CÔNG TY GIÁM ĐỐC CÔNG TY ĐÃ CÓ MỘT BÀI PHÁT BIỂU VỚI NỘI DUNG KHẲNG ĐỊNH THẾ MẠNH CỦA NHỮNG DỊCH VỤ CÔNG TY ĐANG CUNG CẤP TRÊN THỊ TRƯỜNG HIỆN NAY. TIẾP THEO ĐÓ LÀ NHỮNG MỤC TIÊU ĐẶT RA TRONG NĂM TỚI, ĐẠT ĐƯỢC NHỮNG THÀNH TỰU NHƯ ĐÃ ĐẶT RA \rVỚI ĐỘI NGŨ NHÂN VIÊN TRẺ TRUNG NĂNG ĐỘNG, 99% LÀ THẾ HỆ 9X NÊN KHÔNG CÓ GÌ LÀM KHÓ ĐƯỢC TINH THẦN TUỔI TRẺ, TRÊN CON ĐƯỜNG THÀNH CÔNG CỦA CÔNG TY LÀ NHỮNG ĐÓNG GÓP VÔ CÙNG TO LỚN CỦA NHỮNG NGƯỜI MANG TÂM HUYẾT CỦA TRẺ NÀY.\rBỮA TIỆC ĐÃ DIỄN RA VỚI KHÔNG KH VUI VẺ, HÒA CHUNG VỚI NIỀM VUI ĐÓ LÀ NHỮNG ĐẠI DIỆN KHÁCH MỜI TỪ CÁC ĐỐI TÁC, BẠN B CHIẾN HỮU GẦN XA CÙNG CHÚC NHAU THÊM NHỮNG THÀNH CÔNG MỚI, CÔNG TY LÊN MỘT TẦM CAO MỚI \rLỜI CUỐI XIN CHÚC CHO TOÀN THỂ CÁN BỘ NHÂN VIÊN CÔNG TY LUÔN KHỎE MẠNH, TINH THẦN SẢNG KHOÁI ĐỂ HOÀN THÀNH CÔNG VIỆC TỐT NHẤT, PHÁT TRIỂN BẢN THÂN MÌNH MỘT TẦM CAO MỚI.\rCÙNG NHAU ĐƯA CÔNG TY TRỞ THÀNH MỘT TRONG NHỮNG CÔNG TY ĐỨNG ĐẦU VỀ NGÀNH VẬN TẢI TRONG THỜI GIAN TỚI.\r\n','vn','8',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_freq`
--

DROP TABLE IF EXISTS `b_search_content_freq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_freq` (
  `STEM` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float NOT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_freq`
--

LOCK TABLES `b_search_content_freq` WRITE;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_group`
--

DROP TABLE IF EXISTS `b_search_content_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_group` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_GROUP` (`SEARCH_CONTENT_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_group`
--

LOCK TABLES `b_search_content_group` WRITE;
/*!40000 ALTER TABLE `b_search_content_group` DISABLE KEYS */;
INSERT INTO `b_search_content_group` VALUES (44,2),(45,1),(45,2),(46,1),(46,2),(47,2),(48,2),(51,2),(52,1),(52,2),(53,1),(53,2),(54,2),(55,2),(56,2),(58,1),(58,2),(59,2),(60,1),(60,2),(61,1),(61,2),(62,2);
/*!40000 ALTER TABLE `b_search_content_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_site`
--

DROP TABLE IF EXISTS `b_search_content_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_site`
--

LOCK TABLES `b_search_content_site` WRITE;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` VALUES (60,'s1',''),(61,'s1',''),(44,'s1',''),(45,'s1',''),(46,'s1',''),(47,'s1',''),(48,'s1',''),(62,'s1',''),(51,'s1',''),(52,'s1',''),(53,'s1',''),(54,'s1',''),(55,'s1',''),(56,'s1',''),(58,'s1',''),(59,'s1','');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_stem`
--

DROP TABLE IF EXISTS `b_search_content_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8 NOT NULL,
  `TF` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_stem`
--

LOCK TABLES `b_search_content_stem` WRITE;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` VALUES (46,'en','000',0.135),(44,'en','008',0.1115),(61,'en','02',0.1226),(61,'en','04',0.1944),(44,'en','0914',0.1115),(44,'en','0981',0.1115),(53,'en','0981',0.1872),(44,'en','1-2',0.1115),(46,'en','10',0.135),(46,'en','11',0.135),(44,'en','198',0.1115),(46,'en','20',0.135),(61,'en','2018',0.1944),(59,'en','30',0.1667),(62,'en','30',0.1679),(44,'en','360',0.1115),(53,'en','360',0.1872),(44,'en','370',0.1115),(53,'en','370',0.1872),(44,'en','4000',0.1115),(58,'en','4000',0.1345),(60,'en','4000',0.2581),(44,'en','583',0.1115),(61,'en','99',0.1226),(61,'en','9X',0.1226),(52,'en','AN',0.1039),(58,'en','AN',0.1345),(44,'en','AN',0.1768),(61,'en','AN',0.2453),(60,'en','AN',0.2997),(44,'en','ANG',0.1115),(61,'en','ANG',0.1226),(60,'en','ANG',0.1291),(45,'en','ANG',0.2314),(47,'en','ANG',0.2314),(48,'en','ANG',0.2314),(54,'en','ANG',0.2314),(60,'en','ANH',0.3623),(44,'en','ANPHATAUTO',0.1115),(58,'en','ANPHATAUTO',0.1345),(58,'en','ANPHATKHANH',0.2132),(44,'en','ANPHATKHANH',0.2231),(51,'en','APKA',0.105),(60,'en','APKA',0.1291),(52,'en','APKA',0.1648),(53,'en','APKA',0.2742),(44,'en','APKA',0.3131),(46,'en','APKA',0.3134),(58,'en','APKA',0.3776),(44,'en','APKAUTO',0.1115),(58,'en','APKAUTO',0.1345),(53,'en','BA',0.1181),(61,'en','BA',0.1226),(52,'en','BA',0.1648),(51,'en','BANNER',0.105),(53,'en','BAO',0.1181),(52,'en','BAO',0.2414),(51,'en','BAO',0.2715),(44,'en','BAY',0.1115),(59,'en','BAY',0.1667),(62,'en','BAY',0.1679),(52,'en','BI',0.1039),(59,'en','BI',0.1667),(62,'en','BI',0.1679),(61,'en','BI',0.2453),(51,'en','BI',0.2949),(44,'en','BRANDNAM',0.1768),(52,'en','BU',0.1648),(52,'en','CAM',0.1039),(59,'en','CAM',0.1667),(62,'en','CAM',0.1679),(44,'en','CAO',0.1115),(61,'en','CAO',0.1944),(52,'en','CC',0.1039),(45,'en','CH',0.2314),(60,'en','CH',0.2997),(47,'en','CH',0.3667),(61,'en','CH',0.4074),(58,'en','CH',0.4653),(59,'en','CH',0.4679),(62,'en','CH',0.4715),(44,'en','CH',0.6014),(46,'en','CH',0.6019),(53,'en','CH',0.6631),(51,'en','CH',0.6715),(52,'en','CH',0.686),(53,'en','CHAT',0.1181),(61,'en','CHC',0.1226),(52,'en','CHI',0.1039),(61,'en','CHI',0.1226),(46,'en','CHI',0.135),(53,'en','CHI',0.1872),(44,'en','CHIA',0.1115),(58,'en','CHIA',0.1345),(51,'en','CHIA',0.1665),(52,'en','CHIA',0.2079),(48,'en','CHIA',0.2314),(51,'en','CHNG',0.105),(53,'en','CHNG',0.1181),(60,'en','CHNG',0.1291),(52,'en','CHNG',0.1648),(52,'en','CHNH',0.1039),(51,'en','CHNH',0.105),(53,'en','CHNH',0.1181),(61,'en','CHO',0.1944),(58,'en','CHO',0.269),(60,'en','CHO',0.2997),(44,'en','CHO',0.3131),(46,'en','CHO',0.3134),(52,'en','CHO',0.4061),(51,'en','CHO',0.438),(51,'en','CHP',0.105),(44,'en','CHU',0.1115),(61,'en','CHU',0.1226),(61,'en','CHUNG',0.1226),(58,'en','CHUNG',0.1345),(60,'en','CHUNG',0.2997),(51,'en','CHUY',0.1665),(53,'en','CHUY',0.2362),(44,'en','CHUY',0.259),(58,'en','CHUY',0.269),(46,'en','CHUY',0.2699),(58,'en','CHUYN',0.1345),(46,'en','CN',0.135),(44,'en','CNG',0.1115),(61,'en','CNG',0.1226),(60,'en','CNG',0.1291),(46,'en','CNG',0.135),(52,'en','COI',0.1039),(51,'en','COI',0.105),(44,'en','COM',0.1115),(58,'en','COM',0.1345),(59,'en','COMPANI',0.1667),(62,'en','COMPANI',0.1679),(61,'en','CON',0.1226),(51,'en','CONTACT',0.105),(44,'en','CONTACT',0.1115),(53,'en','CONTACT',0.1872),(51,'en','COOKI',0.105),(44,'en','CSKH',0.1115),(61,'en','CU',0.1226),(61,'en','CUNG',0.1226),(53,'en','CUNG',0.2742),(52,'en','CUNG',0.3295),(51,'en','CUNG',0.333),(60,'en','DI',0.1291),(61,'en','DI',0.1944),(52,'en','DI',0.2079),(44,'en','DI',0.2231),(51,'en','DI',0.2439),(58,'en','DI',0.269),(60,'en','DN',0.2046),(44,'en','DO',0.1115),(52,'en','DO',0.1648),(51,'en','DO',0.1665),(53,'en','DO',0.1872),(58,'en','DOANH',0.1345),(48,'en','DOANH',0.2314),(44,'en','DOANH',0.259),(44,'en','DU',0.1115),(53,'en','DUNG',0.1181),(61,'en','DUNG',0.1226),(51,'en','DUNG',0.1665),(55,'en','DUNG',0.2314),(52,'en','DUNG',0.2687),(52,'en','DUY',0.1039),(51,'en','DUY',0.1665),(44,'en','EM',0.1115),(58,'en','EM',0.1345),(46,'en','EM',0.135),(60,'en','EM',0.3623),(52,'en','EMAIL',0.1039),(51,'en','EMAIL',0.1665),(44,'en','EMAIL',0.1768),(44,'en','FACEBOOK',0.1768),(53,'en','FILE',0.1181),(59,'en','FURNITUR',0.1667),(62,'en','FURNITUR',0.1679),(44,'en','GARA',0.1115),(58,'en','GARA',0.1345),(59,'en','GH',0.1667),(53,'en','GHI',0.1872),(51,'en','GHI',0.2101),(62,'en','GHP',0.1679),(61,'en','GI',0.1226),(46,'en','GI',0.3134),(51,'en','GI',0.333),(44,'en','GI',0.3536),(52,'en','GI',0.3596),(58,'en','GI',0.3776),(53,'en','GI',0.3923),(59,'en','GI',0.5),(62,'en','GI',0.5038),(60,'en','GIA',0.1291),(58,'en','GIA',0.1345),(52,'en','GIA',0.1648),(46,'en','GIA',0.2139),(44,'en','GIA',0.2231),(52,'en','GIAN',0.1039),(53,'en','GIAN',0.2742),(61,'en','GIAN',0.2847),(51,'en','GIAO',0.105),(53,'en','GIAO',0.1181),(44,'en','GIP',0.1115),(58,'en','GIP',0.1345),(44,'en','GOOGL',0.1115),(51,'en','GOOGL',0.1665),(44,'en','GP',0.1115),(51,'en','GPS',0.105),(44,'en','GRAB',0.1768),(58,'en','GRAB',0.2132),(60,'en','HA',0.1291),(58,'en','HAI',0.1345),(61,'en','HAI',0.2453),(51,'en','HAY',0.105),(52,'en','HAY',0.1648),(53,'en','HI',0.1181),(61,'en','HI',0.1226),(59,'en','HI',0.1667),(62,'en','HI',0.1679),(60,'en','HI',0.2046),(51,'en','HI',0.2101),(58,'en','HI',0.2132),(44,'en','HI',0.2231),(52,'en','HI',0.3453),(44,'en','HNG',0.1115),(58,'en','HNG',0.1345),(46,'en','HNG',0.135),(62,'en','HNG',0.1679),(58,'en','HNH',0.1345),(46,'en','HO',0.135),(59,'en','HO',0.1667),(62,'en','HO',0.1679),(61,'en','HO',0.1944),(58,'en','HO',0.2132),(53,'en','HO',0.3053),(44,'en','HO',0.3346),(51,'en','HO',0.4995),(52,'en','HO',0.5244),(44,'en','HOT',0.1115),(51,'en','HU',0.105),(44,'en','HUY',0.1115),(61,'en','HUY',0.1226),(53,'en','HY',0.1181),(51,'en','ID',0.105),(51,'en','IP',0.105),(47,'en','KH',0.2314),(59,'en','KH',0.2642),(62,'en','KH',0.2662),(58,'en','KH',0.3776),(46,'en','KH',0.4049),(51,'en','KH',0.4294),(60,'en','KH',0.4465),(61,'en','KH',0.4538),(44,'en','KH',0.4738),(53,'en','KH',0.5017),(52,'en','KH',0.5494),(53,'en','KHAI',0.1181),(46,'en','KHCH',0.135),(61,'en','KHI',0.1226),(46,'en','KHI',0.135),(44,'en','KHI',0.1768),(52,'en','KHI',0.2687),(51,'en','KHI',0.349),(53,'en','KHI',0.4234),(60,'en','KHICH',0.1291),(52,'en','KHNG',0.1039),(53,'en','KHNG',0.1181),(51,'en','KHO',0.105),(61,'en','KHO',0.1944),(46,'en','KHO',0.2699),(52,'en','KHO',0.4249),(60,'en','KHU',0.1291),(52,'en','KHU',0.1648),(51,'en','KHUY',0.105),(44,'en','KHUY',0.1115),(46,'en','KHUY',0.135),(60,'en','KI',0.1291),(59,'en','KI',0.1667),(62,'en','KI',0.1679),(61,'en','KI',0.1944),(51,'en','KI',0.2101),(58,'en','KI',0.2132),(44,'en','KI',0.2231),(58,'en','KINH',0.1345),(44,'en','KINH',0.259),(46,'en','KM',0.135),(52,'en','LAI',0.1039),(61,'en','LAI',0.1226),(52,'en','LI',0.2414),(44,'en','LI',0.259),(53,'en','LI',0.3315),(51,'en','LI',0.4202),(51,'en','LINH',0.105),(52,'en','LNG',0.1039),(62,'en','LNG',0.1679),(45,'en','LNG',0.2314),(47,'en','LNG',0.2314),(48,'en','LNG',0.2314),(52,'en','LO',0.1039),(58,'en','LO',0.1345),(51,'en','LU',0.105),(53,'en','LU',0.1181),(61,'en','LU',0.1226),(46,'en','LU',0.135),(59,'en','LU',0.1667),(44,'en','LU',0.1768),(60,'en','LU',0.2046),(52,'en','LU',0.2918),(60,'en','LUN',0.1291),(58,'en','LUN',0.1345),(62,'en','LUN',0.1679),(53,'en','MAIL',0.1872),(61,'en','MANG',0.1226),(60,'en','MANG',0.1291),(51,'en','MAP',0.105),(44,'en','MARKET',0.2231),(62,'en','MI',0.1679),(51,'en','MINH',0.105),(53,'en','MINH',0.1181),(52,'en','MNH',0.1039),(44,'en','MONG',0.1115),(46,'en','MONG',0.135),(44,'en','MU',0.1115),(46,'en','MU',0.135),(59,'en','MU',0.1667),(62,'en','MU',0.1679),(44,'en','MUA',0.259),(58,'en','MUA',0.269),(52,'en','NAM',0.1039),(44,'en','NAM',0.1115),(53,'en','NAM',0.1181),(58,'en','NAM',0.1345),(60,'en','NAM',0.2997),(58,'en','NAY',0.1345),(44,'en','NAY',0.1768),(60,'en','NAY',0.2046),(61,'en','NAY',0.2453),(45,'en','NG',0.2314),(47,'en','NG',0.2314),(56,'en','NG',0.2314),(55,'en','NG',0.3667),(62,'en','NG',0.4341),(59,'en','NG',0.5283),(54,'en','NG',0.5372),(58,'en','NG',0.6322),(60,'en','NG',0.6566),(53,'en','NG',0.6765),(46,'en','NG',0.7031),(44,'en','NG',0.7345),(61,'en','NG',0.7412),(52,'en','NG',0.7702),(51,'en','NG',0.787),(52,'en','NGAY',0.1039),(52,'en','NGH',0.1039),(60,'en','NGH',0.1291),(51,'en','NGH',0.1665),(44,'en','NGH',0.2231),(58,'en','NGH',0.269),(60,'en','NGHI',0.1291),(52,'en','NGHI',0.1648),(58,'en','NGHI',0.2132),(44,'en','NGHI',0.2883),(52,'en','NGO',0.1039),(51,'en','NGO',0.105),(60,'en','NGO',0.1291),(44,'en','NGUY',0.1768),(52,'en','NGUY',0.2079),(45,'en','NH',0.2314),(47,'en','NH',0.2314),(48,'en','NH',0.2314),(54,'en','NH',0.2314),(58,'en','NH',0.4468),(62,'en','NH',0.4715),(59,'en','NH',0.5),(53,'en','NH',0.5266),(46,'en','NH',0.5273),(52,'en','NH',0.5954),(44,'en','NH',0.6052),(51,'en','NH',0.6255),(60,'en','NH',0.627),(61,'en','NH',0.6388),(61,'en','NHAU',0.317),(44,'en','NHI',0.1115),(52,'en','NHI',0.3847),(51,'en','NHN',0.105),(44,'en','NHN',0.1115),(53,'en','NHN',0.1181),(61,'en','NHN',0.1944),(58,'en','NHU',0.1345),(46,'en','NHU',0.135),(44,'en','NHU',0.1768),(61,'en','NI',0.1944),(60,'en','NI',0.2581),(52,'en','NINH',0.1039),(53,'en','NO',0.1181),(52,'en','NY',0.1039),(51,'en','NY',0.105),(44,'en','ONLIN',0.1115),(59,'en','PH',0.1667),(46,'en','PH',0.2139),(61,'en','PH',0.2847),(60,'en','PH',0.3336),(58,'en','PH',0.3477),(51,'en','PH',0.454),(53,'en','PH',0.4724),(44,'en','PH',0.482),(52,'en','PH',0.5532),(52,'en','PHI',0.1648),(44,'en','PHNG',0.1115),(52,'en','PHONG',0.1039),(60,'en','PHONG',0.1291),(59,'en','PHONG',0.1667),(62,'en','PHONG',0.1679),(52,'en','PHP',0.1648),(44,'en','PHT',0.1115),(53,'en','PHT',0.1181),(61,'en','PHT',0.1226),(60,'en','PHT',0.1291),(61,'en','QU',0.1226),(46,'en','QU',0.135),(52,'en','QU',0.1648),(44,'en','QU',0.259),(51,'en','QU',0.2715),(60,'en','QU',0.2997),(53,'en','QU',0.3543),(44,'en','QUA',0.1115),(60,'en','QUA',0.1291),(52,'en','QUA',0.1648),(51,'en','QUA',0.1665),(61,'en','QUA',0.2453),(52,'en','QUAN',0.1039),(44,'en','QUAN',0.1768),(51,'en','QUAN',0.2101),(53,'en','QUAN',0.2362),(60,'en','QUANG',0.2046),(53,'en','QUI',0.1872),(51,'en','QUI',0.2101),(44,'en','QUY',0.1768),(51,'en','QUY',0.333),(53,'en','QUY',0.3923),(52,'en','QUY',0.4827),(44,'en','RA',0.1115),(60,'en','RA',0.1291),(52,'en','RA',0.2079),(53,'en','RA',0.2362),(61,'en','RA',0.2453),(44,'en','RAO',0.1115),(58,'en','RI',0.1345),(51,'en','RI',0.2101),(52,'en','RI',0.2414),(51,'en','RING',0.105),(52,'en','SAI',0.1039),(44,'en','SANG',0.1115),(61,'en','SANG',0.1226),(60,'en','SAO',0.1291),(44,'en','SAU',0.1115),(61,'en','SAU',0.1226),(51,'en','SAU',0.1665),(52,'en','SAU',0.2079),(46,'en','SAU',0.2139),(45,'en','SAU',0.2314),(47,'en','SAU',0.2314),(48,'en','SAU',0.2314),(54,'en','SAU',0.2314),(53,'en','SAU',0.2362),(59,'en','SI',0.1667),(62,'en','SI',0.1679),(60,'en','SI',0.2046),(52,'en','SINH',0.1039),(51,'en','SINH',0.105),(61,'en','SINH',0.1226),(53,'en','SINH',0.3315),(60,'en','SIU',0.1291),(44,'en','SMS',0.1768),(62,'en','SN',0.1679),(51,'en','SO',0.105),(44,'en','SO',0.1115),(53,'en','SO',0.1181),(59,'en','SO',0.1667),(62,'en','SO',0.1679),(60,'en','SU',0.2581),(52,'en','TA',0.1039),(51,'en','TA',0.105),(44,'en','TAXI',0.1768),(58,'en','TAXI',0.2132),(51,'en','TAY',0.105),(58,'en','TC',0.1345),(46,'en','TCH',0.135),(54,'en','TH',0.2314),(56,'en','TH',0.2314),(62,'en','TH',0.3359),(58,'en','TH',0.3776),(59,'en','TH',0.4308),(60,'en','TH',0.4627),(44,'en','TH',0.4738),(53,'en','TH',0.4925),(61,'en','TH',0.5547),(46,'en','TH',0.5628),(52,'en','TH',0.6063),(51,'en','TH',0.6502),(52,'en','THAM',0.1039),(58,'en','THAM',0.1345),(46,'en','THAM',0.2139),(44,'en','THAM',0.259),(52,'en','THANH',0.1039),(44,'en','THANH',0.1115),(53,'en','THANH',0.1872),(60,'en','THAO',0.2046),(51,'en','THAY',0.2439),(61,'en','THAY',0.2453),(44,'en','THCH',0.1115),(58,'en','THCH',0.1345),(53,'en','THEO',0.1181),(61,'en','THEO',0.1226),(52,'en','THEO',0.1648),(58,'en','THEO',0.2132),(51,'en','THEO',0.2439),(44,'en','THEO',0.3131),(52,'en','THI',0.1039),(59,'en','THI',0.1667),(62,'en','THI',0.1679),(51,'en','THI',0.2439),(60,'en','THI',0.2997),(62,'en','THM',0.1679),(45,'en','THNG',0.2314),(47,'en','THNG',0.2314),(48,'en','THNG',0.2314),(52,'en','THO',0.1039),(44,'en','THO',0.1115),(51,'en','THO',0.1665),(59,'en','THO',0.1667),(62,'en','THO',0.1679),(53,'en','THU',0.1181),(44,'en','THU',0.1768),(58,'en','THU',0.2132),(48,'en','THU',0.2314),(52,'en','THU',0.2918),(51,'en','THU',0.3151),(44,'en','THUY',0.1115),(60,'en','TI',0.1291),(46,'en','TI',0.135),(52,'en','TI',0.2079),(58,'en','TI',0.2132),(44,'en','TI',0.3131),(59,'en','TI',0.3333),(62,'en','TI',0.3359),(61,'en','TI',0.3443),(51,'en','TI',0.349),(53,'en','TI',0.3543),(46,'en','TIN',0.135),(45,'en','TIN',0.2314),(47,'en','TIN',0.2314),(48,'en','TIN',0.2314),(54,'en','TIN',0.2314),(44,'en','TIN',0.2883),(53,'en','TIN',0.3053),(52,'en','TIN',0.4061),(51,'en','TIN',0.5252),(61,'en','TINH',0.1944),(60,'en','TINH',0.2046),(44,'en','TM',0.1115),(58,'en','TM',0.1345),(62,'en','TM',0.1679),(44,'en','TO',0.1115),(53,'en','TO',0.1181),(58,'en','TO',0.1345),(60,'en','TO',0.2046),(52,'en','TO',0.2918),(61,'en','TO',0.317),(45,'en','TR',0.2314),(47,'en','TR',0.2314),(48,'en','TR',0.2314),(54,'en','TR',0.2314),(56,'en','TR',0.2314),(59,'en','TR',0.2642),(62,'en','TR',0.2662),(60,'en','TR',0.4091),(44,'en','TR',0.4127),(58,'en','TR',0.4264),(61,'en','TR',0.4396),(46,'en','TR',0.4483),(51,'en','TR',0.4684),(52,'en','TR',0.5101),(53,'en','TR',0.5266),(52,'en','TRANG',0.1039),(51,'en','TRANG',0.3151),(52,'en','TRANH',0.1039),(53,'en','TRANH',0.3053),(53,'en','TRAO',0.1181),(58,'en','TRI',0.1345),(61,'en','TRI',0.1944),(44,'en','TRI',0.2883),(52,'en','TRN',0.1039),(44,'en','TRN',0.1115),(53,'en','TRN',0.1181),(61,'en','TRN',0.1226),(51,'en','TRNH',0.105),(53,'en','TRNH',0.1181),(60,'en','TRNH',0.1291),(46,'en','TRNH',0.135),(58,'en','TRONG',0.1345),(46,'en','TRONG',0.135),(59,'en','TRONG',0.1667),(44,'en','TRONG',0.1768),(51,'en','TRONG',0.2949),(60,'en','TRONG',0.2997),(52,'en','TRONG',0.3118),(61,'en','TRONG',0.3443),(53,'en','TRONG',0.4085),(44,'en','TRUNG',0.1115),(61,'en','TRUNG',0.1226),(58,'en','TRUNG',0.1345),(52,'en','TRUNG',0.2687),(44,'en','TRUY',0.1115),(52,'en','TRUY',0.2079),(51,'en','TRUY',0.2439),(51,'en','TU',0.2101),(52,'en','TU',0.2687),(61,'en','TU',0.317),(52,'en','TUY',0.1039),(58,'en','TUY',0.1345),(53,'en','TUY',0.1872),(44,'en','TUY',0.2231),(60,'en','TUY',0.2997),(58,'en','TY',0.1345),(51,'en','TY',0.2439),(44,'en','TY',0.3536),(61,'en','TY',0.4538),(60,'en','U23',0.2581),(58,'en','VI',0.1345),(46,'en','VI',0.2139),(53,'en','VI',0.2362),(61,'en','VI',0.2847),(51,'en','VI',0.2949),(60,'en','VI',0.3872),(52,'en','VI',0.3958),(44,'en','VI',0.482),(52,'en','VIDEO',0.1039),(52,'en','VIN',0.1039),(61,'en','VIN',0.1226),(60,'en','VINH',0.2046),(51,'en','VN',0.105),(52,'en','VN',0.1648),(53,'en','VN',0.2742),(46,'en','VN',0.3134),(58,'en','VN',0.3776),(44,'en','VN',0.3858),(51,'en','VNG',0.105),(44,'en','VUI',0.1115),(60,'en','VUI',0.1291),(58,'en','VUI',0.1345),(52,'en','VUI',0.1648),(53,'en','VUI',0.1872),(61,'en','VUI',0.1944),(45,'en','VUI',0.2314),(47,'en','VUI',0.2314),(48,'en','VUI',0.2314),(54,'en','VUI',0.2314),(52,'en','WEB',0.1039),(51,'en','WEB',0.333),(51,'en','WEBSIT',0.105),(53,'en','WEBSIT',0.1181),(58,'en','WEBSIT',0.1345),(52,'en','WEBSIT',0.1648),(44,'en','WEBSIT',0.2231),(61,'en','XA',0.1226),(60,'en','XA',0.1291),(59,'en','XANH',0.1667),(62,'en','XANH',0.1679),(51,'en','XE',0.105),(53,'en','XE',0.1181),(46,'en','XE',0.2699),(59,'en','XE',0.3333),(62,'en','XE',0.3359),(54,'en','XE',0.3667),(60,'en','XE',0.4091),(44,'en','XE',0.4738),(58,'en','XE',0.5255),(51,'en','XEM',0.105),(52,'en','XEM',0.1648),(59,'en','XEM',0.1667),(62,'en','XEM',0.1679),(52,'en','XIN',0.1039),(44,'en','XIN',0.1115),(61,'en','XIN',0.1226),(51,'en','XO',0.105),(58,'en','XU',0.1345),(44,'en','XU',0.1768),(52,'en','XU',0.2079),(52,'en','XUNG',0.1039),(46,'en','XUY',0.3789),(46,'en','XUYN',0.135),(44,'en','YU',0.1115);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_custom_rank`
--

DROP TABLE IF EXISTS `b_search_custom_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RANK` int(11) NOT NULL DEFAULT '0',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_custom_rank`
--

LOCK TABLES `b_search_custom_rank` WRITE;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_phrase`
--

DROP TABLE IF EXISTS `b_search_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_phrase`
--

LOCK TABLES `b_search_phrase` WRITE;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_suggest`
--

DROP TABLE IF EXISTS `b_search_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_suggest`
--

LOCK TABLES `b_search_suggest` WRITE;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_tags`
--

DROP TABLE IF EXISTS `b_search_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_tags`
--

LOCK TABLES `b_search_tags` WRITE;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_keywords`
--

DROP TABLE IF EXISTS `b_seo_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_keywords`
--

LOCK TABLES `b_seo_keywords` WRITE;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_site_template`
--

DROP TABLE IF EXISTS `b_site_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SITE_TEMPLATE` (`SITE_ID`,`CONDITION`,`TEMPLATE`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_site_template`
--

LOCK TABLES `b_site_template` WRITE;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` VALUES (7,'s1','',150,'main');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task`
--

DROP TABLE IF EXISTS `b_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task`
--

LOCK TABLES `b_task` WRITE;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` VALUES (1,'main_denied','D','main','Y',NULL,'module'),(2,'main_change_profile','P','main','Y',NULL,'module'),(3,'main_view_all_settings','R','main','Y',NULL,'module'),(4,'main_view_all_settings_change_profile','T','main','Y',NULL,'module'),(5,'main_edit_subordinate_users','V','main','Y',NULL,'module'),(6,'main_full_access','W','main','Y',NULL,'module'),(7,'fm_folder_access_denied','D','main','Y',NULL,'file'),(8,'fm_folder_access_read','R','main','Y',NULL,'file'),(9,'fm_folder_access_write','W','main','Y',NULL,'file'),(10,'fm_folder_access_full','X','main','Y',NULL,'file'),(11,'fm_folder_access_workflow','U','main','Y',NULL,'file'),(12,'fileman_denied','D','fileman','Y','','module'),(13,'fileman_allowed_folders','F','fileman','Y','','module'),(14,'fileman_full_access','W','fileman','Y','','module'),(15,'medialib_denied','D','fileman','Y','','medialib'),(16,'medialib_view','F','fileman','Y','','medialib'),(17,'medialib_only_new','R','fileman','Y','','medialib'),(18,'medialib_edit_items','V','fileman','Y','','medialib'),(19,'medialib_editor','W','fileman','Y','','medialib'),(20,'medialib_full','X','fileman','Y','','medialib'),(21,'seo_denied','D','seo','Y','','module'),(22,'seo_edit','F','seo','Y','','module'),(23,'seo_full_access','W','seo','Y','','module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task_operation`
--

DROP TABLE IF EXISTS `b_task_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task_operation`
--

LOCK TABLES `b_task_operation` WRITE;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` VALUES (2,1),(2,7),(3,1),(3,3),(3,4),(3,5),(3,6),(4,1),(4,3),(4,4),(4,5),(4,6),(4,7),(5,1),(5,2),(5,4),(5,5),(5,6),(5,7),(5,9),(6,1),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,10),(6,11),(6,12),(6,13),(6,32),(6,33),(8,15),(8,23),(8,24),(9,15),(9,17),(9,18),(9,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(10,15),(10,16),(10,17),(10,18),(10,19),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(11,15),(11,19),(11,23),(11,24),(11,25),(13,36),(13,37),(13,38),(13,39),(13,40),(13,41),(13,42),(13,44),(13,45),(14,34),(14,35),(14,36),(14,37),(14,38),(14,39),(14,40),(14,41),(14,42),(14,43),(14,44),(14,45),(14,46),(16,47),(17,47),(17,48),(17,52),(18,47),(18,52),(18,53),(18,54),(19,47),(19,48),(19,49),(19,50),(19,52),(19,53),(19,54),(20,47),(20,48),(20,49),(20,50),(20,51),(20,52),(20,53),(20,54),(22,56),(23,55),(23,56);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_undo`
--

DROP TABLE IF EXISTS `b_undo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_undo`
--

LOCK TABLES `b_undo` WRITE;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (1,'2017-12-06 06:03:09','admin','3<mEZ{7yae1de7b0d5f5e16612f04f429b7b7197','E9C6M3mp8aa841b632a657cb2c2e20288d8e1b83','Y','Đào','Quang Hưng','dqhung.ec@gmail.com','2018-04-13 16:15:55','2010-11-08 12:10:49','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2015-11-30 16:23:59','',NULL,0,NULL),(2,'2017-12-08 06:49:16','guest','wwK8HapI25c7217bce89401640b1af58461298d0','UAuAnb2ta892d933cdbea4bf512e27dd0c85b65c','Y','Khách vãng lai','','guest@dithatthich.vn',NULL,'2017-12-08 13:49:04','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2017-12-08 13:49:16','',NULL,NULL,NULL),(7,'2018-04-13 01:10:16','KennethmoN','Qst5eDW0c24ebd960a79d608c902d61e723f88fd','Ryo1FxTTa1e0dcb8b9722a627088157c26299b2d','Y','KennethmoN',NULL,'fertynte@bigmir.net','2018-04-13 08:10:16','2018-04-13 08:10:16',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-13 08:10:16',NULL,'',0,NULL),(6,'2018-04-02 09:39:00','huytqs','UdrSlF9k542d89e27a71eb2ee4ac9c1de96ac3ec','DQ7oLQmO2ea502e99fb898ed93bb954a9c2db7a6','Y','Nguyễn Văn Huy',NULL,'huytqs1102@gmail.com','2018-04-02 16:39:00','2018-04-02 16:39:00',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-02 16:39:00',NULL,'',0,NULL),(8,'2018-04-13 09:42:51','quantri','gmMGXiAD7101c1a9511c990be4b0cad86530332a','rPw2Y2Dvcf2a53b26bad80cb213683a9e45fa7fc','Y','Quản trị','nội dung','contact@apka.vn','2018-04-13 17:09:23','2018-04-13 16:31:52','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-13 16:41:46','',NULL,0,NULL),(9,'2018-04-13 10:50:25','tungtran','IKO1Z30Y3e78c3fe268ce750484700facd272a00','qsY8E0NHcf87c359ebcb9e72128734ddc93aa6b6','Y','Tung','Tran','tungtran@uboo.vn','2018-04-13 17:50:33','2018-04-13 16:56:19','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-13 16:56:19','',NULL,0,NULL);
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field`
--

DROP TABLE IF EXISTS `b_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field`
--

LOCK TABLES `b_user_field` WRITE;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_enum`
--

DROP TABLE IF EXISTS `b_user_field_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_enum`
--

LOCK TABLES `b_user_field_enum` WRITE;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_lang`
--

DROP TABLE IF EXISTS `b_user_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_lang`
--

LOCK TABLES `b_user_field_lang` WRITE;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_group`
--

DROP TABLE IF EXISTS `b_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_group`
--

LOCK TABLES `b_user_group` WRITE;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` VALUES (1,1,NULL,NULL),(8,1,'2018-04-13 00:00:00','2018-04-14 00:00:00'),(8,3,NULL,NULL),(9,1,NULL,NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_hit_auth`
--

DROP TABLE IF EXISTS `b_user_hit_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_hit_auth`
--

LOCK TABLES `b_user_hit_auth` WRITE;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_option`
--

DROP TABLE IF EXISTS `b_user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_option_param` (`CATEGORY`,`NAME`),
  KEY `ix_user_option_user` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_option`
--

LOCK TABLES `b_user_option` WRITE;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` VALUES (1,NULL,'main.interface','global','a:1:{s:5:\"theme\";s:9:\"dark-blue\";}','Y'),(2,1,'admin_panel','settings','a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}','N'),(3,1,'admin_menu','pos','a:2:{s:8:\"sections\";s:225:\"menu_iblock_/news,menu_fileman,menu_iblock_/vn,iblock_admin,menu_iblock,menu_search_stat,menu_util,menu_system,menu_users,menu_iblock_/vn/6,menu_iblock_/vn/7,menu_site,menu_iblock_/vn/5,menu_iblock_/vn/9,menu_fileman_file_s1_\";s:5:\"width\";s:3:\"225\";}','N'),(4,1,'fileman','last_pathes','s:251:\"a:10:{i:0;s:9:\"/app.book\";i:1;s:21:\"/webmin/php_interface\";i:2;s:7:\"/webmin\";i:3;s:14:\"/webmin/backup\";i:4;s:8:\"/tin-tuc\";i:5;s:7:\"/dat-xe\";i:6;s:13:\"/webmin/admin\";i:7;s:30:\"/webmin/modules/main/interface\";i:8;s:15:\"/cam-nan-di-lai\";i:9;s:5:\"/ajax\";}\";','N'),(5,1,'filter','tbl_iblock_section_feec45850a6da7a26ecbc04356074bda_filter','a:1:{s:4:\"rows\";s:6:\"parent\";}','N'),(6,1,'filter','tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(7,1,'fileman','medialib_def_type','s:1:\"3\";','N'),(9,1,'fileman','taskbar_settings_PREVIEW_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N'),(8,1,'start_menu','recent','a:1:{i:0;a:4:{s:3:\"url\";s:86:\"/webmin/admin/iblock_list_admin.php?IBLOCK_ID=5&type=vn&lang=en&find_section_section=0\";s:4:\"text\";s:7:\"Tin tuc\";s:5:\"title\";s:30:\"Tin tuc (double click to open)\";s:4:\"icon\";s:24:\"iblock_menu_icon_iblocks\";}}','N'),(10,1,'fileman','taskbarset_settings_PREVIEW_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N'),(11,1,'filter','tbl_iblock_list_19dd77aa3c08806fd81c989076996025_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(12,1,'filter','tbl_iblock_list_4ff941a4ef914f575baf47b883a07ae3_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(13,1,'list','tbl_iblock_list_feec45850a6da7a26ecbc04356074bda','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_35\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(14,1,'filter','tbl_iblock_list_0f81ef6e99142c84681add1f93f73014_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(15,1,'list','tbl_iblock_list_0f81ef6e99142c84681add1f93f73014','a:4:{s:7:\"columns\";s:36:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,CODE\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(16,1,'filter','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(17,1,'fileman','taskbar_settings_DETAIL_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N'),(18,1,'fileman','taskbarset_settings_DETAIL_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:1;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N'),(19,1,'filter','tbl_iblock_list_e243b358b954c5403383a0aa3fc1de24_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(20,1,'list','tbl_iblock_list_4ff941a4ef914f575baf47b883a07ae3','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_38\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(21,1,'list','tbl_iblock_list_19dd77aa3c08806fd81c989076996025','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_16\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(22,1,'fileman','medialib_user_set','s:9:\"600,450,1\";','N'),(23,1,'list','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0','a:4:{s:7:\"columns\";s:36:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,CODE\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N'),(24,8,'admin_menu','pos','a:1:{s:8:\"sections\";s:55:\"menu_fileman,menu_iblock_/vn/9,menu_iblock,iblock_admin\";}','N'),(25,8,'filter','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N'),(26,8,'fileman','taskbar_settings_DETAIL_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N'),(27,8,'fileman','taskbarset_settings_DETAIL_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:1;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N'),(28,9,'admin_menu','pos','a:1:{s:8:\"sections\";s:11:\"menu_iblock\";}','N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_stored_auth`
--

DROP TABLE IF EXISTS `b_user_stored_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_stored_auth`
--

LOCK TABLES `b_user_stored_auth` WRITE;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
INSERT INTO `b_user_stored_auth` VALUES (1,1,'2010-11-08 12:10:50','2010-11-08 12:10:50','2e46f2ce2b5ee485ed86e6443eb64f1a','N',2130706433);
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_xml_tree`
--

DROP TABLE IF EXISTS `b_xml_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_xml_tree`
--

LOCK TABLES `b_xml_tree` WRITE;
/*!40000 ALTER TABLE `b_xml_tree` DISABLE KEYS */;
INSERT INTO `b_xml_tree` VALUES (1,0,1,320,0,'CommerceInformation',NULL,'a:2:{s:13:\"SchemaVersion\";s:5:\"2.021\";s:12:\"CreationDate\";s:19:\"2010-07-12T16:48:00\";}'),(2,1,2,67,1,'Metadata',NULL,NULL),(3,2,3,4,2,'Id','2',NULL),(4,2,5,6,2,'Title','Job Vacancies',NULL),(5,2,7,64,2,'Properties',NULL,NULL),(6,5,8,15,3,'Property',NULL,NULL),(7,6,9,10,4,'Id','CML2_ACTIVE',NULL),(8,6,11,12,4,'Title','BitrixActive',NULL),(9,6,13,14,4,'Multiple','false',NULL),(10,5,16,23,3,'Property',NULL,NULL),(11,10,17,18,4,'Id','CML2_CODE',NULL),(12,10,19,20,4,'Title','Code',NULL),(13,10,21,22,4,'Multiple','false',NULL),(14,5,24,31,3,'Property',NULL,NULL),(15,14,25,26,4,'Id','CML2_SORT',NULL),(16,14,27,28,4,'Title','Sort',NULL),(17,14,29,30,4,'Multiple','false',NULL),(18,5,32,39,3,'Property',NULL,NULL),(19,18,33,34,4,'Id','CML2_ACTIVE_FROM',NULL),(20,18,35,36,4,'Title','Start time',NULL),(21,18,37,38,4,'Multiple','false',NULL),(22,5,40,47,3,'Property',NULL,NULL),(23,22,41,42,4,'Id','CML2_ACTIVE_TO',NULL),(24,22,43,44,4,'Title','End time',NULL),(25,22,45,46,4,'Multiple','false',NULL),(26,5,48,55,3,'Property',NULL,NULL),(27,26,49,50,4,'Id','CML2_PREVIEW_TEXT',NULL),(28,26,51,52,4,'Title','Anons',NULL),(29,26,53,54,4,'Multiple','false',NULL),(30,5,56,63,3,'Property',NULL,NULL),(31,30,57,58,4,'Id','CML2_PREVIEW_PICTURE',NULL),(32,30,59,60,4,'Title','Preview picture',NULL),(33,30,61,62,4,'Multiple','false',NULL),(34,2,65,66,2,'Sections',NULL,NULL),(35,1,68,319,1,'Catalog',NULL,NULL),(36,35,69,70,2,'Id','furniture_vacancies',NULL),(37,35,71,72,2,'MetadataId','2',NULL),(38,35,73,74,2,'Title','Job Vacancies',NULL),(39,35,75,76,2,'BitrixCode','furniture_vacancies',NULL),(40,35,77,78,2,'BitrixSort','500',NULL),(41,35,79,80,2,'BitrixListURL','#SITE_DIR#/company/vacancies.php',NULL),(42,35,81,82,2,'BitrixDetailURL','#SITE_DIR#/company/vacancies.php##ID#',NULL),(43,35,83,84,2,'BitrixSectionURL',NULL,NULL),(44,35,85,86,2,'BitrixPicture',NULL,NULL),(45,35,87,88,2,'BitrixIndexElements','true',NULL),(46,35,89,90,2,'BitrixIndexSections','false',NULL),(47,35,91,92,2,'BitrixWorkflow','false',NULL),(48,35,93,154,2,'BitrixLabels',NULL,NULL),(49,48,94,99,3,'BitrixLabel',NULL,NULL),(50,49,95,96,4,'Id','ELEMENT_NAME',NULL),(51,49,97,98,4,'Value','Vacancy',NULL),(52,48,100,105,3,'BitrixLabel',NULL,NULL),(53,52,101,102,4,'Id','ELEMENTS_NAME',NULL),(54,52,103,104,4,'Value','Vacancies',NULL),(55,48,106,111,3,'BitrixLabel',NULL,NULL),(56,55,107,108,4,'Id','ELEMENT_ADD',NULL),(57,55,109,110,4,'Value','Add vacancy',NULL),(58,48,112,117,3,'BitrixLabel',NULL,NULL),(59,58,113,114,4,'Id','ELEMENT_EDIT',NULL),(60,58,115,116,4,'Value','Edit vacancy',NULL),(61,48,118,123,3,'BitrixLabel',NULL,NULL),(62,61,119,120,4,'Id','ELEMENT_DELETE',NULL),(63,61,121,122,4,'Value','Delete vacancy',NULL),(64,48,124,129,3,'BitrixLabel',NULL,NULL),(65,64,125,126,4,'Id','SECTION_NAME',NULL),(66,64,127,128,4,'Value','Category',NULL),(67,48,130,135,3,'BitrixLabel',NULL,NULL),(68,67,131,132,4,'Id','SECTIONS_NAME',NULL),(69,67,133,134,4,'Value','Categories',NULL),(70,48,136,141,3,'BitrixLabel',NULL,NULL),(71,70,137,138,4,'Id','SECTION_ADD',NULL),(72,70,139,140,4,'Value','Add category',NULL),(73,48,142,147,3,'BitrixLabel',NULL,NULL),(74,73,143,144,4,'Id','SECTION_EDIT',NULL),(75,73,145,146,4,'Value','Edit category',NULL),(76,48,148,153,3,'BitrixLabel',NULL,NULL),(77,76,149,150,4,'Id','SECTION_DELETE',NULL),(78,76,151,152,4,'Value','Delete category',NULL),(79,35,155,318,2,'Elements',NULL,NULL),(80,79,156,209,3,'Element',NULL,NULL),(81,80,157,158,4,'Id','2',NULL),(82,80,159,160,4,'Title','Designer, Decorative Accessories',NULL),(83,80,161,162,4,'BitrixTags',NULL,NULL),(84,80,163,164,4,'Description','<b>Requirements</b> 						 						 \r\n<p>Degree in Fine Arts, Applied Arts or Engineering</p>\r\n\r\n<b>Essential Functions</b> 						 \r\n<p>Develop designs from conception through revisions to sample approval. Present to Head Designer for review and approval.</p>\r\n<p>Create presentation boards.</p>	\r\n					 						\r\n<b>Employment Status</b> 						 \r\n<p>Full time</p>\r\n ',NULL),(85,80,165,208,4,'PropertiesValues',NULL,NULL),(86,85,166,171,5,'PropertyValues',NULL,NULL),(87,86,167,168,6,'Id','CML2_ACTIVE',NULL),(88,86,169,170,6,'Value','true',NULL),(89,85,172,177,5,'PropertyValues',NULL,NULL),(90,89,173,174,6,'Id','CML2_CODE',NULL),(91,89,175,176,6,'Value',NULL,NULL),(92,85,178,183,5,'PropertyValues',NULL,NULL),(93,92,179,180,6,'Id','CML2_SORT',NULL),(94,92,181,182,6,'Value','200',NULL),(95,85,184,189,5,'PropertyValues',NULL,NULL),(96,95,185,186,6,'Id','CML2_ACTIVE_FROM',NULL),(97,95,187,188,6,'Value','2010-05-01 00:00:00',NULL),(98,85,190,195,5,'PropertyValues',NULL,NULL),(99,98,191,192,6,'Id','CML2_ACTIVE_TO',NULL),(100,98,193,194,6,'Value',NULL,NULL),(101,85,196,201,5,'PropertyValues',NULL,NULL),(102,101,197,198,6,'Id','CML2_PREVIEW_TEXT',NULL),(103,101,199,200,6,'Value',NULL,NULL),(104,85,202,207,5,'PropertyValues',NULL,NULL),(105,104,203,204,6,'Id','CML2_PREVIEW_PICTURE',NULL),(106,104,205,206,6,'Value',NULL,NULL),(107,79,210,263,3,'Element',NULL,NULL),(108,107,211,212,4,'Id','3',NULL),(109,107,213,214,4,'Title','Associate Marketing Manager',NULL),(110,107,215,216,4,'BitrixTags',NULL,NULL),(111,107,217,218,4,'Description','<p>Provide professional administrative support to IT executives and department. Tasks require a high degree of sound judgment, initiative and tact under general supervision.</p>\r\n\r\n<b>Requirements</b> 						 						 \r\n<p>Minimum 5 years experience as an executive assistant</p>\r\n<p>Proficiency with Microsoft Office Suite</p>\r\n<p>Strong organizational skills</p>\r\n<p>Some college preferred but not necessary  </p>\r\n 						 						\r\n<b>Essential Functions</b> 						 \r\n<p>Provide general point of contact assistance and support for the IT department</p>\r\n<p>Maintain contractor database and monitor badge access extensions/deactivations</p>',NULL),(112,107,219,262,4,'PropertiesValues',NULL,NULL),(113,112,220,225,5,'PropertyValues',NULL,NULL),(114,113,221,222,6,'Id','CML2_ACTIVE',NULL),(115,113,223,224,6,'Value','true',NULL),(116,112,226,231,5,'PropertyValues',NULL,NULL),(117,116,227,228,6,'Id','CML2_CODE',NULL),(118,116,229,230,6,'Value',NULL,NULL),(119,112,232,237,5,'PropertyValues',NULL,NULL),(120,119,233,234,6,'Id','CML2_SORT',NULL),(121,119,235,236,6,'Value','300',NULL),(122,112,238,243,5,'PropertyValues',NULL,NULL),(123,122,239,240,6,'Id','CML2_ACTIVE_FROM',NULL),(124,122,241,242,6,'Value','2010-05-01 00:00:00',NULL),(125,112,244,249,5,'PropertyValues',NULL,NULL),(126,125,245,246,6,'Id','CML2_ACTIVE_TO',NULL),(127,125,247,248,6,'Value',NULL,NULL),(128,112,250,255,5,'PropertyValues',NULL,NULL),(129,128,251,252,6,'Id','CML2_PREVIEW_TEXT',NULL),(130,128,253,254,6,'Value',NULL,NULL),(131,112,256,261,5,'PropertyValues',NULL,NULL),(132,131,257,258,6,'Id','CML2_PREVIEW_PICTURE',NULL),(133,131,259,260,6,'Value',NULL,NULL),(134,79,264,317,3,'Element',NULL,NULL),(135,134,265,266,4,'Id','4',NULL),(136,134,267,268,4,'Title','Packaging Engineer',NULL),(137,134,269,270,4,'BitrixTags',NULL,NULL),(138,134,271,272,4,'Description','<b>Requirements</b> 						 						 \r\n<p>Bachelors Degree preferably in packaging or technically related field.</p>\r\n<p>Project Management experience essential.</p>	\r\n					 						\r\n<b>Essential Functions</b> 						 \r\n<p>Develop and maintain general and specific packaging specifications that meet transportation\r\nand optimal distribution flow requirements for all Decorative Accessories</p>\r\n<p>Analyze damage reports on products and take appropriate corrective actions to eliminate future\r\nproblems</p>\r\n<p>Research, designate, and approve packaging suppliers worldwide.</p>',NULL),(139,134,273,316,4,'PropertiesValues',NULL,NULL),(140,139,274,279,5,'PropertyValues',NULL,NULL),(141,140,275,276,6,'Id','CML2_ACTIVE',NULL),(142,140,277,278,6,'Value','true',NULL),(143,139,280,285,5,'PropertyValues',NULL,NULL),(144,143,281,282,6,'Id','CML2_CODE',NULL),(145,143,283,284,6,'Value',NULL,NULL),(146,139,286,291,5,'PropertyValues',NULL,NULL),(147,146,287,288,6,'Id','CML2_SORT',NULL),(148,146,289,290,6,'Value','400',NULL),(149,139,292,297,5,'PropertyValues',NULL,NULL),(150,149,293,294,6,'Id','CML2_ACTIVE_FROM',NULL),(151,149,295,296,6,'Value','2010-05-01 00:00:00',NULL),(152,139,298,303,5,'PropertyValues',NULL,NULL),(153,152,299,300,6,'Id','CML2_ACTIVE_TO',NULL),(154,152,301,302,6,'Value',NULL,NULL),(155,139,304,309,5,'PropertyValues',NULL,NULL),(156,155,305,306,6,'Id','CML2_PREVIEW_TEXT',NULL),(157,155,307,308,6,'Value',NULL,NULL),(158,139,310,315,5,'PropertyValues',NULL,NULL),(159,158,311,312,6,'Id','CML2_PREVIEW_PICTURE',NULL),(160,158,313,314,6,'Value',NULL,NULL),(161,0,22,0,0,'',NULL,NULL),(162,0,23,0,0,'',NULL,NULL),(163,0,24,0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `b_xml_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-13 18:53:57
