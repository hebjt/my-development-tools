# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 192.168.0.237    Database: hsk_mock
# ------------------------------------------------------
# Server version 5.1.56-log

DROP DATABASE IF EXISTS `hsk_mock`;
CREATE DATABASE `hsk_mock` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hsk_mock`;

#
# Source for table exam_admin_to_right
#

DROP TABLE IF EXISTS `exam_admin_to_right`;
CREATE TABLE `exam_admin_to_right` (
  `right_id` varchar(32) NOT NULL,
  `admin_id` varchar(32) NOT NULL,
  `res_id` varchar(32) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`right_id`,`admin_id`,`res_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_admin_to_right
#

LOCK TABLES `exam_admin_to_right` WRITE;
/*!40000 ALTER TABLE `exam_admin_to_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_admin_to_right` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_admin_to_role
#

DROP TABLE IF EXISTS `exam_admin_to_role`;
CREATE TABLE `exam_admin_to_role` (
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `admin_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_admin_to_role
#

LOCK TABLES `exam_admin_to_role` WRITE;
/*!40000 ALTER TABLE `exam_admin_to_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_admin_to_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_adminstrator
#

DROP TABLE IF EXISTS `exam_adminstrator`;
CREATE TABLE `exam_adminstrator` (
  `admin_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `admin_title` varchar(255) DEFAULT NULL,
  `admin_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

#
# Dumping data for table exam_adminstrator
#

LOCK TABLES `exam_adminstrator` WRITE;
/*!40000 ALTER TABLE `exam_adminstrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_adminstrator` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_ans_detail
#

DROP TABLE IF EXISTS `exam_ans_detail`;
CREATE TABLE `exam_ans_detail` (
  `ans_detail_id` varchar(32) NOT NULL COMMENT '考生答题记录ID',
  `paper_id` varchar(32) DEFAULT NULL COMMENT '试卷ID',
  `ans_record_id` varchar(32) DEFAULT NULL,
  `ques_id` varchar(32) DEFAULT NULL,
  `ans_detail_correct` varchar(1000) DEFAULT NULL,
  `ans_detail_content` varchar(4000) DEFAULT NULL COMMENT '考生答题结果',
  `ans_detail_core` varchar(10) DEFAULT NULL,
  `ans_detail_keymark` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ans_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考生答题记录';

#
# Dumping data for table exam_ans_detail
#

LOCK TABLES `exam_ans_detail` WRITE;
/*!40000 ALTER TABLE `exam_ans_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_ans_detail` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_ans_record
#

DROP TABLE IF EXISTS `exam_ans_record`;
CREATE TABLE `exam_ans_record` (
  `ans_record_id` varchar(32) NOT NULL,
  `paper_id` varchar(32) DEFAULT NULL COMMENT '试卷ID',
  `publish_id` varchar(32) DEFAULT NULL COMMENT '发布ID',
  `stu_id` varchar(32) DEFAULT NULL COMMENT '学号',
  `ans_record_state` varchar(10) DEFAULT NULL COMMENT '考试记录的状态',
  `ans_record_creattime` datetime DEFAULT NULL,
  `ans_record_lastupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ans_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考试记录表，考生每参加一次考试此表生成一条记录\r\n同时也是老师阅卷的任务表';

#
# Dumping data for table exam_ans_record
#

LOCK TABLES `exam_ans_record` WRITE;
/*!40000 ALTER TABLE `exam_ans_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_ans_record` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_options
#

DROP TABLE IF EXISTS `exam_options`;
CREATE TABLE `exam_options` (
  `opt_id` varchar(32) NOT NULL COMMENT '选项ID',
  `ques_id` varchar(32) DEFAULT NULL,
  `opt_seq_num` varchar(10) DEFAULT NULL COMMENT '选项序号',
  `opt_content` varchar(1000) DEFAULT NULL COMMENT '选项内容',
  `opt_structId` varchar(32) NOT NULL DEFAULT '',
  `opt_paperId` varchar(32) NOT NULL DEFAULT '',
  `opt_typeId` char(2) DEFAULT NULL,
  PRIMARY KEY (`opt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试题选项';

#
# Dumping data for table exam_options
#

LOCK TABLES `exam_options` WRITE;
/*!40000 ALTER TABLE `exam_options` DISABLE KEYS */;
INSERT INTO `exam_options` VALUES ('01cf482e30fc421124ae77ef677fdac6','89b4f96621a304994119634f175c2f16','B','．学了两天','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('0216d529a8ab42624b6d422aa0ca1040','ec46b75b19e4ea501bcaf4a467bc71b3','A','一搬进去就对院子进行了全面整顿','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('024892e95f11d8e4b548913b0614b72c','9cf15edd4ed0beaa3dcd1cda615a9e10','D','&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('02fd5cfa347c479e06037ea1e65b790a','f5f76d684c06bf944ef0a36926031fa5','E','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('04d951c5b80133cd55d26cd2a724e80a','757fe3ebbf877b963fa326e35c08ac39','B','&nbsp;生病了','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('075d7059f2dde213467275f4d5441bdd','ceeeefe45e1cf10a2b12433c6cacc835','D','&nbsp;16岁','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('09e043391880ec8dabe5c17d4991efc4','2d1ed0ec87bf7319b979d493339da0e7','C','&nbsp;参加游览','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('0c7522c6c6a24d0bab3e065a37fbbd06','14aa16d1ce54062b8b6db0185f2b71ec','C','太脏','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('0c8175dfe6dbda5646de86da8c8265f0','1d7582dabe8beafffea3710018fde675','D','&nbsp;想为爸爸做点事','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('1064549c2828e12f87b21d9c67190283','9dd31d139cd942ea0f1f38dda477f8b4','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('148701764f17421ea22ceaa3172767b3','5f55f5360923304048a23cfebd804fe4','B','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('15398684256f7b32e971dc6a1d2cecda','7e5dedb222f9a4dbea78cb8e4c93d728','D','男孩室友也是割草工','dfd5fae73161e965feb14c9bba26c4e4','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('15b2401278c40507aab27db833ee58e1','72fc45e07e28ec9ed049a10607bbc736','B','很兴奋','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('15f93d08c55ff02207b62cb3a475c34d','bf17c958a82d133742054ef601022bfe','A','不热情','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('16237f5b7421a75168c3cbb3043929ea','bb3ccaf7447a89f0ab228b6a9480719a','A','穿42号的鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('17a55c2f3fc82575307ff7cbb285fd54','5eb30bf6e50de1023453904ac836ea32','A','．不能刷卡','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('17f00d477e610f5dfd28963ec44c8cf0','7e5dedb222f9a4dbea78cb8e4c93d728','A','男孩给一位王太太打电话','','',NULL);
INSERT INTO `exam_options` VALUES ('1b9a016c90e4783ca43ed683df5e36bc','e04e393d665e5d9dc264fc89e250a430','C','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2012031613240003_3.jpg\" style=\"width: 130px; height: 91px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('1ba859b989a7eb6930b54b43651dd30e','af5c02577ea9eefd2712c46eb325a5e2','C','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('1d5b5f27436ddc0a72eee6f98c46ec17','72fc45e07e28ec9ed049a10607bbc736','C','大多数同事都认识他','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('206d4cd35bf4add08d7308ffba7e17c9','a45ddad479f53b554f71cbde11195f5d','A','星期三','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('23e0833936fe9d0d2f5285518e34687f','bf17c958a82d133742054ef601022bfe','D','服务很周到','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('24296161ee19babca5f7de03a6adafa1','c76e3b45cad6991f0bde6310e62d7adf','A','买鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('248391329bf28d6fcd2c6bd6eba584db','7b13a9c1e65bcc9b8b40acba12d3e825','C','从硅谷归国的留学生不会玩&ldquo;杀人游戏&rdquo;','dfd5fae73161e965feb14c9bba26c4e4','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('24973a5f4bf63ce1fb248cadaf7c2902','b163af01dc6c92b168e18a2b75207328','B','追赶','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('267b98bf15ba24e1dff9fd86b2167227','e40af9c9cb34c7d7aa85be26b1ff91be','A','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('27577c1cda70a7b292c54d44e9f2b42d','5eb30bf6e50de1023453904ac836ea32','B．','不能买单','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('28224d46d2bbf30dc9b707b1c3bfba2d','f5f76d684c06bf944ef0a36926031fa5','A','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('28a5337b4f5d799a1458f6a5b07f0bcc','b55bdd3050bf94040a4ae13eb09cf279','C','<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/59c1460f-c4af-4f76-8e89-4f00a5904c30.png\" alt=\"\" height=\"43\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/59c1460f-c4af-4f76-8e89-4f00a5904c30.png\" width=\"95\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('28e9c47d54d25f4fbabf272f70e2578d','3fc232fec235129ba139ee9d26242064','B','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('2e34ffbeea71a5148b1036829edf51c3','5eb30bf6e50de1023453904ac836ea32','D．','下次再付','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('2f13dff76049ae3563e81c2efec32d86','e04e393d665e5d9dc264fc89e250a430','A','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2012031613230103_1.jpg\" style=\"width: 134px; height: 106px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('2f15ace3b03fd771e84c336c25ef83cd','bb3ccaf7447a89f0ab228b6a9480719a','B.','不喜欢这款鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('2f17bba2c4788c93d74d60415994202c','c76e3b45cad6991f0bde6310e62d7adf','D.','试鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('2f527b27aa1d9a46dfcf01ad6c7d7959','14aa16d1ce54062b8b6db0185f2b71ec','D','&nbsp;太短','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('30a878c680ddc6ca774d577ec400999b','ff134aeffe763e8f0e2ad4e4c2a5b655','D.','男的想要为女的过生日','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('30c842ce3c74e5a200ca0797f531665a','e04e393d665e5d9dc264fc89e250a430','B','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2012031613233703_2.jpg\" style=\"width: 132px; height: 103px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('32afc3e25a159e7fc7e225649e0a53d0','2d1ed0ec87bf7319b979d493339da0e7','B','&nbsp;开会','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('33a5e0a6d7a6b7b77134bc8641011e53','5eb30bf6e50de1023453904ac836ea32','C．','不能付现金','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('345bbf408cfd7f1f5a6b941be3cb5462','e01a271b8b0eecfcdb97481d9cd5669c','A','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('34bf018a2501b00b5717dfce19d2677b','f5f76d684c06bf944ef0a36926031fa5','C','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('350dccda897aa9fd49d919ac99adf27d','7e5dedb222f9a4dbea78cb8e4c93d728','B.','陈太太已经请了一个割草工','dfd5fae73161e965feb14c9bba26c4e4','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('352856d959da2dc0f46364fff02a28fb','ceeeefe45e1cf10a2b12433c6cacc835','A','&nbsp;25岁','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3667dc9eec315497f80996b9636881f7','d4f6178707f7e0dfd32ce0f1cdcd1e55','A','&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3835b7eee0edcb599757e8c35ee91c37','686946eb1251266452e6b3221c727cc6','B','&nbsp;没有风','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3844417f79754061d6968fe1437ac2c9','731bab261409864769ac3a290a97a3ef','A',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('3925cd4cd2ea4dae8cca0269e816d958','eb5681e29a9275067f74e096ec6085a8','B.','没把新主管放在眼里','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('3982c4b0cc8a32d09f0b627c4537f5e3','154d2dd2a3c9171f7e7255748d7ec752','B.','都是优秀的人才','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('39c9a0ca702b2982898f8647855b7be6','b163af01dc6c92b168e18a2b75207328','A．','追求','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('3b1b744fc152cf0b5d51160644fa86ee','5f55f5360923304048a23cfebd804fe4','A','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3bebbd0821c4b3f0e0e4310aca97deb6','9cf15edd4ed0beaa3dcd1cda615a9e10','B','&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3ca2fdf0a0b826a547fe5312841c4112','2d1ed0ec87bf7319b979d493339da0e7','D','&nbsp;学习','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('3f1c5998370b5eb1f730b92fb8af2b8b','ebb4eeeff9462470c3b60c1bebe31242','','<img alt=\"\" src=\"http://192.168.0.237/HskPic/upload/125555585821/2012022416052212JJ44151P-G6116.jpg\" style=\"width: 110px; height: 110px\">','dc7f4881e8f54fbffee689d1750918d2','125555585821',NULL);
INSERT INTO `exam_options` VALUES ('402fcafa1a5b69357e1ea9f51cc29e9a','9dd31d139cd942ea0f1f38dda477f8b4','A','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('403696fa8c9417c01c07bec44f89bb41','f826acb010412caeb52c0533453d2715','D',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('41e7f4a2969f73eacd5f6577bbf8a130','1d7582dabe8beafffea3710018fde675','A','&nbsp;睡不着','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('44aa356e6ab3d9300840086060a552ae','6f350a0ac61e1619c1a072e3da6236ca','A','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('44ee4cd16f210a288c0756ed769cc5ac','686946eb1251266452e6b3221c727cc6','C','&nbsp;会下雪','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('4825bdb38dcf2ed71c6e60d641d23f2f','f5f76d684c06bf944ef0a36926031fa5','B','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('4e5e36179e48244842dcf5e7f02b659d','1ef401e9a21761e01a12f157e4dece4f','C','&nbsp;要关心家人','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('507aca2f9081d68b05bf6036d40be73f','6d244838ba6681c2d70f2fb10b4bdc7f','A','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('514c8987dcde7b81abe8c228ad76edbb','6f350a0ac61e1619c1a072e3da6236ca','C','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('51e2ad10339105f8b407121675e1960b','9dd31d139cd942ea0f1f38dda477f8b4','E','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('51f9ec479563d4f31cb13b5265488d7a','9dd31d139cd942ea0f1f38dda477f8b4','D','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('53476744c170b8f61285723ed0c18fd9','a45ddad479f53b554f71cbde11195f5d','C.','星期日','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('538a32281aef70dcad401fb62d625107','fc54ca6c3c5ce1c1700d7ba33e41f823','A','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/201203161326403-1.jpg\" style=\"width: 88px; height: 135px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('571d310e37986193a890152867520a2f','14aa16d1ce54062b8b6db0185f2b71ec','B','&nbsp;太长','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('5810abc8e096dbe87c8c237f1b9cc17e','883547945c1b779eb79057f8d6879bcc','C．','表演','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('5a1b7c5bedea4a1ecd5b9f3e43a071db','89b4f96621a304994119634f175c2f16','A．','还在学习法语','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('5cd55e9374e20737fe54c82949e7c62b','72fc45e07e28ec9ed049a10607bbc736','D.','是来整顿业务的','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('5deef870ca2341faaa7ab4a7ec5b8dbc','1ef401e9a21761e01a12f157e4dece4f','A','&nbsp;不要做和别人一样的事','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('5f05086479ca43dda8fdccbc70c9143d','bf17c958a82d133742054ef601022bfe','C.','缺少经验','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('6119b37602ac58f82331c9247c127720','09e6274eaacf6aa3e0c2cfee87dcef29','A','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6353e5ad86ce75d380d002627186064e','a45ddad479f53b554f71cbde11195f5d','D.','晚上','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('63543de8f5d362a7f2d784246e66b472','d012a718a91a6ba1033949b016ec7987','C.','跟以前一样','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('68ef5b52c48523538955bcc0bf17fdc4','3fc232fec235129ba139ee9d26242064','A','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('692b50548c2d15bb09c52e199f2b1033','1d7582dabe8beafffea3710018fde675','C','&nbsp;起得太早了','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6b0a06599fe723516cc8390d13804b95','5e5db55bf920217b621dd21dc7468c7b','C','&nbsp;母亲','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6b8dc858a58ea401c44601e7617b16d1','f5f76d684c06bf944ef0a36926031fa5','D','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6bad3d028b07b1a3872e38f157da15f8','9cf15edd4ed0beaa3dcd1cda615a9e10','C','&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6c434050ca204e4b9f28858992b68895','f5f76d684c06bf944ef0a36926031fa5','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6cb75b44828ffc2e6d6094f8648e02b9','154d2dd2a3c9171f7e7255748d7ec752','D.','需要学习除草','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('6d3f525974c0244310fe8b5bd5cbca0e','09e6274eaacf6aa3e0c2cfee87dcef29','E','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('6e19ca15e934f7c151115c1ce38851b0','eb5681e29a9275067f74e096ec6085a8','A.','找他的毛病','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('70bd30e980e8e5fc4dbc490839defdca','c76e3b45cad6991f0bde6310e62d7adf','B.','退鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('71499757650af51f5cc4d29edf1391ff','5f63a965de9ab832c3c9cd0770d1eaa2','C.','朋友','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('72864e87734eb6c8cdcf753758acafac','9dd31d139cd942ea0f1f38dda477f8b4','C','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('75c2b3e82947e81c0f85ef0fa359acbb','ec46b75b19e4ea501bcaf4a467bc71b3','C.','等到秋天才铲除了无用的植物','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('76d17c552b4245728c4024c110e12a20','2d1ed0ec87bf7319b979d493339da0e7','A','&nbsp;接人','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('77d0f1578c0e2049cb702fd1604d102c','ff134aeffe763e8f0e2ad4e4c2a5b655','A.','男的昨天过生日','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('77ed4d493c41ad983e75884839e8cb08','731bab261409864769ac3a290a97a3ef','C',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('7a209672de883482a53a221fe860023e','e4fec7fe03470473c1d94276b2607d5b','B','&nbsp;十分骄傲','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('7a975c6d311f83794648cb9235aec0a0','316ee647db788c2d6b0c7b4dc99c9fd9','D',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('7ba280cb069ebfb67de85226f12cd285','5f63a965de9ab832c3c9cd0770d1eaa2','D.','房屋中介和顾客','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('7cc4939e3cc6b707716881a8f7f76387','7b13a9c1e65bcc9b8b40acba12d3e825','A.','&ldquo;杀人游戏&rdquo;在1998年传到了上海','','',NULL);
INSERT INTO `exam_options` VALUES ('7d57a3c369369a8dfe553bcf7dba86cc','af5c02577ea9eefd2712c46eb325a5e2','A','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('7ed6932a07597500cd224bd812a2bfa0','4b1901b4c562d6cada12e3ba06f9a3ab','B','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('7f8c032df2853f0dc863f24717841533','5f63a965de9ab832c3c9cd0770d1eaa2','A.','服务员和老板','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('821a8cd06b9beaa71cb2e95d15e9ce25','e4fec7fe03470473c1d94276b2607d5b','D','&nbsp;爱好历史','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('85d5f52753ae2efc2e576c3477f5ed0a','6f350a0ac61e1619c1a072e3da6236ca','B','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('86405cd2f6953e0acc1b3bbd8c888693','f826acb010412caeb52c0533453d2715','A',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('86bafcb9c33110e3a1f75bfb616b9c90','b55bdd3050bf94040a4ae13eb09cf279','A','<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/028ad9e9-835d-41b0-9a42-0ee587150599.png\" alt=\"\" height=\"36\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/028ad9e9-835d-41b0-9a42-0ee587150599.png\" width=\"102\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('8719bdf21617181547fa3b8fe5977200','6f350a0ac61e1619c1a072e3da6236ca','E','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('87a72ae1c1da59f64a53ecf95afa3dfe','ec46b75b19e4ea501bcaf4a467bc71b3','D.','院子里没有杂草','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('8815581446045de63a26305f6d5e99b5','316ee647db788c2d6b0c7b4dc99c9fd9','B',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('886f7951faa48cdd6883ceb9ab0b460c','c76e3b45cad6991f0bde6310e62d7adf','C.','换鞋','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('88c02c1933b7b41249d6fe2778542617','af5c02577ea9eefd2712c46eb325a5e2','D','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('8b95f9f655c9d5d8c3227b0287a8a0b1','af5c02577ea9eefd2712c46eb325a5e2','B','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('8e517935e0cd8e1f7716234ced54625e','6d244838ba6681c2d70f2fb10b4bdc7f','B','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/d6843e6b-a58c-4b9d-bc04-0f6c1f678b76.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('90ac0dcbddc168168681982bb4ea5dd4','757fe3ebbf877b963fa326e35c08ac39','A','&nbsp;迟到了','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('90c8beb1a6746df3af92ea671c886d40','9cf15edd4ed0beaa3dcd1cda615a9e10','A','&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('94ddcae91bb3b03ff63dcb73332496e9','b163af01dc6c92b168e18a2b75207328','D．','度过','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('95963b11f9faa62f4f19359f57c218d7','f826acb010412caeb52c0533453d2715','C',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('968bbfe315198e23ef27d39e7d7e5279','d012a718a91a6ba1033949b016ec7987','B.','请同事们聚餐','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('98002aaec00c8c72415a2fc5673d1dc1','1ef401e9a21761e01a12f157e4dece4f','B','&nbsp;有事情要早准备<br>\r\n','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('9802b35e7d093ed5bb7dd601fa5b1ec2','ec46b75b19e4ea501bcaf4a467bc71b3','B.','把牡丹当草给割了','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('99111fb9f1752cec709fe2269cf9d37f','09e6274eaacf6aa3e0c2cfee87dcef29','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('9bd515e28e8baed88f1f0d806495de65','1d7582dabe8beafffea3710018fde675','B','&nbsp;她很调皮','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('9bf9333447d17cb04bff8e50047d7cd9','316ee647db788c2d6b0c7b4dc99c9fd9','A',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('9cdb7623516535cddf3810b423504db9','ff134aeffe763e8f0e2ad4e4c2a5b655','C.','女的昨天很开心','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('9f29a5f3ba52838c7b1b8769fa7319be','9cf15edd4ed0beaa3dcd1cda615a9e10','E','&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('9f9cbb79c58c2ff6e32324d41afa5822','af5c02577ea9eefd2712c46eb325a5e2','E','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('a4a5680df1f21dddfef11d9400f7dc40','883547945c1b779eb79057f8d6879bcc','A．','出现','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('a4d0114c2106dfc5256ea4ec4b633a7c','fc54ca6c3c5ce1c1700d7ba33e41f823','B','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/201203161326593-2.jpg\" style=\"width: 81px; height: 135px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('a508f2e9720d2e83c0748305c0b7df10','6f350a0ac61e1619c1a072e3da6236ca','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('a5114885a57d2d69ad47cec872dd4b1b','af5c02577ea9eefd2712c46eb325a5e2','F','&nbsp;&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('a5297f6cb597122accbb9bb046763ef3','731bab261409864769ac3a290a97a3ef','D',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('a7d13e7cce6fa1aa927087664bf70949','09e6274eaacf6aa3e0c2cfee87dcef29','B','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('a89da1bec90c0f82d7300959d3707752','731bab261409864769ac3a290a97a3ef','B',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('a942e0088cf8af5f83349fc816ebcd0a','b1da5e629dfa1d71a14d2995d8757534','C','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('ac40f0ab333c3d3455e711664968a3d1','ceeeefe45e1cf10a2b12433c6cacc835','B','&nbsp;26岁','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('aed2f46576570f02c4748243b8826a9d','a45ddad479f53b554f71cbde11195f5d','B.','星期六','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('aed6626524baa628288e02ac45c27cfc','d012a718a91a6ba1033949b016ec7987','D.','比较保守','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('af130e5ea48c5f037c60a0a8e5687a34','9cf15edd4ed0beaa3dcd1cda615a9e10','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('af93ebff027155ca6544896b9f89dd39','b40fa6bfbad003bbf95779373eded2ed','D．','对待','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('b18d1e813dcbdd654a472af2e44d57d5','bf17c958a82d133742054ef601022bfe','B.','比较乐观','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('b42e91173a0a9f285719a9988bbaa8ab','9dd31d139cd942ea0f1f38dda477f8b4','B','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('b7447b1ad4d4b6410b8c4afbe1a4d273','48aae5f018a133f79b86293842853b6a','A','&nbsp; ','3d4a8d1500ce4194c2a55a65fe03f9d0','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('b9722ab8df9f057c3e7e382cbe0d254b','b163af01dc6c92b168e18a2b75207328','C．','征求','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('bb4523467b21df381364d7a8a0af5e57','eb5681e29a9275067f74e096ec6085a8','C.','比以前老实了','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('bdbf1186821e2149e07df5000058e771','7b13a9c1e65bcc9b8b40acba12d3e825','B.','&ldquo;杀人游戏&rdquo;起源于美国','','',NULL);
INSERT INTO `exam_options` VALUES ('be0c60dc5d75a91445034d5c37c15697','b1da5e629dfa1d71a14d2995d8757534','A','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('c005d970c3b654dc5b25a9467c299e0c','5f63a965de9ab832c3c9cd0770d1eaa2','B.','同事','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('c450c26a9f4ab4f9a2a57c269132a4ab','757fe3ebbf877b963fa326e35c08ac39','C','&nbsp;生气了','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('c586c54b39ebef435ef1bf0f3da435de','1ef401e9a21761e01a12f157e4dece4f','D','&nbsp;要经常交流','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('c5c3234f918455fc4a27664744efb3af','e4fec7fe03470473c1d94276b2607d5b','C','&nbsp;很瘦','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('c6597746cc7a2ea51dd14185feb49750','3a83973ca415748ba96fbe1833a8d508','A','他说的不对','dc7f4881e8f54fbffee689d1750918d2','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('c793018cf04efb9dd9a596e96be584a6','5e5db55bf920217b621dd21dc7468c7b','B','&nbsp;妻子','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('c906a63b05a5311ed74fa2bd85f0e10f','f826acb010412caeb52c0533453d2715','B',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('cad8fc1f89e728dd3f3c59c78daf78a1','883547945c1b779eb79057f8d6879bcc','B．','反映','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('cb68479507d31f26fa6db7722eb11952','b1da5e629dfa1d71a14d2995d8757534','B','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('cc66142d9e1fb87dd99445f09945ed84','4b1901b4c562d6cada12e3ba06f9a3ab','A','&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" alt=\"\" height=\"23\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/9c6c79a6-bd4b-4b5b-86d5-fa9ffae87d69.png\" width=\"33\">','aa8f48390a5d2f8b663bab4c45d2353e','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('ce4a41b303bb70693f6d867a73ac75d4','09e6274eaacf6aa3e0c2cfee87dcef29','D','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('d081b5ef68226f694094f75f52ed809a','b40fa6bfbad003bbf95779373eded2ed','B．','参考','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('d0fce6ab54897fa9b324e112f3b89a12','09e6274eaacf6aa3e0c2cfee87dcef29','C','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('d431bfa0aa77af614d43edad826b7879','b40fa6bfbad003bbf95779373eded2ed','A．','操心','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('d5fcf7e5c3f68be8b77485e9064bddba','89b4f96621a304994119634f175c2f16','D．','还没学够','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('dc3ca4ec03eed37238f3bb2343e32a16','154d2dd2a3c9171f7e7255748d7ec752','C.','应该买房子','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('dd06c2fcc6ddd91483373e2c30c71f45','b1da5e629dfa1d71a14d2995d8757534','D','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e04fdc7663b55b9cd654f81c4be76cc3','5e5db55bf920217b621dd21dc7468c7b','D','&nbsp;女儿','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e1353407f37a1582be4a37e7316c34b7','883547945c1b779eb79057f8d6879bcc','D．','反应','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('e353e805c5c8d5a3d6d075214206f1a6','686946eb1251266452e6b3221c727cc6','D','&nbsp;比今天冷','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e3c2c3c2c697050d590b60805392d2f1','b55bdd3050bf94040a4ae13eb09cf279','B','<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/c8daa775-388f-448b-ac97-a3a1ae6a720e.png\" alt=\"\" height=\"37\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/c8daa775-388f-448b-ac97-a3a1ae6a720e.png\" width=\"97\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e4757500bffd11ea06dc17004c28eb78','b40fa6bfbad003bbf95779373eded2ed','C．','面对','65b47490df50a244deef732e0e08a453','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('e6784c1312b991d971b4ff01c7b6e492','154d2dd2a3c9171f7e7255748d7ec752','A.','其中还有坏分子','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('e6e8fa2d03976c45157e6c290e74cb7e','5e5db55bf920217b621dd21dc7468c7b','A','&nbsp;丈夫','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e747d028334d1ab6ee8701fc8b935c98','6f350a0ac61e1619c1a072e3da6236ca','D','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('e9272a6f19b3d574d97e3b78bb9aee90','ff134aeffe763e8f0e2ad4e4c2a5b655','B.','女的送给他一个礼物','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('ee6e0863cf832c3d12bc35d090796afe','bb3ccaf7447a89f0ab228b6a9480719a','C.','昨天脚起泡了','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f0040fdbff9ae5e573046b1aadec7dba','7e5dedb222f9a4dbea78cb8e4c93d728','C.','男孩不知道自己为什么打电话','dfd5fae73161e965feb14c9bba26c4e4','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f06d89d5cc02207f203ad6f68ae2af2f','d012a718a91a6ba1033949b016ec7987','A.','开除了坏分子','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f1bfb7aa71c6b4069745e82a337ce02e','eb5681e29a9275067f74e096ec6085a8','D.','打算辞职','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f322e30bf373c93e24e123fc48fb1269','fc54ca6c3c5ce1c1700d7ba33e41f823','C','<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/201203161327183-3.jpg\" style=\"width: 108px; height: 126px\">','9e0d82593cb53f44f1cb93a41a205ee7','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('f599c08cd1d55f0b06a149afd8559439','b1da5e629dfa1d71a14d2995d8757534','F','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('f607459691f273c842f7b3667823c162','72fc45e07e28ec9ed049a10607bbc736','A.','是老实人','d89049ffb296f8a37708e450e7c81df2','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f6733e24958761f81ac2b80aff150620','bb3ccaf7447a89f0ab228b6a9480719a','D.','不满意女的的服务态度','576e1e5ce9ed1651ec2b08c280278e31','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('f7860db23c6db605e9cae7d953eac53e','316ee647db788c2d6b0c7b4dc99c9fd9','C',NULL,'b4c1afe9a9cef05051304740b01d7953','2359c735e0f074f460df9052d8578d77',NULL);
INSERT INTO `exam_options` VALUES ('f7ac5479caa0c3a7e79fb8a69361b865','686946eb1251266452e6b3221c727cc6','A','&nbsp;多云','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('f942a8b5632a2087bd20e4cf72e2e39b','14aa16d1ce54062b8b6db0185f2b71ec','A','&nbsp;太阳','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('f9b17400c98400b6a6893546a3426a67','b1da5e629dfa1d71a14d2995d8757534','E','&nbsp;&nbsp; ','4436ea81095c59d20be19fc573e342f8','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('fa011131b9a9dd8a98dc997ef7f71bf8','7b13a9c1e65bcc9b8b40acba12d3e825','D.','&ldquo;杀人游戏&rdquo;只在大城市流行','dfd5fae73161e965feb14c9bba26c4e4','6dd7cdaeef61743992fa027e07e18490',NULL);
INSERT INTO `exam_options` VALUES ('fc08022866daea22e54ad91362cd85c8','ceeeefe45e1cf10a2b12433c6cacc835','C','&nbsp;15岁','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('fd22c5a68151a7d2dbb55887f3bf3743','e4fec7fe03470473c1d94276b2607d5b','A','&nbsp;个子矮','238cbda0ec6bf6ae4dd56cc82ad7132c','713ee95748e72247b78bf94fb52470e5',NULL);
INSERT INTO `exam_options` VALUES ('fdbd818469dd736689748d02e34a0de1','237d6d0c38e5715649ecc11c02ba70ea','2','test','dc7f4881e8f54fbffee689d1750918d2','125555585821',NULL);
INSERT INTO `exam_options` VALUES ('ffdf73153a483ec23cb42eaa4398a6dd','89b4f96621a304994119634f175c2f16','C．','早就不学习了','16c0b3c0cafc0826f80a5125399f28f7','6dd7cdaeef61743992fa027e07e18490',NULL);
/*!40000 ALTER TABLE `exam_options` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_order
#

DROP TABLE IF EXISTS `exam_order`;
CREATE TABLE `exam_order` (
  `order_id` varchar(32) NOT NULL,
  `order_status_id` varchar(2) DEFAULT NULL,
  `stu_id` varchar(32) DEFAULT NULL COMMENT '学号',
  `publish_id` varchar(32) DEFAULT NULL COMMENT '发布ID',
  `order_code` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_total_sum` float(8,2) DEFAULT NULL COMMENT '订单总金额',
  `order_total_point` int(11) DEFAULT NULL COMMENT '积分赠送总数',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单';

#
# Dumping data for table exam_order
#

LOCK TABLES `exam_order` WRITE;
/*!40000 ALTER TABLE `exam_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_order` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_order_items
#

DROP TABLE IF EXISTS `exam_order_items`;
CREATE TABLE `exam_order_items` (
  `item_id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `item_single_price` float(8,2) DEFAULT NULL,
  `item_buy_num` int(11) DEFAULT NULL,
  `item_price_sum` float(8,2) DEFAULT NULL,
  `item_single_point` int(11) DEFAULT NULL,
  `item_point_sum` int(11) DEFAULT NULL,
  `item_remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单项';

#
# Dumping data for table exam_order_items
#

LOCK TABLES `exam_order_items` WRITE;
/*!40000 ALTER TABLE `exam_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_order_items` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_order_status
#

DROP TABLE IF EXISTS `exam_order_status`;
CREATE TABLE `exam_order_status` (
  `order_status_id` varchar(2) NOT NULL,
  `user_status_name` varchar(100) DEFAULT NULL,
  `user_status_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_order_status
#

LOCK TABLES `exam_order_status` WRITE;
/*!40000 ALTER TABLE `exam_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_order_status` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_paper
#

DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE `exam_paper` (
  `paper_id` varchar(32) NOT NULL COMMENT '试卷ID',
  `subject_id` varchar(32) DEFAULT NULL COMMENT '科目编码',
  `paper_name` varchar(200) DEFAULT NULL COMMENT '试卷名称',
  `paper_listening_file` varchar(255) DEFAULT NULL COMMENT '听力文件',
  `paper_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `paper_question_num` int(11) DEFAULT NULL COMMENT '试题数量',
  `paper_exam_time` int(11) DEFAULT NULL COMMENT '答题时间',
  `paper_notice` varchar(2000) DEFAULT NULL COMMENT '注意事项',
  PRIMARY KEY (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考试试卷表';

#
# Dumping data for table exam_paper
#

LOCK TABLES `exam_paper` WRITE;
/*!40000 ALTER TABLE `exam_paper` DISABLE KEYS */;
INSERT INTO `exam_paper` VALUES ('2359c735e0f074f460df9052d8578d77','5533792ee535d26559e20352382538f7','测试一级','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/20110323102153474188.wma','2012-02-24 15:03:20',90,100,'测试一级');
INSERT INTO `exam_paper` VALUES ('46f5e3f329dfe4b581561ad4b69dbb05','5533792ee535d26559e20352382538f7','测试修改路径','http://192.168.0.237:5080/Hsk_Media/streams/papers/46f5e3f329dfe4b581561ad4b69dbb05/新建 文本文档.txt','2012-03-13 14:52:11',11,11,'11');
INSERT INTO `exam_paper` VALUES ('6dd7cdaeef61743992fa027e07e18490','114626f11813b9ac2def1b1cdf12e2dc','HSK5级标准试卷','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/hsk5.zip','2012-02-23 09:45:18',96,110,'HSK5级标准试卷');
INSERT INTO `exam_paper` VALUES ('713ee95748e72247b78bf94fb52470e5','52a523974603930996af50cc088e4d17','试题样板','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/综合 听力音频.zip','2012-03-16 10:47:35',55,60,'试题样板');
/*!40000 ALTER TABLE `exam_paper` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_paper_comment
#

DROP TABLE IF EXISTS `exam_paper_comment`;
CREATE TABLE `exam_paper_comment` (
  `paper_comm_id` varchar(32) NOT NULL,
  `publish_id` varchar(32) DEFAULT NULL COMMENT '发布ID',
  `stu_id` varchar(32) DEFAULT NULL COMMENT '学号',
  `paper_comm_content` varchar(2000) DEFAULT NULL,
  `paper_comm_star` varchar(3) DEFAULT NULL,
  `paper_comm_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`paper_comm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_paper_comment
#

LOCK TABLES `exam_paper_comment` WRITE;
/*!40000 ALTER TABLE `exam_paper_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_paper_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_paper_publish
#

DROP TABLE IF EXISTS `exam_paper_publish`;
CREATE TABLE `exam_paper_publish` (
  `publish_id` varchar(32) NOT NULL COMMENT '发布ID',
  `paper_id` varchar(32) DEFAULT NULL COMMENT '试卷ID',
  `paper_pub_status_id` varchar(2) DEFAULT NULL,
  `publish_name` varchar(200) DEFAULT NULL COMMENT '发布名称，对于单张试卷默认试卷名称',
  `publish_paper_price` float(8,2) DEFAULT NULL COMMENT '试卷价格，继承自科目中的参考价格，可以自行修改',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_type` varchar(8) DEFAULT NULL COMMENT '发布类型（01-单张试卷，02-打包试卷）',
  `publish_have_parse` char(1) DEFAULT '0' COMMENT '是否有解析（0-无，1-是）',
  `publish_have_read` char(1) DEFAULT '0' COMMENT '是否有阅卷（0-无，1-是）',
  `publish_point_num` int(11) DEFAULT NULL,
  `publish_buy_times` int(11) DEFAULT NULL,
  `publish_remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`publish_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试卷发布\r\n试卷只有发布以后才能够被考生看到和使用';

#
# Dumping data for table exam_paper_publish
#

LOCK TABLES `exam_paper_publish` WRITE;
/*!40000 ALTER TABLE `exam_paper_publish` DISABLE KEYS */;
INSERT INTO `exam_paper_publish` VALUES ('830fb1f7e3e1332b6a83bedb0042fa93','2359c735e0f074f460df9052d8578d77','1','测试一级--发布',100,'2012-02-27 10:39:04','01','1','1',10,10,'测试一级--发布');
INSERT INTO `exam_paper_publish` VALUES ('c2bba5c4d76900e99685ed51db8a1fda','6dd7cdaeef61743992fa027e07e18490','1','HSK5级标准试卷-发布',120,'2012-02-27','01','1','1',11,11,'测试测试');
INSERT INTO `exam_paper_publish` VALUES ('f5fbd97e47158534ca58583099043e57','2359c735e0f074f460df9052d8578d77','1','测试一级--发布',25,'2012-02-27 16:42:42','01','0','1',10,10,'测试一级--发布');
/*!40000 ALTER TABLE `exam_paper_publish` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_paper_publish_status
#

DROP TABLE IF EXISTS `exam_paper_publish_status`;
CREATE TABLE `exam_paper_publish_status` (
  `paper_pub_status_id` varchar(2) NOT NULL,
  `paper_pub_status_name` varchar(100) DEFAULT NULL,
  `paper_pub_status_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paper_pub_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_paper_publish_status
#

LOCK TABLES `exam_paper_publish_status` WRITE;
/*!40000 ALTER TABLE `exam_paper_publish_status` DISABLE KEYS */;
INSERT INTO `exam_paper_publish_status` VALUES ('0','禁用','试卷未上架');
INSERT INTO `exam_paper_publish_status` VALUES ('1','启用','试卷上架');
/*!40000 ALTER TABLE `exam_paper_publish_status` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_paper_strut
#

DROP TABLE IF EXISTS `exam_paper_strut`;
CREATE TABLE `exam_paper_strut` (
  `paper_strut_id` varchar(32) NOT NULL,
  `subject_struct_id` varchar(32) DEFAULT NULL,
  `paper_id` varchar(32) DEFAULT NULL COMMENT '试卷ID',
  `paper_strut_name` varchar(100) DEFAULT NULL,
  `paper_strut_content` varchar(2000) DEFAULT NULL,
  `paper_strut_seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_strut_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试卷结构';

#
# Dumping data for table exam_paper_strut
#

LOCK TABLES `exam_paper_strut` WRITE;
/*!40000 ALTER TABLE `exam_paper_strut` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_paper_strut` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_question_parse
#

DROP TABLE IF EXISTS `exam_question_parse`;
CREATE TABLE `exam_question_parse` (
  `parse_id` varchar(32) NOT NULL COMMENT '试题解析ID',
  `ques_id` varchar(32) NOT NULL DEFAULT '',
  `parse_type` varchar(10) DEFAULT NULL COMMENT '解析类别（video和txt）',
  `parse_content` text COMMENT '文字解析内容',
  `parse_file` varchar(255) DEFAULT NULL COMMENT '视频解析文件（视频文件存放路径）',
  `parse_width` int(11) DEFAULT NULL COMMENT '视频宽度（像素）',
  `parse_height` int(11) DEFAULT NULL COMMENT '视频高度（像素）',
  `parse_state` varchar(2) DEFAULT NULL COMMENT '解析的状态（00-普通发布状态；01-停用状态；02-标记删除状态）',
  `paper_id` varchar(32) NOT NULL DEFAULT '' COMMENT '试卷id',
  `struct_id` varchar(32) NOT NULL DEFAULT '' COMMENT '科目结构id',
  PRIMARY KEY (`parse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试题解析';

#
# Dumping data for table exam_question_parse
#

LOCK TABLES `exam_question_parse` WRITE;
/*!40000 ALTER TABLE `exam_question_parse` DISABLE KEYS */;
INSERT INTO `exam_question_parse` VALUES ('5101b063829a0af167346bb1f33f4857','63bf043f0e6c4800d0c7755335b37bde','txt','\t\t\t\t\t\t',NULL,NULL,NULL,'00','2359c735e0f074f460df9052d8578d77','dc7f4881e8f54fbffee689d1750918d2');
INSERT INTO `exam_question_parse` VALUES ('83505939795366bdf760809fdad72cbc','63bf043f0e6c4800d0c7755335b37bde','txt','\t\t\t\t\t\t',NULL,NULL,NULL,'00','2359c735e0f074f460df9052d8578d77','dc7f4881e8f54fbffee689d1750918d2');
INSERT INTO `exam_question_parse` VALUES ('a8ab6eb77b4fdff99c88d107ebb2dda8','f826acb010412caeb52c0533453d2715','txt','分俄方哦的份额分的话',NULL,NULL,NULL,'00','2359c735e0f074f460df9052d8578d77','b4c1afe9a9cef05051304740b01d7953');
INSERT INTO `exam_question_parse` VALUES ('b2e6e173627e36f6d21a0403acf67669','3a83973ca415748ba96fbe1833a8d508','txt','\t\t\t\t\t\t',NULL,NULL,NULL,'00','2359c735e0f074f460df9052d8578d77','dc7f4881e8f54fbffee689d1750918d2');
INSERT INTO `exam_question_parse` VALUES ('bbd8f3f017f34acc811dae0c2768ff56','316ee647db788c2d6b0c7b4dc99c9fd9','video',NULL,'http://192.168.0.237/HskPic/papers/2359c735e0f074f460df9052d8578d77/parse/316ee647db788c2d6b0c7b4dc99c9fd9/201203141627082.flv',11,11,'00','2359c735e0f074f460df9052d8578d77','b4c1afe9a9cef05051304740b01d7953');
/*!40000 ALTER TABLE `exam_question_parse` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_question_sum
#

DROP TABLE IF EXISTS `exam_question_sum`;
CREATE TABLE `exam_question_sum` (
  `ques_id` varchar(32) DEFAULT NULL,
  `ques_sum_id` varchar(32) DEFAULT NULL,
  `ques_sum_total_times` int(11) DEFAULT NULL,
  `ques_sum_correct_times` int(11) DEFAULT NULL,
  `ques_sum_error_times` int(11) DEFAULT NULL,
  `ques_sum_correct_rate` float DEFAULT NULL,
  `ques_sum_error_rate` float DEFAULT NULL,
  `ques_sum_last_update` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='对每一个客观题的对错和错误率进行记录';

#
# Dumping data for table exam_question_sum
#

LOCK TABLES `exam_question_sum` WRITE;
/*!40000 ALTER TABLE `exam_question_sum` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_question_sum` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_question_type
#

DROP TABLE IF EXISTS `exam_question_type`;
CREATE TABLE `exam_question_type` (
  `ques_type_id` varchar(2) NOT NULL,
  `ques_type_name` varchar(100) DEFAULT NULL,
  `ques_type_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ques_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试题题型';

#
# Dumping data for table exam_question_type
#

LOCK TABLES `exam_question_type` WRITE;
/*!40000 ALTER TABLE `exam_question_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_question_type` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_questions
#

DROP TABLE IF EXISTS `exam_questions`;
CREATE TABLE `exam_questions` (
  `ques_id` varchar(32) NOT NULL,
  `paper_id` varchar(32) DEFAULT NULL COMMENT '试卷ID',
  `ques_type_id` varchar(2) DEFAULT NULL,
  `ques_parent_id` varchar(32) DEFAULT NULL,
  `ques_title` varchar(1000) DEFAULT NULL,
  `ques_content` longtext,
  `ques_start_time` int(11) DEFAULT NULL,
  `ques_end_time` int(11) DEFAULT NULL,
  `ques_question_num` int(11) DEFAULT NULL,
  `ques_type` char(2) DEFAULT NULL COMMENT '题型编码（01综合题、02选择题、03填空题）',
  `ques_num` varchar(50) DEFAULT NULL,
  `ques_answer` varchar(200) DEFAULT NULL COMMENT '试题答案',
  `ques_dry_sign` varchar(2) DEFAULT NULL COMMENT '试题题干标志（00代表题干，01代表试题）',
  `ques_example_sign` varchar(2) NOT NULL DEFAULT '0' COMMENT '试题例题标志（00例题，01非例题）',
  `ques_read_time` int(11) DEFAULT NULL COMMENT '看题时间（只针对6级缩写题）',
  `ques_answer_time` int(11) DEFAULT NULL COMMENT '答题时间（只针对6级缩写题）',
  `ques_opt_column` int(11) DEFAULT NULL COMMENT '试题选项显示列',
  `ques_drag_sign` varchar(2) NOT NULL DEFAULT '00',
  `ques_allow_char` varchar(20) DEFAULT NULL,
  `ques_listen_text` varchar(2000) DEFAULT NULL,
  `subject_struct_id` varchar(32) NOT NULL DEFAULT '' COMMENT '科目结构编码',
  `ques_listen_url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ques_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试卷试题';

#
# Dumping data for table exam_questions
#

LOCK TABLES `exam_questions` WRITE;
/*!40000 ALTER TABLE `exam_questions` DISABLE KEYS */;
INSERT INTO `exam_questions` VALUES ('03a75ce0fc02a8f14a63b861ef6a399a','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'<br>\r\n&nbsp;<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/6d51fb50-1581-4e4d-bd18-4286382723e4.png\" alt=\"\" height=\"204\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/6d51fb50-1581-4e4d-bd18-4286382723e4.png\" width=\"286\">',NULL,NULL,NULL,'03','49',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'8a553fab2d502a372fad52d0802bf3cb','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('09e6274eaacf6aa3e0c2cfee87dcef29','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'',NULL,NULL,NULL,'01','10',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('0bd4adbf672230dd8140d8a8e05e6dc8','2359c735e0f074f460df9052d8578d77','02','root',NULL,'选择',NULL,NULL,NULL,'02','3',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('0d65f67a7422212a2602d68d80168395','713ee95748e72247b78bf94fb52470e5','01','3000e1b41dc8f6d12274a2adcefb60a4',NULL,'',NULL,NULL,NULL,'01','28',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('0fbc0ee0e1c4c8ace9bdd719788f1d7d','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'月季花月月盛开，又叫月月红、月月花，被誉为&ldquo;花中皇后&rdquo;。月季花原产中国，已有千年以上的历史，是中国十大名花之一。月季品种众多，目前已达两万种。它的花、根和叶都有药用功能，能够活血化瘀.',NULL,NULL,NULL,'02','65',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/65');
INSERT INTO `exam_questions` VALUES ('14796066319da695653dfe8337b20cf5','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'[drag]很拥挤[/drag][drag]地铁里[/drag][drag]那时候[/drag][drag]一定[/drag]',NULL,NULL,NULL,'02','48',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'8a1bb540d29c4c1cabab8813c60a5827','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('14aa16d1ce54062b8b6db0185f2b71ec','713ee95748e72247b78bf94fb52470e5','01','5de6215004818be81221507b5acaaaae',NULL,'',NULL,NULL,NULL,'01','17',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/15-18.mp3');
INSERT INTO `exam_questions` VALUES ('150a0334502f3e32a0273569de687019','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'吉祥物往往<u>&nbsp;&nbsp; 46&nbsp;&nbsp; </u>了民族文化的特性。要生活，必需先生存，而&ldquo;逢祥瑞，求吉利&rdquo;亦是人之常情。古人常常<u>&nbsp;&nbsp; 47&nbsp;&nbsp; </u>不可知或突如其来的灾害，他们为了要在这种艰苦的条件下生存，便要小心翼翼地规避各种灾祸和苦难，竭力<u>&nbsp;&nbsp; 48&nbsp;&nbsp; </u>吉祥、平安和幸福的生活。',11,11,NULL,'01','46-48',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453',NULL);
INSERT INTO `exam_questions` VALUES ('154d2dd2a3c9171f7e7255748d7ec752','6dd7cdaeef61743992fa027e07e18490','','ba65e5661ee1f831fadb587b4e21ef89',NULL,'新主管认为参加聚餐的同事：',0,0,NULL,'','75',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('1923d1c41cdc5ea8df2b3f2e2b80d838','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','15',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('19a607613094476b6f7c4446c5827f32','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]扔掉了[/drag][drag]都[/drag][drag]那些桔子[/drag][drag]被[/drag][drag]妈妈[/drag]',NULL,NULL,NULL,'03','98',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/98');
INSERT INTO `exam_questions` VALUES ('1ab6ed3e3b5a7385fc6daacf78e2cfc0','2359c735e0f074f460df9052d8578d77','02','root',NULL,'.请选择正确答案，并填写到空格里',NULL,NULL,NULL,'02','5',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('1bc06ac3134d6ed9673abaafc585648e','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/0af9a140-e6d6-4d16-8086-eb66fc1664fc.png\" alt=\"\" height=\"820\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/0af9a140-e6d6-4d16-8086-eb66fc1664fc.png\" width=\"707\">',NULL,NULL,NULL,'01','47',NULL,'00','0',3,3,NULL,'00',NULL,NULL,'f17fe68c45f579646a00a2ea9e085032','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('1bfe2454e8d84691564481263fd1c8bf','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'&nbsp;请选出正确答案：&nbsp;<br>\r\n年轻人刚刚进入社会的时候，不要太急着赚钱，不要眼睛里只有工资和奖金。实际上，正确的做法应该是，在工作的前几年，重点要丰富自己的工作经验，学习与同事们交流的方法，积累专业的知识和技术，还有，要懂得什么是职业的态度等。这些比收入重要多了。',NULL,NULL,NULL,'01','32-33',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'be4a5ec971f055e68fe885755ca5c8ca','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('1d7582dabe8beafffea3710018fde675','713ee95748e72247b78bf94fb52470e5','01','5de6215004818be81221507b5acaaaae',NULL,'',NULL,NULL,NULL,'01','16',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/15-18.mp3');
INSERT INTO `exam_questions` VALUES ('1e0b17b16d6d40bdd40d65f4fd59ce87','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','6',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('1e0dba7c7746b39436c167177076e3de','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','24',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/24.wma');
INSERT INTO `exam_questions` VALUES ('1e9386c33dea6c1328abb2707acf9e1b','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'85岁离休后，周有光开博客、写文章，20年时间竟有十几本著作<u>&nbsp;&nbsp;&nbsp; 57&nbsp; &nbsp;</u>，永葆学习的热情和充满活力的思考，令人<u>&nbsp;&nbsp;&nbsp; 58&nbsp; &nbsp;</u>。如今，106岁的他每天端坐在书房里那张黄色小书桌前，读书、写作、会客。老先生满面泛出红润的光泽，讲起话来思路清晰、中气十足；<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 59&nbsp; &nbsp; &nbsp;&nbsp; </u>，手不抖、气不喘。爱讲笑话的他，讲着讲着就会像孩童一样笑出声来，一只手还会不由自主地<u>&nbsp;&nbsp; 60 &nbsp; </u>在嘴前，好像很不好意思笑成这样.',NULL,NULL,NULL,'01','57-60',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/57-60');
INSERT INTO `exam_questions` VALUES ('1ef401e9a21761e01a12f157e4dece4f','713ee95748e72247b78bf94fb52470e5','01','5de6215004818be81221507b5acaaaae',NULL,'',NULL,NULL,NULL,'01','18',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/15-18.mp3');
INSERT INTO `exam_questions` VALUES ('2016ee19b888fd990059d2c099e45b2a','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'[drag]很拥挤[/drag][drag]地铁里[/drag][drag]那时候[/drag][drag]一定[/drag]',0,0,NULL,'02','91',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/');
INSERT INTO `exam_questions` VALUES ('22ea5e4907dad29635f3442deb4bbea0','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'',NULL,NULL,NULL,'01','34-36',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/34-36.wma');
INSERT INTO `exam_questions` VALUES ('23191deacd920847b2dd6d66ac484260','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'<p><br>\r\n选词填空：<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 高中生与初中生相比，在做出判断和决定前能更多地____各种事实和可能性，____行动的各种可能后果，决定一旦做出也能更&nbsp;____ 地见诸行动。</p>\r\n',NULL,NULL,NULL,'03','29',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('2567298452edc08b99f652ce355648e6','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','21',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'0ae1ea8be424e93d28667302a7fbc538','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/21.wma');
INSERT INTO `exam_questions` VALUES ('28640292ae30b27e2f3ffcb6fd3d337a','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'朝鲜族，中国少数民族之一。现有人口192万余人。主要分布在吉林、黑龙江、辽宁三省和内蒙古自治区。吉林省延边朝鲜族自治州是最大的聚居区，1990年有朝鲜族82万余人，占全州总人口的近40％。',NULL,NULL,NULL,'02','68',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/68');
INSERT INTO `exam_questions` VALUES ('2b258ff6bd7dc5fbb4ee98f263cc969b','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'',NULL,NULL,NULL,'01','37-39',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/37-39.wma');
INSERT INTO `exam_questions` VALUES ('2d1ed0ec87bf7319b979d493339da0e7','713ee95748e72247b78bf94fb52470e5','01','ad677f547ff17ab12bd8502df13edc70',NULL,'&nbsp;<br>\r\n',NULL,NULL,NULL,'01','13',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/13-14.mp3');
INSERT INTO `exam_questions` VALUES ('3000e1b41dc8f6d12274a2adcefb60a4','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'&nbsp;\r\n<p>选词填空：<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/775c27a0-35ef-46ff-857d-6eb99d192667.png\" alt=\"\" height=\"75\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/775c27a0-35ef-46ff-857d-6eb99d192667.png\" width=\"719\"></p>\r\n',NULL,NULL,NULL,'01','26-28',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('316ee647db788c2d6b0c7b4dc99c9fd9','2359c735e0f074f460df9052d8578d77','03','root',NULL,'',NULL,NULL,NULL,'03','11',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'b4c1afe9a9cef05051304740b01d7953','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/11.wma');
INSERT INTO `exam_questions` VALUES ('320d2b543f3e2f11d86c7dfe32e89bd2','2359c735e0f074f460df9052d8578d77','03','root',NULL,'填空',NULL,NULL,NULL,'03','2',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('35c1f1c37becc60dad86e4be21c2efae','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'请结合这张图片写一篇80字左右的短文。<br>\r\n<img alt=\"\" src=\"http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/20120229172956write.jpg\" style=\"width: 160px; height: 160px\">',NULL,NULL,NULL,'03','100',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'5429db56fa68a70efc3587a66846dc91','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/100');
INSERT INTO `exam_questions` VALUES ('37b5ce8b1a389dae7f639a0077bc38d8','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'.<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2012031611565801.jpg\" style=\"width: 88px; height: 112px\">',NULL,NULL,NULL,'02','1',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'483b98b8d0f4b73d9d88b14adb60b364','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/1.mp3');
INSERT INTO `exam_questions` VALUES ('3a83973ca415748ba96fbe1833a8d508','2359c735e0f074f460df9052d8578d77','02','root',NULL,'',NULL,NULL,NULL,'02','1',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dc7f4881e8f54fbffee689d1750918d2','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/1.wma');
INSERT INTO `exam_questions` VALUES ('3b2aca3222358060efb63ef1bd3cc585','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','8',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('3cf34fdd59b0d4d3a08f2cd6e24ee99a','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','14',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('3d39fb543eb54202e4f03374ba3e83bd','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','9',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('3fc232fec235129ba139ee9d26242064','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'&nbsp;我的作业早就完成了。',NULL,NULL,NULL,'01','21',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('430ede7495aae218c44a97c3942ff841','713ee95748e72247b78bf94fb52470e5','01','3000e1b41dc8f6d12274a2adcefb60a4',NULL,'',NULL,NULL,NULL,'01','27',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('48aae5f018a133f79b86293842853b6a','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'',NULL,NULL,NULL,'01','25',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('4b1901b4c562d6cada12e3ba06f9a3ab','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'&nbsp;<br>\r\n请判断图片与单词是否一致',NULL,NULL,NULL,'02','例题4',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'aa8f48390a5d2f8b663bab4c45d2353e','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('588741d937d110e22f743b220952d8a7','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'<br>\r\n请结合下列词语（要全部使用），写一篇80字左右的短文。<br>\r\n[drag]志愿者[/drag][drag]业余[/drag][drag]温暖[/drag][drag]为了[/drag][drag]行动[/drag]&nbsp;',NULL,NULL,NULL,'03','50',NULL,'01','0',NULL,NULL,NULL,'01',NULL,NULL,'8a553fab2d502a372fad52d0802bf3cb','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('59b5711b0ab019557690a2f3ad2e6080','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]我要[/drag][drag]强调[/drag][drag]特别[/drag][drag]一下儿[/drag]',NULL,NULL,NULL,'03','96',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/96');
INSERT INTO `exam_questions` VALUES ('5a35e78a4580abc7c8cf0ca9be82910d','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','16',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('5de6215004818be81221507b5acaaaae','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'根据下列一段采访，请选出正确答案：',NULL,NULL,NULL,'01','15-18',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/15-18.mp3');
INSERT INTO `exam_questions` VALUES ('5e069a87387d07e01218685c3ee06ab0','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'俗话说：&ldquo;开门七件事，柴米油盐酱醋茶&rdquo;，盐对于每家每户每个人来说，是天天餐餐不可或缺的生活必需品。盐不仅是重要的调味品，也是维持人体正常发育不可缺少的物质。但每天吃多少才合理呢？营养专家说，按照国际标准，一个成年人每天的盐分摄入量大约是３～６克。',NULL,NULL,NULL,'02','69',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/69');
INSERT INTO `exam_questions` VALUES ('5e5db55bf920217b621dd21dc7468c7b','713ee95748e72247b78bf94fb52470e5','01','5de6215004818be81221507b5acaaaae',NULL,'',NULL,NULL,NULL,'01','15',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/15-18.mp3');
INSERT INTO `exam_questions` VALUES ('5eb30bf6e50de1023453904ac836ea32','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','1',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/1.wma');
INSERT INTO `exam_questions` VALUES ('5f55f5360923304048a23cfebd804fe4','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2012031614400911-1.jpg\" style=\"width: 175px; height: 85px\"><br>\r\nfēijī<br>\r\n飞机',NULL,NULL,NULL,'02','19',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'aa8f48390a5d2f8b663bab4c45d2353e','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('5f63a965de9ab832c3c9cd0770d1eaa2','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','21',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/21.wma');
INSERT INTO `exam_questions` VALUES ('633f9d50878c9a750183d03432aed638','2359c735e0f074f460df9052d8578d77','01','root',NULL,'综合',NULL,NULL,NULL,'01','1',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('63bf043f0e6c4800d0c7755335b37bde','2359c735e0f074f460df9052d8578d77','03','root',NULL,'',NULL,NULL,NULL,'03','2',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dc7f4881e8f54fbffee689d1750918d2','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/2.wma');
INSERT INTO `exam_questions` VALUES ('65b35fd8f4992aa90b1553d254ff60e8','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'',NULL,NULL,NULL,'01','31-33',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/31-33.wma');
INSERT INTO `exam_questions` VALUES ('686946eb1251266452e6b3221c727cc6','713ee95748e72247b78bf94fb52470e5','01','ad677f547ff17ab12bd8502df13edc70',NULL,'<br>\r\n',NULL,NULL,NULL,'01','14',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/13-14.mp3');
INSERT INTO `exam_questions` VALUES ('6c27e3559de4a10a7a86033a4259308f','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]买的是[/drag][drag]机票[/drag][drag]往返[/drag][drag]老板[/drag]',NULL,NULL,NULL,'03','95',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/95');
INSERT INTO `exam_questions` VALUES ('6c48dcbc3dd3d4ff96c2b62570d8eac6','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]请将[/drag][drag]调高[/drag][drag]温度[/drag][drag]一点儿[/drag][drag]再[/drag]',NULL,NULL,NULL,'03','94',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/94');
INSERT INTO `exam_questions` VALUES ('6c9de3453799b7daaf4af70cd655fa69','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'&nbsp;请根据文章内容选出正确的选项：<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/7018e4d4-7020-4a61-b62e-757d6728269a.png\" alt=\"\" height=\"425\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/7018e4d4-7020-4a61-b62e-757d6728269a.png\" width=\"707\">',NULL,NULL,NULL,'01','43-46',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'1df2fe8702f427a280405b07a29943a0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('6d244838ba6681c2d70f2fb10b4bdc7f','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/3e858628-b5f6-432b-8dd6-8493c249c088.png\" alt=\"\" height=\"158\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/3e858628-b5f6-432b-8dd6-8493c249c088.png\" width=\"576\">',NULL,NULL,NULL,'02','20',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'aa8f48390a5d2f8b663bab4c45d2353e','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('6f350a0ac61e1619c1a072e3da6236ca','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'',NULL,NULL,NULL,'01','8',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('706794a10e163829fcb5a29de4c8f3ea','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'请根据短文内容，选出正确的选项：<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/98cb6975-67b8-4f62-b9aa-b8e9d3dd6ecd.png\" alt=\"\" height=\"201\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/98cb6975-67b8-4f62-b9aa-b8e9d3dd6ecd.png\" width=\"728\">',NULL,NULL,NULL,'01','35-37',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'1df2fe8702f427a280405b07a29943a0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('72fc45e07e28ec9ed049a10607bbc736','6dd7cdaeef61743992fa027e07e18490','','ba65e5661ee1f831fadb587b4e21ef89',NULL,'单位里调来的新主管：',0,0,NULL,'','71',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('731bab261409864769ac3a290a97a3ef','2359c735e0f074f460df9052d8578d77','02','root',NULL,'',NULL,NULL,NULL,'02','13',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'b4c1afe9a9cef05051304740b01d7953','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/13.wma');
INSERT INTO `exam_questions` VALUES ('757fe3ebbf877b963fa326e35c08ac39','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'',NULL,NULL,NULL,'02','5.',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'9e0d82593cb53f44f1cb93a41a205ee7','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/5.mp3');
INSERT INTO `exam_questions` VALUES ('764ff2cb0fca297dc52e4987f4fc9ecd','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'选词填空：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 电影最大的乐趣，在于营造出一个独具____的光影世界，在这个世界里，不仅可以使人得到&nbsp;____ 和娱乐，更可以有所感悟和回味，充分____到&ldquo;电影是浓缩的人生&rdquo;这一特点。',NULL,NULL,NULL,'03','30',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('7b13a9c1e65bcc9b8b40acba12d3e825','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'据称，&ldquo;杀人游戏&rdquo;是一种纸牌游戏，起源于上世纪70年代，有的记载说是1969年，甚至更早。麦克先生和他的同伴开始在美国佛蒙特玩一个叫&ldquo;杀人&rdquo;的游戏。在1998年9月15日，&ldquo;杀人游戏&rdquo;被带到了普林斯顿大学，并从9月24日开始成为一项经常进行的游戏活动。在1999年，由硅谷归国的留学生第一次传到了上海，并于该年年底在一次IT界的媒体见面会上传到了北京，从此开始了它在中国大中型城市年轻人中的传播之旅。',0,0,NULL,'02','62',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4',NULL);
INSERT INTO `exam_questions` VALUES ('7e5dedb222f9a4dbea78cb8e4c93d728','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'一个替人割草的男孩给一位陈太太打电话：&ldquo;您需不需要割草？&rdquo; 陈太太回答说：&ldquo;不需要了，我已请了割草工。&rdquo;男孩又说：&ldquo;我会帮您拔掉花丛中的杂草。&rdquo;陈太太回答：&ldquo;我的割草工也做了。&rdquo;男孩又说：&ldquo;我会帮您把草与走道的四周割齐。&rdquo;陈太太说：&ldquo;我请的那人也已经做了，谢谢你，我不需要新的割草工人。&rdquo;男孩便挂了电话，此时，男孩的室友问他说：&ldquo;你不是就在陈太太那割草打工吗？为什么还要打这电话？&rdquo;男孩说：&ldquo;我只是想知道我做得有多好！&rdquo;',11,11,NULL,'02','61',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4',NULL);
INSERT INTO `exam_questions` VALUES ('81de11174f41f7b3c88a2d4223b31db9','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'<br>\r\n[drag]发表[/drag][drag]这篇论文[/drag][drag]什么时候[/drag][drag]是[/drag][drag]的[/drag]',NULL,NULL,NULL,'02','例题',NULL,'01','1',NULL,NULL,NULL,'11',NULL,NULL,'8a1bb540d29c4c1cabab8813c60a5827','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('85632752807a3137e9909e068b46a56f','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'晚饭后，母亲和女儿一块儿洗碗，父亲和儿子在客厅看电视。突然，厨房里传来打破盘子的响声，然后一片沉寂。儿子望着他父亲，说：&ldquo;一定是妈妈打破的。&rdquo;&ldquo;你怎么知道？&rdquo;&ldquo;她没有骂人&rdquo;.',NULL,NULL,NULL,'02','64',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/64');
INSERT INTO `exam_questions` VALUES ('8618ca6129c0bd24b02df6bc776832e8','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','28',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/28.wma');
INSERT INTO `exam_questions` VALUES ('8806d2d426f4f58891010ee794c1ebe2','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','27',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/27.wma');
INSERT INTO `exam_questions` VALUES ('883547945c1b779eb79057f8d6879bcc','6dd7cdaeef61743992fa027e07e18490','','150a0334502f3e32a0273569de687019',NULL,'<br>\r\n',11,11,NULL,'','46',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453',NULL);
INSERT INTO `exam_questions` VALUES ('89b4f96621a304994119634f175c2f16','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',1111,1111,NULL,'02','2',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/2.wma');
INSERT INTO `exam_questions` VALUES ('8bf6ddb9211e9188d79484b60749db1a','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','10',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('8d4c10d60de1e1c2d4eac262639c7699','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','7',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('8d75a41cd0e09ee9b3e4b291b034ee89','713ee95748e72247b78bf94fb52470e5','01','3000e1b41dc8f6d12274a2adcefb60a4',NULL,'',NULL,NULL,NULL,'01','26',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('8eb4a5427f4334b9084cc5e293360b94','2359c735e0f074f460df9052d8578d77','02','root',NULL,'.请选择正确答案，并填写到空格里',NULL,NULL,NULL,'02','6',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237/HskPic/upload/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('91959bf4f6cfb2465bbcbb81f55c4aa1','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','4',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('92e7ffc6ac24b2744ed0fc1c4cdb7a25','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','26',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/26.wma');
INSERT INTO `exam_questions` VALUES ('9609f1c069eb746c0b00f120457e2021','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','13',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('9b6fe718cbca20af834d361520cbe595','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'判断图片正误:<br>\r\n<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/201203161155342.jpg\" style=\"width: 119px; height: 109px\">',NULL,NULL,NULL,'02','例题2.',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'483b98b8d0f4b73d9d88b14adb60b364','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/例题2.mp3');
INSERT INTO `exam_questions` VALUES ('9bce673615227df48b209750983cb7d1','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'<p><br>\r\n<span style=\"font-size: 14px\">★ 北京话和普通话是相同的。</span></p>\r\n',NULL,NULL,NULL,'02','2',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'483b98b8d0f4b73d9d88b14adb60b364','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/2.mp3');
INSERT INTO `exam_questions` VALUES ('9c7372797521996ed3087a104b032d5e','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'人们常说，今天工作不努力，明天努力找工作。<br>\r\n★这句话的意思主要是：',NULL,NULL,NULL,'03','31',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'be4a5ec971f055e68fe885755ca5c8ca','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('9cf15edd4ed0beaa3dcd1cda615a9e10','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/38faeb87-84e5-46e1-bb65-52b04352df46.png\" alt=\"\" height=\"86\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/38faeb87-84e5-46e1-bb65-52b04352df46.png\" width=\"392\">',NULL,NULL,NULL,'01','例题:',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('9dd31d139cd942ea0f1f38dda477f8b4','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'',NULL,NULL,NULL,'01','9',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('a41188f6d966824fa4aac0fcef658d10','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',111,11,NULL,'02','3',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/3.wma');
INSERT INTO `exam_questions` VALUES ('a41800311b850789080264f5d270c085','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'古时候，有两个兄弟<u>&nbsp;&nbsp;&nbsp; 49&nbsp;&nbsp;&nbsp;&nbsp;</u>带着一只行李箱出远门。一路上，重重的行李箱将兄弟俩都<u>&nbsp;&nbsp;&nbsp;50&nbsp;&nbsp;&nbsp;&nbsp;</u>得喘不过气来。他们只好左手累了换右手，右手累了又换左手。忽然，大哥停了下来，在路边买了一根扁担，将两个行李箱一前一后挂在扁担上。他挑起两个箱子上 路，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</u>。在我们人生的大道上，肯定会遇到许许多多的困难，我们不一定都能够<u>&nbsp;&nbsp;&nbsp;&nbsp;52&nbsp;&nbsp; &nbsp;</u>。但在前进的道路上，有时 搬开别人脚下的绊脚石，其实是为自己铺路。',NULL,NULL,NULL,'01','49-52',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/49-52');
INSERT INTO `exam_questions` VALUES ('a4573c8d85aa716d2ddc87e5be9c6582','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','11',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('a45ddad479f53b554f71cbde11195f5d','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','23',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/23.wma');
INSERT INTO `exam_questions` VALUES ('a6a47e61c5a5dc834776bb8cf1c7efc0','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'&nbsp;\r\n<p>请选出有语病的一项：</p>\r\n',NULL,NULL,NULL,'02','34',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'be4a5ec971f055e68fe885755ca5c8ca','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('ad677f547ff17ab12bd8502df13edc70','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'&nbsp;根据下面一段话，请选出正确的选项：',NULL,NULL,NULL,'01','13-14',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/13-14.mp3');
INSERT INTO `exam_questions` VALUES ('af5c02577ea9eefd2712c46eb325a5e2','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'你知道怎么去那儿吗？',NULL,NULL,NULL,'01','例如：',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('b163af01dc6c92b168e18a2b75207328','6dd7cdaeef61743992fa027e07e18490','','150a0334502f3e32a0273569de687019',NULL,'',11,11,NULL,'','48',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453',NULL);
INSERT INTO `exam_questions` VALUES ('b1da5e629dfa1d71a14d2995d8757534','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'',NULL,NULL,NULL,'01','7',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('b40fa6bfbad003bbf95779373eded2ed','6dd7cdaeef61743992fa027e07e18490','','150a0334502f3e32a0273569de687019',NULL,'',11,11,NULL,'','47',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453',NULL);
INSERT INTO `exam_questions` VALUES ('b55bdd3050bf94040a4ae13eb09cf279','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'',NULL,NULL,NULL,'02','4',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'9e0d82593cb53f44f1cb93a41a205ee7','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/4.mp3');
INSERT INTO `exam_questions` VALUES ('b59e39fab2f9d90301a3b4b0bf637ec6','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'母亲节送给母亲最好的礼物是什么？调查显示，78.3%的人认为是&ldquo;更多陪伴&rdquo;，61.6%的人认为是&ldquo;帮母亲做家务&rdquo;，46.9%的人认为是&ldquo;带母亲出去旅游&rdquo;，46.4%的人表示要&ldquo;多打电话、发短信&rdquo;，45.1%的人认为是&ldquo;提供更好的物质条件&rdquo;，34.6%的人认为是&ldquo;自己亲手制作礼物&rdquo;，27.3%的人认为是&ldquo;自己出人头地&rdquo;。',NULL,NULL,NULL,'02','67',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/67');
INSERT INTO `exam_questions` VALUES ('b5ea96394e1288d712265de0cc46f3db','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','18',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('b6e29f65473e98e22061f5d125b70395','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','29',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/29.wma');
INSERT INTO `exam_questions` VALUES ('ba65e5661ee1f831fadb587b4e21ef89','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'&nbsp;最近大多数的同事都很兴奋，因为单位里调来了一位新主管，据说是个能人，专门被派来整顿业务。可是，日子一天天过去，新主管却毫无作为，每天彬彬有礼进办公室，便躲在里面难得出门，那些紧张得要死的坏分子，现在反而更不在乎了。他哪里是个能人，根本就是个老好人，比以前的主管更好说话。四个月过去了，新主管却发话了，坏分子一律开除，有能力的人则获得提升。下手之快，断事之准，与四个月中表现保守的他，简直像换了一个人。<br>\r\n年末聚餐时，新主管在酒后致辞：相信大家对我新上任后的表现和后来的大刀阔斧，一定感到不解。现在听我说个故事，各位就明白了。我有位朋友，买了栋带着大院的房子，他一搬进去，就对院子全面整顿，杂草杂树一律清除，改种自己新买的花卉。某日，原先的房主回访，进门大吃一惊地问，那些名贵的牡丹哪里去了。我这位朋友才发现，他居然把牡丹当草给割了。后来他又买了一栋房子，虽然院子更杂乱，但是他却没有动手。果然，冬天以为是杂树的植物，春天里开了繁花；春天以为是野草的，夏天却是花团锦簇；半年都没有动静的小树，秋天居然红了叶。直到秋天，他才认清哪些是无用的植物，然后进行铲除，使所有珍贵的草木保存了下来。&rdquo;<br>\r\n说到这儿，主管举起杯来，&ldquo;让我敬在座的每一位！如果这个办公室是个花园，你们就是其间的珍木，珍木不可能一年到头开花结果，只有经过长期的观察才认得出啊。&rdquo;',11,11,NULL,'01','71-75',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('bb3ccaf7447a89f0ab228b6a9480719a','6dd7cdaeef61743992fa027e07e18490','','65b35fd8f4992aa90b1553d254ff60e8',NULL,'',NULL,NULL,NULL,'','33',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','31-33.wma');
INSERT INTO `exam_questions` VALUES ('bd94f10749e0016470703ae6d98f4e1a','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]不收取[/drag][drag]我们[/drag][drag]现金[/drag][drag]这里[/drag]',NULL,NULL,NULL,'03','93',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/93');
INSERT INTO `exam_questions` VALUES ('bf17c958a82d133742054ef601022bfe','6dd7cdaeef61743992fa027e07e18490','','65b35fd8f4992aa90b1553d254ff60e8',NULL,'',NULL,NULL,NULL,'','32',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','31-33.wma');
INSERT INTO `exam_questions` VALUES ('c147fba1af80f6a57886ed2b88831813','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'某大公司要招聘一名总经理助理，招聘广告登出后，应聘的简历像雪片一样飞来。经过认真挑选，50个人被通知来笔试。<br>考试那天，在临时的考场&mdash;&mdash;公司会议室里，考生个个自信满满，胸有成竹。很快，考试开始了，考官把试卷发给每位考生，只见题目是这样的：<br>综合测试题（限时3分钟）<br>1. 请把试卷认真读完；<br>2. 请在试卷的左上角，写上你的姓名；<br>3. 请在你的姓名下写上汉语拼音；<br>4. 请写出五种动物的名称；<br>5. 请写出五种植物的名称；<br>6. 请写出五种水果的名称；<br>7. 请写出五座中国城市；<br>8.&nbsp;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;<br>不少考生匆匆看了看试卷，马上拿起笔，&ldquo;沙沙沙&rdquo;地在试卷上写了起来，考场的空气因紧张而有些凝固。<br>一分钟&hellip;&hellip;两分钟&hellip;&hellip;三分钟，时间很快就到了，除了有两三个在规定的时间三分钟之内交卷外，其他人都还在忙着写答案。考官宣布考试结束，未按时交的试卷，一律作废。没有交卷的考生纷纷抱怨：&ldquo;时间这么短，题目这么多，怎么可能按时交卷呢？&rdquo;&ldquo;对，题目又很偏！&rdquo;<br>只见考官面带微笑，&ldquo;很遗憾，虽然各位不能进入公司下一轮考试，但可以将自己的试卷带走，做个纪念。再认真看看，或许今后会对你们有帮助。&rdquo;说完，他很有礼貌地告辞了。<br>听完考官的话，不少人拿起手中的试卷继续往下看，只见后面的题目是这样的：22.请写出五个&ldquo;认真&rdquo;的同义词；23.如果你已经看完了题目，请只做第2题',NULL,NULL,NULL,'01','76-79',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/76-79');
INSERT INTO `exam_questions` VALUES ('c36d0f45b38be641eb54f90b4a8650e3','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'请结合下列词语（要全部使用），写一篇80字左右的短文。<br>\r\n[drag]志愿者[/drag][drag]业余[/drag][drag]温暖[/drag][drag]为了[/drag][drag]行动[/drag]&nbsp;',0,0,NULL,'02','99',NULL,'01','0',NULL,NULL,NULL,'01',NULL,NULL,'5429db56fa68a70efc3587a66846dc91',NULL);
INSERT INTO `exam_questions` VALUES ('c48111cae1f291fdbdb6b0e124ee43cb','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'4月15日，一辆装载500多只小狗的货车在京哈高速公路被300余名动物保护志愿者拦下。之后，<u>&nbsp;&nbsp; 53 &nbsp; </u>连夜谈判，相关慈善机构和爱狗人士拿出十余万元将这车狗买下，并送往中国小动物保护协会的基地安置。这个事件通过网络传播迅速&nbsp;<u>&nbsp; 54&nbsp;&nbsp;&nbsp;</u> 广泛关注，<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </u>，也引发了关于高速公路上拦截货车是否合法的&nbsp;&nbsp;<u>&nbsp; 56&nbsp;&nbsp;&nbsp; </u>。',NULL,NULL,NULL,'01','53-56',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'65b47490df50a244deef732e0e08a453','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/53-56');
INSERT INTO `exam_questions` VALUES ('c665aaf50d24798f98e34a47b81f7d9b','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'.是根据下列一段话，请选出正确的选项：',NULL,NULL,NULL,'01','11-12',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/11-12.mp3');
INSERT INTO `exam_questions` VALUES ('c76e3b45cad6991f0bde6310e62d7adf','6dd7cdaeef61743992fa027e07e18490','','65b35fd8f4992aa90b1553d254ff60e8',NULL,'',NULL,NULL,NULL,'','31',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','31-33.wma');
INSERT INTO `exam_questions` VALUES ('c78cf3bca4bcc1a567bd2dfc6b563823','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'请选出相对应的句子：<br>\r\n<br>\r\nA 太好了！需要我帮忙吗？<br>\r\nB 今天把我饿坏了，还有什么吃的吗？<br>\r\nC 你最好再检查一下，看还有没有问题。<br>\r\nD 没问题，你就放心吧。<br>\r\nE 当然。我们先坐公共汽车，然后换地铁。<br>\r\nF 这条裤子你花了多少钱？',NULL,NULL,NULL,'01','21-25',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('c90d9ce998f666c70a4b0217a4f2d454','713ee95748e72247b78bf94fb52470e5','03','root',NULL,'<br>\r\n<p>排列下列句子语序：<br>\r\n<br>\r\nA 做事情往往需要照顾大的方面<br>\r\nB 而放弃掉&ldquo;森林&rdquo;<br>\r\nC 换句话说，就是不要仅仅为了一棵&ldquo;大树&rdquo;</p>\r\n',NULL,NULL,NULL,'03','51',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'8a553fab2d502a372fad52d0802bf3cb','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('cc2bbbe21ee5cee50736e6d074142811','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','17',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('ceeeefe45e1cf10a2b12433c6cacc835','713ee95748e72247b78bf94fb52470e5','01','c665aaf50d24798f98e34a47b81f7d9b',NULL,'',NULL,NULL,NULL,'01','12',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/11-12.mp3');
INSERT INTO `exam_questions` VALUES ('d012a718a91a6ba1033949b016ec7987','6dd7cdaeef61743992fa027e07e18490','','ba65e5661ee1f831fadb587b4e21ef89',NULL,'新主管在四个月后做了什么？',0,0,NULL,'','73',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('d4f6178707f7e0dfd32ce0f1cdcd1e55','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'',NULL,NULL,NULL,'01','23',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('d79dcb924210b213cb5a01a044cba4b6','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'',NULL,NULL,NULL,'01','40-42',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/40-42.wma');
INSERT INTO `exam_questions` VALUES ('da97bfbff0fa8e874218560e45af1851','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'&nbsp;\r\n<p>请根据文章内容，选出正确的选项：<br>\r\n<img _fcksavedurl=\"/../hskkw-uploads/exam_paper/20110323102153474188/f2e1e60d-43d9-4c47-af4b-15dc48acdbb9.png\" alt=\"\" height=\"456\" src=\"http://192.168.0.237:8080/hskkw-uploads/exam_paper/20110323102153474188/f2e1e60d-43d9-4c47-af4b-15dc48acdbb9.png\" width=\"707\"></p>\r\n',NULL,NULL,NULL,'01','38-42',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'1df2fe8702f427a280405b07a29943a0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('db6fdd6c11eaeb89ec02299b84304427','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'.听句子判断图片正误：<br>\r\n<img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/201203161147041.jpg\" style=\"width: 112px; height: 113px\">',NULL,NULL,NULL,'02','例题1',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'483b98b8d0f4b73d9d88b14adb60b364','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/例题1.mp3');
INSERT INTO `exam_questions` VALUES ('dc19c30d9304147ab9cb2c5cf7ed4e1a','2359c735e0f074f460df9052d8578d77','02','root',NULL,'请选择正确答案，并填写到空格里',NULL,NULL,NULL,'02','4',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'66c5d04f95e3e7e90df4fca2622ef7e8','http://192.168.0.237/HskPic/upload/2359c735e0f074f460df9052d8578d77/');
INSERT INTO `exam_questions` VALUES ('e01a271b8b0eecfcdb97481d9cd5669c','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'',NULL,NULL,NULL,'01','22',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('e04e393d665e5d9dc264fc89e250a430','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'请选出正确的选项：',NULL,NULL,NULL,'02','例题3.',NULL,'01','1',NULL,NULL,NULL,'00',NULL,NULL,'9e0d82593cb53f44f1cb93a41a205ee7','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/例题3.mp3');
INSERT INTO `exam_questions` VALUES ('e40af9c9cb34c7d7aa85be26b1ff91be','713ee95748e72247b78bf94fb52470e5','01','c78cf3bca4bcc1a567bd2dfc6b563823',NULL,'',NULL,NULL,NULL,'01','24',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'3d4a8d1500ce4194c2a55a65fe03f9d0','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/');
INSERT INTO `exam_questions` VALUES ('e4fec7fe03470473c1d94276b2607d5b','713ee95748e72247b78bf94fb52470e5','01','c665aaf50d24798f98e34a47b81f7d9b',NULL,'',NULL,NULL,NULL,'01','11',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'238cbda0ec6bf6ae4dd56cc82ad7132c','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/11-12.mp3');
INSERT INTO `exam_questions` VALUES ('e530db079a69cd5d0cca7fa940a2113c','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'成语跟习用语、谚语相近，但是也略有区别。最主要的一点是习用语和谚语是口语性质的，成语大都出自书面，属于文语性质的。其次在语言形式上，成语几乎都是约定俗成的四字结构，字面不能随意更换，而习用语和谚语总是松散一些,可多可少,不限于四个字',NULL,NULL,NULL,'02','66',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/66');
INSERT INTO `exam_questions` VALUES ('e6477a4f09a63649cfd4c8649629bcb1','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'九寨沟海拔1900~3100米，山顶终年积雪。春天气温较低而且变化较大，平均气温多在9~18℃之间。夏季气温回升比较稳定，平均气温19~22℃，夜晚较凉，宜备薄毛衣。秋季气候宜人，但昼夜温差很大，特别是10月后的深秋，白天可穿单衣，夜晚就得穿防寒服了。冬季较寒冷，气温多在0℃以下。九寨沟降雨较少且多集中在7~8月。九寨沟一年四季均可旅游，尤以秋季为最佳，10月中下旬是九寨沟最夺目的季节.',NULL,NULL,NULL,'02','63',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/63');
INSERT INTO `exam_questions` VALUES ('e6884db0c16cef1c1725c1825a0b6f63','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'今年2月2日是中国传统佳节&mdash;&mdash;大年三十。这一天是中国农历年中的最后一天，大年三十的晚上被称为&ldquo;除夕夜&rdquo;。在这一天，中国人讲究要合家团圆，贴春联儿、包饺子、放鞭炮，共同迎接新的一年。 今年是兔年，中国人偏爱起了各种兔子造型的装饰物，兔子手机链、泥人、蜡烛、蛋糕都成为人们热捧的对象。',NULL,NULL,NULL,'02','70',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'dfd5fae73161e965feb14c9bba26c4e4','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/70');
INSERT INTO `exam_questions` VALUES ('e80bb05942ad1b04bbce475fe2a8f619','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','12',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('e92c6869605af072a421d108d1ae7ecb','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','30',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/30.wma');
INSERT INTO `exam_questions` VALUES ('e937d221a1131827b416eae2ce669bef','6dd7cdaeef61743992fa027e07e18490','01','root',NULL,'',NULL,NULL,NULL,'01','43-45',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/43-45.wma');
INSERT INTO `exam_questions` VALUES ('eb5681e29a9275067f74e096ec6085a8','6dd7cdaeef61743992fa027e07e18490','','ba65e5661ee1f831fadb587b4e21ef89',NULL,'坏分子们对新主管的态度是？',0,0,NULL,'','72',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('ec46b75b19e4ea501bcaf4a467bc71b3','6dd7cdaeef61743992fa027e07e18490','','ba65e5661ee1f831fadb587b4e21ef89',NULL,'新主管的朋友第二次买房子时：',0,0,NULL,'','74',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'d89049ffb296f8a37708e450e7c81df2',NULL);
INSERT INTO `exam_questions` VALUES ('f2b18642cb5fccfc131c9780fb108b71','713ee95748e72247b78bf94fb52470e5','01','root',NULL,'<br>\r\n<span style=\"font-size: 26px\"><strong><img alt=\"\" src=\"http://192.168.0.237:5080/Hsk_Media/streams/papers//201203161343406-1.png\" style=\"width: 550px; height: 499px\"></strong></span>',NULL,NULL,NULL,'01','6-10',NULL,'00','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('f49b8a13ad52bdf494d7f4eb92b29ef6','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','20',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('f5f19d79970209eb4d8cdbec51a9944d','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'[drag]他在[/drag][drag]显示出了[/drag][drag]就[/drag][drag]大学时代[/drag][drag]写作才华[/drag]',0,0,NULL,'02','92.',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6',NULL);
INSERT INTO `exam_questions` VALUES ('f5f76d684c06bf944ef0a36926031fa5','713ee95748e72247b78bf94fb52470e5','01','f2b18642cb5fccfc131c9780fb108b71',NULL,'',NULL,NULL,NULL,'01','6',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'4436ea81095c59d20be19fc573e342f8','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/6-10.mp3');
INSERT INTO `exam_questions` VALUES ('f64ec5869e7bee927a6ccf98bd9f9a19','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','19',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('f826acb010412caeb52c0533453d2715','2359c735e0f074f460df9052d8578d77','03','root',NULL,'',NULL,NULL,NULL,'03','12',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'b4c1afe9a9cef05051304740b01d7953','http://192.168.0.237:5080/Hsk_Media/streams/papers/2359c735e0f074f460df9052d8578d77/12.wma');
INSERT INTO `exam_questions` VALUES ('f85e2c506ad119637043c9108308112d','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',11,11,NULL,'02','5',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'16c0b3c0cafc0826f80a5125399f28f7',NULL);
INSERT INTO `exam_questions` VALUES ('fc54ca6c3c5ce1c1700d7ba33e41f823','713ee95748e72247b78bf94fb52470e5','02','root',NULL,'',NULL,NULL,NULL,'02','3.',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'9e0d82593cb53f44f1cb93a41a205ee7','http://192.168.0.237:5080/Hsk_Media/streams/papers/713ee95748e72247b78bf94fb52470e5/3.mp3');
INSERT INTO `exam_questions` VALUES ('fc69921f533573316ff4ec2ef3000d34','6dd7cdaeef61743992fa027e07e18490','03','root',NULL,'[drag]这次[/drag][drag]开玩笑[/drag][drag]不是[/drag][drag]确实[/drag]',NULL,NULL,NULL,'03','97',NULL,'01','0',NULL,NULL,NULL,'11',NULL,NULL,'aec659ddb943a4ccc64a61e72da481c6','http://192.168.0.237/HskPic/upload/6dd7cdaeef61743992fa027e07e18490/97');
INSERT INTO `exam_questions` VALUES ('fd3e5c3a5c6ec81b1838c839259132e8','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','25',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/25.wma');
INSERT INTO `exam_questions` VALUES ('ff134aeffe763e8f0e2ad4e4c2a5b655','6dd7cdaeef61743992fa027e07e18490','02','root',NULL,'',NULL,NULL,NULL,'02','22',NULL,'01','0',NULL,NULL,NULL,'00',NULL,NULL,'576e1e5ce9ed1651ec2b08c280278e31','http://192.168.0.237:5080/Hsk_Media/streams/papers/6dd7cdaeef61743992fa027e07e18490/22.wma');
/*!40000 ALTER TABLE `exam_questions` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_read_detail
#

DROP TABLE IF EXISTS `exam_read_detail`;
CREATE TABLE `exam_read_detail` (
  `read_detail_id` varchar(32) NOT NULL,
  `read_record_id` varchar(32) DEFAULT NULL,
  `ans_detail_id` varchar(32) DEFAULT NULL COMMENT '考生答题记录ID',
  `read_detail_comment` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`read_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_read_detail
#

LOCK TABLES `exam_read_detail` WRITE;
/*!40000 ALTER TABLE `exam_read_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_read_detail` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_read_record
#

DROP TABLE IF EXISTS `exam_read_record`;
CREATE TABLE `exam_read_record` (
  `read_record_id` varchar(32) NOT NULL,
  `ans_record_id` varchar(32) DEFAULT NULL,
  `read_record_status_id` varchar(2) DEFAULT NULL,
  `teach_id` varchar(32) DEFAULT NULL COMMENT '工号',
  `read_record_time` datetime DEFAULT NULL,
  `read_submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`read_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_read_record
#

LOCK TABLES `exam_read_record` WRITE;
/*!40000 ALTER TABLE `exam_read_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_read_record` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_read_record_status
#

DROP TABLE IF EXISTS `exam_read_record_status`;
CREATE TABLE `exam_read_record_status` (
  `read_record_status_id` varchar(2) NOT NULL,
  `read_record_status_name` varchar(100) DEFAULT NULL,
  `read_record_status_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`read_record_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_read_record_status
#

LOCK TABLES `exam_read_record_status` WRITE;
/*!40000 ALTER TABLE `exam_read_record_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_read_record_status` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_read_standard
#

DROP TABLE IF EXISTS `exam_read_standard`;
CREATE TABLE `exam_read_standard` (
  `standard_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`standard_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_read_standard
#

LOCK TABLES `exam_read_standard` WRITE;
/*!40000 ALTER TABLE `exam_read_standard` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_read_standard` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_resource
#

DROP TABLE IF EXISTS `exam_resource`;
CREATE TABLE `exam_resource` (
  `res_id` varchar(32) NOT NULL COMMENT '资源id',
  `res_type` varchar(255) DEFAULT NULL COMMENT '资源类型',
  `res_value` varchar(255) DEFAULT NULL COMMENT '资源值',
  `res_desc` varchar(50) DEFAULT NULL COMMENT '资源描述',
  PRIMARY KEY (`res_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_resource
#

LOCK TABLES `exam_resource` WRITE;
/*!40000 ALTER TABLE `exam_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_resource` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_right
#

DROP TABLE IF EXISTS `exam_right`;
CREATE TABLE `exam_right` (
  `right_id` varchar(32) NOT NULL,
  `right_name` varchar(20) DEFAULT NULL,
  `right_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`right_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表';

#
# Dumping data for table exam_right
#

LOCK TABLES `exam_right` WRITE;
/*!40000 ALTER TABLE `exam_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_right` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_role
#

DROP TABLE IF EXISTS `exam_role`;
CREATE TABLE `exam_role` (
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

#
# Dumping data for table exam_role
#

LOCK TABLES `exam_role` WRITE;
/*!40000 ALTER TABLE `exam_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_role_to_right
#

DROP TABLE IF EXISTS `exam_role_to_right`;
CREATE TABLE `exam_role_to_right` (
  `right_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `res_id` varchar(32) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`right_id`,`role_id`,`res_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_role_to_right
#

LOCK TABLES `exam_role_to_right` WRITE;
/*!40000 ALTER TABLE `exam_role_to_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_role_to_right` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_student
#

DROP TABLE IF EXISTS `exam_student`;
CREATE TABLE `exam_student` (
  `stu_id` varchar(32) NOT NULL COMMENT '学号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `stu_question1` varchar(255) DEFAULT NULL COMMENT '问题1',
  `stu_answer1` varchar(255) DEFAULT NULL COMMENT '回答1',
  `stu_question2` varchar(255) DEFAULT NULL,
  `stu_answer2` varchar(255) DEFAULT NULL,
  `stu_question3` varchar(255) DEFAULT NULL,
  `stu_answer3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考生表';

#
# Dumping data for table exam_student
#

LOCK TABLES `exam_student` WRITE;
/*!40000 ALTER TABLE `exam_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_student` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_subject
#

DROP TABLE IF EXISTS `exam_subject`;
CREATE TABLE `exam_subject` (
  `subject_id` varchar(32) NOT NULL COMMENT '科目编码',
  `exam_status_id` char(2) DEFAULT NULL,
  `subject_name` varchar(200) DEFAULT NULL COMMENT '科目名称',
  `subject_level_id` varchar(4) NOT NULL COMMENT '科目级别ID',
  `subject_type` varchar(2) DEFAULT NULL COMMENT '科目类型（01-正规考试；02-强化练习）',
  `subject_question_num` int(11) DEFAULT NULL COMMENT '试题数量',
  `subject_paper_num` int(11) DEFAULT NULL COMMENT '此科目下拥有试卷的数量',
  `subject_remark` varchar(2000) DEFAULT NULL COMMENT '科目备注',
  PRIMARY KEY (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='试卷科目表';

#
# Dumping data for table exam_subject
#

LOCK TABLES `exam_subject` WRITE;
/*!40000 ALTER TABLE `exam_subject` DISABLE KEYS */;
INSERT INTO `exam_subject` VALUES ('114626f11813b9ac2def1b1cdf12e2dc','1','HSK五级','05','01',0,0,'');
INSERT INTO `exam_subject` VALUES ('4ea4bcdb65998419035c6239b748e81e','1','HSK二级强化练习','02','02',0,0,'');
INSERT INTO `exam_subject` VALUES ('52a523974603930996af50cc088e4d17','1','HSK综合（试题样板）','01','03',0,0,'HSK综合（试题样板）');
INSERT INTO `exam_subject` VALUES ('5533792ee535d26559e20352382538f7','1','HSK一级','01','01',0,0,'');
INSERT INTO `exam_subject` VALUES ('5dc1beee92b5b955e3c273c214c819a6','1','HSK二级','02','01',0,0,'');
INSERT INTO `exam_subject` VALUES ('8e270eef739b80e54f1238042fa84761','1','HSK四级','04','01',0,0,'');
INSERT INTO `exam_subject` VALUES ('c0956c513acaf9d1917510a6111415b0','1','HSK测试1','01','03',0,0,'11');
INSERT INTO `exam_subject` VALUES ('cfe25d112e118845f5ef64a6d8b5f11c','1','HSK一级强化练习','01','02',0,0,'');
INSERT INTO `exam_subject` VALUES ('d3d9383f02fab1157481d0625e2a44d3','1','HSK六级','06','01',0,0,'');
INSERT INTO `exam_subject` VALUES ('eeea2650f4ebe6258430df0e9869065a','1','HSK三级','03','01',0,0,'');
/*!40000 ALTER TABLE `exam_subject` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_subject_level
#

DROP TABLE IF EXISTS `exam_subject_level`;
CREATE TABLE `exam_subject_level` (
  `subject_level_id` varchar(4) NOT NULL COMMENT '科目级别ID',
  `subject_level_name` varchar(100) NOT NULL COMMENT '科目级别名称',
  PRIMARY KEY (`subject_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目级别表';

#
# Dumping data for table exam_subject_level
#

LOCK TABLES `exam_subject_level` WRITE;
/*!40000 ALTER TABLE `exam_subject_level` DISABLE KEYS */;
INSERT INTO `exam_subject_level` VALUES ('01','HSK一级');
INSERT INTO `exam_subject_level` VALUES ('02','HSK二级');
INSERT INTO `exam_subject_level` VALUES ('03','HSK三级');
INSERT INTO `exam_subject_level` VALUES ('04','HSK四级');
INSERT INTO `exam_subject_level` VALUES ('05','HSK五级');
INSERT INTO `exam_subject_level` VALUES ('06','HSK六级');
/*!40000 ALTER TABLE `exam_subject_level` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_subject_status
#

DROP TABLE IF EXISTS `exam_subject_status`;
CREATE TABLE `exam_subject_status` (
  `exam_status_id` char(2) NOT NULL,
  `exam_status_name` varchar(100) DEFAULT NULL,
  `exam_status_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`exam_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_subject_status
#

LOCK TABLES `exam_subject_status` WRITE;
/*!40000 ALTER TABLE `exam_subject_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_subject_status` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_subject_struct
#

DROP TABLE IF EXISTS `exam_subject_struct`;
CREATE TABLE `exam_subject_struct` (
  `subject_struct_id` varchar(32) NOT NULL COMMENT '科目结构ID',
  `subject_id` varchar(32) DEFAULT NULL COMMENT '所属科目编码',
  `subject_struct_name` varchar(100) DEFAULT NULL COMMENT '科目结构标题',
  `subject_struct_parent_id` varchar(32) NOT NULL DEFAULT '' COMMENT '科目结构父ID',
  `subject_struct_root_id` varchar(32) NOT NULL COMMENT '结构的根ID',
  `subject_struct_root_seq` int(11) DEFAULT '0',
  `subject_struct_question_num` int(11) DEFAULT '0' COMMENT '科目结构试题数量',
  `subject_struct_answer_time` int(11) DEFAULT NULL COMMENT '科目结构答题时间',
  `subject_struct_seq_num` int(11) DEFAULT '0' COMMENT '科目结构内排序',
  `subject_struct_level` int(11) DEFAULT '0' COMMENT '科目结构级别',
  `subject_struct_child_num` int(11) DEFAULT '0' COMMENT '科目结构子节点数量',
  PRIMARY KEY (`subject_struct_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科目结构';

#
# Dumping data for table exam_subject_struct
#

LOCK TABLES `exam_subject_struct` WRITE;
/*!40000 ALTER TABLE `exam_subject_struct` DISABLE KEYS */;
INSERT INTO `exam_subject_struct` VALUES ('0ae1ea8be424e93d28667302a7fbc538','114626f11813b9ac2def1b1cdf12e2dc','第二部分','19f9c571a2a7a190d19434367c760879','19f9c571a2a7a190d19434367c760879',0,25,NULL,2,2,0);
INSERT INTO `exam_subject_struct` VALUES ('16c0b3c0cafc0826f80a5125399f28f7','114626f11813b9ac2def1b1cdf12e2dc','1-20．请选出正确答案','56a7d6216a0419344e0b1989aef8a38f','19f9c571a2a7a190d19434367c760879',0,NULL,NULL,1,3,0);
INSERT INTO `exam_subject_struct` VALUES ('19f9c571a2a7a190d19434367c760879','114626f11813b9ac2def1b1cdf12e2dc','听力','19f9c571a2a7a190d19434367c760879','19f9c571a2a7a190d19434367c760879',0,45,30,1,1,0);
INSERT INTO `exam_subject_struct` VALUES ('1df2fe8702f427a280405b07a29943a0','52a523974603930996af50cc088e4d17','第四小节','40d828a65ee29847752365cd6b72930b','bdcd8ebe9e06bc3540014cecd80886ba',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('1f064b7c0ebb5ac21ccf7c4f82a19057','52a523974603930996af50cc088e4d17','第三部分','844c135bfae06e0ad48290a8c18846c2','844c135bfae06e0ad48290a8c18846c2',0,5,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('223fd20116a83c3f451a03019a47fa6f','5533792ee535d26559e20352382538f7','书写','223fd20116a83c3f451a03019a47fa6f','223fd20116a83c3f451a03019a47fa6f',3,2,40,3,1,0);
INSERT INTO `exam_subject_struct` VALUES ('238cbda0ec6bf6ae4dd56cc82ad7132c','52a523974603930996af50cc088e4d17','第四小节','4e06c9ced6a515f697f1b89efd653fe9','844c135bfae06e0ad48290a8c18846c2',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('249619b76eaeb6b9553cb80839d211d1','5533792ee535d26559e20352382538f7','听力','249619b76eaeb6b9553cb80839d211d1','249619b76eaeb6b9553cb80839d211d1',1,30,30,1,1,4);
INSERT INTO `exam_subject_struct` VALUES ('285a4b19cf54009397d04e89cee7f1b2','52a523974603930996af50cc088e4d17','第二部分','844c135bfae06e0ad48290a8c18846c2','844c135bfae06e0ad48290a8c18846c2',0,3,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('35ba7227c6147bde0df234dab1381b6f','114626f11813b9ac2def1b1cdf12e2dc','第三部分','d5d302cbd008c66d42f18cd2defc428d','d5d302cbd008c66d42f18cd2defc428d',0,20,NULL,3,2,0);
INSERT INTO `exam_subject_struct` VALUES ('37aee7805737a3f784ae690dbd32f479','52a523974603930996af50cc088e4d17','第一部分','b8a23f73f43567e84d531e763fd4c282','b8a23f73f43567e84d531e763fd4c282',0,4,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('3d4a8d1500ce4194c2a55a65fe03f9d0','52a523974603930996af50cc088e4d17','第二小节','f54b6fb2f3a718680cf51ad3cf41f296','bdcd8ebe9e06bc3540014cecd80886ba',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('40d828a65ee29847752365cd6b72930b','52a523974603930996af50cc088e4d17','第四部分','bdcd8ebe9e06bc3540014cecd80886ba','bdcd8ebe9e06bc3540014cecd80886ba',0,12,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('4436ea81095c59d20be19fc573e342f8','52a523974603930996af50cc088e4d17','第三小节','1f064b7c0ebb5ac21ccf7c4f82a19057','844c135bfae06e0ad48290a8c18846c2',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('45946d8997b65e233c022ea7aefe812e','5533792ee535d26559e20352382538f7','第一部分','249619b76eaeb6b9553cb80839d211d1','249619b76eaeb6b9553cb80839d211d1',1,10,NULL,1,2,1);
INSERT INTO `exam_subject_struct` VALUES ('483b98b8d0f4b73d9d88b14adb60b364','52a523974603930996af50cc088e4d17','第一小节','b21eb918e84862f6a3cdeaef5ac5deb1','844c135bfae06e0ad48290a8c18846c2',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('4e06c9ced6a515f697f1b89efd653fe9','52a523974603930996af50cc088e4d17','第四部分','844c135bfae06e0ad48290a8c18846c2','844c135bfae06e0ad48290a8c18846c2',0,8,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('51f4680623516e9830e6dea954ec4c53','5dc1beee92b5b955e3c273c214c819a6','听力','51f4680623516e9830e6dea954ec4c53','51f4680623516e9830e6dea954ec4c53',0,40,30,1,1,0);
INSERT INTO `exam_subject_struct` VALUES ('5429db56fa68a70efc3587a66846dc91','114626f11813b9ac2def1b1cdf12e2dc','99-100.写短文','bdc2c973bb3518b34e48f71c68d68d5a','8f30becad6cc271d5f5d9761b2a8e0b8',0,NULL,NULL,2,3,0);
INSERT INTO `exam_subject_struct` VALUES ('567b0ec9f4dffe4f461a93637e7b8858','52a523974603930996af50cc088e4d17','第三部分','b8a23f73f43567e84d531e763fd4c282','b8a23f73f43567e84d531e763fd4c282',0,1,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('56a7d6216a0419344e0b1989aef8a38f','114626f11813b9ac2def1b1cdf12e2dc','第一部分','19f9c571a2a7a190d19434367c760879','19f9c571a2a7a190d19434367c760879',0,20,NULL,1,2,0);
INSERT INTO `exam_subject_struct` VALUES ('576e1e5ce9ed1651ec2b08c280278e31','114626f11813b9ac2def1b1cdf12e2dc','21-45．请选出正确答案','0ae1ea8be424e93d28667302a7fbc538','19f9c571a2a7a190d19434367c760879',0,NULL,NULL,2,3,0);
INSERT INTO `exam_subject_struct` VALUES ('656102f6f03909e21a2959312890c298','114626f11813b9ac2def1b1cdf12e2dc','第一部分','8f30becad6cc271d5f5d9761b2a8e0b8','8f30becad6cc271d5f5d9761b2a8e0b8',0,8,NULL,1,2,0);
INSERT INTO `exam_subject_struct` VALUES ('65b47490df50a244deef732e0e08a453','114626f11813b9ac2def1b1cdf12e2dc','46-60．请选出正确答案','fa8cf02b3b4ae79c23ac1c55a00f3914','d5d302cbd008c66d42f18cd2defc428d',0,NULL,NULL,1,3,0);
INSERT INTO `exam_subject_struct` VALUES ('66c5d04f95e3e7e90df4fca2622ef7e8','5533792ee535d26559e20352382538f7','1-10.阅读小节','d7c0aa2057d65acce5d64fd1ff829df2','aae140a31c0e231352d164b42c0b06bd',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('7582dec4743efc94427a60babee8cd34','5533792ee535d26559e20352382538f7','第三部分','249619b76eaeb6b9553cb80839d211d1','249619b76eaeb6b9553cb80839d211d1',1,10,NULL,3,2,0);
INSERT INTO `exam_subject_struct` VALUES ('844c135bfae06e0ad48290a8c18846c2','52a523974603930996af50cc088e4d17','听力','844c135bfae06e0ad48290a8c18846c2','844c135bfae06e0ad48290a8c18846c2',0,18,20,1,1,0);
INSERT INTO `exam_subject_struct` VALUES ('8a1bb540d29c4c1cabab8813c60a5827','52a523974603930996af50cc088e4d17','第二小节','cb0734728a7dd32a4c8c85f159fd61fd','b8a23f73f43567e84d531e763fd4c282',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('8a553fab2d502a372fad52d0802bf3cb','52a523974603930996af50cc088e4d17','第三小节','567b0ec9f4dffe4f461a93637e7b8858','b8a23f73f43567e84d531e763fd4c282',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('8de8486d4f53776c240866ccb8e80472','5533792ee535d26559e20352382538f7','第二部分','249619b76eaeb6b9553cb80839d211d1','249619b76eaeb6b9553cb80839d211d1',1,10,NULL,2,2,0);
INSERT INTO `exam_subject_struct` VALUES ('8f30becad6cc271d5f5d9761b2a8e0b8','114626f11813b9ac2def1b1cdf12e2dc','书写','8f30becad6cc271d5f5d9761b2a8e0b8','8f30becad6cc271d5f5d9761b2a8e0b8',0,10,40,3,1,0);
INSERT INTO `exam_subject_struct` VALUES ('9e0d82593cb53f44f1cb93a41a205ee7','52a523974603930996af50cc088e4d17','第二小节','285a4b19cf54009397d04e89cee7f1b2','844c135bfae06e0ad48290a8c18846c2',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('aa8f48390a5d2f8b663bab4c45d2353e','52a523974603930996af50cc088e4d17','第一小节','aabbb2f531dbdd0ac8749e97773db1e5','bdcd8ebe9e06bc3540014cecd80886ba',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('aabbb2f531dbdd0ac8749e97773db1e5','52a523974603930996af50cc088e4d17','第一部分','bdcd8ebe9e06bc3540014cecd80886ba','bdcd8ebe9e06bc3540014cecd80886ba',0,2,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('aae140a31c0e231352d164b42c0b06bd','5533792ee535d26559e20352382538f7','阅读','aae140a31c0e231352d164b42c0b06bd','aae140a31c0e231352d164b42c0b06bd',2,20,30,2,1,0);
INSERT INTO `exam_subject_struct` VALUES ('aec659ddb943a4ccc64a61e72da481c6','114626f11813b9ac2def1b1cdf12e2dc','91-98.完成句子','656102f6f03909e21a2959312890c298','8f30becad6cc271d5f5d9761b2a8e0b8',0,NULL,NULL,1,3,0);
INSERT INTO `exam_subject_struct` VALUES ('b21eb918e84862f6a3cdeaef5ac5deb1','52a523974603930996af50cc088e4d17','第一部分','844c135bfae06e0ad48290a8c18846c2','844c135bfae06e0ad48290a8c18846c2',0,2,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('b4c1afe9a9cef05051304740b01d7953','5533792ee535d26559e20352382538f7','11-20.请选择正确答案','8de8486d4f53776c240866ccb8e80472','249619b76eaeb6b9553cb80839d211d1',0,NULL,NULL,1,3,0);
INSERT INTO `exam_subject_struct` VALUES ('b8a23f73f43567e84d531e763fd4c282','52a523974603930996af50cc088e4d17','书写','b8a23f73f43567e84d531e763fd4c282','b8a23f73f43567e84d531e763fd4c282',0,7,20,1,1,0);
INSERT INTO `exam_subject_struct` VALUES ('bdc2c973bb3518b34e48f71c68d68d5a','114626f11813b9ac2def1b1cdf12e2dc','第二部分','8f30becad6cc271d5f5d9761b2a8e0b8','8f30becad6cc271d5f5d9761b2a8e0b8',0,2,NULL,2,2,0);
INSERT INTO `exam_subject_struct` VALUES ('bdcd8ebe9e06bc3540014cecd80886ba','52a523974603930996af50cc088e4d17','阅读','bdcd8ebe9e06bc3540014cecd80886ba','bdcd8ebe9e06bc3540014cecd80886ba',0,30,20,1,1,0);
INSERT INTO `exam_subject_struct` VALUES ('be4a5ec971f055e68fe885755ca5c8ca','52a523974603930996af50cc088e4d17','第三小节','ebf4f8ee7e2b0e093a7bd877b1bc2d56','bdcd8ebe9e06bc3540014cecd80886ba',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('cb0734728a7dd32a4c8c85f159fd61fd','52a523974603930996af50cc088e4d17','第二部分','b8a23f73f43567e84d531e763fd4c282','b8a23f73f43567e84d531e763fd4c282',0,3,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('d5d302cbd008c66d42f18cd2defc428d','114626f11813b9ac2def1b1cdf12e2dc','阅读','d5d302cbd008c66d42f18cd2defc428d','d5d302cbd008c66d42f18cd2defc428d',0,45,40,2,1,0);
INSERT INTO `exam_subject_struct` VALUES ('d7c0aa2057d65acce5d64fd1ff829df2','5533792ee535d26559e20352382538f7','第一部分','aae140a31c0e231352d164b42c0b06bd','aae140a31c0e231352d164b42c0b06bd',0,10,NULL,1,2,0);
INSERT INTO `exam_subject_struct` VALUES ('d89049ffb296f8a37708e450e7c81df2','114626f11813b9ac2def1b1cdf12e2dc','71-90．请选出正确答案','35ba7227c6147bde0df234dab1381b6f','d5d302cbd008c66d42f18cd2defc428d',0,NULL,NULL,3,3,0);
INSERT INTO `exam_subject_struct` VALUES ('dc7f4881e8f54fbffee689d1750918d2','5533792ee535d26559e20352382538f7','1-10.请选择正确答案','45946d8997b65e233c022ea7aefe812e','249619b76eaeb6b9553cb80839d211d1',1,NULL,NULL,1,3,0);
INSERT INTO `exam_subject_struct` VALUES ('dfd5fae73161e965feb14c9bba26c4e4','114626f11813b9ac2def1b1cdf12e2dc','61-70．请选出与试题内容一致的选项','e898ce62c0ceb21635dfc174a07a944c','d5d302cbd008c66d42f18cd2defc428d',0,NULL,NULL,2,3,0);
INSERT INTO `exam_subject_struct` VALUES ('e898ce62c0ceb21635dfc174a07a944c','114626f11813b9ac2def1b1cdf12e2dc','第二部分','d5d302cbd008c66d42f18cd2defc428d','d5d302cbd008c66d42f18cd2defc428d',0,10,NULL,2,2,0);
INSERT INTO `exam_subject_struct` VALUES ('ebf4f8ee7e2b0e093a7bd877b1bc2d56','52a523974603930996af50cc088e4d17','第三部分','bdcd8ebe9e06bc3540014cecd80886ba','bdcd8ebe9e06bc3540014cecd80886ba',0,6,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('f17fe68c45f579646a00a2ea9e085032','52a523974603930996af50cc088e4d17','第一小节','37aee7805737a3f784ae690dbd32f479','b8a23f73f43567e84d531e763fd4c282',0,NULL,NULL,0,3,0);
INSERT INTO `exam_subject_struct` VALUES ('f54b6fb2f3a718680cf51ad3cf41f296','52a523974603930996af50cc088e4d17','第二部分','bdcd8ebe9e06bc3540014cecd80886ba','bdcd8ebe9e06bc3540014cecd80886ba',0,10,NULL,0,2,0);
INSERT INTO `exam_subject_struct` VALUES ('fa8cf02b3b4ae79c23ac1c55a00f3914','114626f11813b9ac2def1b1cdf12e2dc','第一部分','d5d302cbd008c66d42f18cd2defc428d','d5d302cbd008c66d42f18cd2defc428d',0,15,NULL,1,2,0);
/*!40000 ALTER TABLE `exam_subject_struct` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_subject_type
#

DROP TABLE IF EXISTS `exam_subject_type`;
CREATE TABLE `exam_subject_type` (
  `sub_type_id` varchar(2) NOT NULL COMMENT '科目类型ID',
  `sub_type_name` varchar(200) NOT NULL COMMENT '科目类型名称',
  `sub_type_remark` varchar(255) DEFAULT NULL COMMENT '科目类型备注',
  PRIMARY KEY (`sub_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='科目类型字典表';

#
# Dumping data for table exam_subject_type
#

LOCK TABLES `exam_subject_type` WRITE;
/*!40000 ALTER TABLE `exam_subject_type` DISABLE KEYS */;
INSERT INTO `exam_subject_type` VALUES ('01','正式考试','正式考试用科目类型');
INSERT INTO `exam_subject_type` VALUES ('02','强化练习','强化练习');
INSERT INTO `exam_subject_type` VALUES ('03','test','test');
INSERT INTO `exam_subject_type` VALUES ('04','test111','test');
/*!40000 ALTER TABLE `exam_subject_type` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_teacher
#

DROP TABLE IF EXISTS `exam_teacher`;
CREATE TABLE `exam_teacher` (
  `teach_id` varchar(32) NOT NULL COMMENT '工号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `teach_levle` varchar(100) DEFAULT NULL COMMENT '教师级别',
  `teach_examnum` int(11) DEFAULT NULL COMMENT '阅卷数量',
  `teach_orga` varchar(100) DEFAULT NULL COMMENT '教师单位',
  PRIMARY KEY (`teach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_teacher
#

LOCK TABLES `exam_teacher` WRITE;
/*!40000 ALTER TABLE `exam_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_teacher` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_teacher_comment
#

DROP TABLE IF EXISTS `exam_teacher_comment`;
CREATE TABLE `exam_teacher_comment` (
  `teacher_comm_id` varchar(32) NOT NULL,
  `stu_id` varchar(32) DEFAULT NULL COMMENT '学号',
  `teach_id` varchar(32) DEFAULT NULL COMMENT '工号',
  `teacher_comm_content` varchar(2000) DEFAULT NULL,
  `teacher_comm_status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`teacher_comm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_teacher_comment
#

LOCK TABLES `exam_teacher_comment` WRITE;
/*!40000 ALTER TABLE `exam_teacher_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_teacher_comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_user
#

DROP TABLE IF EXISTS `exam_user`;
CREATE TABLE `exam_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `user_status_id` varchar(2) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL COMMENT '用户名称',
  `user_cn_name` varchar(20) DEFAULT NULL,
  `user_first_name` varchar(20) DEFAULT NULL,
  `user_last_name` varchar(20) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `user_pass` varchar(32) NOT NULL DEFAULT '123456' COMMENT '用户密码',
  `user_type` varchar(50) DEFAULT NULL COMMENT '用户类型',
  `user_sex` varchar(50) NOT NULL DEFAULT '男' COMMENT '性别',
  `user_birthday_type` varchar(20) DEFAULT NULL,
  `user_birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `user_regtime` datetime DEFAULT NULL COMMENT '注册日期',
  `user_phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `user_cellphone` varchar(50) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL COMMENT 'email',
  `user_address_type` varchar(20) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL COMMENT '用户地址基础部分',
  `user_address_detail` varchar(255) DEFAULT NULL COMMENT '用户地址详细信息',
  `user_zip` varchar(50) DEFAULT NULL COMMENT '邮编',
  `user_last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `user_last_update` datetime DEFAULT NULL COMMENT '最后更新时间',
  `user_id_type` varchar(45) DEFAULT NULL COMMENT '用户证件类别',
  `user_id_number` varchar(45) DEFAULT NULL COMMENT '用户证件号码',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='基础用户表';

#
# Dumping data for table exam_user
#

LOCK TABLES `exam_user` WRITE;
/*!40000 ALTER TABLE `exam_user` DISABLE KEYS */;
INSERT INTO `exam_user` VALUES ('03b0121d732b29b2fe908eb563a0da3a',NULL,'dddd1234','ccc','aaa','bbb','test777','7fa8282ad93047a4d6fe6111c93b308a',NULL,'1','moon','1999-09-09','2012-02-14 17:50:06','02-1234-5687','010-8888-6666','dddd@tom.com','self','asdf','asdf','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('133a307b96e985949e4c12ea93f73f6a',NULL,'test2013','士大夫','adfa','asdf','test20122','96e79218965eb72c92a549dd5a330112',NULL,'0','moon','1988-08-18','2012-02-14 17:18:49','02-7943-1345','010-0000-0000','test2013@gmail.com','self','北京市','海淀区','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('201101011818',NULL,'test',NULL,NULL,NULL,'特特','test',NULL,'1',NULL,'2012-01-01','2012-01-01','13899998888',NULL,'test@tangce.net',NULL,'北京市海淀区','学院国际大厦','100191','2011-01-16','2011-01-16','1','010116587458581547');
INSERT INTO `exam_user` VALUES ('201101160950',NULL,'lk','立刻','andy','lau','','lk',NULL,'1',NULL,'2012-01-16','2012-01-01','138885210609',NULL,'liuk@tangce.net',NULL,'北京市海淀区','学院国际大厦','100191','2011-01-16','2011-01-16','1','010116587458581547');
INSERT INTO `exam_user` VALUES ('44229eeba182dfb7e435fbbda9caf1c1',NULL,'lk123','eeeeeee','dddd','eeeee','lk123','96e79218965eb72c92a549dd5a330112',NULL,'0','moon','1989-10-10','2012-02-14 17:57:13','02-1234-5687','010-2222-3333','lk@tangce.net','self','asdfsadf','asdfasdf','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('5e73de263f876b659a2e7d9c3989dbfd',NULL,'daocaozhu','朱俊青','pig','zjq','daocaozhu','de57eade11152a0d292000ef97e0e8bf',NULL,'1','moon','2011-10-10','2012-02-23 13:40:20','02-1234-2345','010-2345-7654','pigzjq@sina.com','self','发生发生地方萨芬','发发撒旦法','112234',NULL,NULL,NULL,'760406-2094810');
INSERT INTO `exam_user` VALUES ('600a673385c86455ec3302cfac950dfc',NULL,'andy123','立刻','andy','lau',NULL,'123456',NULL,'1','sun','1980-08-18','2012-02-06','010-1111-2222','010-5678-1234','andy@tom.com','company','宣武','动车','100191',NULL,NULL,'1','881012-2124122');
INSERT INTO `exam_user` VALUES ('7c458259d9794ef02e061ae55e0e150c',NULL,'test2012','嗯','en','en','test2012','96e79218965eb72c92a549dd5a330112',NULL,'1','moon','1988-08-09','2012-02-14 17:14:19','01-8974-4562','010-1343-8585','test2012@gmail.co','self','北京市','海淀区','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('90fad58c8c8643828251cf4977240922',NULL,'asdf123','asdf','adsfsa','asdf','test2016','96e79218965eb72c92a549dd5a330112',NULL,'0','moon','1989-09-09','2012-02-14 17:45:23','02-1344-4567','010-2222-3333','123445@tom.com','self','adsf','asdf','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('9899a18d23c28b771d1a1280fa109c18',NULL,'testtest',NULL,NULL,NULL,'1','123456',NULL,'1',NULL,'1988-08-08','2012-01-19','13815657847',NULL,'bb@tangce.net',NULL,'韩国釜山','知春路1号','100192',NULL,NULL,'1','881012-2124122');
INSERT INTO `exam_user` VALUES ('ab776782c5d5d44a312378676939fa4a',NULL,'andylau','安迪烙','andy','lau','test','96e79218965eb72c92a549dd5a330112',NULL,'1','moon','1988-08-08','2012-02-14 15:09:26','02-1234-1234','010-5678-1234','andy@gmail.com','self','北京市','海淀区学院国际大师赛','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('ac0148d97109a346865e27c851db5273',NULL,'test2',NULL,NULL,NULL,'张山','123456',NULL,'1',NULL,'1980-02-05','2012-01-19','13815657842',NULL,'test2@tangce.net',NULL,'北京市海淀区2','知春路12号','100192',NULL,NULL,'1','881012-2124122');
INSERT INTO `exam_user` VALUES ('b2254bf24be4e388b19db1087caf7a4b',NULL,'mmm123','nnn','ccc','vvv','kkk123','96e79218965eb72c92a549dd5a330112',NULL,'0','moon','1999-08-09','2012-02-14 18:00:18','02-1234-5687','010-2222-3333','mmm@tom.com','self','afasdf','asdfsadf','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('b8740e01f3ef3736b8bdabed93908054',NULL,'tomson','哥哥','andy','lk','tom','96e79218965eb72c92a549dd5a330112',NULL,'0',NULL,'1988-08-19','2012-02-06 16:20:55','02-1234-5678','010-6547-8975','tom@gmail.com',NULL,'北京','宣武','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('bdab383320b43b6c114a68396952534c',NULL,'test2014','a','a','a','test2014','96e79218965eb72c92a549dd5a330112',NULL,'0','moon','1987-07-07','2012-02-14 17:36:19','02-1234-5687','010-0000-1111','test2014@gmail.com','self','beijsha','asdfasdf','100195',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('bdca55d8ab628222af88304bd33a9fba',NULL,'liuk','英文','test','liuk','liuk','96e79218965eb72c92a549dd5a330112',NULL,'1','moon','1988-08-08','2012-02-23 16:32:38','02-1234-5678','010-5875-9874','liuk@tangce.net','self','ttest','test','100191',NULL,NULL,NULL,'881012-2124122');
INSERT INTO `exam_user` VALUES ('cf6ec70c6113d04822aa956d23693605',NULL,'judy',NULL,NULL,NULL,'judy','123456',NULL,'0',NULL,'1989-09-09','2012-02-06','010-0000-0000',NULL,'liuk@tangce.net',NULL,'北京市海淀区','学院国际大厦','100191','2012-02-06','2012-02-06','1','881012-2124122');
/*!40000 ALTER TABLE `exam_user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table exam_user_status
#

DROP TABLE IF EXISTS `exam_user_status`;
CREATE TABLE `exam_user_status` (
  `user_status_id` varchar(2) NOT NULL,
  `user_status_name` varchar(100) DEFAULT NULL,
  `user_status_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table exam_user_status
#

LOCK TABLES `exam_user_status` WRITE;
/*!40000 ALTER TABLE `exam_user_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_user_status` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
