-- MySQL dump 10.13  Distrib 5.5.27, for osx10.8 (i386)
--
-- Host: localhost    Database: kakaoslide
-- ------------------------------------------------------
-- Server version	5.5.27-log

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
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `role_uid` smallint(6) DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT NULL,
  `status` char(4) COLLATE utf8_bin DEFAULT 'PS01' COMMENT 'PS01 : 일반\nPS02 : 탈퇴 \nPS03 : 중지\n',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'adm1','adm001','p001',1,'2010-08-10 01:00:00',NULL);
INSERT INTO `t_admin` VALUES (2,'adm2','adm002','p002',2,'2010-08-12 01:00:00',NULL);
INSERT INTO `t_admin` VALUES (3,'adm3','adm003','p003',3,'2010-08-14 01:00:00',NULL);
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_author`
--

DROP TABLE IF EXISTS `t_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_author` (
  `uid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_author`
--

LOCK TABLES `t_author` WRITE;
/*!40000 ALTER TABLE `t_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_billing_hist`
--

DROP TABLE IF EXISTS `t_billing_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_billing_hist` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pid` char(13) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `product_type` char(4) COLLATE utf8_bin NOT NULL DEFAULT 'PT01' COMMENT 'PT01 : Standalone single product\nPT02 : series single product\nPT03 : package \nPT04 : 자유이용권 \n',
  `purchase_type` char(4) COLLATE utf8_bin DEFAULT 'PUR1' COMMENT 'PUR1 : buy\nPUR2 : rent',
  `period_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '현재 사용 안함.\n\n연/월/일/주',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `period` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_billing_hist`
--

