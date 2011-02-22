# MySQL-Front 5.1  (Build 3.57)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: myssi
# ------------------------------------------------------
# Server version 5.1.30-community

DROP DATABASE IF EXISTS `myssi`;
CREATE DATABASE `myssi` /*!40100 DEFAULT CHARACTER SET gbk */;
USE `myssi`;

#
# Source for table cardinfo
#

DROP TABLE IF EXISTS `cardinfo`;
CREATE TABLE `cardinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `cardno` varchar(255) DEFAULT NULL COMMENT '信用卡编号',
  `cardname` varchar(255) DEFAULT NULL COMMENT '信用卡名称',
  `cardfrom` varchar(255) DEFAULT NULL COMMENT '发卡行',
  `parentid` int(11) DEFAULT NULL,
  `cardstate` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

#
# Dumping data for table cardinfo
#
LOCK TABLES `cardinfo` WRITE;
/*!40000 ALTER TABLE `cardinfo` DISABLE KEYS */;

INSERT INTO `cardinfo` VALUES (1,'ty001','信用卡-1','银行1',1,1);
INSERT INTO `cardinfo` VALUES (2,'ty002','信用卡-2','银行2',1,0);
INSERT INTO `cardinfo` VALUES (3,'0006','card--1','bank-1',6,0);
/*!40000 ALTER TABLE `cardinfo` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;

#
# Dumping data for table user
#
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` VALUES (1,'test','test','test@gmail.com','1','1','hebjioe','1','112333244');
INSERT INTO `user` VALUES (2,'22','22','22','0','0','hebjioedf','1','112333256');
INSERT INTO `user` VALUES (3,'33','33','33','0','0','hebji','1','112333244');
INSERT INTO `user` VALUES (4,'5555','5555','1555','0','0','hebjioefggtgt','1','112333276');
INSERT INTO `user` VALUES (6,'4444','4444','4444','0','0','hebjioetggtgt','1','112333238');
INSERT INTO `user` VALUES (7,'7777','7777','7777','0','0','ww','1',NULL);
INSERT INTO `user` VALUES (8,'222','','',NULL,NULL,'sdddd','',NULL);
INSERT INTO `user` VALUES (9,'dfdfdff','','',NULL,NULL,'sxxs','',NULL);
INSERT INTO `user` VALUES (10,'ddferrh','','',NULL,NULL,'qqq','',NULL);
INSERT INTO `user` VALUES (11,'kuiiuuiujj','','',NULL,NULL,'sdd','',NULL);
INSERT INTO `user` VALUES (12,'iluytty',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (13,'yuiooyfg',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (14,'yhkiythy',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `user` VALUES (15,'uiuoitjh','000000000','000000',NULL,NULL,'000000000000','0000000',NULL);
INSERT INTO `user` VALUES (16,'4444','4444','444',NULL,NULL,'3344','4444',NULL);
INSERT INTO `user` VALUES (17,'55','5566','55',NULL,NULL,'5566','55',NULL);
INSERT INTO `user` VALUES (18,'000','000','000',NULL,NULL,'000','00',NULL);
INSERT INTO `user` VALUES (19,'112','112','112',NULL,NULL,'秦记','112',NULL);
INSERT INTO `user` VALUES (20,'66','666','66',NULL,NULL,'666','66',NULL);
INSERT INTO `user` VALUES (21,'99','99','99',NULL,NULL,'9999','99',NULL);
INSERT INTO `user` VALUES (22,'66','66','6',NULL,NULL,'666','66',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for procedure hello
#

DROP PROCEDURE IF EXISTS `hello`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hello`()
begin
select "hello word!!";
end;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
