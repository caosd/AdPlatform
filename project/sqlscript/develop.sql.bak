/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : stomato

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-06-07 18:48:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_advert_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_advert_test`;
CREATE TABLE `t_advert_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `test_key` varchar(50) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_advert_test
-- ----------------------------

-- ----------------------------
-- Table structure for `t_apps`
-- ----------------------------
DROP TABLE IF EXISTS `t_apps`;
CREATE TABLE `t_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `pkg` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `is_del` tinyint(1) DEFAULT '0' COMMENT 'status:   0-normal,    1-delete',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL,
  `allow_push` bit(1) DEFAULT b'0' COMMENT '广告推送开关',
  `allow_trustee` bit(1) DEFAULT b'0' COMMENT '托管开关',
  `delay_push_interval` int(11) DEFAULT '0' COMMENT '广告关闭后推送延迟时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_appKey` (`app_key`),
  UNIQUE KEY `uq_uid_with_pkg` (`uid`,`pkg`),
  KEY `ind_appname` (`name`),
  KEY `ind_uid` (`uid`),
  KEY `ind_appKey` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_apps
-- ----------------------------
INSERT INTO `t_apps` VALUES ('1', 'fd62421b5824f4af33887e79462b75bb', '23', '大白菜', 'com.skycall.oem', 'drawable-mdpi#icon.png', '1', '0', '2013-06-07 00:07:20', '2013-06-05 17:58:17', '', '', '0');
INSERT INTO `t_apps` VALUES ('2', '9a3b327c837794a67e854a2c24d32b46', '23', '小青菜', 'com.elevenbitstudios.FunkySmugglers', 'drawable-xxhdpi#icon.png', '1', '0', '2013-06-05 18:04:03', '2013-06-05 18:04:03', '', '', '0');
INSERT INTO `t_apps` VALUES ('3', '678f1cfeaf2cfe14207d90c998acc70b', '23', '红萝卜', 'com.appspot.swisscodemonkeys.camerafx', 'drawable-ldpi#ic_launcher_camera2.png', '1', '1', '2013-06-07 00:07:10', '2013-06-07 00:06:15', '', '', '0');

-- ----------------------------
-- Table structure for `t_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `cmd_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `cmd_value` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmd_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('released_sdk', 'sa_sdk_0.2.4.zip', '2013-01-06 10:16:03');
INSERT INTO `t_config` VALUES ('files_path', '/files', '2013-05-28 16:59:14');

-- ----------------------------
-- Table structure for `t_credentials`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credentials
-- ----------------------------
INSERT INTO `t_credentials` VALUES ('1', '20', '1', '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 12:05:25', '2013-05-29 22:48:23');
INSERT INTO `t_credentials` VALUES ('2', '18', '1', '123456789', '', '', '中国工商银行', '123567', 'aaa', 'com', '2013-06-02 15:25:40', '2013-06-02 15:25:40');
INSERT INTO `t_credentials` VALUES ('3', '23', '1', '123456789', '1_123456789_photo1.png', '1_123456789_photo2.jpeg', '中国工商银行', '622655555555', '张三', '深圳', '2013-06-06 23:05:45', '2013-06-06 23:05:45');