LOCK TABLES `t_billing_hist` WRITE;
/*!40000 ALTER TABLE `t_billing_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_billing_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_category`
--

DROP TABLE IF EXISTS `t_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_category` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_category`
--

LOCK TABLES `t_category` WRITE;
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` VALUES (1,'도서');
INSERT INTO `t_category` VALUES (2,'음식');
INSERT INTO `t_category` VALUES (3,'게임');
INSERT INTO `t_category` VALUES (4,'음악');
INSERT INTO `t_category` VALUES (5,'여행');
INSERT INTO `t_category` VALUES (6,'문화');
INSERT INTO `t_category` VALUES (7,'운동');
INSERT INTO `t_category` VALUES (8,'미분류');
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_code`
--

DROP TABLE IF EXISTS `t_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_code` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code_category` char(4) COLLATE utf8_bin DEFAULT NULL,
  `code` char(4) COLLATE utf8_bin NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_code`
--

LOCK TABLES `t_code` WRITE;
/*!40000 ALTER TABLE `t_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment_monitoring`
--

DROP TABLE IF EXISTS `t_comment_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comment_monitoring` (
  `uid` int(11) NOT NULL,
  `comment_uid` varchar(45) COLLATE utf8_bin NOT NULL,
  `reviewer` int(11) NOT NULL,
  `rv_comment` text COLLATE utf8_bin NOT NULL,
  `monitoring_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment_monitoring`
--

LOCK TABLES `t_comment_monitoring` WRITE;
/*!40000 ALTER TABLE `t_comment_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comment_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice`
--

DROP TABLE IF EXISTS `t_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_notice` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contents` text COLLATE utf8_bin,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice`
--

LOCK TABLES `t_notice` WRITE;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_package`
--

DROP TABLE IF EXISTS `t_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_package` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` char(13) COLLATE utf8_bin NOT NULL,
  `series_id` char(13) COLLATE utf8_bin DEFAULT NULL COMMENT '시리즈 상품 고유 ID\n',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '시리즈내에서 판매되는 상품의 고유 ID',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `package_type` char(4) COLLATE utf8_bin DEFAULT 'PKG1' COMMENT 'PKG1 : 일반 패키지\nPKG2 : 전체 패키지(자유이용권 용)\n',
  `state` char(4) COLLATE utf8_bin NOT NULL DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'SAT1 : 자동 판매 시작\nSAT2 : 판매자 판매 시작 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_package`
--

LOCK TABLES `t_package` WRITE;
/*!40000 ALTER TABLE `t_package` DISABLE KEYS */;
INSERT INTO `t_package` VALUES (1,'price001','SRP9001001','pkg title','pkg desc 1','pt01','ST01',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_package_hist`
--

DROP TABLE IF EXISTS `t_package_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_package_hist` (
  `uid` int(10) unsigned NOT NULL,
  `package_id` char(13) COLLATE utf8_bin NOT NULL DEFAULT '',
  `series_id` char(13) COLLATE utf8_bin DEFAULT NULL COMMENT '시리즈 상품 고유 ID\n',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '시리즈내에서 판매되는 상품의 고유 ID',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `package_type` char(4) COLLATE utf8_bin DEFAULT 'PKG1' COMMENT 'PKG1 : 일반 패키지\nPKG2 : 전체 패키지(자유이용권 용)\n\n',
  `state` char(4) COLLATE utf8_bin DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_package_hist`
--

LOCK TABLES `t_package_hist` WRITE;
/*!40000 ALTER TABLE `t_package_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_package_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_package_mapping`
--

DROP TABLE IF EXISTS `t_package_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_package_mapping` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` char(13) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `product_id` char(13) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_package_mapping`
--

LOCK TABLES `t_package_mapping` WRITE;
/*!40000 ALTER TABLE `t_package_mapping` DISABLE KEYS */;
INSERT INTO `t_package_mapping` VALUES (1,'1','SGP9001006');
INSERT INTO `t_package_mapping` VALUES (2,'1','SGP9001007');
/*!40000 ALTER TABLE `t_package_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_price`
--

DROP TABLE IF EXISTS `t_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_price` (
  `uid` int(10) unsigned NOT NULL,
  `pid` char(13) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `product_type` char(4) COLLATE utf8_bin NOT NULL DEFAULT 'PT01' COMMENT 'PT01 : Standalone single product\nPT02 : series single product\nPT03 : package \nPT04 : 자유이용권 \n',
  `purchase_type` char(4) COLLATE utf8_bin DEFAULT 'PUR1' COMMENT 'PUR1 : buy\nPUR2 : rent',
  `period` int(10) unsigned DEFAULT '0' COMMENT '일 수\n',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '가격.\n정상가격/Promotion가격/이벤트가격',
  `price_type` char(4) COLLATE utf8_bin DEFAULT 'PR01' COMMENT 'PR01 : 정상가\nPR02 : Promotion\nPR03 : 운영자 이벤트\n',
  `commition_rate` float unsigned DEFAULT '30' COMMENT '평상/event/promotion 시 수수료율\n',
  `start_dt` timestamp NULL DEFAULT NULL COMMENT 'promotion/event start date',
  `end_dt` timestamp NULL DEFAULT NULL COMMENT 'promotion/event end date',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_price`
--

LOCK TABLES `t_price` WRITE;
/*!40000 ALTER TABLE `t_price` DISABLE KEYS */;
INSERT INTO `t_price` VALUES (1,'SGP9001001','SGP0','TEST',0,0,'TEST',30,NULL,NULL,'2012-09-01 15:00:00');
INSERT INTO `t_price` VALUES (2,'SRP9001001','SRP0','TEST',0,0,'TEST',30,NULL,NULL,'2012-08-31 15:00:00');
/*!40000 ALTER TABLE `t_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product_monitoring`
--

DROP TABLE IF EXISTS `t_product_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_product_monitoring` (
  `uid` int(11) NOT NULL,
  `pid` char(13) COLLATE utf8_bin NOT NULL,
  `item_type` tinyint(4) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `rv_comment` text COLLATE utf8_bin NOT NULL,
  `monitoring_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product_monitoring`
--

LOCK TABLES `t_product_monitoring` WRITE;
/*!40000 ALTER TABLE `t_product_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_publisher`
--

DROP TABLE IF EXISTS `t_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_publisher` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seller_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '\n',
  `real_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `post` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `jumin_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bank_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bank_owner` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `bank_img` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `grade` char(4) COLLATE utf8_bin DEFAULT 'PG01' COMMENT 'PG01 : 일반\nPG02 : VIP\nPG03 : BlackList\n\n\n',
  `status` char(4) COLLATE utf8_bin DEFAULT 'PS01' COMMENT 'PS01 : 일반\nPS02 : 탈퇴 \nPS03 : 중지\n',
  `seller_type` char(4) COLLATE utf8_bin DEFAULT 'SE01' COMMENT 'SE01: 개인판매\nSE02: 개인사업자\nSE03: 법인\n',
  `business_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `charge_man` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '담당자\n',
  `mailorder_number` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '통신판매업신고증 번호\n',
  `mailorder_img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '통신판매업신고증 사본\n',
  `accepted_dt` timestamp NULL DEFAULT NULL COMMENT '가입 승인일\n',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publisher`
--

LOCK TABLES `t_publisher` WRITE;
/*!40000 ALTER TABLE `t_publisher` DISABLE KEYS */;
INSERT INTO `t_publisher` VALUES (1,'창비','password','admin@changbi.com','난판매자','김창비','POST는 뭐지','서울 중구 중동 1번지','02) 1234-1234',NULL,'국민','010-002-202-202','창비(주)',NULL,'이거슨 메시지','2012-09-01 00:01:02',NULL,'TEST','TEST','02) 4321-4321','charge man은 머징','0',NULL,'2012-09-02 02:20:44');
/*!40000 ALTER TABLE `t_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_review_activity`
--

DROP TABLE IF EXISTS `t_review_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_review_activity` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `product_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'PT01 : Standalone single product\nPT02 : series single product\nPT03 : package \nPT04 : 자유이용권 \n',
  `reviwer_uid` int(11) DEFAULT NULL,
  `action_type` char(4) COLLATE utf8_bin NOT NULL,
  `previous_state` char(4) COLLATE utf8_bin DEFAULT NULL,
  `next_state` char(4) COLLATE utf8_bin DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_review_activity`
--

LOCK TABLES `t_review_activity` WRITE;
/*!40000 ALTER TABLE `t_review_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_review_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_review_check`
--

DROP TABLE IF EXISTS `t_review_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_review_check` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_uid` int(11) DEFAULT NULL,
  `check_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `check_result` char(1) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_review_check`
--

LOCK TABLES `t_review_check` WRITE;
/*!40000 ALTER TABLE `t_review_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_review_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'superadmin');
INSERT INTO `t_role` VALUES (2,'reviewer');
INSERT INTO `t_role` VALUES (3,'review admin');
INSERT INTO `t_role` VALUES (4,'statistics admin');
INSERT INTO `t_role` VALUES (5,'statistics viewer');
INSERT INTO `t_role` VALUES (6,'seller');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_screen_mapping`
--

DROP TABLE IF EXISTS `t_role_screen_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_screen_mapping` (
  `role_uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `screen_uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_uid`,`screen_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_screen_mapping`
--

LOCK TABLES `t_role_screen_mapping` WRITE;
/*!40000 ALTER TABLE `t_role_screen_mapping` DISABLE KEYS */;
INSERT INTO `t_role_screen_mapping` VALUES (1,1);
INSERT INTO `t_role_screen_mapping` VALUES (1,2);
INSERT INTO `t_role_screen_mapping` VALUES (1,7);
INSERT INTO `t_role_screen_mapping` VALUES (4,7);
/*!40000 ALTER TABLE `t_role_screen_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_screen`
--

DROP TABLE IF EXISTS `t_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_screen` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `item_order` smallint(6) DEFAULT '0',
  `icon_img` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_bin DEFAULT '1',
  `target_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `page_code` char(10) COLLATE utf8_bin DEFAULT NULL,
  `item_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `menu_uid` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `IDX_SCREEN_HIGH` (`item_order`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_screen`
--

LOCK TABLES `t_screen` WRITE;
/*!40000 ALTER TABLE `t_screen` DISABLE KEYS */;
INSERT INTO `t_screen` VALUES (2,1,'http://kakao-images1.iwilab.com/images/v4/common/btn_new.png?1342073764','슬라이드 관리','/admin/slide','p000000001',NULL,0);
INSERT INTO `t_screen` VALUES (3,1,NULL,'슬라이드 목록','/admin/slide/list','p000000011',NULL,2);
INSERT INTO `t_screen` VALUES (4,2,NULL,'슬라이드 리뷰','/admin/slide/review','p000000012',NULL,2);
INSERT INTO `t_screen` VALUES (5,3,NULL,'슬라이드 삭제','/admin/slide/delete','p000000013',NULL,2);
INSERT INTO `t_screen` VALUES (6,4,NULL,'슬라이드 승인','/admin/slide/approve','p000000014',NULL,2);
INSERT INTO `t_screen` VALUES (7,1,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc4/49149_1363672721_2681_q.jpg','통계','/admin/stat','p000000002',NULL,0);
INSERT INTO `t_screen` VALUES (8,1,NULL,'다운로드 통계','/admin/stat/download','p000000021',NULL,7);
INSERT INTO `t_screen` VALUES (9,2,NULL,'구매 통계','/admin/stat/purchase','p000000022',NULL,7);
INSERT INTO `t_screen` VALUES (10,3,NULL,'판매자 통계','/admin/stat/seller','p000000023',NULL,7);
INSERT INTO `t_screen` VALUES (11,4,NULL,'판매자 일별 통계','/admin/stat/seller/daily','p000000231',NULL,7);
INSERT INTO `t_screen` VALUES (12,5,NULL,'판매자 월별 통계','/admin/stat/seller/monthly','p000000232',NULL,7);
/*!40000 ALTER TABLE `t_screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_seqs`
--

DROP TABLE IF EXISTS `t_seqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_seqs` (
  `seq_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `start` int(10) DEFAULT '1000',
  `increment` int(1) DEFAULT '1',
  `curval` int(10) DEFAULT '1000',
  `flag` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_seqs`
--

LOCK TABLES `t_seqs` WRITE;
/*!40000 ALTER TABLE `t_seqs` DISABLE KEYS */;
INSERT INTO `t_seqs` VALUES ('package',1000,1,1000,'A');
INSERT INTO `t_seqs` VALUES ('seriesproduct',1000,1,1000,'A');
INSERT INTO `t_seqs` VALUES ('singleproduct',1000,1,1000,'A');
INSERT INTO `t_seqs` VALUES ('slide',1000,1,1000,'A');
/*!40000 ALTER TABLE `t_seqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_series`
--

DROP TABLE IF EXISTS `t_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_series` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` char(20) COLLATE utf8_bin NOT NULL COMMENT '시리즈 상품 고유 ID\n',
  `publisher_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `size` float DEFAULT NULL,
  `release_dt` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'S201 : 제작중\nS202 : 제작완료\nS300 : 승인요청\nS400 : 심사중\nS501 : 승인완료\nS502 : 반려(리젝)\nS601 : 판매중\nS602 : 판매중지',
  `version` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `req_review_dt` timestamp NULL DEFAULT NULL,
  `start_review_dt` timestamp NULL DEFAULT NULL,
  `end_review_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_series`
--

LOCK TABLES `t_series` WRITE;
/*!40000 ALTER TABLE `t_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_series_product`
--

DROP TABLE IF EXISTS `t_series_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_series_product` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` char(13) COLLATE utf8_bin NOT NULL COMMENT '시리즈 상품 고유 ID\n t_series 의 pid 와 같다.\n',
  `version` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `revision` smallint(5) unsigned DEFAULT '0',
  `publisher_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_uid` smallint(5) unsigned DEFAULT '0',
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `slide_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin,
  `size` float DEFAULT NULL,
  `last_slide_added_dt` timestamp NULL DEFAULT NULL COMMENT '슬라이드가 시리즈에 최종 추가된 일시\n',
  `last_release_dt` timestamp NULL DEFAULT NULL COMMENT '시리즈의 메타데이터가 업데이트된 최종 일시',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` char(4) COLLATE utf8_bin NOT NULL DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'SAT1 : 자동 판매 시작\nSAT2 : 판매자 판매 시작 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_series_product`
--

LOCK TABLES `t_series_product` WRITE;
/*!40000 ALTER TABLE `t_series_product` DISABLE KEYS */;
INSERT INTO `t_series_product` VALUES (1,'SRP9001001','1',0,1,'series title1',1,'series thumb 1','series cover 1',3,'series desc 1',4001,NULL,'2012-08-20 05:02:01','2012-08-02 04:00:00','ST61','2012-08-20 05:02:01','SAT1');
INSERT INTO `t_series_product` VALUES (2,'SRP9001002','2',0,1,'series title2',2,'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/49149_1363672721_2681_n.jpg','https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/49149_1363672721_2681_n.jpg',0,'series desc 2',4002,NULL,'2012-08-12 08:02:01','2012-08-03 05:00:00','ST22',NULL,'SAT2');
INSERT INTO `t_series_product` VALUES (3,'SRP9001003','1',2,1,'도가니',2,'https://fbcdn-profile-a.akamaihd.net/static-ak/rsrc.php/v2/yL/r/HsTZSDw4avx.gif','https://fbcdn-profile-a.akamaihd.net/static-ak/rsrc.php/v2/yL/r/HsTZSDw4avx.gif',4,'2011년, 대한민국의 마음을 움직일 진실이 찾아온다.믿을 수 없지만, 한 청각장애인학교에서 실제 일어난 사건입니다. 2000년부터 5년간 청각장애아를 상대로 교장과 교사들이 비인간적인 성폭력과 학 대를 저질렀습니다. 인정하고 싶지 않지만 이 이야기는 진실입니다. 이제 이 끔찍한 진실을 마주해야 할 시간입니다.',2021,NULL,'2012-09-02 03:22:11','2012-09-01 00:02:00','ST61',NULL,'SAT2');
INSERT INTO `t_series_product` VALUES (4,'SRP9001001','1.1',1,1,'series title1 - upgraded',1,'http://www.podotree.com/img/btn_locale_KOR.png','http://www.podotree.com/img/btn_locale_ENG.png',3,'series desc 1 - update version',4001,NULL,NULL,'2012-09-12 04:00:00','ST21',NULL,'SAT2');
INSERT INTO `t_series_product` VALUES (5,'SRP9001003','1.2',3,1,'도가니탕',2,'https://fbcdn-profile-a.akamaihd.net/static-ak/rsrc.php/v2/yL/r/HsTZSDw4avx.gif','https://fbcdn-profile-a.akamaihd.net/static-ak/rsrc.php/v2/yL/r/HsTZSDw4avx.gif',4,'업데이트 됐어요~~ 2011년, 대한민국의 마음을 움직일 진실이 찾아온다.믿을 수 없..',2021,NULL,NULL,'2012-09-01 00:02:00','ST40',NULL,'SAT1');
/*!40000 ALTER TABLE `t_series_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_series_product_hist`
--

DROP TABLE IF EXISTS `t_series_product_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_series_product_hist` (
  `uid` int(10) unsigned NOT NULL,
  `series_id` char(13) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '시리즈 상품 고유 ID\n t_series 의 pid 와 같다.\n',
  `version` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `revision` int(10) unsigned DEFAULT '0',
  `publisher_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `slide_count` smallint(6) DEFAULT '1',
  `description` text COLLATE utf8_bin,
  `size` float DEFAULT '0',
  `last_slide_added_dt` timestamp NULL DEFAULT NULL,
  `last_release_dt` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state` char(4) COLLATE utf8_bin DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'SAT1 : 자동 판매 시작\nSAT2 : 판매자 판매 시작 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_series_product_hist`
--

LOCK TABLES `t_series_product_hist` WRITE;
/*!40000 ALTER TABLE `t_series_product_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_series_product_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_single_product`
--

DROP TABLE IF EXISTS `t_single_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_single_product` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` char(13) COLLATE utf8_bin NOT NULL COMMENT '상품 고유 ID\n\nt_slide 의 pid 와 같은것\n',
  `series_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `slide_uid` int(11) DEFAULT NULL,
  `publisher_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `revision` smallint(5) unsigned DEFAULT NULL,
  `slide_type` char(4) COLLATE utf8_bin DEFAULT 'SD01' COMMENT 'SD01 : 일반 슬라이드\nSD02 : EPUB\n',
  `contents_type` int(10) unsigned DEFAULT '0' COMMENT '현재 사용 안함.\n물성. (문서/동영상/음원 등) \nbit연산 사용 예정',
  `category_uid` smallint(6) DEFAULT '0',
  `content_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `size` float DEFAULT '0',
  `last_release_dt` timestamp NULL DEFAULT NULL COMMENT '판매 시작 날자.\n',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `promotion` tinyint(1) DEFAULT '0',
  `state` char(4) COLLATE utf8_bin NOT NULL DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'SAT1 : 자동 판매 시작\nSAT2 : 판매자 판매 시작 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_single_product`
--

LOCK TABLES `t_single_product` WRITE;
/*!40000 ALTER TABLE `t_single_product` DISABLE KEYS */;
INSERT INTO `t_single_product` VALUES (1,'SGP9001001','',1,1,'100','title1','1',1,'SD01',1,1,'path1','thumburl1','coverurl1','desc1',1000,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST61',NULL,'SAT1');
INSERT INTO `t_single_product` VALUES (2,'SGP9001002','',3,1,'100','title2','1',1,'SD01',3,2,'path2','thumburl2','coverurl2','desc2',1001,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST40',NULL,'SAT1');
INSERT INTO `t_single_product` VALUES (3,'SGP9001003','',4,1,'100','title3','1',1,'SD01',2,3,'path3','thumburl3','coverurl3','desc3',1002,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST30',NULL,'SAT1');
INSERT INTO `t_single_product` VALUES (4,'SGP9001004','',5,1,'100','stitle1','1',1,'SD01',4,1,'spath1','sthumbnail1','scoverurl1','sdesc1',2000,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST40',NULL,'SAT2');
INSERT INTO `t_single_product` VALUES (5,'SGP9001005','',6,1,'100','stitle2','1',1,'SD01',1,1,'spath2','sthumbnail2','scoverurl2','sdesc2',2001,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST51',NULL,'SAT1');
INSERT INTO `t_single_product` VALUES (6,'SGP9001006','SRP9001001',7,1,'1002','s2title1','1',1,'SD01',1,2,'spath3','sthumbnail3','scoverurl3','sdesc3',2101,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST52',NULL,'SAT2');
INSERT INTO `t_single_product` VALUES (7,'SGP9001007','SRP9001001',8,1,'1002','s2title2','1',1,'SD01',1,2,'spath4','sthumbnail4','scoverurl4','sdesc4',2102,'2012-08-18 10:12:43','2012-08-12 08:00:00',0,'ST61','2012-08-18 10:12:43','SAT1');
INSERT INTO `t_single_product` VALUES (8,'SGP9001008','SRP9001001',9,1,'1002','s2title3','1',1,'SD01',1,2,'spath5','sthumbnail5','scoverurl5','sdesc5',2103,'2012-08-11 08:00:00','2012-08-10 08:00:00',0,'ST62','2012-08-13 16:10:55','SAT2');
INSERT INTO `t_single_product` VALUES (9,'SGP9001008','SRP9001001',10,1,'1002','updated single product','1.1',2,'SD01',1,2,'spath5spath5','http://kakao-images4.iwilab.com/images/v6/layouts/logo_kakao.png?1342073764','http://kakao-images4.iwilab.com/images/v6/layouts/logo_kakao.png?1342073764','updated.. single product',2103,NULL,'2012-08-10 08:00:00',0,'ST40',NULL,'SAT2');
/*!40000 ALTER TABLE `t_single_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_single_product_hist`
--

DROP TABLE IF EXISTS `t_single_product_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_single_product_hist` (
  `uid` int(10) unsigned NOT NULL,
  `product_id` char(13) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '상품 고유 ID\n\nt_slide 의 pid 와 같은것\n',
  `series_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `slide_uid` int(11) DEFAULT NULL,
  `publisher_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `revision` smallint(5) unsigned DEFAULT '0',
  `slide_type` char(4) COLLATE utf8_bin DEFAULT 'SD01' COMMENT 'SD01 : 일반 슬라이드\nSD02 : EPUB\n',
  `contents_type` int(10) unsigned DEFAULT '0' COMMENT '현재 사용 안함.\n물성. (문서/동영상/음원 등) \nbit연산 사용 예정',
  `category_uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `content_path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cover_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `size` float DEFAULT '0',
  `last_release_dt` timestamp NULL DEFAULT NULL COMMENT '판매 시작 날자.\n',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `promotion` tinyint(1) DEFAULT '0',
  `state` char(4) COLLATE utf8_bin DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  `start_sale_dt` timestamp NULL DEFAULT NULL,
  `salestart_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'SAT1 : 자동 판매 시작\nSAT2 : 판매자 판매 시작 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_single_product_hist`
--

LOCK TABLES `t_single_product_hist` WRITE;
/*!40000 ALTER TABLE `t_single_product_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_single_product_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide`
--

DROP TABLE IF EXISTS `t_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `slide_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `product_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `publisher_uid` int(10) unsigned NOT NULL COMMENT 'user_uid. \n카카오 슬라이드에 업로드 하는 사람(퍼블리셔)의 아이디.',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Slide Title',
  `version` varchar(15) COLLATE utf8_bin DEFAULT '0.0.1',
  `revision` smallint(5) unsigned DEFAULT NULL,
  `slide_type` char(4) COLLATE utf8_bin DEFAULT 'SD01' COMMENT 'SD01 : 일반 슬라이드\nSD02 : EPUB\n',
  `contents_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '현재 사용 안함.\n\n컨텐츠 내용 속성(텍스트,음원,이미지,영상 등)',
  `contents_path` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '실제 콘텐츠가 위치한 url ',
  `size` float unsigned DEFAULT '0' COMMENT '단위 : mb',
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_page_num` smallint(5) unsigned DEFAULT NULL,
  `state` char(4) COLLATE utf8_bin DEFAULT 'ST21' COMMENT 'ST21 : 제작중\nST22 : 제작완료\nST30 : 임시저장\nST40 : 승인요청\nST50 : 심사중\nST51 : 승인완료\nST52 : 반려(리젝)\nST61 : 판매중\nST62 : 판매중지',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide`
--

LOCK TABLES `t_slide` WRITE;
/*!40000 ALTER TABLE `t_slide` DISABLE KEYS */;
INSERT INTO `t_slide` VALUES (1,'SL09001001','SGP9001001',1,'테스트 슬라이드','1.0',1,'TEST',1,'content path',0,'2012-09-02 05:00:00',2,'ST61');
INSERT INTO `t_slide` VALUES (2,'SL09001001','SGP9001001',1,'업데이트 슬라이드','1.1',2,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',2,'ST21');
INSERT INTO `t_slide` VALUES (3,'SL09001003','SGP9001002',1,'슬라이드 2','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',2,'ST40');
INSERT INTO `t_slide` VALUES (4,'SL09001004','SGP9001003',1,'슬라이드 3','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',2,'ST22');
INSERT INTO `t_slide` VALUES (5,'SL09001005','SGP9001004',1,'슬라이드 4','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',10,'ST30');
INSERT INTO `t_slide` VALUES (6,'SL09001006','SGP9001005',1,'슬라이드 5','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',20,'ST40');
INSERT INTO `t_slide` VALUES (7,'SL09001007','SGP9001006',1,'슬라이드 6','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',33,'ST51');
INSERT INTO `t_slide` VALUES (8,'SL09001008','SGP9001007',1,'시리즈 슬라이드','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',100,'ST52');
INSERT INTO `t_slide` VALUES (9,'SL09001009','SGP9001008',1,'시리즈 슬라이드','1.0',1,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',3,'ST61');
INSERT INTO `t_slide` VALUES (10,'SL09001009','SGP9001008',1,'업데이트된 시리즈 슬라이드','1.1',2,'TEST',1,'content path updated',1,'2012-09-02 05:00:02',3,'ST40');
/*!40000 ALTER TABLE `t_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_comment`
--

DROP TABLE IF EXISTS `t_slide_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_comment` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `product_pid` char(13) COLLATE utf8_bin NOT NULL,
  `page_num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_bin NOT NULL,
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewer` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_comment`
--

LOCK TABLES `t_slide_comment` WRITE;
/*!40000 ALTER TABLE `t_slide_comment` DISABLE KEYS */;
INSERT INTO `t_slide_comment` VALUES (1,1,'TEST_PRODUCT_',1,'haha','2012-10-16 08:03:40',NULL,NULL);
/*!40000 ALTER TABLE `t_slide_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_comment_trash`
--

DROP TABLE IF EXISTS `t_slide_comment_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_comment_trash` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `slide_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `page_num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_bin,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_comment_trash`
--

LOCK TABLES `t_slide_comment_trash` WRITE;
/*!40000 ALTER TABLE `t_slide_comment_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slide_comment_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_history`
--

DROP TABLE IF EXISTS `t_slide_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_history` (
  `slide_uid` bigint(20) NOT NULL,
  PRIMARY KEY (`slide_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_history`
--

LOCK TABLES `t_slide_history` WRITE;
/*!40000 ALTER TABLE `t_slide_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slide_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_like`
--

DROP TABLE IF EXISTS `t_slide_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_like` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '	\n',
  `product_pid` char(13) COLLATE utf8_bin NOT NULL,
  `page_num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_like`
--

LOCK TABLES `t_slide_like` WRITE;
/*!40000 ALTER TABLE `t_slide_like` DISABLE KEYS */;
INSERT INTO `t_slide_like` VALUES (1,1,'TEST_PRODUCT_',1,'2012-10-16 08:03:40');
/*!40000 ALTER TABLE `t_slide_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_rating`
--

DROP TABLE IF EXISTS `t_slide_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_rating` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `product_pid` char(13) COLLATE utf8_bin NOT NULL,
  `rating` smallint(6) NOT NULL DEFAULT '-1',
  `create_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_rating`
--

LOCK TABLES `t_slide_rating` WRITE;
/*!40000 ALTER TABLE `t_slide_rating` DISABLE KEYS */;
INSERT INTO `t_slide_rating` VALUES (1,1,'TEST_PRODUCT_',5,'2012-10-16 08:03:40');
/*!40000 ALTER TABLE `t_slide_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_review`
--

DROP TABLE IF EXISTS `t_slide_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_review` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_uid` int(11) DEFAULT NULL COMMENT '리뷰를 수행하는 리뷰어의 아이디',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `product_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `product_uid` int(11) DEFAULT NULL,
  `product_type` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'PT01 : Standalone single product\nPT02 : series single product\nPT03 : package \nPT04 : 자유이용권 \n\n',
  `publisher_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `publisher_level` tinyint(3) unsigned DEFAULT NULL,
  `category_uid` smallint(5) unsigned DEFAULT NULL,
  `review_report` text COLLATE utf8_bin,
  `state` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'S201 : 제작중\nS202 : 제작완료\nS300 : 승인요청\nS400 : 심사중\nS501 : 승인완료\nS502 : 반려(리젝)\nS601 : 판매중\nS602 : 판매중지\n\n\n',
  `request_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `start_dt` timestamp NULL DEFAULT NULL,
  `end_dt` timestamp NULL DEFAULT NULL,
  `last_save_dt` timestamp NULL DEFAULT NULL,
  `price` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_review`
--

LOCK TABLES `t_slide_review` WRITE;
/*!40000 ALTER TABLE `t_slide_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slide_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_summary`
--

DROP TABLE IF EXISTS `t_slide_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_summary` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_pid` char(13) COLLATE utf8_bin NOT NULL,
  `rate_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rate_summary` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `like_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_summary`
--

LOCK TABLES `t_slide_summary` WRITE;
/*!40000 ALTER TABLE `t_slide_summary` DISABLE KEYS */;
INSERT INTO `t_slide_summary` VALUES (1,'TEST_PRODUCT_',10000,30000,2000,5000);
/*!40000 ALTER TABLE `t_slide_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slide_trash`
--

DROP TABLE IF EXISTS `t_slide_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slide_trash` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'user_uid.\n컨텐츠의 원 소유자. 업로더 아님.\n',
  `publisher_uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'user_uid. \n카카오 슬라이드에 업로드 하는 사람(퍼블리셔)의 아이디.',
  `slide_series_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Slide Title',
  `version` varchar(15) COLLATE utf8_bin DEFAULT '0.0.1',
  `contents_type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '컨텐츠 타입(텍스트+이미지+음악+동영상+…)\nbit 연산 사용할 예정.\n',
  `category` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `contents_path` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `size` float unsigned DEFAULT '0' COMMENT '단위 : mb',
  `release_dt` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isPromotion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slide_trash`
--

LOCK TABLES `t_slide_trash` WRITE;
/*!40000 ALTER TABLE `t_slide_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_slide_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slidestand`
--

DROP TABLE IF EXISTS `t_slidestand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_slidestand` (
  `uid` bigint(20) NOT NULL,
  `user_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` char(13) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `item_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '1:single slide\n2:slide series\n',
  `read_start_date` timestamp NULL DEFAULT NULL,
  `read_end_date` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slidestand`
--

LOCK TABLES `t_slidestand` WRITE;
/*!40000 ALTER TABLE `t_slidestand` DISABLE KEYS */;
INSERT INTO `t_slidestand` VALUES (1,1001,'SGP9001001','0',NULL,NULL,'2012-08-11 03:00:00');
INSERT INTO `t_slidestand` VALUES (2,1001,'SGP9001002','0','2012-08-01 08:00:00','2012-11-01 08:00:00','2012-08-11 03:00:00');
INSERT INTO `t_slidestand` VALUES (3,1001,'SGP9001003','0','2012-03-01 08:00:00','2012-08-01 08:00:00','2012-08-11 03:00:00');
INSERT INTO `t_slidestand` VALUES (4,1001,'SRP9001001','1','2010-12-31 15:00:00','2029-12-31 15:00:00','2012-08-11 03:00:00');
/*!40000 ALTER TABLE `t_slidestand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_staff`
--

DROP TABLE IF EXISTS `t_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_staff` (
  `uid` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_staff`
--

LOCK TABLES `t_staff` WRITE;
/*!40000 ALTER TABLE `t_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tag`
--

DROP TABLE IF EXISTS `t_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tag` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `idx_tag` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tag`
--

LOCK TABLES `t_tag` WRITE;
/*!40000 ALTER TABLE `t_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tag_mapping`
--

DROP TABLE IF EXISTS `t_tag_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tag_mapping` (
  `tag_uid` int(11) NOT NULL,
  `product_id` char(13) COLLATE utf8_bin NOT NULL,
  `item_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1:single slide\n2:slide series\n3:package',
  PRIMARY KEY (`tag_uid`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tag_mapping`
--

LOCK TABLES `t_tag_mapping` WRITE;
/*!40000 ALTER TABLE `t_tag_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tag_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(40) NOT NULL DEFAULT '0',
  `nickname` varchar(200) DEFAULT NULL,
  `type` char(4) NOT NULL DEFAULT 'UT00' COMMENT 'UT00 : 일반\nUT01 : blacklist\n',
  `status` char(4) DEFAULT 'UST0' COMMENT 'UST0 : 일반\nUST0 : 중지\nUST0 : 탈퇴',
  `access_token` varchar(100) DEFAULT NULL,
  `refresh_token` varchar(100) DEFAULT NULL,
  `client_token` varchar(255) DEFAULT NULL,
  `server_token` varchar(255) DEFAULT NULL,
  `profile_thumbnail_url` varchar(255) DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_dt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `idx_uq_nickname` (`nickname`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'1001','jslee','U001','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_package`
--

DROP TABLE IF EXISTS `t_user_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_package` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` int(11) NOT NULL,
  `series_id` char(13) COLLATE utf8_bin NOT NULL,
  `package_id` char(13) COLLATE utf8_bin DEFAULT NULL,
  `start_dt` timestamp NULL DEFAULT NULL COMMENT '정기구독 시작/종료일\n임대 시작/종료일\n',
  `end_dt` timestamp NULL DEFAULT NULL,
  `read_start_dt` timestamp NULL DEFAULT NULL,
  `read_end_dt` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_package`
--

LOCK TABLES `t_user_package` WRITE;
/*!40000 ALTER TABLE `t_user_package` DISABLE KEYS */;
INSERT INTO `t_user_package` VALUES (1,1001,'SRP9001001','1','2012-08-01 08:00:00','2012-09-01 08:00:00',NULL,NULL,'2012-08-11 08:00:00');
/*!40000 ALTER TABLE `t_user_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_single_product`
--

DROP TABLE IF EXISTS `t_user_single_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_single_product` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_uid` int(10) unsigned NOT NULL,
  `series_id` char(13) COLLATE utf8_bin DEFAULT '0',
  `slidestand_uid` bigint(20) unsigned NOT NULL,
  `single_pid` char(13) COLLATE utf8_bin NOT NULL,
  `package_pid` char(13) COLLATE utf8_bin DEFAULT NULL,
  `read_start_dt` timestamp NULL DEFAULT NULL,
  `read_end_dt` timestamp NULL DEFAULT NULL,
  `create_dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_single_product`
--

LOCK TABLES `t_user_single_product` WRITE;
/*!40000 ALTER TABLE `t_user_single_product` DISABLE KEYS */;
INSERT INTO `t_user_single_product` VALUES (1,1001,'SRP9001001',4,'sp006','1','2012-08-10 08:00:00','2012-09-10 08:00:00',NULL);
INSERT INTO `t_user_single_product` VALUES (2,1001,'SRP9001001',4,'sp007','1','2012-08-10 08:00:00','2012-09-10 08:00:00',NULL);
/*!40000 ALTER TABLE `t_user_single_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
