<<<<<<< HEAD
﻿# Host: 127.0.0.1  (Version: 5.5.27)
# Date: 2013-09-07 01:49:26
# Generator: MySQL-Front 5.3  (Build 4.9)

/*!40101 SET NAMES utf8 */;

#
# Source for table "t_ad_channel"
#
=======
SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `adplatform`;

CREATE DATABASE `adplatform`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `adplatform`;
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_ad_channel`;
CREATE TABLE `t_ad_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) NOT NULL,
  `contact_tel` varchar(13) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `enable` int(2) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_del` tinyint(2) NOT NULL COMMENT '数据删除标识，0=未删除，1=已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_ad_channel"
#

INSERT INTO `t_ad_channel` VALUES (1,'指点传媒','186788875467','12312438833','叶落花开','广州广告CP',1,'2013-09-07 01:17:14',0),(2,'友魄广告','139788875467','727634627','电音女郎','北京广告组',1,'2013-09-07 01:17:43',0),(3,'友魄广告','139788875467','727634627','电音女郎','北京广告组',1,'2013-09-07 01:24:31',0);

#
# Source for table "t_ad_push"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_ad_push`;
CREATE TABLE `t_ad_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresource_id` int(11) NOT NULL,
  `top_push` tinyint(4) DEFAULT '0',
  `max_push` int(11) DEFAULT '1',
  `daily_push` int(11) DEFAULT '1' COMMENT '每日推送数',
  `total_push` int(11) DEFAULT '0' COMMENT '总推送数',
  `today_push` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '1=打开，0=关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_ad_push"
#

INSERT INTO `t_ad_push` VALUES (1,1,0,1,1,0,0,1);

