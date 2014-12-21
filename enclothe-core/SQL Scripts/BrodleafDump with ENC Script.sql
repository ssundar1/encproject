CREATE DATABASE  IF NOT EXISTS `broadleaf` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `broadleaf`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: broadleaf
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `blc_additional_offer_info`
--

DROP TABLE IF EXISTS `blc_additional_offer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_additional_offer_info` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FK3BFDBD63B5D9C34D` (`OFFER_INFO_ID`),
  KEY `FK3BFDBD63D5F3FAF4` (`OFFER_ID`),
  KEY `FK3BFDBD631891FF79` (`BLC_ORDER_ORDER_ID`),
  CONSTRAINT `FK3BFDBD631891FF79` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK3BFDBD63B5D9C34D` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`),
  CONSTRAINT `FK3BFDBD63D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_additional_offer_info`
--

LOCK TABLES `blc_additional_offer_info` WRITE;
/*!40000 ALTER TABLE `blc_additional_offer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_additional_offer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_address`
--

DROP TABLE IF EXISTS `blc_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_address` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) DEFAULT NULL,
  `ADDRESS_LINE3` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COUNTY` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_BUSINESS` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) NOT NULL,
  `PRIMARY_PHONE` varchar(255) DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) DEFAULT NULL,
  `STANDARDIZED` tinyint(1) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) DEFAULT NULL,
  `ZIP_FOUR` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `PHONE_FAX_ID` bigint(20) DEFAULT NULL,
  `PHONE_PRIMARY_ID` bigint(20) DEFAULT NULL,
  `PHONE_SECONDARY_ID` bigint(20) DEFAULT NULL,
  `STATE_PROV_REGION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `ADDRESS_PHONE_FAX_IDX` (`PHONE_FAX_ID`),
  KEY `ADDRESS_PHONE_PRI_IDX` (`PHONE_PRIMARY_ID`),
  KEY `ADDRESS_PHONE_SEC_IDX` (`PHONE_SECONDARY_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  KEY `FK299F86CEA46E16CF` (`COUNTRY`),
  KEY `FK299F86CEF1A6533F` (`PHONE_FAX_ID`),
  KEY `FK299F86CEBF4449BA` (`PHONE_PRIMARY_ID`),
  KEY `FK299F86CEE12DC0C8` (`PHONE_SECONDARY_ID`),
  KEY `FK299F86CE337C4D50` (`STATE_PROV_REGION`),
  CONSTRAINT `FK299F86CE337C4D50` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `blc_state` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CEA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CEBF4449BA` FOREIGN KEY (`PHONE_PRIMARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  CONSTRAINT `FK299F86CEE12DC0C8` FOREIGN KEY (`PHONE_SECONDARY_ID`) REFERENCES `blc_phone` (`PHONE_ID`),
  CONSTRAINT `FK299F86CEF1A6533F` FOREIGN KEY (`PHONE_FAX_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_address`
--

LOCK TABLES `blc_address` WRITE;
/*!40000 ALTER TABLE `blc_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_module`
--

DROP TABLE IF EXISTS `blc_admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_module` (
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `MODULE_KEY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_MODULE_ID`),
  KEY `ADMINMODULE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_module`
--

LOCK TABLES `blc_admin_module` WRITE;
/*!40000 ALTER TABLE `blc_admin_module` DISABLE KEYS */;
INSERT INTO `blc_admin_module` VALUES (-5,5,'icon-file','BLCModuleConfiguration','Module Configuration'),(-4,4,'icon-user','BLCOpenAdmin','User Administration'),(-3,3,'icon-heart','BLCCustomerCare','Customer Care'),(-2,2,'icon-file','BLCContentManagement','Content Management'),(-1,1,'icon-barcode','BLCMerchandising','Catalog');
/*!40000 ALTER TABLE `blc_admin_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_password_token`
--

DROP TABLE IF EXISTS `blc_admin_password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_password_token`
--

LOCK TABLES `blc_admin_password_token` WRITE;
/*!40000 ALTER TABLE `blc_admin_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_permission`
--

DROP TABLE IF EXISTS `blc_admin_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_permission` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSION_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`),
  KEY `ADMINPERM_NAME_INDEX` (`NAME`),
  KEY `ADMINPERM_TYPE_INDEX` (`PERMISSION_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_permission`
--

LOCK TABLES `blc_admin_permission` WRITE;
/*!40000 ALTER TABLE `blc_admin_permission` DISABLE KEYS */;
INSERT INTO `blc_admin_permission` VALUES (-93,'All Configuration','PERMISSION_ALL_MODULECONFIGURATION','ALL'),(-92,'Read Configuration','PERMISSION_READ_MODULECONFIGURATION','READ'),(-91,'Delete Configuration','PERMISSION_DELETE_MODULECONFIGURATION','DELETE'),(-90,'Update Configuration','PERMISSION_UPDATE_MODULECONFIGURATION','UPDATE'),(-89,'Create Configuration','PERMISSION_CREATE_MODULECONFIGURATION','CREATE'),(-88,'All Currency','PERMISSION_ALL_CURRENCY','ALL'),(-87,'Read Currency','PERMISSION_READ_CURRENCY','READ'),(-86,'Delete Currency','PERMISSION_DELETE_CURRENCY','DELETE'),(-85,'Update Currency','PERMISSION_UPDATE_CURRENCY','UPDATE'),(-84,'Create Currency','PERMISSION_CREATE_CURRENCY','CREATE'),(-83,'All SearchFacet','PERMISSION_ALL_SEARCHFACET','ALL'),(-82,'Read SearchFacet','PERMISSION_READ_SEARCHFACET','READ'),(-81,'Delete SearchFacet','PERMISSION_DELETE_SEARCHFACET','DELETE'),(-80,'Update SearchFacet','PERMISSION_UPDATE_SEARCHFACET','UPDATE'),(-79,'Create SearchFacet','PERMISSION_CREATE_SEARCHFACET','CREATE'),(-78,'All SearchRedirect','PERMISSION_ALL_SEARCHREDIRECT','ALL'),(-77,'Read SearchRedirect','PERMISSION_READ_SEARCHREDIRECT','READ'),(-76,'Delete SearchRedirect','PERMISSION_DELETE_SEARCHREDIRECT','DELETE'),(-75,'Update SearchRedirect','PERMISSION_UPDATE_SEARCHREDIRECT','UPDATE'),(-74,'Create SearchRedirect','PERMISSION_CREATE_SEARCHREDIRECT','CREATE'),(-73,'All URLHandler','PERMISSION_ALL_URLHANDLER','ALL'),(-72,'Read URLHandler','PERMISSION_READ_URLHANDLER','READ'),(-71,'Delete URLHandler','PERMISSION_DELETE_URLHANDLER','DELETE'),(-70,'Update URLHandler','PERMISSION_UPDATE_URLHANDLER','UPDATE'),(-69,'Create URLHandler','PERMISSION_CREATE_URLHANDLER','CREATE'),(-68,'All Admin User','PERMISSION_ALL_ADMIN_USER','ALL'),(-67,'Read Admin User','PERMISSION_READ_ADMIN_USER','READ'),(-66,'Delete Admin User','PERMISSION_DELETE_ADMIN_USER','DELETE'),(-65,'Update Admin User','PERMISSION_UPDATE_ADMIN_USER','UPDATE'),(-64,'Create Admin User','PERMISSION_CREATE_ADMIN_USER','CREATE'),(-63,'Approver SandBox','PERMISSION_ALL_APPROVER_SANDBOX','ALL'),(-62,'User SandBox','PERMISSION_ALL_USER_SANDBOX','ALL'),(-61,'All Structured Content','PERMISSION_ALL_STRUCTURED_CONTENT','ALL'),(-60,'Read Structured Content','PERMISSION_READ_STRUCTURED_CONTENT','READ'),(-59,'Delete Structured Content','PERMISSION_DELETE_STRUCTURED_CONTENT','DELETE'),(-58,'Update Structured Content','PERMISSION_UPDATE_STRUCTURED_CONTENT','UPDATE'),(-57,'Create Structured Content','PERMISSION_CREATE_STRUCTURED_CONTENT','CREATE'),(-56,'All Asset','PERMISSION_ALL_ASSET','ALL'),(-55,'Read Asset','PERMISSION_READ_ASSET','READ'),(-54,'Delete Asset','PERMISSION_DELETE_ASSET','DELETE'),(-53,'Update Asset','PERMISSION_UPDATE_ASSET','UPDATE'),(-52,'Create Asset','PERMISSION_CREATE_ASSET','CREATE'),(-51,'All Page','PERMISSION_ALL_PAGE','ALL'),(-50,'Read Page','PERMISSION_READ_PAGE','READ'),(-49,'Delete Page','PERMISSION_DELETE_PAGE','DELETE'),(-48,'Update Page','PERMISSION_UPDATE_PAGE','UPDATE'),(-47,'Create Page','PERMISSION_CREATE_PAGE','CREATE'),(-46,'All Customer','PERMISSION_ALL_CUSTOMER','ALL'),(-45,'Read Customer','PERMISSION_READ_CUSTOMER','READ'),(-44,'Delete Customer','PERMISSION_DELETE_CUSTOMER','DELETE'),(-43,'Update Customer','PERMISSION_UPDATE_CUSTOMER','UPDATE'),(-42,'Create Customer','PERMISSION_CREATE_CUSTOMER','CREATE'),(-41,'All Order Item','PERMISSION_ALL_ORDER_ITEM','ALL'),(-40,'Read Order Item','PERMISSION_READ_ORDER_ITEM','READ'),(-39,'Delete Order Item','PERMISSION_DELETE_ORDER_ITEM','DELETE'),(-38,'Update Order Item','PERMISSION_UPDATE_ORDER_ITEM','UPDATE'),(-37,'Create Order Item','PERMISSION_CREATE_ORDER_ITEM','CREATE'),(-36,'All Fulfillment Group','PERMISSION_ALL_FULFILLMENT_GROUP','ALL'),(-35,'Read Fulfillment Group','PERMISSION_READ_FULFILLMENT_GROUP','READ'),(-34,'Delete Fulfillment Group','PERMISSION_DELETE_FULFILLMENT_GROUP','DELETE'),(-33,'Update Fulfillment Group','PERMISSION_UPDATE_FULFILLMENT_GROUP','UPDATE'),(-32,'Create Fulfillment Group','PERMISSION_CREATE_FULFILLMENT_GROUP','CREATE'),(-31,'All Order','PERMISSION_ALL_ORDER','ALL'),(-30,'Read Order','PERMISSION_READ_ORDER','READ'),(-29,'Delete Order','PERMISSION_DELETE_ORDER','DELETE'),(-28,'Update Order','PERMISSION_UPDATE_ORDER','UPDATE'),(-27,'Create Order','PERMISSION_CREATE_ORDER','CREATE'),(-26,'All Promotion','PERMISSION_ALL_PROMOTION','ALL'),(-25,'Read Promotion','PERMISSION_READ_PROMOTION','READ'),(-24,'Delete Promotion','PERMISSION_DELETE_PROMOTION','DELETE'),(-23,'Update Promotion','PERMISSION_UPDATE_PROMOTION','UPDATE'),(-22,'Create Promotion','PERMISSION_CREATE_PROMOTION','CREATE'),(-21,'All Sku','PERMISSION_ALL_SKU','ALL'),(-20,'Read Sku','PERMISSION_READ_SKU','READ'),(-19,'Delete Sku','PERMISSION_DELETE_SKU','DELETE'),(-18,'Update Sku','PERMISSION_UPDATE_SKU','UPDATE'),(-17,'Create Sku','PERMISSION_CREATE_SKU','CREATE'),(-16,'All Product Option','PERMISSION_ALL_PRODUCT_OPTION','ALL'),(-15,'Read Product Option','PERMISSION_READ_PRODUCT_OPTION','READ'),(-14,'Delete Product Option','PERMISSION_DELETE_PRODUCT_OPTION','DELETE'),(-13,'Update Product Option','PERMISSION_UPDATE_PRODUCT_OPTION','UPDATE'),(-12,'Create Product Options','PERMISSION_CREATE_PRODUCT_OPTION','CREATE'),(-11,'All Product','PERMISSION_ALL_PRODUCT','ALL'),(-10,'Read Product','PERMISSION_READ_PRODUCT','READ'),(-9,'Delete Product','PERMISSION_DELETE_PRODUCT','DELETE'),(-8,'Update Product','PERMISSION_UPDATE_PRODUCT','UPDATE'),(-7,'Create Product','PERMISSION_CREATE_PRODUCT','CREATE'),(-6,'All Category','PERMISSION_ALL_CATEGORY','ALL'),(-5,'Read Category','PERMISSION_READ_CATEGORY','READ'),(-4,'Delete Category','PERMISSION_DELETE_CATEGORY','DELETE'),(-3,'Update Category','PERMISSION_UPDATE_CATEGORY','UPDATE'),(-2,'Create Category','PERMISSION_CREATE_CATEGORY','CREATE'),(-1,'Default Permission','PERMISSION_OTHER_DEFAULT','OTHER');
/*!40000 ALTER TABLE `blc_admin_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_permission_entity`
--

DROP TABLE IF EXISTS `blc_admin_permission_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_permission_entity` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FK23C09E3DE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK23C09E3DE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_permission_entity`
--

LOCK TABLES `blc_admin_permission_entity` WRITE;
/*!40000 ALTER TABLE `blc_admin_permission_entity` DISABLE KEYS */;
INSERT INTO `blc_admin_permission_entity` VALUES (-884,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-93),(-883,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-92),(-882,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-91),(-881,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-90),(-880,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-89),(-854,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-88),(-853,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-87),(-852,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-86),(-851,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-85),(-850,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-84),(-832,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-82),(-824,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-83),(-822,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-81),(-821,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-80),(-820,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-79),(-819,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-83),(-818,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-82),(-817,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-81),(-816,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-80),(-815,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-79),(-814,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-83),(-813,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-82),(-812,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-81),(-811,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-80),(-810,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-79),(-809,'org.broadleafcommerce.core.search.domain.Field',-83),(-808,'org.broadleafcommerce.core.search.domain.Field',-82),(-807,'org.broadleafcommerce.core.search.domain.Field',-81),(-806,'org.broadleafcommerce.core.search.domain.Field',-80),(-805,'org.broadleafcommerce.core.search.domain.Field',-79),(-804,'org.broadleafcommerce.core.search.domain.SearchFacet',-83),(-803,'org.broadleafcommerce.core.search.domain.SearchFacet',-82),(-802,'org.broadleafcommerce.core.search.domain.SearchFacet',-81),(-801,'org.broadleafcommerce.core.search.domain.SearchFacet',-80),(-800,'org.broadleafcommerce.core.search.domain.SearchFacet',-79),(-784,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-78),(-783,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-77),(-782,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-76),(-781,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-75),(-780,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-74),(-759,'org.broadleafcommerce.common.locale.domain.Locale',-73),(-758,'org.broadleafcommerce.common.locale.domain.Locale',-72),(-757,'org.broadleafcommerce.common.locale.domain.Locale',-71),(-756,'org.broadleafcommerce.common.locale.domain.Locale',-70),(-755,'org.broadleafcommerce.common.locale.domain.Locale',-69),(-754,'org.broadleafcommerce.cms.url.domain.URLHandler',-73),(-753,'org.broadleafcommerce.cms.url.domain.URLHandler',-72),(-752,'org.broadleafcommerce.cms.url.domain.URLHandler',-71),(-751,'org.broadleafcommerce.cms.url.domain.URLHandler',-70),(-750,'org.broadleafcommerce.cms.url.domain.URLHandler',-69),(-737,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-68),(-736,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-67),(-735,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-66),(-734,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-65),(-733,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-64),(-732,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-68),(-731,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-67),(-730,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-66),(-726,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-65),(-725,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-64),(-724,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-68),(-723,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-67),(-722,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-66),(-721,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-65),(-720,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-64),(-701,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',-63),(-700,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',-62),(-674,'org.broadleafcommerce.common.locale.domain.Locale',-61),(-673,'org.broadleafcommerce.common.locale.domain.Locale',-60),(-672,'org.broadleafcommerce.common.locale.domain.Locale',-59),(-671,'org.broadleafcommerce.common.locale.domain.Locale',-58),(-670,'org.broadleafcommerce.common.locale.domain.Locale',-57),(-669,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-61),(-668,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-60),(-667,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-59),(-666,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-58),(-665,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',-57),(-664,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-61),(-663,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-60),(-662,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-59),(-661,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-58),(-660,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',-57),(-659,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-61),(-658,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-60),(-657,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-59),(-656,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-58),(-655,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',-57),(-654,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-61),(-653,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-60),(-652,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-59),(-651,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-58),(-650,'org.broadleafcommerce.cms.structure.domain.StructuredContent',-57),(-609,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-56),(-608,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-55),(-607,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-54),(-606,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-53),(-605,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-52),(-604,'org.broadleafcommerce.cms.file.domain.StaticAsset',-56),(-603,'org.broadleafcommerce.cms.file.domain.StaticAsset',-55),(-602,'org.broadleafcommerce.cms.file.domain.StaticAsset',-54),(-601,'org.broadleafcommerce.cms.file.domain.StaticAsset',-53),(-600,'org.broadleafcommerce.cms.file.domain.StaticAsset',-52),(-569,'org.broadleafcommerce.common.locale.domain.Locale',-51),(-568,'org.broadleafcommerce.common.locale.domain.Locale',-50),(-567,'org.broadleafcommerce.common.locale.domain.Locale',-49),(-566,'org.broadleafcommerce.common.locale.domain.Locale',-48),(-565,'org.broadleafcommerce.common.locale.domain.Locale',-47),(-564,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-51),(-563,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-50),(-562,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-49),(-561,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-48),(-560,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-47),(-559,'org.broadleafcommerce.cms.page.domain.PageTemplate',-51),(-558,'org.broadleafcommerce.cms.page.domain.PageTemplate',-50),(-557,'org.broadleafcommerce.cms.page.domain.PageTemplate',-49),(-556,'org.broadleafcommerce.cms.page.domain.PageTemplate',-48),(-555,'org.broadleafcommerce.cms.page.domain.PageTemplate',-47),(-554,'org.broadleafcommerce.cms.page.domain.Page',-51),(-553,'org.broadleafcommerce.cms.page.domain.Page',-50),(-552,'org.broadleafcommerce.cms.page.domain.Page',-49),(-551,'org.broadleafcommerce.cms.page.domain.Page',-48),(-550,'org.broadleafcommerce.cms.page.domain.Page',-47),(-534,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-46),(-533,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-45),(-532,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-44),(-531,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-43),(-530,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-42),(-529,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-46),(-528,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-45),(-527,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-44),(-526,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-43),(-525,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-42),(-524,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-46),(-523,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-45),(-522,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-44),(-521,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-43),(-520,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-42),(-519,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-46),(-518,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-45),(-517,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-44),(-516,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-43),(-515,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-42),(-514,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-46),(-513,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-45),(-512,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-44),(-511,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-43),(-510,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-42),(-509,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-46),(-508,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-45),(-507,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-44),(-506,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-43),(-505,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-42),(-504,'org.broadleafcommerce.profile.core.domain.Customer',-46),(-503,'org.broadleafcommerce.profile.core.domain.Customer',-45),(-502,'org.broadleafcommerce.profile.core.domain.Customer',-44),(-501,'org.broadleafcommerce.profile.core.domain.Customer',-43),(-500,'org.broadleafcommerce.profile.core.domain.Customer',-42),(-479,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-41),(-478,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-40),(-477,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-39),(-476,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-38),(-475,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-37),(-474,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-41),(-473,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-40),(-472,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-39),(-471,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-38),(-470,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-37),(-469,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-41),(-468,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-40),(-467,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-39),(-466,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-38),(-465,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-37),(-464,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-41),(-463,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-40),(-462,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-39),(-461,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-38),(-460,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-37),(-459,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-41),(-458,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-40),(-457,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-39),(-456,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-38),(-455,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-37),(-454,'org.broadleafcommerce.core.order.domain.OrderItem',-41),(-453,'org.broadleafcommerce.core.order.domain.OrderItem',-40),(-452,'org.broadleafcommerce.core.order.domain.OrderItem',-39),(-451,'org.broadleafcommerce.core.order.domain.OrderItem',-38),(-450,'org.broadleafcommerce.core.order.domain.OrderItem',-37),(-419,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-36),(-418,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-35),(-417,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-34),(-416,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-33),(-415,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-32),(-414,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-36),(-413,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-35),(-412,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-34),(-411,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-33),(-410,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-32),(-409,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-36),(-408,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-35),(-407,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-34),(-406,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-33),(-405,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-32),(-404,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-36),(-403,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-35),(-402,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-34),(-401,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-33),(-400,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-32),(-378,'org.broadleafcommerce.core.payment.domain.AmountItemImpl',-31),(-377,'org.broadleafcommerce.core.payment.domain.AmountItemImpl',-30),(-376,'org.broadleafcommerce.core.payment.domain.AmountItemImpl',-29),(-375,'org.broadleafcommerce.core.payment.domain.AmountItemImpl',-28),(-374,'org.broadleafcommerce.core.payment.domain.AmountItemImpl',-27),(-373,'org.broadleafcommerce.core.payment.domain.PaymentInfoDetailImpl',-31),(-372,'org.broadleafcommerce.core.payment.domain.PaymentInfoDetailImpl',-30),(-371,'org.broadleafcommerce.core.payment.domain.PaymentInfoDetailImpl',-29),(-370,'org.broadleafcommerce.core.payment.domain.PaymentInfoDetailImpl',-28),(-369,'org.broadleafcommerce.core.payment.domain.PaymentInfoDetailImpl',-27),(-368,'org.broadleafcommerce.profile.core.domain.State',-31),(-367,'org.broadleafcommerce.profile.core.domain.State',-30),(-366,'org.broadleafcommerce.profile.core.domain.Country',-31),(-365,'org.broadleafcommerce.profile.core.domain.Country',-30),(-364,'org.broadleafcommerce.core.payment.domain.PaymentInfo',-31),(-363,'org.broadleafcommerce.core.payment.domain.PaymentInfo',-30),(-362,'org.broadleafcommerce.core.payment.domain.PaymentInfo',-29),(-361,'org.broadleafcommerce.core.payment.domain.PaymentInfo',-28),(-360,'org.broadleafcommerce.core.payment.domain.PaymentInfo',-27),(-359,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-31),(-358,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-30),(-357,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-29),(-356,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-28),(-355,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-27),(-354,'org.broadleafcommerce.core.order.domain.Order',-31),(-353,'org.broadleafcommerce.core.order.domain.Order',-30),(-352,'org.broadleafcommerce.core.order.domain.Order',-29),(-351,'org.broadleafcommerce.core.order.domain.Order',-28),(-350,'org.broadleafcommerce.core.order.domain.Order',-27),(-314,'org.broadleafcommerce.core.offer.domain.OfferCode',-26),(-313,'org.broadleafcommerce.core.offer.domain.OfferCode',-25),(-312,'org.broadleafcommerce.core.offer.domain.OfferCode',-24),(-311,'org.broadleafcommerce.core.offer.domain.OfferCode',-23),(-310,'org.broadleafcommerce.core.offer.domain.OfferCode',-22),(-309,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-26),(-308,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-25),(-307,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-24),(-306,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-23),(-305,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-22),(-304,'org.broadleafcommerce.core.offer.domain.Offer',-26),(-303,'org.broadleafcommerce.core.offer.domain.Offer',-25),(-302,'org.broadleafcommerce.core.offer.domain.Offer',-24),(-301,'org.broadleafcommerce.core.offer.domain.Offer',-23),(-300,'org.broadleafcommerce.core.offer.domain.Offer',-22),(-254,'org.broadleafcommerce.core.catalog.domain.Sku',-21),(-253,'org.broadleafcommerce.core.catalog.domain.Sku',-20),(-252,'org.broadleafcommerce.core.catalog.domain.Sku',-19),(-251,'org.broadleafcommerce.core.catalog.domain.Sku',-18),(-250,'org.broadleafcommerce.core.catalog.domain.Sku',-17),(-209,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-16),(-208,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-15),(-207,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-14),(-206,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-13),(-205,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-12),(-204,'org.broadleafcommerce.core.catalog.domain.ProductOption',-16),(-203,'org.broadleafcommerce.core.catalog.domain.ProductOption',-15),(-202,'org.broadleafcommerce.core.catalog.domain.ProductOption',-14),(-201,'org.broadleafcommerce.core.catalog.domain.ProductOption',-13),(-200,'org.broadleafcommerce.core.catalog.domain.ProductOption',-12),(-119,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-11),(-118,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-10),(-117,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-9),(-116,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-8),(-115,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-7),(-114,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-11),(-113,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-10),(-112,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-9),(-111,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-8),(-110,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-7),(-109,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-11),(-108,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-10),(-107,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-9),(-106,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-8),(-105,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-7),(-104,'org.broadleafcommerce.core.catalog.domain.Product',-11),(-103,'org.broadleafcommerce.core.catalog.domain.Product',-10),(-102,'org.broadleafcommerce.core.catalog.domain.Product',-9),(-101,'org.broadleafcommerce.core.catalog.domain.Product',-8),(-100,'org.broadleafcommerce.core.catalog.domain.Product',-7),(-37,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-6),(-36,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-5),(-35,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-4),(-34,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-3),(-33,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-2),(-32,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-6),(-31,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-5),(-30,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-4),(-29,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-3),(-28,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-2),(-27,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-6),(-26,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-5),(-25,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-4),(-24,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-3),(-23,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-2),(-22,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-6),(-21,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-5),(-20,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-4),(-19,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-3),(-18,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-2),(-17,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-6),(-16,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-5),(-15,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-4),(-14,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-3),(-13,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-2),(-12,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-6),(-11,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-5),(-10,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-4),(-9,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-3),(-8,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-2),(-7,'org.broadleafcommerce.core.catalog.domain.Category',-6),(-6,'org.broadleafcommerce.core.catalog.domain.Category',-5),(-4,'org.broadleafcommerce.core.catalog.domain.Category',-4),(-2,'org.broadleafcommerce.core.catalog.domain.Category',-3),(-1,'org.broadleafcommerce.core.catalog.domain.Category',-2);
/*!40000 ALTER TABLE `blc_admin_permission_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_role`
--

DROP TABLE IF EXISTS `blc_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_role` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_role`
--

LOCK TABLES `blc_admin_role` WRITE;
/*!40000 ALTER TABLE `blc_admin_role` DISABLE KEYS */;
INSERT INTO `blc_admin_role` VALUES (-6,'CMS Approver','ROLE_CONTENT_APPROVER'),(-5,'CMS Editor','ROLE_CONTENT_EDITOR'),(-4,'CSR','ROLE_CUSTOMER_SERVICE_REP'),(-3,'Promotion Manager','ROLE_PROMOTION_MANAGER'),(-2,'Merchandiser','ROLE_MERCHANDISE_MANAGER'),(-1,'Admin Master Access','ROLE_ADMIN');
/*!40000 ALTER TABLE `blc_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_role_permission_xref`
--

DROP TABLE IF EXISTS `blc_admin_role_permission_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_role_permission_xref` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FK4A819D98E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK4A819D985F43AAD8` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FK4A819D985F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FK4A819D98E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_role_permission_xref`
--

LOCK TABLES `blc_admin_role_permission_xref` WRITE;
/*!40000 ALTER TABLE `blc_admin_role_permission_xref` DISABLE KEYS */;
INSERT INTO `blc_admin_role_permission_xref` VALUES (-1,-93),(-2,-88),(-1,-88),(-2,-83),(-1,-83),(-1,-78),(-1,-73),(-1,-68),(-6,-63),(-1,-63),(-5,-62),(-1,-62),(-6,-61),(-5,-61),(-1,-61),(-6,-56),(-5,-56),(-2,-56),(-1,-56),(-6,-51),(-5,-51),(-1,-51),(-4,-46),(-1,-46),(-4,-41),(-1,-41),(-4,-36),(-1,-36),(-4,-31),(-1,-31),(-3,-26),(-1,-26),(-2,-21),(-1,-21),(-2,-16),(-1,-16),(-2,-11),(-1,-11),(-2,-6),(-1,-6),(-6,-1),(-5,-1),(-4,-1),(-3,-1),(-2,-1),(-1,-1);
/*!40000 ALTER TABLE `blc_admin_role_permission_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_sec_perm_xref`
--

DROP TABLE IF EXISTS `blc_admin_sec_perm_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_sec_perm_xref` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK5E832966E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK5E8329663AF7F0FC` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E8329663AF7F0FC` FOREIGN KEY (`ADMIN_SECTION_ID`) REFERENCES `blc_admin_section` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E832966E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_sec_perm_xref`
--

LOCK TABLES `blc_admin_sec_perm_xref` WRITE;
/*!40000 ALTER TABLE `blc_admin_sec_perm_xref` DISABLE KEYS */;
INSERT INTO `blc_admin_sec_perm_xref` VALUES (-1,-2),(-1,-3),(-1,-4),(-1,-5),(-2,-7),(-2,-8),(-2,-9),(-2,-10),(-3,-12),(-3,-13),(-3,-14),(-3,-15),(-4,-22),(-4,-23),(-4,-24),(-4,-25),(-5,-47),(-5,-48),(-5,-49),(-5,-50),(-6,-52),(-6,-53),(-6,-54),(-6,-55),(-7,-57),(-7,-58),(-7,-59),(-7,-60),(-8,-69),(-8,-70),(-8,-71),(-8,-72),(-9,-27),(-9,-28),(-9,-29),(-9,-30),(-10,-42),(-10,-43),(-10,-44),(-10,-45),(-11,-64),(-11,-65),(-11,-66),(-11,-67),(-12,-64),(-12,-65),(-12,-66),(-12,-67),(-13,-89),(-13,-90),(-13,-91),(-13,-92);
/*!40000 ALTER TABLE `blc_admin_sec_perm_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_section`
--

DROP TABLE IF EXISTS `blc_admin_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_section` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) DEFAULT NULL,
  `DISPLAY_CONTROLLER` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SECTION_KEY` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `USE_DEFAULT_HANDLER` tinyint(1) NOT NULL,
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_SECTION_ID`),
  UNIQUE KEY `SECTION_KEY_` (`SECTION_KEY`),
  KEY `ADMINSECTION_MODULE_INDEX` (`ADMIN_MODULE_ID`),
  KEY `ADMINSECTION_NAME_INDEX` (`NAME`),
  KEY `FK7EA7D92FB1A18498` (`ADMIN_MODULE_ID`),
  CONSTRAINT `FK7EA7D92FB1A18498` FOREIGN KEY (`ADMIN_MODULE_ID`) REFERENCES `blc_admin_module` (`ADMIN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_section`
--

LOCK TABLES `blc_admin_section` WRITE;
/*!40000 ALTER TABLE `blc_admin_section` DISABLE KEYS */;
INSERT INTO `blc_admin_section` VALUES (-13,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',NULL,1000,'Configuration Management','ConfigurationManagement','/configuration-management',0,-5),(-12,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',NULL,2000,'Role Management','RoleManagement','/role-management',0,-4),(-11,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',NULL,1000,'User Management','UserManagement','/user-management',0,-4),(-10,'org.broadleafcommerce.profile.core.domain.Customer',NULL,2000,'Customer','Customer','/customer',0,-3),(-9,'org.broadleafcommerce.core.order.domain.Order',NULL,1000,'Order','Order','/order',0,-3),(-8,'org.broadleafcommerce.cms.url.domain.URLHandler',NULL,4000,'Redirect URL','RedirectURL','/redirect-url',0,-2),(-7,'org.broadleafcommerce.cms.structure.domain.StructuredContent',NULL,2000,'Structured Content','StructuredContent','/structured-content',0,-2),(-6,'org.broadleafcommerce.cms.file.domain.StaticAsset',NULL,3000,'Assets','Assets','/assets',0,-2),(-5,'org.broadleafcommerce.cms.page.domain.Page',NULL,1000,'Pages','Pages','/pages',0,-2),(-4,'org.broadleafcommerce.core.offer.domain.Offer',NULL,4000,'Offer','Offer','/offer',0,-1),(-3,'org.broadleafcommerce.core.catalog.domain.ProductOption',NULL,3000,'Product Options','ProductOptions','/product-options',0,-1),(-2,'org.broadleafcommerce.core.catalog.domain.Product',NULL,2000,'Product','Product','/product',0,-1),(-1,'org.broadleafcommerce.core.catalog.domain.Category',NULL,1000,'Category','Category','/category',0,-1);
/*!40000 ALTER TABLE `blc_admin_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_user`
--

DROP TABLE IF EXISTS `blc_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_user` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` tinyint(1) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PHONE_NUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_user`
--

LOCK TABLES `blc_admin_user` WRITE;
/*!40000 ALTER TABLE `blc_admin_user` DISABLE KEYS */;
INSERT INTO `blc_admin_user` VALUES (-6,1,'cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin',NULL),(-5,1,'cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin',NULL),(-4,1,'csr@yourdomain.com','csr','CSR','admin',NULL),(-3,1,'promo@yourdomain.com','promo','Promotion Manager','admin',NULL),(-2,1,'merchandise@yourdomain.com','merchandise','Merchandise Manager','admin',NULL),(-1,1,'admin@yourdomain.com','admin','Administrator','admin',NULL);
/*!40000 ALTER TABLE `blc_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_user_permission_xref`
--

DROP TABLE IF EXISTS `blc_admin_user_permission_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_user_permission_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKF0B3BEEDE88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FKF0B3BEED46EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF0B3BEED46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF0B3BEEDE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `blc_admin_permission` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_user_permission_xref`
--

LOCK TABLES `blc_admin_user_permission_xref` WRITE;
/*!40000 ALTER TABLE `blc_admin_user_permission_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_user_permission_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_user_role_xref`
--

DROP TABLE IF EXISTS `blc_admin_user_role_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_user_role_xref` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKFFD33A265F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FKFFD33A2646EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A2646EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A265F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `blc_admin_role` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_user_role_xref`
--

LOCK TABLES `blc_admin_user_role_xref` WRITE;
/*!40000 ALTER TABLE `blc_admin_user_role_xref` DISABLE KEYS */;
INSERT INTO `blc_admin_user_role_xref` VALUES (-6,-6),(-5,-5),(-4,-4),(-3,-3),(-2,-2),(-1,-1);
/*!40000 ALTER TABLE `blc_admin_user_role_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_user_sandbox`
--

DROP TABLE IF EXISTS `blc_admin_user_sandbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_user_sandbox` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKD0A97E09579FE59D` (`SANDBOX_ID`),
  KEY `FKD0A97E0946EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKD0A97E0946EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `blc_admin_user` (`ADMIN_USER_ID`),
  CONSTRAINT `FKD0A97E09579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_user_sandbox`
--

LOCK TABLES `blc_admin_user_sandbox` WRITE;
/*!40000 ALTER TABLE `blc_admin_user_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_admin_user_sandbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_amount_item`
--

DROP TABLE IF EXISTS `blc_amount_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_amount_item` (
  `AMOUNT_ITEM_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `SYSTEM_ID` varchar(255) DEFAULT NULL,
  `UNIT_PRICE` decimal(19,5) NOT NULL,
  `PAYMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AMOUNT_ITEM_ID`),
  KEY `AMOUNTITEM_PAYMENTINFO_INDEX` (`PAYMENT_ID`),
  KEY `SHORT_DESCRIPTION_INDEX` (`SHORT_DESCRIPTION`),
  KEY `FKB98530944BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKB98530944BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `blc_order_payment` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_amount_item`
--

LOCK TABLES `blc_amount_item` WRITE;
/*!40000 ALTER TABLE `blc_amount_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_amount_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_asset_desc_map`
--

DROP TABLE IF EXISTS `blc_asset_desc_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_asset_desc_map` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKE886BAE3E2BA0C9D` (`STATIC_ASSET_DESC_ID`),
  KEY `FKE886BAE367F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKE886BAE367F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKE886BAE3E2BA0C9D` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `blc_static_asset_desc` (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_asset_desc_map`
--

LOCK TABLES `blc_asset_desc_map` WRITE;
/*!40000 ALTER TABLE `blc_asset_desc_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_asset_desc_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_bank_account_payment`
--

DROP TABLE IF EXISTS `blc_bank_account_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_bank_account_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  `ROUTING_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_bank_account_payment`
--

LOCK TABLES `blc_bank_account_payment` WRITE;
/*!40000 ALTER TABLE `blc_bank_account_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bank_account_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_bund_item_fee_price`
--

DROP TABLE IF EXISTS `blc_bund_item_fee_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_bund_item_fee_price` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FK14267A943FC68307` (`BUND_ORDER_ITEM_ID`),
  CONSTRAINT `FK14267A943FC68307` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_bund_item_fee_price`
--

LOCK TABLES `blc_bund_item_fee_price` WRITE;
/*!40000 ALTER TABLE `blc_bund_item_fee_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bund_item_fee_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_bundle_order_item`
--

DROP TABLE IF EXISTS `blc_bundle_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_bundle_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK489703DBCCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FK489703DBB78C9977` (`SKU_ID`),
  KEY `FK489703DB9AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DB9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DBB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FK489703DBCCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_bundle_order_item`
--

LOCK TABLES `blc_bundle_order_item` WRITE;
/*!40000 ALTER TABLE `blc_bundle_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bundle_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_candidate_fg_offer`
--

DROP TABLE IF EXISTS `blc_candidate_fg_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_candidate_fg_offer` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  KEY `FKCE785605028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKCE78560D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FKCE785605028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE78560D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_candidate_fg_offer`
--

LOCK TABLES `blc_candidate_fg_offer` WRITE;
/*!40000 ALTER TABLE `blc_candidate_fg_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_candidate_fg_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_candidate_item_offer`
--

DROP TABLE IF EXISTS `blc_candidate_item_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_candidate_item_offer` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B2D5F3FAF4` (`OFFER_ID`),
  KEY `FK9EEE9B29AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9EEE9B29AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9EEE9B2D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_candidate_item_offer`
--

LOCK TABLES `blc_candidate_item_offer` WRITE;
/*!40000 ALTER TABLE `blc_candidate_item_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_candidate_item_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_candidate_order_offer`
--

DROP TABLE IF EXISTS `blc_candidate_order_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_candidate_order_offer` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK61852289D5F3FAF4` (`OFFER_ID`),
  KEY `FK6185228989FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK6185228989FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK61852289D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_candidate_order_offer`
--

LOCK TABLES `blc_candidate_order_offer` WRITE;
/*!40000 ALTER TABLE `blc_candidate_order_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_candidate_order_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_cat_search_facet_excl_xref`
--

DROP TABLE IF EXISTS `blc_cat_search_facet_excl_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_cat_search_facet_excl_xref` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK8361EF4E15D1A13D` (`CATEGORY_ID`),
  KEY `FK8361EF4EB96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK8361EF4E15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4EB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_cat_search_facet_excl_xref`
--

LOCK TABLES `blc_cat_search_facet_excl_xref` WRITE;
/*!40000 ALTER TABLE `blc_cat_search_facet_excl_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_cat_search_facet_excl_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_cat_search_facet_xref`
--

DROP TABLE IF EXISTS `blc_cat_search_facet_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_cat_search_facet_xref` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK32210EEB15D1A13D` (`CATEGORY_ID`),
  KEY `FK32210EEBB96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK32210EEB15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEBB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_cat_search_facet_xref`
--

LOCK TABLES `blc_cat_search_facet_xref` WRITE;
/*!40000 ALTER TABLE `blc_cat_search_facet_xref` DISABLE KEYS */;
INSERT INTO `blc_cat_search_facet_xref` VALUES (1,1,2002,1),(2,2,2002,2),(3,3,1,3);
/*!40000 ALTER TABLE `blc_cat_search_facet_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_catalog`
--

DROP TABLE IF EXISTS `blc_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_catalog`
--

LOCK TABLES `blc_catalog` WRITE;
/*!40000 ALTER TABLE `blc_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category`
--

DROP TABLE IF EXISTS `blc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URL_INDEX` (`URL`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  KEY `FK55F82D44B177E6` (`DEFAULT_PARENT_CATEGORY_ID`),
  CONSTRAINT `FK55F82D44B177E6` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category`
--

LOCK TABLES `blc_category` WRITE;
/*!40000 ALTER TABLE `blc_category` DISABLE KEYS */;
INSERT INTO `blc_category` VALUES (1,NULL,'2013-09-11 09:21:06',NULL,'Root',NULL,NULL,NULL,NULL,'Root',NULL,NULL,NULL,NULL),(2,NULL,'2013-09-11 09:21:06',NULL,'Primary Nav',NULL,NULL,NULL,NULL,'Primary Nav',NULL,NULL,NULL,1),(2001,NULL,'2013-09-11 09:21:06',NULL,'Home','layout/home',NULL,NULL,NULL,'Home',NULL,'/',NULL,2),(2002,NULL,'2013-09-11 09:21:06',NULL,'Hot Sauces',NULL,NULL,NULL,NULL,'Hot Sauces',NULL,'/hot-sauces',NULL,2),(2003,NULL,'2013-09-11 09:21:06',NULL,'Merchandise',NULL,NULL,NULL,NULL,'Merchandise',NULL,'/merchandise',NULL,2),(2004,NULL,'2013-09-11 09:21:06',NULL,'Clearance',NULL,NULL,NULL,NULL,'Clearance',NULL,'/clearance',NULL,2),(2005,NULL,'2013-09-11 09:21:06',NULL,'New to Hot Sauce?',NULL,NULL,NULL,NULL,'New to Hot Sauce?',NULL,'/new-to-hot-sauce',NULL,2),(2006,NULL,'2013-09-11 09:21:06',NULL,'FAQs',NULL,NULL,NULL,NULL,'FAQs',NULL,'/faq',NULL,2);
/*!40000 ALTER TABLE `blc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category_attribute`
--

DROP TABLE IF EXISTS `blc_category_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category_attribute` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK4E441D4115D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK4E441D4115D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category_attribute`
--

LOCK TABLES `blc_category_attribute` WRITE;
/*!40000 ALTER TABLE `blc_category_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category_image`
--

DROP TABLE IF EXISTS `blc_category_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category_image` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`NAME`),
  KEY `FK27CF3E8015D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK27CF3E8015D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category_image`
--

LOCK TABLES `blc_category_image` WRITE;
/*!40000 ALTER TABLE `blc_category_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category_media_map`
--

DROP TABLE IF EXISTS `blc_category_media_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category_media_map` (
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_CATEGORY_CATEGORY_ID`,`MAP_KEY`),
  KEY `FKCD24B1066E4720E0` (`MEDIA_ID`),
  KEY `FKCD24B106D786CEA2` (`BLC_CATEGORY_CATEGORY_ID`),
  CONSTRAINT `FKCD24B1066E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B106D786CEA2` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category_media_map`
--

LOCK TABLES `blc_category_media_map` WRITE;
/*!40000 ALTER TABLE `blc_category_media_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_category_media_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category_product_xref`
--

DROP TABLE IF EXISTS `blc_category_product_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category_product_xref` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`PRODUCT_ID`),
  KEY `FK635EB1A615D1A13D` (`CATEGORY_ID`),
  KEY `FK635EB1A65F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK635EB1A615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK635EB1A65F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category_product_xref`
--

LOCK TABLES `blc_category_product_xref` WRITE;
/*!40000 ALTER TABLE `blc_category_product_xref` DISABLE KEYS */;
INSERT INTO `blc_category_product_xref` VALUES (1,2001,3),(2,2001,6),(3,2001,9),(4,2001,12),(1,2002,1),(2,2002,2),(3,2002,3),(4,2002,4),(5,2002,5),(6,2002,6),(7,2002,7),(8,2002,8),(9,2002,9),(10,2002,10),(11,2002,11),(12,2002,12),(13,2002,13),(14,2002,14),(15,2002,15),(16,2002,16),(17,2002,17),(18,2002,18),(19,2002,19),(1,2003,100),(2,2003,200),(3,2003,300),(4,2003,400),(5,2003,500),(6,2003,600),(1,2004,7),(2,2004,8),(3,2004,10),(4,2004,11),(5,2004,18);
/*!40000 ALTER TABLE `blc_category_product_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_category_xref`
--

DROP TABLE IF EXISTS `blc_category_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_category_xref` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`SUB_CATEGORY_ID`),
  KEY `FKE8897336D6D45DBE` (`SUB_CATEGORY_ID`),
  KEY `FKE889733615D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FKE889733615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKE8897336D6D45DBE` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_category_xref`
--

LOCK TABLES `blc_category_xref` WRITE;
/*!40000 ALTER TABLE `blc_category_xref` DISABLE KEYS */;
INSERT INTO `blc_category_xref` VALUES (1,2,1),(1,2001,2),(2,2002,2),(3,2003,2),(4,2004,2),(5,2005,2),(6,2006,2);
/*!40000 ALTER TABLE `blc_category_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_challenge_question`
--

DROP TABLE IF EXISTS `blc_challenge_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_challenge_question` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_challenge_question`
--

LOCK TABLES `blc_challenge_question` WRITE;
/*!40000 ALTER TABLE `blc_challenge_question` DISABLE KEYS */;
INSERT INTO `blc_challenge_question` VALUES (1,'What is your favorite sports team?'),(2,'What was your high school name?'),(3,'What was your childhood nickname?'),(4,'What street did you live on in third grade?'),(5,'What is your oldest sibling\'s middle name?'),(6,'What school did you attend for sixth grade?'),(7,'Where does your nearest sibling live?'),(8,'What is your youngest brother\'s birthday?'),(9,'In what city or town was your first job?');
/*!40000 ALTER TABLE `blc_challenge_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_code_types`
--

DROP TABLE IF EXISTS `blc_code_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_code_types` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) NOT NULL,
  `CODE_DESC` varchar(255) DEFAULT NULL,
  `CODE_KEY` varchar(255) NOT NULL,
  `MODIFIABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_code_types`
--

LOCK TABLES `blc_code_types` WRITE;
/*!40000 ALTER TABLE `blc_code_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_code_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_country`
--

DROP TABLE IF EXISTS `blc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_country` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_country`
--

LOCK TABLES `blc_country` WRITE;
/*!40000 ALTER TABLE `blc_country` DISABLE KEYS */;
INSERT INTO `blc_country` VALUES ('CA','Canada'),('MX','Mexico'),('US','United States');
/*!40000 ALTER TABLE `blc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_credit_card_payment`
--

DROP TABLE IF EXISTS `blc_credit_card_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_credit_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_credit_card_payment`
--

LOCK TABLES `blc_credit_card_payment` WRITE;
/*!40000 ALTER TABLE `blc_credit_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_credit_card_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_currency`
--

DROP TABLE IF EXISTS `blc_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_currency` (
  `CURRENCY_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_currency`
--

LOCK TABLES `blc_currency` WRITE;
/*!40000 ALTER TABLE `blc_currency` DISABLE KEYS */;
INSERT INTO `blc_currency` VALUES ('EUR',0,'EURO Dollar'),('GBP',0,'GB Pound'),('MXN',0,'Mexican Peso'),('USD',1,'US Dollar');
/*!40000 ALTER TABLE `blc_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer`
--

DROP TABLE IF EXISTS `blc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` tinyint(1) DEFAULT NULL,
  `RECEIVE_EMAIL` tinyint(1) DEFAULT NULL,
  `IS_REGISTERED` tinyint(1) DEFAULT NULL,
  `TAX_EXEMPTION_CODE` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `key1` (`USER_NAME`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK7716F0241422B204` (`CHALLENGE_QUESTION_ID`),
  KEY `FK7716F024A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK7716F0241422B204` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `blc_challenge_question` (`QUESTION_ID`),
  CONSTRAINT `FK7716F024A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer`
--

LOCK TABLES `blc_customer` WRITE;
/*!40000 ALTER TABLE `blc_customer` DISABLE KEYS */;
INSERT INTO `blc_customer` VALUES (100,100,'2013-09-11 09:23:52',NULL,NULL,NULL,0,'vishnu@gmail.com','Vishnu Prasath','S','123456',0,1,1,NULL,'vishnu@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `blc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_address`
--

DROP TABLE IF EXISTS `blc_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_address` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  UNIQUE KEY `key1` (`CUSTOMER_ID`,`ADDRESS_NAME`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK75B95AB9C13085DD` (`ADDRESS_ID`),
  KEY `FK75B95AB97470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB97470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB9C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_address`
--

LOCK TABLES `blc_customer_address` WRITE;
/*!40000 ALTER TABLE `blc_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_attribute`
--

DROP TABLE IF EXISTS `blc_customer_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_attribute` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKB974C8217470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKB974C8217470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_attribute`
--

LOCK TABLES `blc_customer_attribute` WRITE;
/*!40000 ALTER TABLE `blc_customer_attribute` DISABLE KEYS */;
INSERT INTO `blc_customer_attribute` VALUES (1,'referralCode','',100);
/*!40000 ALTER TABLE `blc_customer_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_offer_xref`
--

DROP TABLE IF EXISTS `blc_customer_offer_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_offer_xref` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK685E80397470F437` (`CUSTOMER_ID`),
  KEY `FK685E8039D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK685E80397470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E8039D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_offer_xref`
--

LOCK TABLES `blc_customer_offer_xref` WRITE;
/*!40000 ALTER TABLE `blc_customer_offer_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_offer_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_password_token`
--

DROP TABLE IF EXISTS `blc_customer_password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_password_token` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` tinyint(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_password_token`
--

LOCK TABLES `blc_customer_password_token` WRITE;
/*!40000 ALTER TABLE `blc_customer_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_payment`
--

DROP TABLE IF EXISTS `blc_customer_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_payment` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PAYMENT_TOKEN` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `key1` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `FK8B3DF0CBC13085DD` (`ADDRESS_ID`),
  KEY `FK8B3DF0CB7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CB7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CBC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_payment`
--

LOCK TABLES `blc_customer_payment` WRITE;
/*!40000 ALTER TABLE `blc_customer_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_payment_fields`
--

DROP TABLE IF EXISTS `blc_customer_payment_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_payment_fields` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  KEY `FK5CCB14ADCA0B98E0` (`CUSTOMER_PAYMENT_ID`),
  CONSTRAINT `FK5CCB14ADCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `blc_customer_payment` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_payment_fields`
--

LOCK TABLES `blc_customer_payment_fields` WRITE;
/*!40000 ALTER TABLE `blc_customer_payment_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_payment_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_phone`
--

DROP TABLE IF EXISTS `blc_customer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_phone` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `key1` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  KEY `FK3D28ED737470F437` (`CUSTOMER_ID`),
  KEY `FK3D28ED73D894CB5D` (`PHONE_ID`),
  CONSTRAINT `FK3D28ED737470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED73D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_phone`
--

LOCK TABLES `blc_customer_phone` WRITE;
/*!40000 ALTER TABLE `blc_customer_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_customer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_customer_role`
--

DROP TABLE IF EXISTS `blc_customer_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_customer_role` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  KEY `FK548EB7B17470F437` (`CUSTOMER_ID`),
  KEY `FK548EB7B1B8587B7` (`ROLE_ID`),
  CONSTRAINT `FK548EB7B17470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B1B8587B7` FOREIGN KEY (`ROLE_ID`) REFERENCES `blc_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_customer_role`
--

LOCK TABLES `blc_customer_role` WRITE;
/*!40000 ALTER TABLE `blc_customer_role` DISABLE KEYS */;
INSERT INTO `blc_customer_role` VALUES (1,100,1);
/*!40000 ALTER TABLE `blc_customer_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_data_drvn_enum`
--

DROP TABLE IF EXISTS `blc_data_drvn_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_data_drvn_enum` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `MODIFIABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_data_drvn_enum`
--

LOCK TABLES `blc_data_drvn_enum` WRITE;
/*!40000 ALTER TABLE `blc_data_drvn_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_data_drvn_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_data_drvn_enum_val`
--

DROP TABLE IF EXISTS `blc_data_drvn_enum_val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_data_drvn_enum_val` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) DEFAULT NULL,
  `HIDDEN` tinyint(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKB2D5700DA60E0554` (`ENUM_TYPE`),
  CONSTRAINT `FKB2D5700DA60E0554` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `blc_data_drvn_enum` (`ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_data_drvn_enum_val`
--

LOCK TABLES `blc_data_drvn_enum_val` WRITE;
/*!40000 ALTER TABLE `blc_data_drvn_enum_val` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_data_drvn_enum_val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_disc_item_fee_price`
--

DROP TABLE IF EXISTS `blc_disc_item_fee_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_disc_item_fee_price` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK2A641CC8B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK2A641CC8B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_disc_item_fee_price`
--

LOCK TABLES `blc_disc_item_fee_price` WRITE;
/*!40000 ALTER TABLE `blc_disc_item_fee_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_disc_item_fee_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_discrete_order_item`
--

DROP TABLE IF EXISTS `blc_discrete_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_discrete_order_item` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `FKBC3A8A845CDFCA80` (`BUNDLE_ORDER_ITEM_ID`),
  KEY `FKBC3A8A845F11A0B7` (`PRODUCT_ID`),
  KEY `FKBC3A8A84B78C9977` (`SKU_ID`),
  KEY `FKBC3A8A841285903B` (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKBC3A8A849AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A841285903B` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `blc_sku_bundle_item` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845CDFCA80` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `blc_bundle_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKBC3A8A849AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A84B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_discrete_order_item`
--

LOCK TABLES `blc_discrete_order_item` WRITE;
/*!40000 ALTER TABLE `blc_discrete_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_discrete_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_dyn_discrete_order_item`
--

DROP TABLE IF EXISTS `blc_dyn_discrete_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_dyn_discrete_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK209DEE9EB76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK209DEE9EB76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_dyn_discrete_order_item`
--

LOCK TABLES `blc_dyn_discrete_order_item` WRITE;
/*!40000 ALTER TABLE `blc_dyn_discrete_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_dyn_discrete_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_email_tracking`
--

DROP TABLE IF EXISTS `blc_email_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_email_tracking` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_email_tracking`
--

LOCK TABLES `blc_email_tracking` WRITE;
/*!40000 ALTER TABLE `blc_email_tracking` DISABLE KEYS */;
INSERT INTO `blc_email_tracking` VALUES (1,'2013-09-11 09:23:52','vishnu@gmail.com',NULL);
/*!40000 ALTER TABLE `blc_email_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_email_tracking_clicks`
--

DROP TABLE IF EXISTS `blc_email_tracking_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_email_tracking_clicks` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) DEFAULT NULL,
  `QUERY_STRING` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  KEY `FKFDF9F52AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKFDF9F52AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_email_tracking_clicks`
--

LOCK TABLES `blc_email_tracking_clicks` WRITE;
/*!40000 ALTER TABLE `blc_email_tracking_clicks` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_email_tracking_clicks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_email_tracking_opens`
--

DROP TABLE IF EXISTS `blc_email_tracking_opens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_email_tracking_opens` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  KEY `FKA5C3722AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKA5C3722AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `blc_email_tracking` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_email_tracking_opens`
--

LOCK TABLES `blc_email_tracking_opens` WRITE;
/*!40000 ALTER TABLE `blc_email_tracking_opens` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_email_tracking_opens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fg_adjustment`
--

DROP TABLE IF EXISTS `blc_fg_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fg_adjustment` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK468C8F255028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FK468C8F25D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK468C8F255028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F25D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fg_adjustment`
--

LOCK TABLES `blc_fg_adjustment` WRITE;
/*!40000 ALTER TABLE `blc_fg_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fg_fee_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_fee_tax_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fg_fee_tax_xref` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK25426DC0FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK25426DC071448C19` (`TAX_DETAIL_ID`),
  KEY `FK25426DC0598F6D02` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK25426DC0598F6D02` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `blc_fulfillment_group_fee` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK25426DC071448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fg_fee_tax_xref`
--

LOCK TABLES `blc_fg_fee_tax_xref` WRITE;
/*!40000 ALTER TABLE `blc_fg_fee_tax_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_fee_tax_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fg_fg_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_fg_tax_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fg_fg_tax_xref` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK61BEA455FA888C35` (`TAX_DETAIL_ID`),
  KEY `FK61BEA45571448C19` (`TAX_DETAIL_ID`),
  KEY `FK61BEA4555028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA4555028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA45571448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fg_fg_tax_xref`
--

LOCK TABLES `blc_fg_fg_tax_xref` WRITE;
/*!40000 ALTER TABLE `blc_fg_fg_tax_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_fg_tax_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fg_item_tax_xref`
--

DROP TABLE IF EXISTS `blc_fg_item_tax_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fg_item_tax_xref` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UKDD3E8443FA888C35` (`TAX_DETAIL_ID`),
  KEY `FKDD3E844371448C19` (`TAX_DETAIL_ID`),
  KEY `FKDD3E8443E3BBB4D2` (`FULFILLMENT_GROUP_ITEM_ID`),
  CONSTRAINT `FKDD3E844371448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `blc_tax_detail` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E8443E3BBB4D2` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `blc_fulfillment_group_item` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fg_item_tax_xref`
--

LOCK TABLES `blc_fg_item_tax_xref` WRITE;
/*!40000 ALTER TABLE `blc_fg_item_tax_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fg_item_tax_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_field`
--

DROP TABLE IF EXISTS `blc_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_field` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `FACET_FIELD_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `TRANSLATABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `ENTITY_TYPE_INDEX` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_field`
--

LOCK TABLES `blc_field` WRITE;
/*!40000 ALTER TABLE `blc_field` DISABLE KEYS */;
INSERT INTO `blc_field` VALUES (1,'mfg','PRODUCT','s','manufacturer',1,NULL),(2,'heatRange','PRODUCT','i','productAttributes.heatRange',0,NULL),(3,'price','PRODUCT','p','defaultSku.retailPrice',0,NULL),(4,'name','PRODUCT','s','defaultSku.name',1,1),(5,'model','PRODUCT','s','model',1,NULL),(6,'desc','PRODUCT',NULL,'defaultSku.description',1,1),(7,'ldesc','PRODUCT',NULL,'defaultSku.longDescription',1,1);
/*!40000 ALTER TABLE `blc_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_field_search_types`
--

DROP TABLE IF EXISTS `blc_field_search_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_field_search_types` (
  `FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE_FIELD_TYPE` varchar(255) DEFAULT NULL,
  KEY `FKF52D130D3C3907C4` (`FIELD_ID`),
  CONSTRAINT `FKF52D130D3C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_field_search_types`
--

LOCK TABLES `blc_field_search_types` WRITE;
/*!40000 ALTER TABLE `blc_field_search_types` DISABLE KEYS */;
INSERT INTO `blc_field_search_types` VALUES (1,'t'),(4,'t'),(5,'t'),(6,'t'),(7,'t');
/*!40000 ALTER TABLE `blc_field_search_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fld_def`
--

DROP TABLE IF EXISTS `blc_fld_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fld_def` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` tinyint(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `HIDDEN_FLAG` tinyint(1) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) DEFAULT NULL,
  `TEXT_AREA_FLAG` tinyint(1) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3FCB575EFD2EA299` (`FLD_ENUM_ID`),
  KEY `FK3FCB575E6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575E6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575EFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fld_def`
--

LOCK TABLES `blc_fld_def` WRITE;
/*!40000 ALTER TABLE `blc_fld_def` DISABLE KEYS */;
INSERT INTO `blc_fld_def` VALUES (2,0,'*',1,'HTML','Body',0,NULL,'body',NULL,0,NULL,NULL,NULL,1),(3,0,'*',0,'STRING','Title',0,NULL,'title',NULL,0,NULL,NULL,NULL,1),(7,0,'*',0,'STRING','Image URL',0,150,'imageUrl',NULL,0,NULL,NULL,NULL,4),(8,0,'*',1,'STRING','Target URL',0,150,'targetUrl',NULL,0,NULL,NULL,NULL,4),(9,0,'*',0,'STRING','Message Text',0,150,'messageText',NULL,0,NULL,NULL,NULL,6),(10,0,'*',0,'HTML','HTML Content',0,NULL,'htmlContent',NULL,0,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `blc_fld_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fld_enum`
--

DROP TABLE IF EXISTS `blc_fld_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fld_enum` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fld_enum`
--

LOCK TABLES `blc_fld_enum` WRITE;
/*!40000 ALTER TABLE `blc_fld_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fld_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fld_enum_item`
--

DROP TABLE IF EXISTS `blc_fld_enum_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fld_enum_item` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FK83A6A84AFD2EA299` (`FLD_ENUM_ID`),
  CONSTRAINT `FK83A6A84AFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `blc_fld_enum` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fld_enum_item`
--

LOCK TABLES `blc_fld_enum_item` WRITE;
/*!40000 ALTER TABLE `blc_fld_enum_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fld_enum_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fld_group`
--

DROP TABLE IF EXISTS `blc_fld_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fld_group` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fld_group`
--

LOCK TABLES `blc_fld_group` WRITE;
/*!40000 ALTER TABLE `blc_fld_group` DISABLE KEYS */;
INSERT INTO `blc_fld_group` VALUES (1,0,'Content'),(4,0,'Ad Fields'),(5,0,'HTML Fields'),(6,0,'Message Fields');
/*!40000 ALTER TABLE `blc_fld_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_group`
--

DROP TABLE IF EXISTS `blc_fulfillment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_group` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` tinyint(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `IS_PRIMARY` tinyint(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_SEQUNCE` int(11) DEFAULT NULL,
  `SERVICE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FKC5B9EF18C13085DD` (`ADDRESS_ID`),
  KEY `FKC5B9EF1881F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC5B9EF1889FE8A02` (`ORDER_ID`),
  KEY `FKC5B9EF1877F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FKC5B9EF18D894CB5D` (`PHONE_ID`),
  CONSTRAINT `FKC5B9EF1877F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FKC5B9EF1881F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1889FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKC5B9EF18C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `FKC5B9EF18D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_group`
--

LOCK TABLES `blc_fulfillment_group` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_group_fee`
--

DROP TABLE IF EXISTS `blc_fulfillment_group_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_group_fee` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK6AA8E1BF5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK6AA8E1BF5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_group_fee`
--

LOCK TABLES `blc_fulfillment_group_fee` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_group_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_group_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_group_item`
--

DROP TABLE IF EXISTS `blc_fulfillment_group_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_group_item` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `PRORATED_ORDER_ADJ` decimal(19,2) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL_ITEM_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAXABLE_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FKEA74EBDA5028DC55` (`FULFILLMENT_GROUP_ID`),
  KEY `FKEA74EBDA9AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKEA74EBDA5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `blc_fulfillment_group` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_group_item`
--

LOCK TABLES `blc_fulfillment_group_item` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_group_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_group_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_opt_banded_prc`
--

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_prc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_opt_banded_prc` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD71E981F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD71E981F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_opt_banded_prc`
--

LOCK TABLES `blc_fulfillment_opt_banded_prc` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_prc` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_prc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_opt_banded_wgt`
--

DROP TABLE IF EXISTS `blc_fulfillment_opt_banded_wgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_opt_banded_wgt` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD8AEC81F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD8AEC81F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_opt_banded_wgt`
--

LOCK TABLES `blc_fulfillment_opt_banded_wgt` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_wgt` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_opt_banded_wgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_option`
--

DROP TABLE IF EXISTS `blc_fulfillment_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_option` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) NOT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `USE_FLAT_RATES` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_option`
--

LOCK TABLES `blc_fulfillment_option` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_option` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_option` VALUES (1,'PHYSICAL','5 - 7 Days','Standard',NULL,NULL,0),(2,'PHYSICAL','3 - 5 Days','Priority',NULL,NULL,0),(3,'PHYSICAL','1 - 2 Days','Express',NULL,NULL,0);
/*!40000 ALTER TABLE `blc_fulfillment_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_option_fixed`
--

DROP TABLE IF EXISTS `blc_fulfillment_option_fixed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_option_fixed` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FK408360313E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK4083603181F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK408360313E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK4083603181F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_option_fixed`
--

LOCK TABLES `blc_fulfillment_option_fixed` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_option_fixed` DISABLE KEYS */;
INSERT INTO `blc_fulfillment_option_fixed` VALUES (5.00000,1,NULL),(10.00000,2,NULL),(20.00000,3,NULL);
/*!40000 ALTER TABLE `blc_fulfillment_option_fixed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_price_band`
--

DROP TABLE IF EXISTS `blc_fulfillment_price_band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_price_band` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FK46C9EA726CDF59CA` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK46C9EA726CDF59CA` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_prc` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_price_band`
--

LOCK TABLES `blc_fulfillment_price_band` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_price_band` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_price_band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_fulfillment_weight_band`
--

DROP TABLE IF EXISTS `blc_fulfillment_weight_band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_fulfillment_weight_band` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FK6A048D95A0B429C3` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK6A048D95A0B429C3` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_opt_banded_wgt` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_fulfillment_weight_band`
--

LOCK TABLES `blc_fulfillment_weight_band` WRITE;
/*!40000 ALTER TABLE `blc_fulfillment_weight_band` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_fulfillment_weight_band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_gift_card_payment`
--

DROP TABLE IF EXISTS `blc_gift_card_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_gift_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `PIN` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_gift_card_payment`
--

LOCK TABLES `blc_gift_card_payment` WRITE;
/*!40000 ALTER TABLE `blc_gift_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_gift_card_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_giftwrap_order_item`
--

DROP TABLE IF EXISTS `blc_giftwrap_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_giftwrap_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKE1BE1563B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKE1BE1563B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_giftwrap_order_item`
--

LOCK TABLES `blc_giftwrap_order_item` WRITE;
/*!40000 ALTER TABLE `blc_giftwrap_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_giftwrap_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_id_generation`
--

DROP TABLE IF EXISTS `blc_id_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_id_generation` (
  `ID_TYPE` varchar(255) NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_id_generation`
--

LOCK TABLES `blc_id_generation` WRITE;
/*!40000 ALTER TABLE `blc_id_generation` DISABLE KEYS */;
INSERT INTO `blc_id_generation` VALUES ('org.broadleafcommerce.profile.core.domain.Customer',100,200,NULL,NULL,2);
/*!40000 ALTER TABLE `blc_id_generation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_img_static_asset`
--

DROP TABLE IF EXISTS `blc_img_static_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_img_static_asset` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `FKCC4B772167F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKCC4B772167F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `blc_static_asset` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_img_static_asset`
--

LOCK TABLES `blc_img_static_asset` WRITE;
/*!40000 ALTER TABLE `blc_img_static_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_img_static_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_item_offer_qualifier`
--

DROP TABLE IF EXISTS `blc_item_offer_qualifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_item_offer_qualifier` (
  `ITEM_OFFER_QUALIFIER_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ITEM_OFFER_QUALIFIER_ID`),
  KEY `FKD9C50C61D5F3FAF4` (`OFFER_ID`),
  KEY `FKD9C50C619AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKD9C50C619AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKD9C50C61D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_item_offer_qualifier`
--

LOCK TABLES `blc_item_offer_qualifier` WRITE;
/*!40000 ALTER TABLE `blc_item_offer_qualifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_item_offer_qualifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_locale`
--

DROP TABLE IF EXISTS `blc_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_locale` (
  `LOCALE_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` tinyint(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `USE_IN_SEARCH_INDEX` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`),
  KEY `FK56C7DC203E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK56C7DC203E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_locale`
--

LOCK TABLES `blc_locale` WRITE;
/*!40000 ALTER TABLE `blc_locale` DISABLE KEYS */;
INSERT INTO `blc_locale` VALUES ('en',0,'English',NULL,'USD'),('en_GB',0,'English (United Kingdom)',NULL,'GBP'),('en_US',1,'English US',NULL,'USD'),('es',0,'Spanish',NULL,'EUR'),('es_ES',0,'Spanish (Spain)',NULL,'EUR'),('es_MX',0,'Spanish (Mexico)',NULL,'MXN'),('fr',0,'French',NULL,'EUR'),('fr_FR',0,'French (France)',NULL,'EUR');
/*!40000 ALTER TABLE `blc_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_media`
--

DROP TABLE IF EXISTS `blc_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_media` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`),
  KEY `MEDIA_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_media`
--

LOCK TABLES `blc_media` WRITE;
/*!40000 ALTER TABLE `blc_media` DISABLE KEYS */;
INSERT INTO `blc_media` VALUES (101,'primary',NULL,'Sudden Death Sauce Bottle','/cmsstatic/img/sauces/Sudden-Death-Sauce-Bottle.jpg'),(102,'alt1',NULL,'Sudden Death Sauce Close-up','/cmsstatic/img/sauces/Sudden-Death-Sauce-Close.jpg'),(201,'primary',NULL,'Sweet Death Sauce Bottle','/cmsstatic/img/sauces/Sweet-Death-Sauce-Bottle.jpg'),(202,'alt1',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Close.jpg'),(203,'alt2',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(204,'alt3',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Tile.jpg'),(205,'alt4',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Grass.jpg'),(206,'alt5',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Logo.jpg'),(301,'primary',NULL,'Hoppin Hot Sauce Bottle','/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg'),(302,'alt1',NULL,'Hoppin Hot Sauce Close-up','/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Close.jpg'),(401,'primary',NULL,'Day of the Dead Chipotle Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg'),(402,'alt1',NULL,'Day of the Dead Chipotle Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg'),(501,'primary',NULL,'Day of the Dead Habanero Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg'),(502,'alt1',NULL,'Day of the Dead Habanero Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg'),(601,'primary',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),(602,'alt1',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg'),(701,'primary',NULL,'Green Ghost Bottle','/cmsstatic/img/sauces/Green-Ghost-Bottle.jpg'),(702,'alt1',NULL,'Green Ghost Close-up','/cmsstatic/img/sauces/Green-Ghost-Close.jpg'),(801,'primary',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg'),(802,'alt1',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg'),(901,'primary',NULL,'Armageddon The Hot Sauce To End All Bottle','/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg'),(902,'alt1',NULL,'Armageddon The Hot Sauce To End All Close-up','/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg'),(1001,'primary',NULL,'Dr. Chilemeisters Insane Hot Sauce Bottle','/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg'),(1002,'alt1',NULL,'Dr. Chilemeisters Insane Hot Sauce Close-up','/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg'),(1101,'primary',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),(1102,'alt1',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg'),(1201,'primary',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg'),(1202,'alt1',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg'),(1301,'primary',NULL,'Bull Snort Smokin Toncils Hot Sauce Bottle','/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg'),(1302,'alt1',NULL,'Bull Snort Smokin Toncils Hot Sauce Close-up','/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg'),(1401,'primary',NULL,'Cool Cayenne Pepper Hot Sauce Bottle','/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),(1402,'alt1',NULL,'Cool Cayenne Pepper Hot Sauce Close-up','/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg'),(1501,'primary',NULL,'Roasted Garlic Hot Sauce Bottle','/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg'),(1502,'alt1',NULL,'Roasted Garlic Hot Sauce Close-up','/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg'),(1601,'primary',NULL,'Scotch Bonnet Hot Sauce Bottle','/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),(1602,'alt1',NULL,'Scotch Bonnet Hot Sauce Close-up','/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg'),(1701,'primary',NULL,'Insanity Sauce Bottle','/cmsstatic/img/sauces/Insanity-Sauce-Bottle.jpg'),(1702,'alt1',NULL,'Insanity Sauce Close-up','/cmsstatic/img/sauces/Insanity-Sauce-Close.jpg'),(1801,'primary',NULL,'Hurtin Jalepeno Hot Sauce Bottle','/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg'),(1802,'alt1',NULL,'Hurtin Jalepeno Hot Sauce Close-up','/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg'),(1901,'primary',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Bottle','/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg'),(1902,'alt1',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Close-up','/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg'),(10001,'primary','Black','Hawt Like a Habanero Men\'s Black','/cmsstatic/img/merch/habanero_mens_black.jpg'),(10002,'primary','Red','Hawt Like a Habanero Men\'s Red','/cmsstatic/img/merch/habanero_mens_red.jpg'),(10003,'primary','Silver','Hawt Like a Habanero Men\'s Silver','/cmsstatic/img/merch/habanero_mens_silver.jpg'),(20001,'primary','Black','Hawt Like a Habanero Women\'s Black','/cmsstatic/img/merch/habanero_womens_black.jpg'),(20002,'primary','Red','Hawt Like a Habanero Women\'s Red','/cmsstatic/img/merch/habanero_womens_red.jpg'),(20003,'primary','Silver','Hawt Like a Habanero Women\'s Silver','/cmsstatic/img/merch/habanero_womens_silver.jpg'),(30001,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Black','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_black.jpg'),(30002,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Red','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_red.jpg'),(30003,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Silver','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_silver.jpg'),(40001,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Black','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_black.jpg'),(40002,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Red','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_red.jpg'),(40003,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Silver','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_silver.jpg'),(50001,'primary',NULL,'Heat Clinic Mascot Men\'s Black','/cmsstatic/img/merch/heat_clinic_mascot_mens_black.jpg'),(50002,'primary',NULL,'Heat Clinic Mascot Men\'s Red','/cmsstatic/img/merch/heat_clinic_mascot_mens_red.jpg'),(50003,'primary',NULL,'Heat Clinic Mascot Men\'s Silver','/cmsstatic/img/merch/heat_clinic_mascot_mens_silver.jpg'),(60001,'primary',NULL,'Heat Clinic Mascot Women\'s Black','/cmsstatic/img/merch/heat_clinic_mascot_womens_black.jpg'),(60002,'primary',NULL,'Heat Clinic Mascot Women\'s Red','/cmsstatic/img/merch/heat_clinic_mascot_womens_red.jpg'),(60003,'primary',NULL,'Heat Clinic Mascot Women\'s Silver','/cmsstatic/img/merch/heat_clinic_mascot_womens_silver.jpg');
/*!40000 ALTER TABLE `blc_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_module_configuration`
--

DROP TABLE IF EXISTS `blc_module_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_module_configuration` (
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONFIG_TYPE` varchar(255) NOT NULL,
  `IS_DEFAULT` tinyint(1) NOT NULL,
  `MODULE_NAME` varchar(255) NOT NULL,
  `MODULE_PRIORITY` int(11) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_module_configuration`
--

LOCK TABLES `blc_module_configuration` WRITE;
/*!40000 ALTER TABLE `blc_module_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_module_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer`
--

DROP TABLE IF EXISTS `blc_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLIES_WHEN_RULES` longtext,
  `APPLIES_TO_RULES` longtext,
  `APPLY_OFFER_TO_MARKED_ITEMS` tinyint(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `AUTOMATICALLY_ADDED` tinyint(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` tinyint(1) DEFAULT NULL,
  `OFFER_DELIVERY_TYPE` varchar(255) DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MARKETING_MESSASGE` varchar(255) DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `STACKABLE` tinyint(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) DEFAULT NULL,
  `TOTALITARIAN_OFFER` tinyint(1) DEFAULT NULL,
  `USE_NEW_FORMAT` tinyint(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) NOT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_MARKETING_MESSAGE_INDEX` (`MARKETING_MESSASGE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer`
--

LOCK TABLES `blc_offer` WRITE;
/*!40000 ALTER TABLE `blc_offer` DISABLE KEYS */;
INSERT INTO `blc_offer` VALUES (1,NULL,NULL,0,0,NULL,NULL,1,'AUTOMATIC',NULL,'PERCENT_OFF','2020-01-01 00:00:00',NULL,NULL,0,'Shirts Special',NULL,NULL,10,NULL,1,'2013-09-11 00:00:00',NULL,NULL,NULL,'ORDER_ITEM',0,20.00000);
/*!40000 ALTER TABLE `blc_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_audit`
--

DROP TABLE IF EXISTS `blc_offer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_audit` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_audit`
--

LOCK TABLES `blc_offer_audit` WRITE;
/*!40000 ALTER TABLE `blc_offer_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_code`
--

DROP TABLE IF EXISTS `blc_offer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_code` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  KEY `FK76B8C8D6D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK76B8C8D6D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_code`
--

LOCK TABLES `blc_offer_code` WRITE;
/*!40000 ALTER TABLE `blc_offer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_info`
--

DROP TABLE IF EXISTS `blc_offer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_info` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_info`
--

LOCK TABLES `blc_offer_info` WRITE;
/*!40000 ALTER TABLE `blc_offer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_info_fields`
--

DROP TABLE IF EXISTS `blc_offer_info_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_info_fields` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  KEY `FKA901886183AE7237` (`OFFER_INFO_FIELDS_ID`),
  CONSTRAINT `FKA901886183AE7237` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `blc_offer_info` (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_info_fields`
--

LOCK TABLES `blc_offer_info_fields` WRITE;
/*!40000 ALTER TABLE `blc_offer_info_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_info_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_item_criteria`
--

DROP TABLE IF EXISTS `blc_offer_item_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_item_criteria` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_item_criteria`
--

LOCK TABLES `blc_offer_item_criteria` WRITE;
/*!40000 ALTER TABLE `blc_offer_item_criteria` DISABLE KEYS */;
INSERT INTO `blc_offer_item_criteria` VALUES (1,'MVEL.eval(\"toUpperCase()\",discreteOrderItem.category.name)==MVEL.eval(\"toUpperCase()\",\"merchandise\")',1);
/*!40000 ALTER TABLE `blc_offer_item_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_rule`
--

DROP TABLE IF EXISTS `blc_offer_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_rule` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_rule`
--

LOCK TABLES `blc_offer_rule` WRITE;
/*!40000 ALTER TABLE `blc_offer_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_rule_map`
--

DROP TABLE IF EXISTS `blc_offer_rule_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_rule_map` (
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_OFFER_OFFER_ID`,`MAP_KEY`),
  KEY `FKCA468FE2C11A218D` (`OFFER_RULE_ID`),
  KEY `FKCA468FE245C66D1D` (`BLC_OFFER_OFFER_ID`),
  CONSTRAINT `FKCA468FE245C66D1D` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`),
  CONSTRAINT `FKCA468FE2C11A218D` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `blc_offer_rule` (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_rule_map`
--

LOCK TABLES `blc_offer_rule_map` WRITE;
/*!40000 ALTER TABLE `blc_offer_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_rule_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order`
--

DROP TABLE IF EXISTS `blc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `FK8F5B64A83E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK8F5B64A87470F437` (`CUSTOMER_ID`),
  KEY `FK8F5B64A8A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK8F5B64A83E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK8F5B64A87470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK8F5B64A8A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order`
--

LOCK TABLES `blc_order` WRITE;
/*!40000 ALTER TABLE `blc_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_adjustment`
--

DROP TABLE IF EXISTS `blc_order_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_adjustment` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK1E92D164D5F3FAF4` (`OFFER_ID`),
  KEY `FK1E92D16489FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK1E92D16489FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK1E92D164D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_adjustment`
--

LOCK TABLES `blc_order_adjustment` WRITE;
/*!40000 ALTER TABLE `blc_order_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_attribute`
--

DROP TABLE IF EXISTS `blc_order_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_attribute` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FKB3A467A589FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKB3A467A589FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_attribute`
--

LOCK TABLES `blc_order_attribute` WRITE;
/*!40000 ALTER TABLE `blc_order_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item`
--

DROP TABLE IF EXISTS `blc_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `DISCOUNTS_ALLOWED` tinyint(1) DEFAULT NULL,
  `ITEM_TAXABLE_FLAG` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `RETAIL_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE_OVERRIDE` tinyint(1) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FK9A2E704A15D1A13D` (`CATEGORY_ID`),
  KEY `FK9A2E704AFD2F1F10` (`GIFT_WRAP_ITEM_ID`),
  KEY `FK9A2E704A89FE8A02` (`ORDER_ID`),
  KEY `FK9A2E704A77F565E1` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK9A2E704A77F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `blc_personal_message` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9A2E704AFD2F1F10` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `blc_giftwrap_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item`
--

LOCK TABLES `blc_order_item` WRITE;
/*!40000 ALTER TABLE `blc_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item_add_attr`
--

DROP TABLE IF EXISTS `blc_order_item_add_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item_add_attr` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  KEY `FKA466AB44B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA466AB44B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_discrete_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item_add_attr`
--

LOCK TABLES `blc_order_item_add_attr` WRITE;
/*!40000 ALTER TABLE `blc_order_item_add_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_add_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item_adjustment`
--

DROP TABLE IF EXISTS `blc_order_item_adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item_adjustment` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKA2658C82D5F3FAF4` (`OFFER_ID`),
  KEY `FKA2658C829AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA2658C829AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA2658C82D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item_adjustment`
--

LOCK TABLES `blc_order_item_adjustment` WRITE;
/*!40000 ALTER TABLE `blc_order_item_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item_attribute`
--

DROP TABLE IF EXISTS `blc_order_item_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item_attribute` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  KEY `FK9F1ED0C79AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9F1ED0C79AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item_attribute`
--

LOCK TABLES `blc_order_item_attribute` WRITE;
/*!40000 ALTER TABLE `blc_order_item_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item_dtl_adj`
--

DROP TABLE IF EXISTS `blc_order_item_dtl_adj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item_dtl_adj` (
  `ORDER_ITEM_DTL_ADJ_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `OFFER_NAME` varchar(255) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_DTL_ADJ_ID`),
  KEY `FK85F0248FD5F3FAF4` (`OFFER_ID`),
  KEY `FK85F0248FD4AEA2C0` (`ORDER_ITEM_PRICE_DTL_ID`),
  CONSTRAINT `FK85F0248FD4AEA2C0` FOREIGN KEY (`ORDER_ITEM_PRICE_DTL_ID`) REFERENCES `blc_order_item_price_dtl` (`ORDER_ITEM_PRICE_DTL_ID`),
  CONSTRAINT `FK85F0248FD5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item_dtl_adj`
--

LOCK TABLES `blc_order_item_dtl_adj` WRITE;
/*!40000 ALTER TABLE `blc_order_item_dtl_adj` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_dtl_adj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_item_price_dtl`
--

DROP TABLE IF EXISTS `blc_order_item_price_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_item_price_dtl` (
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `USE_SALE_PRICE` tinyint(1) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_PRICE_DTL_ID`),
  KEY `FK1FB64BF19AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK1FB64BF19AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_item_price_dtl`
--

LOCK TABLES `blc_order_item_price_dtl` WRITE;
/*!40000 ALTER TABLE `blc_order_item_price_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_item_price_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_multiship_option`
--

DROP TABLE IF EXISTS `blc_order_multiship_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_multiship_option` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKB3D3F7D6C13085DD` (`ADDRESS_ID`),
  KEY `FKB3D3F7D681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKB3D3F7D689FE8A02` (`ORDER_ID`),
  KEY `FKB3D3F7D69AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D689FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FKB3D3F7D69AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D6C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_multiship_option`
--

LOCK TABLES `blc_order_multiship_option` WRITE;
/*!40000 ALTER TABLE `blc_order_multiship_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_multiship_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_offer_code_xref`
--

DROP TABLE IF EXISTS `blc_order_offer_code_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_offer_code_xref` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKFDF0E8533BB10F6D` (`OFFER_CODE_ID`),
  KEY `FKFDF0E85389FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKFDF0E8533BB10F6D` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `blc_offer_code` (`OFFER_CODE_ID`),
  CONSTRAINT `FKFDF0E85389FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_offer_code_xref`
--

LOCK TABLES `blc_order_offer_code_xref` WRITE;
/*!40000 ALTER TABLE `blc_order_offer_code_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_offer_code_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_payment`
--

DROP TABLE IF EXISTS `blc_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `CUSTOMER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `CUSTOMER_PAYMENT` (`CUSTOMER_PAYMENT_ID`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERPAYMENT_PHONE_INDEX` (`PHONE_ID`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `FK9517A14FC13085DD` (`ADDRESS_ID`),
  KEY `FK9517A14FCA0B98E0` (`CUSTOMER_PAYMENT_ID`),
  KEY `FK9517A14F89FE8A02` (`ORDER_ID`),
  KEY `FK9517A14FD894CB5D` (`PHONE_ID`),
  CONSTRAINT `FK9517A14F89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `blc_order` (`ORDER_ID`),
  CONSTRAINT `FK9517A14FC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `FK9517A14FCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `blc_customer_payment` (`CUSTOMER_PAYMENT_ID`),
  CONSTRAINT `FK9517A14FD894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `blc_phone` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_payment`
--

LOCK TABLES `blc_order_payment` WRITE;
/*!40000 ALTER TABLE `blc_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_order_payment_details`
--

DROP TABLE IF EXISTS `blc_order_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_order_payment_details` (
  `PAYMENT_DETAIL_ID` bigint(20) NOT NULL,
  `PAYMENT_AMOUNT` decimal(19,2) DEFAULT NULL,
  `DATE_RECORDED` datetime DEFAULT NULL,
  `PAYMENT_INFO_DETAIL_TYPE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `PAYMENT_INFO` bigint(20) NOT NULL,
  PRIMARY KEY (`PAYMENT_DETAIL_ID`),
  KEY `FK6D3907323E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK6D390732CE00A2EB` (`PAYMENT_INFO`),
  CONSTRAINT `FK6D3907323E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK6D390732CE00A2EB` FOREIGN KEY (`PAYMENT_INFO`) REFERENCES `blc_order_payment` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_order_payment_details`
--

LOCK TABLES `blc_order_payment_details` WRITE;
/*!40000 ALTER TABLE `blc_order_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_order_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page`
--

DROP TABLE IF EXISTS `blc_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page` (
  `PAGE_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` tinyint(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FULL_URL` varchar(255) DEFAULT NULL,
  `LOCKED_FLAG` tinyint(1) DEFAULT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `ORIG_PAGE_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `PAGE_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `PAGE_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `ORIG_PAGE_ID_INDX` (`ORIG_PAGE_ID`),
  KEY `FKF41BEDD5F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FKF41BEDD5D49D3961` (`PAGE_TMPLT_ID`),
  KEY `FKF41BEDD5579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FKF41BEDD5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FKF41BEDD5D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKF41BEDD5F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page`
--

LOCK TABLES `blc_page` WRITE;
/*!40000 ALTER TABLE `blc_page` DISABLE KEYS */;
INSERT INTO `blc_page` VALUES (1,0,NULL,NULL,NULL,NULL,0,'About Us','/about_us',NULL,NULL,NULL,NULL,NULL,1,NULL),(2,0,NULL,NULL,NULL,NULL,0,'FAQ','/faq',NULL,NULL,NULL,NULL,NULL,1,NULL),(3,0,NULL,NULL,NULL,NULL,0,'New to Hot Sauce','/new-to-hot-sauce',NULL,NULL,NULL,NULL,NULL,1,NULL),(10,0,NULL,NULL,NULL,NULL,0,'Prueba de Contenido','/about_us',NULL,NULL,NULL,NULL,NULL,2,NULL),(11,0,NULL,NULL,NULL,NULL,0,'FAQ','/faq',NULL,NULL,NULL,NULL,NULL,2,NULL),(13,0,NULL,NULL,NULL,NULL,0,'New to Hot Sauce','/new-to-hot-sauce',NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `blc_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_fld`
--

DROP TABLE IF EXISTS `blc_page_fld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_fld` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `PAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`),
  KEY `FK86433AD4883C2667` (`PAGE_ID`),
  CONSTRAINT `FK86433AD4883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_fld`
--

LOCK TABLES `blc_page_fld` WRITE;
/*!40000 ALTER TABLE `blc_page_fld` DISABLE KEYS */;
INSERT INTO `blc_page_fld` VALUES (1,NULL,NULL,NULL,NULL,'body',NULL,'test content',1),(2,NULL,NULL,NULL,NULL,'title',NULL,'',1),(3,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2><h4 style=\"text-align:center;\"><a href=\"http://www.broadleafcommerce.com/features/content\">Click Here</a> to see more about Content Management in Broadleaf.</h4>',2),(4,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2>',3),(10,NULL,NULL,NULL,NULL,'body',NULL,'prueba de contenido',10),(11,NULL,NULL,NULL,NULL,'title',NULL,'Espa&ntilde;ol G&eacute;nerico',10),(12,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style=\"text-align:center;\">Haga <a href=\"http://www.broadleafcommerce.com/features/content\">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>',11),(13,NULL,NULL,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>',13);
/*!40000 ALTER TABLE `blc_page_fld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_fld_map`
--

DROP TABLE IF EXISTS `blc_page_fld_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_fld_map` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`MAP_KEY`),
  KEY `FKE9EE09515AEDD08A` (`PAGE_FLD_ID`),
  KEY `FKE9EE0951883C2667` (`PAGE_ID`),
  CONSTRAINT `FKE9EE09515AEDD08A` FOREIGN KEY (`PAGE_FLD_ID`) REFERENCES `blc_page_fld` (`PAGE_FLD_ID`),
  CONSTRAINT `FKE9EE0951883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_fld_map`
--

LOCK TABLES `blc_page_fld_map` WRITE;
/*!40000 ALTER TABLE `blc_page_fld_map` DISABLE KEYS */;
INSERT INTO `blc_page_fld_map` VALUES (1,1,'body'),(1,2,'title'),(2,3,'body'),(3,4,'body'),(10,10,'body'),(10,11,'title'),(11,12,'body'),(13,13,'body');
/*!40000 ALTER TABLE `blc_page_fld_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_item_criteria`
--

DROP TABLE IF EXISTS `blc_page_item_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_item_criteria` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_item_criteria`
--

LOCK TABLES `blc_page_item_criteria` WRITE;
/*!40000 ALTER TABLE `blc_page_item_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_item_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_rule`
--

DROP TABLE IF EXISTS `blc_page_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_rule` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_rule`
--

LOCK TABLES `blc_page_rule` WRITE;
/*!40000 ALTER TABLE `blc_page_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_rule_map`
--

DROP TABLE IF EXISTS `blc_page_rule_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_rule_map` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FK1ABA0CA336D91846` (`PAGE_RULE_ID`),
  KEY `FK1ABA0CA3C38455DD` (`BLC_PAGE_PAGE_ID`),
  CONSTRAINT `FK1ABA0CA336D91846` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `blc_page_rule` (`PAGE_RULE_ID`),
  CONSTRAINT `FK1ABA0CA3C38455DD` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_rule_map`
--

LOCK TABLES `blc_page_rule_map` WRITE;
/*!40000 ALTER TABLE `blc_page_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_page_rule_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_page_tmplt`
--

DROP TABLE IF EXISTS `blc_page_tmplt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_page_tmplt` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) DEFAULT NULL,
  `TMPLT_NAME` varchar(255) DEFAULT NULL,
  `TMPLT_PATH` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK325C9D5A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK325C9D5A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_page_tmplt`
--

LOCK TABLES `blc_page_tmplt` WRITE;
/*!40000 ALTER TABLE `blc_page_tmplt` DISABLE KEYS */;
INSERT INTO `blc_page_tmplt` VALUES (1,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Template','/content/default','en'),(2,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Spanish Template','/content/default','es');
/*!40000 ALTER TABLE `blc_page_tmplt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_payinfo_additional_fields`
--

DROP TABLE IF EXISTS `blc_payinfo_additional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_payinfo_additional_fields` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`,`FIELD_NAME`),
  KEY `FKF9378B824BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKF9378B824BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `blc_order_payment` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_payinfo_additional_fields`
--

LOCK TABLES `blc_payinfo_additional_fields` WRITE;
/*!40000 ALTER TABLE `blc_payinfo_additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payinfo_additional_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_payment_additional_fields`
--

DROP TABLE IF EXISTS `blc_payment_additional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_payment_additional_fields` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`,`FIELD_NAME`),
  KEY `FKE3507032D956B1CC` (`PAYMENT_RESPONSE_ITEM_ID`),
  CONSTRAINT `FKE3507032D956B1CC` FOREIGN KEY (`PAYMENT_RESPONSE_ITEM_ID`) REFERENCES `blc_payment_response_item` (`PAYMENT_RESPONSE_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_payment_additional_fields`
--

LOCK TABLES `blc_payment_additional_fields` WRITE;
/*!40000 ALTER TABLE `blc_payment_additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_additional_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_payment_log`
--

DROP TABLE IF EXISTS `blc_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_payment_log` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) DEFAULT NULL,
  `LOG_TYPE` varchar(255) NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `FKA43703453E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKA43703457470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKA43703453E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FKA43703457470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_payment_log`
--

LOCK TABLES `blc_payment_log` WRITE;
/*!40000 ALTER TABLE `blc_payment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_payment_response_item`
--

DROP TABLE IF EXISTS `blc_payment_response_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_payment_response_item` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `AUTHORIZATION_CODE` varchar(255) DEFAULT NULL,
  `AVS_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `REMAINING_BALANCE` decimal(19,5) DEFAULT NULL,
  `TRANSACTION_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TRANSACTION_ID` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` tinyint(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`),
  KEY `PAYRESPONSE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYRESPONSE_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYRESPONSE_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`,`REFERENCE_NUMBER`),
  KEY `PAYRESPONSE_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `FK807B8F323E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK807B8F327470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK807B8F323E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK807B8F327470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_payment_response_item`
--

LOCK TABLES `blc_payment_response_item` WRITE;
/*!40000 ALTER TABLE `blc_payment_response_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_payment_response_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_personal_message`
--

DROP TABLE IF EXISTS `blc_personal_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_personal_message` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) DEFAULT NULL,
  `MESSAGE_TO` varchar(255) DEFAULT NULL,
  `OCCASION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_personal_message`
--

LOCK TABLES `blc_personal_message` WRITE;
/*!40000 ALTER TABLE `blc_personal_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_personal_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_pgtmplt_fldgrp_xref`
--

DROP TABLE IF EXISTS `blc_pgtmplt_fldgrp_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_pgtmplt_fldgrp_xref` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK99D625F66A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK99D625F6D49D3961` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FK99D625F66A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F6D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `blc_page_tmplt` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_pgtmplt_fldgrp_xref`
--

LOCK TABLES `blc_pgtmplt_fldgrp_xref` WRITE;
/*!40000 ALTER TABLE `blc_pgtmplt_fldgrp_xref` DISABLE KEYS */;
INSERT INTO `blc_pgtmplt_fldgrp_xref` VALUES (1,1,0),(2,1,0);
/*!40000 ALTER TABLE `blc_pgtmplt_fldgrp_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_phone`
--

DROP TABLE IF EXISTS `blc_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_phone` (
  `PHONE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  `IS_DEFAULT` tinyint(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_phone`
--

LOCK TABLES `blc_phone` WRITE;
/*!40000 ALTER TABLE `blc_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product`
--

DROP TABLE IF EXISTS `blc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` tinyint(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `IS_FEATURED_PRODUCT` tinyint(1) NOT NULL,
  `MANUFACTURE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `PRODUCT_URL_INDEX` (`URL`,`URL_KEY`),
  KEY `FK5B95B7C9DF057C3F` (`DEFAULT_CATEGORY_ID`),
  CONSTRAINT `FK5B95B7C9DF057C3F` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product`
--

LOCK TABLES `blc_product` WRITE;
/*!40000 ALTER TABLE `blc_product` DISABLE KEYS */;
INSERT INTO `blc_product` VALUES (1,NULL,NULL,NULL,1,'Blair\'s',NULL,NULL,'/hot-sauces/sudden_death_sauce',NULL,2002),(2,NULL,NULL,NULL,0,'Blair\'s',NULL,NULL,'/hot-sauces/sweet_death_sauce',NULL,2002),(3,NULL,NULL,NULL,0,'Salsa Express',NULL,NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002),(4,NULL,NULL,NULL,0,'Spice Exchange',NULL,NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002),(5,NULL,NULL,NULL,0,'Spice Exchange',NULL,NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002),(6,NULL,NULL,NULL,0,'Spice Exchange',NULL,NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002),(7,NULL,NULL,NULL,0,'Garden Row',NULL,NULL,'/hot-sauces/green_ghost',NULL,2002),(8,NULL,NULL,NULL,0,'D. L. Jardine\'s',NULL,NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002),(9,NULL,NULL,NULL,1,'Figueroa Brothers',NULL,NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002),(10,NULL,NULL,NULL,0,'Figueroa Brothers',NULL,NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002),(11,NULL,NULL,NULL,0,'Brazos Legends',NULL,NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002),(12,NULL,NULL,NULL,0,'Garden Row',NULL,NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002),(13,NULL,NULL,NULL,1,'Brazos Legends',NULL,NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002),(14,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002),(15,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002),(16,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002),(17,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/insanity_sauce',NULL,2002),(18,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002),(19,NULL,NULL,NULL,0,'Dave\'s Gourmet',NULL,NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002),(100,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003),(200,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003),(300,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003),(400,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003),(500,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003),(600,NULL,NULL,NULL,0,'The Heat Clinic',NULL,NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003),(992,'N',0,NULL,0,NULL,NULL,NULL,'/bundle1',NULL,NULL),(993,'N',0,NULL,0,NULL,NULL,NULL,'/bundle2',NULL,NULL);
/*!40000 ALTER TABLE `blc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_attribute`
--

DROP TABLE IF EXISTS `blc_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_attribute` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  KEY `FK56CE05865F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK56CE05865F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_attribute`
--

LOCK TABLES `blc_product_attribute` WRITE;
/*!40000 ALTER TABLE `blc_product_attribute` DISABLE KEYS */;
INSERT INTO `blc_product_attribute` VALUES (1,'heatRange',NULL,'4',1),(2,'heatRange',NULL,'1',2),(3,'heatRange',NULL,'2',3),(4,'heatRange',NULL,'2',4),(5,'heatRange',NULL,'4',5),(6,'heatRange',NULL,'4',6),(7,'heatRange',NULL,'3',7),(8,'heatRange',NULL,'4',8),(9,'heatRange',NULL,'5',9),(10,'heatRange',NULL,'5',10),(11,'heatRange',NULL,'2',11),(12,'heatRange',NULL,'1',12),(13,'heatRange',NULL,'2',13),(14,'heatRange',NULL,'2',14),(15,'heatRange',NULL,'1',15),(16,'heatRange',NULL,'3',16),(17,'heatRange',NULL,'5',17),(18,'heatRange',NULL,'3',18),(19,'heatRange',NULL,'1',19);
/*!40000 ALTER TABLE `blc_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_bundle`
--

DROP TABLE IF EXISTS `blc_product_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_bundle` (
  `AUTO_BUNDLE` tinyint(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` tinyint(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FK8CC5B85F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8CC5B85F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_bundle`
--

LOCK TABLES `blc_product_bundle` WRITE;
/*!40000 ALTER TABLE `blc_product_bundle` DISABLE KEYS */;
INSERT INTO `blc_product_bundle` VALUES (0,0,0,'ITEM_SUM',99,992),(0,0,0,'BUNDLE',99,993);
/*!40000 ALTER TABLE `blc_product_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_cross_sale`
--

DROP TABLE IF EXISTS `blc_product_cross_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_cross_sale` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C15D1A13D` (`CATEGORY_ID`),
  KEY `FK8324FB3C5F11A0B7` (`PRODUCT_ID`),
  KEY `FK8324FB3C62D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK8324FB3C5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C62D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_cross_sale`
--

LOCK TABLES `blc_product_cross_sale` WRITE;
/*!40000 ALTER TABLE `blc_product_cross_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_product_cross_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_featured`
--

DROP TABLE IF EXISTS `blc_product_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_featured` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `FK4C49FFE415D1A13D` (`CATEGORY_ID`),
  KEY `FK4C49FFE45F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK4C49FFE415D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FK4C49FFE45F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_featured`
--

LOCK TABLES `blc_product_featured` WRITE;
/*!40000 ALTER TABLE `blc_product_featured` DISABLE KEYS */;
INSERT INTO `blc_product_featured` VALUES (1,NULL,1,1,18),(2,NULL,2,1,15),(3,NULL,3,1,200),(4,NULL,4,1,100),(5,NULL,1,2003,4),(8,NULL,4,2002,500),(9,NULL,4,2002,200),(10,NULL,4,2002,300);
/*!40000 ALTER TABLE `blc_product_featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_option`
--

DROP TABLE IF EXISTS `blc_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_option` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ERROR_CODE` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALIDATION_TYPE` varchar(255) DEFAULT NULL,
  `REQUIRED` tinyint(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) DEFAULT NULL,
  `USE_IN_SKU_GENERATION` tinyint(1) DEFAULT NULL,
  `VALIDATION_STRING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_option`
--

LOCK TABLES `blc_product_option` WRITE;
/*!40000 ALTER TABLE `blc_product_option` DISABLE KEYS */;
INSERT INTO `blc_product_option` VALUES (1,'COLOR',NULL,NULL,NULL,'Shirt Color',NULL,1,'COLOR',NULL,NULL),(2,'SIZE',NULL,NULL,NULL,'Shirt Size',NULL,1,'SIZE',NULL,NULL),(3,'NAME',NULL,'INVALID_NAME','Name must be less than 30 characters, with only letters and spaces','Personalized Name','REGEX',0,'TEXT',0,'[a-zA-Z ]{3,30}');
/*!40000 ALTER TABLE `blc_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_option_value`
--

DROP TABLE IF EXISTS `blc_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_option_value` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK6DEEEDBD92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK6DEEEDBD92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_option_value`
--

LOCK TABLES `blc_product_option_value` WRITE;
/*!40000 ALTER TABLE `blc_product_option_value` DISABLE KEYS */;
INSERT INTO `blc_product_option_value` VALUES (1,'Black',1,NULL,1),(2,'Red',2,NULL,1),(3,'Silver',3,NULL,1),(11,'S',1,NULL,2),(12,'M',2,NULL,2),(13,'L',3,NULL,2),(14,'XL',4,NULL,2);
/*!40000 ALTER TABLE `blc_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_option_xref`
--

DROP TABLE IF EXISTS `blc_product_option_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_option_xref` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  KEY `FKDA42AB2F5F11A0B7` (`PRODUCT_ID`),
  KEY `FKDA42AB2F92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FKDA42AB2F5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `blc_product_option` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_option_xref`
--

LOCK TABLES `blc_product_option_xref` WRITE;
/*!40000 ALTER TABLE `blc_product_option_xref` DISABLE KEYS */;
INSERT INTO `blc_product_option_xref` VALUES (1,100),(1,200),(1,300),(1,400),(1,500),(1,600),(2,100),(2,200),(2,300),(2,400),(2,500),(2,600),(3,100);
/*!40000 ALTER TABLE `blc_product_option_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_sku_xref`
--

DROP TABLE IF EXISTS `blc_product_sku_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_sku_xref` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `FKF2DBF6D35F11A0B7` (`PRODUCT_ID`),
  KEY `FKF2DBF6D3B78C9977` (`SKU_ID`),
  CONSTRAINT `FKF2DBF6D35F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D3B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_sku_xref`
--

LOCK TABLES `blc_product_sku_xref` WRITE;
/*!40000 ALTER TABLE `blc_product_sku_xref` DISABLE KEYS */;
INSERT INTO `blc_product_sku_xref` VALUES (100,111),(100,112),(100,113),(100,114),(100,121),(100,122),(100,123),(100,124),(100,131),(100,132),(100,133),(100,134),(200,211),(200,212),(200,213),(200,214),(200,221),(200,222),(200,223),(200,224),(200,231),(200,232),(200,233),(200,234),(300,311),(300,312),(300,313),(300,314),(300,321),(300,322),(300,323),(300,324),(300,331),(300,332),(300,333),(300,334),(400,411),(400,412),(400,413),(400,414),(400,421),(400,422),(400,423),(400,424),(400,431),(400,432),(400,433),(400,434),(500,511),(500,512),(500,513),(500,514),(500,521),(500,522),(500,523),(500,524),(500,531),(500,532),(500,533),(500,534),(600,611),(600,612),(600,613),(600,614),(600,621),(600,622),(600,623),(600,624),(600,631),(600,632),(600,633),(600,634);
/*!40000 ALTER TABLE `blc_product_sku_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_product_up_sale`
--

DROP TABLE IF EXISTS `blc_product_up_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_product_up_sale` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FKF69054F515D1A13D` (`CATEGORY_ID`),
  KEY `FKF69054F55F11A0B7` (`PRODUCT_ID`),
  KEY `FKF69054F562D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FKF69054F515D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`),
  CONSTRAINT `FKF69054F55F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F562D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_product_up_sale`
--

LOCK TABLES `blc_product_up_sale` WRITE;
/*!40000 ALTER TABLE `blc_product_up_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_product_up_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_qual_crit_offer_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_offer_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_qual_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UKD592E919E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E919D5F3FAF4` (`OFFER_ID`),
  KEY `FKD592E9193615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E9193615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E919D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_qual_crit_offer_xref`
--

LOCK TABLES `blc_qual_crit_offer_xref` WRITE;
/*!40000 ALTER TABLE `blc_qual_crit_offer_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_offer_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_qual_crit_page_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_page_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_qual_crit_page_xref` (
  `PAGE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK874BE5902B6BC67F` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590883C2667` (`PAGE_ID`),
  KEY `FK874BE590378418CD` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK874BE590378418CD` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `blc_page_item_criteria` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK874BE590883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `blc_page` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_qual_crit_page_xref`
--

LOCK TABLES `blc_qual_crit_page_xref` WRITE;
/*!40000 ALTER TABLE `blc_qual_crit_page_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_page_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_qual_crit_sc_xref`
--

DROP TABLE IF EXISTS `blc_qual_crit_sc_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_qual_crit_sc_xref` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UKC4A353AFFF06F4DE` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF13D95585` (`SC_ID`),
  KEY `FKC4A353AF85C77F2B` (`SC_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKC4A353AF13D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKC4A353AF85C77F2B` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `blc_sc_item_criteria` (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_qual_crit_sc_xref`
--

LOCK TABLES `blc_qual_crit_sc_xref` WRITE;
/*!40000 ALTER TABLE `blc_qual_crit_sc_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_qual_crit_sc_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_rating_detail`
--

DROP TABLE IF EXISTS `blc_rating_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_rating_detail` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKC9D04AD7470F437` (`CUSTOMER_ID`),
  KEY `FKC9D04ADD4E76BF4` (`RATING_SUMMARY_ID`),
  CONSTRAINT `FKC9D04AD7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04ADD4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_rating_detail`
--

LOCK TABLES `blc_rating_detail` WRITE;
/*!40000 ALTER TABLE `blc_rating_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_rating_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_rating_summary`
--

DROP TABLE IF EXISTS `blc_rating_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_rating_summary` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `RATING_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_rating_summary`
--

LOCK TABLES `blc_rating_summary` WRITE;
/*!40000 ALTER TABLE `blc_rating_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_rating_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_review_detail`
--

DROP TABLE IF EXISTS `blc_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_review_detail` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) NOT NULL,
  `REVIEW_TEXT` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  KEY `FK9CD7E6927470F437` (`CUSTOMER_ID`),
  KEY `FK9CD7E69245DC39E0` (`RATING_DETAIL_ID`),
  KEY `FK9CD7E692D4E76BF4` (`RATING_SUMMARY_ID`),
  CONSTRAINT `FK9CD7E69245DC39E0` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `blc_rating_detail` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E6927470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK9CD7E692D4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `blc_rating_summary` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_review_detail`
--

LOCK TABLES `blc_review_detail` WRITE;
/*!40000 ALTER TABLE `blc_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_review_feedback`
--

DROP TABLE IF EXISTS `blc_review_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_review_feedback` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` tinyint(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC929867470F437` (`CUSTOMER_ID`),
  KEY `FK7CC92986AE4769D6` (`REVIEW_DETAIL_ID`),
  CONSTRAINT `FK7CC929867470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC92986AE4769D6` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `blc_review_detail` (`REVIEW_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_review_feedback`
--

LOCK TABLES `blc_review_feedback` WRITE;
/*!40000 ALTER TABLE `blc_review_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_review_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_role`
--

DROP TABLE IF EXISTS `blc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_role`
--

LOCK TABLES `blc_role` WRITE;
/*!40000 ALTER TABLE `blc_role` DISABLE KEYS */;
INSERT INTO `blc_role` VALUES (1,'ROLE_USER');
/*!40000 ALTER TABLE `blc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sandbox`
--

DROP TABLE IF EXISTS `blc_sandbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sandbox` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sandbox`
--

LOCK TABLES `blc_sandbox` WRITE;
/*!40000 ALTER TABLE `blc_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sandbox_action`
--

DROP TABLE IF EXISTS `blc_sandbox_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sandbox_action` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `ACTION_COMMENT` varchar(255) DEFAULT NULL,
  `ACTION_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sandbox_action`
--

LOCK TABLES `blc_sandbox_action` WRITE;
/*!40000 ALTER TABLE `blc_sandbox_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sandbox_item`
--

DROP TABLE IF EXISTS `blc_sandbox_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sandbox_item` (
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` char(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GRP_DESCRIPTION` varchar(255) DEFAULT NULL,
  `ORIGINAL_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `SANDBOX_OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `TEMPORARY_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ITEM_ID`),
  KEY `ARCHIVED_FLAG_INDEX` (`ARCHIVED_FLAG`),
  KEY `SB_ORIG_ITEM_ID_INDEX` (`ORIGINAL_ITEM_ID`),
  KEY `ORIG_SANDBOX_ID_INDEX` (`ORIG_SANDBOX_ID`),
  KEY `SANDBOX_ID_INDEX` (`SANDBOX_ID`),
  KEY `SANDBOX_ITEM_TYPE_INDEX` (`SANDBOX_ITEM_TYPE`),
  KEY `TEMP_ITEM_INDEX` (`TEMPORARY_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sandbox_item`
--

LOCK TABLES `blc_sandbox_item` WRITE;
/*!40000 ALTER TABLE `blc_sandbox_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc`
--

DROP TABLE IF EXISTS `blc_sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc` (
  `SC_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` tinyint(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT NULL,
  `LOCKED_FLAG` tinyint(1) DEFAULT NULL,
  `OFFLINE_FLAG` tinyint(1) DEFAULT NULL,
  `ORIG_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `LOCALE_CODE` varchar(255) NOT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `SC_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `SC_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `SC_ORIG_ITEM_ID_INDEX` (`ORIG_ITEM_ID`),
  KEY `CONTENT_PRIORITY_INDEX` (`PRIORITY`),
  KEY `FK74EEB716A1E1C128` (`LOCALE_CODE`),
  KEY `FK74EEB716F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK74EEB716579FE59D` (`SANDBOX_ID`),
  KEY `FK74EEB71671EBFA46` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB716579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FK74EEB71671EBFA46` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `blc_sc_type` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB716A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`),
  CONSTRAINT `FK74EEB716F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc`
--

LOCK TABLES `blc_sc` WRITE;
/*!40000 ALTER TABLE `blc_sc` DISABLE KEYS */;
INSERT INTO `blc_sc` VALUES (100,0,1,'2013-09-11 09:21:07','2013-09-11 09:21:07',1,'Buy One Get One - Twice the Burn',0,NULL,0,NULL,5,'en',NULL,NULL,1),(101,0,1,'2013-09-11 09:21:07','2013-09-11 09:21:07',1,'Shirt Special - 20% off all shirts',0,NULL,0,NULL,1,'en',NULL,NULL,1),(102,0,1,'2013-09-11 09:21:07','2013-09-11 09:21:07',1,'Member Special - $10 off next order over $50',0,NULL,0,NULL,5,'en',NULL,NULL,1),(110,0,1,'2013-09-11 09:21:07','2013-09-11 09:21:07',1,'Home Page Snippet - Aficionado',0,NULL,0,NULL,5,'en',NULL,NULL,2),(130,0,1,'2013-09-11 09:21:07','2013-09-11 09:21:07',1,'Home Page Featured Products Title',0,NULL,0,NULL,5,'en',NULL,NULL,3),(140,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'RHS - The Essentials Collection',0,NULL,0,NULL,5,'en',NULL,NULL,4),(151,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Promocion - 20% de descuento en todas las camisas',0,NULL,0,NULL,1,'es',NULL,NULL,1),(152,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Promocion - 20% de descuento en todas las camisas',0,NULL,0,NULL,1,'fr',NULL,NULL,1),(153,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Home Page Snippet (es) - Aficionado',0,NULL,0,NULL,5,'es',NULL,NULL,2),(154,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Home Page Snippet (es) - Aficionado',0,NULL,0,NULL,5,'fr',NULL,NULL,2),(155,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Home Page Featured Products Title',0,NULL,0,NULL,5,'es',NULL,NULL,3),(156,0,1,'2013-09-11 09:21:08','2013-09-11 09:21:08',1,'Home Page Featured Products Title',0,NULL,0,NULL,5,'fr',NULL,NULL,3);
/*!40000 ALTER TABLE `blc_sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_fld`
--

DROP TABLE IF EXISTS `blc_sc_fld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_fld` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `SC_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`),
  KEY `FK621D7B9513D95585` (`SC_ID`),
  CONSTRAINT `FK621D7B9513D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_fld`
--

LOCK TABLES `blc_sc_fld` WRITE;
/*!40000 ALTER TABLE `blc_sc_fld` DISABLE KEYS */;
INSERT INTO `blc_sc_fld` VALUES (1,1,'2013-09-11 09:21:07',NULL,NULL,'imageUrl',NULL,'/img/banners/buy-one-get-one-home-banner.jpg',100),(2,1,'2013-09-11 09:21:07',NULL,NULL,'targetUrl',NULL,'/hot-sauces',100),(3,1,'2013-09-11 09:21:07',NULL,NULL,'imageUrl',NULL,'/img/banners/shirt-special.jpg',101),(4,1,'2013-09-11 09:21:07',NULL,NULL,'targetUrl',NULL,'/merchandise',101),(5,1,'2013-09-11 09:21:07',NULL,NULL,'imageUrl',NULL,'/img/banners/member-special.jpg',102),(6,1,'2013-09-11 09:21:07',NULL,NULL,'targetUrl',NULL,'/register',102),(9,1,'2013-09-11 09:21:07',NULL,NULL,'htmlContent',NULL,'<h2>HOT SAUCE AFICIONADO?</h2> Click to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.',110),(11,1,'2013-09-11 09:21:07',NULL,NULL,'messageText',NULL,'The Heat Clinic\'s Top Selling Sauces',130),(12,1,'2013-09-11 09:21:08',NULL,NULL,'imageUrl',NULL,'/img/rhs-ad.jpg',140),(13,1,'2013-09-11 09:21:08',NULL,NULL,'targetUrl',NULL,'/hot-sauces',140),(51,1,'2013-09-11 09:21:08',NULL,NULL,'imageUrl',NULL,'/img/banners/promocion-camisas.jpg',151),(52,1,'2013-09-11 09:21:08',NULL,NULL,'targetUrl',NULL,'/merchandise',151),(53,1,'2013-09-11 09:21:08',NULL,NULL,'imageUrl',NULL,'/img/banners/shirts-speciale.jpg',152),(54,1,'2013-09-11 09:21:08',NULL,NULL,'targetUrl',NULL,'/merchandise',152),(55,1,'2013-09-11 09:21:08',NULL,NULL,'htmlContent',NULL,'<h2>AFICIONADO DE SALSAS PICANTES?</h2> Haga click para unirse a nuerto programa de Cuidades Intensivos de Heat Clinic. El lugar para conseguir las mejores ofertas.',153),(56,1,'2013-09-11 09:21:08',NULL,NULL,'htmlContent',NULL,'<h2>AFICIONADO SAUCE PIQUANTE?</h2> Cliquez ici pour vous joindre &agrave; notre clinique de chaleur du Programme de soins fr&eacute;quents. L&#39;endroit pour obtenir toutes les offres sur le traitement des br&ucirc;lures.',154),(57,1,'2013-09-11 09:21:08',NULL,NULL,'messageText',NULL,'Las Salsas M&aacute;s vendidas de Heat Clinic',155),(58,1,'2013-09-11 09:21:08',NULL,NULL,'messageText',NULL,'La Clinique Heat Sauces Meilleures Ventes',156);
/*!40000 ALTER TABLE `blc_sc_fld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_fld_map`
--

DROP TABLE IF EXISTS `blc_sc_fld_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_fld_map` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`SC_ID`,`MAP_KEY`),
  KEY `FKD9480192DD6FD28A` (`SC_FLD_ID`),
  KEY `FKD948019213D95585` (`SC_ID`),
  CONSTRAINT `FKD948019213D95585` FOREIGN KEY (`SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FKD9480192DD6FD28A` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `blc_sc_fld` (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_fld_map`
--

LOCK TABLES `blc_sc_fld_map` WRITE;
/*!40000 ALTER TABLE `blc_sc_fld_map` DISABLE KEYS */;
INSERT INTO `blc_sc_fld_map` VALUES (100,1,'imageUrl'),(100,2,'targetUrl'),(101,3,'imageUrl'),(101,4,'targetUrl'),(102,5,'imageUrl'),(102,6,'targetUrl'),(110,9,'htmlContent'),(130,11,'messageText'),(140,12,'imageUrl'),(140,13,'targetUrl'),(151,51,'imageUrl'),(151,52,'targetUrl'),(152,53,'imageUrl'),(152,54,'targetUrl'),(153,55,'htmlContent'),(154,56,'htmlContent'),(155,57,'messageText'),(156,58,'messageText');
/*!40000 ALTER TABLE `blc_sc_fld_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_fld_tmplt`
--

DROP TABLE IF EXISTS `blc_sc_fld_tmplt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_fld_tmplt` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_fld_tmplt`
--

LOCK TABLES `blc_sc_fld_tmplt` WRITE;
/*!40000 ALTER TABLE `blc_sc_fld_tmplt` DISABLE KEYS */;
INSERT INTO `blc_sc_fld_tmplt` VALUES (1,'Ad Template'),(2,'HTML Template'),(3,'Message Template');
/*!40000 ALTER TABLE `blc_sc_fld_tmplt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_fldgrp_xref`
--

DROP TABLE IF EXISTS `blc_sc_fldgrp_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_fldgrp_xref` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK71612AEA6A79BDB5` (`FLD_GROUP_ID`),
  KEY `FK71612AEAF6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FK71612AEA6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `blc_fld_group` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEAF6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_fldgrp_xref`
--

LOCK TABLES `blc_sc_fldgrp_xref` WRITE;
/*!40000 ALTER TABLE `blc_sc_fldgrp_xref` DISABLE KEYS */;
INSERT INTO `blc_sc_fldgrp_xref` VALUES (1,4,0),(2,5,0),(3,6,0);
/*!40000 ALTER TABLE `blc_sc_fldgrp_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_item_criteria`
--

DROP TABLE IF EXISTS `blc_sc_item_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_item_criteria` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_item_criteria`
--

LOCK TABLES `blc_sc_item_criteria` WRITE;
/*!40000 ALTER TABLE `blc_sc_item_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_item_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_rule`
--

DROP TABLE IF EXISTS `blc_sc_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_rule` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_rule`
--

LOCK TABLES `blc_sc_rule` WRITE;
/*!40000 ALTER TABLE `blc_sc_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_rule_map`
--

DROP TABLE IF EXISTS `blc_sc_rule_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_rule_map` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK169F1C8256E51A06` (`SC_RULE_ID`),
  KEY `FK169F1C82156E72FC` (`BLC_SC_SC_ID`),
  CONSTRAINT `FK169F1C82156E72FC` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `blc_sc` (`SC_ID`),
  CONSTRAINT `FK169F1C8256E51A06` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `blc_sc_rule` (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_rule_map`
--

LOCK TABLES `blc_sc_rule_map` WRITE;
/*!40000 ALTER TABLE `blc_sc_rule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sc_rule_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sc_type`
--

DROP TABLE IF EXISTS `blc_sc_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sc_type` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `SC_TYPE_NAME_INDEX` (`NAME`),
  KEY `FKE19886C3F6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKE19886C3F6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `blc_sc_fld_tmplt` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sc_type`
--

LOCK TABLES `blc_sc_type` WRITE;
/*!40000 ALTER TABLE `blc_sc_type` DISABLE KEYS */;
INSERT INTO `blc_sc_type` VALUES (1,NULL,'Homepage Banner Ad',1),(2,NULL,'Homepage Middle Promo Snippet',2),(3,NULL,'Homepage Featured Products Title',3),(4,NULL,'Right Hand Side Banner Ad',1);
/*!40000 ALTER TABLE `blc_sc_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_facet`
--

DROP TABLE IF EXISTS `blc_search_facet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_facet` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` tinyint(1) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` tinyint(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` tinyint(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FK4FFCC9863C3907C4` (`FIELD_ID`),
  CONSTRAINT `FK4FFCC9863C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `blc_field` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_facet`
--

LOCK TABLES `blc_search_facet` WRITE;
/*!40000 ALTER TABLE `blc_search_facet` DISABLE KEYS */;
INSERT INTO `blc_search_facet` VALUES (1,1,'Manufacturer',NULL,0,0,1),(2,1,'Heat Range',NULL,0,0,2),(3,1,'Price',NULL,1,1,3);
/*!40000 ALTER TABLE `blc_search_facet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_facet_range`
--

DROP TABLE IF EXISTS `blc_search_facet_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_facet_range` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  KEY `FK7EC3B124B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK7EC3B124B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_facet_range`
--

LOCK TABLES `blc_search_facet_range` WRITE;
/*!40000 ALTER TABLE `blc_search_facet_range` DISABLE KEYS */;
INSERT INTO `blc_search_facet_range` VALUES (1,5.00000,0.00000,3),(2,10.00000,5.00000,3),(3,15.00000,10.00000,3),(4,NULL,15.00000,3);
/*!40000 ALTER TABLE `blc_search_facet_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_facet_xref`
--

DROP TABLE IF EXISTS `blc_search_facet_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_facet_xref` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK35A63034DA7E1C7C` (`REQUIRED_FACET_ID`),
  KEY `FK35A63034B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034DA7E1C7C` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `blc_search_facet` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_facet_xref`
--

LOCK TABLES `blc_search_facet_xref` WRITE;
/*!40000 ALTER TABLE `blc_search_facet_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_search_facet_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_intercept`
--

DROP TABLE IF EXISTS `blc_search_intercept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_intercept` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SEARCH_PRIORITY_INDEX` (`PRIORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_intercept`
--

LOCK TABLES `blc_search_intercept` WRITE;
/*!40000 ALTER TABLE `blc_search_intercept` DISABLE KEYS */;
INSERT INTO `blc_search_intercept` VALUES (1,NULL,NULL,1,'insanity','/hot-sauces/insanity_sauce'),(2,'1999-10-15 21:28:36','1992-10-15 14:28:36',-10,'new york','/search?q=pace picante');
/*!40000 ALTER TABLE `blc_search_intercept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_synonym`
--

DROP TABLE IF EXISTS `blc_search_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_synonym` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) DEFAULT NULL,
  `TERM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_synonym`
--

LOCK TABLES `blc_search_synonym` WRITE;
/*!40000 ALTER TABLE `blc_search_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_search_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_shipping_rate`
--

DROP TABLE IF EXISTS `blc_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_shipping_rate` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) DEFAULT NULL,
  `FEE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_shipping_rate`
--

LOCK TABLES `blc_shipping_rate` WRITE;
/*!40000 ALTER TABLE `blc_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_site`
--

DROP TABLE IF EXISTS `blc_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_site` (
  `SITE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DEACTIVATED` tinyint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  `PRODUCTION_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `BLC_SITE_ID_VAL_INDEX` (`SITE_IDENTIFIER_VALUE`),
  KEY `FKF41D6A8D64EBCCE3` (`PRODUCTION_SANDBOX_ID`),
  CONSTRAINT `FKF41D6A8D64EBCCE3` FOREIGN KEY (`PRODUCTION_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_site`
--

LOCK TABLES `blc_site` WRITE;
/*!40000 ALTER TABLE `blc_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_site_catalog`
--

DROP TABLE IF EXISTS `blc_site_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_site_catalog` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `SITE_ID` bigint(20) NOT NULL,
  KEY `FK5F3F2047843A8B63` (`SITE_ID`),
  KEY `FK5F3F2047A350C7F1` (`CATALOG_ID`),
  CONSTRAINT `FK5F3F2047843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `blc_site` (`SITE_ID`),
  CONSTRAINT `FK5F3F2047A350C7F1` FOREIGN KEY (`CATALOG_ID`) REFERENCES `blc_catalog` (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_site_catalog`
--

LOCK TABLES `blc_site_catalog` WRITE;
/*!40000 ALTER TABLE `blc_site_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_site_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_site_sandbox`
--

DROP TABLE IF EXISTS `blc_site_sandbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_site_sandbox` (
  `SITE_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `FKAD4F7EF5843A8B63` (`SITE_ID`),
  KEY `FKAD4F7EF5579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FKAD4F7EF5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FKAD4F7EF5843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `blc_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_site_sandbox`
--

LOCK TABLES `blc_site_sandbox` WRITE;
/*!40000 ALTER TABLE `blc_site_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_site_sandbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku`
--

DROP TABLE IF EXISTS `blc_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `IS_MACHINE_SORTABLE` tinyint(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE_FLAG` char(1) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `FK28E82CF73E2FC4F9` (`CURRENCY_CODE`),
  KEY `FK28E82CF77E555D75` (`DEFAULT_PRODUCT_ID`),
  CONSTRAINT `FK28E82CF73E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FK28E82CF77E555D75` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `blc_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku`
--

LOCK TABLES `blc_sku` WRITE;
/*!40000 ALTER TABLE `blc_sku` DISABLE KEYS */;
INSERT INTO `blc_sku` VALUES (1,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'BASIC',NULL,'As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ','Sudden Death Sauce',10.99000,NULL,NULL,'Y',NULL,NULL,NULL,1),(2,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'BASIC',NULL,'The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.','Sweet Death Sauce',10.99000,NULL,NULL,'Y',NULL,NULL,NULL,2),(3,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.','Hoppin\' Hot Sauce',4.99000,NULL,NULL,'Y',NULL,NULL,NULL,3),(4,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.','Day of the Dead Chipotle Hot Sauce',6.99000,NULL,NULL,'Y',NULL,NULL,NULL,4),(5,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero\'s bold heat, unique flavor and aroma has made it the favorite of chile lovers.','Day of the Dead Habanero Hot Sauce',6.99000,NULL,NULL,'Y',NULL,NULL,NULL,5),(6,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.','Day of the Dead Scotch Bonnet Hot Sauce',6.99000,NULL,NULL,'Y',NULL,NULL,NULL,6),(7,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Made with Naga Bhut Jolokia, the World\'s Hottest pepper.','Green Ghost',11.99000,NULL,NULL,'Y',NULL,NULL,NULL,7),(8,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you\'ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habanero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.','Blazin\' Saddle XXX Hot Habanero Pepper Sauce',4.99000,NULL,NULL,'Y',NULL,NULL,NULL,8),(9,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'All Hell is breaking loose, fire &amp; brimstone rain down? prepare to meet your maker.','Armageddon The Hot Sauce To End All',12.99000,NULL,NULL,'Y',NULL,NULL,NULL,9),(10,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister\'s sick and evil deadly brew should be used with caution. Pain can become addictive!','Dr. Chilemeister\'s Insane Hot Sauce',12.99000,NULL,NULL,'Y',NULL,NULL,NULL,10),(11,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Been there, roped that. Hotter than a buckin\' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.','Bull Snort Cowboy Cayenne Pepper Hot Sauce',3.99000,NULL,NULL,'Y',NULL,NULL,NULL,11),(12,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it\'s updated blackening version. It\'s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!','Cafe Louisiane Sweet Cajun Blackening Sauce',4.99000,NULL,NULL,'Y',NULL,NULL,NULL,12),(13,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Everything is bigger in Texas, even the burn of a Bull Snortin\' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin\' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it\'s famous flavor and red hot heat. Bull Snort Smokin\' Tonsils Hot Sauce\'ll have your bowels buckin\' with just a drop!','Bull Snort Smokin\' Toncils Hot Sauce',3.99000,NULL,NULL,'Y',NULL,NULL,NULL,13),(14,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Cool Cayenne Pepper Hot Sauce',5.99000,NULL,NULL,'Y',NULL,NULL,NULL,14),(15,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Garlic Hot Sauce',5.99000,NULL,NULL,'Y',NULL,NULL,NULL,15),(16,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Scotch Bonnet Hot Sauce',5.99000,NULL,NULL,'Y',NULL,NULL,NULL,16),(17,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Insanity Sauce',5.99000,4.99000,NULL,'Y',NULL,NULL,NULL,17),(18,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Hurtin\' Jalepeno Hot Sauce',5.99000,4.49000,NULL,'Y',NULL,NULL,NULL,18),(19,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Red Pepper & Chipotle Hot Sauce',5.99000,4.09000,NULL,'Y',NULL,NULL,NULL,19),(100,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',14.99000,NULL,NULL,'Y',NULL,NULL,NULL,100),(111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',14.99000,NULL,NULL,'Y',NULL,NULL,NULL,200),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',15.99000,NULL,NULL,'Y',NULL,NULL,NULL,300),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(400,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',15.99000,NULL,NULL,'Y',NULL,NULL,NULL,400),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(500,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',15.99000,NULL,NULL,'Y',NULL,NULL,NULL,500),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(600,NULL,'2013-09-11 09:21:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',15.99000,NULL,NULL,'Y',NULL,NULL,NULL,600),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9992,'2099-04-05 00:00:00','2001-02-24 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'bundle1',13.00000,3.00000,NULL,NULL,NULL,NULL,NULL,992),(9993,'2099-01-06 00:00:00','2001-02-24 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'bundle2',12.00000,2.00000,NULL,NULL,NULL,NULL,NULL,993);
/*!40000 ALTER TABLE `blc_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_attribute`
--

DROP TABLE IF EXISTS `blc_sku_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_attribute` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  KEY `FK6C6A5934B78C9977` (`SKU_ID`),
  CONSTRAINT `FK6C6A5934B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_attribute`
--

LOCK TABLES `blc_sku_attribute` WRITE;
/*!40000 ALTER TABLE `blc_sku_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_availability`
--

DROP TABLE IF EXISTS `blc_sku_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_availability` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_availability`
--

LOCK TABLES `blc_sku_availability` WRITE;
/*!40000 ALTER TABLE `blc_sku_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_bundle_item`
--

DROP TABLE IF EXISTS `blc_sku_bundle_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_bundle_item` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKD55968CCF29B96` (`PRODUCT_BUNDLE_ID`),
  KEY `FKD55968B78C9977` (`SKU_ID`),
  CONSTRAINT `FKD55968B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD55968CCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `blc_product_bundle` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_bundle_item`
--

LOCK TABLES `blc_sku_bundle_item` WRITE;
/*!40000 ALTER TABLE `blc_sku_bundle_item` DISABLE KEYS */;
INSERT INTO `blc_sku_bundle_item` VALUES (92,NULL,1,992,1),(93,NULL,1,992,2),(94,NULL,1,993,1),(95,NULL,1,993,2);
/*!40000 ALTER TABLE `blc_sku_bundle_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_fee`
--

DROP TABLE IF EXISTS `blc_sku_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_fee` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXPRESSION` longtext,
  `FEE_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TAXABLE` tinyint(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`),
  KEY `FKEEB7181E3E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FKEEB7181E3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_fee`
--

LOCK TABLES `blc_sku_fee` WRITE;
/*!40000 ALTER TABLE `blc_sku_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_fee_xref`
--

DROP TABLE IF EXISTS `blc_sku_fee_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_fee_xref` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FKD88D409CB78C9977` (`SKU_ID`),
  KEY `FKD88D409CCF4C9A82` (`SKU_FEE_ID`),
  CONSTRAINT `FKD88D409CB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`),
  CONSTRAINT `FKD88D409CCF4C9A82` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `blc_sku_fee` (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_fee_xref`
--

LOCK TABLES `blc_sku_fee_xref` WRITE;
/*!40000 ALTER TABLE `blc_sku_fee_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fee_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_fulfillment_excluded`
--

DROP TABLE IF EXISTS `blc_sku_fulfillment_excluded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_fulfillment_excluded` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FK84162D7381F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FK84162D73B78C9977` (`SKU_ID`),
  CONSTRAINT `FK84162D7381F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D73B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_fulfillment_excluded`
--

LOCK TABLES `blc_sku_fulfillment_excluded` WRITE;
/*!40000 ALTER TABLE `blc_sku_fulfillment_excluded` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fulfillment_excluded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_fulfillment_flat_rates`
--

DROP TABLE IF EXISTS `blc_sku_fulfillment_flat_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_fulfillment_flat_rates` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C9681F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C96B78C9977` (`SKU_ID`),
  CONSTRAINT `FKC1988C9681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `blc_fulfillment_option` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C96B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_fulfillment_flat_rates`
--

LOCK TABLES `blc_sku_fulfillment_flat_rates` WRITE;
/*!40000 ALTER TABLE `blc_sku_fulfillment_flat_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_fulfillment_flat_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_media_map`
--

DROP TABLE IF EXISTS `blc_sku_media_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_media_map` (
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SKU_SKU_ID`,`MAP_KEY`),
  KEY `FKEB4AECF96E4720E0` (`MEDIA_ID`),
  KEY `FKEB4AECF9D93D857F` (`BLC_SKU_SKU_ID`),
  CONSTRAINT `FKEB4AECF96E4720E0` FOREIGN KEY (`MEDIA_ID`) REFERENCES `blc_media` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF9D93D857F` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_media_map`
--

LOCK TABLES `blc_sku_media_map` WRITE;
/*!40000 ALTER TABLE `blc_sku_media_map` DISABLE KEYS */;
INSERT INTO `blc_sku_media_map` VALUES (1,101,'primary'),(1,102,'alt1'),(2,201,'primary'),(2,202,'alt1'),(2,203,'alt2'),(2,204,'alt3'),(2,205,'alt4'),(2,206,'alt5'),(3,301,'primary'),(3,302,'alt1'),(4,401,'primary'),(4,402,'alt1'),(5,501,'primary'),(5,502,'alt1'),(6,601,'primary'),(6,602,'alt1'),(7,701,'primary'),(7,702,'alt1'),(8,801,'primary'),(8,802,'alt1'),(9,901,'primary'),(9,902,'alt1'),(10,1001,'primary'),(10,1002,'alt1'),(11,1101,'primary'),(11,1102,'alt1'),(12,1201,'primary'),(12,1202,'alt1'),(13,1301,'primary'),(13,1302,'alt1'),(14,1401,'primary'),(14,1402,'alt1'),(15,1501,'primary'),(15,1502,'alt1'),(16,1601,'primary'),(16,1602,'alt1'),(17,1701,'primary'),(17,1702,'alt1'),(18,1801,'primary'),(18,1802,'alt1'),(19,1901,'primary'),(19,1902,'alt1'),(100,10001,'primary'),(100,10002,'alt1'),(100,10003,'alt2'),(200,20001,'alt1'),(200,20002,'primary'),(200,20003,'alt2'),(300,30001,'alt1'),(300,30002,'alt2'),(300,30003,'primary'),(400,40001,'alt1'),(400,40002,'primary'),(400,40003,'alt2'),(500,50001,'alt1'),(500,50002,'alt2'),(500,50003,'primary'),(600,60001,'primary'),(600,60002,'alt1'),(600,60003,'alt2');
/*!40000 ALTER TABLE `blc_sku_media_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_option_value_xref`
--

DROP TABLE IF EXISTS `blc_sku_option_value_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_option_value_xref` (
  `SKU_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  KEY `FK7B61DC0BB0C16A73` (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK7B61DC0BB78C9977` (`SKU_ID`),
  CONSTRAINT `FK7B61DC0BB0C16A73` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `blc_product_option_value` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `blc_sku` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_option_value_xref`
--

LOCK TABLES `blc_sku_option_value_xref` WRITE;
/*!40000 ALTER TABLE `blc_sku_option_value_xref` DISABLE KEYS */;
INSERT INTO `blc_sku_option_value_xref` VALUES (111,1),(111,11),(112,1),(112,12),(113,1),(113,13),(114,1),(114,14),(121,2),(121,11),(122,2),(122,12),(123,2),(123,13),(124,2),(124,14),(131,3),(131,11),(132,3),(132,12),(133,3),(133,13),(134,3),(134,14),(211,1),(211,11),(212,1),(212,12),(213,1),(213,13),(214,1),(214,14),(221,2),(221,11),(222,2),(222,12),(223,2),(223,13),(224,2),(224,14),(231,3),(231,11),(232,3),(232,12),(233,3),(233,13),(234,3),(234,14),(311,1),(311,11),(312,1),(312,12),(313,1),(313,13),(314,1),(314,14),(321,2),(321,11),(322,2),(322,12),(323,2),(323,13),(324,2),(324,14),(331,3),(331,11),(332,3),(332,12),(333,3),(333,13),(334,3),(334,14),(411,1),(411,11),(412,1),(412,12),(413,1),(413,13),(414,1),(414,14),(421,2),(421,11),(422,2),(422,12),(423,2),(423,13),(424,2),(424,14),(431,3),(431,11),(432,3),(432,12),(433,3),(433,13),(434,3),(434,14),(511,1),(511,11),(512,1),(512,12),(513,1),(513,13),(514,1),(514,14),(521,2),(521,11),(522,2),(522,12),(523,2),(523,13),(524,2),(524,14),(531,3),(531,11),(532,3),(532,12),(533,3),(533,13),(534,3),(534,14),(611,1),(611,11),(612,1),(612,12),(613,1),(613,13),(614,1),(614,14),(621,2),(621,11),(622,2),(622,12),(623,2),(623,13),(624,2),(624,14),(631,3),(631,11),(632,3),(632,12),(633,3),(633,13),(634,3),(634,14);
/*!40000 ALTER TABLE `blc_sku_option_value_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_state`
--

DROP TABLE IF EXISTS `blc_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_state` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FK8F94A1EBA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK8F94A1EBA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `blc_country` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_state`
--

LOCK TABLES `blc_state` WRITE;
/*!40000 ALTER TABLE `blc_state` DISABLE KEYS */;
INSERT INTO `blc_state` VALUES ('AK','ALASKA','US'),('AL','ALABAMA','US'),('AR','ARKANSAS','US'),('AS','AMERICAN SAMOA','US'),('AZ','ARIZONA','US'),('CA','CALIFORNIA','US'),('CO','COLORADO','US'),('CT','CONNECTICUT','US'),('DC','DISTRICT OF COLUMBIA','US'),('DE','DELAWARE','US'),('FL','FLORIDA','US'),('FM','FEDERATED STATES OF MICRONESIA','US'),('GA','GEORGIA','US'),('GU','GUAM','US'),('HI','HAWAII','US'),('IA','IOWA','US'),('ID','IDAHO','US'),('IL','ILLINOIS','US'),('IN','INDIANA','US'),('KS','KANSAS','US'),('KY','KENTUCKY','US'),('LA','LOUISIANA','US'),('MA','MASSACHUSETTS','US'),('MD','MARYLAND','US'),('ME','MAINE','US'),('MH','MARSHALL ISLANDS','US'),('MI','MICHIGAN','US'),('MN','MINNESOTA','US'),('MO','MISSOURI','US'),('MP','NORTHERN MARIANA ISLANDS','US'),('MS','MISSISSIPPI','US'),('MT','MONTANA','US'),('NC','NORTH CAROLINA','US'),('ND','NORTH DAKOTA','US'),('NE','NEBRASKA','US'),('NH','NEW HAMPSHIRE','US'),('NJ','NEW JERSEY','US'),('NM','NEW MEXICO','US'),('NV','NEVADA','US'),('NY','NEW YORK','US'),('OH','OHIO','US'),('OK','OKLAHOMA','US'),('OR','OREGON','US'),('PA','PENNSYLVANIA','US'),('PR','PUERTO RICO','US'),('PW','PALAU','US'),('RI','RHODE ISLAND','US'),('SC','SOUTH CAROLINA','US'),('SD','SOUTH DAKOTA','US'),('TN','TENNESSEE','US'),('TX','TEXAS','US'),('UT','UTAH','US'),('VA','VIRGINIA','US'),('VI','VIRGIN ISLANDS','US'),('VT','VERMONT','US'),('WA','WASHINGTON','US'),('WI','WISCONSIN','US'),('WV','WEST VIRGINIA','US'),('WY','WYOMING','US');
/*!40000 ALTER TABLE `blc_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_static_asset`
--

DROP TABLE IF EXISTS `blc_static_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_static_asset` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `ARCHIVED_FLAG` tinyint(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DELETED_FLAG` tinyint(1) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) NOT NULL,
  `LOCKED_FLAG` tinyint(1) DEFAULT NULL,
  `MIME_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ORIG_ASSET_ID` bigint(20) DEFAULT NULL,
  `STORAGE_TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ASST_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `ASST_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`),
  KEY `ASST_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `ORIG_ASSET_ID_INDX` (`ORIG_ASSET_ID`),
  KEY `FK9875FB05F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK9875FB05579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FK9875FB05579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`),
  CONSTRAINT `FK9875FB05F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `blc_sandbox` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_static_asset`
--

LOCK TABLES `blc_static_asset` WRITE;
/*!40000 ALTER TABLE `blc_static_asset` DISABLE KEYS */;
INSERT INTO `blc_static_asset` VALUES (101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Bottle.jpg',NULL,'image/jpg','Sudden Death Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Close.jpg',NULL,'image/jpg','Sudden Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Bottle.jpg',NULL,'image/jpg','Sweet Death Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Close.jpg',NULL,'image/jpg','Sweet Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(203,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Skull.jpg',NULL,'image/jpg','Sweet Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(204,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Tile.jpg',NULL,'image/jpg','Sweet Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(205,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Grass.jpg',NULL,'image/jpg','Sweet Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(206,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Logo.jpg',NULL,'image/jpg','Sweet Death Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Hoppin Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Close.jpg',NULL,'image/jpg','Hoppin Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Day of the Dead Chipotle Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg',NULL,'image/jpg','Day of the Dead Chipotle Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(501,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Day of the Dead Habanero Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(502,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg',NULL,'image/jpg','Day of the Dead Habanero Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(602,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg',NULL,'image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(701,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Bottle.jpg',NULL,'image/jpg','Green Ghost Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(702,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Close.jpg',NULL,'image/jpg','Green Ghost Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(801,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg',NULL,'image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(802,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg',NULL,'image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(901,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg',NULL,'image/jpg','Armageddon The Hot Sauce To End All Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(902,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg',NULL,'image/jpg','Armageddon The Hot Sauce To End All Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Dr. Chilemeisters Insane Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg',NULL,'image/jpg','Dr. Chilemeisters Insane Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg',NULL,'image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1201,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg',NULL,'image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1202,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg',NULL,'image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Bull Snort Smokin Toncils Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1302,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg',NULL,'image/jpg','Bull Snort Smokin Toncils Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Cool Cayenne Pepper Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1402,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg',NULL,'image/jpg','Cool Cayenne Pepper Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1501,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Roasted Garlic Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1502,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg',NULL,'image/jpg','Roasted Garlic Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Scotch Bonnet Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1602,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg',NULL,'image/jpg','Scotch Bonnet Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1701,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Bottle.jpg',NULL,'image/jpg','Insanity Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1702,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Close.jpg',NULL,'image/jpg','Insanity Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1801,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Hurtin Jalepeno Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1802,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg',NULL,'image/jpg','Hurtin Jalepeno Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(1901,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg',NULL,'image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle',NULL,'FILESYSTEM',NULL,NULL,NULL),(1902,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg',NULL,'image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up',NULL,'FILESYSTEM',NULL,NULL,NULL),(10001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_black.jpg',NULL,'image/jpg','Hawt Like a Habanero Men\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(10002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_red.jpg',NULL,'image/jpg','Hawt Like a Habanero Men\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(10003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_mens_silver.jpg',NULL,'image/jpg','Hawt Like a Habanero Men\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL),(20001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_black.jpg',NULL,'image/jpg','Hawt Like a Habanero Women\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(20002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_red.jpg',NULL,'image/jpg','Hawt Like a Habanero Women\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(20003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/habanero_womens_silver.jpg',NULL,'image/jpg','Hawt Like a Habanero Women\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL),(30001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_black.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Men\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(30002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_red.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Men\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(30003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_silver.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Men\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL),(40001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_black.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Women\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(40002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_red.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Women\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(40003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_silver.jpg',NULL,'image/jpg','Heat Clinic Hand-Drawn Women\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL),(50001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_black.jpg',NULL,'image/jpg','Heat Clinic Mascot Men\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(50002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_red.jpg',NULL,'image/jpg','Heat Clinic Mascot Men\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(50003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_silver.jpg',NULL,'image/jpg','Heat Clinic Mascot Men\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL),(60001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_black.jpg',NULL,'image/jpg','Heat Clinic Mascot Women\'s Black',NULL,'FILESYSTEM',NULL,NULL,NULL),(60002,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_red.jpg',NULL,'image/jpg','Heat Clinic Mascot Women\'s Red',NULL,'FILESYSTEM',NULL,NULL,NULL),(60003,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_silver.jpg',NULL,'image/jpg','Heat Clinic Mascot Women\'s Silver',NULL,'FILESYSTEM',NULL,NULL,NULL);
/*!40000 ALTER TABLE `blc_static_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_static_asset_desc`
--

DROP TABLE IF EXISTS `blc_static_asset_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_static_asset_desc` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_static_asset_desc`
--

LOCK TABLES `blc_static_asset_desc` WRITE;
/*!40000 ALTER TABLE `blc_static_asset_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_static_asset_strg`
--

DROP TABLE IF EXISTS `blc_static_asset_strg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_static_asset_strg` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_static_asset_strg`
--

LOCK TABLES `blc_static_asset_strg` WRITE;
/*!40000 ALTER TABLE `blc_static_asset_strg` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset_strg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_store`
--

DROP TABLE IF EXISTS `blc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_store` (
  `STORE_ID` varchar(255) NOT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(255) DEFAULT NULL,
  `STORE_COUNTRY` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) DEFAULT NULL,
  `STORE_PHONE` varchar(255) DEFAULT NULL,
  `STORE_STATE` varchar(255) DEFAULT NULL,
  `STORE_ZIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`),
  KEY `STORE_CITY_INDEX` (`STORE_CITY`),
  KEY `STORE_COUNTRY_INDEX` (`STORE_COUNTRY`),
  KEY `STORE_LATITUDE_INDEX` (`LATITUDE`),
  KEY `STORE_LONGITUDE_INDEX` (`LONGITUDE`),
  KEY `STORE_NAME_INDEX` (`STORE_NAME`),
  KEY `STORE_STATE_INDEX` (`STORE_STATE`),
  KEY `STORE_ZIP_INDEX` (`STORE_ZIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_store`
--

LOCK TABLES `blc_store` WRITE;
/*!40000 ALTER TABLE `blc_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_system_property`
--

DROP TABLE IF EXISTS `blc_system_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_system_property` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`),
  UNIQUE KEY `PROPERTY_NAME_` (`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_system_property`
--

LOCK TABLES `blc_system_property` WRITE;
/*!40000 ALTER TABLE `blc_system_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_system_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_tar_crit_offer_xref`
--

DROP TABLE IF EXISTS `blc_tar_crit_offer_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_tar_crit_offer_xref` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK125F5803E7AB0252` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F58033615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F5803D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK125F58033615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `blc_offer_item_criteria` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F5803D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `blc_offer` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_tar_crit_offer_xref`
--

LOCK TABLES `blc_tar_crit_offer_xref` WRITE;
/*!40000 ALTER TABLE `blc_tar_crit_offer_xref` DISABLE KEYS */;
INSERT INTO `blc_tar_crit_offer_xref` VALUES (1,1);
/*!40000 ALTER TABLE `blc_tar_crit_offer_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_tax_detail`
--

DROP TABLE IF EXISTS `blc_tax_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_tax_detail` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `TAX_COUNTRY` varchar(255) DEFAULT NULL,
  `JURISDICTION_NAME` varchar(255) DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TAX_REGION` varchar(255) DEFAULT NULL,
  `TAX_NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`),
  KEY `FKEABE4A4B3E2FC4F9` (`CURRENCY_CODE`),
  KEY `FKEABE4A4BC50D449` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FKEABE4A4B3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `blc_currency` (`CURRENCY_CODE`),
  CONSTRAINT `FKEABE4A4BC50D449` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `blc_module_configuration` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_tax_detail`
--

LOCK TABLES `blc_tax_detail` WRITE;
/*!40000 ALTER TABLE `blc_tax_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_tax_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_translation`
--

DROP TABLE IF EXISTS `blc_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_translation` (
  `TRANSLATION_ID` bigint(20) NOT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  `TRANSLATED_VALUE` longtext,
  PRIMARY KEY (`TRANSLATION_ID`),
  KEY `ENTITY_TYPE_INDEX` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_translation`
--

LOCK TABLES `blc_translation` WRITE;
/*!40000 ALTER TABLE `blc_translation` DISABLE KEYS */;
INSERT INTO `blc_translation` VALUES (-396,'3','FulfillmentOption','longDescription','fr','1 - 2 Journ&eacute;es'),(-395,'3','FulfillmentOption','name','fr','Express'),(-394,'2','FulfillmentOption','longDescription','fr','3 - 5 Journ&eacute;es'),(-393,'2','FulfillmentOption','name','fr','Priorit&eacute;'),(-392,'1','FulfillmentOption','longDescription','fr','5 - 7 Journ&eacute;es'),(-391,'1','FulfillmentOption','name','fr','Norme'),(-382,'3','SearchFacet','label','fr','Prix'),(-381,'2','SearchFacet','label','fr','Degr&eacute; de chaleur'),(-380,'1','SearchFacet','label','fr','Fabricant'),(-300,'600','Sku','longDescription','fr','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd\'hui!'),(-299,'600','Sku','name','fr','Mascot Clinique chaleur (Femmes)'),(-298,'500','Sku','longDescription','fr','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd\'hui!'),(-297,'500','Sku','name','fr','Mascot Clinique chaleur (Hommes)'),(-296,'400','Sku','longDescription','fr','Ce t-shirt logo dessin&eacute; &agrave; la main pour les femmes dispose d\'une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.'),(-295,'400','Sku','name','fr','Clinique de chaleur tir&eacute; par la main (Femmes)'),(-294,'300','Sku','longDescription','fr','Ce t-shirt logo dessin&eacute; &agrave; la main pour les hommes dispose d\'une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.'),(-293,'300','Sku','name','fr','Clinique de chaleur tir&eacute; par la main (Hommes)'),(-292,'200','Sku','longDescription','fr','Collecte de femmes Habanero standards chemise &agrave; manches courtes shirt s&eacute;rigraphi&eacute; &agrave; 30 coton doux singles en coupe regular.'),(-291,'200','Sku','name','fr','Hawt comme une chemise Habanero (Femmes)'),(-290,'100','Sku','longDescription','fr','Collecte Hommes Habanero standards chemise &agrave; manches courtes t s&eacute;rigraphi&eacute;es en 30 coton doux singles en coupe regular.'),(-289,'100','Sku','name','fr','Hawt comme une chemise Habanero (Hommes)'),(-288,'19','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-287,'19','Sku','name','fr','Sauce chaudes Chipotle'),(-286,'18','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-285,'18','Sku','name','fr','Sauces chaudes Jalapeno'),(-284,'17','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-283,'17','Sku','name','fr','Sauce Scotch Bonnet chaud'),(-282,'16','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-281,'16','Sku','name','fr','Sauce Scotch Bonnet chaud'),(-280,'15','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-279,'15','Sku','name','fr','Sauce &agrave; l\'ail rÃ´ti chaud'),(-278,'14','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.'),(-277,'14','Sku','name','fr','Frais Poivre de Cayenne Hot Sauce'),(-276,'13','Sku','longDescription','fr','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Tout est plus grand au Texas, m&ecirc;me la brÃ»lure de Hot Sauce une Snortin Bull! douche sur le Texas Steak taille qu\'ils appellent le 96er Ole ou vos l&eacute;gumes Jane avion. Si vous &ecirc;tes un fan sur faire de la sauce barbecue &agrave; partir de z&eacute;ro comme je suis, vous pouvez utiliser la sauce Bull amygdales Snort Smokin \'Hot tant qu\'additif. Red hot habaneros et piments donner &agrave; cette tingler amygdales sa saveur c&eacute;l&egrave;bre et rouge de chaleur chaud. Bull Snort Smokin \'Hot amygdales Sauce\'ll avoir vos entrailles buckin Â»avec une goutte d\'eau.'),(-275,'13','Sku','name','fr','Bull Snort Smokin \'Hot Sauce Toncils'),(-274,'12','Sku','longDescription','fr','L\'une des sauces les plus insolites que nous vendons. L\'original &eacute;tait un vieux style sauce cajun et c\'est Ã§a le noircissement &agrave; jour de version. C\'est gentil, mais vous obtenez un grand succ&egrave;s de cannelle et de clou de girofle avec un coup de chaleur agr&eacute;able de Cayenne. Utilisez-le sur tous les aliments &agrave; donner cette ambiance cajun.'),(-273,'12','Sku','name','fr','Caf&eacute; Cajun Louisiane Douce Sauce Blackening'),(-272,'11','Sku','longDescription','fr','Been there, encord&eacute;s cela. Hotter than jument buckin \'en chaleur! Saupoudrez de plats de viande, de fruits de mer et l&eacute;gumes. Utilisation comme additif dans une sauce barbecue ou tout aliment qui a besoin d\'une saveur &eacute;pic&eacute;e. Commencez avec quelques gouttes et travailler jusqu\'&agrave; la saveur d&eacute;sir&eacute;e.'),(-271,'11','Sku','name','fr','Bull Snort Cowboy poivre de Cayenne Hot Sauce'),(-270,'10','Sku','longDescription','fr','Voici la prescription pour ceux qui aiment la chaleur intol&eacute;rable. Dr Chilemeister potion de malades et mal mortel doit &ecirc;tre utilis&eacute; avec prudence. La douleur peut devenir une d&eacute;pendance!'),(-269,'10','Sku','name','fr','Dr Chilemeister Sauce Hot Insane'),(-268,'9','Sku','longDescription','fr','Tout l\'enfer se d&eacute;chaÃ®ne, le feu et le soufre pleuvoir? se pr&eacute;parer &agrave; rencontrer votre machine?'),(-267,'9','Sku','name','fr','Armageddon Le Hot Sauce To End All'),(-266,'8','Sku','longDescription','fr','Vous misez vos bottes, cette sauce chaude valu son nom de gens qui appr&eacute;cient une sauce chaude exceptionnel. Ce que vous trouverez ici est une saveur piquante vraiment original, pas un piquant irr&eacute;sistible que l\'on retrouve dans les sauces au poivre Tabasco ordinaires - m&ecirc;me si le piment utilis&eacute; dans ce produit a &eacute;t&eacute; test&eacute; &agrave; 285.000 unit&eacute;s Scoville. Alors, en selle pour une balade inoubliable. Pour vous assurer que nous vous avons apport&eacute; la plus belle sauce au poivre de Habanero, nous sommes all&eacute;s aux contreforts des montagnes mayas au Belize, en Am&eacute;rique centrale. Ce produit est pr&eacute;par&eacute; enti&egrave;rement &agrave; la main en utilisant uniquement des l&eacute;gumes frais et de tous les ingr&eacute;dients naturels.'),(-265,'8','Sku','name','fr','Blazin \'Selle XXX Hot Habanero sauce au poivre'),(-264,'7','Sku','longDescription','fr','Fabriqu&eacute; avec Naga Bhut Jolokia, plus chaud poivre dans le monde.'),(-263,'7','Sku','name','fr','Green Ghost'),(-262,'6','Sku','longDescription','fr','Souvent confondu avec le Habanero, le Scotch Bonnet a une pointe profond&eacute;ment invers&eacute;e par rapport &agrave; l\'extr&eacute;mit&eacute; pointue de l\'Habanero. Allant dans de nombreuses couleurs allant du vert au jaune-orange, le Scotch Bonnet est un aliment de base dans les Antilles et sauces au poivre de style Barbade.'),(-261,'6','Sku','name','fr','Jour de la sauce Scotch Bonnet Hot Morte'),(-260,'5','Sku','longDescription','fr','Si vous voulez chaud, c\'est le piment de choisir. Originaire de la CaraÃ¯be, du Yucatan et du Nord CÃ´te de l\'Am&eacute;rique du Sud, le Habanero se pr&eacute;sente dans une vari&eacute;t&eacute; de couleurs allant du vert p&acirc;le au rouge vif. La chaleur gras Habanero, la saveur et l\'arÃ´me unique, en a fait le favori des amateurs de chili.'),(-259,'5','Sku','name','fr','Jour de la sauce Habanero Hot Morte'),(-258,'4','Sku','longDescription','fr','Lorsque tout le poivre est s&eacute;ch&eacute; et fum&eacute;, il est consid&eacute;r&eacute; comme un Chipotle. Normalement, avec un aspect froiss&eacute;, drak brun, le chipotle fum&eacute; offre une saveur douce qui est g&eacute;n&eacute;ralement utilis&eacute; pour ajouter un smokey, saveur rÃ´tie aux salsas, les ragoÃ»ts et marinades.'),(-257,'4','Sku','name','fr','Jour de la sauce chaude Morte Chipotle'),(-256,'3','Sku','longDescription','fr','Tangy, venu de Cayenne poivron flux avec l\'ail, l\'oignon p&acirc;te de tomate, et un soupÃ§on de sucre de canne pour en faire une sauce onctueuse avec une morsure. Magnifique sur les Å“ufs, la volaille, le porc ou le poisson, cette sauce marie pour faire des marinades et des soupes riches.'),(-255,'3','Sku','name','fr','Hot Sauce Hoppin'),(-254,'2','Sku','longDescription','fr','Le parfait topper pour le poulet, le poisson, des hamburgers ou une pizza. Un grand m&eacute;lange de Habanero, mangue, fruits de la passion et de plus faire cette sauce Mort d\'un festin incroyable tropicale'),(-253,'2','Sku','name','fr','Sauce Sweet Death'),(-252,'1','Sku','longDescription','fr','Comme mes Chilipals sais, je suis pas du genre &agrave; &ecirc;tre satisfaite. Par cons&eacute;quent, la cr&eacute;ation de la mort subite. Lorsque vous avez besoin d\'aller au-del&agrave; ... Mort subite livrera!'),(-251,'1','Sku','name','fr','Sauce mort subite'),(-247,'14','ProdOptionVal','attributeValue','fr','XG'),(-246,'13','ProdOptionVal','attributeValue','fr','G'),(-245,'12','ProdOptionVal','attributeValue','fr','M'),(-244,'11','ProdOptionVal','attributeValue','fr','P'),(-243,'3','ProdOptionVal','attributeValue','fr','Argent'),(-242,'2','ProdOptionVal','attributeValue','fr','Rouge'),(-241,'1','ProdOptionVal','attributeValue','fr','Noir'),(-232,'2','ProdOption','label','fr','Shirt Taille'),(-231,'1','ProdOption','label','fr','Shirt Couleur'),(-216,'2006','Category','description','fr','FAQ'),(-215,'2005','Category','description','fr','Nouveau Hot Sauce?'),(-214,'2004','Category','description','fr','D&eacute;gagement'),(-213,'2003','Category','description','fr','Marchandisfr'),(-212,'2002','Category','description','fr','Sauces chaudfr'),(-211,'2001','Category','description','fr','Page d\'accueil'),(-206,'2006','Category','name','fr','FAQ'),(-205,'2005','Category','name','fr','Nouveau Hot Sauce?'),(-204,'2004','Category','name','fr','D&eacute;gagement'),(-203,'2003','Category','name','fr','Marchandisfr'),(-202,'2002','Category','name','fr','Sauces chaudfr'),(-201,'2001','Category','name','fr','Page d\'accueil'),(-196,'3','FulfillmentOption','longDescription','es','1 - 2 D&iacute;as'),(-195,'3','FulfillmentOption','name','es','Express'),(-194,'2','FulfillmentOption','longDescription','es','3 - 5 D&iacute;as'),(-193,'2','FulfillmentOption','name','es','Ejecutiva'),(-192,'1','FulfillmentOption','longDescription','es','5 - 7 D&iacute;as'),(-191,'1','FulfillmentOption','name','es','EstÃ¡ndar'),(-182,'3','SearchFacet','label','es','Precio'),(-181,'2','SearchFacet','label','es','Rango de Calor'),(-180,'1','SearchFacet','label','es','Fabricante'),(-100,'600','Sku','longDescription','es','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!'),(-99,'600','Sku','name','es','Mascota de Heat Clinic (Mujeres)'),(-98,'500','Sku','longDescription','es','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!'),(-97,'500','Sku','name','es','Mascota de Heat Clinic (Hombres)'),(-96,'400','Sku','longDescription','es','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.'),(-95,'400','Sku','name','es','Heat Clinic dibujado a mano (Mujeres)'),(-94,'300','Sku','longDescription','es','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.'),(-93,'300','Sku','name','es','Heat Clinic dibujado a mano (Hombres)'),(-92,'200','Sku','longDescription','es','Colecci&oacute;n de Mujeres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.'),(-91,'200','Sku','name','es','Camisa de Habanero Hawt (Mujeres)'),(-90,'100','Sku','longDescription','es','Colecci&oacute;n de Hombres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.'),(-89,'100','Sku','name','es','Camisa de Habanero Hawt (Hombres)'),(-88,'19','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-87,'19','Sku','name','es','Salsa de Pimienta Roja y Chipotle'),(-86,'18','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-85,'18','Sku','name','es','Salsa de Jalape&ntilde;o Ardiente'),(-84,'17','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-83,'17','Sku','name','es','Salsa de Locura'),(-82,'16','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-81,'16','Sku','name','es','Salsa de Locura'),(-80,'15','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-79,'15','Sku','name','es','Salsa de Ajo Tostado'),(-78,'14','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.'),(-77,'14','Sku','name','es','Salsa de Cayene Fresco'),(-76,'13','Sku','longDescription','es','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Si usted es un fan de hacer la salsa de barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y los pimientos de cayena dan a la garganta un sabor y calor al rojo vivo.'),(-75,'13','Sku','name','es','Salsa Mata-Gargantas de Bull Snort'),(-74,'12','Sku','longDescription','es','Una de las salsas m&aacute;s inusuales que vendemos. La original era un viejo estilo salsa caj&uacute;n y esto versi&oacute;n actualizada ennegrecimiento. Es dulce, pero se obtiene un gran sabor de canela y clavo de olor con un tiro agradable de piacnte de Cayena. Use en todos los alimentos para dar ese toque caj&uacute;n.'),(-73,'12','Sku','name','es','Salsa Dulce de Cajun de Lousiane'),(-72,'11','Sku','longDescription','es','Espolvorear con platos de carne, pescado y verduras. Use como aditivo en la salsa de barbacoa o cualquier alimento que necesita un sabor picante. Comience con unas gotas y aumente hasta llegar al sabor deseado.'),(-71,'11','Sku','name','es','Salsa Picante del Vaquero'),(-70,'10','Sku','longDescription','es','AquÃ­ est&aacute; la receta para aquellos que disfrutan de picante intolerable. Esta salsa macabra y mortal del Dr. Chilemeister se debe utilizar con precauci&oacute;n. El dolor puede llegar a ser adictivo!'),(-69,'10','Sku','name','es','Salsa Loca del Dr. Chilemeister'),(-68,'9','Sku','longDescription','es','Todo el infierno se ha desatado, fuego y azufre. Est&aacute; listo para el fin?'),(-67,'9','Sku','name','es','Fin del Mundo Salsa'),(-66,'8','Sku','longDescription','es','Esta salsa caliente recibe su nombre por la gente que aprecian una salsa picante. Lo que vas a encontrar aquÃ­ es un sabor picante realmente original, no una acritud abrumador que se encuentra en las salsas de chile Tabasco ordinarios - a pesar de la pimienta usado en este producto ha sido probado en 285.000 unidades Scoville. Por lo tanto, ensillar a dar un paseo para recordar. Para asegurarnos de que usted trajo s&oacute;lo la mejor salsa de pimiento habanero, nos fuimos a las faldas de las monta&ntilde;as mayas en Belice, Am&eacute;rica Central. Este producto se prepara totalmente a mano utilizando s&oacute;lo las verduras frescas y solo ingredientes naturales.'),(-65,'8','Sku','name','es','Salsa de Habanero de la Silla Ardiente'),(-64,'7','Sku','longDescription','es','Hecho con Naga Jolokia Bhut, el chile m&aacute;s picante del mundo.'),(-63,'7','Sku','name','es','Fantasma Verde'),(-62,'6','Sku','longDescription','es','Parecido al Habanero, el Bonnet Escoc&eacute;s tiene una punta profundamente invertidas en comparaci&oacute;n con el extremo puntiagudo del Habanero. Van en colores de verde a amarillo-naranja, el Bonnet Escoc&eacute;s es un alimento b&aacute;sico en West Indies, en Barbados y salsas estilo pimienta.'),(-61,'6','Sku','name','es','Salsa del D&iacute;a de los Muertos de Bonnet Escoc&eacute;s'),(-60,'5','Sku','longDescription','es','Si quieres picante, este es el Chile a elegir. Originario del Caribe, Yucat&aacute;n y la Costa norte de Am&eacute;rica del Sur, el habanero se presenta en una variedad de colores que van desde el verde claro a un rojo brillante. El calor, sabor y aroma &uacute;nicos del Habanero ha convertido el chile en el favorito de los amantes del picante.'),(-59,'5','Sku','name','es','Salsa del D&iacute;a de los Muertos de Habanero'),(-58,'4','Sku','longDescription','es','Cuando cualquier pimienta se seca y se fuma, se refiere como un Chipotle. Por lo general, con una apariencia arrugada, caf&eacute; oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza generalmente para agregar un sabor asado a las salsas, guisos y adobos.'),(-57,'4','Sku','name','es','Salsa del D&iacute;a de los Muertos de Chipotle'),(-56,'3','Sku','longDescription','es','Picante, maduro pimienta que se mezcla junto con el ajo, la cebolla, pasta de tomate y una pizca de az&uacute;car de ca&ntilde;a para hacer de esto una salsa suave. Maravilloso en huevos, aves de corral, carne de cerdo o pescado, esta salsa se â€‹â€‹mezcla para hacer los adobos y sopas ricas.'),(-55,'3','Sku','name','es','Salsa de la Muerte Saltante'),(-54,'2','Sku','longDescription','es','El perfecto acompa&ntilde;ante para el pollo, el pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasi&oacute;n y mucho m&aacute;s hacen de esta salsa de la Muerte una delicia tropical incre&iacute;ble.'),(-53,'2','Sku','name','es','Salsa de la Muerte Dulce'),(-52,'1','Sku','longDescription','es','Como mis amigos salseros saben, nunca soy f&aacute;cil de satisfacer. Por lo tanto, naci&oacute; la creaci&oacute;n de la Muerte S&uacute;bita. Cuando este listo para saborear al m&aacute;s all&aacute; ... Muerte s&uacute;bita entregar&aacute;!'),(-51,'1','Sku','name','es','Salsa de la Muerte S&uacute;bita'),(-47,'14','ProdOptionVal','attributeValue','es','XG'),(-46,'13','ProdOptionVal','attributeValue','es','G'),(-45,'12','ProdOptionVal','attributeValue','es','M'),(-44,'11','ProdOptionVal','attributeValue','es','CH'),(-43,'3','ProdOptionVal','attributeValue','es','Plateado'),(-42,'2','ProdOptionVal','attributeValue','es','Rojo'),(-41,'1','ProdOptionVal','attributeValue','es','Negro'),(-32,'2','ProdOption','label','es','Tama&ntilde;o de Camisa'),(-31,'1','ProdOption','label','es','Color de Camisa'),(-16,'2006','Category','description','es','FAQ'),(-15,'2005','Category','description','es','Iniciando con Salsas?'),(-14,'2004','Category','description','es','Descuento'),(-13,'2003','Category','description','es','Mercanc&iacute;a'),(-12,'2002','Category','description','es','Salsas Picantes'),(-11,'2001','Category','description','es','Inicio'),(-6,'2006','Category','name','es','FAQ'),(-5,'2005','Category','name','es','Nuevo a la Salsa?'),(-4,'2004','Category','name','es','Descuento'),(-3,'2003','Category','name','es','Mercanc&iacute;a'),(-2,'2002','Category','name','es','Salsas'),(-1,'2001','Category','name','es','Inicio');
/*!40000 ALTER TABLE `blc_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_url_handler`
--

DROP TABLE IF EXISTS `blc_url_handler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_url_handler` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) NOT NULL,
  `NEW_URL` varchar(255) NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`),
  KEY `INCOMING_URL_INDEX` (`INCOMING_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_url_handler`
--

LOCK TABLES `blc_url_handler` WRITE;
/*!40000 ALTER TABLE `blc_url_handler` DISABLE KEYS */;
INSERT INTO `blc_url_handler` VALUES (1,'/googlePerm','http://www.google.com','REDIRECT_PERM'),(2,'/googleTemp','http://www.google.com','REDIRECT_TEMP'),(3,'/insanity','/hot-sauces/insanity_sauce','FORWARD'),(4,'/jalepeno','/hot-sauces/hurtin_jalepeno_hot_sauce','REDIRECT_TEMP');
/*!40000 ALTER TABLE `blc_url_handler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_userconnection`
--

DROP TABLE IF EXISTS `blc_userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_userconnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_userconnection`
--

LOCK TABLES `blc_userconnection` WRITE;
/*!40000 ALTER TABLE `blc_userconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_userconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_zip_code`
--

DROP TABLE IF EXISTS `blc_zip_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_zip_code` (
  `ZIP_CODE_ID` varchar(255) NOT NULL,
  `ZIP_CITY` varchar(255) DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_zip_code`
--

LOCK TABLES `blc_zip_code` WRITE;
/*!40000 ALTER TABLE `blc_zip_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_zip_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_customer`
--

DROP TABLE IF EXISTS `enc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_customer`
--

LOCK TABLES `enc_customer` WRITE;
/*!40000 ALTER TABLE `enc_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute`
--

DROP TABLE IF EXISTS `enc_dispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute` (
  `DISPUTE_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `DISPUTE_SP_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `DISPUTE_STATE_ID` bigint(20) NOT NULL,
  `DISPUTE_PRIORITY_ID` bigint(20) NOT NULL,
  `DISPUTE_CHANNEL_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_ID`),
  KEY `ORDER_ITEM_ID` (`ORDER_ITEM_ID`),
  KEY `DISPUTE_SP_ID` (`DISPUTE_SP_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `DISPUTE_STATE_ID` (`DISPUTE_STATE_ID`),
  KEY `DISPUTE_PRIORITY_ID` (`DISPUTE_PRIORITY_ID`),
  KEY `DISPUTE_CHANNEL_ID` (`DISPUTE_CHANNEL_ID`),
  CONSTRAINT `enc_dispute_ibfk_1` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `enc_dispute_ibfk_2` FOREIGN KEY (`DISPUTE_SP_ID`) REFERENCES `enc_service_provider` (`SP_ID`),
  CONSTRAINT `enc_dispute_ibfk_3` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`),
  CONSTRAINT `enc_dispute_ibfk_4` FOREIGN KEY (`DISPUTE_STATE_ID`) REFERENCES `enc_dispute_states` (`DISPUTE_STATE_ID`),
  CONSTRAINT `enc_dispute_ibfk_5` FOREIGN KEY (`DISPUTE_PRIORITY_ID`) REFERENCES `enc_dispute_priority` (`DISPUTE_PRIORITY_ID`),
  CONSTRAINT `enc_dispute_ibfk_6` FOREIGN KEY (`DISPUTE_CHANNEL_ID`) REFERENCES `enc_dispute_channel` (`DISPUTE_CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute`
--

LOCK TABLES `enc_dispute` WRITE;
/*!40000 ALTER TABLE `enc_dispute` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute_channel`
--

DROP TABLE IF EXISTS `enc_dispute_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute_channel` (
  `DISPUTE_CHANNEL_ID` bigint(20) NOT NULL,
  `DISPUTE_CHANNEL_NAME` varchar(255) NOT NULL,
  `DISPUTE_CHANNEL_SHORT_DESC` varchar(100) DEFAULT NULL,
  `DISPUTE_CHANNEL_LONG_DESC` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute_channel`
--

LOCK TABLES `enc_dispute_channel` WRITE;
/*!40000 ALTER TABLE `enc_dispute_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute_comments`
--

DROP TABLE IF EXISTS `enc_dispute_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute_comments` (
  `DISPUTE_COMMENTS_ID` bigint(20) NOT NULL,
  `DISPUTE_ID` bigint(20) NOT NULL,
  `COMMENTS` varchar(500) NOT NULL,
  `DISPUTE_CHANNEL_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_COMMENTS_ID`),
  KEY `DISPUTE_ID` (`DISPUTE_ID`),
  KEY `DISPUTE_CHANNEL_ID` (`DISPUTE_CHANNEL_ID`),
  CONSTRAINT `enc_dispute_comments_ibfk_1` FOREIGN KEY (`DISPUTE_ID`) REFERENCES `enc_dispute` (`DISPUTE_ID`),
  CONSTRAINT `enc_dispute_comments_ibfk_2` FOREIGN KEY (`DISPUTE_CHANNEL_ID`) REFERENCES `enc_dispute_channel` (`DISPUTE_CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute_comments`
--

LOCK TABLES `enc_dispute_comments` WRITE;
/*!40000 ALTER TABLE `enc_dispute_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute_priority`
--

DROP TABLE IF EXISTS `enc_dispute_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute_priority` (
  `DISPUTE_PRIORITY_ID` bigint(20) NOT NULL,
  `DISPUTE_PRIORITY_NAME` varchar(255) NOT NULL,
  `DISPUTE_PRIORITY_SHORT_DESC` varchar(100) DEFAULT NULL,
  `DISPUTE_PRIORITY_LONG_DESC` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_PRIORITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute_priority`
--

LOCK TABLES `enc_dispute_priority` WRITE;
/*!40000 ALTER TABLE `enc_dispute_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute_state_transition`
--

DROP TABLE IF EXISTS `enc_dispute_state_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute_state_transition` (
  `DISPUTE_STATE_TRANSITION_ID` bigint(20) NOT NULL,
  `DISPUTE_ID` bigint(20) NOT NULL,
  `DISPUTE_STATE_ID` bigint(20) NOT NULL,
  `DISPUTE_CHANNEL_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_STATE_TRANSITION_ID`),
  KEY `DISPUTE_ID` (`DISPUTE_ID`),
  KEY `DISPUTE_STATE_ID` (`DISPUTE_STATE_ID`),
  KEY `DISPUTE_CHANNEL_ID` (`DISPUTE_CHANNEL_ID`),
  CONSTRAINT `enc_dispute_state_transition_ibfk_1` FOREIGN KEY (`DISPUTE_ID`) REFERENCES `enc_dispute` (`DISPUTE_ID`),
  CONSTRAINT `enc_dispute_state_transition_ibfk_2` FOREIGN KEY (`DISPUTE_STATE_ID`) REFERENCES `enc_dispute_states` (`DISPUTE_STATE_ID`),
  CONSTRAINT `enc_dispute_state_transition_ibfk_3` FOREIGN KEY (`DISPUTE_CHANNEL_ID`) REFERENCES `enc_dispute_channel` (`DISPUTE_CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute_state_transition`
--

LOCK TABLES `enc_dispute_state_transition` WRITE;
/*!40000 ALTER TABLE `enc_dispute_state_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute_state_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_dispute_states`
--

DROP TABLE IF EXISTS `enc_dispute_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_dispute_states` (
  `DISPUTE_STATE_ID` bigint(20) NOT NULL,
  `DISPUTE_STATE_NAME` varchar(255) NOT NULL,
  `DISPUTE_STATE_SHORT_DESC` varchar(100) DEFAULT NULL,
  `DISPUTE_STATE_LONG_DESC` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DISPUTE_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_dispute_states`
--

LOCK TABLES `enc_dispute_states` WRITE;
/*!40000 ALTER TABLE `enc_dispute_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_dispute_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_exp_measurements`
--

DROP TABLE IF EXISTS `enc_exp_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_exp_measurements` (
  `EXP_MEASUREMENT_ID` bigint(20) NOT NULL,
  `EXP_MEASUREMENT_NAME` varchar(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `HEIGHT` tinyint(4) DEFAULT NULL,
  `CHEST` tinyint(4) DEFAULT NULL,
  `BUST` tinyint(4) DEFAULT NULL,
  `DARTLINE` tinyint(4) DEFAULT NULL,
  `WAIST` tinyint(4) DEFAULT NULL,
  `HIP` tinyint(4) DEFAULT NULL,
  `N_WAIST` tinyint(4) DEFAULT NULL,
  `SHOULDER` tinyint(4) DEFAULT NULL,
  `S_LENGTH` tinyint(4) DEFAULT NULL,
  `ARM_HOLE` tinyint(4) DEFAULT NULL,
  `T_SLEEVE` tinyint(4) DEFAULT NULL,
  `B_SLEEVE` tinyint(4) DEFAULT NULL,
  `F_NECK` tinyint(4) DEFAULT NULL,
  `B_NECK` tinyint(4) DEFAULT NULL,
  `PANT_HEIGHT` tinyint(4) DEFAULT NULL,
  `SEAT` tinyint(4) DEFAULT NULL,
  `FILLER1` tinyint(4) DEFAULT NULL,
  `FILLER2` tinyint(4) DEFAULT NULL,
  `FILLER3` tinyint(4) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EXP_MEASUREMENT_ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  CONSTRAINT `enc_exp_measurements_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `blc_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_exp_measurements`
--

LOCK TABLES `enc_exp_measurements` WRITE;
/*!40000 ALTER TABLE `enc_exp_measurements` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_exp_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_material_design_mapping`
--

DROP TABLE IF EXISTS `enc_material_design_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_material_design_mapping` (
  `MATERIAL_DESIGN_MAPPING_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `REL_ORDER_ITEM_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`MATERIAL_DESIGN_MAPPING_ID`),
  KEY `ORDER_ITEM_ID` (`ORDER_ITEM_ID`),
  KEY `REL_ORDER_ITEM_ID` (`REL_ORDER_ITEM_ID`),
  CONSTRAINT `enc_material_design_mapping_ibfk_1` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `enc_material_design_mapping_ibfk_2` FOREIGN KEY (`REL_ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_material_design_mapping`
--

LOCK TABLES `enc_material_design_mapping` WRITE;
/*!40000 ALTER TABLE `enc_material_design_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_material_design_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_measurements`
--

DROP TABLE IF EXISTS `enc_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_measurements` (
  `MEASUREMENT_ID` bigint(20) NOT NULL,
  `MEASUREMENT_NAME` varchar(20) NOT NULL,
  `MEASUREMENT_DESCRIPTION` varchar(200) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `HEIGHT` float DEFAULT NULL,
  `CHEST` float DEFAULT NULL,
  `BUST` float DEFAULT NULL,
  `DARTLINE` float DEFAULT NULL,
  `WAIST` float DEFAULT NULL,
  `HIP` float DEFAULT NULL,
  `N_WAIST` float DEFAULT NULL,
  `SHOULDER` float DEFAULT NULL,
  `S_LENGTH` float DEFAULT NULL,
  `ARM_HOLE` float DEFAULT NULL,
  `T_SLEEVE` float DEFAULT NULL,
  `B_SLEEVE` float DEFAULT NULL,
  `F_NECK` float DEFAULT NULL,
  `B_NECK` float DEFAULT NULL,
  `PANT_HEIGHT` float DEFAULT NULL,
  `SEAT` float DEFAULT NULL,
  `FILLER1` float DEFAULT NULL,
  `FILLER2` float DEFAULT NULL,
  `FILLER3` float DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MEASUREMENT_ID`),
  KEY `MEASUREMENT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  CONSTRAINT `enc_measurements_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `blc_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_measurements`
--

LOCK TABLES `enc_measurements` WRITE;
/*!40000 ALTER TABLE `enc_measurements` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_order_detail`
--

DROP TABLE IF EXISTS `enc_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_order_detail` (
  `ORDER_DETAIL_ID` bigint(20) NOT NULL,
  `CURRENT_OWNER` bigint(20) NOT NULL,
  `OWNER_CATEGORY_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `CURRENT_STATE_ID` bigint(20) NOT NULL,
  `EXPECTED_DELIVERY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_DETAIL_ID`),
  KEY `OWNER_CATEGORY_ID` (`OWNER_CATEGORY_ID`),
  KEY `ORDER_ITEM_ID` (`ORDER_ITEM_ID`),
  KEY `CURRENT_STATE_ID` (`CURRENT_STATE_ID`),
  CONSTRAINT `enc_order_detail_ibfk_1` FOREIGN KEY (`OWNER_CATEGORY_ID`) REFERENCES `enc_user_category` (`USER_CATEGORY_ID`),
  CONSTRAINT `enc_order_detail_ibfk_2` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `enc_order_detail_ibfk_3` FOREIGN KEY (`CURRENT_STATE_ID`) REFERENCES `enc_order_states` (`ORDER_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_order_detail`
--

LOCK TABLES `enc_order_detail` WRITE;
/*!40000 ALTER TABLE `enc_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_order_state_transition`
--

DROP TABLE IF EXISTS `enc_order_state_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_order_state_transition` (
  `ORDER_STATE_TRANSITION_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `ORDER_STATE_ID` bigint(20) NOT NULL,
  `NEW_OWNER` bigint(20) DEFAULT NULL,
  `NEW_OWNER_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PREV_OWNER` bigint(20) DEFAULT NULL,
  `PREV_OWNER_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `COMMENTS` varchar(500) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_STATE_TRANSITION_ID`),
  KEY `ORDER_ITEM_ID` (`ORDER_ITEM_ID`),
  KEY `ORDER_STATE_ID` (`ORDER_STATE_ID`),
  KEY `NEW_OWNER_CATEGORY_ID` (`NEW_OWNER_CATEGORY_ID`),
  KEY `PREV_OWNER_CATEGORY_ID` (`PREV_OWNER_CATEGORY_ID`),
  CONSTRAINT `enc_order_state_transition_ibfk_1` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `blc_order_item` (`ORDER_ITEM_ID`),
  CONSTRAINT `enc_order_state_transition_ibfk_2` FOREIGN KEY (`ORDER_STATE_ID`) REFERENCES `enc_order_states` (`ORDER_STATE_ID`),
  CONSTRAINT `enc_order_state_transition_ibfk_3` FOREIGN KEY (`NEW_OWNER_CATEGORY_ID`) REFERENCES `enc_user_category` (`USER_CATEGORY_ID`),
  CONSTRAINT `enc_order_state_transition_ibfk_4` FOREIGN KEY (`PREV_OWNER_CATEGORY_ID`) REFERENCES `enc_user_category` (`USER_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_order_state_transition`
--

LOCK TABLES `enc_order_state_transition` WRITE;
/*!40000 ALTER TABLE `enc_order_state_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_order_state_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_order_states`
--

DROP TABLE IF EXISTS `enc_order_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_order_states` (
  `ORDER_STATE_ID` bigint(20) NOT NULL,
  `ORDER_STATE_NAME` varchar(255) NOT NULL,
  `ORDER_STATE_SHORT_DESC` varchar(100) DEFAULT NULL,
  `ORDER_STATE_LONG_DESC` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_order_states`
--

LOCK TABLES `enc_order_states` WRITE;
/*!40000 ALTER TABLE `enc_order_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_order_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_service_provider`
--

DROP TABLE IF EXISTS `enc_service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_service_provider` (
  `SP_ID` bigint(20) NOT NULL,
  `SP_FIRST_NAME` varchar(20) DEFAULT NULL,
  `SP_LAST_NAME` varchar(20) DEFAULT NULL,
  `SP_FIRM_NAME` varchar(20) DEFAULT NULL,
  `SP_SHORT_DESCRIPTION` varchar(100) DEFAULT NULL,
  `SP_LONG_DESCRIPTION` varchar(100) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` tinyint(1) DEFAULT NULL,
  `IS_REGISTERED` tinyint(1) DEFAULT NULL,
  `ENCLOTHE_URL` varchar(100) DEFAULT NULL,
  `MERCHANT_URL` varchar(100) DEFAULT NULL,
  `CURRENT_CAPACITY` bigint(20) DEFAULT NULL,
  `USER_CATEGORY_ID` bigint(20) NOT NULL,
  `IMAGE_URL` varchar(100) DEFAULT NULL,
  `LOGO_URL` varchar(100) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  KEY `USER_CATEGORY_ID` (`USER_CATEGORY_ID`),
  KEY `ADDRESS_ID` (`ADDRESS_ID`),
  KEY `CHALLENGE_QUESTION_ID` (`CHALLENGE_QUESTION_ID`),
  KEY `LOCALE_CODE` (`LOCALE_CODE`),
  CONSTRAINT `enc_service_provider_ibfk_1` FOREIGN KEY (`USER_CATEGORY_ID`) REFERENCES `enc_user_category` (`USER_CATEGORY_ID`),
  CONSTRAINT `enc_service_provider_ibfk_2` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`),
  CONSTRAINT `enc_service_provider_ibfk_3` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `blc_challenge_question` (`QUESTION_ID`),
  CONSTRAINT `enc_service_provider_ibfk_4` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `blc_locale` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_service_provider`
--

LOCK TABLES `enc_service_provider` WRITE;
/*!40000 ALTER TABLE `enc_service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_service_provider_account_info`
--

DROP TABLE IF EXISTS `enc_service_provider_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_service_provider_account_info` (
  `SP_ACCOUNT_INFO_ID` bigint(20) NOT NULL,
  `ACCOUNT_HOLDER_NAME` varchar(255) DEFAULT NULL,
  `BANK_NAME` varchar(255) DEFAULT NULL,
  `BANK_IFSC_CODE` varchar(255) DEFAULT NULL,
  `ACCOUNT_NO` varchar(255) DEFAULT NULL,
  `BRANCH` varchar(255) DEFAULT NULL,
  `BANK_ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ACCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `SP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SP_ACCOUNT_INFO_ID`),
  KEY `SP_ID` (`SP_ID`),
  KEY `BANK_ADDRESS_ID` (`BANK_ADDRESS_ID`),
  CONSTRAINT `enc_service_provider_account_info_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `enc_service_provider` (`SP_ID`),
  CONSTRAINT `enc_service_provider_account_info_ibfk_2` FOREIGN KEY (`BANK_ADDRESS_ID`) REFERENCES `blc_address` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_service_provider_account_info`
--

LOCK TABLES `enc_service_provider_account_info` WRITE;
/*!40000 ALTER TABLE `enc_service_provider_account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_service_provider_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_service_provider_attribute`
--

DROP TABLE IF EXISTS `enc_service_provider_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_service_provider_attribute` (
  `SP_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` tinyint(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `SP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SP_ATTRIBUTE_ID`),
  KEY `SPATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `SPATTRIBUTE_INDEX` (`SP_ID`),
  CONSTRAINT `enc_service_provider_attribute_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `enc_service_provider` (`SP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_service_provider_attribute`
--

LOCK TABLES `enc_service_provider_attribute` WRITE;
/*!40000 ALTER TABLE `enc_service_provider_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_service_provider_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_service_provider_featured`
--

DROP TABLE IF EXISTS `enc_service_provider_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_service_provider_featured` (
  `FEATURED_SP_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `SP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FEATURED_SP_ID`),
  KEY `SP_ID` (`SP_ID`),
  CONSTRAINT `enc_service_provider_featured_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `enc_service_provider` (`SP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_service_provider_featured`
--

LOCK TABLES `enc_service_provider_featured` WRITE;
/*!40000 ALTER TABLE `enc_service_provider_featured` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_service_provider_featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enc_user_category`
--

DROP TABLE IF EXISTS `enc_user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enc_user_category` (
  `USER_CATEGORY_ID` bigint(20) NOT NULL,
  `USER_CATEGORY_NAME` varchar(20) NOT NULL,
  `USER_CATEGORY_DESCRIPTION` varchar(100) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enc_user_category`
--

LOCK TABLES `enc_user_category` WRITE;
/*!40000 ALTER TABLE `enc_user_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `enc_user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sandbox_item_action`
--

DROP TABLE IF EXISTS `sandbox_item_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sandbox_item_action` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  KEY `FKB270D74AFE239304` (`SANDBOX_ITEM_ID`),
  KEY `FKB270D74A9797A024` (`SANDBOX_ACTION_ID`),
  CONSTRAINT `FKB270D74A9797A024` FOREIGN KEY (`SANDBOX_ACTION_ID`) REFERENCES `blc_sandbox_action` (`SANDBOX_ACTION_ID`),
  CONSTRAINT `FKB270D74AFE239304` FOREIGN KEY (`SANDBOX_ITEM_ID`) REFERENCES `blc_sandbox_item` (`SANDBOX_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sandbox_item_action`
--

LOCK TABLES `sandbox_item_action` WRITE;
/*!40000 ALTER TABLE `sandbox_item_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `sandbox_item_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_generator`
--

DROP TABLE IF EXISTS `sequence_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_generator` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_generator`
--

LOCK TABLES `sequence_generator` WRITE;
/*!40000 ALTER TABLE `sequence_generator` DISABLE KEYS */;
INSERT INTO `sequence_generator` VALUES ('CategoryExcludedSearchFacetImpl',1000),('CategoryImpl',10000),('CategoryProductImpl',1000),('CategorySearchFacetImpl',1000),('ChallengeQuestionImpl',1000),('CustomerAttributeImpl',101),('CustomerRoleImpl',101),('EmailTrackingImpl',101),('FeaturedProductImpl',1000),('FieldDefinitionImpl',1000),('FieldEnumerationImpl',1000),('FieldEnumerationItemImpl',1000),('FieldGroupImpl',1000),('FieldImpl',1000),('FulfillmentOptionImpl',1000),('MediaImpl',100000),('OfferCodeImpl',1000),('OfferImpl',1000),('OfferItemCriteriaImpl',1000),('PageFieldImpl',1000),('PageImpl',1000),('PageTemplateImpl',1000),('ProductAttributeImpl',1000),('ProductImpl',10000),('ProductOptionImpl',1000),('ProductOptionValueImpl',1000),('RoleImpl',1000),('SandBoxImpl',1000),('SearchFacetImpl',1000),('SearchFacetRangeImpl',1000),('SearchInterceptImpl',1000),('SkuImpl',10000),('StaticAssetImpl',100000),('StructuredContentFieldImpl',1000),('StructuredContentImpl',1000),('StructuredContentRuleImpl',1000),('StructuredContentTypeImpl',1000),('URLHandlerImpl',1000);
/*!40000 ALTER TABLE `sequence_generator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-21  6:43:43