-- ----------------------------
-- Table structure for `t_extra_applist`
-- ----------------------------
DROP TABLE IF EXISTS `t_extra_applist`;
CREATE TABLE `t_extra_applist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ord` int(11) DEFAULT NULL COMMENT '顺序',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `size` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `previews_counts` tinyint(4) DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `download_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `download_counts` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order` (`ord`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_extra_applist
-- ----------------------------
INSERT INTO `t_extra_applist` VALUES ('1', '1', '明年赚多少', '3.2MB', '1.0', null, '明年赚多少？你说了算！隐藏在手机里的财富等你来挖掘！<br/>轻轻摇晃手机，控制财神爷，接住天上掉下来的金币啦。专为新年打造的贺岁版财富游戏，祝愿大家金币赚满盆，来年发大财！好寓意，好兆头，尽情赚！', 'http://cdn.market.hiapk.com/data/upload/2012/12_28/18/com.topappcamp.forturnerain_182449.apk', '120.000+');
INSERT INTO `t_extra_applist` VALUES ('2', '2', '极速手电筒', '3.53MB', '1.0', null, '一款简单实用、反应迅速的手电应用。当你走进黑黑的楼洞、街道，或者在黑暗中寻找物品时，它能快速的为您提供照明功能。<br/><br/>软件特点：<br/>1.支持设备范围最广泛；<br/>2.操作更快、更便捷；<br/>3.更省电、节能。', 'http://cdn.market.hiapk.com/data/upload/2012/12_21/13/com.topappcamp.flashLed_134601.apk', '150.000+');
INSERT INTO `t_extra_applist` VALUES ('3', '3', '3D全景拍照', '6.11MB', '1.0.0', null, '3D全景拍照，让你享受360°全景美图！<br/>3D全景拍照是一款让你的Android 设备能够拍摄出360°全景图片的拍照软件。移动你的Mobile Phone，连续扑捉心动的镜头，点击完成，软件自动为您处理成全景照片。如果你厌倦了传统单一的相片模式，如果你玩腻了美图秀秀的相框模式，不如试试全新3D效果的全景拍照吧！<br/><br/>软件功能：<br/>1.360度3D全景效果;<br/>2.自动合成照片;<br/>3.自动拍照;<br/>4.自动对焦;<br/>5.照片存到SD卡;<br/>6.高清模式。', 'http://cdn.market.hiapk.com/data/upload/2013/01_11/14/com.topappcamp.camerafull_142723.apk', '350.000+');
INSERT INTO `t_extra_applist` VALUES ('4', '4', '毛毛世界', '4.21MB', '1.68', null, '就当大家都沉浸在迎接新年的喜悦之中，毛毛世界却遭遇了突如其来的恶魔侵扰，为了保卫毛毛们的美好家园，天使与恶魔之间的保卫战随即拉开。还毛毛们一个幸福家园迎接新年，让所有恶魔都化作灰烬吧！<br/><br/>游戏方法：<br/>点击交换相邻毛毛，形成水平或垂直的三个或更多的毛毛，帮助天使消灭侵入家园的恶魔，让它们烧成灰烬；当更多毛毛相遇时，可触发连锁反应形成级联，同时可获得奖励积分。赶快行动起来帮助天使对抗恶魔吧！', 'http://cdn.market.hiapk.com/data/upload/2013/01_21/11/com.topappcamp.worldofmaomao_110654.apk', '170.000+');
INSERT INTO `t_extra_applist` VALUES ('6', '6', '匹格猪', '4.98MB', '1.0', null, '贪吃的匹格猪怆然闯入了猴子看守的水果园，为了吃掉所有水果，匹格猪和猴子展开了一场斗智斗勇的抢夺战。猴子也拿出自己的看家本领守护果园，原地打圈，固定路线移动，缓慢靠近的防守让匹格猪只能不停躲闪，最后匹格猪能吃掉所有水果嚒？来自秘鲁的休闲小游戏必定让你感受非一般的重力体验。', 'http://www.stomato.com.cn/uploads/pig_goapk_1.0.0.apk', '140.000+');
INSERT INTO `t_extra_applist` VALUES ('5', '5', '咔布咔', '43.6MB', '1.0.5', null, '在绮丽幻化的星球，咔布咔拥有各式超乎想象的能力，凭借智慧冲击一个又一个设计巧妙的关卡，解决各种不可能的障碍，收集足够的手纸卷完成关卡，赢得和大怪兽决斗的机会！来自白俄罗斯超好玩的益智类动作游戏，让你爱上这种“虐”智商的感觉！', 'http://www.stomato.com.cn/uploads/wimp-stomato_1.0.5.apk', '180.000+');

-- ----------------------------
-- Table structure for `t_payment`
-- ----------------------------
DROP TABLE IF EXISTS `t_payment`;
CREATE TABLE `t_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pay_type` tinyint(1) NOT NULL COMMENT '1: paypal,   2: wire',
  `paypal_login` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `beneficiary_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `bank_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `iban` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `swift_code` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `is_intermediary` bit(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_remittance`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_remittance
-- ----------------------------
INSERT INTO `t_remittance` VALUES ('1', '20', '10', '覃建栋', '华夏银行', '425202520014225852', '0', null, null, '2013-06-02 10:41:37', '2013-06-02 10:41:37');
INSERT INTO `t_remittance` VALUES ('2', '18', '12', 'aaa', '中国工商银行', '123567', '0', null, null, '2013-06-02 15:26:12', '2013-06-02 15:26:12');
INSERT INTO `t_remittance` VALUES ('3', '20', '12', '覃建栋', '华夏银行', '425202520014225852', '0', null, null, '2013-06-02 15:35:20', '2013-06-02 15:35:20');

-- ----------------------------
-- Table structure for `t_report_daily`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_daily
-- ----------------------------
INSERT INTO `t_report_daily` VALUES ('1', '2013-06-02', '20', '305', 'sm_total_users', '20', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('2', '2013-06-02', '20', '305', 'sm_total_users', '5', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('3', '2013-06-02', '20', '305', 'sm_push_times', '1', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('4', '2013-06-02', '20', '305', 'sm_display_times', '7', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('5', '2013-06-02', '20', '305', 'sm_new_users', '6', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('6', '2013-06-02', '20', '305', 'sm_online_users', '44', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('7', '2013-06-02', '20', '305', 'sm_conversion_rate', '30', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('8', '2013-06-02', '20', '305', 'sm_fill_rate', '20', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('9', '2013-06-02', '20', '305', 'sm_money_pushes', '30', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('10', '2013-06-02', '20', '305', 'sm_money_advertising', '70', '2013-06-02 08:47:25');
INSERT INTO `t_report_daily` VALUES ('11', '2013-06-02', '20', '306', 'sm_total_users', '20', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('12', '2013-06-02', '20', '306', 'sm_push_times', '110', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('13', '2013-06-02', '20', '306', 'sm_display_times', '650', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('14', '2013-06-02', '20', '306', 'sm_new_users', '440', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('15', '2013-06-02', '20', '306', 'sm_online_users', '320', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('16', '2013-06-02', '20', '306', 'sm_conversion_rate', '20', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('17', '2013-06-02', '20', '306', 'sm_fill_rate', '70', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('18', '2013-06-02', '20', '306', 'sm_money_pushes', '234.9', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('19', '2013-06-02', '20', '306', 'sm_money_advertising', '220', '2013-06-02 09:01:26');
INSERT INTO `t_report_daily` VALUES ('20', '2013-06-02', '20', '306', 'sm_total_users', '20', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('21', '2013-06-02', '20', '306', 'sm_push_times', '110', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('22', '2013-06-02', '20', '306', 'sm_display_times', '650', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('23', '2013-06-02', '20', '306', 'sm_new_users', '440', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('24', '2013-06-02', '20', '306', 'sm_online_users', '320', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('25', '2013-06-02', '20', '306', 'sm_conversion_rate', '320', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('26', '2013-06-02', '20', '306', 'sm_fill_rate', '10', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('27', '2013-06-02', '20', '306', 'sm_money_pushes', '56.9', '2013-06-02 09:07:29');
INSERT INTO `t_report_daily` VALUES ('28', '2013-06-02', '20', '306', 'sm_money_advertising', '35', '2013-06-02 09:07:29');

-- ----------------------------
-- Table structure for `t_report_hourly`
-- ----------------------------
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

-- ----------------------------
-- Records of t_report_hourly
-- ----------------------------

-- ----------------------------
-- Table structure for `t_report_monthly`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_monthly
-- ----------------------------
INSERT INTO `t_report_monthly` VALUES ('1', '2013-06-02', '20', '306', 'sm_total_users', '20', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('2', '2013-06-02', '20', '306', 'sm_push_times', '110', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('3', '2013-06-02', '20', '306', 'sm_display_times', '650', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('4', '2013-06-02', '20', '306', 'sm_new_users', '440', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('5', '2013-06-02', '20', '306', 'sm_online_users', '320', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('6', '2013-06-02', '20', '306', 'sm_conversion_rate', '20', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('7', '2013-06-02', '20', '306', 'sm_fill_rate', '70', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('8', '2013-06-02', '20', '306', 'sm_money_pushes', '234.9', '2013-06-02 09:08:36');
INSERT INTO `t_report_monthly` VALUES ('9', '2013-06-02', '20', '306', 'sm_money_advertising', '220', '2013-06-02 09:08:36');

-- ----------------------------
-- Table structure for `t_reset_pwd`
-- ----------------------------
DROP TABLE IF EXISTS `t_reset_pwd`;
CREATE TABLE `t_reset_pwd` (
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `token` varchar(80) COLLATE utf8_bin NOT NULL,
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` bit(1) NOT NULL COMMENT '0 is enable',
  PRIMARY KEY (`email`),
  UNIQUE KEY `id_token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_reset_pwd
-- ----------------------------

-- ----------------------------
-- Table structure for `t_temp_apps`
-- ----------------------------
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

-- ----------------------------
-- Records of t_temp_apps
-- ----------------------------
INSERT INTO `t_temp_apps` VALUES ('01880cff2ba30b0ee48b4ffd1f9d8c6f', '23', 'tomcat', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-04 16:21:47', '2013-06-04 16:21:47');
INSERT INTO `t_temp_apps` VALUES ('0bd0eb861a00e0b1f0885f2ee619cfa2', '23', 'tomcat', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-04 16:23:19', '2013-06-04 16:23:19');
INSERT INTO `t_temp_apps` VALUES ('25160fcc09db77c4eb7e5b8547aa7f20', '23', 'stand', 'com.skycall.oem', '0', '2013-06-04 16:51:20', '2013-06-04 16:51:20');
INSERT INTO `t_temp_apps` VALUES ('4be7f1078b965ca25a4c4824f0b84872', '23', 'tomcat', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-04 16:11:13', '2013-06-04 16:11:13');
INSERT INTO `t_temp_apps` VALUES ('516bf5a567d9cca38b266782b37f5116', '23', 'camera360', 'vStudio.Android.Camera360\r', '0', '2013-06-07 18:35:17', '2013-06-07 18:35:17');
INSERT INTO `t_temp_apps` VALUES ('6f13b74bb9482c5e56f748242eb15fe3', '23', 'hello', 'com.appspot.swisscodemonkeys.camerafx', '0', '2013-06-02 17:51:50', '2013-06-02 17:51:50');
INSERT INTO `t_temp_apps` VALUES ('84028c32bb095f6fa429ff3b0dbd8786', '23', 'oooooo', 'com.appspot.swisscodemonkeys.camerafx', '0', '2013-06-05 16:11:28', '2013-06-05 16:11:28');
INSERT INTO `t_temp_apps` VALUES ('9a3b327c837794a67e854a2c24d32b46', '23', '小青菜', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-05 18:04:00', '2013-06-05 18:04:00');
INSERT INTO `t_temp_apps` VALUES ('a16f60cc6e84d2af29b7ad4967ad66ee', '23', 'tomcat', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-04 16:11:30', '2013-06-04 16:11:30');
INSERT INTO `t_temp_apps` VALUES ('a4ff1b50c6404a8622de1d48724fcf9d', '23', '白啊', 'com.elevenbitstudios.FunkySmugglers', '0', '2013-06-04 19:21:22', '2013-06-04 19:21:22');
INSERT INTO `t_temp_apps` VALUES ('a52286f46d778b244a0ad5e785db8298', '23', 'camera360', 'vStudio.Android.Camera360\r', '0', '2013-06-07 18:37:13', '2013-06-07 18:37:13');
INSERT INTO `t_temp_apps` VALUES ('b525de412cdae3aa274fd32cb21084c4', '23', '大炮', 'com.skycall.oem', '0', '2013-06-05 16:10:45', '2013-06-05 16:10:45');
INSERT INTO `t_temp_apps` VALUES ('f525a2fd94e951419b057765de3871c4', '23', 'tomcat', 'com.skycall.oem', '0', '2013-06-04 16:35:31', '2013-06-04 16:35:31');
INSERT INTO `t_temp_apps` VALUES ('fd62421b5824f4af33887e79462b75bb', '23', '大白菜', 'com.skycall.oem', '0', '2013-06-05 17:58:12', '2013-06-05 17:58:12');

-- ----------------------------
-- Table structure for `t_transfer_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_transfer_history`;
CREATE TABLE `t_transfer_history` (
  `transfer_no` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'trade no, 32 md5.',
  `uid` int(11) NOT NULL,
  `pay_type` tinyint(1) NOT NULL COMMENT '1: paypal,   2: wire',
  `pay_info` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT 'payment details',
  `transfer_amount` double NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `last_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transfer_no`),
  UNIQUE KEY `trade_no_UNIQUE` (`transfer_no`),
  KEY `id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_transfer_history
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `account_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '帐户名称',
  `account_pwd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '帐户密码',
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '帐户类型：1个人，2公司',
  `company` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `contact_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `contact_tel` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '注册日期',
  `login_token` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `login_token_time` datetime DEFAULT NULL,
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('22', 'admin', '4297F44B13955235245B2497399D7A93', '144@qq.com', '1', 'asdfa', 'kjhk', 'jhkj', 'hkh', 'www.baidu.com', '2013-06-02 17:43:46', '28a79df11ac8460abb419dfd363c40ff', '2013-06-07 01:00:18');
INSERT INTO `t_user` VALUES ('23', 'admin2', '4297F44B13955235245B2497399D7A93', 'www@qq.com', '1', null, '', '', '', '', '2013-06-02 17:47:41', '33cbc4b5a96f42f5b6a668551ee9ed3d', '2013-06-07 18:33:44');
INSERT INTO `t_user` VALUES ('24', 'baidu', '4297F44B13955235245B2497399D7A93', '142224@qq.com', '1', '', '', '', '', '', '2013-06-07 00:57:00', '8e96e54364e74c55bb2d285e5d0662ae', '2013-06-07 00:57:08');
INSERT INTO `t_user` VALUES ('19', 'demo01', '4297F44B13955235245B2497399D7A93', '1243@qq.com', '1', '', 'hello', '123123123', '1312312', 'www.baidu.com', '2013-05-28 16:51:03', 'c320decbc978488fbd1abf1cba3e4aa9', '2013-06-07 01:00:38');
INSERT INTO `t_user` VALUES ('20', 'jiandong', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandong@powerallnetworks.com', '1', 'powerall', '覃建栋', '13631661621', '63559854', 'http://localhost:8081/', '2013-05-29 22:42:25', 'd2a441840fcc4f26b99d6907362e9c89', '2013-06-07 18:32:46');
INSERT INTO `t_user` VALUES ('18', 'kewiyi', '4297F44B13955235245B2497399D7A93', '123@qq.com', '1', '', null, null, null, null, '2013-05-28 13:25:56', 'e2a042d3920049b8b6304d455f0dc0cf', '2013-06-07 01:00:27');

-- ----------------------------
-- Table structure for `t_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE `t_user_account` (
  `uid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户',
  `balance` double NOT NULL COMMENT '余额',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新日期',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_account
-- ----------------------------
INSERT INTO `t_user_account` VALUES ('20', '400', '2013-06-02 10:41:21');
INSERT INTO `t_user_account` VALUES ('23', '0', '2013-06-02 17:47:41');
INSERT INTO `t_user_account` VALUES ('24', '0', '2013-06-07 00:57:00');

-- ----------------------------
-- Table structure for `t_user_imei`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_imei`;
CREATE TABLE `t_user_imei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `imei` varchar(40) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT 'enable = 0,   disable = 1',
  `push_uid` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_uid_appid_imei` (`uid`,`app_id`,`imei`),
  KEY `id_uid_appid` (`uid`,`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_imei
-- ----------------------------

-- ----------------------------
-- Procedure structure for `proc_confirm_earnings`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_confirm_earnings`;
DELIMITER ;;
CREATE DEFINER=`push_root`@`192.168.252.%` PROCEDURE `proc_confirm_earnings`(
        IN i_start_date INT,
        IN i_end_date INT
    )
BEGIN
	DECLARE tmp DATE;
	
	SET tmp=STR_TO_DATE(i_end_date, '%Y%m%d') + INTERVAL 1 DAY;
	
	UPDATE t_report_daily 
	   SET kpi_value=kpi_value_src
	 WHERE idate BETWEEN i_start_date AND i_end_date
	   AND kpi_code ='sm_earnings';
	   
	UPDATE t_report_daily 
	   SET kpi_value=kpi_value_src
	 WHERE idate BETWEEN i_start_date AND DATE_FORMAT(tmp, '%Y%m%d')
	   AND kpi_code ='sm_earnings_amount';
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_update_data_adjusted`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_update_data_adjusted`;
DELIMITER ;;
CREATE DEFINER=`push_root`@`192.168.252.%` PROCEDURE `proc_update_data_adjusted`(
        in i_start_date int,
        in i_end_date int
    )
BEGIN
	DECLARE v_start_mon INT;
	DECLARE v_end_mon INT;
    -- update the adjusted data @ t_report_daily
    UPDATE t_report_daily t1
    SET kpi_value=(
        SELECT ROUND(t1.`kpi_value_src`*t2.`rate`+0.5) FROM t_apps t2
        WHERE t1.`app_id`=t2.`id`
    )
    WHERE t1.`kpi_code` IN ('sm_user_new', 'sm_user_online', 'sm_ad_installed')
    AND t1.`idate` BETWEEN i_start_date AND i_end_date;
    
    -- update the adjusted data @ t_report_hourly
    UPDATE t_report_hourly t1
    SET kpi_value=(
        SELECT ROUND(t1.`kpi_value_src`*t2.`rate`+0.5) FROM t_apps t2
        WHERE t1.`app_id`=t2.`id`
    )
    WHERE t1.`kpi_code` IN ('sm_user_new', 'sm_user_online', 'sm_ad_installed')
    AND t1.`idate` BETWEEN i_start_date AND i_end_date;
    
    -- update the adjusted data @ t_report_monthly
    SET v_start_mon = FLOOR(i_start_date/100);
    SET v_end_mon = FLOOR(i_end_date/100);
    UPDATE t_report_monthly t1 LEFT JOIN t_apps t2
		ON t1.`app_id`=t2.`id`
		SET t1.`kpi_value`=ROUND(t1.`kpi_value_src`*t2.`rate`+0.5)
    WHERE t1.`kpi_code` IN ('sm_user_new', 'sm_user_online', 'sm_ad_installed')
    AND t1.`mon` BETWEEN v_start_mon AND v_end_mon;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_update_earnings`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_update_earnings`;
DELIMITER ;;
CREATE DEFINER=`push_root`@`192.168.252.%` PROCEDURE `proc_update_earnings`(
        IN i_start_date INT,
        IN i_end_date INT
    )
BEGIN
	DECLARE i DATE;
	DECLARE j DATE;
	DECLARE tmp DATE;
	DECLARE val DOUBLE;
	
	DELETE FROM t_report_daily
	WHERE idate BETWEEN i_start_date AND i_end_date
	  AND kpi_code='sm_earnings';
	INSERT INTO t_report_daily(idate, dev_id, app_id, kpi_value_src, kpi_code, kpi_value)
	SELECT t1.`idate`, t1.`dev_id`, t1.`app_id`, t1.`kpi_value`*t2.`arp`, 'sm_earnings', 0
	FROM t_report_daily t1 LEFT JOIN t_apps t2 ON t1.`app_id`=t2.`id`
	WHERE idate BETWEEN i_start_date AND i_end_date
	  AND kpi_code='sm_ad_installed';
	
	
	SET i = STR_TO_DATE(i_start_date, '%Y%m%d');
	SET j = STR_TO_DATE(i_end_date, '%Y%m%d');
	
	WHILE i<=j DO
		SET tmp=i+INTERVAL 1 DAY;
		
		DELETE FROM t_report_daily
		WHERE idate BETWEEN i AND DATE_FORMAT(tmp, '%Y%m%d')
		  AND kpi_code='sm_earnings_amount';
	  
		INSERT INTO t_report_daily(idate, dev_id, app_id, kpi_value_src, kpi_code, kpi_value)
		SELECT DATE_FORMAT(i, '%Y%m%d'), t1.`dev_id`, t1.`app_id`, SUM(IF(t1.`kpi_value_src` IS NULL, 0, t1.`kpi_value_src`)), 'sm_earnings_amount', 0
		FROM t_report_daily t1
		WHERE t1.`idate`<=DATE_FORMAT(i, '%Y%m%d')
		  AND t1.`kpi_code`='sm_earnings'
		GROUP BY t1.`dev_id`, t1.`app_id`;
		
		INSERT INTO t_report_daily(idate, dev_id, app_id, kpi_value_src, kpi_code, kpi_value)
		SELECT DATE_FORMAT(tmp, '%Y%m%d'), dev_id, app_id, kpi_value_src, kpi_code, kpi_value
		 FROM t_report_daily 
		 WHERE idate=DATE_FORMAT(i, '%Y%m%d')
		 AND kpi_code='sm_earnings_amount';
		 
		SET i=tmp;
	END WHILE;
    END
;;
DELIMITER ;
