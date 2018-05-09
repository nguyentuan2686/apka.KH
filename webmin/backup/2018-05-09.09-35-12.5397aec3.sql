

-- --------------------------------------------------------
-- 
-- Table structure for table `b_agent`
-- 




DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50)  DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` varchar(255)  NOT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1)  DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_agent`
-- 


INSERT INTO `b_agent` VALUES (1,'main',100,'CEvent::CleanUpAgent();','Y','2018-05-09 00:38:46','2018-05-10 00:00:00',NULL,86400,'Y',NULL);
INSERT INTO `b_agent` VALUES (2,'main',100,'CUser::CleanUpHitAuthAgent();','Y','2018-05-09 00:38:46','2018-05-10 00:00:00',NULL,86400,'Y',NULL);
INSERT INTO `b_agent` VALUES (3,'main',100,'CCaptchaAgent::DeleteOldCaptcha(3600);','Y','2018-05-09 08:49:26','2018-05-09 09:49:26',NULL,3600,'N',NULL);
INSERT INTO `b_agent` VALUES (4,'main',100,'CUndo::CleanUpOld();','Y','2018-05-09 00:38:46','2018-05-10 00:00:00',NULL,86400,'Y',NULL);
INSERT INTO `b_agent` VALUES (5,'search',10,'CSearchSuggest::CleanUpAgent();','Y','2018-05-08 22:06:55','2018-05-09 22:06:55',NULL,86400,'N',NULL);
INSERT INTO `b_agent` VALUES (6,'search',10,'CSearchStatistic::CleanUpAgent();','Y','2018-05-08 22:06:55','2018-05-09 22:06:55',NULL,86400,'N',NULL);
INSERT INTO `b_agent` VALUES (7,'main',100,'CEventLog::CleanUpAgent();','Y','2018-05-08 22:06:55','2018-05-09 22:06:55',NULL,86400,'N',NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_cache_tag`
-- 




DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2)  DEFAULT NULL,
  `CACHE_SALT` char(4)  DEFAULT NULL,
  `RELATIVE_PATH` varchar(255)  DEFAULT NULL,
  `TAG` varchar(100)  DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_captcha`
-- 




DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32)  NOT NULL,
  `CODE` varchar(20)  NOT NULL,
  `IP` varchar(15)  NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_event`
-- 




DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(50)  NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` char(2)  NOT NULL,
  `C_FIELDS` longtext ,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1)  NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1)  NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_event_log`
-- 




DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50)  NOT NULL,
  `AUDIT_TYPE_ID` varchar(50)  NOT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `ITEM_ID` varchar(255)  NOT NULL,
  `REMOTE_ADDR` varchar(15)  DEFAULT NULL,
  `USER_AGENT` text ,
  `REQUEST_URI` text ,
  `SITE_ID` char(2)  DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext ,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_event_message`
-- 




DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(50)  NOT NULL,
  `LID` char(2)  DEFAULT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255)  NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255)  NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255)  DEFAULT NULL,
  `MESSAGE` text ,
  `BODY_TYPE` varchar(4)  NOT NULL DEFAULT 'text',
  `BCC` text ,
  `REPLY_TO` varchar(255)  DEFAULT NULL,
  `CC` varchar(255)  DEFAULT NULL,
  `IN_REPLY_TO` varchar(255)  DEFAULT NULL,
  `PRIORITY` varchar(50)  DEFAULT NULL,
  `FIELD1_NAME` varchar(50)  DEFAULT NULL,
  `FIELD1_VALUE` varchar(255)  DEFAULT NULL,
  `FIELD2_NAME` varchar(50)  DEFAULT NULL,
  `FIELD2_VALUE` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_event_message`
-- 


INSERT INTO `b_event_message` VALUES (1,'2010-11-08 12:08:16','NEW_USER','s1','Y','#DEFAULT_EMAIL_FROM#','#DEFAULT_EMAIL_FROM#','#SITE_NAME#: New user has been registered on the site','Informational message from #SITE_NAME#\n---------------------------------------\n\nNew user has been successfully registered on the site #SERVER_NAME#.\n\nUser details:\nUser ID: #USER_ID#\n\nName: #NAME#\nLast Name: #LAST_NAME#\nUser\'s E-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_event_message` VALUES (2,'2010-11-08 12:08:16','USER_INFO','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Registration info','Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/bitrix/admin/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_event_message` VALUES (3,'2010-11-08 12:08:16','NEW_USER_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: New user registration confirmation','Greetings from #SITE_NAME#!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at #SERVER_NAME#.\n\nYour registration confirmation code: #CONFIRM_CODE#\n\nPlease use the link below to verify and activate your registration:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_event_message` VALUES (4,'2010-11-08 12:08:16','USER_INVITE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Invitation to site','Informational message from site #SITE_NAME#\n------------------------------------------\nHello #NAME# #LAST_NAME#!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: #ID#\nLogin: #LOGIN#\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_event_message` VALUES (5,'2010-11-08 12:08:16','FEEDBACK_FORM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: A feedback form message','Notification from #SITE_NAME#\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: #AUTHOR#\nSender\'s e-mail: #AUTHOR_EMAIL#\n\nMessage text:\n#TEXT#\n\nThis notification has been generated automatically.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_event_message_site`
-- 




DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2)  NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_event_message_site`
-- 


INSERT INTO `b_event_message_site` VALUES (1,'s1');
INSERT INTO `b_event_message_site` VALUES (2,'s1');
INSERT INTO `b_event_message_site` VALUES (3,'s1');
INSERT INTO `b_event_message_site` VALUES (4,'s1');
INSERT INTO `b_event_message_site` VALUES (5,'s1');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_event_type`
-- 




DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` varchar(201)  NOT NULL,
  `EVENT_NAME` varchar(50)  NOT NULL,
  `NAME` varchar(100)  DEFAULT NULL,
  `DESCRIPTION` text ,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_event_type`
-- 


INSERT INTO `b_event_type` VALUES (1,'en','NEW_USER','New user was registered','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',1);
INSERT INTO `b_event_type` VALUES (2,'en','USER_INFO','Account Information','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',2);
INSERT INTO `b_event_type` VALUES (3,'en','NEW_USER_CONFIRM','New user registration confirmation','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',3);
INSERT INTO `b_event_type` VALUES (4,'en','USER_INVITE','Invitation of a new site user','#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',4);
INSERT INTO `b_event_type` VALUES (5,'en','FEEDBACK_FORM','Sending a message using a feedback form','#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',5);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_favorite`
-- 




DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50)  DEFAULT NULL,
  `NAME` varchar(255)  DEFAULT NULL,
  `URL` text ,
  `COMMENTS` text ,
  `LANGUAGE_ID` char(2)  DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `COMMON` char(1)  NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_file`
-- 




DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50)  DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` int(18) NOT NULL,
  `CONTENT_TYPE` varchar(255)  DEFAULT 'IMAGE',
  `SUBDIR` varchar(255)  DEFAULT NULL,
  `FILE_NAME` varchar(255)  NOT NULL,
  `ORIGINAL_NAME` varchar(255)  DEFAULT NULL,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_file`
-- 


INSERT INTO `b_file` VALUES (38,'2018-03-31 00:54:55','iblock',333,500,105601,'image/jpeg','iblock/a4d','a4df7a45019eb15468c51f9f818df124.jpg','U23.jpg','');
INSERT INTO `b_file` VALUES (39,'2018-03-31 00:36:05','iblock',333,500,105601,'image/jpeg','iblock/f5d','f5de5614bc69e0487cbcd52571573176.jpg','U23.jpg','');
INSERT INTO `b_file` VALUES (40,'2018-03-31 00:59:51','fileman',534,800,171387,'image/jpeg','medialibrary/02a','02a193fda1e0e1930445a407041d61bf.jpg','DoiNgu.jpg','');
INSERT INTO `b_file` VALUES (41,'2018-04-25 16:57:23','iblock',706,1000,241995,'image/jpeg','iblock/34e','34eb00010ecd443912b92757b6815cbb.jpg','Article-20170213-120134.jpg','');
INSERT INTO `b_file` VALUES (42,'2018-04-25 16:57:23','iblock',706,1000,243941,'image/jpeg','iblock/b2f','b2f51e740335b41740b30e3a8153632c.jpg','247.jpg','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_file_search`
-- 




DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255)  NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255)  DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_group`
-- 




DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1)  NOT NULL DEFAULT 'N',
  `NAME` varchar(255)  NOT NULL,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  `SECURITY_POLICY` text ,
  `STRING_ID` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_group`
-- 


INSERT INTO `b_group` VALUES (1,'2010-11-08 12:08:16','Y',1,'N','Administrators','Full access.',NULL,NULL);
INSERT INTO `b_group` VALUES (2,'2010-11-08 12:08:16','Y',2,'Y','All users (with non-authorized users)','All users (including non-authorized users).',NULL,NULL);
INSERT INTO `b_group` VALUES (3,'2018-04-13 16:38:40','Y',100,'N','Quản trị web','','a:0:{}','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_group_collection_task`
-- 




DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_group_subordinate`
-- 




DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` varchar(255)  NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_group_task`
-- 




DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50)  DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_group_task`
-- 


INSERT INTO `b_group_task` VALUES (3,6,'');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock`
-- 




DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50)  NOT NULL,
  `LID` char(2)  NOT NULL,
  `CODE` varchar(50)  DEFAULT NULL,
  `NAME` varchar(255)  NOT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255)  DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255)  DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255)  DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text ,
  `DESCRIPTION_TYPE` char(4)  NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1)  NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1)  NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255)  DEFAULT NULL,
  `TMP_ID` varchar(40)  DEFAULT NULL,
  `INDEX_ELEMENT` char(1)  NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1)  NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1)  NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1)  NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1)  DEFAULT NULL,
  `LIST_MODE` char(1)  DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255)  DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255)  DEFAULT NULL,
  `SECTIONS_NAME` varchar(100)  DEFAULT NULL,
  `SECTION_NAME` varchar(100)  DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100)  DEFAULT NULL,
  `ELEMENT_NAME` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock`
-- 


INSERT INTO `b_iblock` VALUES (5,'2017-12-08 13:35:30','vn','s1','','Đặt xe','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (6,'2017-12-08 13:47:38','vn','s1','khachhang','Khách hàng','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (7,'2017-12-08 13:51:32','vn','s1','thongtinchuyen','Thông tin chuyến đi','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (8,'2017-12-20 20:35:47','vn','s1','tin-tuc','Tin tức và báo chí','Y',500,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (9,'2017-12-24 10:10:53','vn','s1','thong-tin','Thông tin','Y',600,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (10,'2017-12-24 11:51:34','vn','s1','cam-nan-di-lai','Cẩm nan đi lại','Y',600,'#SITE_DIR#/#IBLOCK_CODE#/','#SITE_DIR#/#IBLOCK_CODE#/#ELEMENT_CODE#.html','#SITE_DIR#/#IBLOCK_CODE#/#CODE#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (11,'2018-04-25 22:58:01','vn','s1','phong-ve','Danh bạ phòng vé','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/app.book/app/phong-ve/detail.php?ELEMENT_ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (12,'2018-04-25 23:38:06','vn','s1','tin-khuyen-mai','Tin khuyến mãi','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/app.book/app/tin-khuyen-mai/detail.php?ELEMENT_ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (13,'2018-04-25 23:59:52','vn','s1','tro-giup','Trợ giúp','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'N','N','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (14,'2018-05-07 14:25:35','vn','s1','','hạng xe','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');
INSERT INTO `b_iblock` VALUES (15,'2018-05-07 17:05:28','vn','s1','','Mã khuyến mại','Y',500,'#SITE_DIR#/vn/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/vn/detail.php?ID=#ID#','#SITE_DIR#/vn/list.php?SECTION_ID=#ID#',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','',1,0,NULL,'','','Sections','Section','Elements','Element');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_cache`
-- 




DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35)  NOT NULL,
  `CACHE` longtext  NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_element`
-- 




DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255)  NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text ,
  `PREVIEW_TEXT_TYPE` varchar(4)  NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext ,
  `DETAIL_TEXT_TYPE` varchar(4)  NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text ,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1)  DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text ,
  `IN_SECTIONS` char(1)  NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255)  DEFAULT NULL,
  `CODE` varchar(255)  DEFAULT NULL,
  `TAGS` varchar(255)  DEFAULT NULL,
  `TMP_ID` varchar(40)  DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_element`
-- 


INSERT INTO `b_iblock_element` VALUES (140,'2018-03-31 00:36:05',1,'2018-03-31 00:54:55',1,8,NULL,'Y','2018-01-17 00:00:00',NULL,500,'Người đẹp và siêu xe APKA đồng hành cùng U23',38,'Dàn siêu xe và người mẫu An Phát Khánh luôn sát cánh cùng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của dân tộc Việt Nam, hòa chung vào không khí đó tập thể 4000 anh em lái xe đã đồng hành cùng đội tuyển trong suốt quá trình thi đấu cho đến ngày vinh quang hôm nay ','text',39,'<span style=\"color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">D&agrave;n si&ecirc;u xe và người mẫu An Ph&aacute;t Khánh lu&ocirc;n sát cánh c&ugrave;ng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của d&acirc;n tộc Việt Nam, h&ograve;a chung vào không kh&iacute; đ&oacute; tập thể 4000 anh em lái xe đ&atilde; đồng hành cùng đội tuyển trong suốt quá tr&igrave;nh thi đấu cho đến ngày vinh quang hôm nay </span> \r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"> \r\n  <br style=\"box-sizing: border-box;\" />\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/329/32972c45bdc52090ad8cdba1364aaed3.JPG\" title=\"MRD_5817.JPG\" border=\"0\" alt=\"MRD_5817.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\">Trong suốt quá trình thi đấu từ trận đầu tiên cho đến trận chung kết 4000 anh em không ngừng  khuấy đông phong trào cổ vũ cho đội nhà, cụ thể là anh em dán những hình ảnh khich lệ động viên và bày tỏ sự tôn trọng những thành quả mà toàn đội bóng đã đạt được</div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <br style=\"box-sizing: border-box;\" />\r\n   </div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/135/1356d0d3884200445fa2757ace129521.JPG\" title=\"MRD_6115.JPG\" border=\"0\" alt=\"MRD_6115.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Hình ảnh xe dán  hình ảnh cổ vũ cùng với cờ đỏ sao vàng trên phố đã mang lại hiệu ứng to lớn góp phần nhỏ b&eacute; vào tinh thần bất diệt gửi đến các câu thủ đang thi đấu xa nhà.</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/ff0/ff016676dc504f86f3ede3e3e2bc48a4.JPG\" title=\"MRD_5963.JPG\" border=\"0\" alt=\"MRD_5963.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Qua sự kiện trên chứng tỏ một điều những anh em lái xe của An Phát Khánh ngoài chăm chỉ làm việc với cái tâm nghề nghiệp ra ch&uacute;ng tôi còn rất yêu thể thao, yêu đất nước và sẵn sàng hòa chung vào niềm vui của dân tộc</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/307/307d2498b619a32e2fbf51de5bbb5154.JPG\" title=\"MRD_5836.JPG\" border=\"0\" alt=\"MRD_5836.JPG\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\"  /></div>\r\n   \r\n    <div style=\"box-sizing: border-box; text-align: center;\"> \r\n      <br style=\"box-sizing: border-box;\" />\r\n     </div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Đội xe An Phát Khánh luôn sẵn sàng chào đón thêm các thành viên, những anh em trong một gia đình mới, với khẩu hiệu \'\'</div>\r\n   \r\n    <div style=\"box-sizing: border-box;\">Đoàn Kết Là Sức Mạnh &quot;  một lòng hướng đến tinh thần yêu nước, yêu thể thao</div>\r\n   </div>\r\n </div>\r\n ','html','NGƯỜI ĐẸP VÀ SIÊU XE APKA ĐỒNG HÀNH CÙNG U23\r\nDÀN SIÊU XE VÀ NGƯỜI MẪU AN PHÁT KHÁNH LUÔN SÁT CÁNH CÙNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DÂN TỘC VIỆT NAM, HÒA CHUNG VÀO KHÔNG KHÍ ĐÓ TẬP THỂ 4000 ANH EM LÁI XE ĐÃ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRÌNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \r\nD&AGRAVE;N SI&ECIRC;U XE VÀ NGƯỜI MẪU AN PH&AACUTE;T KHÁNH LU&OCIRC;N \r\nSÁT CÁNH C&UGRAVE;NG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO \r\nLÀ NIỀM TỰ HÀO CỦA D&ACIRC;N TỘC VIỆT NAM, H&OGRAVE;A CHUNG \r\nVÀO KHÔNG KH&IACUTE; Đ&OACUTE; TẬP THỂ 4000 ANH EM LÁI XE Đ&ATILDE; \r\nĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TR&IGRAVE;NH THI ĐẤU \r\nCHO ĐẾN NGÀY VINH QUANG HÔM NAY  \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/329/32972C45BDC52090AD8CDBA1364AAED3.JPG ]\r\n \r\nTRONG SUỐT QUÁ TRÌNH THI ĐẤU TỪ TRẬN ĐẦU TIÊN CHO ĐẾN \r\nTRẬN CHUNG KẾT 4000 ANH EM KHÔNG NGỪNG  KHUẤY ĐÔNG PHONG TRÀO \r\nCỔ VŨ CHO ĐỘI NHÀ, CỤ THỂ LÀ ANH EM DÁN NHỮNG HÌNH ẢNH \r\nKHICH LỆ ĐỘNG VIÊN VÀ BÀY TỎ SỰ TÔN TRỌNG NHỮNG THÀNH \r\nQUẢ MÀ TOÀN ĐỘI BÓNG ĐÃ ĐẠT ĐƯỢC \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/135/1356D0D3884200445FA2757ACE129521.JPG ]\r\n \r\nHÌNH ẢNH XE DÁN  HÌNH ẢNH CỔ VŨ CÙNG VỚI CỜ ĐỎ SAO VÀNG \r\nTRÊN PHỐ ĐÃ MANG LẠI HIỆU ỨNG TO LỚN GÓP PHẦN NHỎ B&EACUTE; \r\nVÀO TINH THẦN BẤT DIỆT GỬI ĐẾN CÁC CÂU THỦ ĐANG THI ĐẤU \r\nXA NHÀ. \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/FF0/FF016676DC504F86F3EDE3E3E2BC48A4.JPG ]\r\n \r\nQUA SỰ KIỆN TRÊN CHỨNG TỎ MỘT ĐIỀU NHỮNG ANH EM LÁI XE \r\nCỦA AN PHÁT KHÁNH NGOÀI CHĂM CHỈ LÀM VIỆC VỚI CÁI TÂM NGHỀ \r\nNGHIỆP RA CH&UACUTE;NG TÔI CÒN RẤT YÊU THỂ THAO, YÊU ĐẤT NƯỚC \r\nVÀ SẴN SÀNG HÒA CHUNG VÀO NIỀM VUI CỦA DÂN TỘC \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/307/307D2498B619A32E2FBF51DE5BBB5154.JPG ]\r\n \r\nĐỘI XE AN PHÁT KHÁNH LUÔN SẴN SÀNG CHÀO ĐÓN THÊM CÁC THÀNH \r\nVIÊN, NHỮNG ANH EM TRONG MỘT GIA ĐÌNH MỚI, VỚI KHẨU HIỆU \r\n\'\' ĐOÀN KẾT LÀ SỨC MẠNH \"  MỘT LÒNG HƯỚNG ĐẾN TINH THẦN \r\nYÊU NƯỚC, YÊU THỂ THAO',1,NULL,NULL,NULL,NULL,NULL,'N','140','apka-dong-hanh-u23','',NULL,NULL,15,'2018-03-31 00:55:02');
INSERT INTO `b_iblock_element` VALUES (177,'2018-04-27 15:08:29',0,'2018-04-27 15:08:29',0,5,NULL,'Y',NULL,NULL,500,'HOXYJA3R',NULL,NULL,'text',NULL,NULL,'text','HOXYJA3R\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','177',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (178,'2018-04-27 15:35:25',0,'2018-04-27 15:35:25',0,7,NULL,'Y',NULL,NULL,500,'NMYLHNTW',NULL,NULL,'text',NULL,NULL,'text','NMYLHNTW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','178',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (179,'2018-04-27 15:35:25',0,'2018-04-27 15:35:25',0,6,NULL,'Y',NULL,NULL,500,'NMYLHNTW',NULL,NULL,'text',NULL,NULL,'text','NMYLHNTW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','179',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (180,'2018-04-27 15:35:25',0,'2018-04-27 15:35:25',0,5,NULL,'Y',NULL,NULL,500,'NMYLHNTW',NULL,NULL,'text',NULL,NULL,'text','NMYLHNTW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','180',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (181,'2018-04-27 15:40:19',0,'2018-04-27 15:40:19',0,7,NULL,'Y',NULL,NULL,500,'9BR31L7Q',NULL,NULL,'text',NULL,NULL,'text','9BR31L7Q\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','181',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (182,'2018-04-27 15:40:19',0,'2018-04-27 15:40:19',0,6,NULL,'Y',NULL,NULL,500,'9BR31L7Q',NULL,NULL,'text',NULL,NULL,'text','9BR31L7Q\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','182',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (183,'2018-04-27 15:40:19',0,'2018-04-27 15:40:19',0,5,NULL,'Y',NULL,NULL,500,'9BR31L7Q',NULL,NULL,'text',NULL,NULL,'text','9BR31L7Q\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','183',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (184,'2018-04-27 15:42:46',0,'2018-04-27 15:42:46',0,7,NULL,'Y',NULL,NULL,500,'GSMNKK7Q',NULL,NULL,'text',NULL,NULL,'text','GSMNKK7Q\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','184',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (185,'2018-04-27 15:42:46',0,'2018-04-27 15:42:46',0,6,NULL,'Y',NULL,NULL,500,'GSMNKK7Q',NULL,NULL,'text',NULL,NULL,'text','GSMNKK7Q\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','185',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (186,'2018-04-27 15:50:43',0,'2018-04-27 15:42:46',0,5,NULL,'Y',NULL,NULL,500,'Dqhung',NULL,NULL,'text',NULL,NULL,'text','DQHUNG\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','186',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (175,'2018-04-27 15:08:29',0,'2018-04-27 15:08:29',0,7,NULL,'Y',NULL,NULL,500,'HOXYJA3R',NULL,NULL,'text',NULL,NULL,'text','HOXYJA3R\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','175',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (176,'2018-04-27 15:08:29',0,'2018-04-27 15:08:29',0,6,NULL,'Y',NULL,NULL,500,'HOXYJA3R',NULL,NULL,'text',NULL,NULL,'text','HOXYJA3R\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','176',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (169,'2018-04-27 14:47:04',0,'2018-04-27 14:47:04',0,7,NULL,'Y',NULL,NULL,500,'4B5EGTW2',NULL,NULL,'text',NULL,NULL,'text','4B5EGTW2\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','169',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (170,'2018-04-27 14:47:04',0,'2018-04-27 14:47:04',0,6,NULL,'Y',NULL,NULL,500,'4B5EGTW2',NULL,NULL,'text',NULL,NULL,'text','4B5EGTW2\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','170',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (171,'2018-04-27 14:47:04',0,'2018-04-27 14:47:04',0,5,NULL,'Y',NULL,NULL,500,'4B5EGTW2',NULL,NULL,'text',NULL,NULL,'text','4B5EGTW2\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','171',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (172,'2018-04-27 15:00:32',1,'2018-04-27 15:00:32',1,7,NULL,'Y',NULL,NULL,500,'XRXTAEHE',NULL,NULL,'text',NULL,NULL,'text','XRXTAEHE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','172',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (173,'2018-04-27 15:00:32',1,'2018-04-27 15:00:32',1,6,NULL,'Y',NULL,NULL,500,'XRXTAEHE',NULL,NULL,'text',NULL,NULL,'text','XRXTAEHE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','173',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (174,'2018-04-27 15:00:32',1,'2018-04-27 15:00:32',1,5,NULL,'Y',NULL,NULL,500,'XRXTAEHE',NULL,NULL,'text',NULL,NULL,'text','XRXTAEHE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','174',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (80,'2018-03-31 01:00:45',1,'2017-12-24 10:11:22',1,9,NULL,'Y',NULL,NULL,500,'Tuyển dụng',NULL,'','text',NULL,'\r\n<p align=\"center\"> <img src=\"/upload/medialibrary/02a/02a193fda1e0e1930445a407041d61bf.jpg\" title=\"DoiNgu.jpg\" border=\"0\" alt=\"DoiNgu.jpg\" width=\"800px\" height=\"534px\"  /> </p>\r\n \r\n<table> \r\n  <tbody> \r\n    <tr> <td style=\"border-image: initial;\"> \r\n        <p>C&ocirc;ng ty cổ phần đầu tư <b>An Ph&aacute;t Khánh</b> l&agrave; một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (tr&ecirc;n nền tảng Grab). </p>\r\n       \r\n        <p>Các lĩnh vực hoạt động: </p>\r\n       \r\n        <p>1. Mua Bán xe ô tô cũ mới, mua xe trả g&oacute;p: <i><u>apkauto.vn</u></i> </p>\r\n       \r\n        <p>2. Gara bảo dưỡng, sửa chữa xe ô tô: <i><u>anphatauto.com</u></i> </p>\r\n       \r\n        <p>3. Đầu tư, cho thuê và hợp tác xe Grab: <i><u>anphatkhanh.vn</u></i> </p>\r\n       \r\n        <p>4. Mua bán bảo hiểm ô tô: <i><u>anphatkhanh.vn</u></i> </p>\r\n       \r\n        <p>5. Dự án xe Nội Bài, xe chạy tỉnh: <i><u>apka.vn</u></i> </p>\r\n       \r\n        <p>APKA.VN hiện nay với hơn <b>4000</b> đối tác lái xe tham gia hợp tác, gi&uacute;p hành khách t&igrave;m được xe giá tốt, luôn giúp chuyến đi vui th&iacute;ch. </p>\r\n       \r\n        <p>Dựa trên nền tảng công nghệ website và di động, <u>www.apka.vn</u> phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. </p>\r\n       </td> </tr>\r\n   </tbody>\r\n </table>\r\n \r\n<p> </p>\r\n \r\n<p><u>Apka.vn</u> là thành viên công ty cổ phần đầu tư An Phát Khánh (<a href=\"http://www.anphatkhanh.vn/\" >www.anphatkhanh.vn</a>). Với nhu cầu phát triển, Apka.vn cần tuyển dụng nh&acirc;n sự cho dự án xe Nội Bài và xe tỉnh như sau: </p>\r\n \r\n<p><b> </b></p>\r\n \r\n<p><b>1. </b><b>Nhân viên kinh doanh </b></p>\r\n \r\n<p>Mô tả công việc: </p>\r\n \r\n<p>- Liên hệ hợp tác với đối tác đại l&yacute;: </p>\r\n \r\n<p>- Thống nhất phương án hợp tác, chốt ký hợp đồng </p>\r\n \r\n<p>- Kết nối với đối tác để lấy thông tin khách hàng có nhu cầu sử dụng dịch vụ. </p>\r\n \r\n<p>- Chuyển thông tin khách hàng về ph&ograve;ng chăm sóc khách hàng để nhân viên CSKH liên hệ tư vấn, chăm sóc. </p>\r\n \r\n<p>- Đánh giá kết quả, tỉ lệ thành công. Xây dựng phương án, kế hoạch công việc. </p>\r\n \r\n<p><b>2. </b><b>Nhân viên Tổ chức hành chính và Chăm sóc khách hàng. </b></p>\r\n \r\n<p>Mô tả công việc: </p>\r\n \r\n<p>- Soạn thảo công văn, giấy tờ, văn bản </p>\r\n \r\n<p>- Theo d&otilde;i hợp đồng </p>\r\n \r\n<p>- Chăm sóc khách hàng (khách hàng sử dụng dịch vụ xe đưa đón sân bay, đi tỉnh và các khách hàng đại lý, công ty) </p>\r\n \r\n<p>- Tư vấn, giải đáp thắc mắc, thuyết phục khách hàng tiềm năng sử dụng dịch vụ </p>\r\n \r\n<p>- Đăng tin dịch vụ công ty trên các website mua bán, rao vặt, website và facebook (sẽ được hướng dẫn đầy đủ) </p>\r\n \r\n<p>- Xử lý các công việc hành chính của phòng Tổng hợp \r\n  <br />\r\n \r\n  <br />\r\n </p>\r\n \r\n<p><b>3. </b><b>Nhân viên Điều Hành Xe </b></p>\r\n \r\n<p>- Tổ chức sắp xếp và điều phối xe cho khách hàng </p>\r\n \r\n<p>- Bảo đảm lái xe chấp hành đúng quy định, tiêu chuẩn phục vụ khách hàng của công ty </p>\r\n \r\n<p>- Quản lý thông tin của lái xe và cập nhật thông tin lái xe lên hệ thống phần mềm </p>\r\n \r\n<p> </p>\r\n \r\n<p><b>4. </b><b>Nhân viên Marketing </b></p>\r\n \r\n<p>- Tìm kiếm, phát triển khách hàng cho sản phẩm qua các kênh Marketing Online như SMS Brandname, Email Marketing, Facebook, Google kênh sms brandname và các kênh quảng cáo khác... </p>\r\n \r\n<p>- Lập các kế hoạch truyền thông, khuyến mại để hoàn thành chỉ tiêu doanh thu cho dịch vụ mình quản lý. </p>\r\n \r\n<p>- Chăm sóc, hỗ trợ khách hàng do mình phát triển để đảm bảo doanh số cá nhân định kỳ. </p>\r\n \r\n<p>- Chủ động, sáng kiến trong việc đưa ra các ý tưởng mới. </p>\r\n \r\n<p><b>5. </b><b>Thực Tập viên </b></p>\r\n \r\n<p>- Tham gia hỗ trợ nhân viên chính thức </p>\r\n \r\n<p>- Tham gia hoạt động nhóm, đưa ý tưởng, sang tạo cho dự án </p>\r\n \r\n<p><b>QUYỀN LỢI: </b></p>\r\n \r\n<p>v Làm việc môi trường trẻ trung, năng động và ngành đang &ldquo;Hot&rdquo; hiện nay: taxi công nghệ </p>\r\n \r\n<p>v Có cơ hội học hỏi, phát triển, thăng tiến cao </p>\r\n \r\n<p>v Lương thưởng xứng đáng theo năng lực </p>\r\n \r\n<p>v Được tham quan, du lịch năm 1-2 lần </p>\r\n \r\n<p>v Được luân chuyển giữa các mảng của công ty khi có nguyện vọng </p>\r\n \r\n<p><b>Y&Ecirc;U CẦU HỒ SƠ &amp; ỨNG VIÊN </b></p>\r\n \r\n<p>&uuml; Công ty mong muốn tìm các bạn năng động, nhiệt huyết, sáng tạo, ứng viên chưa kinh nghiệm sẽ được đào tạo, hướng nghiệp. Có kinh nghiệm là điểm cộng khi phỏng vấn </p>\r\n \r\n<p>ü Hồ sơ gồm: Đơn xin việc, sơ yếu lý lịch. </p>\r\n \r\n<p>ü Các bằng cấp có liên quan. </p>\r\n \r\n<p>ü Hồ sơ ứng viên gửi về theo địa chỉ email: <b>contact@apka.vn</b> </p>\r\n \r\n<p>ü Hoặc liên hệ theo số điện thoại <b>0914.198.008/ 0981.370.360</b> để nộp hồ sơ tại văn phòng công ty tại Tòa nhà Nàng Hương, 583 Nguyễn Trãi, Thanh Xuân, Hà Nội. </p>\r\n \r\n<div> </div>\r\n ','html','TUYỂN DỤNG\r\n\r\n[ /UPLOAD/MEDIALIBRARY/02A/02A193FDA1E0E1930445A407041D61BF.JPG ] \r\n \r\n\r\nC&OCIRC;NG TY CỔ PHẦN ĐẦU TƯ AN PH&AACUTE;T KHÁNH L&AGRAVE; MỘT \r\nDOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG \r\nCÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TR&ECIRC;N NỀN TẢNG \r\nGRAB). \r\n\r\nCÁC LĨNH VỰC HOẠT ĐỘNG: \r\n\r\n1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ G&OACUTE;P: APKAUTO.VN \r\n\r\n2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: ANPHATAUTO.COM \r\n\r\n3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: ANPHATKHANH.VN \r\n\r\n4. MUA BÁN BẢO HIỂM Ô TÔ: ANPHATKHANH.VN \r\n\r\n5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: APKA.VN \r\n\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI TÁC LÁI XE THAM GIA HỢP TÁC, \r\nGI&UACUTE;P HÀNH KHÁCH T&IGRAVE;M ĐƯỢC XE GIÁ TỐT, LUÔN GIÚP \r\nCHUYẾN ĐI VUI TH&IACUTE;CH. \r\n\r\nDỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN \r\nPHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI \r\nKHÁCH HÀNG, CÁC H&ATILDE;NG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH \r\nTHỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI \r\nCHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. \r\n     \r\n \r\n\r\n \r\n\r\nAPKA.VN LÀ THÀNH VIÊN CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH \r\n(WWW.ANPHATKHANH.VN [ HTTP://WWW.ANPHATKHANH.VN/ ] ). VỚI NHU CẦU PHÁT \r\nTRIỂN, APKA.VN CẦN TUYỂN DỤNG NH&ACIRC;N SỰ CHO DỰ ÁN XE NỘI \r\nBÀI VÀ XE TỈNH NHƯ SAU: \r\n\r\n \r\n\r\n1. NHÂN VIÊN KINH DOANH \r\n\r\nMÔ TẢ CÔNG VIỆC: \r\n\r\n- LIÊN HỆ HỢP TÁC VỚI ĐỐI TÁC ĐẠI L&YACUTE;: \r\n\r\n- THỐNG NHẤT PHƯƠNG ÁN HỢP TÁC, CHỐT KÝ HỢP ĐỒNG \r\n\r\n- KẾT NỐI VỚI ĐỐI TÁC ĐỂ LẤY THÔNG TIN KHÁCH HÀNG CÓ \r\nNHU CẦU SỬ DỤNG DỊCH VỤ. \r\n\r\n- CHUYỂN THÔNG TIN KHÁCH HÀNG VỀ PH&OGRAVE;NG CHĂM SÓC KHÁCH \r\nHÀNG ĐỂ NHÂN VIÊN CSKH LIÊN HỆ TƯ VẤN, CHĂM SÓC. \r\n\r\n- ĐÁNH GIÁ KẾT QUẢ, TỈ LỆ THÀNH CÔNG. XÂY DỰNG PHƯƠNG \r\nÁN, KẾ HOẠCH CÔNG VIỆC. \r\n\r\n2. NHÂN VIÊN TỔ CHỨC HÀNH CHÍNH VÀ CHĂM SÓC KHÁCH HÀNG. \r\n\r\nMÔ TẢ CÔNG VIỆC: \r\n\r\n- SOẠN THẢO CÔNG VĂN, GIẤY TỜ, VĂN BẢN \r\n\r\n- THEO D&OTILDE;I HỢP ĐỒNG \r\n\r\n- CHĂM SÓC KHÁCH HÀNG (KHÁCH HÀNG SỬ DỤNG DỊCH VỤ XE ĐƯA \r\nĐÓN SÂN BAY, ĐI TỈNH VÀ CÁC KHÁCH HÀNG ĐẠI LÝ, CÔNG TY) \r\n\r\n- TƯ VẤN, GIẢI ĐÁP THẮC MẮC, THUYẾT PHỤC KHÁCH HÀNG TIỀM \r\nNĂNG SỬ DỤNG DỊCH VỤ \r\n\r\n- ĐĂNG TIN DỊCH VỤ CÔNG TY TRÊN CÁC WEBSITE MUA BÁN, RAO VẶT, \r\nWEBSITE VÀ FACEBOOK (SẼ ĐƯỢC HƯỚNG DẪN ĐẦY ĐỦ) \r\n\r\n- XỬ LÝ CÁC CÔNG VIỆC HÀNH CHÍNH CỦA PHÒNG TỔNG HỢP \r\n\r\n \r\n\r\n3. NHÂN VIÊN ĐIỀU HÀNH XE \r\n\r\n- TỔ CHỨC SẮP XẾP VÀ ĐIỀU PHỐI XE CHO KHÁCH HÀNG \r\n\r\n- BẢO ĐẢM LÁI XE CHẤP HÀNH ĐÚNG QUY ĐỊNH, TIÊU CHUẨN PHỤC \r\nVỤ KHÁCH HÀNG CỦA CÔNG TY \r\n\r\n- QUẢN LÝ THÔNG TIN CỦA LÁI XE VÀ CẬP NHẬT THÔNG TIN LÁI \r\nXE LÊN HỆ THỐNG PHẦN MỀM \r\n\r\n \r\n\r\n4. NHÂN VIÊN MARKETING \r\n\r\n- TÌM KIẾM, PHÁT TRIỂN KHÁCH HÀNG CHO SẢN PHẨM QUA CÁC KÊNH \r\nMARKETING ONLINE NHƯ SMS BRANDNAME, EMAIL MARKETING, FACEBOOK, GOOGLE KÊNH \r\nSMS BRANDNAME VÀ CÁC KÊNH QUẢNG CÁO KHÁC... \r\n\r\n- LẬP CÁC KẾ HOẠCH TRUYỀN THÔNG, KHUYẾN MẠI ĐỂ HOÀN THÀNH \r\nCHỈ TIÊU DOANH THU CHO DỊCH VỤ MÌNH QUẢN LÝ. \r\n\r\n- CHĂM SÓC, HỖ TRỢ KHÁCH HÀNG DO MÌNH PHÁT TRIỂN ĐỂ ĐẢM \r\nBẢO DOANH SỐ CÁ NHÂN ĐỊNH KỲ. \r\n\r\n- CHỦ ĐỘNG, SÁNG KIẾN TRONG VIỆC ĐƯA RA CÁC Ý TƯỞNG MỚI. \r\n\r\n5. THỰC TẬP VIÊN \r\n\r\n- THAM GIA HỖ TRỢ NHÂN VIÊN CHÍNH THỨC \r\n\r\n- THAM GIA HOẠT ĐỘNG NHÓM, ĐƯA Ý TƯỞNG, SANG TẠO CHO DỰ \r\nÁN \r\n\r\nQUYỀN LỢI: \r\n\r\nV LÀM VIỆC MÔI TRƯỜNG TRẺ TRUNG, NĂNG ĐỘNG VÀ NGÀNH ĐANG \r\n&LDQUO;HOT&RDQUO; HIỆN NAY: TAXI CÔNG NGHỆ \r\n\r\nV CÓ CƠ HỘI HỌC HỎI, PHÁT TRIỂN, THĂNG TIẾN CAO \r\n\r\nV LƯƠNG THƯỞNG XỨNG ĐÁNG THEO NĂNG LỰC \r\n\r\nV ĐƯỢC THAM QUAN, DU LỊCH NĂM 1-2 LẦN \r\n\r\nV ĐƯỢC LUÂN CHUYỂN GIỮA CÁC MẢNG CỦA CÔNG TY KHI CÓ NGUYỆN \r\nVỌNG \r\n\r\nY&ECIRC;U CẦU HỒ SƠ &AMP; ỨNG VIÊN \r\n\r\n&UUML; CÔNG TY MONG MUỐN TÌM CÁC BẠN NĂNG ĐỘNG, NHIỆT HUYẾT, \r\nSÁNG TẠO, ỨNG VIÊN CHƯA KINH NGHIỆM SẼ ĐƯỢC ĐÀO TẠO, \r\nHƯỚNG NGHIỆP. CÓ KINH NGHIỆM LÀ ĐIỂM CỘNG KHI PHỎNG VẤN \r\n\r\nÜ HỒ SƠ GỒM: ĐƠN XIN VIỆC, SƠ YẾU LÝ LỊCH. \r\n\r\nÜ CÁC BẰNG CẤP CÓ LIÊN QUAN. \r\n\r\nÜ HỒ SƠ ỨNG VIÊN GỬI VỀ THEO ĐỊA CHỈ EMAIL: CONTACT@APKA.VN \r\n\r\nÜ HOẶC LIÊN HỆ THEO SỐ ĐIỆN THOẠI 0914.198.008/ 0981.370.360 \r\nĐỂ NỘP HỒ SƠ TẠI VĂN PHÒNG CÔNG TY TẠI TÒA NHÀ NÀNG HƯƠNG, \r\n583 NGUYỄN TRÃI, THANH XUÂN, HÀ NỘI. ',1,NULL,NULL,NULL,NULL,NULL,'N','80','tuyen-dung','',NULL,NULL,72,'2017-12-24 10:24:41');
INSERT INTO `b_iblock_element` VALUES (81,'2018-04-13 16:43:52',8,'2017-12-24 10:54:33',1,9,NULL,'Y',NULL,NULL,500,'Đối tác của chúng tôi',NULL,'','text',NULL,' <font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\">Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</span></font> \r\n<div align=\"center\" style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px;\"> </div>\r\n ','html','ĐỐI TÁC CỦA CHÚNG TÔI\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI \r\nSAU',1,NULL,NULL,NULL,NULL,NULL,'N','81','doi-tac-cua-chung-toi','',NULL,NULL,74,'2017-12-24 10:54:55');
INSERT INTO `b_iblock_element` VALUES (161,'2018-04-26 00:09:26',1,'2018-04-26 00:04:30',1,13,NULL,'Y',NULL,NULL,500,'Chuyến đi và cước phí',NULL,'\r\n<div>Những ưu đ&atilde;i:</div>\r\n\r\n<div>- C&ocirc;ng ty đứng ra vay vốn ng&acirc;n h&agrave;ng toàn bộ số tiền c&ograve;n thiếu của kh&aacute;ch hàng</div>\r\n\r\n<div>- Tất cả các thủ tục đứng t&ecirc;n, vay vốn, đăng k&yacute;, đăng kiểm.... Công ty lo chu toàn</div>\r\n\r\n<div>- Miễn ph&iacute; toàn bộ chi phí cho xe tham gia kinh doanh, và tài khoản Uber, Grab</div>\r\n\r\n<div>- Cung cấp bảo hiểm TNDS và bảo hiểm thân vỏ ưu đãi nhất</div>\r\n\r\n<div>- Lái xe không phải mất thêm bất kỳ chi phí g&igrave; trong quá trình làm thủ tục</div>\r\n\r\n<div>- Những phần quà, chương trình quà tặng, lễ tết tri ân lái xe nhượng quyền hằng năm</div>\r\n\r\n<div>- C&oacute; Gara phục vụ lái xe c&ugrave;ng với cộng đồng lái xe 4000 xe toàn thành phố hà nội</div>\r\n\r\n<div>- Cung cấp phần mềm nhận cuốc đi tỉnh, sân bay độc quyền không tính phí cuốc....</div>\r\n','html',NULL,'','text','CHUYẾN ĐI VÀ CƯỚC PHÍ\r\nNHỮNG ƯU Đ&ATILDE;I: - C&OCIRC;NG TY ĐỨNG RA VAY VỐN NG&ACIRC;N \r\nH&AGRAVE;NG TOÀN BỘ SỐ TIỀN C&OGRAVE;N THIẾU CỦA KH&AACUTE;CH \r\nHÀNG - TẤT CẢ CÁC THỦ TỤC ĐỨNG T&ECIRC;N, VAY VỐN, ĐĂNG \r\nK&YACUTE;, ĐĂNG KIỂM.... CÔNG TY LO CHU TOÀN - MIỄN PH&IACUTE; TOÀN \r\nBỘ CHI PHÍ CHO XE THAM GIA KINH DOANH, VÀ TÀI KHOẢN UBER, GRAB - \r\nCUNG CẤP BẢO HIỂM TNDS VÀ BẢO HIỂM THÂN VỎ ƯU ĐÃI NHẤT \r\n- LÁI XE KHÔNG PHẢI MẤT THÊM BẤT KỲ CHI PHÍ G&IGRAVE; TRONG \r\nQUÁ TRÌNH LÀM THỦ TỤC - NHỮNG PHẦN QUÀ, CHƯƠNG TRÌNH QUÀ \r\nTẶNG, LỄ TẾT TRI ÂN LÁI XE NHƯỢNG QUYỀN HẰNG NĂM - C&OACUTE; \r\nGARA PHỤC VỤ LÁI XE C&UGRAVE;NG VỚI CỘNG ĐỒNG LÁI XE 4000 XE \r\nTOÀN THÀNH PHỐ HÀ NỘI - CUNG CẤP PHẦN MỀM NHẬN CUỐC ĐI \r\nTỈNH, SÂN BAY ĐỘC QUYỀN KHÔNG TÍNH PHÍ CUỐC....\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','161','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (162,'2018-04-26 00:10:57',1,'2018-04-26 00:10:57',1,13,NULL,'Y',NULL,NULL,500,'Tiêu chí đánh giá chuyến đi',NULL,'\r\n<div>Những ưu đ&atilde;i:</div>\r\n \r\n<div>- C&ocirc;ng ty đứng ra vay vốn ng&acirc;n h&agrave;ng toàn bộ số tiền c&ograve;n thiếu của kh&aacute;ch hàng</div>\r\n \r\n<div>- Tất cả các thủ tục đứng t&ecirc;n, vay vốn, đăng k&yacute;, đăng kiểm.... Công ty lo chu toàn</div>\r\n \r\n<div>- Miễn ph&iacute; toàn bộ chi phí cho xe tham gia kinh doanh, và tài khoản Uber, Grab</div>\r\n \r\n<div>- Cung cấp bảo hiểm TNDS và bảo hiểm thân vỏ ưu đãi nhất</div>\r\n \r\n<div>- Lái xe không phải mất thêm bất kỳ chi phí g&igrave; trong quá trình làm thủ tục</div>\r\n \r\n<div>- Những phần quà, chương trình quà tặng, lễ tết tri ân lái xe nhượng quyền hằng năm</div>\r\n \r\n<div>- C&oacute; Gara phục vụ lái xe c&ugrave;ng với cộng đồng lái xe 4000 xe toàn thành phố hà nội</div>\r\n \r\n<div>- Cung cấp phần mềm nhận cuốc đi tỉnh, sân bay độc quyền không tính phí cuốc....</div>\r\n ','html',NULL,'','text','TIÊU CHÍ ĐÁNH GIÁ CHUYẾN ĐI\r\nNHỮNG ƯU Đ&ATILDE;I: - C&OCIRC;NG TY ĐỨNG RA VAY VỐN NG&ACIRC;N \r\nH&AGRAVE;NG TOÀN BỘ SỐ TIỀN C&OGRAVE;N THIẾU CỦA KH&AACUTE;CH \r\nHÀNG - TẤT CẢ CÁC THỦ TỤC ĐỨNG T&ECIRC;N, VAY VỐN, ĐĂNG \r\nK&YACUTE;, ĐĂNG KIỂM.... CÔNG TY LO CHU TOÀN - MIỄN PH&IACUTE; TOÀN \r\nBỘ CHI PHÍ CHO XE THAM GIA KINH DOANH, VÀ TÀI KHOẢN UBER, GRAB - \r\nCUNG CẤP BẢO HIỂM TNDS VÀ BẢO HIỂM THÂN VỎ ƯU ĐÃI NHẤT \r\n- LÁI XE KHÔNG PHẢI MẤT THÊM BẤT KỲ CHI PHÍ G&IGRAVE; TRONG \r\nQUÁ TRÌNH LÀM THỦ TỤC - NHỮNG PHẦN QUÀ, CHƯƠNG TRÌNH QUÀ \r\nTẶNG, LỄ TẾT TRI ÂN LÁI XE NHƯỢNG QUYỀN HẰNG NĂM - C&OACUTE; \r\nGARA PHỤC VỤ LÁI XE C&UGRAVE;NG VỚI CỘNG ĐỒNG LÁI XE 4000 XE \r\nTOÀN THÀNH PHỐ HÀ NỘI - CUNG CẤP PHẦN MỀM NHẬN CUỐC ĐI \r\nTỈNH, SÂN BAY ĐỘC QUYỀN KHÔNG TÍNH PHÍ CUỐC....\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','162','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (197,'2018-04-27 16:03:57',0,'2018-04-27 16:03:57',0,6,NULL,'Y',NULL,NULL,500,'4GDFO5C5',NULL,NULL,'text',NULL,NULL,'text','4GDFO5C5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','197',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (198,'2018-04-27 16:03:57',0,'2018-04-27 16:03:57',0,5,NULL,'Y',NULL,NULL,500,'4GDFO5C5',NULL,NULL,'text',NULL,NULL,'text','4GDFO5C5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','198',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (199,'2018-04-27 16:09:38',0,'2018-04-27 16:09:38',0,7,NULL,'Y',NULL,NULL,500,'LCL5VBEW',NULL,NULL,'text',NULL,NULL,'text','LCL5VBEW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','199',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (200,'2018-04-27 16:09:38',0,'2018-04-27 16:09:38',0,6,NULL,'Y',NULL,NULL,500,'LCL5VBEW',NULL,NULL,'text',NULL,NULL,'text','LCL5VBEW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','200',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (201,'2018-04-27 16:09:38',0,'2018-04-27 16:09:38',0,5,NULL,'Y',NULL,NULL,500,'LCL5VBEW',NULL,NULL,'text',NULL,NULL,'text','LCL5VBEW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','201',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (202,'2018-04-27 16:18:06',0,'2018-04-27 16:18:06',0,7,NULL,'Y',NULL,NULL,500,'KZBV9JAK',NULL,NULL,'text',NULL,NULL,'text','KZBV9JAK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','202',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (203,'2018-04-27 16:18:06',0,'2018-04-27 16:18:06',0,6,NULL,'Y',NULL,NULL,500,'KZBV9JAK',NULL,NULL,'text',NULL,NULL,'text','KZBV9JAK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','203',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (204,'2018-04-27 16:18:06',0,'2018-04-27 16:18:06',0,5,NULL,'Y',NULL,NULL,500,'KZBV9JAK',NULL,NULL,'text',NULL,NULL,'text','KZBV9JAK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','204',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (205,'2018-04-27 16:38:25',1,'2018-04-27 16:38:25',1,7,NULL,'Y',NULL,NULL,500,'OBTWDOJM',NULL,NULL,'text',NULL,NULL,'text','OBTWDOJM\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','205',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (206,'2018-04-27 16:38:25',1,'2018-04-27 16:38:25',1,6,NULL,'Y',NULL,NULL,500,'OBTWDOJM',NULL,NULL,'text',NULL,NULL,'text','OBTWDOJM\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','206',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (207,'2018-04-27 16:38:25',1,'2018-04-27 16:38:25',1,5,NULL,'Y',NULL,NULL,500,'OBTWDOJM',NULL,NULL,'text',NULL,NULL,'text','OBTWDOJM\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','207',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (208,'2018-04-27 16:41:29',1,'2018-04-27 16:41:29',1,7,NULL,'Y',NULL,NULL,500,'UHTAHFDY',NULL,NULL,'text',NULL,NULL,'text','UHTAHFDY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','208',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (209,'2018-04-27 16:41:29',1,'2018-04-27 16:41:29',1,6,NULL,'Y',NULL,NULL,500,'UHTAHFDY',NULL,NULL,'text',NULL,NULL,'text','UHTAHFDY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','209',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (210,'2018-04-27 16:41:29',1,'2018-04-27 16:41:29',1,5,NULL,'Y',NULL,NULL,500,'UHTAHFDY',NULL,NULL,'text',NULL,NULL,'text','UHTAHFDY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','210',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (211,'2018-04-27 16:44:01',1,'2018-04-27 16:44:01',1,7,NULL,'Y',NULL,NULL,500,'BNF3EPOK',NULL,NULL,'text',NULL,NULL,'text','BNF3EPOK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','211',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (212,'2018-04-27 16:44:01',1,'2018-04-27 16:44:01',1,6,NULL,'Y',NULL,NULL,500,'BNF3EPOK',NULL,NULL,'text',NULL,NULL,'text','BNF3EPOK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','212',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (213,'2018-04-27 16:44:01',1,'2018-04-27 16:44:01',1,5,NULL,'Y',NULL,NULL,500,'BNF3EPOK',NULL,NULL,'text',NULL,NULL,'text','BNF3EPOK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','213',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (214,'2018-04-27 22:26:59',0,'2018-04-27 22:26:59',0,7,NULL,'Y',NULL,NULL,500,'BPVF0VDE',NULL,NULL,'text',NULL,NULL,'text','BPVF0VDE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','214',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (215,'2018-04-27 22:26:59',0,'2018-04-27 22:26:59',0,6,NULL,'Y',NULL,NULL,500,'BPVF0VDE',NULL,NULL,'text',NULL,NULL,'text','BPVF0VDE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','215',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (216,'2018-04-27 22:26:59',0,'2018-04-27 22:26:59',0,5,NULL,'Y',NULL,NULL,500,'BPVF0VDE',NULL,NULL,'text',NULL,NULL,'text','BPVF0VDE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','216',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (217,'2018-04-27 22:38:12',0,'2018-04-27 22:38:12',0,7,NULL,'Y',NULL,NULL,500,'BBYZZSZQ',NULL,NULL,'text',NULL,NULL,'text','BBYZZSZQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','217',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (218,'2018-04-27 22:38:12',0,'2018-04-27 22:38:12',0,6,NULL,'Y',NULL,NULL,500,'BBYZZSZQ',NULL,NULL,'text',NULL,NULL,'text','BBYZZSZQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','218',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (219,'2018-04-27 22:38:12',0,'2018-04-27 22:38:12',0,5,NULL,'Y',NULL,NULL,500,'BBYZZSZQ',NULL,NULL,'text',NULL,NULL,'text','BBYZZSZQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','219',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (220,'2018-04-27 22:41:05',0,'2018-04-27 22:41:05',0,7,NULL,'Y',NULL,NULL,500,'9UQE70RY',NULL,NULL,'text',NULL,NULL,'text','9UQE70RY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','220',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (221,'2018-04-27 22:41:05',0,'2018-04-27 22:41:05',0,6,NULL,'Y',NULL,NULL,500,'9UQE70RY',NULL,NULL,'text',NULL,NULL,'text','9UQE70RY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','221',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (222,'2018-04-27 22:41:05',0,'2018-04-27 22:41:05',0,5,NULL,'Y',NULL,NULL,500,'9UQE70RY',NULL,NULL,'text',NULL,NULL,'text','9UQE70RY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','222',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (223,'2018-04-27 22:44:23',0,'2018-04-27 22:44:23',0,7,NULL,'Y',NULL,NULL,500,'SWAWLSSK',NULL,NULL,'text',NULL,NULL,'text','SWAWLSSK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','223',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (224,'2018-04-27 22:44:23',0,'2018-04-27 22:44:23',0,6,NULL,'Y',NULL,NULL,500,'SWAWLSSK',NULL,NULL,'text',NULL,NULL,'text','SWAWLSSK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','224',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (225,'2018-04-27 22:44:23',0,'2018-04-27 22:44:23',0,5,NULL,'Y',NULL,NULL,500,'SWAWLSSK',NULL,NULL,'text',NULL,NULL,'text','SWAWLSSK\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','225',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (226,'2018-04-27 22:51:20',0,'2018-04-27 22:51:20',0,7,NULL,'Y',NULL,NULL,500,'OZODHMOV',NULL,NULL,'text',NULL,NULL,'text','OZODHMOV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','226',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (227,'2018-04-27 22:51:20',0,'2018-04-27 22:51:20',0,6,NULL,'Y',NULL,NULL,500,'OZODHMOV',NULL,NULL,'text',NULL,NULL,'text','OZODHMOV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','227',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (228,'2018-04-27 22:51:20',0,'2018-04-27 22:51:20',0,5,NULL,'Y',NULL,NULL,500,'OZODHMOV',NULL,NULL,'text',NULL,NULL,'text','OZODHMOV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','228',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (230,'2018-05-02 08:27:10',1,'2018-05-02 08:27:10',1,6,NULL,'Y',NULL,NULL,500,'RMKB7WVH',NULL,NULL,'text',NULL,NULL,'text','RMKB7WVH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','230',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (231,'2018-05-02 08:27:10',1,'2018-05-02 08:27:10',1,5,NULL,'Y',NULL,NULL,500,'RMKB7WVH',NULL,NULL,'text',NULL,NULL,'text','RMKB7WVH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','231',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (232,'2018-05-03 14:40:30',1,'2018-05-03 14:40:30',1,7,NULL,'Y',NULL,NULL,500,'ZLYWEMP5',NULL,NULL,'text',NULL,NULL,'text','ZLYWEMP5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','232',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (233,'2018-05-03 14:40:30',1,'2018-05-03 14:40:30',1,6,NULL,'Y',NULL,NULL,500,'ZLYWEMP5',NULL,NULL,'text',NULL,NULL,'text','ZLYWEMP5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','233',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (234,'2018-05-03 14:40:30',1,'2018-05-03 14:40:30',1,5,NULL,'Y',NULL,NULL,500,'ZLYWEMP5',NULL,NULL,'text',NULL,NULL,'text','ZLYWEMP5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','234',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (235,'2018-05-03 14:42:56',0,'2018-05-03 14:42:56',0,7,NULL,'Y',NULL,NULL,500,'AHEYFLIQ',NULL,NULL,'text',NULL,NULL,'text','AHEYFLIQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','235',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (236,'2018-05-03 14:42:56',0,'2018-05-03 14:42:56',0,6,NULL,'Y',NULL,NULL,500,'AHEYFLIQ',NULL,NULL,'text',NULL,NULL,'text','AHEYFLIQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','236',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (237,'2018-05-03 14:42:56',0,'2018-05-03 14:42:56',0,5,NULL,'Y',NULL,NULL,500,'AHEYFLIQ',NULL,NULL,'text',NULL,NULL,'text','AHEYFLIQ\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','237',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (238,'2018-05-03 14:43:40',0,'2018-05-03 14:43:40',0,7,NULL,'Y',NULL,NULL,500,'LJEMRHN7',NULL,NULL,'text',NULL,NULL,'text','LJEMRHN7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','238',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (239,'2018-05-03 14:43:40',0,'2018-05-03 14:43:40',0,6,NULL,'Y',NULL,NULL,500,'LJEMRHN7',NULL,NULL,'text',NULL,NULL,'text','LJEMRHN7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','239',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (240,'2018-05-03 14:43:40',0,'2018-05-03 14:43:40',0,5,NULL,'Y',NULL,NULL,500,'LJEMRHN7',NULL,NULL,'text',NULL,NULL,'text','LJEMRHN7\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','240',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (241,'2018-05-07 14:27:13',1,'2018-05-07 14:27:13',1,14,NULL,'Y',NULL,NULL,500,'xe 4 cho ',NULL,'','text',NULL,'','text','XE 4 CHO \r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','241','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (242,'2018-05-07 14:27:30',1,'2018-05-07 14:27:30',1,14,NULL,'Y',NULL,NULL,500,'Xe 7 cho',NULL,'','text',NULL,'','text','XE 7 CHO\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','242','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (243,'2018-05-07 16:58:15',1,'2018-05-07 16:58:15',1,7,NULL,'Y',NULL,NULL,500,'WFUTQ1AR',NULL,NULL,'text',NULL,NULL,'text','WFUTQ1AR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','243',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (244,'2018-05-07 16:58:15',1,'2018-05-07 16:58:15',1,6,NULL,'Y',NULL,NULL,500,'WFUTQ1AR',NULL,NULL,'text',NULL,NULL,'text','WFUTQ1AR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','244',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (245,'2018-05-07 16:58:15',1,'2018-05-07 16:58:15',1,5,NULL,'Y',NULL,NULL,500,'WFUTQ1AR',NULL,NULL,'text',NULL,NULL,'text','WFUTQ1AR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','245',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (246,'2018-05-07 16:59:54',1,'2018-05-07 16:59:54',1,7,NULL,'Y',NULL,NULL,500,'10S7AQWT',NULL,NULL,'text',NULL,NULL,'text','10S7AQWT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','246',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (247,'2018-05-07 16:59:54',1,'2018-05-07 16:59:54',1,6,NULL,'Y',NULL,NULL,500,'10S7AQWT',NULL,NULL,'text',NULL,NULL,'text','10S7AQWT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','247',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (248,'2018-05-07 16:59:54',1,'2018-05-07 16:59:54',1,5,NULL,'Y',NULL,NULL,500,'10S7AQWT',NULL,NULL,'text',NULL,NULL,'text','10S7AQWT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','248',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (249,'2018-05-07 17:05:52',1,'2018-05-07 17:05:52',1,15,NULL,'Y',NULL,NULL,500,'đại lí 1',NULL,'','text',NULL,'','text','ĐẠI LÍ 1\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','249','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (250,'2018-05-07 17:29:50',1,'2018-05-07 17:29:50',1,7,NULL,'Y',NULL,NULL,500,'MWTHRX3Y',NULL,NULL,'text',NULL,NULL,'text','MWTHRX3Y\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','250',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (251,'2018-05-07 17:29:50',1,'2018-05-07 17:29:50',1,6,NULL,'Y',NULL,NULL,500,'MWTHRX3Y',NULL,NULL,'text',NULL,NULL,'text','MWTHRX3Y\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','251',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (252,'2018-05-07 17:29:50',1,'2018-05-07 17:29:50',1,5,NULL,'Y',NULL,NULL,500,'MWTHRX3Y',NULL,NULL,'text',NULL,NULL,'text','MWTHRX3Y\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','252',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (253,'2018-05-07 17:31:52',1,'2018-05-07 17:31:52',1,15,NULL,'Y',NULL,NULL,500,'dai li b',NULL,'','text',NULL,'','text','DAI LI B\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','253','','',NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (254,'2018-05-07 17:38:57',1,'2018-05-07 17:38:57',1,7,NULL,'Y',NULL,NULL,500,'8L3OBMR5',NULL,NULL,'text',NULL,NULL,'text','8L3OBMR5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','254',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (255,'2018-05-07 17:38:57',1,'2018-05-07 17:38:57',1,6,NULL,'Y',NULL,NULL,500,'8L3OBMR5',NULL,NULL,'text',NULL,NULL,'text','8L3OBMR5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','255',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (256,'2018-05-07 17:38:57',1,'2018-05-07 17:38:57',1,5,NULL,'Y',NULL,NULL,500,'8L3OBMR5',NULL,NULL,'text',NULL,NULL,'text','8L3OBMR5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','256',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (257,'2018-05-07 17:41:28',1,'2018-05-07 17:41:28',1,7,NULL,'Y',NULL,NULL,500,'JHUWNBVA',NULL,NULL,'text',NULL,NULL,'text','JHUWNBVA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','257',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (258,'2018-05-07 17:41:28',1,'2018-05-07 17:41:28',1,6,NULL,'Y',NULL,NULL,500,'JHUWNBVA',NULL,NULL,'text',NULL,NULL,'text','JHUWNBVA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','258',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (259,'2018-05-07 17:41:28',1,'2018-05-07 17:41:28',1,5,NULL,'Y',NULL,NULL,500,'JHUWNBVA',NULL,NULL,'text',NULL,NULL,'text','JHUWNBVA\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','259',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (260,'2018-05-07 17:46:59',1,'2018-05-07 17:46:59',1,7,NULL,'Y',NULL,NULL,500,'OOPVZYWD',NULL,NULL,'text',NULL,NULL,'text','OOPVZYWD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','260',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (261,'2018-05-07 17:46:59',1,'2018-05-07 17:46:59',1,6,NULL,'Y',NULL,NULL,500,'OOPVZYWD',NULL,NULL,'text',NULL,NULL,'text','OOPVZYWD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','261',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (262,'2018-05-07 17:46:59',1,'2018-05-07 17:46:59',1,5,NULL,'Y',NULL,NULL,500,'OOPVZYWD',NULL,NULL,'text',NULL,NULL,'text','OOPVZYWD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','262',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (263,'2018-05-07 17:54:04',1,'2018-05-07 17:54:04',1,7,NULL,'Y',NULL,NULL,500,'JYEEROJY',NULL,NULL,'text',NULL,NULL,'text','JYEEROJY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','263',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (264,'2018-05-07 17:54:04',1,'2018-05-07 17:54:04',1,6,NULL,'Y',NULL,NULL,500,'JYEEROJY',NULL,NULL,'text',NULL,NULL,'text','JYEEROJY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','264',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (265,'2018-05-07 17:54:04',1,'2018-05-07 17:54:04',1,5,NULL,'Y',NULL,NULL,500,'JYEEROJY',NULL,NULL,'text',NULL,NULL,'text','JYEEROJY\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','265',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (266,'2018-05-07 17:58:11',1,'2018-05-07 17:58:11',1,7,NULL,'Y',NULL,NULL,500,'GIOQ2WTD',NULL,NULL,'text',NULL,NULL,'text','GIOQ2WTD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','266',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (267,'2018-05-07 17:58:11',1,'2018-05-07 17:58:11',1,6,NULL,'Y',NULL,NULL,500,'GIOQ2WTD',NULL,NULL,'text',NULL,NULL,'text','GIOQ2WTD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','267',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (268,'2018-05-07 17:58:11',1,'2018-05-07 17:58:11',1,5,NULL,'Y',NULL,NULL,500,'GIOQ2WTD',NULL,NULL,'text',NULL,NULL,'text','GIOQ2WTD\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','268',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (269,'2018-05-07 18:00:09',1,'2018-05-07 18:00:09',1,7,NULL,'Y',NULL,NULL,500,'IU8GHDXS',NULL,NULL,'text',NULL,NULL,'text','IU8GHDXS\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','269',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (270,'2018-05-07 18:00:09',1,'2018-05-07 18:00:09',1,6,NULL,'Y',NULL,NULL,500,'IU8GHDXS',NULL,NULL,'text',NULL,NULL,'text','IU8GHDXS\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','270',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (271,'2018-05-07 18:00:09',1,'2018-05-07 18:00:09',1,5,NULL,'Y',NULL,NULL,500,'IU8GHDXS',NULL,NULL,'text',NULL,NULL,'text','IU8GHDXS\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','271',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (272,'2018-05-07 18:03:48',1,'2018-05-07 18:03:48',1,7,NULL,'Y',NULL,NULL,500,'2HNG6SXV',NULL,NULL,'text',NULL,NULL,'text','2HNG6SXV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','272',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (273,'2018-05-07 18:03:48',1,'2018-05-07 18:03:48',1,6,NULL,'Y',NULL,NULL,500,'2HNG6SXV',NULL,NULL,'text',NULL,NULL,'text','2HNG6SXV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','273',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (274,'2018-05-07 18:03:48',1,'2018-05-07 18:03:48',1,5,NULL,'Y',NULL,NULL,500,'2HNG6SXV',NULL,NULL,'text',NULL,NULL,'text','2HNG6SXV\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','274',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (275,'2018-05-07 18:07:24',1,'2018-05-07 18:07:24',1,7,NULL,'Y',NULL,NULL,500,'LWFVNP6V',NULL,NULL,'text',NULL,NULL,'text','LWFVNP6V\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','275',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (276,'2018-05-07 18:07:24',1,'2018-05-07 18:07:24',1,6,NULL,'Y',NULL,NULL,500,'LWFVNP6V',NULL,NULL,'text',NULL,NULL,'text','LWFVNP6V\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','276',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (277,'2018-05-07 18:07:24',1,'2018-05-07 18:07:24',1,5,NULL,'Y',NULL,NULL,500,'LWFVNP6V',NULL,NULL,'text',NULL,NULL,'text','LWFVNP6V\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','277',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (278,'2018-05-07 18:08:14',1,'2018-05-07 18:08:14',1,7,NULL,'Y',NULL,NULL,500,'J6MLPZHR',NULL,NULL,'text',NULL,NULL,'text','J6MLPZHR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','278',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (279,'2018-05-07 18:08:14',1,'2018-05-07 18:08:14',1,6,NULL,'Y',NULL,NULL,500,'J6MLPZHR',NULL,NULL,'text',NULL,NULL,'text','J6MLPZHR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','279',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (280,'2018-05-07 18:08:14',1,'2018-05-07 18:08:14',1,5,NULL,'Y',NULL,NULL,500,'J6MLPZHR',NULL,NULL,'text',NULL,NULL,'text','J6MLPZHR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','280',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (281,'2018-05-07 18:10:56',1,'2018-05-07 18:10:56',1,7,NULL,'Y',NULL,NULL,500,'AZXIJNLW',NULL,NULL,'text',NULL,NULL,'text','AZXIJNLW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','281',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (282,'2018-05-07 18:10:56',1,'2018-05-07 18:10:56',1,6,NULL,'Y',NULL,NULL,500,'AZXIJNLW',NULL,NULL,'text',NULL,NULL,'text','AZXIJNLW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','282',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (283,'2018-05-07 18:10:56',1,'2018-05-07 18:10:56',1,5,NULL,'Y',NULL,NULL,500,'AZXIJNLW',NULL,NULL,'text',NULL,NULL,'text','AZXIJNLW\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','283',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (284,'2018-05-07 18:12:34',1,'2018-05-07 18:12:34',1,7,NULL,'Y',NULL,NULL,500,'NQQ4QHIT',NULL,NULL,'text',NULL,NULL,'text','NQQ4QHIT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','284',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (285,'2018-05-07 18:12:34',1,'2018-05-07 18:12:34',1,6,NULL,'Y',NULL,NULL,500,'NQQ4QHIT',NULL,NULL,'text',NULL,NULL,'text','NQQ4QHIT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','285',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (286,'2018-05-07 18:12:34',1,'2018-05-07 18:12:34',1,5,NULL,'Y',NULL,NULL,500,'NQQ4QHIT',NULL,NULL,'text',NULL,NULL,'text','NQQ4QHIT\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','286',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (287,'2018-05-07 18:14:26',1,'2018-05-07 18:14:26',1,7,NULL,'Y',NULL,NULL,500,'6AEM79XH',NULL,NULL,'text',NULL,NULL,'text','6AEM79XH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','287',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (288,'2018-05-07 18:14:26',1,'2018-05-07 18:14:26',1,6,NULL,'Y',NULL,NULL,500,'6AEM79XH',NULL,NULL,'text',NULL,NULL,'text','6AEM79XH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','288',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (289,'2018-05-07 18:14:26',1,'2018-05-07 18:14:26',1,5,NULL,'Y',NULL,NULL,500,'6AEM79XH',NULL,NULL,'text',NULL,NULL,'text','6AEM79XH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','289',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (290,'2018-05-07 18:16:17',1,'2018-05-07 18:16:17',1,7,NULL,'Y',NULL,NULL,500,'1ZJXKD3Z',NULL,NULL,'text',NULL,NULL,'text','1ZJXKD3Z\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','290',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (291,'2018-05-07 18:16:17',1,'2018-05-07 18:16:17',1,6,NULL,'Y',NULL,NULL,500,'1ZJXKD3Z',NULL,NULL,'text',NULL,NULL,'text','1ZJXKD3Z\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','291',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (292,'2018-05-07 18:16:17',1,'2018-05-07 18:16:17',1,5,NULL,'Y',NULL,NULL,500,'1ZJXKD3Z',NULL,NULL,'text',NULL,NULL,'text','1ZJXKD3Z\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','292',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (293,'2018-05-07 18:17:30',1,'2018-05-07 18:17:30',1,7,NULL,'Y',NULL,NULL,500,'Q7Y1IMQB',NULL,NULL,'text',NULL,NULL,'text','Q7Y1IMQB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','293',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (294,'2018-05-07 18:17:30',1,'2018-05-07 18:17:30',1,6,NULL,'Y',NULL,NULL,500,'Q7Y1IMQB',NULL,NULL,'text',NULL,NULL,'text','Q7Y1IMQB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','294',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (295,'2018-05-07 18:17:30',1,'2018-05-07 18:17:30',1,5,NULL,'Y',NULL,NULL,500,'Q7Y1IMQB',NULL,NULL,'text',NULL,NULL,'text','Q7Y1IMQB\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','295',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (296,'2018-05-07 18:18:46',1,'2018-05-07 18:18:46',1,7,NULL,'Y',NULL,NULL,500,'U4A5RH5N',NULL,NULL,'text',NULL,NULL,'text','U4A5RH5N\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','296',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (297,'2018-05-07 18:18:46',1,'2018-05-07 18:18:46',1,6,NULL,'Y',NULL,NULL,500,'U4A5RH5N',NULL,NULL,'text',NULL,NULL,'text','U4A5RH5N\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','297',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (298,'2018-05-07 18:18:46',1,'2018-05-07 18:18:46',1,5,NULL,'Y',NULL,NULL,500,'U4A5RH5N',NULL,NULL,'text',NULL,NULL,'text','U4A5RH5N\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','298',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (299,'2018-05-07 18:19:26',1,'2018-05-07 18:19:26',1,7,NULL,'Y',NULL,NULL,500,'HFRL57J3',NULL,NULL,'text',NULL,NULL,'text','HFRL57J3\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','299',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (300,'2018-05-07 18:19:26',1,'2018-05-07 18:19:26',1,6,NULL,'Y',NULL,NULL,500,'HFRL57J3',NULL,NULL,'text',NULL,NULL,'text','HFRL57J3\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','300',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (301,'2018-05-07 18:19:26',1,'2018-05-07 18:19:26',1,5,NULL,'Y',NULL,NULL,500,'HFRL57J3',NULL,NULL,'text',NULL,NULL,'text','HFRL57J3\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','301',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (302,'2018-05-07 18:32:33',1,'2018-05-07 18:32:33',1,7,NULL,'Y',NULL,NULL,500,'XFTYYOEU',NULL,NULL,'text',NULL,NULL,'text','XFTYYOEU\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','302',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (303,'2018-05-07 18:32:33',1,'2018-05-07 18:32:33',1,6,NULL,'Y',NULL,NULL,500,'XFTYYOEU',NULL,NULL,'text',NULL,NULL,'text','XFTYYOEU\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','303',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (304,'2018-05-07 18:32:33',1,'2018-05-07 18:32:33',1,5,NULL,'Y',NULL,NULL,500,'XFTYYOEU',NULL,NULL,'text',NULL,NULL,'text','XFTYYOEU\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','304',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (305,'2018-05-07 18:39:50',1,'2018-05-07 18:39:50',1,7,NULL,'Y',NULL,NULL,500,'RSPR8MTC',NULL,NULL,'text',NULL,NULL,'text','RSPR8MTC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','305',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (306,'2018-05-07 18:39:50',1,'2018-05-07 18:39:50',1,6,NULL,'Y',NULL,NULL,500,'RSPR8MTC',NULL,NULL,'text',NULL,NULL,'text','RSPR8MTC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','306',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (307,'2018-05-07 18:39:50',1,'2018-05-07 18:39:50',1,5,NULL,'Y',NULL,NULL,500,'RSPR8MTC',NULL,NULL,'text',NULL,NULL,'text','RSPR8MTC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','307',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (308,'2018-05-07 21:52:50',0,'2018-05-07 21:52:50',0,7,NULL,'Y',NULL,NULL,500,'WQIJBZSR',NULL,NULL,'text',NULL,NULL,'text','WQIJBZSR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','308',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (309,'2018-05-07 21:52:50',0,'2018-05-07 21:52:50',0,6,NULL,'Y',NULL,NULL,500,'WQIJBZSR',NULL,NULL,'text',NULL,NULL,'text','WQIJBZSR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','309',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (310,'2018-05-07 21:52:50',0,'2018-05-07 21:52:50',0,5,NULL,'Y',NULL,NULL,500,'WQIJBZSR',NULL,NULL,'text',NULL,NULL,'text','WQIJBZSR\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','310',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (311,'2018-05-08 11:23:32',0,'2018-05-08 11:23:32',0,7,NULL,'Y',NULL,NULL,500,'CCRY6CPE',NULL,NULL,'text',NULL,NULL,'text','CCRY6CPE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','311',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (312,'2018-05-08 11:23:32',0,'2018-05-08 11:23:32',0,6,NULL,'Y',NULL,NULL,500,'CCRY6CPE',NULL,NULL,'text',NULL,NULL,'text','CCRY6CPE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','312',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (313,'2018-05-08 11:23:32',0,'2018-05-08 11:23:32',0,5,NULL,'Y',NULL,NULL,500,'CCRY6CPE',NULL,NULL,'text',NULL,NULL,'text','CCRY6CPE\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','313',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (82,'2018-04-13 16:46:32',8,'2017-12-24 11:08:24',1,9,NULL,'Y',NULL,NULL,500,'Khách hàng thường xuyên',NULL,'','text',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Chương tr&igrave;nh <span style=\"box-sizing: border-box; font-weight: 700;\">Kh&aacute;ch h&agrave;ng thường xuy&ecirc;n</span> mong muốn đem tới những ưu đ&atilde;i cho những khách hàng thường xuyên sử dụng dịch vụ v&acirc;̣n chuyển của <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a>. Nếu bạn là Hội viên của Chương trình Khách hàng thường xuyên, sau mỗi chuyến đi với <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a> hoặc sau mỗi lần sử dụng sản phẩm, dịch vụ, điểm (s&ocirc;́ km đã đi) sẽ được t&iacute;ch luỹ vào tài khoản của Bạn và bạn c&oacute; thể dễ dàng chuyển điểm thành những phần thưởng giá trị cho mình và cho người thân.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Lợi ích khi tham gia chương trình Khách hàng Thường xuyên: </span></p>\r\n \r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> \r\n  <li style=\"box-sizing: border-box;\">Khách hàng sử dụng dịch vụ 10 lần (mỗi chiều tính là 1 lần) thì sẽ được giảm 20.000 đ cho lần sử dụng dịch vụ thứ 11</li>\r\n \r\n  <li style=\"box-sizing: border-box;\">Nhận thông báo thường xuyên về các chương trình khuyến mãi, giảm giá của apka.vn và ưu tiên đăng k&yacute; tham gia nếu có nhu cầu.</li>\r\n \r\n  <li style=\"box-sizing: border-box;\">Nâng hạng xe, hạng chỗ nếu trên Hệ thống của <a href=\"http://apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >http://apka.vn</a> c&ograve;n xe/ còn chỗ trống c&ugrave;ng hành trình.</li>\r\n </ul>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Để trở thành hội viên Chương trình Khách hàng thường xuyên, Quý khách chỉ cần tạo tài khoản và mỗi lần đặt xe sẽ được tích điểm trong thông tin tài khoản.</p>\r\n ','html','KHÁCH HÀNG THƯỜNG XUYÊN\r\n\r\nCHƯƠNG TR&IGRAVE;NH KH&AACUTE;CH H&AGRAVE;NG THƯỜNG XUY&ECIRC;N MONG \r\nMUỐN ĐEM TỚI NHỮNG ƯU Đ&ATILDE;I CHO NHỮNG KHÁCH HÀNG THƯỜNG \r\nXUYÊN SỬ DỤNG DỊCH VỤ V&ACIRC;̣N CHUYỂN CỦA HTTP://APKA.VN \r\n[ HTTP://APKA.VN ] . NẾU BẠN LÀ HỘI VIÊN CỦA CHƯƠNG TRÌNH \r\nKHÁCH HÀNG THƯỜNG XUYÊN, SAU MỖI CHUYẾN ĐI VỚI HTTP://APKA.VN \r\n[ HTTP://APKA.VN ]  HOẶC SAU MỖI LẦN SỬ DỤNG SẢN PHẨM, DỊCH \r\nVỤ, ĐIỂM (S&OCIRC;́ KM ĐÃ ĐI) SẼ ĐƯỢC T&IACUTE;CH LUỸ \r\nVÀO TÀI KHOẢN CỦA BẠN VÀ BẠN C&OACUTE; THỂ DỄ DÀNG CHUYỂN \r\nĐIỂM THÀNH NHỮNG PHẦN THƯỞNG GIÁ TRỊ CHO MÌNH VÀ CHO NGƯỜI \r\nTHÂN. \r\n\r\nLỢI ÍCH KHI THAM GIA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN:  \r\n\r\n- KHÁCH HÀNG SỬ DỤNG DỊCH VỤ 10 LẦN (MỖI CHIỀU TÍNH LÀ \r\n1 LẦN) THÌ SẼ ĐƯỢC GIẢM 20.000 Đ CHO LẦN SỬ DỤNG DỊCH \r\nVỤ THỨ 11 \r\n- NHẬN THÔNG BÁO THƯỜNG XUYÊN VỀ CÁC CHƯƠNG TRÌNH KHUYẾN \r\nMÃI, GIẢM GIÁ CỦA APKA.VN VÀ ƯU TIÊN ĐĂNG K&YACUTE; THAM GIA \r\nNẾU CÓ NHU CẦU. \r\n- NÂNG HẠNG XE, HẠNG CHỖ NẾU TRÊN HỆ THỐNG CỦA HTTP://APKA.VN \r\n[ HTTP://APKA.VN ]  C&OGRAVE;N XE/ CÒN CHỖ TRỐNG C&UGRAVE;NG HÀNH \r\nTRÌNH. \r\n\r\nĐỂ TRỞ THÀNH HỘI VIÊN CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, \r\nQUÝ KHÁCH CHỈ CẦN TẠO TÀI KHOẢN VÀ MỖI LẦN ĐẶT XE SẼ \r\nĐƯỢC TÍCH ĐIỂM TRONG THÔNG TIN TÀI KHOẢN.',1,NULL,NULL,NULL,NULL,NULL,'N','82','khach-hang-thuong-xuyen','',NULL,NULL,75,'2017-12-24 11:08:41');
INSERT INTO `b_iblock_element` VALUES (83,'2018-03-31 01:07:46',1,'2017-12-24 11:10:03',1,9,NULL,'Y',NULL,NULL,500,'Khách hàng tổ chức',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> \r\n  <br />\r\n </p>\r\n \r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> </ul>\r\n ','html',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; background-color: rgb(250, 250, 250); text-align: justify;\"><font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\">Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</span></font></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> </ul>\r\n ','html','KHÁCH HÀNG TỔ CHỨC\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','83','khach-hang-to-chuc','',NULL,NULL,66,'2017-12-24 11:10:08');
INSERT INTO `b_iblock_element` VALUES (84,'2018-03-31 01:07:32',1,'2017-12-24 11:14:36',1,9,NULL,'Y',NULL,NULL,500,'Chia sẻ doanh thu',NULL,'','text',NULL,' \r\n<div align=\"center\" style=\"box-sizing: border-box; background-color: rgb(250, 250, 250);\"> \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\"><font color=\"#333333\" face=\"Roboto, Helvetica Neue, Helvetica, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau</b></span></font></p>\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <div style=\"box-sizing: border-box;\">\r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> </ul>\r\n   </div>\r\n </div>\r\n ','html','CHIA SẺ DOANH THU\r\n\r\nTH&OCIRC;NG TIN ĐANG CẬP NHẬT. BẠN VUI L&OGRAVE;NG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','84','chia-se-doanh-thu','',NULL,NULL,59,'2017-12-24 11:14:55');
INSERT INTO `b_iblock_element` VALUES (85,'2018-03-31 01:04:31',1,'2017-12-24 11:17:24',1,9,NULL,'N',NULL,NULL,500,'Đối tác vận chuyển',NULL,'','text',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">C&ocirc;ng ty cổ phần Vietgocar xin gửi lời ch&agrave;o tr&acirc;n trọng tới c&aacute;c Đối tác,</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Với mạng lưới đối tác vận chuyển tại nhiều tỉnh thành/ sân bay trong cả nước bao gồm các công ty taxi, cho thu&ecirc; xe hàng đầu, ch&uacute;ng tôi c&oacute; khả năng cung cấp các dịch vận chuyển đa dạng, đáp ứng tất cả nhu cầu đi lại từ dịch vụ Taxi thông thường đến dịch vụ Dịch vụ tiết kiệm (đi chung taxi,minibus) và Dịch vụ cao cấp (xe hạng sang).</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><o:p style=\"box-sizing: border-box;\"></o:p></p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Với những tổ chức/ cá nhân có phương tiện và khả năng đảm bảo chất lượng dịch vụ vận chuyển h&atilde;y tham gia vào chương tr&igrave;nh đối tác vận chuyển của chúng tôi để có thêm doanh thu và nhiều lợi &iacute;ch giá trị khác:</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Lợi ích khi tham gia Đối tác vận chuyển:</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Có khả năng tiếp cận hàng triệu khách hàng qua kênh trực tuyến của Vietgocar và thường xuyên nhận được đặt hàng vận chuyển, gia tăng doanh thu và tối ưu năng lực vận chuyển.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Theo kịp xu hướng tiêu d&ugrave;ng mới của hành khách là tìm kiếm và đặt xe trực tuyến hoặc qua ứng dụng di động</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Được Vietgocar hỗ trợ phát triển kênh đặt xe trực tuyến mà không mất chi phí đầu tư, chi phí bảo trì hệ thống và không cần nhân sự IT chuyên trách(đối với hãng vận tải)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Cho ph&eacute;p đặt chỗ và trả tiền trước, đảm bảo doanh thu và chủ động trong kinh doanh.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Có Hệ thống phản hồi của hành khách về tài xế và chăm sóc khách hàng tự động cho phép cải thiện chất lượng dịch vụ </li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"> <span style=\"box-sizing: border-box; font-weight: 700;\">Cách tham gia chương trình:</span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Đăng k&yacute; tham gia cách điền vào Form Đăng ký làm đối tác của Vietgocar</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Vietgocar kiểm tra năng lực cung cấp dịch vụ (đối với tổ chức) và trình độ chuyên môn liên quan đến vận chuyển hành khách(đối với tài xế tham gia với tư cách cá nhân)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Ký hợp đồng hợp tác vận chuyển và chia sẻ doanh thu</li>\r\n</ul>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\"><span style=\"box-sizing: border-box; font-weight: 700;\">Điều kiện tham gia: </span></p>\r\n\r\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Các công ty cung cấp dịch vụ vận chuyển chuyên nghiệp </li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Các tài xế mong muốn tham gia hệ thống của Vietgocar để cung cấp dịch vụ vận chuyển và kiếm thêm thu nhập</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Tham khảo các đối tác đã tham gia hệ thống của chúng tôi tại <a href=\"/thong-tin/doi-tac-cua-chung-toi.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">đây</a></li>\r\n</ul>\r\n','html','ĐỐI TÁC VẬN CHUYỂN\r\n\r\nC&OCIRC;NG TY CỔ PHẦN VIETGOCAR XIN GỬI LỜI CH&AGRAVE;O TR&ACIRC;N \r\nTRỌNG TỚI C&AACUTE;C ĐỐI TÁC, \r\n\r\nVỚI MẠNG LƯỚI ĐỐI TÁC VẬN CHUYỂN TẠI NHIỀU TỈNH THÀNH/ \r\nSÂN BAY TRONG CẢ NƯỚC BAO GỒM CÁC CÔNG TY TAXI, CHO THU&ECIRC; \r\nXE HÀNG ĐẦU, CH&UACUTE;NG TÔI C&OACUTE; KHẢ NĂNG CUNG CẤP CÁC \r\nDỊCH VẬN CHUYỂN ĐA DẠNG, ĐÁP ỨNG TẤT CẢ NHU CẦU ĐI LẠI \r\nTỪ DỊCH VỤ TAXI THÔNG THƯỜNG ĐẾN DỊCH VỤ DỊCH VỤ \r\nTIẾT KIỆM (ĐI CHUNG TAXI,MINIBUS) VÀ DỊCH VỤ CAO CẤP (XE \r\nHẠNG SANG). \r\n\r\n \r\n\r\nVỚI NHỮNG TỔ CHỨC/ CÁ NHÂN CÓ PHƯƠNG TIỆN VÀ KHẢ NĂNG \r\nĐẢM BẢO CHẤT LƯỢNG DỊCH VỤ VẬN CHUYỂN H&ATILDE;Y THAM \r\nGIA VÀO CHƯƠNG TR&IGRAVE;NH ĐỐI TÁC VẬN CHUYỂN CỦA CHÚNG TÔI \r\nĐỂ CÓ THÊM DOANH THU VÀ NHIỀU LỢI &IACUTE;CH GIÁ TRỊ KHÁC: \r\n\r\nLỢI ÍCH KHI THAM GIA ĐỐI TÁC VẬN CHUYỂN: \r\n\r\n- CÓ KHẢ NĂNG TIẾP CẬN HÀNG TRIỆU KHÁCH HÀNG QUA KÊNH TRỰC \r\nTUYẾN CỦA VIETGOCAR VÀ THƯỜNG XUYÊN NHẬN ĐƯỢC ĐẶT HÀNG \r\nVẬN CHUYỂN, GIA TĂNG DOANH THU VÀ TỐI ƯU NĂNG LỰC VẬN CHUYỂN. \r\n- THEO KỊP XU HƯỚNG TIÊU D&UGRAVE;NG MỚI CỦA HÀNH KHÁCH LÀ \r\nTÌM KIẾM VÀ ĐẶT XE TRỰC TUYẾN HOẶC QUA ỨNG DỤNG DI ĐỘNG \r\n- ĐƯỢC VIETGOCAR HỖ TRỢ PHÁT TRIỂN KÊNH ĐẶT XE TRỰC TUYẾN \r\nMÀ KHÔNG MẤT CHI PHÍ ĐẦU TƯ, CHI PHÍ BẢO TRÌ HỆ THỐNG VÀ \r\nKHÔNG CẦN NHÂN SỰ IT CHUYÊN TRÁCH(ĐỐI VỚI HÃNG VẬN TẢI) \r\n- CHO PH&EACUTE;P ĐẶT CHỖ VÀ TRẢ TIỀN TRƯỚC, ĐẢM BẢO \r\nDOANH THU VÀ CHỦ ĐỘNG TRONG KINH DOANH. \r\n- CÓ HỆ THỐNG PHẢN HỒI CỦA HÀNH KHÁCH VỀ TÀI XẾ VÀ CHĂM \r\nSÓC KHÁCH HÀNG TỰ ĐỘNG CHO PHÉP CẢI THIỆN CHẤT LƯỢNG DỊCH \r\nVỤ  \r\n\r\n CÁCH THAM GIA CHƯƠNG TRÌNH: \r\n\r\n- ĐĂNG K&YACUTE; THAM GIA CÁCH ĐIỀN VÀO FORM ĐĂNG KÝ LÀM ĐỐI \r\nTÁC CỦA VIETGOCAR \r\n- VIETGOCAR KIỂM TRA NĂNG LỰC CUNG CẤP DỊCH VỤ (ĐỐI VỚI \r\nTỔ CHỨC) VÀ TRÌNH ĐỘ CHUYÊN MÔN LIÊN QUAN ĐẾN VẬN CHUYỂN \r\nHÀNH KHÁCH(ĐỐI VỚI TÀI XẾ THAM GIA VỚI TƯ CÁCH CÁ NHÂN) \r\n- KÝ HỢP ĐỒNG HỢP TÁC VẬN CHUYỂN VÀ CHIA SẺ DOANH THU \r\n\r\nĐIỀU KIỆN THAM GIA:  \r\n\r\n- CÁC CÔNG TY CUNG CẤP DỊCH VỤ VẬN CHUYỂN CHUYÊN NGHIỆP  \r\n- CÁC TÀI XẾ MONG MUỐN THAM GIA HỆ THỐNG CỦA VIETGOCAR ĐỂ \r\nCUNG CẤP DỊCH VỤ VẬN CHUYỂN VÀ KIẾM THÊM THU NHẬP \r\n- THAM KHẢO CÁC ĐỐI TÁC ĐÃ THAM GIA HỆ THỐNG CỦA CHÚNG \r\nTÔI TẠI ĐÂY [ /THONG-TIN/DOI-TAC-CUA-CHUNG-TOI.HTML ]',1,NULL,NULL,NULL,NULL,NULL,'N','85','doi-tac-van-chuyen','',NULL,NULL,27,'2017-12-24 11:17:26');
INSERT INTO `b_iblock_element` VALUES (86,'2018-03-31 01:04:31',1,'2017-12-24 11:18:36',1,9,NULL,'N',NULL,NULL,500,'Vận chuyển hành khách',NULL,'','text',NULL,'\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">I. Quy định về kiểm tra th&ocirc;ng tin</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Qu&yacute; kh&aacute;ch cần xuất tr&igrave;nh m&atilde; đặt xe trước khi l&ecirc;n xe. Mã đặt xe n&agrave;y được ch&uacute;ng tôi gửi cho Quý khách qua ứng dụng di động, tin nhắn SMS hoặc bằng Email </li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách không nhớ hoặc quên mã đặt xe, quý khách vẫn c&oacute; thể đi xe nếu có thông tin khớp với thông tin đã sử dụng khi đặt chỗ ( điện thoại, CMND, hộ chiếu..) </li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">II. Quy định về thời gian tài xế chờ với từng dịch vụ.</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách đi taxi thông thường, tài xế taxi sẽ chờ Quý khách tối đa 15 phút tại điểm đón bạn yêu c&acirc;̀u. Ngoài thời gian này, chúng tôi có quyền hủy chuyến mà không phải bồi thường hoặc t&iacute;nh thêm tiền cước chờ khách (từ 40.000 đến 60.000đ/ giờ)</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách chọn dịch vụ đi gh&eacute;p với hành khách khác. Quý khách phải có mặt đúng giờ đã thống nhất với tài xế tại điểm đón Quý khách yêu cầu. Thời gian chờ tối đa là 15 phút trong trường hợp Hành khách đi chung đồng ý đợi.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Khi quý khách cung cấp đầy đủ thông tin như: Mã hiệu chuyến bay, thời gian hạ cánh, cất cánh, sảnh ra. Tài xế sẽ chờ hoặc chúng tôi sẽ xắp sếp sẵn xe đón quý khách ngay cả khi quý khách bị chậm chuyến bay.</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">III. Quy định về thời gian Quý khách chờ với từng dịch vụ</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách đặt dịch vụ taxi thông thường, taxi sẽ đến đón đúng giờ và đúng địa điểm Quý khách yêu cầu.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp Quý khách chọn dịch vụ đi ghép taxi, taxi sẽ đến đón tại địa điểm Quý khách yêu cầu trong khoảng  +/-15 phút so với giờ yếu cầu đón. Chúng tôi sẽ thông báo chính xác thời gian đón trước 60 phút so với giờ khởi hành. Thời gian đi đón Hành khách khác là tối đa 30 phút.</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">IV. Quy định về hủy đặt xe/ Thay đổi lịch trình: Quý khách có quyền hủy đặt xe hoặc thay đổi giờ đi mà không mất thêm chi phí. Chọn một trong các cách sau để thực hiện hủy/ thay đổi.</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Truy cập <a href=\"http://www.dichungtaxi.com/\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://vietgocar.com/</a>, đăng nhập bằng tài khoản, quản lý giao dịch, chọn chuyến đi cần thay đổi lịch trình.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện tới Tổng đài 19006022 để thông báo thay đổi hoặc hủy chuyến nếu cần</li>\r\n</ol>\r\n\r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">V. Quy định khác</h4>\r\n\r\n<ol style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\">\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Quý khách không mang theo những hàng hóa cấm trong danh mục quy định hàng cấm của nước Cộng Hoà Xã Hội Chủ Nghĩa Việt Nam</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Quý khách không được hút thuốc và ăn uống gây mất vệ sinh ở trên xe.</li>\r\n\r\n  <li style=\"box-sizing: border-box; text-align: justify;\">Trong điều kiện bất khả kháng(động đất, bão lũ..), chúng tôi được quyền hủy hoặc thay đổi lịch và giờ chạy mà không chịu bất cứ trách nhiệm nào.</li>\r\n</ol>\r\n','html','VẬN CHUYỂN HÀNH KHÁCH\r\n\r\nI. QUY ĐỊNH VỀ KIỂM TRA TH&OCIRC;NG TIN \r\n- QU&YACUTE; KH&AACUTE;CH CẦN XUẤT TR&IGRAVE;NH M&ATILDE; ĐẶT XE TRƯỚC \r\nKHI L&ECIRC;N XE. MÃ ĐẶT XE N&AGRAVE;Y ĐƯỢC CH&UACUTE;NG TÔI GỬI \r\nCHO QUÝ KHÁCH QUA ỨNG DỤNG DI ĐỘNG, TIN NHẮN SMS HOẶC BẰNG \r\nEMAIL  \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH KHÔNG NHỚ HOẶC QUÊN MÃ ĐẶT \r\nXE, QUÝ KHÁCH VẪN C&OACUTE; THỂ ĐI XE NẾU CÓ THÔNG TIN KHỚP \r\nVỚI THÔNG TIN ĐÃ SỬ DỤNG KHI ĐẶT CHỖ ( ĐIỆN THOẠI, CMND, \r\nHỘ CHIẾU..)  II. QUY ĐỊNH VỀ THỜI GIAN TÀI XẾ CHỜ VỚI \r\nTỪNG DỊCH VỤ. \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH ĐI TAXI THÔNG THƯỜNG, TÀI XẾ \r\nTAXI SẼ CHỜ QUÝ KHÁCH TỐI ĐA 15 PHÚT TẠI ĐIỂM ĐÓN BẠN \r\nYÊU C&ACIRC;̀U. NGOÀI THỜI GIAN NÀY, CHÚNG TÔI CÓ QUYỀN HỦY \r\nCHUYẾN MÀ KHÔNG PHẢI BỒI THƯỜNG HOẶC T&IACUTE;NH THÊM TIỀN \r\nCƯỚC CHỜ KHÁCH (TỪ 40.000 ĐẾN 60.000Đ/ GIỜ) \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH CHỌN DỊCH VỤ ĐI GH&EACUTE;P \r\nVỚI HÀNH KHÁCH KHÁC. QUÝ KHÁCH PHẢI CÓ MẶT ĐÚNG GIỜ ĐÃ \r\nTHỐNG NHẤT VỚI TÀI XẾ TẠI ĐIỂM ĐÓN QUÝ KHÁCH YÊU CẦU. \r\nTHỜI GIAN CHỜ TỐI ĐA LÀ 15 PHÚT TRONG TRƯỜNG HỢP HÀNH KHÁCH \r\nĐI CHUNG ĐỒNG Ý ĐỢI. \r\n- KHI QUÝ KHÁCH CUNG CẤP ĐẦY ĐỦ THÔNG TIN NHƯ: MÃ HIỆU CHUYẾN \r\nBAY, THỜI GIAN HẠ CÁNH, CẤT CÁNH, SẢNH RA. TÀI XẾ SẼ CHỜ \r\nHOẶC CHÚNG TÔI SẼ XẮP SẾP SẴN XE ĐÓN QUÝ KHÁCH NGAY CẢ \r\nKHI QUÝ KHÁCH BỊ CHẬM CHUYẾN BAY. III. QUY ĐỊNH VỀ THỜI GIAN \r\nQUÝ KHÁCH CHỜ VỚI TỪNG DỊCH VỤ \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH ĐẶT DỊCH VỤ TAXI THÔNG THƯỜNG, \r\nTAXI SẼ ĐẾN ĐÓN ĐÚNG GIỜ VÀ ĐÚNG ĐỊA ĐIỂM QUÝ KHÁCH \r\nYÊU CẦU. \r\n- TRONG TRƯỜNG HỢP QUÝ KHÁCH CHỌN DỊCH VỤ ĐI GHÉP TAXI, \r\nTAXI SẼ ĐẾN ĐÓN TẠI ĐỊA ĐIỂM QUÝ KHÁCH YÊU CẦU TRONG \r\nKHOẢNG  +/-15 PHÚT SO VỚI GIỜ YẾU CẦU ĐÓN. CHÚNG TÔI SẼ \r\nTHÔNG BÁO CHÍNH XÁC THỜI GIAN ĐÓN TRƯỚC 60 PHÚT SO VỚI GIỜ \r\nKHỞI HÀNH. THỜI GIAN ĐI ĐÓN HÀNH KHÁCH KHÁC LÀ TỐI ĐA 30 \r\nPHÚT. IV. QUY ĐỊNH VỀ HỦY ĐẶT XE/ THAY ĐỔI LỊCH TRÌNH: \r\nQUÝ KHÁCH CÓ QUYỀN HỦY ĐẶT XE HOẶC THAY ĐỔI GIỜ ĐI MÀ \r\nKHÔNG MẤT THÊM CHI PHÍ. CHỌN MỘT TRONG CÁC CÁCH SAU ĐỂ THỰC \r\nHIỆN HỦY/ THAY ĐỔI. \r\n- TRUY CẬP HTTP://VIETGOCAR.COM/ [ HTTP://WWW.DICHUNGTAXI.COM/ ] , ĐĂNG \r\nNHẬP BẰNG TÀI KHOẢN, QUẢN LÝ GIAO DỊCH, CHỌN CHUYẾN ĐI \r\nCẦN THAY ĐỔI LỊCH TRÌNH. \r\n- GỌI ĐIỆN TỚI TỔNG ĐÀI 19006022 ĐỂ THÔNG BÁO THAY ĐỔI \r\nHOẶC HỦY CHUYẾN NẾU CẦN V. QUY ĐỊNH KHÁC \r\n- QUÝ KHÁCH KHÔNG MANG THEO NHỮNG HÀNG HÓA CẤM TRONG DANH MỤC \r\nQUY ĐỊNH HÀNG CẤM CỦA NƯỚC CỘNG HOÀ XÃ HỘI CHỦ NGHĨA \r\nVIỆT NAM \r\n- QUÝ KHÁCH KHÔNG ĐƯỢC HÚT THUỐC VÀ ĂN UỐNG GÂY MẤT VỆ \r\nSINH Ở TRÊN XE. \r\n- TRONG ĐIỀU KIỆN BẤT KHẢ KHÁNG(ĐỘNG ĐẤT, BÃO LŨ..), \r\nCHÚNG TÔI ĐƯỢC QUYỀN HỦY HOẶC THAY ĐỔI LỊCH VÀ GIỜ CHẠY \r\nMÀ KHÔNG CHỊU BẤT CỨ TRÁCH NHIỆM NÀO.',1,NULL,NULL,NULL,NULL,NULL,'N','86','van-chuyen-hanh-khach','',NULL,NULL,30,'2017-12-24 11:18:56');
INSERT INTO `b_iblock_element` VALUES (87,'2018-03-31 01:08:33',1,'2017-12-24 11:20:19',1,9,NULL,'Y',NULL,NULL,500,'Bảo vệ quyền riêng tư',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Phạm vi &aacute;p dụng:</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Phần Qui định bảo vệ Quyền ri&ecirc;ng tư n&agrave;y tr&igrave;nh bày về việc ch&uacute;ng t&ocirc;i xử l&yacute; thông tin nhận dạng cá nh&acirc;n mà chúng tôi thu thập được khi bạn ở trong trang web hoặc ứng dụng di động của chúng tôi , và khi bạn sử dụng các dịch vụ của chúng tôi hoặc dịch vụ của các đối tác nhưng c&oacute; liên kết với dịch vụ của chúng tôi.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Quy định này không áp dụng cho những cách thức xử lý thông tin của các công ty mà chúng tôi không sở hữu hoặc kiểm soát, hoặc những người không phải là nhân viên của chúng tôi hay những người không do chúng tôi quản lý.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Cách thức chúng tôi thu thập thông tin:</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi thu thập các thông tin nhận dạng cá nhân khi bạn đăng ký sử dụng hoặc sử dụng một số dịch vụ của chúng tôi. Chúng tôi cũng có thể nhận được các thông tin nhận dạng cá nhân do các đối tác cung cấp khi bạn sử dụng dịch vụ của họ nhưng có sự liên kết phối hợp cung cấp của chúng tôi Chúng tôi cũng tự động nhận được và ghi lại các thông tin trong các tập tin ghi ch&eacute;p trong máy chủ của chúng tôi từ cửa sổ trình duyệt của bạn, trong đó bao gồm địa chỉ IP, thông tin về tập tin cookie.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Dữ liệu chúng tôi thu thập:</h4>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Để vận hành trang web và cung cấp cho bạn thông tin về sản phẩm hoặc dịch vụ có thể được bạn quan tâm, chúng tôi có thể thu thập:</p>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu cá nhân: tức là thông tin có thể được sử dụng để liên lạc với bạn trực tiếp mà không sử dụng trang web bao gồm họ tên, địa chỉ bưu ch&iacute;nh, số điện thoại, thông tin tài khoản ngân hàng/thẻ tín dụng / thẻ ghi nợ, hoặc địa chỉ email.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu Nhân khẩu học: (những thông tin không phải là thông tin cá nhân, bao gồm nhưng không giới hạn ở m&atilde; v&ugrave;ng, quê hương, giới tính, tuổi, ngày tháng năm sinh, lịch sử duyệt web, lịch sử tìm kiếm thông tin.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Dữ liệu vị trí: Dịch vụ của chúng tôi có thể sử dụng các công nghệ hỗ trợ định vị như Google Maps. Nếu bạn sử dụng các dịch vụ này, Google có thể nhận thông tin về vị trí thực của bạn (ví dụ như tín hiệu GPS được gửi qua thiết bị di động) hoặc thông tin có thể được sử dụng để xác định vị trí (như ID điện thoại di động).</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Chúng tôi sử dụng thông tin của bạn cho mục đích gì?</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi sử dụng địa chỉ email của bạn và các thông tin cá nhân của bạn để giúp chúng vận hành một cách có hiệu quả các trang web và dịch vụ, liên lạc với bạn khi bạn thực hiện các giao dịch đặt chỗ, để chuyển tiếp thông tin chuyến đi từ những người dùng trang web khác đến cho bạn;  và các hoạt động khác trên trang web (ví dụ gửi tin tức quan trọng mà có thể bạn quan tâm. Trong một số trường hợp, chúng tôi có thể gửi cho bạn các hoạt động truyền thông chứa nội dung thương mại, chẳng hạn như các banner quảng cáo và cung cấp đặc biệt dạng giảm giá hoặc khuyến mại).</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi có thể sử dụng các thông tin về vị trí để tối ưu hóa các hoạt động được thiết kế cho các thiết bị cầm tay thông minh. Các ứng dụng này sẽ làm cho việc đặt chỗ và theo d&otilde;i xe đến đón cũng như tìm kiếm hành khách một cách thuận lợi và linh hoạt hơn phương thức qua website.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Tiết lộ và chia sẻ thông tin</h4>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250); text-align: justify;\">Chúng tôi chỉ chia sẻ thông tin cá nhân với các công ty hoặc cá nhân khác bên ngoài trong những trường hợp giới hạn sau:</p>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi được bạn đồng ý cho tiết lộ thông tin đó.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi cần tiết lộ thông tin của bạn để cung cấp các sản phẩm hoặc dịch vụ mà bạn yêu cầu.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi cần gửi thông tin đó cho những công ty hoạt động thay mặt cho chúng tôi để cung cấp sản phẩm hoặc dịch vụ cho bạn. (Trừ khi chúng tôi thông báo cho bạn biết nội dung khác, các công ty này không có quyền sử dụng các thông tin nhận dạng cá nhân mà chúng tôi cung cấp cho họ vượt quá phạm vi cần thiết để trợ giúp chúng tôi).</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi tuân theo các trát lệnh, lệnh t&ograve;a án hoặc thủ tục pháp lý.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Cập nhật hoặc xóa thông tin</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Khi bạn sử dụng các dịch vụ của chúng tôi, chúng tôi thật sự cố gắng cung cấp cho bạn quyền truy cập vào thông tin cá nhân của bạn hoặc để chỉnh sửa dữ liệu này nếu chưa chính xác hoặc xoá dữ liệu đó theo yêu cầu của bạn nếu dữ liệu này không được luật pháp yêu cầu giữ lại. Bạn có thể chỉnh sửa hồ sơ của bạn bất cứ lúc nào. Tất cả những gì bạn cần là tên người dùng và mật khẩu của bạn.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Bảo mật thông tin</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Chúng tôi sử dụng các biện pháp bảo mật thích hợp để bảo vệ việc truy cập hoặc sửa đổi, tiết lộ hoặc huỷ dữ liệu một cách trái phép. Các biện pháp này bao gồm xem xét nội bộ các thực tiễn thu thập, lưu trữ và xử lý dữ liệu cũng như các biện pháp bảo mật, bao gồm các biện pháp bảo mật vật lý và mã hoá thích hợp để bảo vệ chống truy cập trái phép vào hệ thống lưu trữ dữ liệu cá nhân của chúng tôi.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Những thay đổi về Quy định bảo vệ Quyền riêng tư này</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Đôi khi chúng tôi có thể sửa đổi qui định này. Nếu có những thay đổi, chúng tôi sẽ thông báo cho bạn bằng cách đăng thông báo ở vị trí dễ nhận thấy trên các trang web của chúng tôi. Bạn đồng ý rằng thông báo được đăng như vậy sẽ được coi như là bản thông báo đầy đủ và thỏa đáng cho bạn về những thay đổi nói trên.Bạn đồng ý rằng nếu bạn tiếp tục sử dụng các dịch vụ và sản phẩm của chúng tôi sau khi có sự sửa đổi đó, điều đó có nghĩa là bạn chấp nhận và đồng ý tuân theo qui định được sửa đổi.</li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">Các thắc mắc hoặc gợi ý</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào cho chúng tôi về Quyền riêng tư, bạn có thể liên lạc với chúng tôi tại <a href=\"mailto:contact@apka.vn\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >contact@apka.vn</a>.</li>\r\n   </ul>\r\n </div>\r\n ','html','BẢO VỆ QUYỀN RIÊNG TƯ\r\n\r\nPHẠM VI &AACUTE;P DỤNG: \r\n\r\n- PHẦN QUI ĐỊNH BẢO VỆ QUYỀN RI&ECIRC;NG TƯ N&AGRAVE;Y TR&IGRAVE;NH \r\nBÀY VỀ VIỆC CH&UACUTE;NG T&OCIRC;I XỬ L&YACUTE; THÔNG TIN NHẬN \r\nDẠNG CÁ NH&ACIRC;N MÀ CHÚNG TÔI THU THẬP ĐƯỢC KHI BẠN Ở \r\nTRONG TRANG WEB HOẶC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI , VÀ \r\nKHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HOẶC DỊCH VỤ \r\nCỦA CÁC ĐỐI TÁC NHƯNG C&OACUTE; LIÊN KẾT VỚI DỊCH VỤ CỦA \r\nCHÚNG TÔI. \r\n- QUY ĐỊNH NÀY KHÔNG ÁP DỤNG CHO NHỮNG CÁCH THỨC XỬ LÝ \r\nTHÔNG TIN CỦA CÁC CÔNG TY MÀ CHÚNG TÔI KHÔNG SỞ HỮU HOẶC \r\nKIỂM SOÁT, HOẶC NHỮNG NGƯỜI KHÔNG PHẢI LÀ NHÂN VIÊN CỦA \r\nCHÚNG TÔI HAY NHỮNG NGƯỜI KHÔNG DO CHÚNG TÔI QUẢN LÝ. CÁCH \r\nTHỨC CHÚNG TÔI THU THẬP THÔNG TIN: \r\n\r\n- CHÚNG TÔI THU THẬP CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN KHI BẠN \r\nĐĂNG KÝ SỬ DỤNG HOẶC SỬ DỤNG MỘT SỐ DỊCH VỤ CỦA CHÚNG \r\nTÔI. CHÚNG TÔI CŨNG CÓ THỂ NHẬN ĐƯỢC CÁC THÔNG TIN NHẬN \r\nDẠNG CÁ NHÂN DO CÁC ĐỐI TÁC CUNG CẤP KHI BẠN SỬ DỤNG DỊCH \r\nVỤ CỦA HỌ NHƯNG CÓ SỰ LIÊN KẾT PHỐI HỢP CUNG CẤP CỦA \r\nCHÚNG TÔI CHÚNG TÔI CŨNG TỰ ĐỘNG NHẬN ĐƯỢC VÀ GHI LẠI \r\nCÁC THÔNG TIN TRONG CÁC TẬP TIN GHI CH&EACUTE;P TRONG MÁY CHỦ CỦA \r\nCHÚNG TÔI TỪ CỬA SỔ TRÌNH DUYỆT CỦA BẠN, TRONG ĐÓ BAO GỒM \r\nĐỊA CHỈ IP, THÔNG TIN VỀ TẬP TIN COOKIE. DỮ LIỆU CHÚNG TÔI \r\nTHU THẬP: \r\n\r\nĐỂ VẬN HÀNH TRANG WEB VÀ CUNG CẤP CHO BẠN THÔNG TIN VỀ SẢN \r\nPHẨM HOẶC DỊCH VỤ CÓ THỂ ĐƯỢC BẠN QUAN TÂM, CHÚNG TÔI \r\nCÓ THỂ THU THẬP: \r\n\r\n- DỮ LIỆU CÁ NHÂN: TỨC LÀ THÔNG TIN CÓ THỂ ĐƯỢC SỬ \r\nDỤNG ĐỂ LIÊN LẠC VỚI BẠN TRỰC TIẾP MÀ KHÔNG SỬ DỤNG \r\nTRANG WEB BAO GỒM HỌ TÊN, ĐỊA CHỈ BƯU CH&IACUTE;NH, SỐ ĐIỆN \r\nTHOẠI, THÔNG TIN TÀI KHOẢN NGÂN HÀNG/THẺ TÍN DỤNG / THẺ GHI \r\nNỢ, HOẶC ĐỊA CHỈ EMAIL. \r\n- DỮ LIỆU NHÂN KHẨU HỌC: (NHỮNG THÔNG TIN KHÔNG PHẢI LÀ \r\nTHÔNG TIN CÁ NHÂN, BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở M&ATILDE; \r\nV&UGRAVE;NG, QUÊ HƯƠNG, GIỚI TÍNH, TUỔI, NGÀY THÁNG NĂM SINH, \r\nLỊCH SỬ DUYỆT WEB, LỊCH SỬ TÌM KIẾM THÔNG TIN. \r\n- DỮ LIỆU VỊ TRÍ: DỊCH VỤ CỦA CHÚNG TÔI CÓ THỂ SỬ \r\nDỤNG CÁC CÔNG NGHỆ HỖ TRỢ ĐỊNH VỊ NHƯ GOOGLE MAPS. NẾU \r\nBẠN SỬ DỤNG CÁC DỊCH VỤ NÀY, GOOGLE CÓ THỂ NHẬN THÔNG \r\nTIN VỀ VỊ TRÍ THỰC CỦA BẠN (VÍ DỤ NHƯ TÍN HIỆU GPS ĐƯỢC \r\nGỬI QUA THIẾT BỊ DI ĐỘNG) HOẶC THÔNG TIN CÓ THỂ ĐƯỢC \r\nSỬ DỤNG ĐỂ XÁC ĐỊNH VỊ TRÍ (NHƯ ID ĐIỆN THOẠI DI ĐỘNG). \r\nCHÚNG TÔI SỬ DỤNG THÔNG TIN CỦA BẠN CHO MỤC ĐÍCH GÌ? \r\n\r\n- CHÚNG TÔI SỬ DỤNG ĐỊA CHỈ EMAIL CỦA BẠN VÀ CÁC THÔNG \r\nTIN CÁ NHÂN CỦA BẠN ĐỂ GIÚP CHÚNG VẬN HÀNH MỘT CÁCH CÓ \r\nHIỆU QUẢ CÁC TRANG WEB VÀ DỊCH VỤ, LIÊN LẠC VỚI BẠN KHI \r\nBẠN THỰC HIỆN CÁC GIAO DỊCH ĐẶT CHỖ, ĐỂ CHUYỂN TIẾP \r\nTHÔNG TIN CHUYẾN ĐI TỪ NHỮNG NGƯỜI DÙNG TRANG WEB KHÁC ĐẾN \r\nCHO BẠN;  VÀ CÁC HOẠT ĐỘNG KHÁC TRÊN TRANG WEB (VÍ DỤ GỬI \r\nTIN TỨC QUAN TRỌNG MÀ CÓ THỂ BẠN QUAN TÂM. TRONG MỘT SỐ TRƯỜNG \r\nHỢP, CHÚNG TÔI CÓ THỂ GỬI CHO BẠN CÁC HOẠT ĐỘNG TRUYỀN \r\nTHÔNG CHỨA NỘI DUNG THƯƠNG MẠI, CHẲNG HẠN NHƯ CÁC BANNER \r\nQUẢNG CÁO VÀ CUNG CẤP ĐẶC BIỆT DẠNG GIẢM GIÁ HOẶC KHUYẾN \r\nMẠI). \r\n- CHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC THÔNG TIN VỀ VỊ TRÍ ĐỂ \r\nTỐI ƯU HÓA CÁC HOẠT ĐỘNG ĐƯỢC THIẾT KẾ CHO CÁC THIẾT \r\nBỊ CẦM TAY THÔNG MINH. CÁC ỨNG DỤNG NÀY SẼ LÀM CHO VIỆC \r\nĐẶT CHỖ VÀ THEO D&OTILDE;I XE ĐẾN ĐÓN CŨNG NHƯ TÌM KIẾM \r\nHÀNH KHÁCH MỘT CÁCH THUẬN LỢI VÀ LINH HOẠT HƠN PHƯƠNG THỨC \r\nQUA WEBSITE. TIẾT LỘ VÀ CHIA SẺ THÔNG TIN \r\n\r\nCHÚNG TÔI CHỈ CHIA SẺ THÔNG TIN CÁ NHÂN VỚI CÁC CÔNG TY HOẶC \r\nCÁ NHÂN KHÁC BÊN NGOÀI TRONG NHỮNG TRƯỜNG HỢP GIỚI HẠN SAU: \r\n\r\n- CHÚNG TÔI ĐƯỢC BẠN ĐỒNG Ý CHO TIẾT LỘ THÔNG TIN ĐÓ. \r\n- CHÚNG TÔI CẦN TIẾT LỘ THÔNG TIN CỦA BẠN ĐỂ CUNG CẤP \r\nCÁC SẢN PHẨM HOẶC DỊCH VỤ MÀ BẠN YÊU CẦU. \r\n- CHÚNG TÔI CẦN GỬI THÔNG TIN ĐÓ CHO NHỮNG CÔNG TY HOẠT ĐỘNG \r\nTHAY MẶT CHO CHÚNG TÔI ĐỂ CUNG CẤP SẢN PHẨM HOẶC DỊCH VỤ \r\nCHO BẠN. (TRỪ KHI CHÚNG TÔI THÔNG BÁO CHO BẠN BIẾT NỘI DUNG \r\nKHÁC, CÁC CÔNG TY NÀY KHÔNG CÓ QUYỀN SỬ DỤNG CÁC THÔNG TIN \r\nNHẬN DẠNG CÁ NHÂN MÀ CHÚNG TÔI CUNG CẤP CHO HỌ VƯỢT QUÁ \r\nPHẠM VI CẦN THIẾT ĐỂ TRỢ GIÚP CHÚNG TÔI). \r\n- CHÚNG TÔI TUÂN THEO CÁC TRÁT LỆNH, LỆNH T&OGRAVE;A ÁN HOẶC \r\nTHỦ TỤC PHÁP LÝ. CẬP NHẬT HOẶC XÓA THÔNG TIN \r\n\r\n- KHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI, CHÚNG TÔI \r\nTHẬT SỰ CỐ GẮNG CUNG CẤP CHO BẠN QUYỀN TRUY CẬP VÀO THÔNG \r\nTIN CÁ NHÂN CỦA BẠN HOẶC ĐỂ CHỈNH SỬA DỮ LIỆU NÀY NẾU \r\nCHƯA CHÍNH XÁC HOẶC XOÁ DỮ LIỆU ĐÓ THEO YÊU CẦU CỦA BẠN \r\nNẾU DỮ LIỆU NÀY KHÔNG ĐƯỢC LUẬT PHÁP YÊU CẦU GIỮ LẠI. \r\nBẠN CÓ THỂ CHỈNH SỬA HỒ SƠ CỦA BẠN BẤT CỨ LÚC NÀO. \r\nTẤT CẢ NHỮNG GÌ BẠN CẦN LÀ TÊN NGƯỜI DÙNG VÀ MẬT KHẨU \r\nCỦA BẠN. BẢO MẬT THÔNG TIN \r\n\r\n- CHÚNG TÔI SỬ DỤNG CÁC BIỆN PHÁP BẢO MẬT THÍCH HỢP ĐỂ \r\nBẢO VỆ VIỆC TRUY CẬP HOẶC SỬA ĐỔI, TIẾT LỘ HOẶC HUỶ \r\nDỮ LIỆU MỘT CÁCH TRÁI PHÉP. CÁC BIỆN PHÁP NÀY BAO GỒM XEM \r\nXÉT NỘI BỘ CÁC THỰC TIỄN THU THẬP, LƯU TRỮ VÀ XỬ LÝ DỮ \r\nLIỆU CŨNG NHƯ CÁC BIỆN PHÁP BẢO MẬT, BAO GỒM CÁC BIỆN PHÁP \r\nBẢO MẬT VẬT LÝ VÀ MÃ HOÁ THÍCH HỢP ĐỂ BẢO VỆ CHỐNG \r\nTRUY CẬP TRÁI PHÉP VÀO HỆ THỐNG LƯU TRỮ DỮ LIỆU CÁ NHÂN \r\nCỦA CHÚNG TÔI. NHỮNG THAY ĐỔI VỀ QUY ĐỊNH BẢO VỆ QUYỀN \r\nRIÊNG TƯ NÀY \r\n\r\n- ĐÔI KHI CHÚNG TÔI CÓ THỂ SỬA ĐỔI QUI ĐỊNH NÀY. NẾU \r\nCÓ NHỮNG THAY ĐỔI, CHÚNG TÔI SẼ THÔNG BÁO CHO BẠN BẰNG CÁCH \r\nĐĂNG THÔNG BÁO Ở VỊ TRÍ DỄ NHẬN THẤY TRÊN CÁC TRANG WEB \r\nCỦA CHÚNG TÔI. BẠN ĐỒNG Ý RẰNG THÔNG BÁO ĐƯỢC ĐĂNG NHƯ \r\nVẬY SẼ ĐƯỢC COI NHƯ LÀ BẢN THÔNG BÁO ĐẦY ĐỦ VÀ THỎA \r\nĐÁNG CHO BẠN VỀ NHỮNG THAY ĐỔI NÓI TRÊN.BẠN ĐỒNG Ý RẰNG \r\nNẾU BẠN TIẾP TỤC SỬ DỤNG CÁC DỊCH VỤ VÀ SẢN PHẨM CỦA \r\nCHÚNG TÔI SAU KHI CÓ SỰ SỬA ĐỔI ĐÓ, ĐIỀU ĐÓ CÓ NGHĨA \r\nLÀ BẠN CHẤP NHẬN VÀ ĐỒNG Ý TUÂN THEO QUI ĐỊNH ĐƯỢC SỬA \r\nĐỔI. CÁC THẮC MẮC HOẶC GỢI Ý \r\n\r\n- NẾU BẠN CÓ BẤT KỲ CÂU HỎI HOẶC GÓP Ý NÀO CHO CHÚNG \r\nTÔI VỀ QUYỀN RIÊNG TƯ, BẠN CÓ THỂ LIÊN LẠC VỚI CHÚNG TÔI \r\nTẠI CONTACT@APKA.VN [ MAILTO:CONTACT@APKA.VN ] .',1,NULL,NULL,NULL,NULL,NULL,'N','87','bao-ve-quyen-rieng-tu','',NULL,NULL,58,'2017-12-24 11:20:21');
INSERT INTO `b_iblock_element` VALUES (88,'2018-04-13 17:11:00',8,'2017-12-24 11:42:17',1,9,NULL,'Y',NULL,NULL,500,'Sử dụng dịch vụ',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">1. CHẤP NHẬN C&Aacute;C ĐIỀU KHOẢN</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Thỏa thuận sau đ&acirc;y l&agrave; một thỏa thuận ràng buộc ph&aacute;p l&yacute; giữa Bạn và <a id=\"bxid_282727\" href=\"http://apka.vn/\" style=\"font-style: normal; box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://apka.vn</a>(&quot;Ch&uacute;ng t&ocirc;i&rdquo;). Thỏa thuận bao gồm các điều khoản dịch vụ mà bạn phải tuân thủ để được quyền tiếp cận và sử dụng dịch vụ  tr&ecirc;n trang Web  và các ứng dụng di động của chúng tôi.  Tại từng thời điểm, chúng tôi c&oacute; thể cập nhật Điều khoản dịch vụ theo quyết định của m&igrave;nh mà không cần thông báo trực tiếp cho bạn. Bạn chịu trách nhiệm tìm hiểu phiên bản mới nhất bằng cách truy cập website http://apka.vn/.</em></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">XIN VUI L&Ograve;NG ĐỌC ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K&Yacute; LÀM THÀNH VI&Ecirc;N. NẾU BẠN KH&Ocirc;NG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CH&Uacute;NG TÔI.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Bạn sẽ nhận được một mật khẩu và tài khoản sau khi hoàn tất thủ tục đăng ký làm thành viên. Bạn có trách nhiệm bảo mật mật khẩu và tài khoản, và hoàn toàn chịu trách nhiệm đối với tất cả các hoạt động diễn ra dưới việc sử dụng mật khẩu hoặc tài khoản của mình. Bạn đồng ý (a) thông báo ngay cho chúng tôi về bất cứ trường hợp nào sử dụng trái ph&eacute;p mật khẩu hoặc tài khoản của bạn hoặc bất cứ trường hợp nào khác vi phạm sự bảo mật, và (b) bảo đảm rằng Bạn luôn thoát khỏi tài khoản của mình sau mỗi lần sử dụng. Chúng tôi không thể và sẽ không chịu trách nhiệm đối với bất cứ tổn thất hoặc thiệt hại nào phát sinh do Bạn không tuân thủ quy định này.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">V<em style=\"box-sizing: border-box;\">ới tư cách là người sử dụng dịch vụ, Bạn phải cam kết:</em> \r\n      <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"> \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(a) bạn có đủ tư cách pháp lý và tư cách hành vi khi sử dụng dịch vụ</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(b) cung cấp các thông tin đầy đủ, trung thực và ch&iacute;nh xác về bản thân trong Hồ sơ cá nhân</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box;\"><em style=\"box-sizing: border-box;\">(c) duy trì và cập nhật kịp thời Hồ sơ cá nhân để bảo đảm rằng dữ liệu này là đầy đủ, trung thực và chính xác.</em></li>\r\n       </ul>\r\n     </li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Nếu Bạn cung cấp bất cứ thông tin nào không phải là không trung thực hoặc không chính xác, hoặc nếu chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin đó không trung thực hoặc không chính xác, chúng tôi có quyền đình chỉ hoặc chấm dứt tài khoản của Bạn; từ chối một phần hoặc toàn bộ việc sử dụng Dịch vụ tại thời điểm hiện tại hoặc trong tương lai.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Bạn hiểu rằng bạn hoàn toàn chịu trách nhiệm trước pháp luật về các Nội dung bạn tạo ra bao gồm nhưng không giới hạn ở dữ liệu, văn bản, phần mềm, âm thanh, hình ảnh, video, email. Chúng tôi không có nghĩa vụ theo d&otilde;i các tài liệu được đăng và vì vậy, không bảo đảm về tính hợp pháp, chính xác, nguyên vẹn hoặc chất lượng của Nội Dung đó. Tại các khu vực được phép đăng tải Nội dung, bạn có thể chia sẻ thông tin được phép dưới các định dạng chúng tôi mặc định và bạn phải tự chịu trách nhiệm đối với các nội dung, thông tin, hình ảnh và bất kỳ sự chia sẻ nào khác của bạn với cá nhân người sử dụng hoặc nhóm người sử dụng. Tuy nhiên, trong mọi trường hợp, chúng tôi vẫn được bảo lưu quyền xử lý các thông tin đăng tải cho ph&ugrave; hợp với thuần phong mỹ tục, các quy tắc đạo đức và các quy tắc đảm bảo an ninh quốc gia, và chúng tôi có toàn quyền cho phép hoặc không cho phép bài viết của bạn xuất hiện hay tồn tại tại các khu vực được phép chia sẻ thông tin.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">5. HẠN CHẾ HOẠT ĐỘNG</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Không giới hạn các biện pháp khắc phục hậu quả khác, chúng tôi có thể chấm dứt sự tham gia của bạn, loại bỏ thông tin của bạn  và từ chối cung cấp dịch vụ nếu:</em> \r\n      <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"> \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(a). Bạn đ&atilde; sử dụng sai mục đích các các dịch vụ, có hành vi trái pháp luật hoặc đạo đức.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(b). chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin bạn cung cấp không trung thực hoặc không chính xác.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(c). chúng tôi tin rằng hành động của bạn là gian lận, lừa đảo và có thể gây ra tổn thất tài chính hoặc trách nhiệm pháp lý cho  chúng tôi.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(d). sử dụng các dịch vụ với mục đích thương mại mà không có sự đồng ý trước bằng văn bản đồng ý của chúng tôi.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(e). vi phạm các quyền của chúng tôi hoặc bên thứ ba, bao gồm nhưng không giới hạn quyền sở hữu trí tuệ, quyền tác giả, bằng sáng chế, thương hiệu, bí mật thương mại hoặc các quyền riêng tư.</em></li>\r\n       \r\n        <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">(f). phát tán các ứng dụng độc hại hoặc tấn công chiếm đoạt quyền điều khiển hệ thống, dữ liệu hoặc thông tin cá nhân.</em></li>\r\n       </ul>\r\n     </li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">6. BẢO MẬT</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Chúng tôi không bán hoặc cho thuê thông tin của bạn cho bên thứ ba mà không có sự cho phép của bạn và chúng tôi chỉ sử dụng thông tin của bạn như được mô tả trong <a href=\"/thong-tin/bao-ve-quyen-rieng-tu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Điều khoản riêng tư</a></em></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Chúng tôi xem bảo vệ sự riêng tư của người sử dụng như một nguyên tắc quan trọng hàng đầu. Bạn có thể xem xét lại chính sách bảo mật hiện tại của chúng tôi tại <a href=\"/thong-tin/bao-ve-quyen-rieng-tu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Điều khoản riêng tư</a></em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">7. SỞ HỮU TR&Iacute; TUỆ</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Trừ phi được sự đồng ý của chúng tôi, bạn không được phép tải lên, gửi, xuất bản, sửa đổi, tái sản xuất, truyền hoặc phân phát bằng bất cứ hình thức nào bất cứ thành phần nào của Dịch vụ mà chúng tôi cung cấp. Chúng tôi có toàn quyền, bao gồm nhưng không chỉ giới hạn trong các quyền tác giả, thương hiệu, và các quyền sở hữu khác mà chúng tôi có trong các Dịch vụ này .Tất cả các yếu tố cấu thành lên Dịch vụ mà chúng tôi cung cấp đều thuộc phạm vị sở hữu của chúng tôi cho dù đã đăng ký hoặc chưa đăng ký. Việc sử dụng quyền và sở hữu của chúng tôi cần phải được chúng tôi cho phép trước bằng văn bản. Ngoài việc cấp phép bằng văn bản, chúng tôi không cấp phép dưới bất kỳ hình thức nào khác cho dù đó là hình thức công bố hay hàm ý, hoặc thông qua việc để bạn sử dụng dịch vụ. Và do vậy, bạn không có quyền sử dụng Dịch vụ của chúng tôi vào mục đích thương mại mà không có sự cho phép bằng văn bản của chúng tôi trước đó.</em></li>\r\n   </ul>\r\n </div>\r\n \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\"><em style=\"box-sizing: border-box;\">Thông qua việc đăng ký hoặc sử dụng website và dịch vụ của chúng tôi, bạn mặc nhiên đồng ý và tuân thủ toàn bộ các quy định của Luật pháp Việt Nam . Trong trường hợp một hoặc một số điều khoản của bản Quy định sử dụng này xung đột với các quy định của luật pháp và bị T&ograve;a án coi là vô hiệu, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định của pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.</em></li>\r\n   </ul>\r\n </div>\r\n ','html','SỬ DỤNG DỊCH VỤ\r\n\r\n1. CHẤP NHẬN C&AACUTE;C ĐIỀU KHOẢN \r\n\r\n- THỎA THUẬN SAU Đ&ACIRC;Y L&AGRAVE; MỘT THỎA THUẬN RÀNG BUỘC \r\nPH&AACUTE;P L&YACUTE; GIỮA BẠN VÀ ĐIỀU KHOẢN RIÊNG TƯ [ /THONG-TIN/BAO-VE-QUYEN-RIENG-TU.HTML ]\r\n \r\n- CHÚNG TÔI XEM BẢO VỆ SỰ RIÊNG TƯ CỦA NGƯỜI SỬ DỤNG \r\nNHƯ MỘT NGUYÊN TẮC QUAN TRỌNG HÀNG ĐẦU. BẠN CÓ THỂ XEM \r\nXÉT LẠI CHÍNH SÁCH BẢO MẬT HIỆN TẠI CỦA CHÚNG TÔI TẠI ĐIỀU \r\nKHOẢN RIÊNG TƯ [ /THONG-TIN/BAO-VE-QUYEN-RIENG-TU.HTML ] 7. SỞ HỮU \r\nTR&IACUTE; TUỆ \r\n\r\n- TRỪ PHI ĐƯỢC SỰ ĐỒNG Ý CỦA CHÚNG TÔI, BẠN KHÔNG ĐƯỢC \r\nPHÉP TẢI LÊN, GỬI, XUẤT BẢN, SỬA ĐỔI, TÁI SẢN XUẤT, \r\nTRUYỀN HOẶC PHÂN PHÁT BẰNG BẤT CỨ HÌNH THỨC NÀO BẤT CỨ \r\nTHÀNH PHẦN NÀO CỦA DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP. CHÚNG \r\nTÔI CÓ TOÀN QUYỀN, BAO GỒM NHƯNG KHÔNG CHỈ GIỚI HẠN TRONG \r\nCÁC QUYỀN TÁC GIẢ, THƯƠNG HIỆU, VÀ CÁC QUYỀN SỞ HỮU KHÁC \r\nMÀ CHÚNG TÔI CÓ TRONG CÁC DỊCH VỤ NÀY .TẤT CẢ CÁC YẾU TỐ \r\nCẤU THÀNH LÊN DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP ĐỀU THUỘC \r\nPHẠM VỊ SỞ HỮU CỦA CHÚNG TÔI CHO DÙ ĐÃ ĐĂNG KÝ HOẶC \r\nCHƯA ĐĂNG KÝ. VIỆC SỬ DỤNG QUYỀN VÀ SỞ HỮU CỦA CHÚNG \r\nTÔI CẦN PHẢI ĐƯỢC CHÚNG TÔI CHO PHÉP TRƯỚC BẰNG VĂN BẢN. \r\nNGOÀI VIỆC CẤP PHÉP BẰNG VĂN BẢN, CHÚNG TÔI KHÔNG CẤP PHÉP \r\nDƯỚI BẤT KỲ HÌNH THỨC NÀO KHÁC CHO DÙ ĐÓ LÀ HÌNH THỨC \r\nCÔNG BỐ HAY HÀM Ý, HOẶC THÔNG QUA VIỆC ĐỂ BẠN SỬ DỤNG \r\nDỊCH VỤ. VÀ DO VẬY, BẠN KHÔNG CÓ QUYỀN SỬ DỤNG DỊCH VỤ \r\nCỦA CHÚNG TÔI VÀO MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ CHO \r\nPHÉP BẰNG VĂN BẢN CỦA CHÚNG TÔI TRƯỚC ĐÓ. 8. KHIẾU NẠI \r\nVÀ GIẢI QUYẾT TRANH CHẤP \r\n\r\n- THÔNG QUA VIỆC ĐĂNG KÝ HOẶC SỬ DỤNG WEBSITE VÀ DỊCH VỤ \r\nCỦA CHÚNG TÔI, BẠN MẶC NHIÊN ĐỒNG Ý VÀ TUÂN THỦ TOÀN BỘ \r\nCÁC QUY ĐỊNH CỦA LUẬT PHÁP VIỆT NAM . TRONG TRƯỜNG HỢP MỘT \r\nHOẶC MỘT SỐ ĐIỀU KHOẢN CỦA BẢN QUY ĐỊNH SỬ DỤNG NÀY \r\nXUNG ĐỘT VỚI CÁC QUY ĐỊNH CỦA LUẬT PHÁP VÀ BỊ T&OGRAVE;A \r\nÁN COI LÀ VÔ HIỆU, ĐIỀU KHOẢN ĐÓ SẼ ĐƯỢC CHỈNH SỬA \r\nCHO PHÙ HỢP VỚI QUY ĐỊNH CỦA PHÁP LUẬT HIỆN HÀNH, VÀ PHẦN \r\nCÒN LẠI CỦA QUY ĐỊNH SỬ DỤNG VẪN GIỮ NGUYÊN GIÁ TRỊ.',1,NULL,NULL,NULL,NULL,NULL,'N','88','su-dung-dich-vu','',NULL,NULL,55,'2017-12-24 11:42:19');
INSERT INTO `b_iblock_element` VALUES (314,'2018-05-08 15:01:43',1,'2018-05-08 15:01:43',1,7,NULL,'Y',NULL,NULL,500,'NOWRBKV6',NULL,NULL,'text',NULL,NULL,'text','NOWRBKV6\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','314',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (315,'2018-05-08 15:01:43',1,'2018-05-08 15:01:43',1,6,NULL,'Y',NULL,NULL,500,'NOWRBKV6',NULL,NULL,'text',NULL,NULL,'text','NOWRBKV6\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','315',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (187,'2018-04-27 15:51:03',1,'2018-04-27 15:51:03',1,7,NULL,'Y',NULL,NULL,500,'83WUP9VN',NULL,NULL,'text',NULL,NULL,'text','83WUP9VN\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','187',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (188,'2018-04-27 15:51:03',1,'2018-04-27 15:51:03',1,6,NULL,'Y',NULL,NULL,500,'83WUP9VN',NULL,NULL,'text',NULL,NULL,'text','83WUP9VN\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','188',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (189,'2018-04-27 15:51:03',1,'2018-04-27 15:51:03',1,5,NULL,'Y',NULL,NULL,500,'83WUP9VN',NULL,NULL,'text',NULL,NULL,'text','83WUP9VN\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','189',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (190,'2018-04-27 15:55:29',1,'2018-04-27 15:55:29',1,7,NULL,'Y',NULL,NULL,500,'SRTDER0W',NULL,NULL,'text',NULL,NULL,'text','SRTDER0W\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','190',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (191,'2018-04-27 15:55:29',1,'2018-04-27 15:55:29',1,6,NULL,'Y',NULL,NULL,500,'SRTDER0W',NULL,NULL,'text',NULL,NULL,'text','SRTDER0W\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','191',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (192,'2018-04-27 15:55:29',1,'2018-04-27 15:55:29',1,5,NULL,'Y',NULL,NULL,500,'SRTDER0W',NULL,NULL,'text',NULL,NULL,'text','SRTDER0W\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','192',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (193,'2018-04-27 16:01:07',0,'2018-04-27 16:01:07',0,7,NULL,'Y',NULL,NULL,500,'UHRY89AC',NULL,NULL,'text',NULL,NULL,'text','UHRY89AC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','193',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (194,'2018-04-27 16:01:07',0,'2018-04-27 16:01:07',0,6,NULL,'Y',NULL,NULL,500,'UHRY89AC',NULL,NULL,'text',NULL,NULL,'text','UHRY89AC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','194',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (195,'2018-04-27 16:01:07',0,'2018-04-27 16:01:07',0,5,NULL,'Y',NULL,NULL,500,'UHRY89AC',NULL,NULL,'text',NULL,NULL,'text','UHRY89AC\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','195',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (154,'2018-04-25 16:57:23',1,'2018-04-25 14:52:19',1,11,NULL,'Y',NULL,NULL,500,'Phòng vé Hà Đông',NULL,'à đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với','text',NULL,'','text','PHÒNG VÉ HÀ ĐÔNG\r\nÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','154','','',NULL,NULL,13,'2018-04-25 16:50:25');
INSERT INTO `b_iblock_element` VALUES (155,'2018-04-25 15:41:21',1,'2018-04-25 15:12:45',1,11,NULL,'Y',NULL,NULL,500,'Phòng vé Thanh Khê',NULL,'à đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với Là đối tác của aaa đã thành lập năm 2019. với','text',NULL,'','text','PHÒNG VÉ THANH KHÊ\r\nÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI LÀ ĐỐI TÁC CỦA AAA ĐÃ THÀNH LẬP NĂM 2019. VỚI\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','155','','',NULL,NULL,4,'2018-04-25 16:42:12');
INSERT INTO `b_iblock_element` VALUES (316,'2018-05-08 15:01:43',1,'2018-05-08 15:01:43',1,5,NULL,'Y',NULL,NULL,500,'NOWRBKV6',NULL,NULL,'text',NULL,NULL,'text','NOWRBKV6\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','316',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (196,'2018-04-27 16:03:57',0,'2018-04-27 16:03:57',0,7,NULL,'Y',NULL,NULL,500,'4GDFO5C5',NULL,NULL,'text',NULL,NULL,'text','4GDFO5C5\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','196',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (159,'2018-04-25 23:04:11',1,'2018-04-25 23:04:11',1,12,NULL,'Y',NULL,NULL,500,'Giảm giá 30% toàn bộ dịch vụ',NULL,'Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo','text',NULL,'','text','GIẢM GIÁ 30% TOÀN BỘ DỊCH VỤ\r\nETSY DOOSTANG ZOODLES DISQUS GROUPON GREPLIN OOOJ VOXY ZOODLES, WEEBLY NING HEEKYA HANDANGO IMEEM PLUGG DOPPLR JIBJAB, MOVITY JAJAH PLICKERS SIFTEO EDMODO IFTTT ZIMBRA. BABBLELY ODEO KABOODLE QUORA PLAXO IDEELI HULU WEEBLY BALIHOO\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','159','','',NULL,NULL,5,'2018-04-25 23:41:19');
INSERT INTO `b_iblock_element` VALUES (160,'2018-04-25 23:50:08',1,'2018-04-25 23:04:34',1,12,NULL,'Y',NULL,NULL,500,'Truy cập Apka nhận quà khủng',NULL,'Etsy doostang zoodles disqus groupon ','text',NULL,'\r\n<div>Chi tiết</div>\r\n ','html','TRUY CẬP APKA NHẬN QUÀ KHỦNG\r\nETSY DOOSTANG ZOODLES DISQUS GROUPON \r\nCHI TIẾT',1,NULL,NULL,NULL,NULL,NULL,'N','160','','',NULL,NULL,4,'2018-04-25 23:38:13');
INSERT INTO `b_iblock_element` VALUES (89,'2018-04-13 16:54:26',8,'2017-12-24 11:47:27',1,9,NULL,'Y',NULL,NULL,500,'Giải quyết sự cố và khiếu nại',NULL,'','text',NULL,' \r\n<h4 style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-weight: 500; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 10px; margin-bottom: 10px; font-size: 18px; background-color: rgb(250, 250, 250); text-align: justify;\">1. Sự cố ph&aacute;t sinh trong quá tr&igrave;nh đặt chỗ, hủy chỗ</h4>\r\n \r\n<div style=\"box-sizing: border-box; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(250, 250, 250);\"> \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\"> Trong quá trình đặt chỗ tr&ecirc;n website <a href=\"http://apka.vn\" >http://apka.vn</a>, nếu c&oacute; bất kì sự cố n&agrave;o trong quá trình đặt chỗ bao gồm nhưng kh&ocirc;ng giới hạn ở :</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Điền và xác nhận thông tin về xe/chỗ cần đặt</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Quá trình thanh toán</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Hủy chỗ và hoàn tiền</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Phát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến khách hàng không hoàn tất giao dịch đặt chỗ</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\">Khách hàng h&atilde;y sử dụng một trong những hình thức  hỗ trợ sau:</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Chat với bộ phận hỗ trợ khách hàng trực tuyến </li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gửi mail về contact@apka.vn</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện về Tổng đài 0981.370.360</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <h4 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.4; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; text-align: justify;\">2. Sự cố phát sinh khi sử dụng dịch vụ</h4>\r\n \r\n  <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Nếu có trục trặc xảy ra trong việc xác nhận v&eacute; điện tử giữa khách hàng và tài xế, Cơ sở để giải quyết tranh chấp dựa trên các thông tin, chứng từ (mã vé điện tử hoặc thông tin cá nh&acirc;n) do khách hàng cung cấp và đối chiếu, so sánh với thông tin khách hàng cung cấp khi đặt chỗ đã được được lưu trữ trên hệ thống cơ sở dữ liệu của <a id=\"bxid_282727\" href=\"http://apka.vn/\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\">http://apka.vn</a></li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp xảy ra khiếu nại liên quan đến thời gian phục vụ. Cơ sở để giải quyết tranh chấp là thông tin khách hàng đã cung cấp về thời gian đón đã ghi nhận trên hệ thống và thời gian chờ được qui định chi tiết trong <a href=\"/thong-tin/van-chuyen-hanh-khach.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Ch&iacute;nh sách vận chuyển</a> của ch&uacute;ng tôi. Nếu tài xế  vi phạm về thời gian đã qui định, khách hàng có quyền khiếu nại đ&ograve;i bồi thường.</li>\r\n   \r\n    <li style=\"box-sizing: border-box; text-align: justify;\">Trong trường hợp xảy ra những khiếu nại liên quan đến thái độ và chất lượng phục vụ của tài xế cũng như chất lượng phương tiện. Cơ sở để giải quyết tranh chấp là những nội dung Quí khách trao đổi trực tiếp với tổng đài ( đã được ghi âm)  hoặc các tài liệu chứng minh như ảnh chụp, file âm thanh, lời khai của bên thứ ba.. do Quí khách cung cấp.</li>\r\n   </ul>\r\n \r\n  <div style=\"box-sizing: border-box; text-align: justify;\">Tất cả các sự cố phát sinh khi sử dụng dịch vụ, Quí khách vui lòng liên hệ để được hỗ trợ bằng một trong các cách sau:</div>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Phản ánh trực tiếp với hãng vận chuyển trực tiếp phục vụ</li>\r\n     </ul>\r\n   </div>\r\n \r\n  <h4 style=\"box-sizing: border-box; font-weight: 500; line-height: 1.4; color: inherit; margin-top: 10px; margin-bottom: 10px; font-size: 18px; text-align: justify;\">3. Sự cố phát sinh khác</h4>\r\n \r\n  <div style=\"box-sizing: border-box; text-align: justify;\">Khi có bất kỳ sự cố nào phát sinh, cơ sở đầu tiên để giải quyết tranh chấp căn cứ vào <a href=\"/thong-tin/van-chuyen-hanh-khach.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Chính sách vận chuyển</a> và các <a href=\"/thong-tin/su-dung-dich-vu.html\" style=\"box-sizing: border-box; background: 0px 0px; color: rgb(66, 139, 202); text-decoration-line: none;\" >Hướng dẫn sử dụng dịch vụ</a> của chúng tôi. Chúng tôi sẽ thực hiện mọi nỗ lực hợp l&yacute; để giải quyết các khiếu nại của khách hàng sử dụng dịch vụ đặt chỗ trực tuyến. Nếu những nỗ lực đó thất bại, khách hàng phải đồng ý rằng bất kỳ khiếu nại, tranh chấp của khách hàng đối với chúng tôi đều được giải quyết theo đúng quy định của pháp luật Việt Nam. </div>\r\n \r\n  <p style=\"box-sizing: border-box; margin: 0px 0px 5px; text-align: justify;\">Vui lòng liên hệ bằng một trong các cách sau khi cần hỗ trợ:</p>\r\n \r\n  <div style=\"box-sizing: border-box;\"> \r\n    <ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\"> \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gửi mail về contact@apka.vn</li>\r\n     \r\n      <li style=\"box-sizing: border-box; text-align: justify;\">Gọi điện về số hỗ trợ 0981.370.360</li>\r\n     </ul>\r\n   </div>\r\n </div>\r\n ','html','GIẢI QUYẾT SỰ CỐ VÀ KHIẾU NẠI\r\n\r\n1. SỰ CỐ PH&AACUTE;T SINH TRONG QUÁ TR&IGRAVE;NH ĐẶT CHỖ, HỦY \r\nCHỖ \r\n\r\n TRONG QUÁ TRÌNH ĐẶT CHỖ TR&ECIRC;N WEBSITE CH&IACUTE;NH SÁCH \r\nVẬN CHUYỂN [ /THONG-TIN/VAN-CHUYEN-HANH-KHACH.HTML ]  CỦA CH&UACUTE;NG \r\nTÔI. NẾU TÀI XẾ  VI PHẠM VỀ THỜI GIAN ĐÃ QUI ĐỊNH, KHÁCH \r\nHÀNG CÓ QUYỀN KHIẾU NẠI Đ&OGRAVE;I BỒI THƯỜNG. \r\n- TRONG TRƯỜNG HỢP XẢY RA NHỮNG KHIẾU NẠI LIÊN QUAN ĐẾN THÁI \r\nĐỘ VÀ CHẤT LƯỢNG PHỤC VỤ CỦA TÀI XẾ CŨNG NHƯ CHẤT \r\nLƯỢNG PHƯƠNG TIỆN. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ \r\nNHỮNG NỘI DUNG QUÍ KHÁCH TRAO ĐỔI TRỰC TIẾP VỚI TỔNG ĐÀI \r\n( ĐÃ ĐƯỢC GHI ÂM)  HOẶC CÁC TÀI LIỆU CHỨNG MINH NHƯ ẢNH \r\nCHỤP, FILE ÂM THANH, LỜI KHAI CỦA BÊN THỨ BA.. DO QUÍ KHÁCH \r\nCUNG CẤP. TẤT CẢ CÁC SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH \r\nVỤ, QUÍ KHÁCH VUI LÒNG LIÊN HỆ ĐỂ ĐƯỢC HỖ TRỢ BẰNG \r\nMỘT TRONG CÁC CÁCH SAU: \r\n\r\n- PHẢN ÁNH TRỰC TIẾP VỚI HÃNG VẬN CHUYỂN TRỰC TIẾP PHỤC \r\nVỤ 3. SỰ CỐ PHÁT SINH KHÁC KHI CÓ BẤT KỲ SỰ CỐ NÀO PHÁT \r\nSINH, CƠ SỞ ĐẦU TIÊN ĐỂ GIẢI QUYẾT TRANH CHẤP CĂN CỨ \r\nVÀO CHÍNH SÁCH VẬN CHUYỂN [ /THONG-TIN/VAN-CHUYEN-HANH-KHACH.HTML ] \r\n VÀ CÁC HƯỚNG DẪN SỬ DỤNG DỊCH VỤ [ /THONG-TIN/SU-DUNG-DICH-VU.HTML ] \r\n CỦA CHÚNG TÔI. CHÚNG TÔI SẼ THỰC HIỆN MỌI NỖ LỰC HỢP \r\nL&YACUTE; ĐỂ GIẢI QUYẾT CÁC KHIẾU NẠI CỦA KHÁCH HÀNG SỬ \r\nDỤNG DỊCH VỤ ĐẶT CHỖ TRỰC TUYẾN. NẾU NHỮNG NỖ LỰC \r\nĐÓ THẤT BẠI, KHÁCH HÀNG PHẢI ĐỒNG Ý RẰNG BẤT KỲ KHIẾU \r\nNẠI, TRANH CHẤP CỦA KHÁCH HÀNG ĐỐI VỚI CHÚNG TÔI ĐỀU ĐƯỢC \r\nGIẢI QUYẾT THEO ĐÚNG QUY ĐỊNH CỦA PHÁP LUẬT VIỆT NAM.  \r\n\r\nVUI LÒNG LIÊN HỆ BẰNG MỘT TRONG CÁC CÁCH SAU KHI CẦN HỖ TRỢ: \r\n\r\n- GỬI MAIL VỀ CONTACT@APKA.VN \r\n- GỌI ĐIỆN VỀ SỐ HỖ TRỢ 0981.370.360',1,NULL,NULL,NULL,NULL,NULL,'N','89','giai-quyet-su-co-va-khieu-nai','',NULL,NULL,61,'2017-12-24 11:47:29');
INSERT INTO `b_iblock_element` VALUES (90,'2018-03-31 01:06:31',1,'2017-12-24 11:48:50',1,9,NULL,'Y',NULL,NULL,500,'Hướng dẫn đặt xe',NULL,'Hướng dẫn đặt xe...','html',NULL,'Thông tin đang cập nhật. Bạn vui lòng trở lại sau','text','HƯỚNG DẪN ĐẶT XE\r\nHƯỚNG DẪN ĐẶT XE...\r\nTHÔNG TIN ĐANG CẬP NHẬT. BẠN VUI LÒNG TRỞ LẠI SAU',1,NULL,NULL,NULL,NULL,NULL,'N','90','huong-dan-dat-xe','',NULL,NULL,61,'2017-12-24 11:50:57');
INSERT INTO `b_iblock_element` VALUES (91,'2017-12-24 11:49:11',1,'2017-12-24 11:49:11',1,9,NULL,'Y',NULL,NULL,500,'Hướng dẫn sử dụng',NULL,'','text',NULL,'Nội dung','text','HƯỚNG DẪN SỬ DỤNG\r\n\r\nNỘI DUNG',1,NULL,NULL,NULL,NULL,NULL,'N','91','huong-dan-su-dung','',NULL,NULL,50,'2017-12-24 11:50:59');
INSERT INTO `b_iblock_element` VALUES (92,'2017-12-24 11:49:38',1,'2017-12-24 11:49:38',1,9,NULL,'Y',NULL,NULL,500,'Câu hỏi thường gặp',NULL,'','text',NULL,'Câu 1: \r\nTrả lời:','text','CÂU HỎI THƯỜNG GẶP\r\n\r\nCÂU 1: \r\nTRẢ LỜI:',1,NULL,NULL,NULL,NULL,NULL,'N','92','cau-hoi-thuong-gap','',NULL,NULL,60,'2017-12-24 11:51:01');
INSERT INTO `b_iblock_element` VALUES (93,'2018-03-31 01:03:58',1,'2017-12-24 11:52:35',1,10,NULL,'N',NULL,NULL,500,'ĐI CHUNG XE VỀ QUÊ TẾT ĐINH DẬU 2017',NULL,'','html',NULL,'\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">\r\n  <br />\r\n</p>\r\n\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Sau 2 năm 2015 v&agrave; 2016 triển khai chương tr&igrave;nh &quot;Đi chung Xe về qu&ecirc; Tết Nguyên Đ&aacute;n&quot;, DichungTaxi đ&atilde; đạt được nhiều thành c&ocirc;ng lớn. Hàng trăm chuyến đi thành công đã gi&uacute;p hàng nghìn hành khách c&oacute; cơ hội trở về sum họp bên gia đình được an toàn, tiện nghi và tiết kiệm.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Để tiếp nối những thành công này, DichungTaxi đã tìm kiếm và hợp tác với nhiều hãng taxi giá rẻ, các đơn vị vận tải hành khách để triển khai chương trình &quot;<span style=\"box-sizing: border-box; color: rgb(255, 0, 0);\">Đi chung Xe về quê Tết Đinh Dậu 2017</span>&quot;.</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\">-----</p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; color: rgb(51, 51, 51); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; \">Để đảm bảo dịch vụ tốt nhất cho mọi hành khách, DichungTaxi sẽ triển khai Đi chung Xe về quê các tuyến đường trọng điểm từ Hà Nội đi các tỉnh như Thái Bình, Nam Định, Ninh Bình, Hải Dương, Hải Ph&ograve;ng, Quảng Ninh, Thanh Hóa,...</p>\r\n ','html','ĐI CHUNG XE VỀ QUÊ TẾT ĐINH DẬU 2017\r\n\r\nSAU 2 NĂM 2015 V&AGRAVE; 2016 TRIỂN KHAI CHƯƠNG TR&IGRAVE;NH \"ĐI \r\nCHUNG XE VỀ QU&ECIRC; TẾT NGUYÊN Đ&AACUTE;N\", DICHUNGTAXI Đ&ATILDE; \r\nĐẠT ĐƯỢC NHIỀU THÀNH C&OCIRC;NG LỚN. HÀNG TRĂM CHUYẾN \r\nĐI THÀNH CÔNG ĐÃ GI&UACUTE;P HÀNG NGHÌN HÀNH KHÁCH C&OACUTE; CƠ \r\nHỘI TRỞ VỀ SUM HỌP BÊN GIA ĐÌNH ĐƯỢC AN TOÀN, TIỆN NGHI \r\nVÀ TIẾT KIỆM. \r\n\r\nĐỂ TIẾP NỐI NHỮNG THÀNH CÔNG NÀY, DICHUNGTAXI ĐÃ TÌM KIẾM \r\nVÀ HỢP TÁC VỚI NHIỀU HÃNG TAXI GIÁ RẺ, CÁC ĐƠN VỊ VẬN \r\nTẢI HÀNH KHÁCH ĐỂ TRIỂN KHAI CHƯƠNG TRÌNH \"ĐI CHUNG XE VỀ \r\nQUÊ TẾT ĐINH DẬU 2017\". \r\n\r\n----- \r\n\r\nĐỂ ĐẢM BẢO DỊCH VỤ TỐT NHẤT CHO MỌI HÀNH KHÁCH, DICHUNGTAXI \r\nSẼ TRIỂN KHAI ĐI CHUNG XE VỀ QUÊ CÁC TUYẾN ĐƯỜNG TRỌNG \r\nĐIỂM TỪ HÀ NỘI ĐI CÁC TỈNH NHƯ THÁI BÌNH, NAM ĐỊNH, NINH \r\nBÌNH, HẢI DƯƠNG, HẢI PH&OGRAVE;NG, QUẢNG NINH, THANH HÓA,...',1,NULL,NULL,NULL,NULL,NULL,'N','93','i-chung-xe-ve-que-tet-2017','',NULL,NULL,18,'2017-12-24 11:53:37');
INSERT INTO `b_iblock_element` VALUES (94,'2018-03-31 01:03:45',1,'2017-12-24 11:55:19',1,10,NULL,'Y',NULL,NULL,500,'Về chúng tôi',NULL,'','text',NULL,' \r\n<p style=\"text-align: center; box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\"> <img src=\"/upload/medialibrary/02a/02a193fda1e0e1930445a407041d61bf.jpg\" title=\"DoiNgu.jpg\" border=\"0\" alt=\"DoiNgu.jpg\" width=\"800px\" height=\"534px\"  /></p>\r\n \r\n<p style=\"box-sizing: border-box; margin: 0px 0px 5px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51); font-size: 16px;\"> \r\n  <br />\r\n APKA.VN hiện nay với hơn 4000 đối t&aacute;c lái xe tham gia hợp tác, gi&uacute;p h&agrave;nh khách t&igrave;m được xe giá tốt, lu&ocirc;n giúp chuy&ecirc;n đi vui th&iacute;ch. Dựa trên nền tảng công nghệ website và di động, www.apka.vn phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. Hành khách c&oacute; thể sử dụng các công nghệ của APKA để tìm kiếm, lựa chọn và đặt các loại xe từ 4 chỗ đến 8 chỗ với cả hai hình thức di chuyển đi riêng xe và đi chung xe. Giải pháp của APKA cũng giúp cho các hãng taxi và xe hợp đồng thúc đẩy sự trung thành của khách hàng và tối ưu lợi nhuận cho từng chuyến đi. \r\n  <br />\r\n </p>\r\n \r\n<p>APKA trực thuộc Công ty cổ phần đầu tư <b>An Phát Khánh</b> là một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (trên nền tảng Grab).</p>\r\n \r\n<p>Các lĩnh vực hoạt động: </p>\r\n \r\n<p>1. Mua Bán xe ô tô cũ mới, mua xe trả góp: <i><u>apkauto.vn</u></i> </p>\r\n \r\n<p>2. Gara bảo dưỡng, sửa chữa xe ô tô: <i><u>anphatauto.com</u></i> </p>\r\n \r\n<p>3. Đầu tư, cho thuê và hợp tác xe Grab: <i><u>anphatkhanh.vn</u></i> </p>\r\n \r\n<p>4. Mua bán bảo hiểm ô tô: <i><u>anphatkhanh.vn</u></i> </p>\r\n \r\n<p>5. Dự án xe Nội Bài, xe chạy tỉnh: <i><u>apka.vn</u></i></p>\r\n ','html','VỀ CHÚNG TÔI\r\n\r\n[ /UPLOAD/MEDIALIBRARY/02A/02A193FDA1E0E1930445A407041D61BF.JPG ] \r\n\r\n\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI T&AACUTE;C LÁI XE THAM GIA HỢP \r\nTÁC, GI&UACUTE;P H&AGRAVE;NH KHÁCH T&IGRAVE;M ĐƯỢC XE GIÁ TỐT, \r\nLU&OCIRC;N GIÚP CHUY&ECIRC;N ĐI VUI TH&IACUTE;CH. DỰA TRÊN NỀN TẢNG \r\nCÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN PHÁT TRIỂN MỘT GIẢI \r\nPHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC H&ATILDE;NG \r\nTAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC \r\nTIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG \r\nTÁC ĐỘNG ĐẾN MÔI TRƯỜNG. HÀNH KHÁCH C&OACUTE; THỂ SỬ DỤNG \r\nCÁC CÔNG NGHỆ CỦA APKA ĐỂ TÌM KIẾM, LỰA CHỌN VÀ ĐẶT \r\nCÁC LOẠI XE TỪ 4 CHỖ ĐẾN 8 CHỖ VỚI CẢ HAI HÌNH THỨC DI CHUYỂN \r\nĐI RIÊNG XE VÀ ĐI CHUNG XE. GIẢI PHÁP CỦA APKA CŨNG GIÚP CHO \r\nCÁC HÃNG TAXI VÀ XE HỢP ĐỒNG THÚC ĐẨY SỰ TRUNG THÀNH CỦA \r\nKHÁCH HÀNG VÀ TỐI ƯU LỢI NHUẬN CHO TỪNG CHUYẾN ĐI. \r\n \r\n\r\nAPKA TRỰC THUỘC CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH LÀ \r\nMỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU \r\nHƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRÊN NỀN \r\nTẢNG GRAB). \r\n\r\nCÁC LĨNH VỰC HOẠT ĐỘNG: \r\n\r\n1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GÓP: APKAUTO.VN \r\n\r\n2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: ANPHATAUTO.COM \r\n\r\n3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: ANPHATKHANH.VN \r\n\r\n4. MUA BÁN BẢO HIỂM Ô TÔ: ANPHATKHANH.VN \r\n\r\n5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: APKA.VN',1,NULL,NULL,NULL,NULL,NULL,'N','94','ve-chung-toi','',NULL,NULL,111,'2017-12-24 11:55:35');
INSERT INTO `b_iblock_element` VALUES (229,'2018-05-02 08:27:10',1,'2018-05-02 08:27:10',1,7,NULL,'Y',NULL,NULL,500,'RMKB7WVH',NULL,NULL,'text',NULL,NULL,'text','RMKB7WVH\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','229',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `b_iblock_element` VALUES (141,'2018-03-31 00:56:40',1,'2018-03-31 00:56:40',1,8,NULL,'Y',NULL,NULL,500,'Mừng sinh nhật An Phát Khánh tròn 02 tuổi',NULL,'Thời gian trôi qua và chứng kiến những đổi thay trong từng bước đi của An Phát Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nhân viên đã cùng nhau đoàn tụ tổng kết, chúc mừng công ty tròn hai tuổi.\r\n','text',NULL,'\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Thời gian tr&ocirc;i qua v&agrave; chứng kiến những đổi thay trong từng bước đi của An Ph&aacute;t Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nh&acirc;n vi&ecirc;n đ&atilde; c&ugrave;ng nhau đoàn tụ tổng kết, ch&uacute;c mừng công ty tr&ograve;n hai tuổi.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/636/63632d22eb7d67bdd913a51a3c51ebfc.jpg\" title=\"z872224025533_d3c741535a3d6e53fdc711185c1a8bb8.jpg\" border=\"0\" alt=\"z872224025533_d3c741535a3d6e53fdc711185c1a8bb8.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Mở đầu những tiếng cười n&oacute;i hổ hởi chuẩn bị cho một bữa tiệc hoành tráng, tiếp sau đó là một khoảng thời gian tĩnh lặng cùng nh&igrave;n những khó khăn, thành quả đạt được trong hai năm vừa qua và cùng nhau hướng đến một tương lai mới khi bước sang tuổi thứ ba.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/409/40998231cd3ddf3e98b019453b69463e.jpg\" title=\"z873375723605_4340b609f46b31b1ae716948ceb89c1e.jpg\" border=\"0\" alt=\"z873375723605_4340b609f46b31b1ae716948ceb89c1e.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Thay mặt toàn thể công ty Giám đốc công ty đã có một bài phát biểu với nội dung khẳng định thế mạnh của những dịch vụ công ty đang cung cấp trên thị trường hiện nay. Tiếp theo đó là những mục tiêu đặt ra trong năm tới, đạt được những thành tựu như đã đặt ra </div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/1a5/1a5c63581a5e7f6da7911b006bd28bec.jpg\" title=\"z873385778112_b79039b4e64033f7cd6c5fa0d8bf5fcb.jpg\" border=\"0\" alt=\"z873385778112_b79039b4e64033f7cd6c5fa0d8bf5fcb.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Với đội ngũ nhân viên trẻ trung năng động, 99% là thế hệ 9X nên không có gì làm khó được tinh thần tuổi trẻ, trên con đường thành công của công ty là những đóng góp vô cùng to lớn của những người mang tâm huyết của trẻ này.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\"><img src=\"http://anphatkhanh.vn/upload/medialibrary/a13/a13549aa432cfef14b7f1a37aa7aed4d.jpg\" title=\"z873375748820_2cac92d774bb341f86698854a552c12c.jpg\" border=\"0\" alt=\"z873375748820_2cac92d774bb341f86698854a552c12c.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" /></div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">\r\n  <br style=\"box-sizing: border-box;\" />\r\n</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Bữa tiệc đã diễn ra với không kh&iacute; vui vẻ, hòa chung với niềm vui đó là những đại diện khách mời từ các đối tác, bạn b&egrave; chiến hữu gần xa cùng chúc nhau thêm những thành công mới, công ty lên một tầm cao mới </div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Lời cuối xin chúc cho toàn thể cán bộ nhân viên công ty luôn khỏe mạnh, tinh thần sảng khoái để hoàn thành công việc tốt nhất, phát triển bản thân mình một tầm cao mới.</div>\r\n\r\n<div style=\"box-sizing: border-box; color: rgb(56, 56, 56); font-family: MyriadPro-Regular, sans-serif; font-size: 15.5px; background-color: rgb(255, 255, 255);\">Cùng nhau đưa công ty trở thành một trong những công ty đứng đầu về ngành vận tải trong thời gian tới.</div>\r\n','html','MỪNG SINH NHẬT AN PHÁT KHÁNH TRÒN 02 TUỔI\r\nTHỜI GIAN TRÔI QUA VÀ CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHÁT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHÂN VIÊN ĐÃ CÙNG NHAU ĐOÀN TỤ TỔNG KẾT, CHÚC MỪNG CÔNG TY TRÒN HAI TUỔI.\r\n\r\nTHỜI GIAN TR&OCIRC;I QUA V&AGRAVE; CHỨNG KIẾN NHỮNG ĐỔI THAY \r\nTRONG TỪNG BƯỚC ĐI CỦA AN PH&AACUTE;T KHÁNH. HÔM NAY NGÀY 04/1/2018 \r\nLÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ \r\nMỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NH&ACIRC;N VI&ECIRC;N Đ&ATILDE; \r\nC&UGRAVE;NG NHAU ĐOÀN TỤ TỔNG KẾT, CH&UACUTE;C MỪNG CÔNG TY TR&OGRAVE;N \r\nHAI TUỔI. \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/636/63632D22EB7D67BDD913A51A3C51EBFC.JPG ]\r\n \r\nMỞ ĐẦU NHỮNG TIẾNG CƯỜI N&OACUTE;I HỔ HỞI CHUẨN BỊ \r\nCHO MỘT BỮA TIỆC HOÀNH TRÁNG, TIẾP SAU ĐÓ LÀ MỘT KHOẢNG \r\nTHỜI GIAN TĨNH LẶNG CÙNG NH&IGRAVE;N NHỮNG KHÓ KHĂN, THÀNH QUẢ \r\nĐẠT ĐƯỢC TRONG HAI NĂM VỪA QUA VÀ CÙNG NHAU HƯỚNG ĐẾN \r\nMỘT TƯƠNG LAI MỚI KHI BƯỚC SANG TUỔI THỨ BA. \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/409/40998231CD3DDF3E98B019453B69463E.JPG ]\r\n \r\nTHAY MẶT TOÀN THỂ CÔNG TY GIÁM ĐỐC CÔNG TY ĐÃ CÓ MỘT BÀI \r\nPHÁT BIỂU VỚI NỘI DUNG KHẲNG ĐỊNH THẾ MẠNH CỦA NHỮNG \r\nDỊCH VỤ CÔNG TY ĐANG CUNG CẤP TRÊN THỊ TRƯỜNG HIỆN NAY. \r\nTIẾP THEO ĐÓ LÀ NHỮNG MỤC TIÊU ĐẶT RA TRONG NĂM TỚI, ĐẠT \r\nĐƯỢC NHỮNG THÀNH TỰU NHƯ ĐÃ ĐẶT RA  \r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/1A5/1A5C63581A5E7F6DA7911B006BD28BEC.JPG ]\r\n \r\n\r\nVỚI ĐỘI NGŨ NHÂN VIÊN TRẺ TRUNG NĂNG ĐỘNG, 99% LÀ THẾ \r\nHỆ 9X NÊN KHÔNG CÓ GÌ LÀM KHÓ ĐƯỢC TINH THẦN TUỔI TRẺ, \r\nTRÊN CON ĐƯỜNG THÀNH CÔNG CỦA CÔNG TY LÀ NHỮNG ĐÓNG GÓP \r\nVÔ CÙNG TO LỚN CỦA NHỮNG NGƯỜI MANG TÂM HUYẾT CỦA TRẺ \r\nNÀY. \r\n\r\n[ HTTP://ANPHATKHANH.VN/UPLOAD/MEDIALIBRARY/A13/A13549AA432CFEF14B7F1A37AA7AED4D.JPG ]\r\n \r\n\r\nBỮA TIỆC ĐÃ DIỄN RA VỚI KHÔNG KH&IACUTE; VUI VẺ, HÒA CHUNG \r\nVỚI NIỀM VUI ĐÓ LÀ NHỮNG ĐẠI DIỆN KHÁCH MỜI TỪ CÁC ĐỐI \r\nTÁC, BẠN B&EGRAVE; CHIẾN HỮU GẦN XA CÙNG CHÚC NHAU THÊM NHỮNG \r\nTHÀNH CÔNG MỚI, CÔNG TY LÊN MỘT TẦM CAO MỚI  LỜI CUỐI XIN \r\nCHÚC CHO TOÀN THỂ CÁN BỘ NHÂN VIÊN CÔNG TY LUÔN KHỎE MẠNH, \r\nTINH THẦN SẢNG KHOÁI ĐỂ HOÀN THÀNH CÔNG VIỆC TỐT NHẤT, \r\nPHÁT TRIỂN BẢN THÂN MÌNH MỘT TẦM CAO MỚI. CÙNG NHAU ĐƯA \r\nCÔNG TY TRỞ THÀNH MỘT TRONG NHỮNG CÔNG TY ĐỨNG ĐẦU VỀ NGÀNH \r\nVẬN TẢI TRONG THỜI GIAN TỚI.',1,NULL,NULL,NULL,NULL,NULL,'N','141','chuc-mung-sinh-nhat-02-tuoi','',NULL,NULL,16,'2018-03-31 00:56:57');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_element_lock`
-- 




DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32)  DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_element_property`
-- 




DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text  NOT NULL,
  `VALUE_TYPE` char(4)  NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1771 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_element_property`
-- 


INSERT INTO `b_iblock_element_property` VALUES (1185,16,203,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1186,35,204,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1187,10,204,'202','text',NULL,202.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1145,16,197,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1146,35,198,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1147,10,198,'196','text',NULL,196.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1148,12,198,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1149,13,198,'197','text',NULL,197.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1150,17,199,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1151,18,199,'Lê Văn Linh, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1152,19,199,'2018-04-29 15:49:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1153,20,199,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1154,21,199,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1155,22,199,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1156,24,199,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1157,28,199,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1158,29,199,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1159,30,199,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1160,31,199,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1070,17,187,'Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1143,34,197,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1144,14,197,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1071,18,187,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1072,19,187,'2018-04-27 15:48:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1073,20,187,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1074,21,187,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1075,22,187,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1076,24,187,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1077,28,187,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1078,29,187,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1079,30,187,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1080,31,187,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1081,32,187,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1082,38,187,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1083,34,188,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1084,14,188,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1085,16,188,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1086,35,189,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1087,10,189,'187','text',NULL,187.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1088,12,189,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1089,13,189,'188','text',NULL,188.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1090,17,190,'Hồ Hoàn Kiếm, Hàng Trống, Hoàn Kiếm, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1091,18,190,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1092,19,190,'2018-04-27 15:52:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1093,20,190,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1094,21,190,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1095,22,190,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1096,24,190,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1097,28,190,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1098,29,190,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1099,30,190,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1100,31,190,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1101,32,190,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1102,38,190,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1103,34,191,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1104,14,191,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1105,16,191,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1106,35,192,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1107,10,192,'190','text',NULL,190.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1108,12,192,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1109,13,192,'191','text',NULL,191.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1110,17,193,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1111,18,193,'Nguyen Thi Minh Khai High School, Võ Quý Huân, Phúc Diễn, Từ Liêm, Hà Nội, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1112,19,193,'2018-04-28 15:40:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1113,20,193,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1114,21,193,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1115,22,193,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1116,24,193,'Nguyễn Văn Niên','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1117,28,193,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1118,29,193,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1119,30,193,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1120,31,193,'5069','text',NULL,5069.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1121,32,193,'81804','text',NULL,81804.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1122,38,193,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1123,34,194,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1124,14,194,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1125,16,194,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1126,35,195,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1127,10,195,'193','text',NULL,193.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1128,12,195,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1129,13,195,'194','text',NULL,194.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1130,17,196,'Hang Bong, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1131,18,196,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1132,19,196,'2018-04-29 15:43:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1133,20,196,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1134,21,196,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1135,22,196,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1136,24,196,'Nguyễn Văn Niên','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1137,28,196,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1138,29,196,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1139,30,196,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1140,31,196,'5069','text',NULL,5069.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1141,32,196,'81804','text',NULL,81804.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1142,38,196,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1065,16,185,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1066,35,186,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1067,10,186,'184','text',NULL,184.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1068,12,186,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1069,13,186,'185','text',NULL,185.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1048,12,183,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1049,13,183,'182','text',NULL,182.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1050,17,184,'234 Hang Bong, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,234.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1051,18,184,'Ngõ 190 Hoàng Mai, Tương Mai, Hoàng Mai, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1052,19,184,'2018-04-28 15:22:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1053,20,184,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1054,21,184,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1055,22,184,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1056,24,184,'Nguyễn Văn Niên','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1057,28,184,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1058,29,184,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1059,30,184,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1060,31,184,'5069','text',NULL,5069.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1061,32,184,'81804','text',NULL,81804.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1062,38,184,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1063,34,185,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1064,14,185,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1031,18,181,'Hang Bong, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1046,35,183,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1047,10,183,'181','text',NULL,181.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1032,19,181,'2018-04-28 15:20:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1033,20,181,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1034,21,181,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1035,22,181,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1036,24,181,'Nguyễn Văn Niên','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1037,28,181,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1038,29,181,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1039,30,181,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1040,31,181,'5069','text',NULL,5069.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1041,32,181,'81804','text',NULL,81804.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1042,38,181,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1043,34,182,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1044,14,182,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1045,16,182,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1026,35,180,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1027,10,180,'178','text',NULL,178.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1028,12,180,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1029,13,180,'179','text',NULL,179.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1030,17,181,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1016,24,178,'Nguyễn Văn Niên','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1017,28,178,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1018,29,178,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1019,30,178,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1020,31,178,'5069','text',NULL,5069.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1021,32,178,'81804','text',NULL,81804.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1022,38,178,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1023,34,179,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1024,14,179,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1025,16,179,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1014,21,178,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1015,22,178,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1001,32,175,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1002,38,175,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1003,34,176,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1004,14,176,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1005,16,176,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1006,35,177,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1007,10,177,'175','text',NULL,175.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1008,12,177,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1009,13,177,'176','text',NULL,176.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1010,17,178,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1011,18,178,'Lăng Bác, Hùng Vương, Điện Biên, Ba Đình, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1012,19,178,'2018-04-28 15:14:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1013,20,178,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (950,17,169,'125 Nguyễn Công Hoan, Ba Đình, Hanoi, Vietnam','text',NULL,125.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (951,18,169,'Lăng Chủ tịch Hồ Chí Minh, Hùng Vương, Điện Biên, Ba Đình, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (952,19,169,'2018-04-27 14:26:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (953,20,169,'5','text',NULL,5.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (954,21,169,'Toyota','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (955,22,169,'Cát','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (956,24,169,'Đàm Văn Hải','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (957,28,169,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (958,29,169,'Vios','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (959,30,169,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (960,31,169,'1328','text',NULL,1328.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (961,32,169,'47474','text',NULL,47474.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (962,38,169,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (963,34,170,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (964,14,170,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (965,16,170,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (966,35,171,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (967,10,171,'169','text',NULL,169.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (968,12,171,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (969,13,171,'170','text',NULL,170.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (970,17,172,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (971,18,172,'Hàng Bút, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (972,19,172,'2018-04-27 14:59:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (973,20,172,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (974,21,172,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (975,22,172,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (976,24,172,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (977,28,172,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (978,29,172,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (979,30,172,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (980,31,172,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (981,32,172,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (982,38,172,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (983,34,173,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (984,14,173,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (985,16,173,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (986,35,174,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (987,10,174,'172','text',NULL,172.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (988,12,174,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (989,13,174,'173','text',NULL,173.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (990,17,175,'Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (991,18,175,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (992,19,175,'2018-04-27 15:07:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (993,20,175,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (994,21,175,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (995,22,175,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (996,24,175,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (997,28,175,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (998,29,175,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (999,30,175,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1000,31,175,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (867,41,154,'8:00 - 12:00','text',NULL,8.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (868,42,154,'0935509900','text',NULL,935509900.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (869,43,154,'234 Nguyễn Văn Linh - Đà Nẵng','text',NULL,234.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (870,41,155,'9:00 - 12:00','text',NULL,9.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (871,42,155,'09234563','text',NULL,9234563.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (872,43,155,'50 Duy Tân - Hà Nội','text',NULL,50.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (873,44,155,'16','text',16,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (875,44,154,'17','text',17,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (876,45,154,'41','text',NULL,41.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (877,45,154,'42','text',NULL,42.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1199,30,205,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1197,28,205,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1198,29,205,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1196,24,205,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1195,22,205,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1194,21,205,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1193,20,205,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1192,19,205,'2018-04-27 16:37:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1191,18,205,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1188,12,204,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1189,13,204,'203','text',NULL,203.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1190,17,205,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1161,32,199,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1171,18,202,'234 Nguyễn Văn Lượng, phường 10, Gò Vấp, Ho Chi Minh City, Vietnam','text',NULL,234.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1162,38,199,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1163,34,200,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1164,14,200,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1165,16,200,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1166,35,201,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1167,10,201,'199','text',NULL,199.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1168,12,201,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1169,13,201,'200','text',NULL,200.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1170,17,202,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1207,10,207,'205','text',NULL,205.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1206,35,207,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1205,16,206,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1204,14,206,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1203,34,206,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1200,31,205,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1201,32,205,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1202,38,205,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1181,32,202,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1172,19,202,'2018-04-29 15:57:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1173,20,202,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1174,21,202,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1175,22,202,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1176,24,202,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1177,28,202,'210000','text',NULL,210000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1178,29,202,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1179,30,202,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1180,31,202,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1212,19,208,'2018-04-27 16:39:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1211,18,208,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1208,12,207,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1209,13,207,'206','text',NULL,206.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1210,17,208,'Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1182,38,202,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1184,14,203,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1183,34,203,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1213,20,208,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1214,21,208,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1215,22,208,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1216,24,208,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1217,28,208,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1218,29,208,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1219,30,208,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1220,31,208,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1221,32,208,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1222,38,208,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1223,34,209,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1224,14,209,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1225,16,209,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1226,35,210,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1227,10,210,'208','text',NULL,208.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1228,12,210,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1229,13,210,'209','text',NULL,209.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1230,17,211,'Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1231,18,211,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1232,19,211,'2018-04-27 16:42:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1233,20,211,'5','text',NULL,5.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1234,21,211,'Toyota','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1235,22,211,'Cát','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1236,24,211,'Đàm Văn Hải','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1237,28,211,'160000','text',NULL,160000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1238,29,211,'Vios','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1239,30,211,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1240,31,211,'1328','text',NULL,1328.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1241,32,211,'47474','text',NULL,47474.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1242,38,211,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1243,34,212,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1244,14,212,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1245,16,212,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1246,35,213,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1247,10,213,'211','text',NULL,211.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1248,12,213,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1249,13,213,'212','text',NULL,212.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1250,17,214,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1251,18,214,'Nguyễn Viết Xuân, Thanh Xuân, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1252,19,214,'2018-04-27 22:24:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1253,20,214,'5','text',NULL,5.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1254,21,214,'Toyota','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1255,22,214,'Cát','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1256,24,214,'Phạm Hoàng Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1257,28,214,'250.000','text',NULL,250.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1258,29,214,'Vios','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1259,30,214,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1260,31,214,'3927','text',NULL,3927.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1261,32,214,'81312','text',NULL,81312.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1262,38,214,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1263,34,215,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1264,14,215,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1265,16,215,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1266,35,216,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1267,10,216,'214','text',NULL,214.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1268,12,216,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1269,13,216,'215','text',NULL,215.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1270,17,217,'234 Lê Lợi, Sơn Tây, Hà Nội, Vietnam','text',NULL,234.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1271,18,217,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1272,19,217,'2018-04-27 22:36:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1273,20,217,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1274,21,217,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1275,22,217,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1276,24,217,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1277,28,217,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1278,29,217,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1279,30,217,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1280,31,217,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1281,32,217,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1282,38,217,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1283,34,218,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1284,14,218,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1285,16,218,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1286,35,219,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1287,10,219,'217','text',NULL,217.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1288,12,219,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1289,13,219,'218','text',NULL,218.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1290,17,220,'234 Lê Lợi, Sơn Tây, Hà Nội, Vietnam','text',NULL,234.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1291,18,220,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1292,19,220,'2018-04-27 22:36:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1293,20,220,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1294,21,220,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1295,22,220,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1296,24,220,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1297,28,220,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1298,29,220,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1299,30,220,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1300,31,220,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1301,32,220,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1302,38,220,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1303,34,221,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1304,14,221,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1305,16,221,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1306,35,222,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1307,10,222,'220','text',NULL,220.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1308,12,222,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1309,13,222,'221','text',NULL,221.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1310,17,223,'234 Lê Lợi, Sơn Tây, Hà Nội, Vietnam','text',NULL,234.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1311,18,223,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1312,19,223,'2018-04-27 22:36:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1313,20,223,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1314,21,223,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1315,22,223,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1316,24,223,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1317,28,223,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1318,29,223,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1319,30,223,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1320,31,223,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1321,32,223,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1322,38,223,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1323,34,224,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1324,14,224,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1325,16,224,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1326,35,225,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1327,10,225,'223','text',NULL,223.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1328,12,225,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1329,13,225,'224','text',NULL,224.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1330,17,226,'Chợ Đồng Xuân, Đồng Xuân, Hoàn Kiếm, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1331,18,226,'Sân bay Nội Bài (HAN), Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1332,19,226,'2018-04-27 22:29:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1333,20,226,'5','text',NULL,5.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1334,21,226,'Toyota','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1335,22,226,'Cát','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1336,24,226,'Phạm Hoàng Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1337,28,226,'120000','text',NULL,120000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1338,29,226,'Vios','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1339,30,226,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1340,31,226,'3927','text',NULL,3927.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1341,32,226,'81312','text',NULL,81312.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1342,38,226,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1343,34,227,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1344,14,227,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1345,16,227,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1346,35,228,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1347,10,228,'226','text',NULL,226.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1348,12,228,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1349,13,228,'227','text',NULL,227.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1350,17,229,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1351,18,229,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1352,19,229,'2018-05-02 08:25:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1353,20,229,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1354,21,229,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1355,22,229,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1356,24,229,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1357,28,229,'206000','text',NULL,206000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1358,29,229,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1359,30,229,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1360,31,229,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1361,32,229,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1362,38,229,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1363,34,230,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1364,14,230,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1365,16,230,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1366,35,231,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1367,10,231,'229','text',NULL,229.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1368,12,231,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1369,13,231,'230','text',NULL,230.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1370,17,232,'Lê Văn Lương, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1371,18,232,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1372,19,232,'2018-05-03 14:35:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1373,20,232,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1374,21,232,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1375,22,232,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1376,24,232,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1377,28,232,'190000','text',NULL,190000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1378,29,232,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1379,30,232,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1380,31,232,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1381,32,232,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1382,38,232,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1383,34,233,'Đào Quang Hưng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1384,14,233,'admin','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1385,16,233,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1386,35,234,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1387,10,234,'232','text',NULL,232.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1388,12,234,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1389,13,234,'233','text',NULL,233.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1390,17,235,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1391,18,235,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1392,19,235,'2018-05-03 14:40:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1393,20,235,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1394,21,235,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1395,22,235,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1396,24,235,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1397,28,235,'248000','text',NULL,248000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1398,29,235,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1399,30,235,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1400,31,235,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1401,32,235,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1402,38,235,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1403,34,236,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1404,14,236,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1405,16,236,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1406,35,237,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1407,10,237,'235','text',NULL,235.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1408,12,237,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1409,13,237,'236','text',NULL,236.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1410,17,238,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1411,18,238,'Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1412,19,238,'2018-05-03 14:43:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1413,20,238,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1414,21,238,'Kia','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1415,22,238,'Trắng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1416,24,238,'Test Apka','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1417,28,238,'276000','text',NULL,276000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1418,29,238,'Morning','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1419,30,238,'Sedan','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1420,31,238,'2700','text',NULL,2700.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1421,32,238,'80404','text',NULL,80404.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1422,38,238,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1423,34,239,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1424,14,239,'_Chưa xác định_','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1425,16,239,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1426,35,240,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1427,10,240,'238','text',NULL,238.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1428,12,240,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1429,13,240,'239','text',NULL,239.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1430,46,241,'4','text',NULL,4.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1431,47,241,'7000','text',NULL,7000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1432,46,242,'8','text',NULL,8.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1433,47,242,'8000','text',NULL,8000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1434,17,243,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1435,18,243,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1436,19,243,'2018-05-30 00:11:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1437,20,243,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1438,28,243,'218997','text',NULL,218997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1439,38,243,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1440,34,244,'Tran thanh tung','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1441,14,244,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1442,16,244,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1443,35,245,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1444,10,245,'243','text',NULL,243.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1445,12,245,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1446,13,245,'244','text',NULL,244.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1447,25,245,'ha noi','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1448,17,246,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1449,18,246,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1450,19,246,'2018-05-23 16:39:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1451,20,246,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1452,28,246,'188997','text',NULL,188997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1453,38,246,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1454,34,247,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1455,14,247,'090922','text',NULL,90922.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1456,16,247,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1457,35,248,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1458,10,248,'246','text',NULL,246.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1459,12,248,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1460,13,248,'247','text',NULL,247.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1461,25,248,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1462,48,249,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1463,17,250,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1464,18,250,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1465,19,250,'2018-05-30 17:09:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1466,20,250,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1467,28,250,'188997','text',NULL,188997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1468,38,250,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1469,34,251,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1470,14,251,'0909222','text',NULL,909222.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1471,16,251,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1472,35,252,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1473,10,252,'250','text',NULL,250.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1474,12,252,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1475,13,252,'251','text',NULL,251.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1476,25,252,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1477,48,253,'0978321345','text',NULL,978321345.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1478,17,254,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1479,18,254,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1480,19,254,'2018-05-30 17:09:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1481,20,254,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1482,28,254,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1483,38,254,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1484,34,255,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1485,14,255,'0909222','text',NULL,909222.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1486,16,255,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1487,35,256,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1488,10,256,'254','text',NULL,254.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1489,12,256,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1490,13,256,'255','text',NULL,255.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1491,25,256,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1492,17,257,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1493,18,257,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1494,19,257,'2018-05-15 17:19:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1495,20,257,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1496,28,257,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1497,38,257,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1498,34,258,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1499,14,258,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1500,16,258,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1501,35,259,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1502,10,259,'257','text',NULL,257.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1503,12,259,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1504,13,259,'258','text',NULL,258.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1505,25,259,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1506,17,260,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1507,18,260,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1508,19,260,'2018-05-29 17:26:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1509,20,260,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1510,28,260,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1511,38,260,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1512,34,261,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1513,14,261,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1514,16,261,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1515,35,262,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1516,10,262,'260','text',NULL,260.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1517,12,262,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1518,13,262,'261','text',NULL,261.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1519,25,262,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1520,17,263,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1521,18,263,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1522,19,263,'2018-05-16 17:33:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1523,20,263,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1524,28,263,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1525,38,263,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1526,34,264,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1527,14,264,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1528,16,264,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1529,35,265,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1530,10,265,'263','text',NULL,263.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1531,12,265,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1532,13,265,'264','text',NULL,264.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1533,25,265,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1534,17,266,'582 Nguyễn Trãi, Thanh Xuân Bắc, Hà Đông, Hà Nội, Việt Nam','text',NULL,582.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1535,18,266,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1536,19,266,'2018-05-23 17:37:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1537,20,266,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1538,28,266,'189802','text',NULL,189802.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1539,38,266,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1540,34,267,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1541,14,267,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1542,16,267,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1543,35,268,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1544,10,268,'266','text',NULL,266.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1545,12,268,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1546,13,268,'267','text',NULL,267.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1547,25,268,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1548,17,269,'582 Nguyễn Trãi, Thanh Xuân Bắc, Hà Đông, Hà Nội, Việt Nam','text',NULL,582.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1549,18,269,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1550,19,269,'2018-05-16 17:39:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1551,20,269,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1552,28,269,'174004','text',NULL,174004.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1553,38,269,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1554,34,270,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1555,14,270,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1556,16,270,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1557,35,271,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1558,10,271,'269','text',NULL,269.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1559,12,271,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1560,13,271,'270','text',NULL,270.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1561,25,271,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1562,28,272,'-15000','text',NULL,-15000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1563,38,272,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1564,34,273,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1565,14,273,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1566,16,273,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1567,35,274,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1568,10,274,'272','text',NULL,272.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1569,12,274,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1570,13,274,'273','text',NULL,273.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1571,25,274,'Hai Ba Trung','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1572,17,275,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1573,18,275,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1574,19,275,'2018-05-22 17:46:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1575,20,275,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1576,28,275,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1577,38,275,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1578,34,276,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1579,14,276,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1580,16,276,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1581,35,277,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1582,10,277,'275','text',NULL,275.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1583,12,277,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1584,13,277,'276','text',NULL,276.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1585,25,277,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1586,17,278,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1587,18,278,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1588,19,278,'2018-05-23 17:47:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1589,20,278,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1590,28,278,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1591,38,278,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1592,34,279,'sad','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1593,14,279,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1594,16,279,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1595,35,280,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1596,10,280,'278','text',NULL,278.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1597,12,280,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1598,13,280,'279','text',NULL,279.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1599,25,280,'sadsa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1600,17,281,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1601,18,281,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1602,19,281,'2018-05-23 17:47:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1603,20,281,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1604,28,281,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1605,38,281,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1606,34,282,'tun','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1607,14,282,'097862555','text',NULL,97862555.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1608,16,282,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1609,35,283,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1610,10,283,'281','text',NULL,281.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1611,12,283,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1612,13,283,'282','text',NULL,282.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1613,25,283,'ss','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1614,17,284,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1615,18,284,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1616,19,284,'2018-05-29 17:52:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1617,20,284,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1618,28,284,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1619,38,284,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1620,34,285,'sddsa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1621,14,285,'0909','text',NULL,909.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1622,16,285,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1623,35,286,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1624,10,286,'284','text',NULL,284.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1625,12,286,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1626,13,286,'285','text',NULL,285.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1627,25,286,'ha noi','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1628,17,287,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1629,18,287,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1630,19,287,'2018-05-17 17:54:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1631,20,287,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1632,28,287,'174795','text',NULL,174795.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1633,38,287,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1634,34,288,'tung hung','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1635,14,288,'0909','text',NULL,909.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1636,16,288,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1637,35,289,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1638,10,289,'287','text',NULL,287.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1639,12,289,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1640,13,289,'288','text',NULL,288.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1641,25,289,'dsadsad, dsadsad 2','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1642,17,290,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1643,18,290,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1644,19,290,'2018-05-17 17:54:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1645,20,290,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1646,28,290,'174795','text',NULL,174795.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1647,38,290,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1648,34,291,'asaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1649,14,291,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1650,16,291,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1651,35,292,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1652,10,292,'290','text',NULL,290.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1653,12,292,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1654,13,292,'291','text',NULL,291.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1655,25,292,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1656,17,293,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1657,18,293,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1658,19,293,'2018-05-17 17:54:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1659,20,293,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1660,28,293,'174795','text',NULL,174795.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1661,38,293,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1662,34,294,'aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1663,14,294,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1664,16,294,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1665,35,295,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1666,10,295,'293','text',NULL,293.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1667,12,295,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1668,13,295,'294','text',NULL,294.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1669,25,295,'aa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1670,17,296,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1671,18,296,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1672,19,296,'2018-05-17 17:54:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1673,20,296,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1674,28,296,'174795','text',NULL,174795.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1675,38,296,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1676,34,297,'sasa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1677,14,297,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1678,16,297,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1679,35,298,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1680,10,298,'296','text',NULL,296.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1681,12,298,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1682,13,298,'297','text',NULL,297.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1683,25,298,'ha noi','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1684,17,299,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1685,18,299,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1686,19,299,'2018-05-17 17:54:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1687,20,299,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1688,28,299,'174795','text',NULL,174795.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1689,38,299,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1690,34,300,'sadasd','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1691,14,300,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1692,16,300,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1693,35,301,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1694,10,301,'299','text',NULL,299.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1695,12,301,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1696,13,301,'300','text',NULL,300.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1697,25,301,'sdad','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1698,17,302,'583 Nguyễn Trãi, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1699,18,302,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1700,19,302,'2018-05-31 17:59:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1701,20,302,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1702,28,302,'174508','text',NULL,174508.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1703,38,302,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1704,34,303,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1705,14,303,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1706,16,303,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1707,35,304,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1708,10,304,'302','text',NULL,302.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1709,12,304,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1710,13,304,'303','text',NULL,303.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1711,25,304,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1712,17,305,'Lê Văn Lương, Thanh Xuân, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1713,18,305,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1714,19,305,'2018-05-07 18:18:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1715,20,305,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1716,28,305,'160214','text',NULL,160214.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1717,38,305,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1718,34,306,'test','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1719,14,306,'21321313','text',NULL,21321313.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1720,16,306,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1721,35,307,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1722,10,307,'305','text',NULL,305.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1723,12,307,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1724,13,307,'306','text',NULL,306.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1725,25,307,'tưewe','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1726,26,307,'ưerwerwer','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1727,17,308,'Tây Hồ, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1728,18,308,'Sân bay Nội Bài (HAN), Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1729,19,308,'2018-05-07 21:25:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1730,20,308,'Xe 7 cho','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1731,28,308,'135000','text',NULL,135000.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1732,38,308,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1733,34,309,'Testttt','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1734,14,309,'Test','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1735,15,309,'abc@gmail.com','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1736,16,309,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1737,35,310,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1738,10,310,'308','text',NULL,308.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1739,12,310,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1740,13,310,'309','text',NULL,309.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1741,25,310,'vào trong ngõ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1742,26,310,'tttt','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1743,17,311,'583 Nguyễn Trãi, Hà Đông, Hanoi, Vietnam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1744,18,311,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hanoi, Vietnam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1745,19,311,'2018-05-08 11:02:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1746,20,311,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1747,28,311,'173997','text',NULL,173997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1748,38,311,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1749,34,312,'Trần Thanh Tùng','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1750,14,312,'0978625621','text',NULL,978625621.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1751,16,312,'2','text',NULL,2.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1752,35,313,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1753,10,313,'311','text',NULL,311.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1754,12,313,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1755,13,313,'312','text',NULL,312.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1756,25,313,'ha noi','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1757,17,314,'583 Nguyễn Trãi, Hà Đông, Hà Nội, Việt Nam','text',NULL,583.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1758,18,314,'Sân Bay Nội Bài, Phú Cường, Sóc Sơn, Hà Nội, Việt Nam','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1759,19,314,'2018-05-17 14:41:00','text',NULL,2018.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1760,20,314,'xe 4 cho ','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1761,28,314,'188997','text',NULL,188997.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1762,38,314,'9','text',9,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1763,34,315,'Tran aaa Tung aaa','text',NULL,0.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1764,14,315,'0909','text',NULL,909.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1765,16,315,'1','text',NULL,1.0000,'');
INSERT INTO `b_iblock_element_property` VALUES (1766,35,316,'6','text',6,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1767,10,316,'314','text',NULL,314.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1768,12,316,'4','text',4,NULL,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1769,13,316,'315','text',NULL,315.0000,NULL);
INSERT INTO `b_iblock_element_property` VALUES (1770,25,316,'Hai Ba Trung, Pho Hue','text',NULL,0.0000,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_fields`
-- 




DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50)  NOT NULL,
  `IS_REQUIRED` char(1)  DEFAULT NULL,
  `DEFAULT_VALUE` longtext ,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_fields`
-- 


INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (5,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (5,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (5,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (5,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (5,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (5,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (5,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (5,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (5,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (5,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (5,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (6,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (6,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (6,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (6,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (6,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (6,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (6,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (6,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (6,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (7,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (7,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (7,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (7,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (7,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (7,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (7,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (7,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (7,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (7,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (8,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (8,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (8,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (8,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (8,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (8,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (8,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (8,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'CODE','Y','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (8,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (8,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (9,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (9,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (9,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (9,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (9,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (9,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (9,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (9,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (9,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (9,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (10,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (10,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (10,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (10,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (10,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (10,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (10,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (10,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (10,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (10,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (11,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (11,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (11,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (11,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (11,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (11,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (11,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (11,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (11,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (11,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (12,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (12,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (12,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (12,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (12,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (12,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (12,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (12,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (12,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (12,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (13,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (13,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (13,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (13,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (13,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (13,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (13,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (13,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (13,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (13,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (14,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (14,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (14,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (14,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (14,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (14,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (14,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (14,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (14,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (14,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (15,'IBLOCK_SECTION','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'ACTIVE','Y','Y');
INSERT INTO `b_iblock_fields` VALUES (15,'ACTIVE_FROM','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'ACTIVE_TO','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'SORT','N','0');
INSERT INTO `b_iblock_fields` VALUES (15,'NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (15,'PREVIEW_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (15,'PREVIEW_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (15,'PREVIEW_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (15,'DETAIL_TEXT_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (15,'DETAIL_TEXT','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (15,'TAGS','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_NAME','Y','');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_PICTURE','N','a:9:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_DESCRIPTION_TYPE','Y','text');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_DESCRIPTION','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_DETAIL_PICTURE','N','a:6:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;}');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_XML_ID','N','');
INSERT INTO `b_iblock_fields` VALUES (15,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"_\";s:11:\"TRANS_OTHER\";s:1:\"_\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_group`
-- 




DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1)  NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_group`
-- 


INSERT INTO `b_iblock_group` VALUES (5,1,'X');
INSERT INTO `b_iblock_group` VALUES (5,2,'R');
INSERT INTO `b_iblock_group` VALUES (6,2,'R');
INSERT INTO `b_iblock_group` VALUES (6,1,'X');
INSERT INTO `b_iblock_group` VALUES (7,2,'R');
INSERT INTO `b_iblock_group` VALUES (7,1,'X');
INSERT INTO `b_iblock_group` VALUES (8,2,'R');
INSERT INTO `b_iblock_group` VALUES (8,1,'X');
INSERT INTO `b_iblock_group` VALUES (9,2,'R');
INSERT INTO `b_iblock_group` VALUES (9,1,'X');
INSERT INTO `b_iblock_group` VALUES (10,2,'R');
INSERT INTO `b_iblock_group` VALUES (10,1,'X');
INSERT INTO `b_iblock_group` VALUES (9,3,'X');
INSERT INTO `b_iblock_group` VALUES (11,2,'R');
INSERT INTO `b_iblock_group` VALUES (11,1,'X');
INSERT INTO `b_iblock_group` VALUES (12,2,'R');
INSERT INTO `b_iblock_group` VALUES (12,1,'X');
INSERT INTO `b_iblock_group` VALUES (13,2,'R');
INSERT INTO `b_iblock_group` VALUES (13,1,'X');
INSERT INTO `b_iblock_group` VALUES (14,2,'X');
INSERT INTO `b_iblock_group` VALUES (15,2,'X');
INSERT INTO `b_iblock_group` VALUES (14,1,'X');
INSERT INTO `b_iblock_group` VALUES (15,1,'X');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_messages`
-- 




DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50)  NOT NULL,
  `MESSAGE_TEXT` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_messages`
-- 


INSERT INTO `b_iblock_messages` VALUES (5,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (5,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (5,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (5,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (5,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (5,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (5,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (5,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (5,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (5,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (6,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (6,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (6,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (6,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (6,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (6,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (6,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (6,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (6,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (6,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (7,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (7,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (7,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (7,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (7,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (7,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (7,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (7,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (7,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (7,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (8,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (8,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (8,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (8,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (8,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (8,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (8,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (8,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (8,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (8,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (9,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (9,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (9,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (9,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (9,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (9,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (9,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (9,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (9,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (9,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (10,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (10,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (10,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (10,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (10,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (10,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (10,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (10,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (10,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (10,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (11,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (11,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (11,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (11,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (11,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (11,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (11,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (11,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (11,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (11,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (12,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (12,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (12,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (12,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (12,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (12,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (12,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (12,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (12,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (12,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (13,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (13,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (13,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (13,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (13,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (13,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (13,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (13,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (13,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (13,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (14,'SECTION_DELETE','Delete section');
INSERT INTO `b_iblock_messages` VALUES (14,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (14,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (14,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (14,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (14,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (14,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (14,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (14,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (14,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (15,'ELEMENT_NAME','Element');
INSERT INTO `b_iblock_messages` VALUES (15,'ELEMENTS_NAME','Elements');
INSERT INTO `b_iblock_messages` VALUES (15,'ELEMENT_ADD','Add element');
INSERT INTO `b_iblock_messages` VALUES (15,'ELEMENT_EDIT','Modify element');
INSERT INTO `b_iblock_messages` VALUES (15,'ELEMENT_DELETE','Delete element');
INSERT INTO `b_iblock_messages` VALUES (15,'SECTION_NAME','Section');
INSERT INTO `b_iblock_messages` VALUES (15,'SECTIONS_NAME','Sections');
INSERT INTO `b_iblock_messages` VALUES (15,'SECTION_ADD','Add section');
INSERT INTO `b_iblock_messages` VALUES (15,'SECTION_EDIT','Modify section');
INSERT INTO `b_iblock_messages` VALUES (15,'SECTION_DELETE','Delete section');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_property`
-- 




DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(100)  NOT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50)  DEFAULT NULL,
  `DEFAULT_VALUE` text ,
  `PROPERTY_TYPE` char(1)  NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1)  NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1)  NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100)  DEFAULT NULL,
  `FILE_TYPE` varchar(200)  DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40)  DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1)  DEFAULT NULL,
  `SEARCHABLE` char(1)  NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1)  NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1)  DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255)  DEFAULT NULL,
  `USER_TYPE_SETTINGS` text ,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_property`
-- 


INSERT INTO `b_iblock_property` VALUES (36,'2017-12-12 13:25:58',7,'Tọa độ điểm đi','Y',500,'TOA_DO_DIEM_DON','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (35,'2017-12-12 09:17:00',5,'Trạng thái','Y',500,'TRANG_THAI','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (10,'2017-12-08 13:44:03',5,'Thông tin chuyến','Y',500,'CHUYEN_ID','','E',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (12,'2017-12-08 13:44:55',5,'Hình thức thanh toán','Y',500,'HINH_THUC_TT','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (34,'2017-12-12 08:38:51',6,'Họ và tên','Y',500,'FULL_NAME','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (13,'2017-12-08 13:46:21',5,'Thông tin khách hàng','Y',500,'KHACH_HANG_ID','','E',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (14,'2017-12-12 08:12:39',6,'Điện thoại','Y',500,'PHONE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (15,'2017-12-08 13:47:38',6,'Email','Y',500,'EMAIL','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (16,'2017-12-08 13:48:00',6,'Người dùng hệ thống','Y',500,'USER_ID',NULL,'S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,'UserID',NULL);
INSERT INTO `b_iblock_property` VALUES (17,'2017-12-12 08:05:44',7,'Điểm đi','Y',500,'DIA_DIEM_DON','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (18,'2017-12-12 08:05:44',7,'Điểm đến','Y',500,'DIA_DIEM_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (19,'2017-12-08 13:51:32',7,'Thời gian','Y',500,'THOI_GIAN',NULL,'S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,'DateTime',NULL);
INSERT INTO `b_iblock_property` VALUES (20,'2017-12-08 13:51:32',7,'Số chỗ ngồi','Y',500,'SO_CHO_NGOI','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (21,'2017-12-12 08:05:44',7,'Hãng xe','Y',500,'HANG_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (22,'2017-12-08 13:52:23',7,'Màu xe','Y',500,'MAU_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (23,'2017-12-08 13:52:23',7,'Số lượng khách','Y',500,'SO_LUONG','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (24,'2017-12-12 08:07:02',7,'Tài xế','Y',500,'TAI_XE_NAME','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (25,'2017-12-12 08:11:24',5,'Địa chỉ trả chi tiết','Y',500,'DIA_CHI_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (26,'2017-12-12 07:48:56',5,'Ghi chú','Y',500,'GHI_CHU','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (27,'2017-12-12 08:11:24',5,'Muốn đăng ký ?','Y',500,'DANG_KY_THANH_VIEN','','L',1,30,'C','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (28,'2017-12-12 08:09:15',7,'Giá chuẩn','Y',500,'GIA_CHUAN','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (29,'2017-12-12 08:05:44',7,'Loại xe','Y',500,'LOAI_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (30,'2017-12-12 08:07:02',7,'Kiểu xe','Y',500,'KIEU_XE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (31,'2017-12-12 08:07:02',7,'Tài xế ID','Y',500,'TAI_XE_ID','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (32,'2017-12-12 08:07:02',7,'Xe ID','Y',500,'XE_ID','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (33,'2017-12-12 08:09:15',7,'Giá yêu cầu','Y',500,'GIA_YEU_CAU','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (37,'2017-12-12 13:25:58',7,'Tọa đổ điểm đến','Y',500,'TOA_DO_DIEM_TRA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (38,'2017-12-12 13:28:22',7,'Trạng thái','Y',500,'TRANG_THAI','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (39,'2017-12-14 16:04:45',7,'Giá thu mỗi km','Y',500,'GIA_MOT_KM','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (40,'2017-12-14 16:04:45',7,'Khoảng cách','Y',500,'KHOANG_CACH','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (41,'2018-04-25 15:11:28',11,'Giờ mở cửa','Y',500,'GIO_MO_CUA','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (42,'2018-04-25 15:11:28',11,'Điện thoại','Y',500,'DIEN_THOAI','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (43,'2018-04-25 15:11:28',11,'Địa chỉ','Y',500,'DIA_CHI','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (44,'2018-04-25 15:41:06',11,'Đánh giá','Y',500,'DANH_GIA','','L',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (45,'2018-04-25 16:52:04',11,'Hình ảnh','Y',500,'HINH_ANH','','F',1,30,'L','Y',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (46,'2018-05-07 14:26:04',14,'loại xe','Y',500,'LOAI_XE','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (47,'2018-05-07 14:26:26',14,'giá xe','Y',500,'GIA_XE','','N',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);
INSERT INTO `b_iblock_property` VALUES (48,'2018-05-07 17:05:17',15,'code','Y',500,'CODE','','S',1,30,'L','N',NULL,'',5,NULL,0,'','N','N','N',1,NULL,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_property_enum`
-- 




DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255)  NOT NULL,
  `DEF` char(1)  NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200)  NOT NULL,
  `TMP_ID` varchar(40)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_property_enum`
-- 


INSERT INTO `b_iblock_property_enum` VALUES (4,12,'Trả sau','N',500,'tra_sau',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (5,27,'Y','N',500,'f32a1f4cd6aa30649271bddfd3498ab2',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (6,35,'Đang chờ xác nhận','N',500,'confirm',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (7,35,'APK Đã xác nhận','N',500,'confirmed',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (8,35,'Hủy chuyến','N',500,'cancel',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (9,38,'Chưa xuất phát','N',500,'chua_bat_dau',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (10,38,'Đang chạy','N',500,'dang_chay',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (11,38,'Hủy chạy','N',500,'huy_chay',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (12,38,'Kết thúc','N',500,'ket_thuc',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (13,38,'Đã xác nhận','N',500,'da_xac_nhan',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (14,44,'1','N',500,'1',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (15,44,'2','N',500,'2',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (16,44,'3','N',500,'3',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (17,44,'4','N',500,'4',NULL);
INSERT INTO `b_iblock_property_enum` VALUES (18,44,'5','N',500,'5',NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_rss`
-- 




DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50)  NOT NULL,
  `NODE_VALUE` varchar(250)  DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_section`
-- 




DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255)  NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text ,
  `DESCRIPTION_TYPE` char(4)  NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text ,
  `CODE` varchar(255)  DEFAULT NULL,
  `XML_ID` varchar(255)  DEFAULT NULL,
  `TMP_ID` varchar(40)  DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_section_element`
-- 




DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_sequence`
-- 




DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50)  NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_site`
-- 




DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2)  NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_site`
-- 


INSERT INTO `b_iblock_site` VALUES (5,'s1');
INSERT INTO `b_iblock_site` VALUES (6,'s1');
INSERT INTO `b_iblock_site` VALUES (7,'s1');
INSERT INTO `b_iblock_site` VALUES (8,'s1');
INSERT INTO `b_iblock_site` VALUES (9,'s1');
INSERT INTO `b_iblock_site` VALUES (10,'s1');
INSERT INTO `b_iblock_site` VALUES (11,'s1');
INSERT INTO `b_iblock_site` VALUES (12,'s1');
INSERT INTO `b_iblock_site` VALUES (13,'s1');
INSERT INTO `b_iblock_site` VALUES (14,'s1');
INSERT INTO `b_iblock_site` VALUES (15,'s1');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_type`
-- 




DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50)  NOT NULL,
  `SECTIONS` char(1)  NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255)  DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255)  DEFAULT NULL,
  `IN_RSS` char(1)  NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_type`
-- 


INSERT INTO `b_iblock_type` VALUES ('vn','Y','','','N',500);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_iblock_type_lang`
-- 




DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50)  NOT NULL,
  `LID` char(2)  NOT NULL,
  `NAME` varchar(100)  NOT NULL,
  `SECTION_NAME` varchar(100)  DEFAULT NULL,
  `ELEMENT_NAME` varchar(100)  NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_iblock_type_lang`
-- 


INSERT INTO `b_iblock_type_lang` VALUES ('vn','en','Tieng Viet','','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_lang`
-- 




DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2)  NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1)  NOT NULL DEFAULT 'N',
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `NAME` varchar(50)  NOT NULL,
  `DIR` varchar(50)  NOT NULL,
  `FORMAT_DATE` varchar(50)  NOT NULL,
  `FORMAT_DATETIME` varchar(50)  NOT NULL,
  `CHARSET` varchar(255)  DEFAULT NULL,
  `LANGUAGE_ID` char(2)  NOT NULL,
  `DOC_ROOT` varchar(255)  DEFAULT NULL,
  `DOMAIN_LIMITED` char(1)  NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255)  DEFAULT NULL,
  `SITE_NAME` varchar(255)  DEFAULT NULL,
  `EMAIL` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_lang`
-- 


INSERT INTO `b_lang` VALUES ('s1',1,'Y','Y','Web Go','/','DD/MM/YYYY','DD/MM/YYYY HH:MI:SS','UTF-8','en','','N','','Web Go','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_lang_domain`
-- 




DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2)  NOT NULL,
  `DOMAIN` varchar(255)  NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_language`
-- 




DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2)  NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1)  NOT NULL DEFAULT 'N',
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `NAME` varchar(50)  NOT NULL,
  `FORMAT_DATE` varchar(50)  NOT NULL,
  `FORMAT_DATETIME` varchar(50)  NOT NULL,
  `CHARSET` varchar(255)  DEFAULT NULL,
  `DIRECTION` char(1)  NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`LID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_language`
-- 


INSERT INTO `b_language` VALUES ('en',1,'Y','Y','English','MM/DD/YYYY','MM/DD/YYYY HH:MI:SS','UTF-8','Y');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_medialib_collection`
-- 




DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255)  NOT NULL,
  `DESCRIPTION` text ,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2)  DEFAULT NULL,
  `KEYWORDS` varchar(255)  DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_medialib_collection`
-- 


INSERT INTO `b_medialib_collection` VALUES (1,'TuyenDung','','Y','2018-03-31 00:59:43',1,0,NULL,'',NULL,1);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_medialib_collection_item`
-- 




DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_medialib_collection_item`
-- 


INSERT INTO `b_medialib_collection_item` VALUES (1,1);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_medialib_item`
-- 




DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255)  NOT NULL,
  `ITEM_TYPE` char(30)  NOT NULL,
  `DESCRIPTION` text ,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255)  DEFAULT NULL,
  `SEARCHABLE_CONTENT` text ,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_medialib_item`
-- 


INSERT INTO `b_medialib_item` VALUES (1,'DoiNgu.jpg','','','2018-03-31 00:59:51','2018-03-31 00:59:51',40,'','{DOINGU}{JPG}');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_medialib_type`
-- 




DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255)  DEFAULT NULL,
  `CODE` varchar(255)  NOT NULL,
  `EXT` varchar(255)  NOT NULL,
  `SYSTEM` char(1)  NOT NULL DEFAULT 'N',
  `DESCRIPTION` text ,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_medialib_type`
-- 


INSERT INTO `b_medialib_type` VALUES (1,'image_name','image','jpg,jpeg,gif,png','Y','image_desc');
INSERT INTO `b_medialib_type` VALUES (2,'video_name','video','flv,mp4,wmv','Y','video_desc');
INSERT INTO `b_medialib_type` VALUES (3,'sound_name','sound','mp3,wma,aac','Y','sound_desc');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_module`
-- 




DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50)  NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_module`
-- 


INSERT INTO `b_module` VALUES ('main','2010-11-08 12:08:16');
INSERT INTO `b_module` VALUES ('compression','2010-11-08 12:08:49');
INSERT INTO `b_module` VALUES ('fileman','2010-11-08 12:08:52');
INSERT INTO `b_module` VALUES ('iblock','2010-11-08 12:09:13');
INSERT INTO `b_module` VALUES ('perfmon','2010-11-08 12:09:43');
INSERT INTO `b_module` VALUES ('search','2010-11-08 12:09:47');
INSERT INTO `b_module` VALUES ('seo','2010-11-08 12:09:52');
INSERT INTO `b_module` VALUES ('sitecorporate','2010-11-08 12:09:57');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_module_group`
-- 




DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50)  NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255)  NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_module_group`
-- 


INSERT INTO `b_module_group` VALUES (3,'perfmon',3,'R');
INSERT INTO `b_module_group` VALUES (2,'main',3,'W');
INSERT INTO `b_module_group` VALUES (4,'sitecorporate',3,'R');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_module_to_module`
-- 




DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50)  NOT NULL,
  `MESSAGE_ID` varchar(50)  NOT NULL,
  `TO_MODULE_ID` varchar(50)  NOT NULL,
  `TO_PATH` varchar(255)  DEFAULT NULL,
  `TO_CLASS` varchar(50)  DEFAULT NULL,
  `TO_METHOD` varchar(50)  DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`,`MESSAGE_ID`,`TO_MODULE_ID`,`TO_CLASS`,`TO_METHOD`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_module_to_module`
-- 


INSERT INTO `b_module_to_module` VALUES (1,'2010-11-08 12:08:16',100,'iblock','OnIBlockPropertyBuildList','main','/modules/main/tools/prop_userid.php','CIBlockPropertyUserID','GetUserTypeDescription','');
INSERT INTO `b_module_to_module` VALUES (2,'2010-11-08 12:08:16',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnUserDelete','');
INSERT INTO `b_module_to_module` VALUES (3,'2010-11-08 12:08:16',100,'main','OnLanguageDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnLanguageDelete','');
INSERT INTO `b_module_to_module` VALUES (4,'2010-11-08 12:08:16',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CUserOptions','OnUserDelete','');
INSERT INTO `b_module_to_module` VALUES (5,'2010-11-08 12:08:16',100,'main','OnChangeFile','main','','CMain','OnChangeFileComponent','');
INSERT INTO `b_module_to_module` VALUES (6,'2010-11-08 12:08:16',100,'main','OnUserTypeRightsCheck','main','','CUser','UserTypeRightsCheck','');
INSERT INTO `b_module_to_module` VALUES (7,'2010-11-08 12:08:16',100,'main','OnUserLogin','main','','UpdateTools','CheckUpdates','');
INSERT INTO `b_module_to_module` VALUES (8,'2010-11-08 12:08:16',100,'main','OnModuleUpdate','main','','UpdateTools','SetUpdateResult','');
INSERT INTO `b_module_to_module` VALUES (9,'2010-11-08 12:08:16',100,'main','OnUpdateCheck','main','','UpdateTools','SetUpdateError','');
INSERT INTO `b_module_to_module` VALUES (10,'2010-11-08 12:08:16',100,'main','OnPanelCreate','main','','CUndo','CheckNotifyMessage','');
INSERT INTO `b_module_to_module` VALUES (11,'2010-11-08 12:08:49',1,'main','OnPageStart','compression','','CCompress','OnPageStart','');
INSERT INTO `b_module_to_module` VALUES (12,'2010-11-08 12:08:49',10000,'main','OnAfterEpilog','compression','','CCompress','OnAfterEpilog','');
INSERT INTO `b_module_to_module` VALUES (13,'2010-11-08 12:08:52',100,'main','OnGroupDelete','fileman','','CFileman','OnGroupDelete','');
INSERT INTO `b_module_to_module` VALUES (14,'2010-11-08 12:08:52',100,'main','OnPanelCreate','fileman','','CFileman','OnPanelCreate','');
INSERT INTO `b_module_to_module` VALUES (15,'2010-11-08 12:08:52',100,'main','OnModuleUpdate','fileman','','CFileman','OnModuleUpdate','');
INSERT INTO `b_module_to_module` VALUES (16,'2010-11-08 12:08:52',100,'main','OnModuleInstalled','fileman','','CFileman','ClearComponentsListCache','');
INSERT INTO `b_module_to_module` VALUES (17,'2010-11-08 12:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapGoogle','GetUserTypeDescription','');
INSERT INTO `b_module_to_module` VALUES (18,'2010-11-08 12:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapYandex','GetUserTypeDescription','');
INSERT INTO `b_module_to_module` VALUES (19,'2010-11-08 12:08:52',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyVideo','GetUserTypeDescription','');
INSERT INTO `b_module_to_module` VALUES (20,'2010-11-08 12:08:52',100,'main','OnUserTypeBuildList','fileman','','CUserTypeVideo','GetUserTypeDescription','');
INSERT INTO `b_module_to_module` VALUES (21,'2010-11-08 12:09:13',100,'main','OnGroupDelete','iblock','','CIBlock','OnGroupDelete','');
INSERT INTO `b_module_to_module` VALUES (22,'2010-11-08 12:09:13',100,'main','OnBeforeLangDelete','iblock','','CIBlock','OnBeforeLangDelete','');
INSERT INTO `b_module_to_module` VALUES (23,'2010-11-08 12:09:13',100,'main','OnLangDelete','iblock','','CIBlock','OnLangDelete','');
INSERT INTO `b_module_to_module` VALUES (24,'2010-11-08 12:09:13',100,'main','OnUserTypeRightsCheck','iblock','','CIBlockSection','UserTypeRightsCheck','');
INSERT INTO `b_module_to_module` VALUES (25,'2010-11-08 12:09:13',100,'search','OnReindex','iblock','','CIBlock','OnSearchReindex','');
INSERT INTO `b_module_to_module` VALUES (26,'2010-11-08 12:09:13',100,'search','OnSearchGetURL','iblock','','CIBlock','OnSearchGetURL','');
INSERT INTO `b_module_to_module` VALUES (27,'2010-11-08 12:09:47',100,'main','OnChangePermissions','search','','CSearch','OnChangeFilePermissions','');
INSERT INTO `b_module_to_module` VALUES (28,'2010-11-08 12:09:47',100,'main','OnChangeFile','search','','CSearch','OnChangeFile','');
INSERT INTO `b_module_to_module` VALUES (29,'2010-11-08 12:09:47',100,'main','OnGroupDelete','search','','CSearch','OnGroupDelete','');
INSERT INTO `b_module_to_module` VALUES (30,'2010-11-08 12:09:47',100,'main','OnLangDelete','search','','CSearch','OnLangDelete','');
INSERT INTO `b_module_to_module` VALUES (31,'2010-11-08 12:09:47',90,'main','OnEpilog','search','','CSearchStatistic','OnEpilog','');
INSERT INTO `b_module_to_module` VALUES (32,'2010-11-08 12:09:52',100,'main','OnPanelCreate','seo','','CSeoEventHandlers','SeoOnPanelCreate','');
INSERT INTO `b_module_to_module` VALUES (33,'2010-11-08 12:09:57',100,'main','OnBeforeProlog','sitecorporate','','CSiteCorporate','ShowPanel','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_operation`
-- 




DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50)  NOT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  `BINDING` varchar(50)  DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_operation`
-- 


INSERT INTO `b_operation` VALUES (1,'view_own_profile','main',NULL,'module');
INSERT INTO `b_operation` VALUES (2,'view_subordinate_users','main',NULL,'module');
INSERT INTO `b_operation` VALUES (3,'view_all_users','main',NULL,'module');
INSERT INTO `b_operation` VALUES (4,'view_groups','main',NULL,'module');
INSERT INTO `b_operation` VALUES (5,'view_tasks','main',NULL,'module');
INSERT INTO `b_operation` VALUES (6,'view_other_settings','main',NULL,'module');
INSERT INTO `b_operation` VALUES (7,'edit_own_profile','main',NULL,'module');
INSERT INTO `b_operation` VALUES (8,'edit_all_users','main',NULL,'module');
INSERT INTO `b_operation` VALUES (9,'edit_subordinate_users','main',NULL,'module');
INSERT INTO `b_operation` VALUES (10,'edit_groups','main',NULL,'module');
INSERT INTO `b_operation` VALUES (11,'edit_tasks','main',NULL,'module');
INSERT INTO `b_operation` VALUES (12,'edit_other_settings','main',NULL,'module');
INSERT INTO `b_operation` VALUES (13,'cache_control','main',NULL,'module');
INSERT INTO `b_operation` VALUES (14,'edit_php','main',NULL,'module');
INSERT INTO `b_operation` VALUES (15,'fm_view_permission','main',NULL,'file');
INSERT INTO `b_operation` VALUES (16,'fm_edit_permission','main',NULL,'file');
INSERT INTO `b_operation` VALUES (17,'fm_edit_existent_folder','main',NULL,'file');
INSERT INTO `b_operation` VALUES (18,'fm_create_new_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (19,'fm_edit_existent_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (20,'fm_create_new_folder','main',NULL,'file');
INSERT INTO `b_operation` VALUES (21,'fm_delete_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (22,'fm_delete_folder','main',NULL,'file');
INSERT INTO `b_operation` VALUES (23,'fm_view_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (24,'fm_view_listing','main',NULL,'file');
INSERT INTO `b_operation` VALUES (25,'fm_edit_in_workflow','main',NULL,'file');
INSERT INTO `b_operation` VALUES (26,'fm_rename_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (27,'fm_rename_folder','main',NULL,'file');
INSERT INTO `b_operation` VALUES (28,'fm_upload_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (29,'fm_add_to_menu','main',NULL,'file');
INSERT INTO `b_operation` VALUES (30,'fm_download_file','main',NULL,'file');
INSERT INTO `b_operation` VALUES (31,'fm_lpa','main',NULL,'file');
INSERT INTO `b_operation` VALUES (32,'lpa_template_edit','main',NULL,'module');
INSERT INTO `b_operation` VALUES (33,'view_event_log','main',NULL,'module');
INSERT INTO `b_operation` VALUES (34,'fileman_view_all_settings','fileman','','module');
INSERT INTO `b_operation` VALUES (35,'fileman_edit_menu_types','fileman','','module');
INSERT INTO `b_operation` VALUES (36,'fileman_add_element_to_menu','fileman','','module');
INSERT INTO `b_operation` VALUES (37,'fileman_edit_menu_elements','fileman','','module');
INSERT INTO `b_operation` VALUES (38,'fileman_edit_existent_files','fileman','','module');
INSERT INTO `b_operation` VALUES (39,'fileman_edit_existent_folders','fileman','','module');
INSERT INTO `b_operation` VALUES (40,'fileman_admin_files','fileman','','module');
INSERT INTO `b_operation` VALUES (41,'fileman_admin_folders','fileman','','module');
INSERT INTO `b_operation` VALUES (42,'fileman_view_permissions','fileman','','module');
INSERT INTO `b_operation` VALUES (43,'fileman_edit_all_settings','fileman','','module');
INSERT INTO `b_operation` VALUES (44,'fileman_upload_files','fileman','','module');
INSERT INTO `b_operation` VALUES (45,'fileman_view_file_structure','fileman','','module');
INSERT INTO `b_operation` VALUES (46,'fileman_install_control','fileman','','module');
INSERT INTO `b_operation` VALUES (47,'medialib_view_collection','fileman','','medialib');
INSERT INTO `b_operation` VALUES (48,'medialib_new_collection','fileman','','medialib');
INSERT INTO `b_operation` VALUES (49,'medialib_edit_collection','fileman','','medialib');
INSERT INTO `b_operation` VALUES (50,'medialib_del_collection','fileman','','medialib');
INSERT INTO `b_operation` VALUES (51,'medialib_access','fileman','','medialib');
INSERT INTO `b_operation` VALUES (52,'medialib_new_item','fileman','','medialib');
INSERT INTO `b_operation` VALUES (53,'medialib_edit_item','fileman','','medialib');
INSERT INTO `b_operation` VALUES (54,'medialib_del_item','fileman','','medialib');
INSERT INTO `b_operation` VALUES (55,'seo_settings','seo','','module');
INSERT INTO `b_operation` VALUES (56,'seo_tools','seo','','module');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_option`
-- 




DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50)  DEFAULT NULL,
  `NAME` varchar(50)  NOT NULL,
  `VALUE` text ,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  `SITE_ID` char(2)  DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_option`
-- 


INSERT INTO `b_option` VALUES ('main','auth_comp2','Y','Use Components 2.0 for authorization and registration:',NULL);
INSERT INTO `b_option` VALUES ('main','PARAM_MAX_SITES','2','',NULL);
INSERT INTO `b_option` VALUES ('main','PARAM_MAX_USERS','0','',NULL);
INSERT INTO `b_option` VALUES ('main','distributive6','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','new_license7_sign','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','GROUP_DEFAULT_TASK','1','Task for groups by default',NULL);
INSERT INTO `b_option` VALUES ('main','vendor','bitrix','',NULL);
INSERT INTO `b_option` VALUES ('main','admin_lid','en','',NULL);
INSERT INTO `b_option` VALUES ('main','update_site','www.bitrixsoft.com','Name of system update server:',NULL);
INSERT INTO `b_option` VALUES ('main','update_site_ns','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','server_uniq_id','961954a83f50903dc1616f729ece7ad7','',NULL);
INSERT INTO `b_option` VALUES ('main','email_from','dqhung.ec@gmail.com','E-mail of the site administrator (default sender address)',NULL);
INSERT INTO `b_option` VALUES ('fileman','different_set','Y','',NULL);
INSERT INTO `b_option` VALUES ('fileman','menutypes','a:3:{s:4:\\\"left\\\";s:12:\\\"Section menu\\\";s:3:\\\"top\\\";s:9:\\\"Main menu\\\";s:6:\\\"bottom\\\";s:11:\\\"Bottom Menu\\\";}','','s1');
INSERT INTO `b_option` VALUES ('main','wizard_template_id','furniture','','s1');
INSERT INTO `b_option` VALUES ('main','wizard_site_logo','0','','s1');
INSERT INTO `b_option` VALUES ('main','wizard_furniture_theme_id','dark-blue','','s1');
INSERT INTO `b_option` VALUES ('main','wizard_firstcorp_furniture_s1','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','wizard_solution','corp_furniture','','s1');
INSERT INTO `b_option` VALUES ('main','site_name','Webmin','Site name',NULL);
INSERT INTO `b_option` VALUES ('main','server_name','localhost','Site URL (without http://). E.g., www.mysite.com',NULL);
INSERT INTO `b_option` VALUES ('main','cookie_name','BITRIX_SM','Cookies name prefix (without dots and spaces):',NULL);
INSERT INTO `b_option` VALUES ('main','ALLOW_SPREAD_COOKIE','Y','Spread cookies to all sites:',NULL);
INSERT INTO `b_option` VALUES ('main','header_200','N','Replace status 404 with 200 in header:',NULL);
INSERT INTO `b_option` VALUES ('main','error_reporting','85','Error report mode:',NULL);
INSERT INTO `b_option` VALUES ('main','templates_visual_editor','N','Use WYSIWYG editor for Site Templates:',NULL);
INSERT INTO `b_option` VALUES ('main','all_bcc','','One or comma-separated list of E-mail addresses to receive copies of all outcoming messages',NULL);
INSERT INTO `b_option` VALUES ('main','send_mid','N','Send email event and template identifiers in message:',NULL);
INSERT INTO `b_option` VALUES ('main','fill_to_mail','N','E-mail address in caption',NULL);
INSERT INTO `b_option` VALUES ('main','CONVERT_UNIX_NEWLINE_2_WINDOWS','N','Convert Unix new lines to Windows format when sending messages:',NULL);
INSERT INTO `b_option` VALUES ('main','convert_mail_header','Y','Convert 8-bit characters in the message header:',NULL);
INSERT INTO `b_option` VALUES ('main','mail_event_period','14','Days to keep e-mail events:',NULL);
INSERT INTO `b_option` VALUES ('main','mail_event_bulk','5','Messages to send at a page request:',NULL);
INSERT INTO `b_option` VALUES ('main','mail_additional_parameters','','Additional parameter for mail() function:',NULL);
INSERT INTO `b_option` VALUES ('main','disk_space','','Available disk space (MB):',NULL);
INSERT INTO `b_option` VALUES ('main','upload_dir','upload','File upload default folder',NULL);
INSERT INTO `b_option` VALUES ('main','save_original_file_name','N','Keep the original names for uploaded files:',NULL);
INSERT INTO `b_option` VALUES ('main','convert_original_file_name','Y','Automatically replace non-valid symbols in the names of uploaded files:',NULL);
INSERT INTO `b_option` VALUES ('main','image_resize_quality','95','JPEG compression quality (percentage):',NULL);
INSERT INTO `b_option` VALUES ('main','map_top_menu_type','top','Menu type for the top level of the site map:',NULL);
INSERT INTO `b_option` VALUES ('main','map_left_menu_type','left','Menu type for other levels of the site map:',NULL);
INSERT INTO `b_option` VALUES ('main','update_site_proxy_addr','','Proxy address for update system:',NULL);
INSERT INTO `b_option` VALUES ('main','update_site_proxy_port','','Proxy port for update system:',NULL);
INSERT INTO `b_option` VALUES ('main','update_site_proxy_user','admin','Proxy user name (if auth requied)',NULL);
INSERT INTO `b_option` VALUES ('main','update_site_proxy_pass','123456','Proxy user password (if auth requied)',NULL);
INSERT INTO `b_option` VALUES ('main','strong_update_check','Y','Stress checking the integrity of the updates installation:',NULL);
INSERT INTO `b_option` VALUES ('main','stable_versions_only','Y','Download only stable updates:',NULL);
INSERT INTO `b_option` VALUES ('main','update_autocheck','','Autocheck For Updates:',NULL);
INSERT INTO `b_option` VALUES ('main','update_stop_autocheck','N','Abort Authocheck When Error(s) Occur:',NULL);
INSERT INTO `b_option` VALUES ('main','update_is_gzip_installed','Y','Don\'t Use Compression:',NULL);
INSERT INTO `b_option` VALUES ('main','update_load_timeout','30','Download Step Duration (sec):',NULL);
INSERT INTO `b_option` VALUES ('main','store_password','Y','Allow authorization caching:',NULL);
INSERT INTO `b_option` VALUES ('main','use_secure_password_cookies','N','Use secure storing of the authorization data in cookies:',NULL);
INSERT INTO `b_option` VALUES ('main','auth_multisite','N','Global authentication for all site domains:',NULL);
INSERT INTO `b_option` VALUES ('main','captcha_registration','N','Use CAPTCHA:',NULL);
INSERT INTO `b_option` VALUES ('main','auth_openid','N','Use OpenID',NULL);
INSERT INTO `b_option` VALUES ('main','auth_liveid','N','Use Live ID authentication:',NULL);
INSERT INTO `b_option` VALUES ('main','liveid_appid','','Live ID Application ID:',NULL);
INSERT INTO `b_option` VALUES ('main','liveid_secret','','Live ID Secret Key:',NULL);
INSERT INTO `b_option` VALUES ('main','new_user_registration','Y','Allow users to self-register?',NULL);
INSERT INTO `b_option` VALUES ('main','new_user_registration_def_group','','Upon registration, add to group:',NULL);
INSERT INTO `b_option` VALUES ('main','new_user_registration_email_confirmation','N','Send request for registration confirmation:</label><br><a href=\"/webmin/admin/message_admin.php?lang=en&set_filter=Y&find_type_id=NEW_USER_CONFIRM\">Edit e-mail templates</a><label>',NULL);
INSERT INTO `b_option` VALUES ('main','new_user_registration_cleanup_days','7','Delete unconfirmed registrations after (days):',NULL);
INSERT INTO `b_option` VALUES ('main','new_user_email_uniq_check','N','Check e-mail uniqueness:',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_cleanup_days','7','Keep events (days):',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_logout','N','Logout',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_login_success','N','Successful login',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_login_fail','N','Login failure',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_register','N','Log new user registrations',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_register_fail','N','Log registration errors',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_password_request','N','Log password change requests',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_password_change','N','Log password changes',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_user_delete','N','Log user deletion',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_user_groups','N','Log user group changes',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_group_policy','N','Log group security policy changes',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_module_access','N','Log module access permission changes',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_file_access','N','Log file access permission changes',NULL);
INSERT INTO `b_option` VALUES ('main','event_log_task','N','Log access permission changes',NULL);
INSERT INTO `b_option` VALUES ('main','auth_controller_prefix','','Controller side authorization prefix:',NULL);
INSERT INTO `b_option` VALUES ('main','auth_controller_sso','N','Authorize users of other client sites at this site:',NULL);
INSERT INTO `b_option` VALUES ('main','GROUP_DEFAULT_RIGHT','D','Right for groups by default',NULL);
INSERT INTO `b_option` VALUES ('main','~update_autocheck_result','a:3:{s:10:\"check_date\";i:0;s:6:\"result\";b:0;s:5:\"error\";s:44:\"[LICENSE_NOT_FOUND] License key is not found\";}','',NULL);
INSERT INTO `b_option` VALUES ('main','update_system_check','11/30/2015 10:37:35','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_max_exec_time_sleep','3','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_disable_gzip','N','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_integrity_check','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_max_file_size','0','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_max_exec_time','20','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_file_public','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_file_kernel','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_base_true','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_base_stat','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','dump_base_index','Y','',NULL);
INSERT INTO `b_option` VALUES ('main','skip_symlinks','','',NULL);
INSERT INTO `b_option` VALUES ('main','skip_mask','','',NULL);
INSERT INTO `b_option` VALUES ('iblock','use_htmledit','Y','Use visual editor',NULL);
INSERT INTO `b_option` VALUES ('iblock','show_xml_id','','Show code from external DB source',NULL);
INSERT INTO `b_option` VALUES ('iblock','path2rss','/upload/','Path to exported RSS files',NULL);
INSERT INTO `b_option` VALUES ('iblock','combined_list_mode','Y','Combined view of sections and elements',NULL);
INSERT INTO `b_option` VALUES ('iblock','iblock_menu_max_sections','50','Maximum number of sections in menu',NULL);
INSERT INTO `b_option` VALUES ('perfmon','bitrix_optimal','N','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','total_mark_value','calc','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','total_mark_duration','300','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_page_rate','0.86','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_page_time','1.1679','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_session_time_value','0.0005','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_mail_value','0.7656','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_files_value','1 000.0','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_cpu_value','10.9','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','total_mark_time','01/04/2016 08:25:10','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','total_mark_hits','0','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','end_time','1451892610','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_page_date','22.03.2016 17:25:51','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_php_is_good','N','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_db_insert_value','7 131','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_db_read_value','6 274','',NULL);
INSERT INTO `b_option` VALUES ('perfmon','mark_db_update_value','6 848','',NULL);
INSERT INTO `b_option` VALUES ('main','component_cache_on','N','',NULL);
INSERT INTO `b_option` VALUES ('fileman','use_pspell','N','',NULL);
INSERT INTO `b_option` VALUES ('fileman','GROUP_DEFAULT_TASK','12','',NULL);
INSERT INTO `b_option` VALUES ('search','sm_max_execution_time','30','',NULL);
INSERT INTO `b_option` VALUES ('search','sm_record_limit','5000','',NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_perf_component`
-- 




DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1)  DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text ,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_perf_error`
-- 




DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text ,
  `ERRFILE` text ,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_perf_hit`
-- 




DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1)  DEFAULT NULL,
  `REQUEST_METHOD` varchar(50)  DEFAULT NULL,
  `SERVER_NAME` varchar(50)  DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text ,
  `REQUEST_URI` text ,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1)  DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1)  DEFAULT NULL,
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

-- 
-- Dumping data for table  `b_perf_hit`
-- 


INSERT INTO `b_perf_hit` VALUES (1,'2016-01-04 14:25:37','Y','GET','demo.dev',80,'/bitrix/admin/user_admin.php','/bitrix/admin/user_admin.php?lang=en',154,8296664,'Y',34341,14,0.0293114,0,0,'Y',1.45017,1.4012,1.2953,0.00658989,0.112528,0.0286291,0.01371,0.00269794,0.0001688,0.0108433,0);
INSERT INTO `b_perf_hit` VALUES (2,'2016-01-04 14:25:37','Y','GET','demo.dev',80,'/bitrix/admin/user_options.php','/bitrix/admin/user_options.php?p[0][c]=admin_menu&p[0][n]=pos&p[0][v][sections]=menu_iblock_%2Fnews%2Cmenu_iblock%2Cmenu_perfmon%2Cmenu_fileman%2Ciblock_import%2Cmenu_iblock_%2Fvn%2Cmenu_util%2Cmenu_module_settings%2Cmenu_users&sessid=98c0f30967b28f01a50ea5f482e0549c',90,6123016,'Y',26927,3,0.00124788,0,0,'Y',1.2155,NULL,NULL,0.00641108,NULL,NULL,NULL,NULL,0.000146151,NULL,0);
INSERT INTO `b_perf_hit` VALUES (3,'2016-01-04 14:25:39','Y','GET','demo.dev',80,'/bitrix/admin/task_admin.php','/bitrix/admin/task_admin.php?lang=en',156,8389480,'Y',40788,10,0.00667191,0,0,'Y',1.44835,1.4047,1.30992,0.0051949,0.100016,0.00751209,0.0309079,0.00222898,0.000168085,0.0285108,0);
INSERT INTO `b_perf_hit` VALUES (4,'2016-01-04 14:25:48','Y','GET','demo.dev',80,'/bitrix/admin/user_admin.php','/bitrix/admin/user_admin.php?lang=en',155,8253456,'Y',34341,10,0.00869226,0,0,'Y',1.32273,1.2935,1.18392,0.00585508,0.115477,0.009794,0.0135379,0.00265694,0.0000751019,0.0108058,0);
INSERT INTO `b_perf_hit` VALUES (5,'2016-01-04 14:25:54','Y','GET','demo.dev',80,'/bitrix/admin/user_edit.php','/bitrix/admin/user_edit.php?ID=1&lang=en',157,8750648,'Y',35037,15,0.0110178,0,0,'Y',1.53195,1.3254,1.22356,0.0058651,0.107726,0.159898,0.040766,0.00680995,0.000165939,0.0337901,0);
INSERT INTO `b_perf_hit` VALUES (6,'2016-01-04 14:26:06','Y','GET','demo.dev',80,'/bitrix/admin/iblock_list_admin.php','/bitrix/admin/iblock_list_admin.php?IBLOCK_ID=5&type=vn&lang=en&find_section_section=0',167,10120296,'Y',34341,18,0.0287323,0,0,'Y',1.47969,1.4474,1.36854,0.00665903,0.085485,0.0141339,0.0115409,0.0021801,0.000293016,0.00906777,0);
INSERT INTO `b_perf_hit` VALUES (7,'2016-01-04 14:26:12','Y','GET','demo.dev',80,'/bitrix/admin/user_options.php','/bitrix/admin/user_options.php?p[0][c]=filter&p[0][n]=tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter&p[0][v][rows]=IBLIST_A_PARENT&sessid=98c0f30967b28f01a50ea5f482e0549c',90,6122288,'Y',26927,3,0.00143862,0,0,'Y',1.17178,NULL,NULL,0.00768805,NULL,NULL,NULL,NULL,0.0000829697,NULL,0);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_perf_sql`
-- 




DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `MODULE_NAME` text ,
  `COMPONENT_NAME` text ,
  `SQL_TEXT` text ,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_perf_sql`
-- 


INSERT INTO `b_perf_sql` VALUES (1,1,NULL,0,0.000739813,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (2,1,NULL,1,0.000562191,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'admin_menu\' 	AND NAME=\'pos\'');
INSERT INTO `b_perf_sql` VALUES (3,1,NULL,2,0.000725985,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:8:\\\"sections\\\";s:127:\\\"menu_iblock_/news,menu_iblock,menu_perfmon,menu_fileman,iblock_import,menu_iblock_/vn,menu_util,menu_module_settings,menu_users\\\";}\', `NAME` = \'pos\', `CATEGORY` = \'admin_menu\', `USER_ID` = 1 WHERE ID=3');
INSERT INTO `b_perf_sql` VALUES (4,1,NULL,3,0.000618696,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (5,1,NULL,4,0.021512,'main',NULL,'\n			SELECT\n				UF.ID\n				,UF.ENTITY_ID\n				,UF.FIELD_NAME\n				,UF.USER_TYPE_ID\n				,UF.XML_ID\n				,UF.SORT\n				,UF.MULTIPLE\n				,UF.MANDATORY\n				,UF.SHOW_FILTER\n				,UF.SHOW_IN_LIST\n				,UF.EDIT_IN_LIST\n				,UF.IS_SEARCHABLE\n				,UF.SETTINGS\n				\n					,UFL.EDIT_FORM_LABEL\n					,UFL.LIST_COLUMN_LABEL\n					,UFL.LIST_FILTER_LABEL\n					,UFL.ERROR_MESSAGE\n					,UFL.HELP_MESSAGE\n				\n			FROM\n				b_user_field UF\n				LEFT JOIN b_user_field_lang UFL on UFL.LANGUAGE_ID = \'en\' AND UFL.USER_FIELD_ID = UF.ID\n			\nWHERE UF.ENTITY_ID LIKE \'USER\'\nORDER BY UF.SORT ASC, UF.ID ASC');
INSERT INTO `b_perf_sql` VALUES (6,1,NULL,5,0.000386,'main',NULL,'SELECT COUNT(U.ID) as C \n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			');
INSERT INTO `b_perf_sql` VALUES (7,1,NULL,6,0.000684977,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			 ORDER BY U.TIMESTAMP_X desc  LIMIT 0, 20');
INSERT INTO `b_perf_sql` VALUES (8,1,NULL,7,0.000418902,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (9,1,NULL,8,0.000661135,'fileman',NULL,'SELECT * FROM b_medialib_type');
INSERT INTO `b_perf_sql` VALUES (10,1,NULL,9,0.000748157,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (11,1,NULL,10,0.000533581,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (12,1,NULL,11,0.000482082,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT');
INSERT INTO `b_perf_sql` VALUES (13,1,NULL,12,0.000547886,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (14,1,NULL,13,0.000689983,'main',NULL,'\n			SELECT\n				ID as REFERENCE_ID,\n				concat(NAME, \' [\', ID, \']\') as REFERENCE\n			FROM\n				b_group\n			WHERE\n				1=1\n			AND ID!=2\n			ORDER BY C_SORT, NAME, ID\n			');
INSERT INTO `b_perf_sql` VALUES (15,2,NULL,0,0.000586986,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (16,2,NULL,1,0.000272989,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'admin_menu\' 	AND NAME=\'pos\'');
INSERT INTO `b_perf_sql` VALUES (17,2,NULL,2,0.000387907,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:8:\\\"sections\\\";s:127:\\\"menu_iblock_/news,menu_iblock,menu_perfmon,menu_fileman,iblock_import,menu_iblock_/vn,menu_util,menu_module_settings,menu_users\\\";}\', `NAME` = \'pos\', `CATEGORY` = \'admin_menu\', `USER_ID` = 1 WHERE ID=3');
INSERT INTO `b_perf_sql` VALUES (18,3,NULL,0,0.000709772,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (19,3,NULL,1,0.000874996,'main',NULL,'SELECT DISTINCT O.MODULE_ID FROM b_operation O');
INSERT INTO `b_perf_sql` VALUES (20,3,NULL,2,0.000696898,'main',NULL,'\n			SELECT\n				T.ID, T.NAME, T.DESCRIPTION, T.MODULE_ID, T.LETTER, T.SYS, T.BINDING\n			FROM\n				b_task T\n			WHERE\n				(1=1)\n			');
INSERT INTO `b_perf_sql` VALUES (21,3,NULL,3,0.000883818,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (22,3,NULL,4,0.000407219,'fileman',NULL,'SELECT * FROM b_medialib_type');
INSERT INTO `b_perf_sql` VALUES (23,3,NULL,5,0.000736713,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (24,3,NULL,6,0.000537157,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (25,3,NULL,7,0.000411034,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT');
INSERT INTO `b_perf_sql` VALUES (26,3,NULL,8,0.000622988,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (27,3,NULL,9,0.000791311,'main',NULL,'SELECT DISTINCT O.BINDING FROM b_operation O');
INSERT INTO `b_perf_sql` VALUES (28,4,NULL,0,0.000586986,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (29,4,NULL,1,0.000352144,'main',NULL,'SELECT COUNT(U.ID) as C \n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			');
INSERT INTO `b_perf_sql` VALUES (30,4,NULL,2,0.00052309,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1)\n			 ORDER BY U.TIMESTAMP_X desc  LIMIT 0, 20');
INSERT INTO `b_perf_sql` VALUES (31,4,NULL,3,0.000598192,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (32,4,NULL,4,0.000404119,'fileman',NULL,'SELECT * FROM b_medialib_type');
INSERT INTO `b_perf_sql` VALUES (33,4,NULL,5,0.00337076,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (34,4,NULL,6,0.00140595,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (35,4,NULL,7,0.000393629,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT');
INSERT INTO `b_perf_sql` VALUES (36,4,NULL,8,0.000497103,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (37,4,NULL,9,0.000560284,'main',NULL,'\n			SELECT\n				ID as REFERENCE_ID,\n				concat(NAME, \' [\', ID, \']\') as REFERENCE\n			FROM\n				b_group\n			WHERE\n				1=1\n			AND ID!=2\n			ORDER BY C_SORT, NAME, ID\n			');
INSERT INTO `b_perf_sql` VALUES (38,5,NULL,0,0.00268292,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (39,5,NULL,1,0.000381947,'main',NULL,'SELECT UG.GROUP_ID FROM b_user_group UG WHERE UG.USER_ID = 1 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) ');
INSERT INTO `b_perf_sql` VALUES (40,5,NULL,2,0.000183821,'main',NULL,'SELECT UG.GROUP_ID FROM b_user_group UG WHERE UG.USER_ID = 1 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) ');
INSERT INTO `b_perf_sql` VALUES (41,5,NULL,3,0.00117612,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1\n					AND\n					(\n						U.ID=\'1\'\n					)\n					)\n			 ORDER BY U.ID');
INSERT INTO `b_perf_sql` VALUES (42,5,NULL,4,0.001019,'main',NULL,'\n			SELECT\n				UG.GROUP_ID,\n				DATE_FORMAT(UG.DATE_ACTIVE_FROM, \'%m/%d/%Y %H:%i:%s\') as DATE_ACTIVE_FROM,\n				DATE_FORMAT(UG.DATE_ACTIVE_TO, \'%m/%d/%Y %H:%i:%s\') as DATE_ACTIVE_TO\n			FROM\n				b_user_group UG\n			WHERE\n				UG.USER_ID = 1\n			UNION SELECT 2, NULL, NULL\n			FROM b_user_group ');
INSERT INTO `b_perf_sql` VALUES (43,5,NULL,5,0.000437021,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (44,5,NULL,6,0.000406265,'fileman',NULL,'SELECT * FROM b_medialib_type');
INSERT INTO `b_perf_sql` VALUES (45,5,NULL,7,0.00113583,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (46,5,NULL,8,0.000705242,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (47,5,NULL,9,0.000416994,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT');
INSERT INTO `b_perf_sql` VALUES (48,5,NULL,10,0.000400066,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (49,5,NULL,11,0.000621796,'main',NULL,'\n			SELECT \n				L.*,\n				L.LID ID,\n				length(L.DIR),\n				ifnull(length(L.DOC_ROOT), 0)\n			FROM\n				b_lang L\n				\n			WHERE\n				 1=1\n\n			 ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (50,5,NULL,12,0.000594854,'main',NULL,'\n			SELECT\n				G.ID, G.ACTIVE, G.C_SORT, G.ANONYMOUS, G.NAME, G.DESCRIPTION, G.STRING_ID,\n				\n				G.ID										REFERENCE_ID,\n				concat(G.NAME, \' [\', G.ID, \']\')					REFERENCE,\n				DATE_FORMAT(G.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X\n			FROM\n				b_group G\n			\n			WHERE\n			(1=1\n					AND\n					(\n						G.ANONYMOUS=\'N\'\n					)\n					)\n			GROUP BY\n				G.ID, G.ACTIVE, G.C_SORT, G.TIMESTAMP_X, G.ANONYMOUS, G.NAME, G.STRING_ID, G.DESCRIPTION\n			HAVING\n				1=1\n				\n			 ORDER BY G.C_SORT  asc \n			');
INSERT INTO `b_perf_sql` VALUES (51,5,NULL,13,0.000464201,'main',NULL,'SELECT G.SECURITY_POLICY FROM b_group G WHERE G.ID=2');
INSERT INTO `b_perf_sql` VALUES (52,5,NULL,14,0.000391722,'main',NULL,'SELECT UG.GROUP_ID, G.SECURITY_POLICY FROM b_user_group UG, b_group G WHERE UG.USER_ID = 1 	AND UG.GROUP_ID = G.ID 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) ');
INSERT INTO `b_perf_sql` VALUES (53,6,NULL,0,0.000833511,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (54,6,NULL,1,0.00054121,'iblock',NULL,'SELECT BP.* FROM b_iblock_property BP, b_iblock B WHERE BP.IBLOCK_ID=B.ID AND BP.ACTIVE=\'Y\'\nAND BP.IBLOCK_ID=5\n ORDER BY BP.SORT ASC,BP.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (55,6,NULL,2,0.000383854,'main',NULL,'\n			SELECT\n				UF.ID\n				,UF.ENTITY_ID\n				,UF.FIELD_NAME\n				,UF.USER_TYPE_ID\n				,UF.XML_ID\n				,UF.SORT\n				,UF.MULTIPLE\n				,UF.MANDATORY\n				,UF.SHOW_FILTER\n				,UF.SHOW_IN_LIST\n				,UF.EDIT_IN_LIST\n				,UF.IS_SEARCHABLE\n				,UF.SETTINGS\n				\n			FROM\n				b_user_field UF\n				\n			\nWHERE UF.ENTITY_ID LIKE \'IBLOCK_5_SECTION\'\nORDER BY UF.SORT ASC, UF.ID ASC');
INSERT INTO `b_perf_sql` VALUES (56,6,NULL,3,0.0186059,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((BS.IBLOCK_SECTION_ID IS NULL)))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.TIMESTAMP_X desc ');
INSERT INTO `b_perf_sql` VALUES (57,6,NULL,4,0.000644922,'iblock',NULL,'SELECT  BE.NAME as NAME,BE.ACTIVE as ACTIVE,BE.SORT as SORT,DATE_FORMAT(BE.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,BE.ID as ID,BE.CREATED_BY as CREATED_BY,L.DIR as LANG_DIR,B.LID as LID,BE.WF_PARENT_ELEMENT_ID as WF_PARENT_ELEMENT_ID,if (BE.WF_DATE_LOCK is null, \'green\', if(DATE_ADD(BE.WF_DATE_LOCK, interval 60 MINUTE)<now(), \'green\', if(BE.WF_LOCKED_BY=1, \'yellow\', \'red\'))) as LOCK_STATUS,BE.WF_NEW as WF_NEW,BE.WF_STATUS_ID as WF_STATUS_ID,B.DETAIL_PAGE_URL as DETAIL_PAGE_URL,BE.CODE as CODE,BE.XML_ID as EXTERNAL_ID,BE.IBLOCK_SECTION_ID as IBLOCK_SECTION_ID,B.IBLOCK_TYPE_ID as IBLOCK_TYPE_ID,BE.IBLOCK_ID as IBLOCK_ID,B.CODE as IBLOCK_CODE,B.XML_ID as IBLOCK_EXTERNAL_ID \n			FROM b_iblock B\n			INNER JOIN b_lang L ON B.LID=L.LID\n			INNER JOIN b_iblock_element BE ON BE.IBLOCK_ID = B.ID\n			\n			WHERE 1=1 \n			AND (\n			\n				((((BE.IBLOCK_ID = \'5\'))))\n				AND (BE.IN_SECTIONS=\'N\')\n			)\n			AND (((BE.WF_STATUS_ID=1 AND BE.WF_PARENT_ELEMENT_ID IS NULL) OR (BE.WF_NEW=\'Y\')))\n			\n		 ORDER BY BE.TIMESTAMP_X desc ');
INSERT INTO `b_perf_sql` VALUES (58,6,NULL,5,0.000552177,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc ');
INSERT INTO `b_perf_sql` VALUES (59,6,NULL,6,0.000468016,'main',NULL,'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID FROM b_language L  WHERE  (L.LID=\'en\')  ORDER BY L.SORT ');
INSERT INTO `b_perf_sql` VALUES (60,6,NULL,7,0.000450134,'fileman',NULL,'SELECT * FROM b_medialib_type');
INSERT INTO `b_perf_sql` VALUES (61,6,NULL,8,0.000766754,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (62,6,NULL,9,0.000555038,'iblock',NULL,'SELECT DISTINCT B.*, B.XML_ID as EXTERNAL_ID, DATE_FORMAT(B.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X, L.DIR as LANG_DIR, L.SERVER_NAME FROM b_iblock B  INNER JOIN b_lang L ON L.LID=B.LID 	LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID WHERE 1 = 1  ORDER BY  B.SORT asc , B.NAME asc ');
INSERT INTO `b_perf_sql` VALUES (63,6,NULL,10,0.000610113,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((BS.IBLOCK_SECTION_ID IS NULL)))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc ');
INSERT INTO `b_perf_sql` VALUES (64,6,NULL,11,0.000491858,'main',NULL,'SELECT * FROM b_language WHERE ACTIVE=\'Y\' ORDER BY SORT');
INSERT INTO `b_perf_sql` VALUES (65,6,NULL,12,0.000650883,'main',NULL,'\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'en\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC');
INSERT INTO `b_perf_sql` VALUES (66,6,NULL,13,0.00100803,'iblock',NULL,'\n				SELECT DISTINCT\n					\n				BS.*,\n				B.LIST_PAGE_URL,\n				B.SECTION_PAGE_URL,\n				B.IBLOCK_TYPE_ID,\n				B.CODE as IBLOCK_CODE,\n				B.XML_ID as IBLOCK_EXTERNAL_ID,\n				BS.XML_ID as EXTERNAL_ID,\n				DATE_FORMAT(BS.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') as TIMESTAMP_X,\n				DATE_FORMAT(BS.DATE_CREATE, \'%m/%d/%Y %H:%i:%s\') as DATE_CREATE\n			\n					\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					LEFT JOIN b_iblock_group IBG ON IBG.IBLOCK_ID=B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'5\')))) \n				AND  ((((B.ID = \'5\')))) \n				ORDER BY  BS.LEFT_MARGIN asc ');
INSERT INTO `b_perf_sql` VALUES (67,6,NULL,14,0.000452995,'iblock',NULL,'SELECT * FROM b_iblock_group WHERE IBLOCK_ID = \'5\'');
INSERT INTO `b_perf_sql` VALUES (68,6,NULL,15,0.000793934,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				 INNER JOIN (SELECT DISTINCT UG.USER_ID FROM b_user_group UG\n							WHERE UG.GROUP_ID in (1)\n								and (UG.DATE_ACTIVE_FROM is null or	UG.DATE_ACTIVE_FROM <= now())\n								and (UG.DATE_ACTIVE_TO is null or UG.DATE_ACTIVE_TO >= now())\n							) UG ON UG.USER_ID=U.ID \n			WHERE\n				(1=1)\n			 ORDER BY U.NAME desc ');
INSERT INTO `b_perf_sql` VALUES (69,6,NULL,16,0.000268936,'iblock',NULL,'SELECT * FROM b_iblock_group WHERE IBLOCK_ID = \'5\'');
INSERT INTO `b_perf_sql` VALUES (70,6,NULL,17,0.000653982,'main',NULL,'SELECT \n			U.*,\n			DATE_FORMAT(U.TIMESTAMP_X, \'%m/%d/%Y %H:%i:%s\') TIMESTAMP_X,\n			DATE_FORMAT(U.DATE_REGISTER, \'%m/%d/%Y %H:%i:%s\') DATE_REGISTER,\n			DATE_FORMAT(U.LAST_LOGIN, \'%m/%d/%Y %H:%i:%s\') LAST_LOGIN,\n			DATE_FORMAT(U.PERSONAL_BIRTHDAY, \'%m/%d/%Y\') PERSONAL_BIRTHDAY\n			\n		\n			FROM\n				b_user U\n				\n				 INNER JOIN (SELECT DISTINCT UG.USER_ID FROM b_user_group UG\n							WHERE UG.GROUP_ID in (1)\n								and (UG.DATE_ACTIVE_FROM is null or	UG.DATE_ACTIVE_FROM <= now())\n								and (UG.DATE_ACTIVE_TO is null or UG.DATE_ACTIVE_TO >= now())\n							) UG ON UG.USER_ID=U.ID \n			WHERE\n				(1=1)\n			 ORDER BY U.NAME desc ');
INSERT INTO `b_perf_sql` VALUES (71,7,NULL,0,0.000611782,'main',NULL,'SELECT CATEGORY, NAME, VALUE, COMMON FROM b_user_option WHERE (USER_ID=1 OR USER_ID IS NULL AND COMMON=\'Y\') ');
INSERT INTO `b_perf_sql` VALUES (72,7,NULL,1,0.000360966,'main',NULL,'SELECT ID FROM b_user_option WHERE USER_ID=1	AND CATEGORY=\'filter\' 	AND NAME=\'tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter\'');
INSERT INTO `b_perf_sql` VALUES (73,7,NULL,2,0.00046587,'main',NULL,'UPDATE b_user_option SET `COMMON` = \'N\', `VALUE` = \'a:1:{s:4:\\\"rows\\\";s:15:\\\"IBLIST_A_PARENT\\\";}\', `NAME` = \'tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter\', `CATEGORY` = \'filter\', `USER_ID` = 1 WHERE ID=6');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_perf_test`
-- 




DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_perf_test`
-- 


INSERT INTO `b_perf_test` VALUES (1,2,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (2,3,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (3,4,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (4,5,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (5,6,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (6,7,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (7,8,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (8,9,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (9,10,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (10,11,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (11,12,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (12,13,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (13,14,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (14,15,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (15,16,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (16,17,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (17,18,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (18,19,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (19,20,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (20,21,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (21,22,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (22,23,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (23,24,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (24,25,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (25,26,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (26,27,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (27,28,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (28,29,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (29,30,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (30,31,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (31,32,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (32,33,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (33,34,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (34,35,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (35,36,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (36,37,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (37,38,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (38,39,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (39,40,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (40,41,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (41,42,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (42,43,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (43,44,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (44,45,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (45,46,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (46,47,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (47,48,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (48,49,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (49,50,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (50,51,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (51,52,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (52,53,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (53,54,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (54,55,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (55,56,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (56,57,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (57,58,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (58,59,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (59,60,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (60,61,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (61,62,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (62,63,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (63,64,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (64,65,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (65,66,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (66,67,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (67,68,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (68,69,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (69,70,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (70,71,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (71,72,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (72,73,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (73,74,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (74,75,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (75,76,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (76,77,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (77,78,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (78,79,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (79,80,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (80,81,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (81,82,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (82,83,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (83,84,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (84,85,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (85,86,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (86,87,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (87,88,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (88,89,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (89,90,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (90,91,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (91,92,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (92,93,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (93,94,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (94,95,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (95,96,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (96,97,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (97,98,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (98,99,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (99,100,'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
INSERT INTO `b_perf_test` VALUES (100,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (101,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (102,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (103,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (104,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (105,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (106,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (107,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (108,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (109,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (110,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (111,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (112,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (113,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (114,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (115,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (116,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (117,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (118,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (119,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (120,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (121,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (122,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (123,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (124,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (125,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (126,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (127,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (128,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (129,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (130,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (131,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (132,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (133,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (134,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (135,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (136,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (137,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (138,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (139,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (140,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (141,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (142,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (143,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (144,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (145,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (146,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (147,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (148,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (149,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (150,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (151,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (152,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (153,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (154,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (155,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (156,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (157,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (158,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (159,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (160,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (161,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (162,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (163,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (164,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (165,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (166,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (167,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (168,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (169,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (170,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (171,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (172,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (173,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (174,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (175,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (176,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (177,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (178,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (179,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (180,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (181,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (182,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (183,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (184,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (185,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (186,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (187,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (188,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (189,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (190,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (191,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (192,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (193,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (194,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (195,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (196,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (197,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (198,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (199,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (200,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (201,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (202,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (203,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (204,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (205,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (206,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (207,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (208,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (209,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (210,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (211,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (212,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (213,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (214,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (215,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (216,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (217,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (218,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (219,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (220,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (221,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (222,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (223,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (224,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (225,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (226,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (227,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (228,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (229,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (230,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (231,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (232,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (233,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (234,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (235,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (236,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (237,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (238,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (239,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (240,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (241,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (242,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (243,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (244,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (245,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (246,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (247,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (248,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (249,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (250,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (251,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (252,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (253,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (254,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (255,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (256,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (257,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (258,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (259,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (260,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (261,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (262,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (263,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (264,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (265,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (266,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (267,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (268,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (269,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (270,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (271,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (272,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (273,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (274,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (275,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (276,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (277,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (278,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (279,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (280,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (281,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (282,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (283,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (284,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (285,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (286,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (287,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (288,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (289,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (290,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (291,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (292,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (293,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (294,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (295,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (296,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (297,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (298,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (299,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (300,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (301,-1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (302,0,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (303,1,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (304,2,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (305,3,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (306,4,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (307,5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (308,6,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (309,7,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (310,8,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (311,9,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (312,10,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (313,11,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (314,12,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (315,13,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (316,14,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (317,15,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (318,16,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (319,17,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (320,18,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (321,19,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (322,20,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (323,21,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (324,22,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (325,23,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (326,24,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (327,25,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (328,26,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (329,27,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (330,28,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (331,29,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (332,30,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (333,31,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (334,32,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (335,33,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (336,34,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (337,35,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (338,36,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (339,37,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (340,38,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (341,39,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (342,40,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (343,41,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (344,42,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (345,43,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (346,44,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (347,45,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (348,46,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (349,47,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (350,48,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (351,49,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (352,50,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (353,51,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (354,52,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (355,53,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (356,54,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (357,55,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (358,56,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (359,57,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (360,58,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (361,59,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (362,60,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (363,61,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (364,62,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (365,63,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (366,64,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (367,65,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (368,66,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (369,67,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (370,68,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (371,69,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (372,70,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (373,71,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (374,72,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (375,73,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (376,74,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (377,75,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (378,76,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (379,77,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (380,78,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (381,79,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (382,80,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (383,81,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (384,82,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (385,83,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (386,84,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (387,85,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (388,86,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (389,87,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (390,88,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (391,89,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (392,90,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (393,91,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (394,92,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (395,93,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (396,94,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (397,95,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (398,96,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (399,97,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` VALUES (400,98,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating`
-- 




DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1)  NOT NULL,
  `NAME` varchar(512)  NOT NULL,
  `ENTITY_ID` varchar(50)  NOT NULL,
  `CALCULATION_METHOD` varchar(3)  NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `CALCULATED` char(1)  NOT NULL DEFAULT 'N',
  `CONFIGS` text ,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating_component`
-- 




DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50)  NOT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `RATING_TYPE` varchar(50)  NOT NULL,
  `NAME` varchar(50)  NOT NULL,
  `COMPLEX_NAME` varchar(200)  NOT NULL,
  `CLASS` varchar(255)  NOT NULL,
  `CALC_METHOD` varchar(255)  NOT NULL,
  `EXCEPTION_METHOD` varchar(255)  DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text ,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating_component_results`
-- 




DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50)  NOT NULL,
  `ENTITY_ID` varchar(50)  NOT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `RATING_TYPE` varchar(50)  NOT NULL,
  `NAME` varchar(50)  NOT NULL,
  `COMPLEX_NAME` varchar(200)  NOT NULL,
  `CURRENT_VALUE` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating_results`
-- 




DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50)  NOT NULL,
  `ENTITY_ID` varchar(50)  NOT NULL,
  `CURRENT_VALUE` decimal(18,2) NOT NULL,
  `PREVIOUS_VALUE` decimal(18,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating_vote`
-- 




DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `VALUE` decimal(18,2) NOT NULL,
  `ACTIVE` char(1)  NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64)  NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTING_ID` (`RATING_VOTING_ID`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_rating_voting`
-- 




DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50)  NOT NULL,
  `ENTITY_ID` varchar(50)  NOT NULL,
  `ACTIVE` char(1)  NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,2) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_content`
-- 




DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `ITEM_ID` varchar(255)  NOT NULL,
  `LID` char(2)  NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `URL` text ,
  `TITLE` text ,
  `BODY` text ,
  `TAGS` text ,
  `SEARCHABLE_CONTENT` longtext ,
  `PARAM1` text ,
  `PARAM2` text ,
  `UPD` varchar(32)  DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50))
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_search_content`
-- 


INSERT INTO `b_search_content` VALUES (60,'2018-01-17 00:00:00','iblock','140','s1',0,'=ID=140&EXTERNAL_ID=140&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=8&IBLOCK_CODE=tin-tuc&IBLOCK_EXTERNAL_ID=&CODE=apka-dong-hanh-u23','Người đẹp và siêu xe APKA đồng hành cùng U23','Dàn siêu xe và người mẫu An Phát Khánh luôn sát cánh cùng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của dân tộc Việt Nam, hòa chung vào không khí đó tập thể 4000 anh em lái xe đã đồng hành cùng đội tuyển trong suốt quá trình thi đấu cho đến ngày vinh quang hôm nay \r\n\rD&agrave;n si&ecirc;u xe và người mẫu An Ph&aacute;t Khánh lu&ocirc;n sát cánh c&ugrave;ng đội tuyển U23 Việt Nam, màu cờ sắc áo là niềm tự hào của d&acirc;n tộc Việt Nam, h&ograve;a chung vào không kh&iacute; đ&oacute; tập thể 4000 anh em lái xe đ&atilde; đồng hành cùng đội tuyển trong suốt quá tr&igrave;nh thi đấu cho đến ngày vinh quang hôm nay \rTrong suốt quá trình thi đấu từ trận đầu tiên cho đến trận chung kết 4000 anh em không ngừng  khuấy đông phong trào cổ vũ cho đội nhà, cụ thể là anh em dán những hình ảnh khich lệ động viên và bày tỏ sự tôn trọng những thành quả mà toàn đội bóng đã đạt được\rHình ảnh xe dán  hình ảnh cổ vũ cùng với cờ đỏ sao vàng trên phố đã mang lại hiệu ứng to lớn góp phần nhỏ b&eacute; vào tinh thần bất diệt gửi đến các câu thủ đang thi đấu xa nhà.\rQua sự kiện trên chứng tỏ một điều những anh em lái xe của An Phát Khánh ngoài chăm chỉ làm việc với cái tâm nghề nghiệp ra ch&uacute;ng tôi còn rất yêu thể thao, yêu đất nước và sẵn sàng hòa chung vào niềm vui của dân tộc\rĐội xe An Phát Khánh luôn sẵn sàng chào đón thêm các thành viên, những anh em trong một gia đình mới, với khẩu hiệu \'\'\rĐoàn Kết Là Sức Mạnh \"  một lòng hướng đến tinh thần yêu nước, yêu thể thao','','NGƯỜI ĐẸP VÀ SIÊU XE APKA ĐỒNG HÀNH CÙNG U23\r\nDÀN SIÊU XE VÀ NGƯỜI MẪU AN PHÁT KHÁNH LUÔN SÁT CÁNH CÙNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DÂN TỘC VIỆT NAM, HÒA CHUNG VÀO KHÔNG KHÍ ĐÓ TẬP THỂ 4000 ANH EM LÁI XE ĐÃ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRÌNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \r\n\rDN SIU XE VÀ NGƯỜI MẪU AN PHT KHÁNH LUN SÁT CÁNH CNG ĐỘI TUYỂN U23 VIỆT NAM, MÀU CỜ SẮC ÁO LÀ NIỀM TỰ HÀO CỦA DN TỘC VIỆT NAM, HA CHUNG VÀO KHÔNG KH Đ TẬP THỂ 4000 ANH EM LÁI XE Đ ĐỒNG HÀNH CÙNG ĐỘI TUYỂN TRONG SUỐT QUÁ TRNH THI ĐẤU CHO ĐẾN NGÀY VINH QUANG HÔM NAY \rTRONG SUỐT QUÁ TRÌNH THI ĐẤU TỪ TRẬN ĐẦU TIÊN CHO ĐẾN TRẬN CHUNG KẾT 4000 ANH EM KHÔNG NGỪNG  KHUẤY ĐÔNG PHONG TRÀO CỔ VŨ CHO ĐỘI NHÀ, CỤ THỂ LÀ ANH EM DÁN NHỮNG HÌNH ẢNH KHICH LỆ ĐỘNG VIÊN VÀ BÀY TỎ SỰ TÔN TRỌNG NHỮNG THÀNH QUẢ MÀ TOÀN ĐỘI BÓNG ĐÃ ĐẠT ĐƯỢC\rHÌNH ẢNH XE DÁN  HÌNH ẢNH CỔ VŨ CÙNG VỚI CỜ ĐỎ SAO VÀNG TRÊN PHỐ ĐÃ MANG LẠI HIỆU ỨNG TO LỚN GÓP PHẦN NHỎ B VÀO TINH THẦN BẤT DIỆT GỬI ĐẾN CÁC CÂU THỦ ĐANG THI ĐẤU XA NHÀ.\rQUA SỰ KIỆN TRÊN CHỨNG TỎ MỘT ĐIỀU NHỮNG ANH EM LÁI XE CỦA AN PHÁT KHÁNH NGOÀI CHĂM CHỈ LÀM VIỆC VỚI CÁI TÂM NGHỀ NGHIỆP RA CHNG TÔI CÒN RẤT YÊU THỂ THAO, YÊU ĐẤT NƯỚC VÀ SẴN SÀNG HÒA CHUNG VÀO NIỀM VUI CỦA DÂN TỘC\rĐỘI XE AN PHÁT KHÁNH LUÔN SẴN SÀNG CHÀO ĐÓN THÊM CÁC THÀNH VIÊN, NHỮNG ANH EM TRONG MỘT GIA ĐÌNH MỚI, VỚI KHẨU HIỆU \'\'\rĐOÀN KẾT LÀ SỨC MẠNH \"  MỘT LÒNG HƯỚNG ĐẾN TINH THẦN YÊU NƯỚC, YÊU THỂ THAO\r\n','vn','8',NULL,'2018-01-17 00:00:00',NULL);
INSERT INTO `b_search_content` VALUES (44,'2018-03-31 01:00:45','iblock','80','s1',0,'=ID=80&EXTERNAL_ID=80&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=tuyen-dung','Tuyển dụng','C&ocirc;ng ty cổ phần đầu tư \rAn Ph&aacute;t Khánh\rl&agrave; một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (tr&ecirc;n nền tảng Grab). \rCác lĩnh vực hoạt động: \r1. Mua Bán xe ô tô cũ mới, mua xe trả g&oacute;p: \rapkauto.vn\r2. Gara bảo dưỡng, sửa chữa xe ô tô: \ranphatauto.com\r3. Đầu tư, cho thuê và hợp tác xe Grab: \ranphatkhanh.vn\r4. Mua bán bảo hiểm ô tô: \ranphatkhanh.vn\r5. Dự án xe Nội Bài, xe chạy tỉnh: \rapka.vn\rAPKA.VN hiện nay với hơn \r4000\rđối tác lái xe tham gia hợp tác, gi&uacute;p hành khách t&igrave;m được xe giá tốt, luôn giúp chuyến đi vui th&iacute;ch. \rDựa trên nền tảng công nghệ website và di động, \rwww.apka.vn\rphát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. \rApka.vn\rlà thành viên công ty cổ phần đầu tư An Phát Khánh (\rwww.anphatkhanh.vn\r). Với nhu cầu phát triển, Apka.vn cần tuyển dụng nh&acirc;n sự cho dự án xe Nội Bài và xe tỉnh như sau: \r1. \rNhân viên kinh doanh \rMô tả công việc: \r- Liên hệ hợp tác với đối tác đại l&yacute;: \r- Thống nhất phương án hợp tác, chốt ký hợp đồng \r- Kết nối với đối tác để lấy thông tin khách hàng có nhu cầu sử dụng dịch vụ. \r- Chuyển thông tin khách hàng về ph&ograve;ng chăm sóc khách hàng để nhân viên CSKH liên hệ tư vấn, chăm sóc. \r- Đánh giá kết quả, tỉ lệ thành công. Xây dựng phương án, kế hoạch công việc. \r2. \rNhân viên Tổ chức hành chính và Chăm sóc khách hàng. \rMô tả công việc: \r- Soạn thảo công văn, giấy tờ, văn bản \r- Theo d&otilde;i hợp đồng \r- Chăm sóc khách hàng (khách hàng sử dụng dịch vụ xe đưa đón sân bay, đi tỉnh và các khách hàng đại lý, công ty) \r- Tư vấn, giải đáp thắc mắc, thuyết phục khách hàng tiềm năng sử dụng dịch vụ \r- Đăng tin dịch vụ công ty trên các website mua bán, rao vặt, website và facebook (sẽ được hướng dẫn đầy đủ) \r- Xử lý các công việc hành chính của phòng Tổng hợp \r3. \rNhân viên Điều Hành Xe \r- Tổ chức sắp xếp và điều phối xe cho khách hàng \r- Bảo đảm lái xe chấp hành đúng quy định, tiêu chuẩn phục vụ khách hàng của công ty \r- Quản lý thông tin của lái xe và cập nhật thông tin lái xe lên hệ thống phần mềm \r4. \rNhân viên Marketing \r- Tìm kiếm, phát triển khách hàng cho sản phẩm qua các kênh Marketing Online như SMS Brandname, Email Marketing, Facebook, Google kênh sms brandname và các kênh quảng cáo khác... \r- Lập các kế hoạch truyền thông, khuyến mại để hoàn thành chỉ tiêu doanh thu cho dịch vụ mình quản lý. \r- Chăm sóc, hỗ trợ khách hàng do mình phát triển để đảm bảo doanh số cá nhân định kỳ. \r- Chủ động, sáng kiến trong việc đưa ra các ý tưởng mới. \r5. \rThực Tập viên \r- Tham gia hỗ trợ nhân viên chính thức \r- Tham gia hoạt động nhóm, đưa ý tưởng, sang tạo cho dự án \rQUYỀN LỢI: \rv Làm việc môi trường trẻ trung, năng động và ngành đang &ldquo;Hot&rdquo; hiện nay: taxi công nghệ \rv Có cơ hội học hỏi, phát triển, thăng tiến cao \rv Lương thưởng xứng đáng theo năng lực \rv Được tham quan, du lịch năm 1-2 lần \rv Được luân chuyển giữa các mảng của công ty khi có nguyện vọng \rY&Ecirc;U CẦU HỒ SƠ & ỨNG VIÊN \r&uuml; Công ty mong muốn tìm các bạn năng động, nhiệt huyết, sáng tạo, ứng viên chưa kinh nghiệm sẽ được đào tạo, hướng nghiệp. Có kinh nghiệm là điểm cộng khi phỏng vấn \rü Hồ sơ gồm: Đơn xin việc, sơ yếu lý lịch. \rü Các bằng cấp có liên quan. \rü Hồ sơ ứng viên gửi về theo địa chỉ email: \rcontact@apka.vn\rü Hoặc liên hệ theo số điện thoại \r0914.198.008/ 0981.370.360\rđể nộp hồ sơ tại văn phòng công ty tại Tòa nhà Nàng Hương, 583 Nguyễn Trãi, Thanh Xuân, Hà Nội. ','','TUYỂN DỤNG\r\nCNG TY CỔ PHẦN ĐẦU TƯ \rAN PHT KHÁNH\rL MỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRN NỀN TẢNG GRAB). \rCÁC LĨNH VỰC HOẠT ĐỘNG: \r1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GP: \rAPKAUTO.VN\r2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: \rANPHATAUTO.COM\r3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: \rANPHATKHANH.VN\r4. MUA BÁN BẢO HIỂM Ô TÔ: \rANPHATKHANH.VN\r5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: \rAPKA.VN\rAPKA.VN HIỆN NAY VỚI HƠN \r4000\rĐỐI TÁC LÁI XE THAM GIA HỢP TÁC, GIP HÀNH KHÁCH TM ĐƯỢC XE GIÁ TỐT, LUÔN GIÚP CHUYẾN ĐI VUI THCH. \rDỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, \rWWW.APKA.VN\rPHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC HNG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. \rAPKA.VN\rLÀ THÀNH VIÊN CÔNG TY CỔ PHẦN ĐẦU TƯ AN PHÁT KHÁNH (\rWWW.ANPHATKHANH.VN\r). VỚI NHU CẦU PHÁT TRIỂN, APKA.VN CẦN TUYỂN DỤNG NHN SỰ CHO DỰ ÁN XE NỘI BÀI VÀ XE TỈNH NHƯ SAU: \r1. \rNHÂN VIÊN KINH DOANH \rMÔ TẢ CÔNG VIỆC: \r- LIÊN HỆ HỢP TÁC VỚI ĐỐI TÁC ĐẠI L: \r- THỐNG NHẤT PHƯƠNG ÁN HỢP TÁC, CHỐT KÝ HỢP ĐỒNG \r- KẾT NỐI VỚI ĐỐI TÁC ĐỂ LẤY THÔNG TIN KHÁCH HÀNG CÓ NHU CẦU SỬ DỤNG DỊCH VỤ. \r- CHUYỂN THÔNG TIN KHÁCH HÀNG VỀ PHNG CHĂM SÓC KHÁCH HÀNG ĐỂ NHÂN VIÊN CSKH LIÊN HỆ TƯ VẤN, CHĂM SÓC. \r- ĐÁNH GIÁ KẾT QUẢ, TỈ LỆ THÀNH CÔNG. XÂY DỰNG PHƯƠNG ÁN, KẾ HOẠCH CÔNG VIỆC. \r2. \rNHÂN VIÊN TỔ CHỨC HÀNH CHÍNH VÀ CHĂM SÓC KHÁCH HÀNG. \rMÔ TẢ CÔNG VIỆC: \r- SOẠN THẢO CÔNG VĂN, GIẤY TỜ, VĂN BẢN \r- THEO DI HỢP ĐỒNG \r- CHĂM SÓC KHÁCH HÀNG (KHÁCH HÀNG SỬ DỤNG DỊCH VỤ XE ĐƯA ĐÓN SÂN BAY, ĐI TỈNH VÀ CÁC KHÁCH HÀNG ĐẠI LÝ, CÔNG TY) \r- TƯ VẤN, GIẢI ĐÁP THẮC MẮC, THUYẾT PHỤC KHÁCH HÀNG TIỀM NĂNG SỬ DỤNG DỊCH VỤ \r- ĐĂNG TIN DỊCH VỤ CÔNG TY TRÊN CÁC WEBSITE MUA BÁN, RAO VẶT, WEBSITE VÀ FACEBOOK (SẼ ĐƯỢC HƯỚNG DẪN ĐẦY ĐỦ) \r- XỬ LÝ CÁC CÔNG VIỆC HÀNH CHÍNH CỦA PHÒNG TỔNG HỢP \r3. \rNHÂN VIÊN ĐIỀU HÀNH XE \r- TỔ CHỨC SẮP XẾP VÀ ĐIỀU PHỐI XE CHO KHÁCH HÀNG \r- BẢO ĐẢM LÁI XE CHẤP HÀNH ĐÚNG QUY ĐỊNH, TIÊU CHUẨN PHỤC VỤ KHÁCH HÀNG CỦA CÔNG TY \r- QUẢN LÝ THÔNG TIN CỦA LÁI XE VÀ CẬP NHẬT THÔNG TIN LÁI XE LÊN HỆ THỐNG PHẦN MỀM \r4. \rNHÂN VIÊN MARKETING \r- TÌM KIẾM, PHÁT TRIỂN KHÁCH HÀNG CHO SẢN PHẨM QUA CÁC KÊNH MARKETING ONLINE NHƯ SMS BRANDNAME, EMAIL MARKETING, FACEBOOK, GOOGLE KÊNH SMS BRANDNAME VÀ CÁC KÊNH QUẢNG CÁO KHÁC... \r- LẬP CÁC KẾ HOẠCH TRUYỀN THÔNG, KHUYẾN MẠI ĐỂ HOÀN THÀNH CHỈ TIÊU DOANH THU CHO DỊCH VỤ MÌNH QUẢN LÝ. \r- CHĂM SÓC, HỖ TRỢ KHÁCH HÀNG DO MÌNH PHÁT TRIỂN ĐỂ ĐẢM BẢO DOANH SỐ CÁ NHÂN ĐỊNH KỲ. \r- CHỦ ĐỘNG, SÁNG KIẾN TRONG VIỆC ĐƯA RA CÁC Ý TƯỞNG MỚI. \r5. \rTHỰC TẬP VIÊN \r- THAM GIA HỖ TRỢ NHÂN VIÊN CHÍNH THỨC \r- THAM GIA HOẠT ĐỘNG NHÓM, ĐƯA Ý TƯỞNG, SANG TẠO CHO DỰ ÁN \rQUYỀN LỢI: \rV LÀM VIỆC MÔI TRƯỜNG TRẺ TRUNG, NĂNG ĐỘNG VÀ NGÀNH ĐANG HOT HIỆN NAY: TAXI CÔNG NGHỆ \rV CÓ CƠ HỘI HỌC HỎI, PHÁT TRIỂN, THĂNG TIẾN CAO \rV LƯƠNG THƯỞNG XỨNG ĐÁNG THEO NĂNG LỰC \rV ĐƯỢC THAM QUAN, DU LỊCH NĂM 1-2 LẦN \rV ĐƯỢC LUÂN CHUYỂN GIỮA CÁC MẢNG CỦA CÔNG TY KHI CÓ NGUYỆN VỌNG \rYU CẦU HỒ SƠ & ỨNG VIÊN \r CÔNG TY MONG MUỐN TÌM CÁC BẠN NĂNG ĐỘNG, NHIỆT HUYẾT, SÁNG TẠO, ỨNG VIÊN CHƯA KINH NGHIỆM SẼ ĐƯỢC ĐÀO TẠO, HƯỚNG NGHIỆP. CÓ KINH NGHIỆM LÀ ĐIỂM CỘNG KHI PHỎNG VẤN \rÜ HỒ SƠ GỒM: ĐƠN XIN VIỆC, SƠ YẾU LÝ LỊCH. \rÜ CÁC BẰNG CẤP CÓ LIÊN QUAN. \rÜ HỒ SƠ ỨNG VIÊN GỬI VỀ THEO ĐỊA CHỈ EMAIL: \rCONTACT@APKA.VN\rÜ HOẶC LIÊN HỆ THEO SỐ ĐIỆN THOẠI \r0914.198.008/ 0981.370.360\rĐỂ NỘP HỒ SƠ TẠI VĂN PHÒNG CÔNG TY TẠI TÒA NHÀ NÀNG HƯƠNG, 583 NGUYỄN TRÃI, THANH XUÂN, HÀ NỘI. \r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (45,'2018-04-13 16:43:52','iblock','81','s1',0,'=ID=81&EXTERNAL_ID=81&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=doi-tac-cua-chung-toi','Đối tác của chúng tôi','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','ĐỐI TÁC CỦA CHÚNG TÔI\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (63,'2018-05-07 14:27:13','iblock','241','s1',0,'=ID=241&EXTERNAL_ID=241&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=14&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','xe 4 cho','','','XE 4 CHO\r\n\r\n','vn','14',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (64,'2018-05-07 14:27:30','iblock','242','s1',0,'=ID=242&EXTERNAL_ID=242&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=14&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','Xe 7 cho','','','XE 7 CHO\r\n\r\n','vn','14',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (65,'2018-05-07 17:05:52','iblock','249','s1',0,'=ID=249&EXTERNAL_ID=249&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=15&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','đại lí 1','','','ĐẠI LÍ 1\r\n\r\n','vn','15',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (66,'2018-05-07 17:31:52','iblock','253','s1',0,'=ID=253&EXTERNAL_ID=253&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=15&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=','dai li b','','','DAI LI B\r\n\r\n','vn','15',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (46,'2018-04-13 16:46:32','iblock','82','s1',0,'=ID=82&EXTERNAL_ID=82&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=khach-hang-thuong-xuyen','Khách hàng thường xuyên','Chương tr&igrave;nh \rKh&aacute;ch h&agrave;ng thường xuy&ecirc;n\r mong muốn đem tới những ưu đ&atilde;i cho những khách hàng thường xuyên sử dụng dịch vụ v&acirc;̣n chuyển của \rhttp://apka.vn\r. Nếu bạn là Hội viên của Chương trình Khách hàng thường xuyên, sau mỗi chuyến đi với \rhttp://apka.vn\r hoặc sau mỗi lần sử dụng sản phẩm, dịch vụ, điểm (s&ocirc;́ km đã đi) sẽ được t&iacute;ch luỹ vào tài khoản của Bạn và bạn c&oacute; thể dễ dàng chuyển điểm thành những phần thưởng giá trị cho mình và cho người thân.\rLợi ích khi tham gia chương trình Khách hàng Thường xuyên: \rKhách hàng sử dụng dịch vụ 10 lần (mỗi chiều tính là 1 lần) thì sẽ được giảm 20.000 đ cho lần sử dụng dịch vụ thứ 11\rNhận thông báo thường xuyên về các chương trình khuyến mãi, giảm giá của apka.vn và ưu tiên đăng k&yacute; tham gia nếu có nhu cầu.\rNâng hạng xe, hạng chỗ nếu trên Hệ thống của \rhttp://apka.vn\r c&ograve;n xe/ còn chỗ trống c&ugrave;ng hành trình.\rĐể trở thành hội viên Chương trình Khách hàng thường xuyên, Quý khách chỉ cần tạo tài khoản và mỗi lần đặt xe sẽ được tích điểm trong thông tin tài khoản.','','KHÁCH HÀNG THƯỜNG XUYÊN\r\nCHƯƠNG TRNH \rKHCH HNG THƯỜNG XUYN\r MONG MUỐN ĐEM TỚI NHỮNG ƯU ĐI CHO NHỮNG KHÁCH HÀNG THƯỜNG XUYÊN SỬ DỤNG DỊCH VỤ ṾN CHUYỂN CỦA \rHTTP://APKA.VN\r. NẾU BẠN LÀ HỘI VIÊN CỦA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, SAU MỖI CHUYẾN ĐI VỚI \rHTTP://APKA.VN\r HOẶC SAU MỖI LẦN SỬ DỤNG SẢN PHẨM, DỊCH VỤ, ĐIỂM (Ś KM ĐÃ ĐI) SẼ ĐƯỢC TCH LUỸ VÀO TÀI KHOẢN CỦA BẠN VÀ BẠN C THỂ DỄ DÀNG CHUYỂN ĐIỂM THÀNH NHỮNG PHẦN THƯỞNG GIÁ TRỊ CHO MÌNH VÀ CHO NGƯỜI THÂN.\rLỢI ÍCH KHI THAM GIA CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN: \rKHÁCH HÀNG SỬ DỤNG DỊCH VỤ 10 LẦN (MỖI CHIỀU TÍNH LÀ 1 LẦN) THÌ SẼ ĐƯỢC GIẢM 20.000 Đ CHO LẦN SỬ DỤNG DỊCH VỤ THỨ 11\rNHẬN THÔNG BÁO THƯỜNG XUYÊN VỀ CÁC CHƯƠNG TRÌNH KHUYẾN MÃI, GIẢM GIÁ CỦA APKA.VN VÀ ƯU TIÊN ĐĂNG K THAM GIA NẾU CÓ NHU CẦU.\rNÂNG HẠNG XE, HẠNG CHỖ NẾU TRÊN HỆ THỐNG CỦA \rHTTP://APKA.VN\r CN XE/ CÒN CHỖ TRỐNG CNG HÀNH TRÌNH.\rĐỂ TRỞ THÀNH HỘI VIÊN CHƯƠNG TRÌNH KHÁCH HÀNG THƯỜNG XUYÊN, QUÝ KHÁCH CHỈ CẦN TẠO TÀI KHOẢN VÀ MỖI LẦN ĐẶT XE SẼ ĐƯỢC TÍCH ĐIỂM TRONG THÔNG TIN TÀI KHOẢN.\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (47,'2018-03-31 01:07:46','iblock','83','s1',0,'=ID=83&EXTERNAL_ID=83&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=khach-hang-to-chuc','Khách hàng tổ chức','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','KHÁCH HÀNG TỔ CHỨC\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (48,'2018-03-31 01:07:32','iblock','84','s1',0,'=ID=84&EXTERNAL_ID=84&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=chia-se-doanh-thu','Chia sẻ doanh thu','Th&ocirc;ng tin đang cập nhật. Bạn vui l&ograve;ng trở lại sau','','CHIA SẺ DOANH THU\r\nTHNG TIN ĐANG CẬP NHẬT. BẠN VUI LNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (51,'2018-03-31 01:08:33','iblock','87','s1',0,'=ID=87&EXTERNAL_ID=87&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=bao-ve-quyen-rieng-tu','Bảo vệ quyền riêng tư','Phạm vi &aacute;p dụng:\rPhần Qui định bảo vệ Quyền ri&ecirc;ng tư n&agrave;y tr&igrave;nh bày về việc ch&uacute;ng t&ocirc;i xử l&yacute; thông tin nhận dạng cá nh&acirc;n mà chúng tôi thu thập được khi bạn ở trong trang web hoặc ứng dụng di động của chúng tôi , và khi bạn sử dụng các dịch vụ của chúng tôi hoặc dịch vụ của các đối tác nhưng c&oacute; liên kết với dịch vụ của chúng tôi.\rQuy định này không áp dụng cho những cách thức xử lý thông tin của các công ty mà chúng tôi không sở hữu hoặc kiểm soát, hoặc những người không phải là nhân viên của chúng tôi hay những người không do chúng tôi quản lý.\rCách thức chúng tôi thu thập thông tin:\rChúng tôi thu thập các thông tin nhận dạng cá nhân khi bạn đăng ký sử dụng hoặc sử dụng một số dịch vụ của chúng tôi. Chúng tôi cũng có thể nhận được các thông tin nhận dạng cá nhân do các đối tác cung cấp khi bạn sử dụng dịch vụ của họ nhưng có sự liên kết phối hợp cung cấp của chúng tôi Chúng tôi cũng tự động nhận được và ghi lại các thông tin trong các tập tin ghi ch&eacute;p trong máy chủ của chúng tôi từ cửa sổ trình duyệt của bạn, trong đó bao gồm địa chỉ IP, thông tin về tập tin cookie.\rDữ liệu chúng tôi thu thập:\rĐể vận hành trang web và cung cấp cho bạn thông tin về sản phẩm hoặc dịch vụ có thể được bạn quan tâm, chúng tôi có thể thu thập:\rDữ liệu cá nhân: tức là thông tin có thể được sử dụng để liên lạc với bạn trực tiếp mà không sử dụng trang web bao gồm họ tên, địa chỉ bưu ch&iacute;nh, số điện thoại, thông tin tài khoản ngân hàng/thẻ tín dụng / thẻ ghi nợ, hoặc địa chỉ email.\rDữ liệu Nhân khẩu học: (những thông tin không phải là thông tin cá nhân, bao gồm nhưng không giới hạn ở m&atilde; v&ugrave;ng, quê hương, giới tính, tuổi, ngày tháng năm sinh, lịch sử duyệt web, lịch sử tìm kiếm thông tin.\rDữ liệu vị trí: Dịch vụ của chúng tôi có thể sử dụng các công nghệ hỗ trợ định vị như Google Maps. Nếu bạn sử dụng các dịch vụ này, Google có thể nhận thông tin về vị trí thực của bạn (ví dụ như tín hiệu GPS được gửi qua thiết bị di động) hoặc thông tin có thể được sử dụng để xác định vị trí (như ID điện thoại di động).\rChúng tôi sử dụng thông tin của bạn cho mục đích gì?\rChúng tôi sử dụng địa chỉ email của bạn và các thông tin cá nhân của bạn để giúp chúng vận hành một cách có hiệu quả các trang web và dịch vụ, liên lạc với bạn khi bạn thực hiện các giao dịch đặt chỗ, để chuyển tiếp thông tin chuyến đi từ những người dùng trang web khác đến cho bạn;  và các hoạt động khác trên trang web (ví dụ gửi tin tức quan trọng mà có thể bạn quan tâm. Trong một số trường hợp, chúng tôi có thể gửi cho bạn các hoạt động truyền thông chứa nội dung thương mại, chẳng hạn như các banner quảng cáo và cung cấp đặc biệt dạng giảm giá hoặc khuyến mại).\rChúng tôi có thể sử dụng các thông tin về vị trí để tối ưu hóa các hoạt động được thiết kế cho các thiết bị cầm tay thông minh. Các ứng dụng này sẽ làm cho việc đặt chỗ và theo d&otilde;i xe đến đón cũng như tìm kiếm hành khách một cách thuận lợi và linh hoạt hơn phương thức qua website.\rTiết lộ và chia sẻ thông tin\rChúng tôi chỉ chia sẻ thông tin cá nhân với các công ty hoặc cá nhân khác bên ngoài trong những trường hợp giới hạn sau:\rChúng tôi được bạn đồng ý cho tiết lộ thông tin đó.\rChúng tôi cần tiết lộ thông tin của bạn để cung cấp các sản phẩm hoặc dịch vụ mà bạn yêu cầu.\rChúng tôi cần gửi thông tin đó cho những công ty hoạt động thay mặt cho chúng tôi để cung cấp sản phẩm hoặc dịch vụ cho bạn. (Trừ khi chúng tôi thông báo cho bạn biết nội dung khác, các công ty này không có quyền sử dụng các thông tin nhận dạng cá nhân mà chúng tôi cung cấp cho họ vượt quá phạm vi cần thiết để trợ giúp chúng tôi).\rChúng tôi tuân theo các trát lệnh, lệnh t&ograve;a án hoặc thủ tục pháp lý.\rCập nhật hoặc xóa thông tin\rKhi bạn sử dụng các dịch vụ của chúng tôi, chúng tôi thật sự cố gắng cung cấp cho bạn quyền truy cập vào thông tin cá nhân của bạn hoặc để chỉnh sửa dữ liệu này nếu chưa chính xác hoặc xoá dữ liệu đó theo yêu cầu của bạn nếu dữ liệu này không được luật pháp yêu cầu giữ lại. Bạn có thể chỉnh sửa hồ sơ của bạn bất cứ lúc nào. Tất cả những gì bạn cần là tên người dùng và mật khẩu của bạn.\rBảo mật thông tin\rChúng tôi sử dụng các biện pháp bảo mật thích hợp để bảo vệ việc truy cập hoặc sửa đổi, tiết lộ hoặc huỷ dữ liệu một cách trái phép. Các biện pháp này bao gồm xem xét nội bộ các thực tiễn thu thập, lưu trữ và xử lý dữ liệu cũng như các biện pháp bảo mật, bao gồm các biện pháp bảo mật vật lý và mã hoá thích hợp để bảo vệ chống truy cập trái phép vào hệ thống lưu trữ dữ liệu cá nhân của chúng tôi.\rNhững thay đổi về Quy định bảo vệ Quyền riêng tư này\rĐôi khi chúng tôi có thể sửa đổi qui định này. Nếu có những thay đổi, chúng tôi sẽ thông báo cho bạn bằng cách đăng thông báo ở vị trí dễ nhận thấy trên các trang web của chúng tôi. Bạn đồng ý rằng thông báo được đăng như vậy sẽ được coi như là bản thông báo đầy đủ và thỏa đáng cho bạn về những thay đổi nói trên.Bạn đồng ý rằng nếu bạn tiếp tục sử dụng các dịch vụ và sản phẩm của chúng tôi sau khi có sự sửa đổi đó, điều đó có nghĩa là bạn chấp nhận và đồng ý tuân theo qui định được sửa đổi.\rCác thắc mắc hoặc gợi ý\rNếu bạn có bất kỳ câu hỏi hoặc góp ý nào cho chúng tôi về Quyền riêng tư, bạn có thể liên lạc với chúng tôi tại \rcontact@apka.vn\r.','','BẢO VỆ QUYỀN RIÊNG TƯ\r\nPHẠM VI P DỤNG:\rPHẦN QUI ĐỊNH BẢO VỆ QUYỀN RING TƯ NY TRNH BÀY VỀ VIỆC CHNG TI XỬ L THÔNG TIN NHẬN DẠNG CÁ NHN MÀ CHÚNG TÔI THU THẬP ĐƯỢC KHI BẠN Ở TRONG TRANG WEB HOẶC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI , VÀ KHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HOẶC DỊCH VỤ CỦA CÁC ĐỐI TÁC NHƯNG C LIÊN KẾT VỚI DỊCH VỤ CỦA CHÚNG TÔI.\rQUY ĐỊNH NÀY KHÔNG ÁP DỤNG CHO NHỮNG CÁCH THỨC XỬ LÝ THÔNG TIN CỦA CÁC CÔNG TY MÀ CHÚNG TÔI KHÔNG SỞ HỮU HOẶC KIỂM SOÁT, HOẶC NHỮNG NGƯỜI KHÔNG PHẢI LÀ NHÂN VIÊN CỦA CHÚNG TÔI HAY NHỮNG NGƯỜI KHÔNG DO CHÚNG TÔI QUẢN LÝ.\rCÁCH THỨC CHÚNG TÔI THU THẬP THÔNG TIN:\rCHÚNG TÔI THU THẬP CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN KHI BẠN ĐĂNG KÝ SỬ DỤNG HOẶC SỬ DỤNG MỘT SỐ DỊCH VỤ CỦA CHÚNG TÔI. CHÚNG TÔI CŨNG CÓ THỂ NHẬN ĐƯỢC CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN DO CÁC ĐỐI TÁC CUNG CẤP KHI BẠN SỬ DỤNG DỊCH VỤ CỦA HỌ NHƯNG CÓ SỰ LIÊN KẾT PHỐI HỢP CUNG CẤP CỦA CHÚNG TÔI CHÚNG TÔI CŨNG TỰ ĐỘNG NHẬN ĐƯỢC VÀ GHI LẠI CÁC THÔNG TIN TRONG CÁC TẬP TIN GHI CHP TRONG MÁY CHỦ CỦA CHÚNG TÔI TỪ CỬA SỔ TRÌNH DUYỆT CỦA BẠN, TRONG ĐÓ BAO GỒM ĐỊA CHỈ IP, THÔNG TIN VỀ TẬP TIN COOKIE.\rDỮ LIỆU CHÚNG TÔI THU THẬP:\rĐỂ VẬN HÀNH TRANG WEB VÀ CUNG CẤP CHO BẠN THÔNG TIN VỀ SẢN PHẨM HOẶC DỊCH VỤ CÓ THỂ ĐƯỢC BẠN QUAN TÂM, CHÚNG TÔI CÓ THỂ THU THẬP:\rDỮ LIỆU CÁ NHÂN: TỨC LÀ THÔNG TIN CÓ THỂ ĐƯỢC SỬ DỤNG ĐỂ LIÊN LẠC VỚI BẠN TRỰC TIẾP MÀ KHÔNG SỬ DỤNG TRANG WEB BAO GỒM HỌ TÊN, ĐỊA CHỈ BƯU CHNH, SỐ ĐIỆN THOẠI, THÔNG TIN TÀI KHOẢN NGÂN HÀNG/THẺ TÍN DỤNG / THẺ GHI NỢ, HOẶC ĐỊA CHỈ EMAIL.\rDỮ LIỆU NHÂN KHẨU HỌC: (NHỮNG THÔNG TIN KHÔNG PHẢI LÀ THÔNG TIN CÁ NHÂN, BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở M VNG, QUÊ HƯƠNG, GIỚI TÍNH, TUỔI, NGÀY THÁNG NĂM SINH, LỊCH SỬ DUYỆT WEB, LỊCH SỬ TÌM KIẾM THÔNG TIN.\rDỮ LIỆU VỊ TRÍ: DỊCH VỤ CỦA CHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC CÔNG NGHỆ HỖ TRỢ ĐỊNH VỊ NHƯ GOOGLE MAPS. NẾU BẠN SỬ DỤNG CÁC DỊCH VỤ NÀY, GOOGLE CÓ THỂ NHẬN THÔNG TIN VỀ VỊ TRÍ THỰC CỦA BẠN (VÍ DỤ NHƯ TÍN HIỆU GPS ĐƯỢC GỬI QUA THIẾT BỊ DI ĐỘNG) HOẶC THÔNG TIN CÓ THỂ ĐƯỢC SỬ DỤNG ĐỂ XÁC ĐỊNH VỊ TRÍ (NHƯ ID ĐIỆN THOẠI DI ĐỘNG).\rCHÚNG TÔI SỬ DỤNG THÔNG TIN CỦA BẠN CHO MỤC ĐÍCH GÌ?\rCHÚNG TÔI SỬ DỤNG ĐỊA CHỈ EMAIL CỦA BẠN VÀ CÁC THÔNG TIN CÁ NHÂN CỦA BẠN ĐỂ GIÚP CHÚNG VẬN HÀNH MỘT CÁCH CÓ HIỆU QUẢ CÁC TRANG WEB VÀ DỊCH VỤ, LIÊN LẠC VỚI BẠN KHI BẠN THỰC HIỆN CÁC GIAO DỊCH ĐẶT CHỖ, ĐỂ CHUYỂN TIẾP THÔNG TIN CHUYẾN ĐI TỪ NHỮNG NGƯỜI DÙNG TRANG WEB KHÁC ĐẾN CHO BẠN;  VÀ CÁC HOẠT ĐỘNG KHÁC TRÊN TRANG WEB (VÍ DỤ GỬI TIN TỨC QUAN TRỌNG MÀ CÓ THỂ BẠN QUAN TÂM. TRONG MỘT SỐ TRƯỜNG HỢP, CHÚNG TÔI CÓ THỂ GỬI CHO BẠN CÁC HOẠT ĐỘNG TRUYỀN THÔNG CHỨA NỘI DUNG THƯƠNG MẠI, CHẲNG HẠN NHƯ CÁC BANNER QUẢNG CÁO VÀ CUNG CẤP ĐẶC BIỆT DẠNG GIẢM GIÁ HOẶC KHUYẾN MẠI).\rCHÚNG TÔI CÓ THỂ SỬ DỤNG CÁC THÔNG TIN VỀ VỊ TRÍ ĐỂ TỐI ƯU HÓA CÁC HOẠT ĐỘNG ĐƯỢC THIẾT KẾ CHO CÁC THIẾT BỊ CẦM TAY THÔNG MINH. CÁC ỨNG DỤNG NÀY SẼ LÀM CHO VIỆC ĐẶT CHỖ VÀ THEO DI XE ĐẾN ĐÓN CŨNG NHƯ TÌM KIẾM HÀNH KHÁCH MỘT CÁCH THUẬN LỢI VÀ LINH HOẠT HƠN PHƯƠNG THỨC QUA WEBSITE.\rTIẾT LỘ VÀ CHIA SẺ THÔNG TIN\rCHÚNG TÔI CHỈ CHIA SẺ THÔNG TIN CÁ NHÂN VỚI CÁC CÔNG TY HOẶC CÁ NHÂN KHÁC BÊN NGOÀI TRONG NHỮNG TRƯỜNG HỢP GIỚI HẠN SAU:\rCHÚNG TÔI ĐƯỢC BẠN ĐỒNG Ý CHO TIẾT LỘ THÔNG TIN ĐÓ.\rCHÚNG TÔI CẦN TIẾT LỘ THÔNG TIN CỦA BẠN ĐỂ CUNG CẤP CÁC SẢN PHẨM HOẶC DỊCH VỤ MÀ BẠN YÊU CẦU.\rCHÚNG TÔI CẦN GỬI THÔNG TIN ĐÓ CHO NHỮNG CÔNG TY HOẠT ĐỘNG THAY MẶT CHO CHÚNG TÔI ĐỂ CUNG CẤP SẢN PHẨM HOẶC DỊCH VỤ CHO BẠN. (TRỪ KHI CHÚNG TÔI THÔNG BÁO CHO BẠN BIẾT NỘI DUNG KHÁC, CÁC CÔNG TY NÀY KHÔNG CÓ QUYỀN SỬ DỤNG CÁC THÔNG TIN NHẬN DẠNG CÁ NHÂN MÀ CHÚNG TÔI CUNG CẤP CHO HỌ VƯỢT QUÁ PHẠM VI CẦN THIẾT ĐỂ TRỢ GIÚP CHÚNG TÔI).\rCHÚNG TÔI TUÂN THEO CÁC TRÁT LỆNH, LỆNH TA ÁN HOẶC THỦ TỤC PHÁP LÝ.\rCẬP NHẬT HOẶC XÓA THÔNG TIN\rKHI BẠN SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI, CHÚNG TÔI THẬT SỰ CỐ GẮNG CUNG CẤP CHO BẠN QUYỀN TRUY CẬP VÀO THÔNG TIN CÁ NHÂN CỦA BẠN HOẶC ĐỂ CHỈNH SỬA DỮ LIỆU NÀY NẾU CHƯA CHÍNH XÁC HOẶC XOÁ DỮ LIỆU ĐÓ THEO YÊU CẦU CỦA BẠN NẾU DỮ LIỆU NÀY KHÔNG ĐƯỢC LUẬT PHÁP YÊU CẦU GIỮ LẠI. BẠN CÓ THỂ CHỈNH SỬA HỒ SƠ CỦA BẠN BẤT CỨ LÚC NÀO. TẤT CẢ NHỮNG GÌ BẠN CẦN LÀ TÊN NGƯỜI DÙNG VÀ MẬT KHẨU CỦA BẠN.\rBẢO MẬT THÔNG TIN\rCHÚNG TÔI SỬ DỤNG CÁC BIỆN PHÁP BẢO MẬT THÍCH HỢP ĐỂ BẢO VỆ VIỆC TRUY CẬP HOẶC SỬA ĐỔI, TIẾT LỘ HOẶC HUỶ DỮ LIỆU MỘT CÁCH TRÁI PHÉP. CÁC BIỆN PHÁP NÀY BAO GỒM XEM XÉT NỘI BỘ CÁC THỰC TIỄN THU THẬP, LƯU TRỮ VÀ XỬ LÝ DỮ LIỆU CŨNG NHƯ CÁC BIỆN PHÁP BẢO MẬT, BAO GỒM CÁC BIỆN PHÁP BẢO MẬT VẬT LÝ VÀ MÃ HOÁ THÍCH HỢP ĐỂ BẢO VỆ CHỐNG TRUY CẬP TRÁI PHÉP VÀO HỆ THỐNG LƯU TRỮ DỮ LIỆU CÁ NHÂN CỦA CHÚNG TÔI.\rNHỮNG THAY ĐỔI VỀ QUY ĐỊNH BẢO VỆ QUYỀN RIÊNG TƯ NÀY\rĐÔI KHI CHÚNG TÔI CÓ THỂ SỬA ĐỔI QUI ĐỊNH NÀY. NẾU CÓ NHỮNG THAY ĐỔI, CHÚNG TÔI SẼ THÔNG BÁO CHO BẠN BẰNG CÁCH ĐĂNG THÔNG BÁO Ở VỊ TRÍ DỄ NHẬN THẤY TRÊN CÁC TRANG WEB CỦA CHÚNG TÔI. BẠN ĐỒNG Ý RẰNG THÔNG BÁO ĐƯỢC ĐĂNG NHƯ VẬY SẼ ĐƯỢC COI NHƯ LÀ BẢN THÔNG BÁO ĐẦY ĐỦ VÀ THỎA ĐÁNG CHO BẠN VỀ NHỮNG THAY ĐỔI NÓI TRÊN.BẠN ĐỒNG Ý RẰNG NẾU BẠN TIẾP TỤC SỬ DỤNG CÁC DỊCH VỤ VÀ SẢN PHẨM CỦA CHÚNG TÔI SAU KHI CÓ SỰ SỬA ĐỔI ĐÓ, ĐIỀU ĐÓ CÓ NGHĨA LÀ BẠN CHẤP NHẬN VÀ ĐỒNG Ý TUÂN THEO QUI ĐỊNH ĐƯỢC SỬA ĐỔI.\rCÁC THẮC MẮC HOẶC GỢI Ý\rNẾU BẠN CÓ BẤT KỲ CÂU HỎI HOẶC GÓP Ý NÀO CHO CHÚNG TÔI VỀ QUYỀN RIÊNG TƯ, BẠN CÓ THỂ LIÊN LẠC VỚI CHÚNG TÔI TẠI \rCONTACT@APKA.VN\r.\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (52,'2018-04-13 17:11:00','iblock','88','s1',0,'=ID=88&EXTERNAL_ID=88&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=su-dung-dich-vu','Sử dụng dịch vụ','1. CHẤP NHẬN C&Aacute;C ĐIỀU KHOẢN\rThỏa thuận sau đ&acirc;y l&agrave; một thỏa thuận ràng buộc ph&aacute;p l&yacute; giữa Bạn và \rhttp://apka.vn\r(\"Ch&uacute;ng t&ocirc;i&rdquo;). Thỏa thuận bao gồm các điều khoản dịch vụ mà bạn phải tuân thủ để được quyền tiếp cận và sử dụng dịch vụ  tr&ecirc;n trang Web  và các ứng dụng di động của chúng tôi.  Tại từng thời điểm, chúng tôi c&oacute; thể cập nhật Điều khoản dịch vụ theo quyết định của m&igrave;nh mà không cần thông báo trực tiếp cho bạn. Bạn chịu trách nhiệm tìm hiểu phiên bản mới nhất bằng cách truy cập website http://apka.vn/.\rXIN VUI L&Ograve;NG ĐỌC ĐIỀU KHOẢN DỊCH VỤ N&Agrave;Y MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K&Yacute; LÀM THÀNH VI&Ecirc;N. NẾU BẠN KH&Ocirc;NG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CH&Uacute;NG TÔI.\r2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP\rBạn sẽ nhận được một mật khẩu và tài khoản sau khi hoàn tất thủ tục đăng ký làm thành viên. Bạn có trách nhiệm bảo mật mật khẩu và tài khoản, và hoàn toàn chịu trách nhiệm đối với tất cả các hoạt động diễn ra dưới việc sử dụng mật khẩu hoặc tài khoản của mình. Bạn đồng ý (a) thông báo ngay cho chúng tôi về bất cứ trường hợp nào sử dụng trái ph&eacute;p mật khẩu hoặc tài khoản của bạn hoặc bất cứ trường hợp nào khác vi phạm sự bảo mật, và (b) bảo đảm rằng Bạn luôn thoát khỏi tài khoản của mình sau mỗi lần sử dụng. Chúng tôi không thể và sẽ không chịu trách nhiệm đối với bất cứ tổn thất hoặc thiệt hại nào phát sinh do Bạn không tuân thủ quy định này.\r3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN\rV\rới tư cách là người sử dụng dịch vụ, Bạn phải cam kết:\r(a) bạn có đủ tư cách pháp lý và tư cách hành vi khi sử dụng dịch vụ\r(b) cung cấp các thông tin đầy đủ, trung thực và ch&iacute;nh xác về bản thân trong Hồ sơ cá nhân\r(c) duy trì và cập nhật kịp thời Hồ sơ cá nhân để bảo đảm rằng dữ liệu này là đầy đủ, trung thực và chính xác.\rNếu Bạn cung cấp bất cứ thông tin nào không phải là không trung thực hoặc không chính xác, hoặc nếu chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin đó không trung thực hoặc không chính xác, chúng tôi có quyền đình chỉ hoặc chấm dứt tài khoản của Bạn; từ chối một phần hoặc toàn bộ việc sử dụng Dịch vụ tại thời điểm hiện tại hoặc trong tương lai.\r4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI\rBạn hiểu rằng bạn hoàn toàn chịu trách nhiệm trước pháp luật về các Nội dung bạn tạo ra bao gồm nhưng không giới hạn ở dữ liệu, văn bản, phần mềm, âm thanh, hình ảnh, video, email. Chúng tôi không có nghĩa vụ theo d&otilde;i các tài liệu được đăng và vì vậy, không bảo đảm về tính hợp pháp, chính xác, nguyên vẹn hoặc chất lượng của Nội Dung đó. Tại các khu vực được phép đăng tải Nội dung, bạn có thể chia sẻ thông tin được phép dưới các định dạng chúng tôi mặc định và bạn phải tự chịu trách nhiệm đối với các nội dung, thông tin, hình ảnh và bất kỳ sự chia sẻ nào khác của bạn với cá nhân người sử dụng hoặc nhóm người sử dụng. Tuy nhiên, trong mọi trường hợp, chúng tôi vẫn được bảo lưu quyền xử lý các thông tin đăng tải cho ph&ugrave; hợp với thuần phong mỹ tục, các quy tắc đạo đức và các quy tắc đảm bảo an ninh quốc gia, và chúng tôi có toàn quyền cho phép hoặc không cho phép bài viết của bạn xuất hiện hay tồn tại tại các khu vực được phép chia sẻ thông tin.\r5. HẠN CHẾ HOẠT ĐỘNG\rKhông giới hạn các biện pháp khắc phục hậu quả khác, chúng tôi có thể chấm dứt sự tham gia của bạn, loại bỏ thông tin của bạn  và từ chối cung cấp dịch vụ nếu:\r(a). Bạn đ&atilde; sử dụng sai mục đích các các dịch vụ, có hành vi trái pháp luật hoặc đạo đức.\r(b). chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin bạn cung cấp không trung thực hoặc không chính xác.\r(c). chúng tôi tin rằng hành động của bạn là gian lận, lừa đảo và có thể gây ra tổn thất tài chính hoặc trách nhiệm pháp lý cho  chúng tôi.\r(d). sử dụng các dịch vụ với mục đích thương mại mà không có sự đồng ý trước bằng văn bản đồng ý của chúng tôi.\r(e). vi phạm các quyền của chúng tôi hoặc bên thứ ba, bao gồm nhưng không giới hạn quyền sở hữu trí tuệ, quyền tác giả, bằng sáng chế, thương hiệu, bí mật thương mại hoặc các quyền riêng tư.\r(f). phát tán các ứng dụng độc hại hoặc tấn công chiếm đoạt quyền điều khiển hệ thống, dữ liệu hoặc thông tin cá nhân.\r6. BẢO MẬT\rChúng tôi không bán hoặc cho thuê thông tin của bạn cho bên thứ ba mà không có sự cho phép của bạn và chúng tôi chỉ sử dụng thông tin của bạn như được mô tả trong \rĐiều khoản riêng tư\rChúng tôi xem bảo vệ sự riêng tư của người sử dụng như một nguyên tắc quan trọng hàng đầu. Bạn có thể xem xét lại chính sách bảo mật hiện tại của chúng tôi tại \rĐiều khoản riêng tư\r7. SỞ HỮU TR&Iacute; TUỆ\rTrừ phi được sự đồng ý của chúng tôi, bạn không được phép tải lên, gửi, xuất bản, sửa đổi, tái sản xuất, truyền hoặc phân phát bằng bất cứ hình thức nào bất cứ thành phần nào của Dịch vụ mà chúng tôi cung cấp. Chúng tôi có toàn quyền, bao gồm nhưng không chỉ giới hạn trong các quyền tác giả, thương hiệu, và các quyền sở hữu khác mà chúng tôi có trong các Dịch vụ này .Tất cả các yếu tố cấu thành lên Dịch vụ mà chúng tôi cung cấp đều thuộc phạm vị sở hữu của chúng tôi cho dù đã đăng ký hoặc chưa đăng ký. Việc sử dụng quyền và sở hữu của chúng tôi cần phải được chúng tôi cho phép trước bằng văn bản. Ngoài việc cấp phép bằng văn bản, chúng tôi không cấp phép dưới bất kỳ hình thức nào khác cho dù đó là hình thức công bố hay hàm ý, hoặc thông qua việc để bạn sử dụng dịch vụ. Và do vậy, bạn không có quyền sử dụng Dịch vụ của chúng tôi vào mục đích thương mại mà không có sự cho phép bằng văn bản của chúng tôi trước đó.\r8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP\rThông qua việc đăng ký hoặc sử dụng website và dịch vụ của chúng tôi, bạn mặc nhiên đồng ý và tuân thủ toàn bộ các quy định của Luật pháp Việt Nam . Trong trường hợp một hoặc một số điều khoản của bản Quy định sử dụng này xung đột với các quy định của luật pháp và bị T&ograve;a án coi là vô hiệu, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định của pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.','','SỬ DỤNG DỊCH VỤ\r\n1. CHẤP NHẬN CC ĐIỀU KHOẢN\rTHỎA THUẬN SAU ĐY L MỘT THỎA THUẬN RÀNG BUỘC PHP L GIỮA BẠN VÀ \rHTTP://APKA.VN\r(\"CHNG TI). THỎA THUẬN BAO GỒM CÁC ĐIỀU KHOẢN DỊCH VỤ MÀ BẠN PHẢI TUÂN THỦ ĐỂ ĐƯỢC QUYỀN TIẾP CẬN VÀ SỬ DỤNG DỊCH VỤ  TRN TRANG WEB  VÀ CÁC ỨNG DỤNG DI ĐỘNG CỦA CHÚNG TÔI.  TẠI TỪNG THỜI ĐIỂM, CHÚNG TÔI C THỂ CẬP NHẬT ĐIỀU KHOẢN DỊCH VỤ THEO QUYẾT ĐỊNH CỦA MNH MÀ KHÔNG CẦN THÔNG BÁO TRỰC TIẾP CHO BẠN. BẠN CHỊU TRÁCH NHIỆM TÌM HIỂU PHIÊN BẢN MỚI NHẤT BẰNG CÁCH TRUY CẬP WEBSITE HTTP://APKA.VN/.\rXIN VUI LNG ĐỌC ĐIỀU KHOẢN DỊCH VỤ NY MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG K LÀM THÀNH VIN. NẾU BẠN KHNG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CHNG TÔI.\r2. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP\rBẠN SẼ NHẬN ĐƯỢC MỘT MẬT KHẨU VÀ TÀI KHOẢN SAU KHI HOÀN TẤT THỦ TỤC ĐĂNG KÝ LÀM THÀNH VIÊN. BẠN CÓ TRÁCH NHIỆM BẢO MẬT MẬT KHẨU VÀ TÀI KHOẢN, VÀ HOÀN TOÀN CHỊU TRÁCH NHIỆM ĐỐI VỚI TẤT CẢ CÁC HOẠT ĐỘNG DIỄN RA DƯỚI VIỆC SỬ DỤNG MẬT KHẨU HOẶC TÀI KHOẢN CỦA MÌNH. BẠN ĐỒNG Ý (A) THÔNG BÁO NGAY CHO CHÚNG TÔI VỀ BẤT CỨ TRƯỜNG HỢP NÀO SỬ DỤNG TRÁI PHP MẬT KHẨU HOẶC TÀI KHOẢN CỦA BẠN HOẶC BẤT CỨ TRƯỜNG HỢP NÀO KHÁC VI PHẠM SỰ BẢO MẬT, VÀ (B) BẢO ĐẢM RẰNG BẠN LUÔN THOÁT KHỎI TÀI KHOẢN CỦA MÌNH SAU MỖI LẦN SỬ DỤNG. CHÚNG TÔI KHÔNG THỂ VÀ SẼ KHÔNG CHỊU TRÁCH NHIỆM ĐỐI VỚI BẤT CỨ TỔN THẤT HOẶC THIỆT HẠI NÀO PHÁT SINH DO BẠN KHÔNG TUÂN THỦ QUY ĐỊNH NÀY.\r3. TRÁCH NHIỆM CUNG CẤP THÔNG TIN\rV\rỚI TƯ CÁCH LÀ NGƯỜI SỬ DỤNG DỊCH VỤ, BẠN PHẢI CAM KẾT:\r(A) BẠN CÓ ĐỦ TƯ CÁCH PHÁP LÝ VÀ TƯ CÁCH HÀNH VI KHI SỬ DỤNG DỊCH VỤ\r(B) CUNG CẤP CÁC THÔNG TIN ĐẦY ĐỦ, TRUNG THỰC VÀ CHNH XÁC VỀ BẢN THÂN TRONG HỒ SƠ CÁ NHÂN\r(C) DUY TRÌ VÀ CẬP NHẬT KỊP THỜI HỒ SƠ CÁ NHÂN ĐỂ BẢO ĐẢM RẰNG DỮ LIỆU NÀY LÀ ĐẦY ĐỦ, TRUNG THỰC VÀ CHÍNH XÁC.\rNẾU BẠN CUNG CẤP BẤT CỨ THÔNG TIN NÀO KHÔNG PHẢI LÀ KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC, HOẶC NẾU CHÚNG TÔI CÓ CĂN CỨ HỢP LÝ ĐỂ NGHI NGỜ RẰNG THÔNG TIN ĐÓ KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC, CHÚNG TÔI CÓ QUYỀN ĐÌNH CHỈ HOẶC CHẤM DỨT TÀI KHOẢN CỦA BẠN; TỪ CHỐI MỘT PHẦN HOẶC TOÀN BỘ VIỆC SỬ DỤNG DỊCH VỤ TẠI THỜI ĐIỂM HIỆN TẠI HOẶC TRONG TƯƠNG LAI.\r4. TRÁCH NHIỆM NỘI DUNG ĐĂNG TẢI\rBẠN HIỂU RẰNG BẠN HOÀN TOÀN CHỊU TRÁCH NHIỆM TRƯỚC PHÁP LUẬT VỀ CÁC NỘI DUNG BẠN TẠO RA BAO GỒM NHƯNG KHÔNG GIỚI HẠN Ở DỮ LIỆU, VĂN BẢN, PHẦN MỀM, ÂM THANH, HÌNH ẢNH, VIDEO, EMAIL. CHÚNG TÔI KHÔNG CÓ NGHĨA VỤ THEO DI CÁC TÀI LIỆU ĐƯỢC ĐĂNG VÀ VÌ VẬY, KHÔNG BẢO ĐẢM VỀ TÍNH HỢP PHÁP, CHÍNH XÁC, NGUYÊN VẸN HOẶC CHẤT LƯỢNG CỦA NỘI DUNG ĐÓ. TẠI CÁC KHU VỰC ĐƯỢC PHÉP ĐĂNG TẢI NỘI DUNG, BẠN CÓ THỂ CHIA SẺ THÔNG TIN ĐƯỢC PHÉP DƯỚI CÁC ĐỊNH DẠNG CHÚNG TÔI MẶC ĐỊNH VÀ BẠN PHẢI TỰ CHỊU TRÁCH NHIỆM ĐỐI VỚI CÁC NỘI DUNG, THÔNG TIN, HÌNH ẢNH VÀ BẤT KỲ SỰ CHIA SẺ NÀO KHÁC CỦA BẠN VỚI CÁ NHÂN NGƯỜI SỬ DỤNG HOẶC NHÓM NGƯỜI SỬ DỤNG. TUY NHIÊN, TRONG MỌI TRƯỜNG HỢP, CHÚNG TÔI VẪN ĐƯỢC BẢO LƯU QUYỀN XỬ LÝ CÁC THÔNG TIN ĐĂNG TẢI CHO PH HỢP VỚI THUẦN PHONG MỸ TỤC, CÁC QUY TẮC ĐẠO ĐỨC VÀ CÁC QUY TẮC ĐẢM BẢO AN NINH QUỐC GIA, VÀ CHÚNG TÔI CÓ TOÀN QUYỀN CHO PHÉP HOẶC KHÔNG CHO PHÉP BÀI VIẾT CỦA BẠN XUẤT HIỆN HAY TỒN TẠI TẠI CÁC KHU VỰC ĐƯỢC PHÉP CHIA SẺ THÔNG TIN.\r5. HẠN CHẾ HOẠT ĐỘNG\rKHÔNG GIỚI HẠN CÁC BIỆN PHÁP KHẮC PHỤC HẬU QUẢ KHÁC, CHÚNG TÔI CÓ THỂ CHẤM DỨT SỰ THAM GIA CỦA BẠN, LOẠI BỎ THÔNG TIN CỦA BẠN  VÀ TỪ CHỐI CUNG CẤP DỊCH VỤ NẾU:\r(A). BẠN Đ SỬ DỤNG SAI MỤC ĐÍCH CÁC CÁC DỊCH VỤ, CÓ HÀNH VI TRÁI PHÁP LUẬT HOẶC ĐẠO ĐỨC.\r(B). CHÚNG TÔI CÓ CĂN CỨ HỢP LÝ ĐỂ NGHI NGỜ RẰNG THÔNG TIN BẠN CUNG CẤP KHÔNG TRUNG THỰC HOẶC KHÔNG CHÍNH XÁC.\r(C). CHÚNG TÔI TIN RẰNG HÀNH ĐỘNG CỦA BẠN LÀ GIAN LẬN, LỪA ĐẢO VÀ CÓ THỂ GÂY RA TỔN THẤT TÀI CHÍNH HOẶC TRÁCH NHIỆM PHÁP LÝ CHO  CHÚNG TÔI.\r(D). SỬ DỤNG CÁC DỊCH VỤ VỚI MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ ĐỒNG Ý TRƯỚC BẰNG VĂN BẢN ĐỒNG Ý CỦA CHÚNG TÔI.\r(E). VI PHẠM CÁC QUYỀN CỦA CHÚNG TÔI HOẶC BÊN THỨ BA, BAO GỒM NHƯNG KHÔNG GIỚI HẠN QUYỀN SỞ HỮU TRÍ TUỆ, QUYỀN TÁC GIẢ, BẰNG SÁNG CHẾ, THƯƠNG HIỆU, BÍ MẬT THƯƠNG MẠI HOẶC CÁC QUYỀN RIÊNG TƯ.\r(F). PHÁT TÁN CÁC ỨNG DỤNG ĐỘC HẠI HOẶC TẤN CÔNG CHIẾM ĐOẠT QUYỀN ĐIỀU KHIỂN HỆ THỐNG, DỮ LIỆU HOẶC THÔNG TIN CÁ NHÂN.\r6. BẢO MẬT\rCHÚNG TÔI KHÔNG BÁN HOẶC CHO THUÊ THÔNG TIN CỦA BẠN CHO BÊN THỨ BA MÀ KHÔNG CÓ SỰ CHO PHÉP CỦA BẠN VÀ CHÚNG TÔI CHỈ SỬ DỤNG THÔNG TIN CỦA BẠN NHƯ ĐƯỢC MÔ TẢ TRONG \rĐIỀU KHOẢN RIÊNG TƯ\rCHÚNG TÔI XEM BẢO VỆ SỰ RIÊNG TƯ CỦA NGƯỜI SỬ DỤNG NHƯ MỘT NGUYÊN TẮC QUAN TRỌNG HÀNG ĐẦU. BẠN CÓ THỂ XEM XÉT LẠI CHÍNH SÁCH BẢO MẬT HIỆN TẠI CỦA CHÚNG TÔI TẠI \rĐIỀU KHOẢN RIÊNG TƯ\r7. SỞ HỮU TR TUỆ\rTRỪ PHI ĐƯỢC SỰ ĐỒNG Ý CỦA CHÚNG TÔI, BẠN KHÔNG ĐƯỢC PHÉP TẢI LÊN, GỬI, XUẤT BẢN, SỬA ĐỔI, TÁI SẢN XUẤT, TRUYỀN HOẶC PHÂN PHÁT BẰNG BẤT CỨ HÌNH THỨC NÀO BẤT CỨ THÀNH PHẦN NÀO CỦA DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP. CHÚNG TÔI CÓ TOÀN QUYỀN, BAO GỒM NHƯNG KHÔNG CHỈ GIỚI HẠN TRONG CÁC QUYỀN TÁC GIẢ, THƯƠNG HIỆU, VÀ CÁC QUYỀN SỞ HỮU KHÁC MÀ CHÚNG TÔI CÓ TRONG CÁC DỊCH VỤ NÀY .TẤT CẢ CÁC YẾU TỐ CẤU THÀNH LÊN DỊCH VỤ MÀ CHÚNG TÔI CUNG CẤP ĐỀU THUỘC PHẠM VỊ SỞ HỮU CỦA CHÚNG TÔI CHO DÙ ĐÃ ĐĂNG KÝ HOẶC CHƯA ĐĂNG KÝ. VIỆC SỬ DỤNG QUYỀN VÀ SỞ HỮU CỦA CHÚNG TÔI CẦN PHẢI ĐƯỢC CHÚNG TÔI CHO PHÉP TRƯỚC BẰNG VĂN BẢN. NGOÀI VIỆC CẤP PHÉP BẰNG VĂN BẢN, CHÚNG TÔI KHÔNG CẤP PHÉP DƯỚI BẤT KỲ HÌNH THỨC NÀO KHÁC CHO DÙ ĐÓ LÀ HÌNH THỨC CÔNG BỐ HAY HÀM Ý, HOẶC THÔNG QUA VIỆC ĐỂ BẠN SỬ DỤNG DỊCH VỤ. VÀ DO VẬY, BẠN KHÔNG CÓ QUYỀN SỬ DỤNG DỊCH VỤ CỦA CHÚNG TÔI VÀO MỤC ĐÍCH THƯƠNG MẠI MÀ KHÔNG CÓ SỰ CHO PHÉP BẰNG VĂN BẢN CỦA CHÚNG TÔI TRƯỚC ĐÓ.\r8. KHIẾU NẠI VÀ GIẢI QUYẾT TRANH CHẤP\rTHÔNG QUA VIỆC ĐĂNG KÝ HOẶC SỬ DỤNG WEBSITE VÀ DỊCH VỤ CỦA CHÚNG TÔI, BẠN MẶC NHIÊN ĐỒNG Ý VÀ TUÂN THỦ TOÀN BỘ CÁC QUY ĐỊNH CỦA LUẬT PHÁP VIỆT NAM . TRONG TRƯỜNG HỢP MỘT HOẶC MỘT SỐ ĐIỀU KHOẢN CỦA BẢN QUY ĐỊNH SỬ DỤNG NÀY XUNG ĐỘT VỚI CÁC QUY ĐỊNH CỦA LUẬT PHÁP VÀ BỊ TA ÁN COI LÀ VÔ HIỆU, ĐIỀU KHOẢN ĐÓ SẼ ĐƯỢC CHỈNH SỬA CHO PHÙ HỢP VỚI QUY ĐỊNH CỦA PHÁP LUẬT HIỆN HÀNH, VÀ PHẦN CÒN LẠI CỦA QUY ĐỊNH SỬ DỤNG VẪN GIỮ NGUYÊN GIÁ TRỊ.\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (53,'2018-04-13 16:54:26','iblock','89','s1',0,'=ID=89&EXTERNAL_ID=89&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=giai-quyet-su-co-va-khieu-nai','Giải quyết sự cố và khiếu nại','1. Sự cố ph&aacute;t sinh trong quá tr&igrave;nh đặt chỗ, hủy chỗ\r Trong quá trình đặt chỗ tr&ecirc;n website \rhttp://apka.vn\r, nếu c&oacute; bất kì sự cố n&agrave;o trong quá trình đặt chỗ bao gồm nhưng kh&ocirc;ng giới hạn ở :\rĐiền và xác nhận thông tin về xe/chỗ cần đặt\rQuá trình thanh toán\rHủy chỗ và hoàn tiền\rPhát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến khách hàng không hoàn tất giao dịch đặt chỗ\rKhách hàng h&atilde;y sử dụng một trong những hình thức  hỗ trợ sau:\rChat với bộ phận hỗ trợ khách hàng trực tuyến \rGửi mail về contact@apka.vn\rGọi điện về Tổng đài 0981.370.360\r2. Sự cố phát sinh khi sử dụng dịch vụ\rNếu có trục trặc xảy ra trong việc xác nhận v&eacute; điện tử giữa khách hàng và tài xế, Cơ sở để giải quyết tranh chấp dựa trên các thông tin, chứng từ (mã vé điện tử hoặc thông tin cá nh&acirc;n) do khách hàng cung cấp và đối chiếu, so sánh với thông tin khách hàng cung cấp khi đặt chỗ đã được được lưu trữ trên hệ thống cơ sở dữ liệu của \rhttp://apka.vn\rTrong trường hợp xảy ra khiếu nại liên quan đến thời gian phục vụ. Cơ sở để giải quyết tranh chấp là thông tin khách hàng đã cung cấp về thời gian đón đã ghi nhận trên hệ thống và thời gian chờ được qui định chi tiết trong \rCh&iacute;nh sách vận chuyển\r của ch&uacute;ng tôi. Nếu tài xế  vi phạm về thời gian đã qui định, khách hàng có quyền khiếu nại đ&ograve;i bồi thường.\rTrong trường hợp xảy ra những khiếu nại liên quan đến thái độ và chất lượng phục vụ của tài xế cũng như chất lượng phương tiện. Cơ sở để giải quyết tranh chấp là những nội dung Quí khách trao đổi trực tiếp với tổng đài ( đã được ghi âm)  hoặc các tài liệu chứng minh như ảnh chụp, file âm thanh, lời khai của bên thứ ba.. do Quí khách cung cấp.\rTất cả các sự cố phát sinh khi sử dụng dịch vụ, Quí khách vui lòng liên hệ để được hỗ trợ bằng một trong các cách sau:\rPhản ánh trực tiếp với hãng vận chuyển trực tiếp phục vụ\r3. Sự cố phát sinh khác\rKhi có bất kỳ sự cố nào phát sinh, cơ sở đầu tiên để giải quyết tranh chấp căn cứ vào \rChính sách vận chuyển\r và các \rHướng dẫn sử dụng dịch vụ\r của chúng tôi. Chúng tôi sẽ thực hiện mọi nỗ lực hợp l&yacute; để giải quyết các khiếu nại của khách hàng sử dụng dịch vụ đặt chỗ trực tuyến. Nếu những nỗ lực đó thất bại, khách hàng phải đồng ý rằng bất kỳ khiếu nại, tranh chấp của khách hàng đối với chúng tôi đều được giải quyết theo đúng quy định của pháp luật Việt Nam. \rVui lòng liên hệ bằng một trong các cách sau khi cần hỗ trợ:\rGửi mail về contact@apka.vn\rGọi điện về số hỗ trợ 0981.370.360','','GIẢI QUYẾT SỰ CỐ VÀ KHIẾU NẠI\r\n1. SỰ CỐ PHT SINH TRONG QUÁ TRNH ĐẶT CHỖ, HỦY CHỖ\r TRONG QUÁ TRÌNH ĐẶT CHỖ TRN WEBSITE \rHTTP://APKA.VN\r, NẾU C BẤT KÌ SỰ CỐ NO TRONG QUÁ TRÌNH ĐẶT CHỖ BAO GỒM NHƯNG KHNG GIỚI HẠN Ở :\rĐIỀN VÀ XÁC NHẬN THÔNG TIN VỀ XE/CHỖ CẦN ĐẶT\rQUÁ TRÌNH THANH TOÁN\rHỦY CHỖ VÀ HOÀN TIỀN\rPHÁT SINH LỖI KỸ THUẬT, LỖI PHẦN MỀM HOẶC CÁC LỖI KHÁCH QUAN KHÁC DẪN ĐẾN KHÁCH HÀNG KHÔNG HOÀN TẤT GIAO DỊCH ĐẶT CHỖ\rKHÁCH HÀNG HY SỬ DỤNG MỘT TRONG NHỮNG HÌNH THỨC  HỖ TRỢ SAU:\rCHAT VỚI BỘ PHẬN HỖ TRỢ KHÁCH HÀNG TRỰC TUYẾN \rGỬI MAIL VỀ CONTACT@APKA.VN\rGỌI ĐIỆN VỀ TỔNG ĐÀI 0981.370.360\r2. SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH VỤ\rNẾU CÓ TRỤC TRẶC XẢY RA TRONG VIỆC XÁC NHẬN V ĐIỆN TỬ GIỮA KHÁCH HÀNG VÀ TÀI XẾ, CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP DỰA TRÊN CÁC THÔNG TIN, CHỨNG TỪ (MÃ VÉ ĐIỆN TỬ HOẶC THÔNG TIN CÁ NHN) DO KHÁCH HÀNG CUNG CẤP VÀ ĐỐI CHIẾU, SO SÁNH VỚI THÔNG TIN KHÁCH HÀNG CUNG CẤP KHI ĐẶT CHỖ ĐÃ ĐƯỢC ĐƯỢC LƯU TRỮ TRÊN HỆ THỐNG CƠ SỞ DỮ LIỆU CỦA \rHTTP://APKA.VN\rTRONG TRƯỜNG HỢP XẢY RA KHIẾU NẠI LIÊN QUAN ĐẾN THỜI GIAN PHỤC VỤ. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ THÔNG TIN KHÁCH HÀNG ĐÃ CUNG CẤP VỀ THỜI GIAN ĐÓN ĐÃ GHI NHẬN TRÊN HỆ THỐNG VÀ THỜI GIAN CHỜ ĐƯỢC QUI ĐỊNH CHI TIẾT TRONG \rCHNH SÁCH VẬN CHUYỂN\r CỦA CHNG TÔI. NẾU TÀI XẾ  VI PHẠM VỀ THỜI GIAN ĐÃ QUI ĐỊNH, KHÁCH HÀNG CÓ QUYỀN KHIẾU NẠI ĐI BỒI THƯỜNG.\rTRONG TRƯỜNG HỢP XẢY RA NHỮNG KHIẾU NẠI LIÊN QUAN ĐẾN THÁI ĐỘ VÀ CHẤT LƯỢNG PHỤC VỤ CỦA TÀI XẾ CŨNG NHƯ CHẤT LƯỢNG PHƯƠNG TIỆN. CƠ SỞ ĐỂ GIẢI QUYẾT TRANH CHẤP LÀ NHỮNG NỘI DUNG QUÍ KHÁCH TRAO ĐỔI TRỰC TIẾP VỚI TỔNG ĐÀI ( ĐÃ ĐƯỢC GHI ÂM)  HOẶC CÁC TÀI LIỆU CHỨNG MINH NHƯ ẢNH CHỤP, FILE ÂM THANH, LỜI KHAI CỦA BÊN THỨ BA.. DO QUÍ KHÁCH CUNG CẤP.\rTẤT CẢ CÁC SỰ CỐ PHÁT SINH KHI SỬ DỤNG DỊCH VỤ, QUÍ KHÁCH VUI LÒNG LIÊN HỆ ĐỂ ĐƯỢC HỖ TRỢ BẰNG MỘT TRONG CÁC CÁCH SAU:\rPHẢN ÁNH TRỰC TIẾP VỚI HÃNG VẬN CHUYỂN TRỰC TIẾP PHỤC VỤ\r3. SỰ CỐ PHÁT SINH KHÁC\rKHI CÓ BẤT KỲ SỰ CỐ NÀO PHÁT SINH, CƠ SỞ ĐẦU TIÊN ĐỂ GIẢI QUYẾT TRANH CHẤP CĂN CỨ VÀO \rCHÍNH SÁCH VẬN CHUYỂN\r VÀ CÁC \rHƯỚNG DẪN SỬ DỤNG DỊCH VỤ\r CỦA CHÚNG TÔI. CHÚNG TÔI SẼ THỰC HIỆN MỌI NỖ LỰC HỢP L ĐỂ GIẢI QUYẾT CÁC KHIẾU NẠI CỦA KHÁCH HÀNG SỬ DỤNG DỊCH VỤ ĐẶT CHỖ TRỰC TUYẾN. NẾU NHỮNG NỖ LỰC ĐÓ THẤT BẠI, KHÁCH HÀNG PHẢI ĐỒNG Ý RẰNG BẤT KỲ KHIẾU NẠI, TRANH CHẤP CỦA KHÁCH HÀNG ĐỐI VỚI CHÚNG TÔI ĐỀU ĐƯỢC GIẢI QUYẾT THEO ĐÚNG QUY ĐỊNH CỦA PHÁP LUẬT VIỆT NAM. \rVUI LÒNG LIÊN HỆ BẰNG MỘT TRONG CÁC CÁCH SAU KHI CẦN HỖ TRỢ:\rGỬI MAIL VỀ CONTACT@APKA.VN\rGỌI ĐIỆN VỀ SỐ HỖ TRỢ 0981.370.360\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (62,'2018-04-22 10:26:07','main','s1|/app.book/index.php','s1',0,'/app.book/index.php','Furniture Company','Hello\rA\rLT\rToggle navigation\r10\rYou have 10 notifications\r5 new members joined today\nVery long description here that\nmay not fit into the\npage and may cause design problems\n5 new members joined\n25 sales made\nYou changed your username\nView all\rAlexander Pierce\rOnline\rAPKA Tìm xe giá\rVí tài khoản\rnew\rDanh ba phong ve\rnew\rTin khuyen mai\rnew\rLịch sử chuyến đi\rChuyến đi miên phí\rTrợ giúp\rCài đặt\rPhap ly\rLABELS\rNhập điểm bạn cần đến\nVersion\r2.4.0\nCopyright &copy; 2014-2016 \rAlmsaeed Studio\r.\rAll rights\nreserved.','','FURNITURE COMPANY\r\nHELLO\rA\rLT\rTOGGLE NAVIGATION\r10\rYOU HAVE 10 NOTIFICATIONS\r5 NEW MEMBERS JOINED TODAY\nVERY LONG DESCRIPTION HERE THAT\nMAY NOT FIT INTO THE\nPAGE AND MAY CAUSE DESIGN PROBLEMS\n5 NEW MEMBERS JOINED\n25 SALES MADE\nYOU CHANGED YOUR USERNAME\nVIEW ALL\rALEXANDER PIERCE\rONLINE\rAPKA TÌM XE GIÁ\rVÍ TÀI KHOẢN\rNEW\rDANH BA PHONG VE\rNEW\rTIN KHUYEN MAI\rNEW\rLỊCH SỬ CHUYẾN ĐI\rCHUYẾN ĐI MIÊN PHÍ\rTRỢ GIÚP\rCÀI ĐẶT\rPHAP LY\rLABELS\rNHẬP ĐIỂM BẠN CẦN ĐẾN\nVERSION\r2.4.0\nCOPYRIGHT  2014-2016 \rALMSAEED STUDIO\r.\rALL RIGHTS\nRESERVED.\r\n','','','s1',NULL,NULL);
INSERT INTO `b_search_content` VALUES (54,'2018-03-31 01:06:31','iblock','90','s1',0,'=ID=90&EXTERNAL_ID=90&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=huong-dan-dat-xe','Hướng dẫn đặt xe','Hướng dẫn đặt xe...\r\nThông tin đang cập nhật. Bạn vui lòng trở lại sau','','HƯỚNG DẪN ĐẶT XE\r\nHƯỚNG DẪN ĐẶT XE...\r\nTHÔNG TIN ĐANG CẬP NHẬT. BẠN VUI LÒNG TRỞ LẠI SAU\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (55,'2017-12-24 11:49:11','iblock','91','s1',0,'=ID=91&EXTERNAL_ID=91&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=huong-dan-su-dung','Hướng dẫn sử dụng','Nội dung','','HƯỚNG DẪN SỬ DỤNG\r\nNỘI DUNG\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (56,'2017-12-24 11:49:38','iblock','92','s1',0,'=ID=92&EXTERNAL_ID=92&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=9&IBLOCK_CODE=thong-tin&IBLOCK_EXTERNAL_ID=&CODE=cau-hoi-thuong-gap','Câu hỏi thường gặp','Câu 1: \r\nTrả lời:','','CÂU HỎI THƯỜNG GẶP\r\nCÂU 1: \r\nTRẢ LỜI:\r\n','vn','9',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (58,'2018-03-31 01:03:45','iblock','94','s1',0,'=ID=94&EXTERNAL_ID=94&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=10&IBLOCK_CODE=cam-nan-di-lai&IBLOCK_EXTERNAL_ID=&CODE=ve-chung-toi','Về chúng tôi','APKA.VN hiện nay với hơn 4000 đối t&aacute;c lái xe tham gia hợp tác, gi&uacute;p h&agrave;nh khách t&igrave;m được xe giá tốt, lu&ocirc;n giúp chuy&ecirc;n đi vui th&iacute;ch. Dựa trên nền tảng công nghệ website và di động, www.apka.vn phát triển một giải pháp đặt xe trực tuyến giúp kết nối khách hàng, các h&atilde;ng taxi và xe hợp đồng trên toàn lãnh thổ Việt Nam với mục tiêu đem lại những trải nghiệm di chuyển thú vị, tiết kiệm mà không tác động đến môi trường. Hành khách c&oacute; thể sử dụng các công nghệ của APKA để tìm kiếm, lựa chọn và đặt các loại xe từ 4 chỗ đến 8 chỗ với cả hai hình thức di chuyển đi riêng xe và đi chung xe. Giải pháp của APKA cũng giúp cho các hãng taxi và xe hợp đồng thúc đẩy sự trung thành của khách hàng và tối ưu lợi nhuận cho từng chuyến đi. \rAPKA trực thuộc Công ty cổ phần đầu tư \rAn Phát Khánh\rlà một doanh nghiệp hoạt động trong lĩnh vực vận tải theo xu hướng công nghệ mới theo nền kinh tế chia sẻ (trên nền tảng Grab).\rCác lĩnh vực hoạt động: \r1. Mua Bán xe ô tô cũ mới, mua xe trả góp: \rapkauto.vn\r2. Gara bảo dưỡng, sửa chữa xe ô tô: \ranphatauto.com\r3. Đầu tư, cho thuê và hợp tác xe Grab: \ranphatkhanh.vn\r4. Mua bán bảo hiểm ô tô: \ranphatkhanh.vn\r5. Dự án xe Nội Bài, xe chạy tỉnh: \rapka.vn','','VỀ CHÚNG TÔI\r\nAPKA.VN HIỆN NAY VỚI HƠN 4000 ĐỐI TC LÁI XE THAM GIA HỢP TÁC, GIP HNH KHÁCH TM ĐƯỢC XE GIÁ TỐT, LUN GIÚP CHUYN ĐI VUI THCH. DỰA TRÊN NỀN TẢNG CÔNG NGHỆ WEBSITE VÀ DI ĐỘNG, WWW.APKA.VN PHÁT TRIỂN MỘT GIẢI PHÁP ĐẶT XE TRỰC TUYẾN GIÚP KẾT NỐI KHÁCH HÀNG, CÁC HNG TAXI VÀ XE HỢP ĐỒNG TRÊN TOÀN LÃNH THỔ VIỆT NAM VỚI MỤC TIÊU ĐEM LẠI NHỮNG TRẢI NGHIỆM DI CHUYỂN THÚ VỊ, TIẾT KIỆM MÀ KHÔNG TÁC ĐỘNG ĐẾN MÔI TRƯỜNG. HÀNH KHÁCH C THỂ SỬ DỤNG CÁC CÔNG NGHỆ CỦA APKA ĐỂ TÌM KIẾM, LỰA CHỌN VÀ ĐẶT CÁC LOẠI XE TỪ 4 CHỖ ĐẾN 8 CHỖ VỚI CẢ HAI HÌNH THỨC DI CHUYỂN ĐI RIÊNG XE VÀ ĐI CHUNG XE. GIẢI PHÁP CỦA APKA CŨNG GIÚP CHO CÁC HÃNG TAXI VÀ XE HỢP ĐỒNG THÚC ĐẨY SỰ TRUNG THÀNH CỦA KHÁCH HÀNG VÀ TỐI ƯU LỢI NHUẬN CHO TỪNG CHUYẾN ĐI. \rAPKA TRỰC THUỘC CÔNG TY CỔ PHẦN ĐẦU TƯ \rAN PHÁT KHÁNH\rLÀ MỘT DOANH NGHIỆP HOẠT ĐỘNG TRONG LĨNH VỰC VẬN TẢI THEO XU HƯỚNG CÔNG NGHỆ MỚI THEO NỀN KINH TẾ CHIA SẺ (TRÊN NỀN TẢNG GRAB).\rCÁC LĨNH VỰC HOẠT ĐỘNG: \r1. MUA BÁN XE Ô TÔ CŨ MỚI, MUA XE TRẢ GÓP: \rAPKAUTO.VN\r2. GARA BẢO DƯỠNG, SỬA CHỮA XE Ô TÔ: \rANPHATAUTO.COM\r3. ĐẦU TƯ, CHO THUÊ VÀ HỢP TÁC XE GRAB: \rANPHATKHANH.VN\r4. MUA BÁN BẢO HIỂM Ô TÔ: \rANPHATKHANH.VN\r5. DỰ ÁN XE NỘI BÀI, XE CHẠY TỈNH: \rAPKA.VN\r\n','vn','10',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (59,'2018-01-31 23:10:54','main','s1|/index.php','s1',0,'/index.php','Furniture Company','Thoải mái như xe nhà. Giá rẻ như xe khách\rSân bay\rĐường dài\rTrong thành phố\r×\r×\rXEM GIÁ\rĐảm bảo Giá tốt nhất\rSo sánh hãng để chọn giá tốt nhất\rBù giá nếu tìm được giá tốt hơn\rĐặt sớm tiết kiệm thêm 30%\rCam kết chất lượng\rLuôn có xe nếu đặt trước\rBồi thường nếu đón muộn\rHoàn tiền nếu không hài lòng\rTiện ích đặc biệt\rDịch vụ đi ghép giá siêu rẻ\rThể hiện phong cách sống xanh\rĐi lại thân thiện với môi trường','','FURNITURE COMPANY\r\nTHOẢI MÁI NHƯ XE NHÀ. GIÁ RẺ NHƯ XE KHÁCH\rSÂN BAY\rĐƯỜNG DÀI\rTRONG THÀNH PHỐ\r×\r×\rXEM GIÁ\rĐẢM BẢO GIÁ TỐT NHẤT\rSO SÁNH HÃNG ĐỂ CHỌN GIÁ TỐT NHẤT\rBÙ GIÁ NẾU TÌM ĐƯỢC GIÁ TỐT HƠN\rĐẶT SỚM TIẾT KIỆM THÊM 30%\rCAM KẾT CHẤT LƯỢNG\rLUÔN CÓ XE NẾU ĐẶT TRƯỚC\rBỒI THƯỜNG NẾU ĐÓN MUỘN\rHOÀN TIỀN NẾU KHÔNG HÀI LÒNG\rTIỆN ÍCH ĐẶC BIỆT\rDỊCH VỤ ĐI GHÉP GIÁ SIÊU RẺ\rTHỂ HIỆN PHONG CÁCH SỐNG XANH\rĐI LẠI THÂN THIỆN VỚI MÔI TRƯỜNG\r\n','','',NULL,NULL,NULL);
INSERT INTO `b_search_content` VALUES (61,'2018-03-31 00:56:40','iblock','141','s1',0,'=ID=141&EXTERNAL_ID=141&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vn&IBLOCK_ID=8&IBLOCK_CODE=tin-tuc&IBLOCK_EXTERNAL_ID=&CODE=chuc-mung-sinh-nhat-02-tuoi','Mừng sinh nhật An Phát Khánh tròn 02 tuổi','Thời gian trôi qua và chứng kiến những đổi thay trong từng bước đi của An Phát Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nhân viên đã cùng nhau đoàn tụ tổng kết, chúc mừng công ty tròn hai tuổi.\r\n\r\n\rThời gian tr&ocirc;i qua v&agrave; chứng kiến những đổi thay trong từng bước đi của An Ph&aacute;t Khánh. Hôm nay ngày 04/1/2018 là một ngày hết sức đặc biệt, đánh dấu mốc lịch sử mới của công ty và toàn thể cán bộ nh&acirc;n vi&ecirc;n đ&atilde; c&ugrave;ng nhau đoàn tụ tổng kết, ch&uacute;c mừng công ty tr&ograve;n hai tuổi.\rMở đầu những tiếng cười n&oacute;i hổ hởi chuẩn bị cho một bữa tiệc hoành tráng, tiếp sau đó là một khoảng thời gian tĩnh lặng cùng nh&igrave;n những khó khăn, thành quả đạt được trong hai năm vừa qua và cùng nhau hướng đến một tương lai mới khi bước sang tuổi thứ ba.\rThay mặt toàn thể công ty Giám đốc công ty đã có một bài phát biểu với nội dung khẳng định thế mạnh của những dịch vụ công ty đang cung cấp trên thị trường hiện nay. Tiếp theo đó là những mục tiêu đặt ra trong năm tới, đạt được những thành tựu như đã đặt ra \rVới đội ngũ nhân viên trẻ trung năng động, 99% là thế hệ 9X nên không có gì làm khó được tinh thần tuổi trẻ, trên con đường thành công của công ty là những đóng góp vô cùng to lớn của những người mang tâm huyết của trẻ này.\rBữa tiệc đã diễn ra với không kh&iacute; vui vẻ, hòa chung với niềm vui đó là những đại diện khách mời từ các đối tác, bạn b&egrave; chiến hữu gần xa cùng chúc nhau thêm những thành công mới, công ty lên một tầm cao mới \rLời cuối xin chúc cho toàn thể cán bộ nhân viên công ty luôn khỏe mạnh, tinh thần sảng khoái để hoàn thành công việc tốt nhất, phát triển bản thân mình một tầm cao mới.\rCùng nhau đưa công ty trở thành một trong những công ty đứng đầu về ngành vận tải trong thời gian tới.','','MỪNG SINH NHẬT AN PHÁT KHÁNH TRÒN 02 TUỔI\r\nTHỜI GIAN TRÔI QUA VÀ CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHÁT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHÂN VIÊN ĐÃ CÙNG NHAU ĐOÀN TỤ TỔNG KẾT, CHÚC MỪNG CÔNG TY TRÒN HAI TUỔI.\r\n\r\n\rTHỜI GIAN TRI QUA V CHỨNG KIẾN NHỮNG ĐỔI THAY TRONG TỪNG BƯỚC ĐI CỦA AN PHT KHÁNH. HÔM NAY NGÀY 04/1/2018 LÀ MỘT NGÀY HẾT SỨC ĐẶC BIỆT, ĐÁNH DẤU MỐC LỊCH SỬ MỚI CỦA CÔNG TY VÀ TOÀN THỂ CÁN BỘ NHN VIN Đ CNG NHAU ĐOÀN TỤ TỔNG KẾT, CHC MỪNG CÔNG TY TRN HAI TUỔI.\rMỞ ĐẦU NHỮNG TIẾNG CƯỜI NI HỔ HỞI CHUẨN BỊ CHO MỘT BỮA TIỆC HOÀNH TRÁNG, TIẾP SAU ĐÓ LÀ MỘT KHOẢNG THỜI GIAN TĨNH LẶNG CÙNG NHN NHỮNG KHÓ KHĂN, THÀNH QUẢ ĐẠT ĐƯỢC TRONG HAI NĂM VỪA QUA VÀ CÙNG NHAU HƯỚNG ĐẾN MỘT TƯƠNG LAI MỚI KHI BƯỚC SANG TUỔI THỨ BA.\rTHAY MẶT TOÀN THỂ CÔNG TY GIÁM ĐỐC CÔNG TY ĐÃ CÓ MỘT BÀI PHÁT BIỂU VỚI NỘI DUNG KHẲNG ĐỊNH THẾ MẠNH CỦA NHỮNG DỊCH VỤ CÔNG TY ĐANG CUNG CẤP TRÊN THỊ TRƯỜNG HIỆN NAY. TIẾP THEO ĐÓ LÀ NHỮNG MỤC TIÊU ĐẶT RA TRONG NĂM TỚI, ĐẠT ĐƯỢC NHỮNG THÀNH TỰU NHƯ ĐÃ ĐẶT RA \rVỚI ĐỘI NGŨ NHÂN VIÊN TRẺ TRUNG NĂNG ĐỘNG, 99% LÀ THẾ HỆ 9X NÊN KHÔNG CÓ GÌ LÀM KHÓ ĐƯỢC TINH THẦN TUỔI TRẺ, TRÊN CON ĐƯỜNG THÀNH CÔNG CỦA CÔNG TY LÀ NHỮNG ĐÓNG GÓP VÔ CÙNG TO LỚN CỦA NHỮNG NGƯỜI MANG TÂM HUYẾT CỦA TRẺ NÀY.\rBỮA TIỆC ĐÃ DIỄN RA VỚI KHÔNG KH VUI VẺ, HÒA CHUNG VỚI NIỀM VUI ĐÓ LÀ NHỮNG ĐẠI DIỆN KHÁCH MỜI TỪ CÁC ĐỐI TÁC, BẠN B CHIẾN HỮU GẦN XA CÙNG CHÚC NHAU THÊM NHỮNG THÀNH CÔNG MỚI, CÔNG TY LÊN MỘT TẦM CAO MỚI \rLỜI CUỐI XIN CHÚC CHO TOÀN THỂ CÁN BỘ NHÂN VIÊN CÔNG TY LUÔN KHỎE MẠNH, TINH THẦN SẢNG KHOÁI ĐỂ HOÀN THÀNH CÔNG VIỆC TỐT NHẤT, PHÁT TRIỂN BẢN THÂN MÌNH MỘT TẦM CAO MỚI.\rCÙNG NHAU ĐƯA CÔNG TY TRỞ THÀNH MỘT TRONG NHỮNG CÔNG TY ĐỨNG ĐẦU VỀ NGÀNH VẬN TẢI TRONG THỜI GIAN TỚI.\r\n','vn','8',NULL,NULL,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_content_freq`
-- 




DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `LANGUAGE_ID` char(2)  NOT NULL,
  `SITE_ID` char(2)  DEFAULT NULL,
  `FREQ` float NOT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_content_group`
-- 




DROP TABLE IF EXISTS `b_search_content_group`;
CREATE TABLE `b_search_content_group` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_GROUP` (`SEARCH_CONTENT_ID`,`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_search_content_group`
-- 


INSERT INTO `b_search_content_group` VALUES (44,2);
INSERT INTO `b_search_content_group` VALUES (45,1);
INSERT INTO `b_search_content_group` VALUES (45,2);
INSERT INTO `b_search_content_group` VALUES (46,1);
INSERT INTO `b_search_content_group` VALUES (46,2);
INSERT INTO `b_search_content_group` VALUES (47,2);
INSERT INTO `b_search_content_group` VALUES (48,2);
INSERT INTO `b_search_content_group` VALUES (51,2);
INSERT INTO `b_search_content_group` VALUES (52,1);
INSERT INTO `b_search_content_group` VALUES (52,2);
INSERT INTO `b_search_content_group` VALUES (53,1);
INSERT INTO `b_search_content_group` VALUES (53,2);
INSERT INTO `b_search_content_group` VALUES (54,2);
INSERT INTO `b_search_content_group` VALUES (55,2);
INSERT INTO `b_search_content_group` VALUES (56,2);
INSERT INTO `b_search_content_group` VALUES (58,1);
INSERT INTO `b_search_content_group` VALUES (58,2);
INSERT INTO `b_search_content_group` VALUES (59,2);
INSERT INTO `b_search_content_group` VALUES (60,1);
INSERT INTO `b_search_content_group` VALUES (60,2);
INSERT INTO `b_search_content_group` VALUES (61,1);
INSERT INTO `b_search_content_group` VALUES (61,2);
INSERT INTO `b_search_content_group` VALUES (62,2);
INSERT INTO `b_search_content_group` VALUES (63,2);
INSERT INTO `b_search_content_group` VALUES (64,2);
INSERT INTO `b_search_content_group` VALUES (65,2);
INSERT INTO `b_search_content_group` VALUES (66,2);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_content_site`
-- 




DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2)  NOT NULL,
  `URL` text ,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_search_content_site`
-- 


INSERT INTO `b_search_content_site` VALUES (60,'s1','');
INSERT INTO `b_search_content_site` VALUES (61,'s1','');
INSERT INTO `b_search_content_site` VALUES (44,'s1','');
INSERT INTO `b_search_content_site` VALUES (45,'s1','');
INSERT INTO `b_search_content_site` VALUES (46,'s1','');
INSERT INTO `b_search_content_site` VALUES (47,'s1','');
INSERT INTO `b_search_content_site` VALUES (48,'s1','');
INSERT INTO `b_search_content_site` VALUES (62,'s1','');
INSERT INTO `b_search_content_site` VALUES (51,'s1','');
INSERT INTO `b_search_content_site` VALUES (52,'s1','');
INSERT INTO `b_search_content_site` VALUES (53,'s1','');
INSERT INTO `b_search_content_site` VALUES (54,'s1','');
INSERT INTO `b_search_content_site` VALUES (55,'s1','');
INSERT INTO `b_search_content_site` VALUES (56,'s1','');
INSERT INTO `b_search_content_site` VALUES (63,'s1','');
INSERT INTO `b_search_content_site` VALUES (58,'s1','');
INSERT INTO `b_search_content_site` VALUES (59,'s1','');
INSERT INTO `b_search_content_site` VALUES (64,'s1','');
INSERT INTO `b_search_content_site` VALUES (65,'s1','');
INSERT INTO `b_search_content_site` VALUES (66,'s1','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_content_stem`
-- 




DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2)  NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8 NOT NULL,
  `TF` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table  `b_search_content_stem`
-- 


INSERT INTO `b_search_content_stem` VALUES (46,'en','000',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','008',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','02',0.1226);
INSERT INTO `b_search_content_stem` VALUES (61,'en','04',0.1944);
INSERT INTO `b_search_content_stem` VALUES (44,'en','0914',0.1115);
INSERT INTO `b_search_content_stem` VALUES (44,'en','0981',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','0981',0.1872);
INSERT INTO `b_search_content_stem` VALUES (44,'en','1-2',0.1115);
INSERT INTO `b_search_content_stem` VALUES (46,'en','10',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','10',0.2529);
INSERT INTO `b_search_content_stem` VALUES (46,'en','11',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','198',0.1115);
INSERT INTO `b_search_content_stem` VALUES (46,'en','20',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','2014-2016',0.1596);
INSERT INTO `b_search_content_stem` VALUES (61,'en','2018',0.1944);
INSERT INTO `b_search_content_stem` VALUES (62,'en','25',0.1596);
INSERT INTO `b_search_content_stem` VALUES (59,'en','30',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','360',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','360',0.1872);
INSERT INTO `b_search_content_stem` VALUES (44,'en','370',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','370',0.1872);
INSERT INTO `b_search_content_stem` VALUES (44,'en','4000',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','4000',0.1345);
INSERT INTO `b_search_content_stem` VALUES (60,'en','4000',0.2581);
INSERT INTO `b_search_content_stem` VALUES (44,'en','583',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','99',0.1226);
INSERT INTO `b_search_content_stem` VALUES (61,'en','9X',0.1226);
INSERT INTO `b_search_content_stem` VALUES (62,'en','ALEXAND',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','ALL',0.2529);
INSERT INTO `b_search_content_stem` VALUES (62,'en','ALMSAE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','AN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (58,'en','AN',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','AN',0.1768);
INSERT INTO `b_search_content_stem` VALUES (61,'en','AN',0.2453);
INSERT INTO `b_search_content_stem` VALUES (60,'en','AN',0.2997);
INSERT INTO `b_search_content_stem` VALUES (44,'en','ANG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','ANG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','ANG',0.1291);
INSERT INTO `b_search_content_stem` VALUES (45,'en','ANG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','ANG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','ANG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','ANG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (60,'en','ANH',0.3623);
INSERT INTO `b_search_content_stem` VALUES (44,'en','ANPHATAUTO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','ANPHATAUTO',0.1345);
INSERT INTO `b_search_content_stem` VALUES (58,'en','ANPHATKHANH',0.2132);
INSERT INTO `b_search_content_stem` VALUES (44,'en','ANPHATKHANH',0.2231);
INSERT INTO `b_search_content_stem` VALUES (51,'en','APKA',0.105);
INSERT INTO `b_search_content_stem` VALUES (60,'en','APKA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (62,'en','APKA',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','APKA',0.1648);
INSERT INTO `b_search_content_stem` VALUES (53,'en','APKA',0.2742);
INSERT INTO `b_search_content_stem` VALUES (44,'en','APKA',0.3131);
INSERT INTO `b_search_content_stem` VALUES (46,'en','APKA',0.3134);
INSERT INTO `b_search_content_stem` VALUES (58,'en','APKA',0.3776);
INSERT INTO `b_search_content_stem` VALUES (44,'en','APKAUTO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','APKAUTO',0.1345);
INSERT INTO `b_search_content_stem` VALUES (53,'en','BA',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','BA',0.1226);
INSERT INTO `b_search_content_stem` VALUES (62,'en','BA',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','BA',0.1648);
INSERT INTO `b_search_content_stem` VALUES (51,'en','BANNER',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','BAO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (52,'en','BAO',0.2414);
INSERT INTO `b_search_content_stem` VALUES (51,'en','BAO',0.2715);
INSERT INTO `b_search_content_stem` VALUES (44,'en','BAY',0.1115);
INSERT INTO `b_search_content_stem` VALUES (59,'en','BAY',0.1667);
INSERT INTO `b_search_content_stem` VALUES (52,'en','BI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (59,'en','BI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (61,'en','BI',0.2453);
INSERT INTO `b_search_content_stem` VALUES (51,'en','BI',0.2949);
INSERT INTO `b_search_content_stem` VALUES (44,'en','BRANDNAM',0.1768);
INSERT INTO `b_search_content_stem` VALUES (52,'en','BU',0.1648);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CAM',0.1039);
INSERT INTO `b_search_content_stem` VALUES (59,'en','CAM',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CAO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CAO',0.1944);
INSERT INTO `b_search_content_stem` VALUES (62,'en','CAUS',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CC',0.1039);
INSERT INTO `b_search_content_stem` VALUES (62,'en','CH',0.1596);
INSERT INTO `b_search_content_stem` VALUES (45,'en','CH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (60,'en','CH',0.2997);
INSERT INTO `b_search_content_stem` VALUES (47,'en','CH',0.3667);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CH',0.4074);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CH',0.4653);
INSERT INTO `b_search_content_stem` VALUES (59,'en','CH',0.4679);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CH',0.6014);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CH',0.6019);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CH',0.6631);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CH',0.6715);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CH',0.686);
INSERT INTO `b_search_content_stem` VALUES (62,'en','CHANG',0.1596);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CHAT',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CHC',0.1226);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CHI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CHI',0.1226);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CHI',0.135);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CHI',0.1872);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CHIA',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CHIA',0.1345);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHIA',0.1665);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CHIA',0.2079);
INSERT INTO `b_search_content_stem` VALUES (48,'en','CHIA',0.2314);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHNG',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CHNG',0.1181);
INSERT INTO `b_search_content_stem` VALUES (60,'en','CHNG',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CHNG',0.1648);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CHNH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHNH',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CHNH',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CHO',0.1944);
INSERT INTO `b_search_content_stem` VALUES (63,'en','CHO',0.2314);
INSERT INTO `b_search_content_stem` VALUES (64,'en','CHO',0.2314);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CHO',0.269);
INSERT INTO `b_search_content_stem` VALUES (60,'en','CHO',0.2997);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CHO',0.3131);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CHO',0.3134);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CHO',0.4061);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHO',0.438);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHP',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CHU',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CHU',0.1226);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CHUNG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CHUNG',0.1345);
INSERT INTO `b_search_content_stem` VALUES (60,'en','CHUNG',0.2997);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CHUY',0.1665);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CHUY',0.2362);
INSERT INTO `b_search_content_stem` VALUES (62,'en','CHUY',0.2529);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CHUY',0.259);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CHUY',0.269);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CHUY',0.2699);
INSERT INTO `b_search_content_stem` VALUES (58,'en','CHUYN',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CN',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CNG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CNG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','CNG',0.1291);
INSERT INTO `b_search_content_stem` VALUES (46,'en','CNG',0.135);
INSERT INTO `b_search_content_stem` VALUES (52,'en','COI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','COI',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','COM',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','COM',0.1345);
INSERT INTO `b_search_content_stem` VALUES (62,'en','COMPANI',0.1596);
INSERT INTO `b_search_content_stem` VALUES (59,'en','COMPANI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CON',0.1226);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CONTACT',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CONTACT',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CONTACT',0.1872);
INSERT INTO `b_search_content_stem` VALUES (51,'en','COOKI',0.105);
INSERT INTO `b_search_content_stem` VALUES (62,'en','COPYRIGHT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (44,'en','CSKH',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CU',0.1226);
INSERT INTO `b_search_content_stem` VALUES (61,'en','CUNG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (53,'en','CUNG',0.2742);
INSERT INTO `b_search_content_stem` VALUES (52,'en','CUNG',0.3295);
INSERT INTO `b_search_content_stem` VALUES (51,'en','CUNG',0.333);
INSERT INTO `b_search_content_stem` VALUES (66,'en','DAI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (62,'en','DANH',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','DESCRIPT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','DESIGN',0.1596);
INSERT INTO `b_search_content_stem` VALUES (60,'en','DI',0.1291);
INSERT INTO `b_search_content_stem` VALUES (61,'en','DI',0.1944);
INSERT INTO `b_search_content_stem` VALUES (52,'en','DI',0.2079);
INSERT INTO `b_search_content_stem` VALUES (44,'en','DI',0.2231);
INSERT INTO `b_search_content_stem` VALUES (51,'en','DI',0.2439);
INSERT INTO `b_search_content_stem` VALUES (58,'en','DI',0.269);
INSERT INTO `b_search_content_stem` VALUES (60,'en','DN',0.2046);
INSERT INTO `b_search_content_stem` VALUES (44,'en','DO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (52,'en','DO',0.1648);
INSERT INTO `b_search_content_stem` VALUES (51,'en','DO',0.1665);
INSERT INTO `b_search_content_stem` VALUES (53,'en','DO',0.1872);
INSERT INTO `b_search_content_stem` VALUES (58,'en','DOANH',0.1345);
INSERT INTO `b_search_content_stem` VALUES (48,'en','DOANH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (44,'en','DOANH',0.259);
INSERT INTO `b_search_content_stem` VALUES (44,'en','DU',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','DUNG',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','DUNG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (51,'en','DUNG',0.1665);
INSERT INTO `b_search_content_stem` VALUES (55,'en','DUNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','DUNG',0.2687);
INSERT INTO `b_search_content_stem` VALUES (52,'en','DUY',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','DUY',0.1665);
INSERT INTO `b_search_content_stem` VALUES (44,'en','EM',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','EM',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','EM',0.135);
INSERT INTO `b_search_content_stem` VALUES (60,'en','EM',0.3623);
INSERT INTO `b_search_content_stem` VALUES (52,'en','EMAIL',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','EMAIL',0.1665);
INSERT INTO `b_search_content_stem` VALUES (44,'en','EMAIL',0.1768);
INSERT INTO `b_search_content_stem` VALUES (44,'en','FACEBOOK',0.1768);
INSERT INTO `b_search_content_stem` VALUES (53,'en','FILE',0.1181);
INSERT INTO `b_search_content_stem` VALUES (62,'en','FIT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','FURNITUR',0.1596);
INSERT INTO `b_search_content_stem` VALUES (59,'en','FURNITUR',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GARA',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','GARA',0.1345);
INSERT INTO `b_search_content_stem` VALUES (59,'en','GH',0.1667);
INSERT INTO `b_search_content_stem` VALUES (53,'en','GHI',0.1872);
INSERT INTO `b_search_content_stem` VALUES (51,'en','GHI',0.2101);
INSERT INTO `b_search_content_stem` VALUES (61,'en','GI',0.1226);
INSERT INTO `b_search_content_stem` VALUES (62,'en','GI',0.2529);
INSERT INTO `b_search_content_stem` VALUES (46,'en','GI',0.3134);
INSERT INTO `b_search_content_stem` VALUES (51,'en','GI',0.333);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GI',0.3536);
INSERT INTO `b_search_content_stem` VALUES (52,'en','GI',0.3596);
INSERT INTO `b_search_content_stem` VALUES (58,'en','GI',0.3776);
INSERT INTO `b_search_content_stem` VALUES (53,'en','GI',0.3923);
INSERT INTO `b_search_content_stem` VALUES (59,'en','GI',0.5);
INSERT INTO `b_search_content_stem` VALUES (60,'en','GIA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (58,'en','GIA',0.1345);
INSERT INTO `b_search_content_stem` VALUES (52,'en','GIA',0.1648);
INSERT INTO `b_search_content_stem` VALUES (46,'en','GIA',0.2139);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GIA',0.2231);
INSERT INTO `b_search_content_stem` VALUES (52,'en','GIAN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (53,'en','GIAN',0.2742);
INSERT INTO `b_search_content_stem` VALUES (61,'en','GIAN',0.2847);
INSERT INTO `b_search_content_stem` VALUES (51,'en','GIAO',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','GIAO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GIP',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','GIP',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GOOGL',0.1115);
INSERT INTO `b_search_content_stem` VALUES (51,'en','GOOGL',0.1665);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GP',0.1115);
INSERT INTO `b_search_content_stem` VALUES (51,'en','GPS',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','GRAB',0.1768);
INSERT INTO `b_search_content_stem` VALUES (58,'en','GRAB',0.2132);
INSERT INTO `b_search_content_stem` VALUES (60,'en','HA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (58,'en','HAI',0.1345);
INSERT INTO `b_search_content_stem` VALUES (61,'en','HAI',0.2453);
INSERT INTO `b_search_content_stem` VALUES (62,'en','HAVE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','HAY',0.105);
INSERT INTO `b_search_content_stem` VALUES (52,'en','HAY',0.1648);
INSERT INTO `b_search_content_stem` VALUES (62,'en','HELLO',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','HERE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (53,'en','HI',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','HI',0.1226);
INSERT INTO `b_search_content_stem` VALUES (59,'en','HI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (60,'en','HI',0.2046);
INSERT INTO `b_search_content_stem` VALUES (51,'en','HI',0.2101);
INSERT INTO `b_search_content_stem` VALUES (58,'en','HI',0.2132);
INSERT INTO `b_search_content_stem` VALUES (44,'en','HI',0.2231);
INSERT INTO `b_search_content_stem` VALUES (52,'en','HI',0.3453);
INSERT INTO `b_search_content_stem` VALUES (44,'en','HNG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','HNG',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','HNG',0.135);
INSERT INTO `b_search_content_stem` VALUES (58,'en','HNH',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','HO',0.135);
INSERT INTO `b_search_content_stem` VALUES (59,'en','HO',0.1667);
INSERT INTO `b_search_content_stem` VALUES (61,'en','HO',0.1944);
INSERT INTO `b_search_content_stem` VALUES (58,'en','HO',0.2132);
INSERT INTO `b_search_content_stem` VALUES (53,'en','HO',0.3053);
INSERT INTO `b_search_content_stem` VALUES (44,'en','HO',0.3346);
INSERT INTO `b_search_content_stem` VALUES (51,'en','HO',0.4995);
INSERT INTO `b_search_content_stem` VALUES (52,'en','HO',0.5244);
INSERT INTO `b_search_content_stem` VALUES (44,'en','HOT',0.1115);
INSERT INTO `b_search_content_stem` VALUES (51,'en','HU',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','HUY',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','HUY',0.1226);
INSERT INTO `b_search_content_stem` VALUES (53,'en','HY',0.1181);
INSERT INTO `b_search_content_stem` VALUES (51,'en','ID',0.105);
INSERT INTO `b_search_content_stem` VALUES (62,'en','INTO',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','IP',0.105);
INSERT INTO `b_search_content_stem` VALUES (62,'en','JOIN',0.2529);
INSERT INTO `b_search_content_stem` VALUES (47,'en','KH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (59,'en','KH',0.2642);
INSERT INTO `b_search_content_stem` VALUES (58,'en','KH',0.3776);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KH',0.4049);
INSERT INTO `b_search_content_stem` VALUES (51,'en','KH',0.4294);
INSERT INTO `b_search_content_stem` VALUES (60,'en','KH',0.4465);
INSERT INTO `b_search_content_stem` VALUES (61,'en','KH',0.4538);
INSERT INTO `b_search_content_stem` VALUES (44,'en','KH',0.4738);
INSERT INTO `b_search_content_stem` VALUES (53,'en','KH',0.5017);
INSERT INTO `b_search_content_stem` VALUES (52,'en','KH',0.5494);
INSERT INTO `b_search_content_stem` VALUES (53,'en','KHAI',0.1181);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KHCH',0.135);
INSERT INTO `b_search_content_stem` VALUES (61,'en','KHI',0.1226);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KHI',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','KHI',0.1768);
INSERT INTO `b_search_content_stem` VALUES (52,'en','KHI',0.2687);
INSERT INTO `b_search_content_stem` VALUES (51,'en','KHI',0.349);
INSERT INTO `b_search_content_stem` VALUES (53,'en','KHI',0.4234);
INSERT INTO `b_search_content_stem` VALUES (60,'en','KHICH',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','KHNG',0.1039);
INSERT INTO `b_search_content_stem` VALUES (53,'en','KHNG',0.1181);
INSERT INTO `b_search_content_stem` VALUES (51,'en','KHO',0.105);
INSERT INTO `b_search_content_stem` VALUES (62,'en','KHO',0.1596);
INSERT INTO `b_search_content_stem` VALUES (61,'en','KHO',0.1944);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KHO',0.2699);
INSERT INTO `b_search_content_stem` VALUES (52,'en','KHO',0.4249);
INSERT INTO `b_search_content_stem` VALUES (60,'en','KHU',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','KHU',0.1648);
INSERT INTO `b_search_content_stem` VALUES (51,'en','KHUY',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','KHUY',0.1115);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KHUY',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','KHUYEN',0.1596);
INSERT INTO `b_search_content_stem` VALUES (60,'en','KI',0.1291);
INSERT INTO `b_search_content_stem` VALUES (59,'en','KI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (61,'en','KI',0.1944);
INSERT INTO `b_search_content_stem` VALUES (51,'en','KI',0.2101);
INSERT INTO `b_search_content_stem` VALUES (58,'en','KI',0.2132);
INSERT INTO `b_search_content_stem` VALUES (44,'en','KI',0.2231);
INSERT INTO `b_search_content_stem` VALUES (58,'en','KINH',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','KINH',0.259);
INSERT INTO `b_search_content_stem` VALUES (46,'en','KM',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','LABEL',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','LAI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (61,'en','LAI',0.1226);
INSERT INTO `b_search_content_stem` VALUES (66,'en','LI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','LI',0.2414);
INSERT INTO `b_search_content_stem` VALUES (44,'en','LI',0.259);
INSERT INTO `b_search_content_stem` VALUES (53,'en','LI',0.3315);
INSERT INTO `b_search_content_stem` VALUES (51,'en','LI',0.4202);
INSERT INTO `b_search_content_stem` VALUES (51,'en','LINH',0.105);
INSERT INTO `b_search_content_stem` VALUES (52,'en','LNG',0.1039);
INSERT INTO `b_search_content_stem` VALUES (45,'en','LNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','LNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','LNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','LO',0.1039);
INSERT INTO `b_search_content_stem` VALUES (58,'en','LO',0.1345);
INSERT INTO `b_search_content_stem` VALUES (62,'en','LONG',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','LT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','LU',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','LU',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','LU',0.1226);
INSERT INTO `b_search_content_stem` VALUES (46,'en','LU',0.135);
INSERT INTO `b_search_content_stem` VALUES (59,'en','LU',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','LU',0.1768);
INSERT INTO `b_search_content_stem` VALUES (60,'en','LU',0.2046);
INSERT INTO `b_search_content_stem` VALUES (52,'en','LU',0.2918);
INSERT INTO `b_search_content_stem` VALUES (60,'en','LUN',0.1291);
INSERT INTO `b_search_content_stem` VALUES (58,'en','LUN',0.1345);
INSERT INTO `b_search_content_stem` VALUES (62,'en','LY',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','MADE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','MAI',0.1596);
INSERT INTO `b_search_content_stem` VALUES (53,'en','MAIL',0.1872);
INSERT INTO `b_search_content_stem` VALUES (61,'en','MANG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','MANG',0.1291);
INSERT INTO `b_search_content_stem` VALUES (51,'en','MAP',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','MARKET',0.2231);
INSERT INTO `b_search_content_stem` VALUES (62,'en','MAY',0.2529);
INSERT INTO `b_search_content_stem` VALUES (62,'en','MEMBER',0.2529);
INSERT INTO `b_search_content_stem` VALUES (62,'en','MI',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','MINH',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','MINH',0.1181);
INSERT INTO `b_search_content_stem` VALUES (52,'en','MNH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','MONG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (46,'en','MONG',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','MU',0.1115);
INSERT INTO `b_search_content_stem` VALUES (46,'en','MU',0.135);
INSERT INTO `b_search_content_stem` VALUES (59,'en','MU',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','MUA',0.259);
INSERT INTO `b_search_content_stem` VALUES (58,'en','MUA',0.269);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NAM',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NAM',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','NAM',0.1181);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NAM',0.1345);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NAM',0.2997);
INSERT INTO `b_search_content_stem` VALUES (62,'en','NAVIG',0.1596);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NAY',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NAY',0.1768);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NAY',0.2046);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NAY',0.2453);
INSERT INTO `b_search_content_stem` VALUES (62,'en','NEW',0.4125);
INSERT INTO `b_search_content_stem` VALUES (45,'en','NG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','NG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (56,'en','NG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (55,'en','NG',0.3667);
INSERT INTO `b_search_content_stem` VALUES (59,'en','NG',0.5283);
INSERT INTO `b_search_content_stem` VALUES (54,'en','NG',0.5372);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NG',0.6322);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NG',0.6566);
INSERT INTO `b_search_content_stem` VALUES (53,'en','NG',0.6765);
INSERT INTO `b_search_content_stem` VALUES (46,'en','NG',0.7031);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NG',0.7345);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NG',0.7412);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NG',0.7702);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NG',0.787);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NGAY',0.1039);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NGH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NGH',0.1291);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NGH',0.1665);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NGH',0.2231);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NGH',0.269);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NGHI',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NGHI',0.1648);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NGHI',0.2132);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NGHI',0.2883);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NGO',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NGO',0.105);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NGO',0.1291);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NGUY',0.1768);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NGUY',0.2079);
INSERT INTO `b_search_content_stem` VALUES (62,'en','NH',0.1596);
INSERT INTO `b_search_content_stem` VALUES (45,'en','NH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','NH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','NH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','NH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NH',0.4468);
INSERT INTO `b_search_content_stem` VALUES (59,'en','NH',0.5);
INSERT INTO `b_search_content_stem` VALUES (53,'en','NH',0.5266);
INSERT INTO `b_search_content_stem` VALUES (46,'en','NH',0.5273);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NH',0.5954);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NH',0.6052);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NH',0.6255);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NH',0.627);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NH',0.6388);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NHAU',0.317);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NHI',0.1115);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NHI',0.3847);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NHN',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NHN',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','NHN',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NHN',0.1944);
INSERT INTO `b_search_content_stem` VALUES (58,'en','NHU',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','NHU',0.135);
INSERT INTO `b_search_content_stem` VALUES (44,'en','NHU',0.1768);
INSERT INTO `b_search_content_stem` VALUES (61,'en','NI',0.1944);
INSERT INTO `b_search_content_stem` VALUES (60,'en','NI',0.2581);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NINH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (53,'en','NO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (62,'en','NOT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','NOTIF',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','NY',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','NY',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','ONLIN',0.1115);
INSERT INTO `b_search_content_stem` VALUES (62,'en','ONLIN',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PAGE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PH',0.1596);
INSERT INTO `b_search_content_stem` VALUES (59,'en','PH',0.1667);
INSERT INTO `b_search_content_stem` VALUES (46,'en','PH',0.2139);
INSERT INTO `b_search_content_stem` VALUES (61,'en','PH',0.2847);
INSERT INTO `b_search_content_stem` VALUES (60,'en','PH',0.3336);
INSERT INTO `b_search_content_stem` VALUES (58,'en','PH',0.3477);
INSERT INTO `b_search_content_stem` VALUES (51,'en','PH',0.454);
INSERT INTO `b_search_content_stem` VALUES (53,'en','PH',0.4724);
INSERT INTO `b_search_content_stem` VALUES (44,'en','PH',0.482);
INSERT INTO `b_search_content_stem` VALUES (52,'en','PH',0.5532);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PHAP',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','PHI',0.1648);
INSERT INTO `b_search_content_stem` VALUES (44,'en','PHNG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (52,'en','PHONG',0.1039);
INSERT INTO `b_search_content_stem` VALUES (60,'en','PHONG',0.1291);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PHONG',0.1596);
INSERT INTO `b_search_content_stem` VALUES (59,'en','PHONG',0.1667);
INSERT INTO `b_search_content_stem` VALUES (52,'en','PHP',0.1648);
INSERT INTO `b_search_content_stem` VALUES (44,'en','PHT',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','PHT',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','PHT',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','PHT',0.1291);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PIERC',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','PROBLEM',0.1596);
INSERT INTO `b_search_content_stem` VALUES (61,'en','QU',0.1226);
INSERT INTO `b_search_content_stem` VALUES (46,'en','QU',0.135);
INSERT INTO `b_search_content_stem` VALUES (52,'en','QU',0.1648);
INSERT INTO `b_search_content_stem` VALUES (44,'en','QU',0.259);
INSERT INTO `b_search_content_stem` VALUES (51,'en','QU',0.2715);
INSERT INTO `b_search_content_stem` VALUES (60,'en','QU',0.2997);
INSERT INTO `b_search_content_stem` VALUES (53,'en','QU',0.3543);
INSERT INTO `b_search_content_stem` VALUES (44,'en','QUA',0.1115);
INSERT INTO `b_search_content_stem` VALUES (60,'en','QUA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','QUA',0.1648);
INSERT INTO `b_search_content_stem` VALUES (51,'en','QUA',0.1665);
INSERT INTO `b_search_content_stem` VALUES (61,'en','QUA',0.2453);
INSERT INTO `b_search_content_stem` VALUES (52,'en','QUAN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','QUAN',0.1768);
INSERT INTO `b_search_content_stem` VALUES (51,'en','QUAN',0.2101);
INSERT INTO `b_search_content_stem` VALUES (53,'en','QUAN',0.2362);
INSERT INTO `b_search_content_stem` VALUES (60,'en','QUANG',0.2046);
INSERT INTO `b_search_content_stem` VALUES (53,'en','QUI',0.1872);
INSERT INTO `b_search_content_stem` VALUES (51,'en','QUI',0.2101);
INSERT INTO `b_search_content_stem` VALUES (44,'en','QUY',0.1768);
INSERT INTO `b_search_content_stem` VALUES (51,'en','QUY',0.333);
INSERT INTO `b_search_content_stem` VALUES (53,'en','QUY',0.3923);
INSERT INTO `b_search_content_stem` VALUES (52,'en','QUY',0.4827);
INSERT INTO `b_search_content_stem` VALUES (44,'en','RA',0.1115);
INSERT INTO `b_search_content_stem` VALUES (60,'en','RA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (52,'en','RA',0.2079);
INSERT INTO `b_search_content_stem` VALUES (53,'en','RA',0.2362);
INSERT INTO `b_search_content_stem` VALUES (61,'en','RA',0.2453);
INSERT INTO `b_search_content_stem` VALUES (44,'en','RAO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (62,'en','RESERV',0.1596);
INSERT INTO `b_search_content_stem` VALUES (58,'en','RI',0.1345);
INSERT INTO `b_search_content_stem` VALUES (51,'en','RI',0.2101);
INSERT INTO `b_search_content_stem` VALUES (52,'en','RI',0.2414);
INSERT INTO `b_search_content_stem` VALUES (62,'en','RIGHT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','RING',0.105);
INSERT INTO `b_search_content_stem` VALUES (52,'en','SAI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (62,'en','SALE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (44,'en','SANG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','SANG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','SAO',0.1291);
INSERT INTO `b_search_content_stem` VALUES (44,'en','SAU',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','SAU',0.1226);
INSERT INTO `b_search_content_stem` VALUES (51,'en','SAU',0.1665);
INSERT INTO `b_search_content_stem` VALUES (52,'en','SAU',0.2079);
INSERT INTO `b_search_content_stem` VALUES (46,'en','SAU',0.2139);
INSERT INTO `b_search_content_stem` VALUES (45,'en','SAU',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','SAU',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','SAU',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','SAU',0.2314);
INSERT INTO `b_search_content_stem` VALUES (53,'en','SAU',0.2362);
INSERT INTO `b_search_content_stem` VALUES (59,'en','SI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (60,'en','SI',0.2046);
INSERT INTO `b_search_content_stem` VALUES (52,'en','SINH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','SINH',0.105);
INSERT INTO `b_search_content_stem` VALUES (61,'en','SINH',0.1226);
INSERT INTO `b_search_content_stem` VALUES (53,'en','SINH',0.3315);
INSERT INTO `b_search_content_stem` VALUES (60,'en','SIU',0.1291);
INSERT INTO `b_search_content_stem` VALUES (44,'en','SMS',0.1768);
INSERT INTO `b_search_content_stem` VALUES (51,'en','SO',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','SO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','SO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (59,'en','SO',0.1667);
INSERT INTO `b_search_content_stem` VALUES (62,'en','STUDIO',0.1596);
INSERT INTO `b_search_content_stem` VALUES (60,'en','SU',0.2581);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TA',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TA',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TAXI',0.1768);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TAXI',0.2132);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TAY',0.105);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TC',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TCH',0.135);
INSERT INTO `b_search_content_stem` VALUES (54,'en','TH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (56,'en','TH',0.2314);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TH',0.3776);
INSERT INTO `b_search_content_stem` VALUES (59,'en','TH',0.4308);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TH',0.4627);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TH',0.4738);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TH',0.4925);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TH',0.5547);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TH',0.5628);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TH',0.6063);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TH',0.6502);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THAM',0.1039);
INSERT INTO `b_search_content_stem` VALUES (58,'en','THAM',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','THAM',0.2139);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THAM',0.259);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THANH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THANH',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','THANH',0.1872);
INSERT INTO `b_search_content_stem` VALUES (60,'en','THAO',0.2046);
INSERT INTO `b_search_content_stem` VALUES (62,'en','THAT',0.1596);
INSERT INTO `b_search_content_stem` VALUES (51,'en','THAY',0.2439);
INSERT INTO `b_search_content_stem` VALUES (61,'en','THAY',0.2453);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THCH',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','THCH',0.1345);
INSERT INTO `b_search_content_stem` VALUES (53,'en','THEO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','THEO',0.1226);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THEO',0.1648);
INSERT INTO `b_search_content_stem` VALUES (58,'en','THEO',0.2132);
INSERT INTO `b_search_content_stem` VALUES (51,'en','THEO',0.2439);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THEO',0.3131);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THI',0.1039);
INSERT INTO `b_search_content_stem` VALUES (59,'en','THI',0.1667);
INSERT INTO `b_search_content_stem` VALUES (51,'en','THI',0.2439);
INSERT INTO `b_search_content_stem` VALUES (60,'en','THI',0.2997);
INSERT INTO `b_search_content_stem` VALUES (45,'en','THNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','THNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','THNG',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THO',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (51,'en','THO',0.1665);
INSERT INTO `b_search_content_stem` VALUES (59,'en','THO',0.1667);
INSERT INTO `b_search_content_stem` VALUES (53,'en','THU',0.1181);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THU',0.1768);
INSERT INTO `b_search_content_stem` VALUES (58,'en','THU',0.2132);
INSERT INTO `b_search_content_stem` VALUES (48,'en','THU',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','THU',0.2918);
INSERT INTO `b_search_content_stem` VALUES (51,'en','THU',0.3151);
INSERT INTO `b_search_content_stem` VALUES (44,'en','THUY',0.1115);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TI',0.1291);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TI',0.135);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TI',0.2079);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TI',0.2132);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TI',0.3131);
INSERT INTO `b_search_content_stem` VALUES (59,'en','TI',0.3333);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TI',0.3443);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TI',0.349);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TI',0.3543);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TIN',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','TIN',0.1596);
INSERT INTO `b_search_content_stem` VALUES (45,'en','TIN',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','TIN',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','TIN',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','TIN',0.2314);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TIN',0.2883);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TIN',0.3053);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TIN',0.4061);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TIN',0.5252);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TINH',0.1944);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TINH',0.2046);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TM',0.1115);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TM',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TO',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TO',0.1345);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TO',0.2046);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TO',0.2918);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TO',0.317);
INSERT INTO `b_search_content_stem` VALUES (62,'en','TODAY',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','TOGGL',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','TR',0.1596);
INSERT INTO `b_search_content_stem` VALUES (45,'en','TR',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','TR',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','TR',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','TR',0.2314);
INSERT INTO `b_search_content_stem` VALUES (56,'en','TR',0.2314);
INSERT INTO `b_search_content_stem` VALUES (59,'en','TR',0.2642);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TR',0.4091);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TR',0.4127);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TR',0.4264);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TR',0.4396);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TR',0.4483);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TR',0.4684);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TR',0.5101);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TR',0.5266);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRANG',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TRANG',0.3151);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRANH',0.1039);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TRANH',0.3053);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TRAO',0.1181);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TRI',0.1345);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TRI',0.1944);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TRI',0.2883);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TRN',0.1115);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TRN',0.1181);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TRN',0.1226);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TRNH',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TRNH',0.1181);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TRNH',0.1291);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TRNH',0.135);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TRONG',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','TRONG',0.135);
INSERT INTO `b_search_content_stem` VALUES (59,'en','TRONG',0.1667);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TRONG',0.1768);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TRONG',0.2949);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TRONG',0.2997);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRONG',0.3118);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TRONG',0.3443);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TRONG',0.4085);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TRUNG',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TRUNG',0.1226);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TRUNG',0.1345);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRUNG',0.2687);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TRUY',0.1115);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TRUY',0.2079);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TRUY',0.2439);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TU',0.2101);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TU',0.2687);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TU',0.317);
INSERT INTO `b_search_content_stem` VALUES (52,'en','TUY',0.1039);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TUY',0.1345);
INSERT INTO `b_search_content_stem` VALUES (53,'en','TUY',0.1872);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TUY',0.2231);
INSERT INTO `b_search_content_stem` VALUES (60,'en','TUY',0.2997);
INSERT INTO `b_search_content_stem` VALUES (58,'en','TY',0.1345);
INSERT INTO `b_search_content_stem` VALUES (51,'en','TY',0.2439);
INSERT INTO `b_search_content_stem` VALUES (44,'en','TY',0.3536);
INSERT INTO `b_search_content_stem` VALUES (61,'en','TY',0.4538);
INSERT INTO `b_search_content_stem` VALUES (60,'en','U23',0.2581);
INSERT INTO `b_search_content_stem` VALUES (62,'en','USERNAM',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','VE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','VERI',0.1596);
INSERT INTO `b_search_content_stem` VALUES (62,'en','VERSION',0.1596);
INSERT INTO `b_search_content_stem` VALUES (58,'en','VI',0.1345);
INSERT INTO `b_search_content_stem` VALUES (46,'en','VI',0.2139);
INSERT INTO `b_search_content_stem` VALUES (53,'en','VI',0.2362);
INSERT INTO `b_search_content_stem` VALUES (61,'en','VI',0.2847);
INSERT INTO `b_search_content_stem` VALUES (51,'en','VI',0.2949);
INSERT INTO `b_search_content_stem` VALUES (60,'en','VI',0.3872);
INSERT INTO `b_search_content_stem` VALUES (52,'en','VI',0.3958);
INSERT INTO `b_search_content_stem` VALUES (44,'en','VI',0.482);
INSERT INTO `b_search_content_stem` VALUES (52,'en','VIDEO',0.1039);
INSERT INTO `b_search_content_stem` VALUES (62,'en','VIEW',0.1596);
INSERT INTO `b_search_content_stem` VALUES (52,'en','VIN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (61,'en','VIN',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','VINH',0.2046);
INSERT INTO `b_search_content_stem` VALUES (51,'en','VN',0.105);
INSERT INTO `b_search_content_stem` VALUES (52,'en','VN',0.1648);
INSERT INTO `b_search_content_stem` VALUES (53,'en','VN',0.2742);
INSERT INTO `b_search_content_stem` VALUES (46,'en','VN',0.3134);
INSERT INTO `b_search_content_stem` VALUES (58,'en','VN',0.3776);
INSERT INTO `b_search_content_stem` VALUES (44,'en','VN',0.3858);
INSERT INTO `b_search_content_stem` VALUES (51,'en','VNG',0.105);
INSERT INTO `b_search_content_stem` VALUES (44,'en','VUI',0.1115);
INSERT INTO `b_search_content_stem` VALUES (60,'en','VUI',0.1291);
INSERT INTO `b_search_content_stem` VALUES (58,'en','VUI',0.1345);
INSERT INTO `b_search_content_stem` VALUES (52,'en','VUI',0.1648);
INSERT INTO `b_search_content_stem` VALUES (53,'en','VUI',0.1872);
INSERT INTO `b_search_content_stem` VALUES (61,'en','VUI',0.1944);
INSERT INTO `b_search_content_stem` VALUES (45,'en','VUI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (47,'en','VUI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (48,'en','VUI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (54,'en','VUI',0.2314);
INSERT INTO `b_search_content_stem` VALUES (52,'en','WEB',0.1039);
INSERT INTO `b_search_content_stem` VALUES (51,'en','WEB',0.333);
INSERT INTO `b_search_content_stem` VALUES (51,'en','WEBSIT',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','WEBSIT',0.1181);
INSERT INTO `b_search_content_stem` VALUES (58,'en','WEBSIT',0.1345);
INSERT INTO `b_search_content_stem` VALUES (52,'en','WEBSIT',0.1648);
INSERT INTO `b_search_content_stem` VALUES (44,'en','WEBSIT',0.2231);
INSERT INTO `b_search_content_stem` VALUES (61,'en','XA',0.1226);
INSERT INTO `b_search_content_stem` VALUES (60,'en','XA',0.1291);
INSERT INTO `b_search_content_stem` VALUES (59,'en','XANH',0.1667);
INSERT INTO `b_search_content_stem` VALUES (51,'en','XE',0.105);
INSERT INTO `b_search_content_stem` VALUES (53,'en','XE',0.1181);
INSERT INTO `b_search_content_stem` VALUES (62,'en','XE',0.1596);
INSERT INTO `b_search_content_stem` VALUES (63,'en','XE',0.2314);
INSERT INTO `b_search_content_stem` VALUES (64,'en','XE',0.2314);
INSERT INTO `b_search_content_stem` VALUES (46,'en','XE',0.2699);
INSERT INTO `b_search_content_stem` VALUES (59,'en','XE',0.3333);
INSERT INTO `b_search_content_stem` VALUES (54,'en','XE',0.3667);
INSERT INTO `b_search_content_stem` VALUES (60,'en','XE',0.4091);
INSERT INTO `b_search_content_stem` VALUES (44,'en','XE',0.4738);
INSERT INTO `b_search_content_stem` VALUES (58,'en','XE',0.5255);
INSERT INTO `b_search_content_stem` VALUES (51,'en','XEM',0.105);
INSERT INTO `b_search_content_stem` VALUES (52,'en','XEM',0.1648);
INSERT INTO `b_search_content_stem` VALUES (59,'en','XEM',0.1667);
INSERT INTO `b_search_content_stem` VALUES (52,'en','XIN',0.1039);
INSERT INTO `b_search_content_stem` VALUES (44,'en','XIN',0.1115);
INSERT INTO `b_search_content_stem` VALUES (61,'en','XIN',0.1226);
INSERT INTO `b_search_content_stem` VALUES (51,'en','XO',0.105);
INSERT INTO `b_search_content_stem` VALUES (58,'en','XU',0.1345);
INSERT INTO `b_search_content_stem` VALUES (44,'en','XU',0.1768);
INSERT INTO `b_search_content_stem` VALUES (52,'en','XU',0.2079);
INSERT INTO `b_search_content_stem` VALUES (52,'en','XUNG',0.1039);
INSERT INTO `b_search_content_stem` VALUES (46,'en','XUY',0.3789);
INSERT INTO `b_search_content_stem` VALUES (46,'en','XUYN',0.135);
INSERT INTO `b_search_content_stem` VALUES (62,'en','YOU',0.2529);
INSERT INTO `b_search_content_stem` VALUES (62,'en','YOUR',0.1596);
INSERT INTO `b_search_content_stem` VALUES (44,'en','YU',0.1115);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_custom_rank`
-- 




DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2)  NOT NULL,
  `MODULE_ID` varchar(200)  NOT NULL,
  `PARAM1` text ,
  `PARAM2` text ,
  `ITEM_ID` varchar(255)  DEFAULT NULL,
  `RANK` int(11) NOT NULL DEFAULT '0',
  `APPLIED` char(1)  NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_phrase`
-- 




DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2)  NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32)  NOT NULL,
  `PHRASE` varchar(250)  DEFAULT NULL,
  `TAGS` varchar(250)  DEFAULT NULL,
  `URL_TO` text ,
  `URL_TO_404` char(1)  DEFAULT NULL,
  `URL_TO_SITE_ID` char(2)  DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_suggest`
-- 




DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2)  NOT NULL,
  `FILTER_MD5` varchar(32)  NOT NULL,
  `PHRASE` varchar(250)  NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_search_tags`
-- 




DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2)  NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_seo_keywords`
-- 




DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2)  NOT NULL,
  `URL` varchar(255)  DEFAULT NULL,
  `KEYWORDS` text ,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_site_template`
-- 




DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2)  NOT NULL,
  `CONDITION` varchar(255)  DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(50)  NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SITE_TEMPLATE` (`SITE_ID`,`CONDITION`,`TEMPLATE`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_site_template`
-- 


INSERT INTO `b_site_template` VALUES (18,'s1','CSite::InDir(\'/app.book_1\')',151,'furniture_dark-blue');
INSERT INTO `b_site_template` VALUES (19,'s1','CSite::InDir(\'/app.book/app/\')',152,'app');
INSERT INTO `b_site_template` VALUES (17,'s1','',150,'main');
INSERT INTO `b_site_template` VALUES (20,'s1','CSite::InDir(\'/app.book/index.php\')',153,'login');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_task`
-- 




DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100)  NOT NULL,
  `LETTER` char(1)  DEFAULT NULL,
  `MODULE_ID` varchar(50)  NOT NULL,
  `SYS` char(1)  NOT NULL,
  `DESCRIPTION` varchar(255)  DEFAULT NULL,
  `BINDING` varchar(50)  DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_task`
-- 


INSERT INTO `b_task` VALUES (1,'main_denied','D','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (2,'main_change_profile','P','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (3,'main_view_all_settings','R','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (4,'main_view_all_settings_change_profile','T','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (5,'main_edit_subordinate_users','V','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (6,'main_full_access','W','main','Y',NULL,'module');
INSERT INTO `b_task` VALUES (7,'fm_folder_access_denied','D','main','Y',NULL,'file');
INSERT INTO `b_task` VALUES (8,'fm_folder_access_read','R','main','Y',NULL,'file');
INSERT INTO `b_task` VALUES (9,'fm_folder_access_write','W','main','Y',NULL,'file');
INSERT INTO `b_task` VALUES (10,'fm_folder_access_full','X','main','Y',NULL,'file');
INSERT INTO `b_task` VALUES (11,'fm_folder_access_workflow','U','main','Y',NULL,'file');
INSERT INTO `b_task` VALUES (12,'fileman_denied','D','fileman','Y','','module');
INSERT INTO `b_task` VALUES (13,'fileman_allowed_folders','F','fileman','Y','','module');
INSERT INTO `b_task` VALUES (14,'fileman_full_access','W','fileman','Y','','module');
INSERT INTO `b_task` VALUES (15,'medialib_denied','D','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (16,'medialib_view','F','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (17,'medialib_only_new','R','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (18,'medialib_edit_items','V','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (19,'medialib_editor','W','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (20,'medialib_full','X','fileman','Y','','medialib');
INSERT INTO `b_task` VALUES (21,'seo_denied','D','seo','Y','','module');
INSERT INTO `b_task` VALUES (22,'seo_edit','F','seo','Y','','module');
INSERT INTO `b_task` VALUES (23,'seo_full_access','W','seo','Y','','module');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_task_operation`
-- 




DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_task_operation`
-- 


INSERT INTO `b_task_operation` VALUES (2,1);
INSERT INTO `b_task_operation` VALUES (2,7);
INSERT INTO `b_task_operation` VALUES (3,1);
INSERT INTO `b_task_operation` VALUES (3,3);
INSERT INTO `b_task_operation` VALUES (3,4);
INSERT INTO `b_task_operation` VALUES (3,5);
INSERT INTO `b_task_operation` VALUES (3,6);
INSERT INTO `b_task_operation` VALUES (4,1);
INSERT INTO `b_task_operation` VALUES (4,3);
INSERT INTO `b_task_operation` VALUES (4,4);
INSERT INTO `b_task_operation` VALUES (4,5);
INSERT INTO `b_task_operation` VALUES (4,6);
INSERT INTO `b_task_operation` VALUES (4,7);
INSERT INTO `b_task_operation` VALUES (5,1);
INSERT INTO `b_task_operation` VALUES (5,2);
INSERT INTO `b_task_operation` VALUES (5,4);
INSERT INTO `b_task_operation` VALUES (5,5);
INSERT INTO `b_task_operation` VALUES (5,6);
INSERT INTO `b_task_operation` VALUES (5,7);
INSERT INTO `b_task_operation` VALUES (5,9);
INSERT INTO `b_task_operation` VALUES (6,1);
INSERT INTO `b_task_operation` VALUES (6,3);
INSERT INTO `b_task_operation` VALUES (6,4);
INSERT INTO `b_task_operation` VALUES (6,5);
INSERT INTO `b_task_operation` VALUES (6,6);
INSERT INTO `b_task_operation` VALUES (6,7);
INSERT INTO `b_task_operation` VALUES (6,8);
INSERT INTO `b_task_operation` VALUES (6,10);
INSERT INTO `b_task_operation` VALUES (6,11);
INSERT INTO `b_task_operation` VALUES (6,12);
INSERT INTO `b_task_operation` VALUES (6,13);
INSERT INTO `b_task_operation` VALUES (6,32);
INSERT INTO `b_task_operation` VALUES (6,33);
INSERT INTO `b_task_operation` VALUES (8,15);
INSERT INTO `b_task_operation` VALUES (8,23);
INSERT INTO `b_task_operation` VALUES (8,24);
INSERT INTO `b_task_operation` VALUES (9,15);
INSERT INTO `b_task_operation` VALUES (9,17);
INSERT INTO `b_task_operation` VALUES (9,18);
INSERT INTO `b_task_operation` VALUES (9,19);
INSERT INTO `b_task_operation` VALUES (9,20);
INSERT INTO `b_task_operation` VALUES (9,21);
INSERT INTO `b_task_operation` VALUES (9,22);
INSERT INTO `b_task_operation` VALUES (9,23);
INSERT INTO `b_task_operation` VALUES (9,24);
INSERT INTO `b_task_operation` VALUES (9,25);
INSERT INTO `b_task_operation` VALUES (9,26);
INSERT INTO `b_task_operation` VALUES (9,27);
INSERT INTO `b_task_operation` VALUES (9,28);
INSERT INTO `b_task_operation` VALUES (9,29);
INSERT INTO `b_task_operation` VALUES (9,30);
INSERT INTO `b_task_operation` VALUES (9,31);
INSERT INTO `b_task_operation` VALUES (10,15);
INSERT INTO `b_task_operation` VALUES (10,16);
INSERT INTO `b_task_operation` VALUES (10,17);
INSERT INTO `b_task_operation` VALUES (10,18);
INSERT INTO `b_task_operation` VALUES (10,19);
INSERT INTO `b_task_operation` VALUES (10,20);
INSERT INTO `b_task_operation` VALUES (10,21);
INSERT INTO `b_task_operation` VALUES (10,22);
INSERT INTO `b_task_operation` VALUES (10,23);
INSERT INTO `b_task_operation` VALUES (10,24);
INSERT INTO `b_task_operation` VALUES (10,25);
INSERT INTO `b_task_operation` VALUES (10,26);
INSERT INTO `b_task_operation` VALUES (10,27);
INSERT INTO `b_task_operation` VALUES (10,28);
INSERT INTO `b_task_operation` VALUES (10,29);
INSERT INTO `b_task_operation` VALUES (10,30);
INSERT INTO `b_task_operation` VALUES (10,31);
INSERT INTO `b_task_operation` VALUES (11,15);
INSERT INTO `b_task_operation` VALUES (11,19);
INSERT INTO `b_task_operation` VALUES (11,23);
INSERT INTO `b_task_operation` VALUES (11,24);
INSERT INTO `b_task_operation` VALUES (11,25);
INSERT INTO `b_task_operation` VALUES (13,36);
INSERT INTO `b_task_operation` VALUES (13,37);
INSERT INTO `b_task_operation` VALUES (13,38);
INSERT INTO `b_task_operation` VALUES (13,39);
INSERT INTO `b_task_operation` VALUES (13,40);
INSERT INTO `b_task_operation` VALUES (13,41);
INSERT INTO `b_task_operation` VALUES (13,42);
INSERT INTO `b_task_operation` VALUES (13,44);
INSERT INTO `b_task_operation` VALUES (13,45);
INSERT INTO `b_task_operation` VALUES (14,34);
INSERT INTO `b_task_operation` VALUES (14,35);
INSERT INTO `b_task_operation` VALUES (14,36);
INSERT INTO `b_task_operation` VALUES (14,37);
INSERT INTO `b_task_operation` VALUES (14,38);
INSERT INTO `b_task_operation` VALUES (14,39);
INSERT INTO `b_task_operation` VALUES (14,40);
INSERT INTO `b_task_operation` VALUES (14,41);
INSERT INTO `b_task_operation` VALUES (14,42);
INSERT INTO `b_task_operation` VALUES (14,43);
INSERT INTO `b_task_operation` VALUES (14,44);
INSERT INTO `b_task_operation` VALUES (14,45);
INSERT INTO `b_task_operation` VALUES (14,46);
INSERT INTO `b_task_operation` VALUES (16,47);
INSERT INTO `b_task_operation` VALUES (17,47);
INSERT INTO `b_task_operation` VALUES (17,48);
INSERT INTO `b_task_operation` VALUES (17,52);
INSERT INTO `b_task_operation` VALUES (18,47);
INSERT INTO `b_task_operation` VALUES (18,52);
INSERT INTO `b_task_operation` VALUES (18,53);
INSERT INTO `b_task_operation` VALUES (18,54);
INSERT INTO `b_task_operation` VALUES (19,47);
INSERT INTO `b_task_operation` VALUES (19,48);
INSERT INTO `b_task_operation` VALUES (19,49);
INSERT INTO `b_task_operation` VALUES (19,50);
INSERT INTO `b_task_operation` VALUES (19,52);
INSERT INTO `b_task_operation` VALUES (19,53);
INSERT INTO `b_task_operation` VALUES (19,54);
INSERT INTO `b_task_operation` VALUES (20,47);
INSERT INTO `b_task_operation` VALUES (20,48);
INSERT INTO `b_task_operation` VALUES (20,49);
INSERT INTO `b_task_operation` VALUES (20,50);
INSERT INTO `b_task_operation` VALUES (20,51);
INSERT INTO `b_task_operation` VALUES (20,52);
INSERT INTO `b_task_operation` VALUES (20,53);
INSERT INTO `b_task_operation` VALUES (20,54);
INSERT INTO `b_task_operation` VALUES (22,56);
INSERT INTO `b_task_operation` VALUES (23,55);
INSERT INTO `b_task_operation` VALUES (23,56);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_undo`
-- 




DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255)  NOT NULL,
  `MODULE_ID` varchar(50)  DEFAULT NULL,
  `UNDO_TYPE` varchar(50)  DEFAULT NULL,
  `UNDO_HANDLER` varchar(255)  DEFAULT NULL,
  `CONTENT` mediumtext ,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user`
-- 




DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50)  NOT NULL,
  `PASSWORD` varchar(50)  NOT NULL,
  `CHECKWORD` varchar(50)  DEFAULT NULL,
  `ACTIVE` char(1)  NOT NULL DEFAULT 'Y',
  `NAME` varchar(50)  DEFAULT NULL,
  `LAST_NAME` varchar(50)  DEFAULT NULL,
  `EMAIL` varchar(255)  NOT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2)  DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255)  DEFAULT NULL,
  `PERSONAL_WWW` varchar(255)  DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255)  DEFAULT NULL,
  `PERSONAL_GENDER` char(1)  DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50)  DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255)  DEFAULT NULL,
  `PERSONAL_FAX` varchar(255)  DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255)  DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255)  DEFAULT NULL,
  `PERSONAL_STREET` text ,
  `PERSONAL_MAILBOX` varchar(255)  DEFAULT NULL,
  `PERSONAL_CITY` varchar(255)  DEFAULT NULL,
  `PERSONAL_STATE` varchar(255)  DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255)  DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255)  DEFAULT NULL,
  `PERSONAL_NOTES` text ,
  `WORK_COMPANY` varchar(255)  DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255)  DEFAULT NULL,
  `WORK_POSITION` varchar(255)  DEFAULT NULL,
  `WORK_WWW` varchar(255)  DEFAULT NULL,
  `WORK_PHONE` varchar(255)  DEFAULT NULL,
  `WORK_FAX` varchar(255)  DEFAULT NULL,
  `WORK_PAGER` varchar(255)  DEFAULT NULL,
  `WORK_STREET` text ,
  `WORK_MAILBOX` varchar(255)  DEFAULT NULL,
  `WORK_CITY` varchar(255)  DEFAULT NULL,
  `WORK_STATE` varchar(255)  DEFAULT NULL,
  `WORK_ZIP` varchar(255)  DEFAULT NULL,
  `WORK_COUNTRY` varchar(255)  DEFAULT NULL,
  `WORK_PROFILE` text ,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text ,
  `ADMIN_NOTES` text ,
  `STORED_HASH` varchar(32)  DEFAULT NULL,
  `XML_ID` varchar(255)  DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255)  DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50)  DEFAULT NULL,
  `CONFIRM_CODE` varchar(8)  DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user`
-- 


INSERT INTO `b_user` VALUES (1,'2018-05-08 17:31:08','admin','3<mEZ{7yae1de7b0d5f5e16612f04f429b7b7197','q8UfAM5i06465c862818da6e763608f82c23e89e','Y','Đào Quang Hưng','','dqhung.ec@gmail.com','2018-05-09 09:19:46','2010-11-08 12:10:49','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-23 17:59:52','',NULL,0,NULL);
INSERT INTO `b_user` VALUES (2,'2017-12-08 13:49:16','guest','wwK8HapI25c7217bce89401640b1af58461298d0','UAuAnb2ta892d933cdbea4bf512e27dd0c85b65c','Y','Khách vãng lai','','guest@dithatthich.vn',NULL,'2017-12-08 13:49:04','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2017-12-08 13:49:16','',NULL,NULL,NULL);
INSERT INTO `b_user` VALUES (7,'2018-04-13 08:10:16','KennethmoN','Qst5eDW0c24ebd960a79d608c902d61e723f88fd','Ryo1FxTTa1e0dcb8b9722a627088157c26299b2d','Y','KennethmoN',NULL,'fertynte@bigmir.net','2018-04-13 08:10:16','2018-04-13 08:10:16',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-13 08:10:16',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (6,'2018-04-02 16:39:00','huytqs','UdrSlF9k542d89e27a71eb2ee4ac9c1de96ac3ec','DQ7oLQmO2ea502e99fb898ed93bb954a9c2db7a6','Y','Nguyễn Văn Huy',NULL,'huytqs1102@gmail.com','2018-04-02 16:39:00','2018-04-02 16:39:00',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-02 16:39:00',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (8,'2018-04-13 16:42:51','quantri','gmMGXiAD7101c1a9511c990be4b0cad86530332a','rPw2Y2Dvcf2a53b26bad80cb213683a9e45fa7fc','Y','Quản trị','nội dung','contact@apka.vn','2018-04-13 17:09:23','2018-04-13 16:31:52','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-13 16:41:46','',NULL,0,NULL);
INSERT INTO `b_user` VALUES (9,'2018-05-08 17:32:02','tungtran','IKO1Z30Y3e78c3fe268ce750484700facd272a00','fnV1efb09178b333e3295b90c08985ee7f4f17ae','Y','Tran Tung','','tungtran@uboo.vn','2018-05-08 11:19:00','2018-04-13 16:56:19','s1','','','','',NULL,NULL,'','','','','','','','','','0','','','','','','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-23 17:59:46','',NULL,3,NULL);
INSERT INTO `b_user` VALUES (10,'2018-04-18 11:08:21','0968558892','zzHL7gxnb9ca4c0f73ece0b02c2676a72a679fbd','luVsCTjX0c2630002922c4f1a49930c23cfae3c7','Y','Nguyễn Văn Học',NULL,'nguyenvanhoc280@gmail.com','2018-04-18 11:08:21','2018-04-18 11:08:21',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-18 11:08:21',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (14,'2018-04-25 22:49:51','0935011220','2EqQKTPu0b921991d9205f6504187142767e986d','9XqQ24pn913858cfd97fbfd3d75886a9e3a1c421','Y','Quynh Tram',NULL,'tram@yahoo.com','2018-04-25 22:57:13','2018-04-25 22:49:51',NULL,NULL,'http://',NULL,'',NULL,NULL,'0935011220',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-25 22:49:51',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (13,'2018-04-26 00:44:07','0935509900','uF85NKaf59c194852674902b77f7b1d15191f3e0','l25QiFiR17bc5c36c9766472a3f91a31eda823fe','Y','Đàm Vĩnh Hưng','','hung@yahoo.com','2018-04-27 14:17:48','2018-04-25 22:12:57','s1','','http://','','',NULL,NULL,'0935509900','','','','','','','','','0','','','','','http://','','','','','','','','','0','',NULL,'','',NULL,NULL,NULL,NULL,'2018-04-25 22:49:32','','',0,NULL);
INSERT INTO `b_user` VALUES (15,'2018-04-26 12:41:37','09001111','dhMH5bZ1cc2329676f6d69d82aa3195aa2491ed8','8dUH7Yx24f744328ccab393c6bfaf32be0f104d5','Y','Test',NULL,'net.ldvinci@gmail.com',NULL,'2018-04-26 12:41:37',NULL,NULL,'http://',NULL,'',NULL,NULL,'09001111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-26 12:41:37',NULL,'',NULL,NULL);
INSERT INTO `b_user` VALUES (16,'2018-04-26 12:43:29','0944361666','a6Q885uC6873cd04c9f9a901a3779e5029229bbf','YBCiyZPgad32854cb94749da906404f4ead9273b','Y','Chinh',NULL,'chinh@apka.vn',NULL,'2018-04-26 12:43:29',NULL,NULL,'http://',NULL,'',NULL,NULL,'0944361666',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-26 12:43:29',NULL,'',NULL,NULL);
INSERT INTO `b_user` VALUES (17,'2018-04-28 08:53:55','nthop','D18o53G74a83953000297d50f1607a566cc4f077','nnHUmEFQ53f1e3bd4f3b2fb5e72e956f2f309657','Y','Nguyen trong Hop',NULL,'nthop110@gmail.com','2018-04-28 12:00:13','2018-04-27 09:14:03',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-04-27 09:14:03',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (18,'2018-05-04 13:28:53','Khachung2511','bAOw71p4e9e7959db24ad327944c1420d58263a3','3ALHkHozf4954d6944508ec29b92212444b7f1de','Y','Nguyễn khắc hưng',NULL,'khachung251190@gmail.com','2018-05-04 13:28:53','2018-05-04 13:28:53',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-04 13:28:53',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (19,'2018-05-04 13:29:27','Khachung251190','7pvMZSmTc4dce33ab291a1a7886e1ee0a24dfebc','imzuiTe4069fc014d4663638d9e0b50b56fc2e92','Y','Nguyễn khắc hưng',NULL,'khachung251190@gmail.com','2018-05-04 13:29:27','2018-05-04 13:29:27',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-04 13:29:27',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (20,'2018-05-04 13:31:20','Hung2511','zFD1B46Qd451e8da703a496c98f667b9bb906262','s5vo7vwEf34cf00bc51071ed022960df1473367e','Y','Nguyen khac hung',NULL,'khachung251190@gmail.com','2018-05-04 13:31:20','2018-05-04 13:31:20',NULL,NULL,'http://',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-04 13:31:20',NULL,'',0,NULL);
INSERT INTO `b_user` VALUES (21,'2018-05-08 17:53:52','0978928694','X1W83A6X79e74752c9431b92ffa33f7b8c38058c','QjWXnUqN2dd7405ca491f962a58333ea409db4de','Y','Nguyen ba thang',NULL,'thangnghien82@gmail.com',NULL,'2018-05-08 17:53:52',NULL,NULL,'http://',NULL,'',NULL,NULL,'0978928694',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-08 17:53:52',NULL,'',NULL,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_field`
-- 




DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20)  DEFAULT NULL,
  `FIELD_NAME` varchar(20)  DEFAULT NULL,
  `USER_TYPE_ID` varchar(50)  DEFAULT NULL,
  `XML_ID` varchar(255)  DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1)  NOT NULL DEFAULT 'N',
  `MANDATORY` char(1)  NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1)  NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1)  NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1)  NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1)  NOT NULL DEFAULT 'N',
  `SETTINGS` text ,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user_field`
-- 


INSERT INTO `b_user_field` VALUES (1,'USER','UF_VI_TAI_KHOAN','double','',100,'N','N','N','Y','Y','N','a:5:{s:9:\"PRECISION\";i:4;s:4:\"SIZE\";i:20;s:9:\"MIN_VALUE\";d:0;s:9:\"MAX_VALUE\";d:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_field_enum`
-- 




DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255)  NOT NULL,
  `DEF` char(1)  NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255)  NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_field_lang`
-- 




DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2)  NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255)  DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255)  DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255)  DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255)  DEFAULT NULL,
  `HELP_MESSAGE` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user_field_lang`
-- 


INSERT INTO `b_user_field_lang` VALUES (1,'en','','','','','');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_group`
-- 




DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user_group`
-- 


INSERT INTO `b_user_group` VALUES (1,1,NULL,NULL);
INSERT INTO `b_user_group` VALUES (8,1,'2018-04-13 00:00:00','2018-04-14 00:00:00');
INSERT INTO `b_user_group` VALUES (8,3,NULL,NULL);
INSERT INTO `b_user_group` VALUES (9,1,NULL,NULL);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_hit_auth`
-- 




DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32)  NOT NULL,
  `URL` varchar(255)  NOT NULL,
  `SITE_ID` char(2)  DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_option`
-- 




DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(50)  NOT NULL,
  `NAME` varchar(255)  NOT NULL,
  `VALUE` text ,
  `COMMON` char(1)  NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_option_param` (`CATEGORY`,`NAME`),
  KEY `ix_user_option_user` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user_option`
-- 


INSERT INTO `b_user_option` VALUES (1,NULL,'main.interface','global','a:1:{s:5:\"theme\";s:9:\"dark-blue\";}','Y');
INSERT INTO `b_user_option` VALUES (2,1,'admin_panel','settings','a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}','N');
INSERT INTO `b_user_option` VALUES (3,1,'admin_menu','pos','a:3:{s:8:\"sections\";s:187:\"menu_iblock_/news,menu_fileman,iblock_admin,menu_search_stat,menu_util,menu_system,menu_users,menu_iblock_/vn/6,menu_iblock_/vn/7,menu_iblock_/vn/5,menu_iblock_/vn/9,menu_fileman_file_s1_\";s:5:\"width\";s:3:\"225\";s:3:\"ver\";s:2:\"on\";}','N');
INSERT INTO `b_user_option` VALUES (4,1,'fileman','last_pathes','s:344:\"a:10:{i:0;s:9:\"/app.book\";i:1;s:22:\"/webmin/templates/main\";i:2;s:51:\"/webmin/components/webcomp/news.list/templates/news\";i:3;s:46:\"/webmin/components/webcomp/news.list/templates\";i:4;s:36:\"/webmin/components/webcomp/news.list\";i:5;s:8:\"/tin-tuc\";i:6;s:21:\"/webmin/php_interface\";i:7;s:7:\"/webmin\";i:8;s:14:\"/webmin/backup\";i:9;s:7:\"/dat-xe\";}\";','N');
INSERT INTO `b_user_option` VALUES (5,1,'filter','tbl_iblock_section_feec45850a6da7a26ecbc04356074bda_filter','a:1:{s:4:\"rows\";s:6:\"parent\";}','N');
INSERT INTO `b_user_option` VALUES (6,1,'filter','tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (7,1,'fileman','medialib_def_type','s:1:\"3\";','N');
INSERT INTO `b_user_option` VALUES (9,1,'fileman','taskbar_settings_PREVIEW_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N');
INSERT INTO `b_user_option` VALUES (8,1,'start_menu','recent','a:1:{i:0;a:4:{s:3:\"url\";s:86:\"/webmin/admin/iblock_list_admin.php?IBLOCK_ID=5&type=vn&lang=en&find_section_section=0\";s:4:\"text\";s:7:\"Tin tuc\";s:5:\"title\";s:30:\"Tin tuc (double click to open)\";s:4:\"icon\";s:24:\"iblock_menu_icon_iblocks\";}}','N');
INSERT INTO `b_user_option` VALUES (10,1,'fileman','taskbarset_settings_PREVIEW_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N');
INSERT INTO `b_user_option` VALUES (11,1,'filter','tbl_iblock_list_19dd77aa3c08806fd81c989076996025_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (12,1,'filter','tbl_iblock_list_4ff941a4ef914f575baf47b883a07ae3_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (13,1,'list','tbl_iblock_list_feec45850a6da7a26ecbc04356074bda','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_35\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (14,1,'filter','tbl_iblock_list_0f81ef6e99142c84681add1f93f73014_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (15,1,'list','tbl_iblock_list_0f81ef6e99142c84681add1f93f73014','a:4:{s:7:\"columns\";s:36:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,CODE\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (16,1,'filter','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (17,1,'fileman','taskbar_settings_DETAIL_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N');
INSERT INTO `b_user_option` VALUES (18,1,'fileman','taskbarset_settings_DETAIL_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:1;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N');
INSERT INTO `b_user_option` VALUES (19,1,'filter','tbl_iblock_list_e243b358b954c5403383a0aa3fc1de24_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (20,1,'list','tbl_iblock_list_4ff941a4ef914f575baf47b883a07ae3','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_38\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (21,1,'list','tbl_iblock_list_19dd77aa3c08806fd81c989076996025','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_16\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (22,1,'fileman','medialib_user_set','s:9:\"600,450,1\";','N');
INSERT INTO `b_user_option` VALUES (23,1,'list','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0','a:4:{s:7:\"columns\";s:36:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,CODE\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (24,8,'admin_menu','pos','a:1:{s:8:\"sections\";s:55:\"menu_fileman,menu_iblock_/vn/9,menu_iblock,iblock_admin\";}','N');
INSERT INTO `b_user_option` VALUES (25,8,'filter','tbl_iblock_list_c8acca20f565c7fd6d3ab94c94a838b0_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (26,8,'fileman','taskbar_settings_DETAIL_TEXT','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}}\";','N');
INSERT INTO `b_user_option` VALUES (27,8,'fileman','taskbarset_settings_DETAIL_TEXT','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:1;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N');
INSERT INTO `b_user_option` VALUES (28,9,'admin_menu','pos','a:3:{s:8:\"sections\";s:11:\"menu_iblock\";s:5:\"width\";s:3:\"340\";s:3:\"hor\";s:3:\"off\";}','N');
INSERT INTO `b_user_option` VALUES (29,9,'fileman','last_pathes','s:378:\"a:10:{i:0;s:58:\"/webmin/components/webcomp/app.booking.car/templates/step1\";i:1;s:52:\"/webmin/components/webcomp/app.booking.car/templates\";i:2;s:42:\"/webmin/components/webcomp/app.booking.car\";i:3;s:26:\"/webmin/components/webcomp\";i:4;s:13:\"/webmin/admin\";i:5;s:7:\"/webmin\";i:6;s:11:\"/app.book__\";i:7;s:22:\"/app.book/app/phong-ve\";i:8;s:13:\"/app.book/app\";i:9;s:9:\"/app.book\";}\";','N');
INSERT INTO `b_user_option` VALUES (30,9,'admin_panel','settings','a:1:{s:4:\"edit\";s:3:\"off\";}','N');
INSERT INTO `b_user_option` VALUES (31,9,'BX.WindowManager','size_/webmin/admin/public_file_edit.php','a:2:{s:5:\"width\";s:4:\"1238\";s:6:\"height\";s:3:\"627\";}','N');
INSERT INTO `b_user_option` VALUES (32,9,'fileman','taskbar_settings_filesrc_pub','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:0;}}\";','N');
INSERT INTO `b_user_option` VALUES (33,9,'fileman','taskbarset_settings_filesrc_pub','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:160;}}\";','N');
INSERT INTO `b_user_option` VALUES (41,9,'filter','tbl_iblock_list_feec45850a6da7a26ecbc04356074bda_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (34,9,'fileman','taskbar_settings_filesrc','s:246:\"a:3:{s:19:\"BXPropertiesTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:1;}s:20:\"BXComponents2Taskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";s:1:\"2\";s:6:\"active\";b:1;}s:17:\"BXSnippetsTaskbar\";a:3:{s:4:\"show\";b:1;s:3:\"set\";i:3;s:6:\"active\";b:0;}}\";','N');
INSERT INTO `b_user_option` VALUES (35,9,'fileman','taskbarset_settings_filesrc','s:90:\"a:2:{i:2;a:2:{s:4:\"show\";b:0;s:4:\"size\";i:200;}i:3;a:2:{s:4:\"show\";b:1;s:4:\"size\";i:160;}}\";','N');
INSERT INTO `b_user_option` VALUES (36,9,'filter','tbl_iblock_list_e243b358b954c5403383a0aa3fc1de24_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (37,1,'filter','tbl_iblock_list_08d1c41d42e865e513a357665c34db31_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (38,1,'list','tbl_iblock_list_08d1c41d42e865e513a357665c34db31','a:4:{s:7:\"columns\";s:43:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,PROPERTY_44\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}','N');
INSERT INTO `b_user_option` VALUES (39,1,'filter','tbl_iblock_list_01a07c7df88fc7d54c1d06bdbb4d8ad2_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (40,1,'filter','tbl_iblock_list_d6bf314e3b4bc0a81fd3f69d9c1758ee_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (42,9,'filter','tbl_iblock_list_08d1c41d42e865e513a357665c34db31_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (43,9,'filter','tbl_iblock_list_4ff941a4ef914f575baf47b883a07ae3_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (44,9,'filter','tbl_iblock_list_19dd77aa3c08806fd81c989076996025_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (45,1,'filter','tbl_iblock_list_99353ac4c339a415b6183212747157eb_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (46,1,'filter','tbl_iblock_list_eeec66b2f164db1aab6be7d1f0f426b7_filter','a:1:{s:4:\"rows\";s:15:\"IBLIST_A_PARENT\";}','N');
INSERT INTO `b_user_option` VALUES (47,1,'edit','editTab_676829921ee21a7cdcf88d8b92a06421','a:1:{s:6:\"expand\";s:3:\"off\";}','N');


-- --------------------------------------------------------
-- 
-- Table structure for table `b_user_stored_auth`
-- 




DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32)  NOT NULL,
  `TEMP_HASH` char(1)  NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_user_stored_auth`
-- 


INSERT INTO `b_user_stored_auth` VALUES (21,1,'2018-05-08 17:32:10','2018-05-09 09:19:46','e86e31bb96552c18e7b0394b3e119293','N',250065124);
INSERT INTO `b_user_stored_auth` VALUES (6,1,'2018-04-25 21:54:07','2018-04-28 07:37:30','15a34a41785da17c3912296d94a9e196','N',1123635782);
INSERT INTO `b_user_stored_auth` VALUES (13,14,'2018-04-25 22:57:13','2018-04-25 22:57:13','2c2601f6a6e9c5cbe5705e0e5eebf118','N',1953382594);
INSERT INTO `b_user_stored_auth` VALUES (19,13,'2018-04-26 16:41:28','2018-04-27 14:17:48','2f07f717e057b1dd2c7e2d9ee8839d91','N',1963156693);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_utm_user`
-- 




DROP TABLE IF EXISTS `b_utm_user`;
CREATE TABLE `b_utm_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text ,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_USER_1` (`FIELD_ID`),
  KEY `ix_utm_USER_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------
-- 
-- Table structure for table `b_uts_user`
-- 




DROP TABLE IF EXISTS `b_uts_user`;
CREATE TABLE `b_uts_user` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_VI_TAI_KHOAN` float DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_uts_user`
-- 


INSERT INTO `b_uts_user` VALUES (13,500000);
INSERT INTO `b_uts_user` VALUES (14,500000);
INSERT INTO `b_uts_user` VALUES (15,500000);
INSERT INTO `b_uts_user` VALUES (16,500000);
INSERT INTO `b_uts_user` VALUES (21,500000);


-- --------------------------------------------------------
-- 
-- Table structure for table `b_xml_tree`
-- 




DROP TABLE IF EXISTS `b_xml_tree`;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255)  DEFAULT NULL,
  `VALUE` text ,
  `ATTRIBUTES` text ,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table  `b_xml_tree`
-- 


INSERT INTO `b_xml_tree` VALUES (1,0,1,320,0,'CommerceInformation',NULL,'a:2:{s:13:\"SchemaVersion\";s:5:\"2.021\";s:12:\"CreationDate\";s:19:\"2010-07-12T16:48:00\";}');
INSERT INTO `b_xml_tree` VALUES (2,1,2,67,1,'Metadata',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (3,2,3,4,2,'Id','2',NULL);
INSERT INTO `b_xml_tree` VALUES (4,2,5,6,2,'Title','Job Vacancies',NULL);
INSERT INTO `b_xml_tree` VALUES (5,2,7,64,2,'Properties',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (6,5,8,15,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (7,6,9,10,4,'Id','CML2_ACTIVE',NULL);
INSERT INTO `b_xml_tree` VALUES (8,6,11,12,4,'Title','BitrixActive',NULL);
INSERT INTO `b_xml_tree` VALUES (9,6,13,14,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (10,5,16,23,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (11,10,17,18,4,'Id','CML2_CODE',NULL);
INSERT INTO `b_xml_tree` VALUES (12,10,19,20,4,'Title','Code',NULL);
INSERT INTO `b_xml_tree` VALUES (13,10,21,22,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (14,5,24,31,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (15,14,25,26,4,'Id','CML2_SORT',NULL);
INSERT INTO `b_xml_tree` VALUES (16,14,27,28,4,'Title','Sort',NULL);
INSERT INTO `b_xml_tree` VALUES (17,14,29,30,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (18,5,32,39,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (19,18,33,34,4,'Id','CML2_ACTIVE_FROM',NULL);
INSERT INTO `b_xml_tree` VALUES (20,18,35,36,4,'Title','Start time',NULL);
INSERT INTO `b_xml_tree` VALUES (21,18,37,38,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (22,5,40,47,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (23,22,41,42,4,'Id','CML2_ACTIVE_TO',NULL);
INSERT INTO `b_xml_tree` VALUES (24,22,43,44,4,'Title','End time',NULL);
INSERT INTO `b_xml_tree` VALUES (25,22,45,46,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (26,5,48,55,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (27,26,49,50,4,'Id','CML2_PREVIEW_TEXT',NULL);
INSERT INTO `b_xml_tree` VALUES (28,26,51,52,4,'Title','Anons',NULL);
INSERT INTO `b_xml_tree` VALUES (29,26,53,54,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (30,5,56,63,3,'Property',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (31,30,57,58,4,'Id','CML2_PREVIEW_PICTURE',NULL);
INSERT INTO `b_xml_tree` VALUES (32,30,59,60,4,'Title','Preview picture',NULL);
INSERT INTO `b_xml_tree` VALUES (33,30,61,62,4,'Multiple','false',NULL);
INSERT INTO `b_xml_tree` VALUES (34,2,65,66,2,'Sections',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (35,1,68,319,1,'Catalog',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (36,35,69,70,2,'Id','furniture_vacancies',NULL);
INSERT INTO `b_xml_tree` VALUES (37,35,71,72,2,'MetadataId','2',NULL);
INSERT INTO `b_xml_tree` VALUES (38,35,73,74,2,'Title','Job Vacancies',NULL);
INSERT INTO `b_xml_tree` VALUES (39,35,75,76,2,'BitrixCode','furniture_vacancies',NULL);
INSERT INTO `b_xml_tree` VALUES (40,35,77,78,2,'BitrixSort','500',NULL);
INSERT INTO `b_xml_tree` VALUES (41,35,79,80,2,'BitrixListURL','#SITE_DIR#/company/vacancies.php',NULL);
INSERT INTO `b_xml_tree` VALUES (42,35,81,82,2,'BitrixDetailURL','#SITE_DIR#/company/vacancies.php##ID#',NULL);
INSERT INTO `b_xml_tree` VALUES (43,35,83,84,2,'BitrixSectionURL',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (44,35,85,86,2,'BitrixPicture',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (45,35,87,88,2,'BitrixIndexElements','true',NULL);
INSERT INTO `b_xml_tree` VALUES (46,35,89,90,2,'BitrixIndexSections','false',NULL);
INSERT INTO `b_xml_tree` VALUES (47,35,91,92,2,'BitrixWorkflow','false',NULL);
INSERT INTO `b_xml_tree` VALUES (48,35,93,154,2,'BitrixLabels',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (49,48,94,99,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (50,49,95,96,4,'Id','ELEMENT_NAME',NULL);
INSERT INTO `b_xml_tree` VALUES (51,49,97,98,4,'Value','Vacancy',NULL);
INSERT INTO `b_xml_tree` VALUES (52,48,100,105,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (53,52,101,102,4,'Id','ELEMENTS_NAME',NULL);
INSERT INTO `b_xml_tree` VALUES (54,52,103,104,4,'Value','Vacancies',NULL);
INSERT INTO `b_xml_tree` VALUES (55,48,106,111,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (56,55,107,108,4,'Id','ELEMENT_ADD',NULL);
INSERT INTO `b_xml_tree` VALUES (57,55,109,110,4,'Value','Add vacancy',NULL);
INSERT INTO `b_xml_tree` VALUES (58,48,112,117,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (59,58,113,114,4,'Id','ELEMENT_EDIT',NULL);
INSERT INTO `b_xml_tree` VALUES (60,58,115,116,4,'Value','Edit vacancy',NULL);
INSERT INTO `b_xml_tree` VALUES (61,48,118,123,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (62,61,119,120,4,'Id','ELEMENT_DELETE',NULL);
INSERT INTO `b_xml_tree` VALUES (63,61,121,122,4,'Value','Delete vacancy',NULL);
INSERT INTO `b_xml_tree` VALUES (64,48,124,129,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (65,64,125,126,4,'Id','SECTION_NAME',NULL);
INSERT INTO `b_xml_tree` VALUES (66,64,127,128,4,'Value','Category',NULL);
INSERT INTO `b_xml_tree` VALUES (67,48,130,135,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (68,67,131,132,4,'Id','SECTIONS_NAME',NULL);
INSERT INTO `b_xml_tree` VALUES (69,67,133,134,4,'Value','Categories',NULL);
INSERT INTO `b_xml_tree` VALUES (70,48,136,141,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (71,70,137,138,4,'Id','SECTION_ADD',NULL);
INSERT INTO `b_xml_tree` VALUES (72,70,139,140,4,'Value','Add category',NULL);
INSERT INTO `b_xml_tree` VALUES (73,48,142,147,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (74,73,143,144,4,'Id','SECTION_EDIT',NULL);
INSERT INTO `b_xml_tree` VALUES (75,73,145,146,4,'Value','Edit category',NULL);
INSERT INTO `b_xml_tree` VALUES (76,48,148,153,3,'BitrixLabel',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (77,76,149,150,4,'Id','SECTION_DELETE',NULL);
INSERT INTO `b_xml_tree` VALUES (78,76,151,152,4,'Value','Delete category',NULL);
INSERT INTO `b_xml_tree` VALUES (79,35,155,318,2,'Elements',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (80,79,156,209,3,'Element',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (81,80,157,158,4,'Id','2',NULL);
INSERT INTO `b_xml_tree` VALUES (82,80,159,160,4,'Title','Designer, Decorative Accessories',NULL);
INSERT INTO `b_xml_tree` VALUES (83,80,161,162,4,'BitrixTags',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (84,80,163,164,4,'Description','<b>Requirements</b> 						 						 \r\n<p>Degree in Fine Arts, Applied Arts or Engineering</p>\r\n\r\n<b>Essential Functions</b> 						 \r\n<p>Develop designs from conception through revisions to sample approval. Present to Head Designer for review and approval.</p>\r\n<p>Create presentation boards.</p>	\r\n					 						\r\n<b>Employment Status</b> 						 \r\n<p>Full time</p>\r\n ',NULL);
INSERT INTO `b_xml_tree` VALUES (85,80,165,208,4,'PropertiesValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (86,85,166,171,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (87,86,167,168,6,'Id','CML2_ACTIVE',NULL);
INSERT INTO `b_xml_tree` VALUES (88,86,169,170,6,'Value','true',NULL);
INSERT INTO `b_xml_tree` VALUES (89,85,172,177,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (90,89,173,174,6,'Id','CML2_CODE',NULL);
INSERT INTO `b_xml_tree` VALUES (91,89,175,176,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (92,85,178,183,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (93,92,179,180,6,'Id','CML2_SORT',NULL);
INSERT INTO `b_xml_tree` VALUES (94,92,181,182,6,'Value','200',NULL);
INSERT INTO `b_xml_tree` VALUES (95,85,184,189,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (96,95,185,186,6,'Id','CML2_ACTIVE_FROM',NULL);
INSERT INTO `b_xml_tree` VALUES (97,95,187,188,6,'Value','2010-05-01 00:00:00',NULL);
INSERT INTO `b_xml_tree` VALUES (98,85,190,195,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (99,98,191,192,6,'Id','CML2_ACTIVE_TO',NULL);
INSERT INTO `b_xml_tree` VALUES (100,98,193,194,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (101,85,196,201,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (102,101,197,198,6,'Id','CML2_PREVIEW_TEXT',NULL);
INSERT INTO `b_xml_tree` VALUES (103,101,199,200,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (104,85,202,207,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (105,104,203,204,6,'Id','CML2_PREVIEW_PICTURE',NULL);
INSERT INTO `b_xml_tree` VALUES (106,104,205,206,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (107,79,210,263,3,'Element',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (108,107,211,212,4,'Id','3',NULL);
INSERT INTO `b_xml_tree` VALUES (109,107,213,214,4,'Title','Associate Marketing Manager',NULL);
INSERT INTO `b_xml_tree` VALUES (110,107,215,216,4,'BitrixTags',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (111,107,217,218,4,'Description','<p>Provide professional administrative support to IT executives and department. Tasks require a high degree of sound judgment, initiative and tact under general supervision.</p>\r\n\r\n<b>Requirements</b> 						 						 \r\n<p>Minimum 5 years experience as an executive assistant</p>\r\n<p>Proficiency with Microsoft Office Suite</p>\r\n<p>Strong organizational skills</p>\r\n<p>Some college preferred but not necessary  </p>\r\n 						 						\r\n<b>Essential Functions</b> 						 \r\n<p>Provide general point of contact assistance and support for the IT department</p>\r\n<p>Maintain contractor database and monitor badge access extensions/deactivations</p>',NULL);
INSERT INTO `b_xml_tree` VALUES (112,107,219,262,4,'PropertiesValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (113,112,220,225,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (114,113,221,222,6,'Id','CML2_ACTIVE',NULL);
INSERT INTO `b_xml_tree` VALUES (115,113,223,224,6,'Value','true',NULL);
INSERT INTO `b_xml_tree` VALUES (116,112,226,231,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (117,116,227,228,6,'Id','CML2_CODE',NULL);
INSERT INTO `b_xml_tree` VALUES (118,116,229,230,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (119,112,232,237,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (120,119,233,234,6,'Id','CML2_SORT',NULL);
INSERT INTO `b_xml_tree` VALUES (121,119,235,236,6,'Value','300',NULL);
INSERT INTO `b_xml_tree` VALUES (122,112,238,243,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (123,122,239,240,6,'Id','CML2_ACTIVE_FROM',NULL);
INSERT INTO `b_xml_tree` VALUES (124,122,241,242,6,'Value','2010-05-01 00:00:00',NULL);
INSERT INTO `b_xml_tree` VALUES (125,112,244,249,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (126,125,245,246,6,'Id','CML2_ACTIVE_TO',NULL);
INSERT INTO `b_xml_tree` VALUES (127,125,247,248,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (128,112,250,255,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (129,128,251,252,6,'Id','CML2_PREVIEW_TEXT',NULL);
INSERT INTO `b_xml_tree` VALUES (130,128,253,254,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (131,112,256,261,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (132,131,257,258,6,'Id','CML2_PREVIEW_PICTURE',NULL);
INSERT INTO `b_xml_tree` VALUES (133,131,259,260,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (134,79,264,317,3,'Element',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (135,134,265,266,4,'Id','4',NULL);
INSERT INTO `b_xml_tree` VALUES (136,134,267,268,4,'Title','Packaging Engineer',NULL);
INSERT INTO `b_xml_tree` VALUES (137,134,269,270,4,'BitrixTags',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (138,134,271,272,4,'Description','<b>Requirements</b> 						 						 \r\n<p>Bachelors Degree preferably in packaging or technically related field.</p>\r\n<p>Project Management experience essential.</p>	\r\n					 						\r\n<b>Essential Functions</b> 						 \r\n<p>Develop and maintain general and specific packaging specifications that meet transportation\r\nand optimal distribution flow requirements for all Decorative Accessories</p>\r\n<p>Analyze damage reports on products and take appropriate corrective actions to eliminate future\r\nproblems</p>\r\n<p>Research, designate, and approve packaging suppliers worldwide.</p>',NULL);
INSERT INTO `b_xml_tree` VALUES (139,134,273,316,4,'PropertiesValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (140,139,274,279,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (141,140,275,276,6,'Id','CML2_ACTIVE',NULL);
INSERT INTO `b_xml_tree` VALUES (142,140,277,278,6,'Value','true',NULL);
INSERT INTO `b_xml_tree` VALUES (143,139,280,285,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (144,143,281,282,6,'Id','CML2_CODE',NULL);
INSERT INTO `b_xml_tree` VALUES (145,143,283,284,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (146,139,286,291,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (147,146,287,288,6,'Id','CML2_SORT',NULL);
INSERT INTO `b_xml_tree` VALUES (148,146,289,290,6,'Value','400',NULL);
INSERT INTO `b_xml_tree` VALUES (149,139,292,297,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (150,149,293,294,6,'Id','CML2_ACTIVE_FROM',NULL);
INSERT INTO `b_xml_tree` VALUES (151,149,295,296,6,'Value','2010-05-01 00:00:00',NULL);
INSERT INTO `b_xml_tree` VALUES (152,139,298,303,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (153,152,299,300,6,'Id','CML2_ACTIVE_TO',NULL);
INSERT INTO `b_xml_tree` VALUES (154,152,301,302,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (155,139,304,309,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (156,155,305,306,6,'Id','CML2_PREVIEW_TEXT',NULL);
INSERT INTO `b_xml_tree` VALUES (157,155,307,308,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (158,139,310,315,5,'PropertyValues',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (159,158,311,312,6,'Id','CML2_PREVIEW_PICTURE',NULL);
INSERT INTO `b_xml_tree` VALUES (160,158,313,314,6,'Value',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (161,0,22,0,0,'',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (162,0,23,0,0,'',NULL,NULL);
INSERT INTO `b_xml_tree` VALUES (163,0,24,0,0,'',NULL,NULL);