#
# Source for table "t_ad_resource"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_ad_resource`;
CREATE TABLE `t_ad_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `ad_name` varchar(255) NOT NULL COMMENT '广告应用名称',
  `ad_title` varchar(255) DEFAULT NULL COMMENT '广告语文字',
  `ad_icon` varchar(255) DEFAULT NULL COMMENT '广告图标',
  `ad_banner` varchar(255) DEFAULT NULL,
  `desktop_icon` varchar(255) DEFAULT NULL COMMENT '桌面快捷方式图片',
  `ad_images` varchar(500) DEFAULT NULL COMMENT '应用图片组(a.jpg,c.jpg,b.jpg)',
  `ad_package` varchar(255) DEFAULT NULL COMMENT '应用包名',
  `file_size` double DEFAULT '0' COMMENT '安装包大小(KB)',
  `version` varchar(255) DEFAULT NULL COMMENT '应用版本',
  `support_platform` tinyint(3) DEFAULT '0' COMMENT '版本需要可选，0，android，1，iphone，2 ipad，3，91桌面',
  `app_type_id` int(8) DEFAULT '1' COMMENT ' 广告类型0:热门,1:应用,2:游戏',
  `charge_type` int(8) DEFAULT NULL COMMENT '收费类型',
  `price` double DEFAULT NULL COMMENT '单价',
  `clearing_form` varchar(10) DEFAULT NULL COMMENT '结算方式 ,CPA/CPS',
  `downloads` int(11) DEFAULT '0',
  `recommens` int(11) DEFAULT '0' COMMENT '推荐次数',
  `ad_rating` int(11) DEFAULT '0' COMMENT '广告资源推荐等级',
  `language` varchar(10) DEFAULT NULL COMMENT '语言，zh=中文，en=英文',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `modify_date` datetime DEFAULT NULL COMMENT '广告修时间',
  `create_date` datetime NOT NULL,
  `shelf_date` datetime DEFAULT NULL COMMENT '上架时间',
  `apk_url` varchar(255) DEFAULT NULL COMMENT 'apk 下载地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(8) DEFAULT '0' COMMENT '0,下架，1上架',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '标记删除',
  `is_recom` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否推荐，0=否，1=是',
  `display_position` int(1) DEFAULT '0' COMMENT '0=横屏，1=竖屏',
  `ad_mode` tinyint(3) DEFAULT '0' COMMENT '广告模式（1，本地，2，web页面）',
  `download_mode` tinyint(3) DEFAULT '0' COMMENT '下载模式，0：手动下载，1，WIFI自动下载，2，非WIFI自动下载，3，自动下载，4 91桌面下载模式',
  `install_mode` tinyint(3) DEFAULT '0' COMMENT '安装模式（iOS专用)，1 显示安装按钮并有提示信息， 2， 显示安装按钮但没有提示， 3， 自动安装',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_package` (`ad_package`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_ad_resource"
#

INSERT INTO `t_ad_resource` VALUES (1,1,'美女麻将写真馆','美女麻将写真馆，爽歪歪，美女麻将写真馆，爽歪歪','/home/sd/files/upload\\2\\adresource\\20130907\\icon/e43f374b497f458aa12467081aa26c92.png','/home/sd/files/upload\\2\\adresource\\20130907\\icon/2fd02a9689de4fea97a8088c3594e29a.png','/home/sd/files/upload\\2\\adresource\\20130907\\icon/775cdacedcd44f0a976608e716a2d0a7.png','','com.app.mvmj',12,'1.0',0,18,0,0,'CPA',0,0,0,'en','以各类美女为主题的麻将馆，漂亮可爱的美女在游戏里出现自然是免不了的，给玩家带来热情、养眼的感受。总共精心设定了6名特长跟战力各自不同的美女，是一款有趣、休闲、看美女的麻将游戏。如果你对自己有自信，赶快来体验吧。。 【游戏特色】 - 偷牌看牌特色道具 - 单机版无使用限制 - 不同关卡不同美女选择 - 选单功能齐全，业界最强友善选牌方式 - 让你感受仿在线玩家联机对战 - HD 高画质','2013-09-07 01:45:19','2013-09-07 01:36:40','2013-09-07 01:45:19','','2013-09-06 17:36:40','2014-07-07 01:36:40',1,0,0,0,0,0,0);

#
# Source for table "t_app_business"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_app_business`;
CREATE TABLE `t_app_business` (
  `app_id` int(11) NOT NULL,
  `allow_push` bit(1) DEFAULT b'0',
  `allow_richpush` bit(1) DEFAULT b'0',
  `allow_lbs` bit(1) DEFAULT b'0',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_app_business"
#


#
# Source for table "t_app_type"
#

DROP TABLE IF EXISTS `t_app_type`;
CREATE TABLE `t_app_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '应用类型名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent` int(11) DEFAULT NULL COMMENT '上一级分类',
  `visible` tinyint(4) DEFAULT NULL COMMENT '是否可见，1=可见，0=隐藏 ',
  `order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

#
# Data for table "t_app_type"
#

INSERT INTO `t_app_type` VALUES (1,'应用','应用分类',0,1,1),(2,'游戏','游戏分类',0,1,0),(3,'系统工具','',1,1,1),(4,'实用工具','',1,1,2),(5,'社交通信','',1,1,3),(6,'旅行天气','',1,1,4),(7,'影音漫画','',1,1,5),(8,'商务财经','',1,1,6),(9,'生活助手','',1,1,7),(10,'学习人文','',1,1,8),(11,'美化壁纸','',1,1,9),(12,'阅读资讯','',1,1,10),(13,'网络通讯','',1,1,11),(14,'电子书','',1,1,12),(15,'手机安全','',1,1,13),(16,'应用商店','',1,1,14),(17,'其它','',1,1,15),(18,'休闲益智','',2,1,16),(19,'策略棋牌','',2,1,17),(20,'角色扮演','',2,1,18),(21,'动作格斗','',2,1,19),(22,'射击飞行','',2,1,20),(23,'体育竞技','',2,1,21),(24,'网游游戏','',2,1,22),(25,'模拟游戏','',2,1,23);

#
# Source for table "t_apps"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_apps`;
CREATE TABLE `t_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `pkg` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `is_del` tinyint(1) DEFAULT '0' COMMENT 'status:   0-normal,    1-delete',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_appKey` (`app_key`),
  UNIQUE KEY `uq_uid_with_pkg` (`uid`,`pkg`),
  KEY `ind_appname` (`name`),
  KEY `ind_uid` (`uid`),
  KEY `ind_appKey` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_apps"
#

INSERT INTO `t_apps` VALUES (2,'2e7cffa9bd0905acc08cc6bb10783563',1350070,'微信','com.tencent.mm','drawable-hdpi#share_to_time_line_icon.png',17,1,0,'2013-07-19 08:15:55','2013-07-19 16:15:55');

#
# Source for table "t_category"
#

=======
DROP TABLE IF EXISTS `t_app_business`;
CREATE TABLE `t_app_business` (
  `app_id` int(11) NOT NULL,
  `allow_push` bit(1) DEFAULT b'0',
  `allow_richpush` bit(1) DEFAULT b'0',
  `allow_lbs` bit(1) DEFAULT b'0',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '应用类型名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent` int(11) DEFAULT NULL COMMENT '上一级分类',
  `visible` tinyint(4) DEFAULT NULL COMMENT '是否可见，1=可见，0=隐藏 ',
  `order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `t_category` VALUES (1,'应用','应用分类',0,1,1),(2,'游戏','游戏分类',0,1,0),(3,'系统工具','',1,1,1),(4,'实用工具','',1,1,2),(5,'社交通信','',1,1,3),(6,'旅行天气','',1,1,4),(7,'影音漫画','',1,1,5),(8,'商务财经','',1,1,6),(9,'生活助手','',1,1,7),(10,'学习人文','',1,1,8),(11,'美化壁纸','',1,1,9),(12,'阅读资讯','',1,1,10),(13,'网络通讯','',1,1,11),(14,'电子书','',1,1,12),(15,'手机安全','',1,1,13),(16,'应用商店','',1,1,14),(17,'其它','',1,1,15),(18,'休闲益智','',2,1,16),(19,'策略棋牌','',2,1,17),(20,'角色扮演','',2,1,18),(21,'动作格斗','',2,1,19),(22,'射击飞行','',2,1,20),(23,'体育竞技','',2,1,21),(24,'网游游戏','',2,1,22),(25,'模拟游戏','',2,1,23);

<<<<<<< HEAD
#
# Source for table "t_channel_user"
#
=======
DROP TABLE IF EXISTS `t_app_type`;
CREATE TABLE `t_app_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '应用类型名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent` int(11) DEFAULT NULL COMMENT '上一级分类',
  `visible` tinyint(4) DEFAULT NULL COMMENT '是否可见，1=可见，0=隐藏 ',
  `order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `t_app_type` VALUES ('1', '应用', '应用分类', '0', '1', '1');
INSERT INTO `t_app_type` VALUES ('2', '游戏', '游戏分类', '0', '1', '0');
INSERT INTO `t_app_type` VALUES ('3', '系统工具', '', '1', '1', '1');
INSERT INTO `t_app_type` VALUES ('4', '实用工具', '', '1', '1', '2');
INSERT INTO `t_app_type` VALUES ('5', '社交通信', '', '1', '1', '3');
INSERT INTO `t_app_type` VALUES ('6', '旅行天气', '', '1', '1', '4');
INSERT INTO `t_app_type` VALUES ('7', '影音漫画', '', '1', '1', '5');
INSERT INTO `t_app_type` VALUES ('8', '商务财经', '', '1', '1', '6');
INSERT INTO `t_app_type` VALUES ('9', '生活助手', '', '1', '1', '7');
INSERT INTO `t_app_type` VALUES ('10', '学习人文', '', '1', '1', '8');
INSERT INTO `t_app_type` VALUES ('11', '美化壁纸', '', '1', '1', '9');
INSERT INTO `t_app_type` VALUES ('12', '阅读资讯', '', '1', '1', '10');
INSERT INTO `t_app_type` VALUES ('13', '网络通讯', '', '1', '1', '11');
INSERT INTO `t_app_type` VALUES ('14', '电子书', '', '1', '1', '12');
INSERT INTO `t_app_type` VALUES ('15', '手机安全', '', '1', '1', '13');
INSERT INTO `t_app_type` VALUES ('16', '应用商店', '', '1', '1', '14');
INSERT INTO `t_app_type` VALUES ('17', '其它', '', '1', '1', '15');
INSERT INTO `t_app_type` VALUES ('18', '休闲益智', '', '2', '1', '16');
INSERT INTO `t_app_type` VALUES ('19', '策略棋牌', '', '2', '1', '17');
INSERT INTO `t_app_type` VALUES ('20', '角色扮演', '', '2', '1', '18');
INSERT INTO `t_app_type` VALUES ('21', '动作格斗', '', '2', '1', '19');
INSERT INTO `t_app_type` VALUES ('22', '射击飞行', '', '2', '1', '20');
INSERT INTO `t_app_type` VALUES ('23', '体育竞技', '', '2', '1', '21');
INSERT INTO `t_app_type` VALUES ('24', '网游游戏', '', '2', '1', '22');
INSERT INTO `t_app_type` VALUES ('25', '模拟游戏', '', '2', '1', '23');

DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_channel_user`;
CREATE TABLE `t_channel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` int(8) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_no` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型,0：平板，1：移动，2：联通，3：电信',
  PRIMARY KEY (`id`),
  KEY `T_CHANNEL_USER_LAST_UPDATE_TIME_IDX` (`last_update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_channel_user"
#


#
# Source for table "t_company"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_company"
#

INSERT INTO `t_company` VALUES (1,'上海龙旗','方案商','2013-09-07 01:11:56',1),(2,'上海熠鼎','手机方案商','2013-09-07 01:12:03',1);

#
# Source for table "t_config"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `cmd_name` varchar(100) NOT NULL,
  `cmd_value` varchar(300) DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmd_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_config"
#

/*!40000 ALTER TABLE `t_config` DISABLE KEYS */;
INSERT INTO `t_config` VALUES ('files_path','/home/sd/files','2013-05-28 08:59:14'),('released_sdk','sa_sdk_0.2.4.zip','2013-01-06 02:16:03');
/*!40000 ALTER TABLE `t_config` ENABLE KEYS */;

#
# Source for table "t_credentials"
#
=======
INSERT INTO `t_config` VALUES ('files_path', '/home/sd/files', '2013-05-28 08:59:14');
INSERT INTO `t_config` VALUES ('released_sdk', 'sa_sdk_0.2.4.zip', '2013-01-06 02:16:03');
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_credentials`;
CREATE TABLE `t_credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `credentials_type` tinyint(4) DEFAULT NULL COMMENT '证件类型',
  `credentials_no` varchar(45) DEFAULT NULL COMMENT '证据号码',
  `credentials_photo1` varchar(200) DEFAULT NULL COMMENT '证件正面照片地址',
  `credentials_photo2` varchar(200) DEFAULT NULL COMMENT '证件背面照片地址',
  `bank_name` varchar(45) DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(45) DEFAULT NULL COMMENT '银行卡号',
  `bank_account` varchar(45) DEFAULT NULL COMMENT '银行开户姓名',
  `bank_address` varchar(100) DEFAULT NULL COMMENT '银行地址',
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间，自动更新',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_credentials"
#


#
# Source for table "t_extra_applist"
#

DROP TABLE IF EXISTS `t_extra_applist`;
CREATE TABLE `t_extra_applist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord` int(11) DEFAULT NULL COMMENT '顺序',
  `name` varchar(45) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `previews_counts` tinyint(4) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `download_url` varchar(255) DEFAULT NULL,
  `download_counts` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order` (`ord`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

#
# Data for table "t_extra_applist"
#

/*!40000 ALTER TABLE `t_extra_applist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_extra_applist` ENABLE KEYS */;

#
# Source for table "t_menu"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(250) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `path` varchar(250) DEFAULT '' COMMENT '菜单路径',
  `parent` int(4) DEFAULT '0' COMMENT '父菜单',
  `visible` int(4) DEFAULT '1' COMMENT '是否可见：0-不可见，1-可见',
  `status` int(4) DEFAULT '0' COMMENT '是否有效 0-有效，1-无效',
  `order_no` varchar(50) DEFAULT '0' COMMENT '排序标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_menu"
#

INSERT INTO `t_menu` VALUES (1,'系统管理',NULL,'',0,1,1,'1'),(2,'新增用户','','/accounts/formpage.html',1,1,1,'111'),(3,'用户列表',NULL,'/accounts/listUser.html',1,1,1,'112'),(4,'新增角色',NULL,'/role/formpage.html',1,1,1,'121'),(5,'角色列表',NULL,'/role/listRole.html',1,1,1,'122'),(6,'新增菜单',NULL,'/menu/formpage.html',1,1,1,'131'),(7,'菜单列表',NULL,'/menu/listMenu.html',1,1,1,'132'),(8,'资源管理',NULL,'',0,1,1,'2'),(9,'资源录入',NULL,'/adresource/formpage.html',8,1,1,'211'),(10,'资源列表',NULL,'/adresource/list.html',8,1,1,'212'),(13,'查看权限',NULL,'/role/roleFormpage.html',1,0,1,'124'),(14,'设置角色权限',NULL,'/role/setRoleMenu.html',1,0,1,'125'),(15,'新增菜单',NULL,'/menu/formpage.html',1,0,1,'133'),(18,'查找资源',NULL,'/adResource/getAdResource.html',8,0,1,'213'),(19,'展示资源',NULL,'/adResource/showAdResource.html',8,0,1,'214'),(21,'修改资源',NULL,'/adResource/updateAdResource.html',8,0,1,'216'),(22,'编辑用户',NULL,'/user/editUser.html',1,0,1,'114'),(23,'修改用户角色&状态',NULL,'/user/updateUserRoleAndStatus.html',1,0,1,'115'),(24,'重置密码',NULL,'/ajax/updateUser.html',1,0,1,'116'),(25,'检测用户名',NULL,'/hasUser.html',1,0,1,'117'),(26,'开发者应用','','',0,1,1,'0'),(27,'应用上传','','/apps/create.html',26,1,1,'311'),(28,'上传应用action',NULL,'/appInfo/addAppInfo.html',26,0,1,'312'),(29,'应用列表','开发者个人应用列表','/apps/',26,1,1,'313'),(30,'查询应用',NULL,'/appInfo/selectAppInfo.html',26,0,1,'314'),(31,'修改应用',NULL,'/appInfo/updateAppInfo.html',26,0,1,'315'),(32,'删除应用',NULL,'/appInfo/deleteAppInfo.html',26,0,1,'316'),(33,'应用列表','所有开发者应用列表','/apps/listAll.html',26,1,1,'313'),(34,'SDK报表',NULL,'',0,1,1,'4'),(35,'用户报表',NULL,'/report/userDayReport.html',34,0,1,'411'),(36,'应用安装上报报表',NULL,'/report/appInstallReport.html',34,0,1,'412'),(37,'报表列管理',NULL,'',0,0,1,'5'),(38,'column列表',NULL,'/gridColumn/list.html',37,0,1,'511'),(39,'add报表列',NULL,'/gridColumn/formAdd.html',37,0,1,'512'),(40,'add报表列action',NULL,'/gridColumn/add.html',37,0,1,'513'),(41,'update报表列',NULL,'/gridColumn/formUpdate.html',37,0,1,'514'),(42,'update报表列action',NULL,'/gridColumn/update.html',37,0,1,'515'),(43,'delete报表列',NULL,'/gridColumn/delete.html',37,0,1,'516'),(44,'渠道报表',NULL,'',0,0,1,'6'),(45,'渠道列表',NULL,'/user/listChannelUser.html',1,0,1,'118'),(49,'修改支付项目',NULL,'/amountItem/updateForm.html',1,0,1,'144'),(50,'修改支付项目action',NULL,'/amountItem/update.html',1,0,1,'145'),(51,'删除支付项目',NULL,'/amountItem/delete.html',1,0,1,'146'),(52,'支付报表','渠道本身的支付报表 —— 对外','/report/channelAmountReport.html',44,0,1,'611'),(53,'支付报表','所有渠道支付报表 —— 对内','/report/allChannelAmountReport.html',44,0,1,'612'),(66,'财务中心','','',0,1,1,'3'),(67,'帐户管理','','',0,1,1,'4'),(68,'财务信息','','/financial/overview',66,1,1,'0'),(69,'财务明细','','/financial/accounts',66,1,1,'0'),(70,'申请汇款','','/financial/remittance',66,1,1,'0'),(71,'汇款记录','','/financial/remittance_history',66,1,1,'0'),(72,'收入报表','','',0,1,1,'2'),(73,'广告报表','','',0,1,1,'1'),(74,'小时统计','','',72,0,1,'0'),(75,'每日统计','','/report/incoming/daily',72,1,1,'0'),(76,'每月统计','','/report/incoming/monthly',72,1,1,'0'),(77,'广告推送','','/report/advert/pushes',73,1,1,'0'),(78,'应用内广告','','/report/advert/advertising',73,1,1,'0'),(79,'个人资料','','/accounts/overview',67,1,1,'0'),(80,'修改Email','','/accounts/change_email',67,1,1,'0'),(81,'修改资料','','/accounts/change_profile',67,1,1,'0'),(82,'修改密码','','/accounts/change_pwd',67,1,1,'0'),(83,'用户渠道','','',0,1,1,'0'),(84,'添加用户渠道','','/userchannel/formpage.html',83,1,1,'0'),(85,'用户渠道列表','','/userchannel/userChannelList.html',83,1,1,'0'),(86,'添加厂商','','/company/add.html',83,1,1,'0'),(87,'厂商列表','','/company/list.html',83,1,1,'0'),(88,'用户审核','','',0,1,1,'0'),(89,'用户审核列表','','/accounts/userReviewList.html',88,1,1,'0'),(90,'广告渠道管理','','',0,1,1,'0'),(91,'添加广告渠道','','/adchannel/formpage.html',90,1,1,'0'),(92,'修改渠道','','',90,0,1,'0'),(93,'渠道列表','','/adchannel/adChannelList.html',90,1,1,'0'),(94,'增加应用分类','','/apps/category/add.html',1,1,1,'8'),(95,'应用分类列表','','/apps/category/list.html',1,1,1,'7'),(96,'回收站','','/adresource/recycle/list.html',8,1,1,'3'),(1000,'广告控制管理','','',0,1,1,'0'),(1001,'广告推送控制列表','','/adpush/list.html',1000,1,1,'0'),(1002,'广告收入报表','','/rptpush/list.html',73,1,1,'0');

#
# Source for table "t_remittance"
#

=======
INSERT INTO `t_menu` VALUES (1,'系统管理',NULL,'',0,1,1,'1'),(2,'新增用户','','/accounts/formpage.html',1,1,1,'111'),(3,'用户列表',NULL,'/accounts/listUser.html',1,1,1,'112'),(4,'新增角色',NULL,'/role/formpage.html',1,1,1,'121'),(5,'角色列表',NULL,'/role/listRole.html',1,1,1,'122'),(6,'新增菜单',NULL,'/menu/formpage.html',1,1,1,'131'),(7,'菜单列表',NULL,'/menu/listMenu.html',1,1,1,'132'),(8,'资源管理',NULL,'',0,1,1,'2'),(9,'资源录入',NULL,'/adresource/formpage.html',8,1,1,'211'),(10,'资源列表',NULL,'/adresource/list.html',8,1,1,'212'),(13,'查看权限',NULL,'/role/roleFormpage.html',1,0,1,'124'),(14,'设置角色权限',NULL,'/role/setRoleMenu.html',1,0,1,'125'),(15,'新增菜单',NULL,'/menu/formpage.html',1,0,1,'133'),(18,'查找资源',NULL,'/adResource/getAdResource.html',8,0,1,'213'),(19,'展示资源',NULL,'/adResource/showAdResource.html',8,0,1,'214'),(21,'修改资源',NULL,'/adResource/updateAdResource.html',8,0,1,'216'),(22,'编辑用户',NULL,'/user/editUser.html',1,0,1,'114'),(23,'修改用户角色&状态',NULL,'/user/updateUserRoleAndStatus.html',1,0,1,'115'),(24,'重置密码',NULL,'/ajax/updateUser.html',1,0,1,'116'),(25,'检测用户名',NULL,'/hasUser.html',1,0,1,'117'),(26,'开发者应用','','',0,1,1,'0'),(27,'应用上传','','/apps/create.html',26,1,1,'311'),(28,'上传应用action',NULL,'/appInfo/addAppInfo.html',26,0,1,'312'),(29,'应用列表','开发者个人应用列表','/apps/',26,1,1,'313'),(30,'查询应用',NULL,'/appInfo/selectAppInfo.html',26,0,1,'314'),(31,'修改应用',NULL,'/appInfo/updateAppInfo.html',26,0,1,'315'),(32,'删除应用',NULL,'/appInfo/deleteAppInfo.html',26,0,1,'316'),(33,'应用列表','所有开发者应用列表','/apps/listAll.html',26,1,1,'313'),(34,'SDK报表',NULL,'',0,1,1,'4'),(35,'用户报表',NULL,'/report/userDayReport.html',34,0,1,'411'),(36,'应用安装上报报表',NULL,'/report/appInstallReport.html',34,0,1,'412'),(37,'报表列管理',NULL,'',0,0,1,'5'),(38,'column列表',NULL,'/gridColumn/list.html',37,0,1,'511'),(39,'add报表列',NULL,'/gridColumn/formAdd.html',37,0,1,'512'),(40,'add报表列action',NULL,'/gridColumn/add.html',37,0,1,'513'),(41,'update报表列',NULL,'/gridColumn/formUpdate.html',37,0,1,'514'),(42,'update报表列action',NULL,'/gridColumn/update.html',37,0,1,'515'),(43,'delete报表列',NULL,'/gridColumn/delete.html',37,0,1,'516'),(44,'渠道报表',NULL,'',0,0,1,'6'),(45,'渠道列表',NULL,'/user/listChannelUser.html',1,0,1,'118'),(49,'修改支付项目',NULL,'/amountItem/updateForm.html',1,0,1,'144'),(50,'修改支付项目action',NULL,'/amountItem/update.html',1,0,1,'145'),(51,'删除支付项目',NULL,'/amountItem/delete.html',1,0,1,'146'),(52,'支付报表','渠道本身的支付报表 —— 对外','/report/channelAmountReport.html',44,0,1,'611'),(53,'支付报表','所有渠道支付报表 —— 对内','/report/allChannelAmountReport.html',44,0,1,'612'),(66,'财务中心','','',0,1,1,'3'),(67,'帐户管理','','',0,1,1,'4'),(68,'财务信息','','/financial/overview',66,1,1,'0'),(69,'财务明细','','/financial/accounts',66,1,1,'0'),(70,'申请汇款','','/financial/remittance',66,1,1,'0'),(71,'汇款记录','','/financial/remittance_history',66,1,1,'0'),(72,'收入报表','','',0,1,1,'2'),(73,'广告报表','','',0,1,1,'1'),(74,'小时统计','','',72,0,1,'0'),(75,'每日统计','','/report/incoming/daily',72,1,1,'0'),(76,'每月统计','','/report/incoming/monthly',72,1,1,'0'),(77,'广告推送','','/report/advert/pushes',73,1,1,'0'),(78,'应用内广告','','/report/advert/advertising',73,1,1,'0'),(79,'个人资料','','/accounts/overview',67,1,1,'0'),(80,'修改Email','','/accounts/change_email',67,1,1,'0'),(81,'修改资料','','/accounts/change_profile',67,1,1,'0'),(82,'修改密码','','/accounts/change_pwd',67,1,1,'0'),(83,'用户渠道','','',0,1,1,'0'),(84,'添加用户渠道','','/userchannel/formpage.html',83,1,1,'0'),(85,'用户渠道列表','','/userchannel/userChannelList.html',83,1,1,'0'),(86,'添加厂商','','/company/add.html',83,1,1,'0'),(87,'厂商列表','','/company/list.html',83,1,1,'0'),(88,'用户审核','','',0,1,1,'0'),(89,'用户审核列表','','/accounts/userReviewList.html',88,1,1,'0'),(90,'广告渠道管理','','',0,1,1,'0'),(91,'添加广告渠道','','/adchannel/formpage.html',90,1,1,'0'),(92,'修改渠道','','',90,0,1,'0'),(93,'渠道列表','','/adchannel/adChannelList.html',90,1,1,'0'),(94,'增加应用分类','','/apps/category/add.html',1,1,1,'8'),(95,'应用分类列表','','/apps/category/list.html',1,1,1,'7'),(96,'回收站','','/adresource/recycle/list.html',8,1,1,'3'),(1000,'广告控制管理','','',0,1,1,'0'),(1001,'广告推送控制列表','','/adpush/list.html',1000,1,1,'0'),(1002,'广告收入报表','','/rptpush/list.html',73,1,1,'0');

>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_remittance`;
CREATE TABLE `t_remittance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` double DEFAULT NULL COMMENT '取款金额',
  `bank_account` varchar(45) DEFAULT NULL COMMENT '银行开户人姓名',
  `bank_name` varchar(45) DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(45) DEFAULT NULL COMMENT '银行卡号',
  `status` tinyint(4) DEFAULT '0' COMMENT '取款状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `remittance_time` timestamp NULL DEFAULT NULL COMMENT '汇款时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '申请汇款创建时间',
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间，自动更新',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_remittance"
#


#
# Source for table "t_report_daily"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_report_daily`;
CREATE TABLE `t_report_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idate` date NOT NULL,
  `uid` varchar(255) NOT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `kpi_code` varchar(255) DEFAULT NULL,
  `kpi_value` double DEFAULT '0' COMMENT '前端展示数据\n',
  `itime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_idate` (`idate`),
  KEY `ind_devId_code_appId` (`uid`,`kpi_code`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_report_daily"
#


#
# Source for table "t_report_hourly"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_report_hourly`;
CREATE TABLE `t_report_hourly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idate` int(10) unsigned NOT NULL,
  `ihour` int(8) DEFAULT NULL,
  `dev_id` varchar(255) NOT NULL,
  `app_id` double NOT NULL DEFAULT '0',
  `kpi_value_src` double DEFAULT '0',
  `kpi_code` varchar(255) DEFAULT NULL,
  `kpi_value` double DEFAULT '0',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ind_idate` (`idate`),
  KEY `ind_devId_code_appId` (`dev_id`,`kpi_code`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_report_hourly"
#


#
# Source for table "t_report_monthly"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_report_monthly`;
CREATE TABLE `t_report_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idate` date NOT NULL,
  `uid` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `kpi_code` varchar(255) DEFAULT NULL,
  `kpi_value` double DEFAULT '0' COMMENT '前端展示数据',
  `itime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_mon` (`idate`),
  KEY `ind_devId_code_appId` (`uid`,`kpi_code`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_report_monthly"
#


#
# Source for table "t_reset_pwd"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_reset_pwd`;
CREATE TABLE `t_reset_pwd` (
  `email` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` bit(1) NOT NULL COMMENT '0 is enable',
  PRIMARY KEY (`email`),
  UNIQUE KEY `id_token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_reset_pwd"
#

/*!40000 ALTER TABLE `t_reset_pwd` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_reset_pwd` ENABLE KEYS */;

#
# Source for table "t_role"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(4) DEFAULT '0' COMMENT '状态：0-有效 1-无效',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_role"
#

INSERT INTO `t_role` VALUES (1,'Admin',1,'2013-04-07 03:18:49'),(2,'运营管理',1,'2013-04-07 06:27:39'),(3,'个人开发者',1,'2013-04-22 08:13:21'),(4,'公司',1,'2013-05-14 06:01:05'),(5,'test',1,'2013-07-07 14:18:50');

#
# Source for table "t_role_menu"
#
=======
INSERT INTO `t_role` VALUES ('1', 'Admin', '1', '2013-04-07 03:18:49');
INSERT INTO `t_role` VALUES ('2', '运营管理', '1', '2013-04-07 06:27:39');
INSERT INTO `t_role` VALUES ('3', '个人开发者', '1', '2013-04-22 08:13:21');
INSERT INTO `t_role` VALUES ('4', '公司', '1', '2013-05-14 06:01:05');
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色ID',
  `menu_id` int(4) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1877 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_role_menu"
#

INSERT INTO `t_role_menu` VALUES (1565,4,66),(1566,4,68),(1567,4,69),(1568,4,70),(1569,4,71),(1570,4,67),(1571,4,79),(1572,4,80),(1573,4,81),(1574,4,82),(1575,4,72),(1576,4,74),(1577,4,75),(1578,4,76),(1579,4,73),(1580,4,77),(1581,4,78),(1582,4,26),(1583,4,27),(1584,4,28),(1585,4,29),(1586,4,30),(1587,4,31),(1588,4,32),(1614,5,66),(1615,5,68),(1616,5,69),(1617,5,70),(1618,5,71),(1619,5,67),(1620,5,79),(1621,5,80),(1622,5,81),(1623,5,82),(1624,5,72),(1625,5,74),(1626,5,75),(1627,5,76),(1628,5,73),(1629,5,77),(1630,5,78),(1631,5,83),(1632,5,84),(1633,5,85),(1634,5,86),(1635,5,87),(1636,5,88),(1637,5,89),(1638,5,90),(1639,5,91),(1640,5,92),(1641,5,93),(1642,5,1),(1643,5,2),(1644,5,3),(1645,5,22),(1646,5,23),(1647,5,24),(1648,5,25),(1649,5,45),(1650,5,4),(1651,5,5),(1652,5,13),(1653,5,14),(1654,5,6),(1655,5,7),(1656,5,15),(1657,5,16),(1658,5,17),(1659,5,46),(1660,5,47),(1661,5,48),(1662,5,49),(1663,5,50),(1664,5,51),(1665,5,8),(1666,5,9),(1667,5,10),(1668,5,18),(1669,5,19),(1670,5,21),(1671,5,26),(1672,5,27),(1673,5,28),(1674,5,29),(1675,5,33),(1676,5,30),(1677,5,31),(1678,5,32),(1721,3,66),(1722,3,68),(1723,3,69),(1724,3,70),(1725,3,71),(1726,3,67),(1727,3,79),(1728,3,80),(1729,3,81),(1730,3,82),(1731,3,72),(1732,3,75),(1733,3,76),(1734,3,73),(1735,3,77),(1736,3,78),(1737,3,26),(1738,3,27),(1739,3,28),(1740,3,29),(1741,3,30),(1742,3,31),(1743,3,32),(1832,2,26),(1833,2,33),(1834,2,83),(1835,2,84),(1836,2,85),(1837,2,86),(1838,2,87),(1839,2,88),(1840,2,89),(1841,2,90),(1842,2,91),(1843,2,92),(1844,2,93),(1845,2,1000),(1846,2,1001),(1847,2,73),(1848,2,1002),(1849,2,8),(1850,2,9),(1851,2,10),(1852,2,18),(1853,2,19),(1854,2,21),(1855,2,96),(1856,1,1),(1857,1,2),(1858,1,3),(1859,1,22),(1860,1,23),(1861,1,24),(1862,1,25),(1863,1,45),(1864,1,4),(1865,1,5),(1866,1,13),(1867,1,14),(1868,1,6),(1869,1,7),(1870,1,15),(1871,1,49),(1872,1,50),(1873,1,51),(1874,1,95),(1875,1,94),(1876,1,96);

#
# Source for table "t_rpt_push"
#

=======
INSERT INTO `t_role_menu` VALUES (1565,4,66),(1566,4,68),(1567,4,69),(1568,4,70),(1569,4,71),(1570,4,67),(1571,4,79),(1572,4,80),(1573,4,81),(1574,4,82),(1575,4,72),(1576,4,74),(1577,4,75),(1578,4,76),(1579,4,73),(1580,4,77),(1581,4,78),(1582,4,26),(1583,4,27),(1584,4,28),(1585,4,29),(1586,4,30),(1587,4,31),(1588,4,32),(1614,5,66),(1615,5,68),(1616,5,69),(1617,5,70),(1618,5,71),(1619,5,67),(1620,5,79),(1621,5,80),(1622,5,81),(1623,5,82),(1624,5,72),(1625,5,74),(1626,5,75),(1627,5,76),(1628,5,73),(1629,5,77),(1630,5,78),(1631,5,83),(1632,5,84),(1633,5,85),(1634,5,86),(1635,5,87),(1636,5,88),(1637,5,89),(1638,5,90),(1639,5,91),(1640,5,92),(1641,5,93),(1642,5,1),(1643,5,2),(1644,5,3),(1645,5,22),(1646,5,23),(1647,5,24),(1648,5,25),(1649,5,45),(1650,5,4),(1651,5,5),(1652,5,13),(1653,5,14),(1654,5,6),(1655,5,7),(1656,5,15),(1657,5,16),(1658,5,17),(1659,5,46),(1660,5,47),(1661,5,48),(1662,5,49),(1663,5,50),(1664,5,51),(1665,5,8),(1666,5,9),(1667,5,10),(1668,5,18),(1669,5,19),(1670,5,21),(1671,5,26),(1672,5,27),(1673,5,28),(1674,5,29),(1675,5,33),(1676,5,30),(1677,5,31),(1678,5,32),(1721,3,66),(1722,3,68),(1723,3,69),(1724,3,70),(1725,3,71),(1726,3,67),(1727,3,79),(1728,3,80),(1729,3,81),(1730,3,82),(1731,3,72),(1732,3,75),(1733,3,76),(1734,3,73),(1735,3,77),(1736,3,78),(1737,3,26),(1738,3,27),(1739,3,28),(1740,3,29),(1741,3,30),(1742,3,31),(1743,3,32),(1832,2,26),(1833,2,33),(1834,2,83),(1835,2,84),(1836,2,85),(1837,2,86),(1838,2,87),(1839,2,88),(1840,2,89),(1841,2,90),(1842,2,91),(1843,2,92),(1844,2,93),(1845,2,1000),(1846,2,1001),(1847,2,73),(1848,2,1002),(1849,2,8),(1850,2,9),(1851,2,10),(1852,2,18),(1853,2,19),(1854,2,21),(1855,2,96),(1856,1,1),(1857,1,2),(1858,1,3),(1859,1,22),(1860,1,23),(1861,1,24),(1862,1,25),(1863,1,45),(1864,1,4),(1865,1,5),(1866,1,13),(1867,1,14),(1868,1,6),(1869,1,7),(1870,1,15),(1871,1,49),(1872,1,50),(1873,1,51),(1874,1,95),(1875,1,94),(1876,1,96);

>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_rpt_push`;
CREATE TABLE `t_rpt_push` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idate` decimal(8,0) NOT NULL COMMENT '日期',
  `ad_id` decimal(12,0) NOT NULL COMMENT '广告id',
  `push` decimal(10,0) DEFAULT '0' COMMENT '拉取数',
  `arrive` decimal(10,0) DEFAULT '0' COMMENT '送达数',
  `shows` decimal(10,0) DEFAULT '0' COMMENT '展示数',
  `click` decimal(10,0) DEFAULT '0' COMMENT '点击数',
  `download` decimal(10,0) DEFAULT '0' COMMENT '下载数',
  `fail` decimal(10,0) DEFAULT '0' COMMENT '下载失败数',
  `download_success` decimal(10,0) DEFAULT '0' COMMENT '下载成功数',
  `install` decimal(10,0) DEFAULT '0' COMMENT '安装数',
  `active` decimal(10,0) DEFAULT '0' COMMENT '激活数',
  `revenue` decimal(10,2) DEFAULT '0.00' COMMENT '收入',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_key` (`idate`,`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_rpt_push"
#


#
# Source for table "t_temp_apps"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_temp_apps`;
CREATE TABLE `t_temp_apps` (
  `app_key` varchar(45) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pkg` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`app_key`),
  KEY `ind_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_temp_apps"
#


#
# Source for table "t_transfer_history"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_transfer_history`;
CREATE TABLE `t_transfer_history` (
  `transfer_no` varchar(32) NOT NULL COMMENT 'trade no, 32 md5.',
  `uid` int(11) NOT NULL,
  `pay_type` tinyint(1) NOT NULL COMMENT '1: paypal,   2: wire',
  `pay_info` varchar(1000) NOT NULL COMMENT 'payment details',
  `transfer_amount` double NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `last_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transfer_no`),
  UNIQUE KEY `trade_no_UNIQUE` (`transfer_no`),
  KEY `id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_transfer_history"
#


#
# Source for table "t_user"
#

=======
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `account_name` varchar(20) NOT NULL COMMENT '帐户名称',
  `account_pwd` varchar(32) NOT NULL COMMENT '帐户密码',
  `email` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '角色类型',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_tel` varchar(45) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '注册日期',
  `login_token` varchar(50) DEFAULT NULL,
  `login_token_time` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1350073 DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','admin@adplatform.com',1,'','系统管理员','',NULL,'','2013-06-02 17:43:46','5179a4b7200a4af5a4eb232f9a737a3a','2013-09-06 23:40:49',1),(1350071,'company','e10adc3949ba59abbe56e057f20f883e','company@adplatform.com',4,'','公司','','',NULL,'2013-07-08 00:13:23','','2013-07-15 18:31:52',1),(1350070,'developer','e10adc3949ba59abbe56e057f20f883e','developer@adplatform.com',3,'','个人开发者','','',NULL,'2013-07-08 00:13:23','c889d0f9bba14aa89908eba5bc1e3373','2013-08-12 17:37:09',1),(1350072,'jiandong','692df0468e7688ba44f588dd714c1927','jiandong@powerallnetworks.com',1,NULL,'覃建栋','13631661621',NULL,'http://localhost:8080','2013-08-09 09:43:44',NULL,NULL,0),(2,'spadmin','e10adc3949ba59abbe56e057f20f883e','spadmin@adplatform.com',2,'','运营管理员','',NULL,'','2013-07-08 00:12:45','f236d54799f84dea8ee0708cd0d837c0','2013-09-07 01:29:54',1);

#
# Source for table "t_user_account"
#
=======
INSERT INTO `t_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@adplatform.com', '1', '', '系统管理员', '', null, '', '2013-06-02 17:43:46', '26b7971d5c0e4ec3815205effd50f1a2', '2013-08-12 16:40:34', '1');
INSERT INTO `t_user` VALUES ('2', 'spadmin', 'e10adc3949ba59abbe56e057f20f883e', 'spadmin@adplatform.com', '2', '', '运营管理员', '', null, '', '2013-07-08 00:12:45', 'b65792a641a7493790c1f4192e9180e8', '2013-09-05 13:42:45', '1');
INSERT INTO `t_user` VALUES ('1350071', 'company', 'e10adc3949ba59abbe56e057f20f883e', 'company@adplatform.com', '4', '', '公司', '', '', null, '2013-07-08 00:13:23', '', '2013-07-15 18:31:52', '1');
INSERT INTO `t_user` VALUES ('1350070', 'developer', 'e10adc3949ba59abbe56e057f20f883e', 'developer@adplatform.com', '3', '', '个人开发者', '', '', null, '2013-07-08 00:13:23', 'c889d0f9bba14aa89908eba5bc1e3373', '2013-08-12 17:37:09', '1');
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE `t_user_account` (
  `uid` varchar(20) NOT NULL COMMENT '用户',
  `balance` double NOT NULL COMMENT '余额',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新日期',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

<<<<<<< HEAD
#
# Data for table "t_user_account"
#

INSERT INTO `t_user_account` VALUES ('1',0,'2013-06-02 02:41:21'),('1350070',0,'2013-06-06 16:57:00'),('1350071',0,'2013-06-06 16:57:00'),('1350072',0,'2013-08-09 09:43:44'),('2',0,'2013-06-02 09:47:41');

#
# Source for table "t_user_channel"
#
=======
INSERT INTO `t_user_account` VALUES ('1', '0', '2013-06-02 02:41:21');
INSERT INTO `t_user_account` VALUES ('2', '0', '2013-06-02 09:47:41');
INSERT INTO `t_user_account` VALUES ('1350070', '0', '2013-06-06 16:57:00');
INSERT INTO `t_user_account` VALUES ('1350071', '0', '2013-06-06 16:57:00');
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113

DROP TABLE IF EXISTS `t_user_channel`;
CREATE TABLE `t_user_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `channel_no` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `T_CHANNEL_USER_LAST_UPDATE_TIME_IDX` (`last_update_time`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_user_channel"
#

INSERT INTO `t_user_channel` VALUES (1,1,'上海龙旗','sh-001-offshore','上海龙旗海外渠道','2013-09-07 01:16:20','2013-09-07 01:16:20',1);
=======
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
>>>>>>> 25de632fcf3073056191bb2e5fffa2b76b67a113
