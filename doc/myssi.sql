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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

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
INSERT INTO `user` VALUES (7,'7777','7777','7777','0','0','hebjioesxwss','1','112333274');
INSERT INTO `user` VALUES (8,'222',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
