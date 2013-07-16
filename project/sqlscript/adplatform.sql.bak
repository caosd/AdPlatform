/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : adplatform

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-07-15 18:47:53
*/

<<<<<<< HEAD
SET FOREIGN_KEY_CHECKS=0;
=======
--
-- 数据库: `adplatform`
--

--
-- 表的结构 `t_ad_channel`
--
>>>>>>> 6e6164329b3d360880593d35ce6cb4f234b9f66c

-- ----------------------------
-- Table structure for `t_ad_channel`
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_channel`;
CREATE TABLE `t_ad_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `contact_tel` varchar(13) COLLATE utf8_bin NOT NULL,
  `qq` varchar(15) COLLATE utf8_bin NOT NULL,
  `contact_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(500) COLLATE utf8_bin NOT NULL,
  `enable` int(2) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_del` tinyint(2) NOT NULL COMMENT '数据删除标识，0=未删除，1=已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_ad_channel
-- ----------------------------
INSERT INTO `t_ad_channel` VALUES ('1', 'test', '13631661621', '63559854', '覃建栋', 'test', '1', '2013-07-11 10:30:16', '1');
INSERT INTO `t_ad_channel` VALUES ('2', 'Google广告', '13631661621', '63559854', '覃建栋', 'Google广告', '1', '2013-07-11 10:33:03', '0');
INSERT INTO `t_ad_channel` VALUES ('3', 'test1', '13631661621', '63559854', '覃建栋', 'test', '1', '2013-07-11 11:28:12', '3');
INSERT INTO `t_ad_channel` VALUES ('4', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:35', '4');
INSERT INTO `t_ad_channel` VALUES ('5', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:36', '5');
INSERT INTO `t_ad_channel` VALUES ('6', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:38', '6');
INSERT INTO `t_ad_channel` VALUES ('7', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:39', '7');
INSERT INTO `t_ad_channel` VALUES ('8', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:40', '8');
INSERT INTO `t_ad_channel` VALUES ('9', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:42', '9');
INSERT INTO `t_ad_channel` VALUES ('10', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:43', '10');
INSERT INTO `t_ad_channel` VALUES ('11', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:44', '11');
INSERT INTO `t_ad_channel` VALUES ('12', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:45', '12');
INSERT INTO `t_ad_channel` VALUES ('13', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:46', '13');
INSERT INTO `t_ad_channel` VALUES ('14', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:47', '14');
INSERT INTO `t_ad_channel` VALUES ('15', 'test', 'test', 'test', 'test', 'test', '1', '2013-07-11 13:13:48', '15');
INSERT INTO `t_ad_channel` VALUES ('16', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:50', '16');
INSERT INTO `t_ad_channel` VALUES ('17', '百度广告渠道', '555577865', '44456666', '百度', '百度广告渠道', '1', '2013-07-11 14:03:50', '0');
INSERT INTO `t_ad_channel` VALUES ('18', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:50', '18');
INSERT INTO `t_ad_channel` VALUES ('19', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:50', '19');
INSERT INTO `t_ad_channel` VALUES ('20', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:50', '20');
INSERT INTO `t_ad_channel` VALUES ('21', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:51', '21');
INSERT INTO `t_ad_channel` VALUES ('22', 'test', '13631661621', '63559854', 'test', 'test', '1', '2013-07-11 14:03:51', '22');
INSERT INTO `t_ad_channel` VALUES ('23', '渠道名称', '13631661621', '63559854', '覃建栋', 'Google广告', '1', '2013-07-14 23:43:04', '23');
INSERT INTO `t_ad_channel` VALUES ('24', 'test', '13631661621', '63559854', 'test', 'Google广告', '1', '2013-07-14 23:46:04', '24');
INSERT INTO `t_ad_channel` VALUES ('25', 'test', '13631661621', '63559854', 'test', 'Google广告', '1', '2013-07-14 23:47:40', '25');

-- ----------------------------
-- Table structure for `t_ad_resource`
-- ----------------------------
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
  `file_size` int(11) DEFAULT NULL COMMENT '安装包大小(KB)',
  `version` varchar(255) DEFAULT NULL COMMENT '应用版本',
  `support_platform` varchar(255) DEFAULT NULL COMMENT '应用支持平台要求',
  `app_type_id` int(8) DEFAULT '1' COMMENT ' 广告类型0:热门,1:应用,2:游戏',
  `charge_type` int(8) DEFAULT NULL COMMENT '收费类型',
  `price` double DEFAULT NULL COMMENT '单价',
  `clearing_form` varchar(10) DEFAULT NULL COMMENT '结算方式 ,CPA/CPS',
  `downloads` int(11) DEFAULT NULL,
  `recommens` int(11) DEFAULT NULL COMMENT '推荐次数',
  `ad_rating` int(11) DEFAULT NULL COMMENT '广告资源推荐等级',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `modify_date` datetime DEFAULT NULL COMMENT '广告修时间',
  `create_date` datetime NOT NULL,
  `apk_url` varchar(255) DEFAULT NULL COMMENT 'apk 下载地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(8) DEFAULT '0' COMMENT '0,下架，1上架',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '标记删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_package` (`ad_package`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ad_resource
-- ----------------------------
INSERT INTO `t_ad_resource` VALUES ('1', '2', '愤怒的小鸟', '愤怒的小鸟', '', '', '', '', 'com.app', '34', '2.1', 'andriod4.1', '0', '0', '2000', 'CPA', null, null, null, '愤怒的小鸟', null, '2013-07-14 23:13:34', null, '2013-07-14 15:13:34', '2014-03-14 23:13:34', '1', '1');
INSERT INTO `t_ad_resource` VALUES ('2', '2', '资源名称', '投放标题', '', '', '', '', '应用包名', '12', '1.2', 'andriod4.1', '5', '0', '200', 'CPA', null, null, null, '资源描述', null, '2013-07-14 23:23:35', null, '2013-07-14 15:23:35', '2014-03-14 23:23:35', '1', '1');
INSERT INTO `t_ad_resource` VALUES ('4', '2', '愤怒的小鸟', '投放标题', '/files/upload/com.app.ap-20130714/icon/20130715145544.jpg', '/files/upload/com.app.ap-20130714/icon/20130715.jpg', '/files/upload/com.app.ap-20130714/icon/20130714.jpg', '/files/upload/com.app.ap-20130714/images/20130715145731a.jpg,/files/upload/com.app.ap-20130714/images/20130715145731b.jpg,/files/upload/com.app.ap-20130714/images/20130715145731c.jpg,/files/upload/com.app.ap-20130714/images/20130715145731d.jpg', 'com.app.ap', '12', '1.2', 'andriod4.1', '0', '1', '200', 'CPS', null, null, null, '', '2013-07-15 15:12:10', '2013-07-14 23:28:07', null, '2013-07-14 15:28:07', '2014-03-14 23:28:07', '1', '1');
INSERT INTO `t_ad_resource` VALUES ('5', '2', '愤怒的小鸟2', '愤怒的小鸟2', '', '', '', '', 'com.app.ap.2', '12', '2.1', 'andriod4.1', '3', '1', '1000', 'CPA', null, null, null, '', null, '2013-07-15 15:32:44', null, '2013-07-15 07:32:44', '2014-03-15 15:32:44', '1', '1');

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
INSERT INTO `t_apps` VALUES ('1', 'fd62421b5824f4af33887e79462b75bb', '23', '大白菜', 'com.skycall.oem', 'drawable-mdpi#icon.png', '1', '0', '2013-06-07 00:07:20', '2013-06-05 17:58:17', '', '', '0');
INSERT INTO `t_apps` VALUES ('2', '9a3b327c837794a67e854a2c24d32b46', '23', '小青菜', 'com.elevenbitstudios.FunkySmugglers', 'drawable-xxhdpi#icon.png', '1', '0', '2013-06-08 09:37:36', '2013-06-05 18:04:03', '', '', '1');
INSERT INTO `t_apps` VALUES ('3', '678f1cfeaf2cfe14207d90c998acc70b', '23', '红萝卜', 'com.appspot.swisscodemonkeys.camerafx', 'drawable-ldpi#ic_launcher_camera2.png', '1', '1', '2013-06-07 00:07:10', '2013-06-07 00:06:15', '', '', '0');

-- ----------------------------
-- Table structure for `t_app_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_type`;
CREATE TABLE `t_app_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '应用类型名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent` int(11) DEFAULT NULL COMMENT '上一级分类',
  `visible` tinyint(4) DEFAULT NULL COMMENT '是否可见，1=可见，0=隐藏 ',
  `order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_type
-- ----------------------------
INSERT INTO `t_app_type` VALUES ('3', '游戏', '游侠分类', '0', '1', '0');
INSERT INTO `t_app_type` VALUES ('4', '应用', '应用分类', '0', '1', '1');
INSERT INTO `t_app_type` VALUES ('5', '过山车', '', '3', '1', '1');
INSERT INTO `t_app_type` VALUES ('6', '超级射击', '', '3', '1', '2');

-- ----------------------------
-- Table structure for `t_channel`
-- ----------------------------
DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_channel
-- ----------------------------
INSERT INTO `t_channel` VALUES ('1', '测试1', '测试测试测试1', '2013-05-21 08:38:41', '0');
INSERT INTO `t_channel` VALUES ('2', '我靠', 'ciao', '2013-05-27 07:10:37', '0');
INSERT INTO `t_channel` VALUES ('3', '测试2', '测试首发发发', '2013-05-21 09:42:45', '0');
INSERT INTO `t_channel` VALUES ('4', '测试3', 'sfasfalfa', '2013-05-21 09:43:59', '0');

-- ----------------------------
-- Table structure for `t_channel_user`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_channel_user
-- ----------------------------
INSERT INTO `t_channel_user` VALUES ('17', '2013-05-30 05:51:03', '20130530', '0', 'com.aa.bb', '0');
INSERT INTO `t_channel_user` VALUES ('18', '2013-05-30 07:35:10', '20130530', '0', 'com.aa.cc', '1');
INSERT INTO `t_channel_user` VALUES ('19', '2013-05-30 07:35:57', '20130530', '0', 'com.aa.bb', '1');
INSERT INTO `t_channel_user` VALUES ('20', '2013-05-30 07:36:04', '20130530', '0', 'com.aa.bb', '1');
INSERT INTO `t_channel_user` VALUES ('21', '2013-05-30 07:36:13', '20130530', '0', 'com.aa.cc', '1');
INSERT INTO `t_channel_user` VALUES ('22', '2013-05-30 07:36:22', '20130530', '0', 'com.aa.cc', '1');
INSERT INTO `t_channel_user` VALUES ('23', '2013-05-30 07:36:32', '20130530', '0', 'com.aa.bb', '1');
INSERT INTO `t_channel_user` VALUES ('24', '2013-05-30 07:39:37', '20130530', '0', 'com.aa.dd', '2');
INSERT INTO `t_channel_user` VALUES ('25', '2013-05-30 07:39:49', '20130530', '0', 'com.aa.dd', '3');
INSERT INTO `t_channel_user` VALUES ('26', '2013-05-30 07:40:01', '20130530', '0', 'com.aa.bb', '3');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', '测试1', '测试测试测试1', '2013-05-21 08:38:41', '1');
INSERT INTO `t_company` VALUES ('2', '我靠', 'ciao', '2013-05-27 07:10:37', '1');
INSERT INTO `t_company` VALUES ('3', '测试2', '测试首发发发', '2013-05-21 09:42:45', '1');
INSERT INTO `t_company` VALUES ('4', '测试3', 'sfasfalfa', '2013-05-21 09:43:59', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credentials
-- ----------------------------
INSERT INTO `t_credentials` VALUES ('1', '20', '1', '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 12:05:25', '2013-05-29 22:48:23');
INSERT INTO `t_credentials` VALUES ('2', '18', '1', '123456789', '', '', '中国工商银行', '123567', 'aaa', 'com', '2013-06-02 15:25:40', '2013-06-02 15:25:40');
INSERT INTO `t_credentials` VALUES ('3', '23', '1', '123456789', '1_123456789_photo1.png', '1_123456789_photo2.jpeg', '中国工商银行', '622655555555', '张三', '深圳', '2013-06-06 23:05:45', '2013-06-06 23:05:45');
INSERT INTO `t_credentials` VALUES ('4', '27', '2', '452124199012230077', '2_452124199012230077_photo1.jpeg', '', null, null, null, null, '2013-06-08 13:21:28', '2013-06-08 13:21:28');
INSERT INTO `t_credentials` VALUES ('5', '28', '2', '', '2__photo1.null', '', null, null, null, null, '2013-06-08 13:23:58', '2013-06-08 13:23:58');
INSERT INTO `t_credentials` VALUES ('6', '22', '1', '452124199012230077', '1_452124199012230077_photo1.jpeg', '1_452124199012230077_photo2.jpeg', '中国工商银行', '425202520014225852', '覃建栋', '深圳市南山区振业国际大厦10楼1001', '2013-07-07 10:00:12', '2013-07-07 10:00:12');
INSERT INTO `t_credentials` VALUES ('7', '33', '1', '452124199012230077', '1_452124199012230077_photo1.jpeg', '1_452124199012230077_photo2.jpeg', '中国工商银行', '425202520014225852', '覃建栋', '深圳市南山区常兴路统建楼3栋301(A)', '2013-07-12 13:39:38', '2013-07-12 13:39:38');

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
-- Table structure for `t_menu`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '系统管理', null, '', '0', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('2', '新增用户', '', '/accounts/formpage.html', '1', '1', '1', '111');
INSERT INTO `t_menu` VALUES ('3', '用户列表', null, '/accounts/listUser.html', '1', '1', '1', '112');
INSERT INTO `t_menu` VALUES ('4', '新增角色', null, '/role/formpage.html', '1', '1', '1', '121');
INSERT INTO `t_menu` VALUES ('5', '角色列表', null, '/role/listRole.html', '1', '1', '1', '122');
INSERT INTO `t_menu` VALUES ('6', '新增菜单', null, '/menu/formpage.html', '1', '1', '1', '131');
INSERT INTO `t_menu` VALUES ('7', '菜单列表', null, '/menu/listMenu.html', '1', '1', '1', '132');
INSERT INTO `t_menu` VALUES ('8', '资源管理', null, '', '0', '1', '1', '2');
INSERT INTO `t_menu` VALUES ('9', '资源录入', null, '/adResource/formpage.html', '8', '1', '1', '211');
INSERT INTO `t_menu` VALUES ('10', '资源列表', null, '/adResource/adResourceList.html', '8', '1', '1', '212');
INSERT INTO `t_menu` VALUES ('13', '查看权限', null, '/role/roleFormpage.html', '1', '0', '1', '124');
INSERT INTO `t_menu` VALUES ('14', '设置角色权限', null, '/role/setRoleMenu.html', '1', '0', '1', '125');
INSERT INTO `t_menu` VALUES ('15', '新增菜单', null, '/menu/formpage.html', '1', '0', '1', '133');
INSERT INTO `t_menu` VALUES ('16', '查找菜单', null, '/menu/getMenu.html', '1', '0', '1', '134');
INSERT INTO `t_menu` VALUES ('17', '修改菜单', null, '/menu/updateMenu.html', '1', '0', '1', '135');
INSERT INTO `t_menu` VALUES ('18', '查找资源', null, '/adResource/getAdResource.html', '8', '0', '1', '213');
INSERT INTO `t_menu` VALUES ('19', '展示资源', null, '/adResource/showAdResource.html', '8', '0', '1', '214');
INSERT INTO `t_menu` VALUES ('21', '修改资源', null, '/adResource/updateAdResource.html', '8', '0', '1', '216');
INSERT INTO `t_menu` VALUES ('22', '编辑用户', null, '/user/editUser.html', '1', '0', '1', '114');
INSERT INTO `t_menu` VALUES ('23', '修改用户角色&状态', null, '/user/updateUserRoleAndStatus.html', '1', '0', '1', '115');
INSERT INTO `t_menu` VALUES ('24', '重置密码', null, '/ajax/updateUser.html', '1', '0', '1', '116');
INSERT INTO `t_menu` VALUES ('25', '检测用户名', null, '/hasUser.html', '1', '0', '1', '117');
INSERT INTO `t_menu` VALUES ('26', '开发者应用', '', '', '0', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('27', '应用上传', '', '/apps/create.html', '26', '1', '1', '311');
INSERT INTO `t_menu` VALUES ('28', '上传应用action', null, '/appInfo/addAppInfo.html', '26', '0', '1', '312');
INSERT INTO `t_menu` VALUES ('29', '应用列表', '开发者个人应用列表', '/apps/', '26', '1', '1', '313');
INSERT INTO `t_menu` VALUES ('30', '查询应用', null, '/appInfo/selectAppInfo.html', '26', '0', '1', '314');
INSERT INTO `t_menu` VALUES ('31', '修改应用', null, '/appInfo/updateAppInfo.html', '26', '0', '1', '315');
INSERT INTO `t_menu` VALUES ('32', '删除应用', null, '/appInfo/deleteAppInfo.html', '26', '0', '1', '316');
INSERT INTO `t_menu` VALUES ('33', '应用列表', '所有开发者应用列表', '/appInfo/listAppInfoAll.html', '26', '1', '1', '313');
INSERT INTO `t_menu` VALUES ('34', 'SDK报表', null, '', '0', '1', '1', '4');
INSERT INTO `t_menu` VALUES ('35', '用户报表', null, '/report/userDayReport.html', '34', '0', '1', '411');
INSERT INTO `t_menu` VALUES ('36', '应用安装上报报表', null, '/report/appInstallReport.html', '34', '0', '1', '412');
INSERT INTO `t_menu` VALUES ('37', '报表列管理', null, '', '0', '0', '1', '5');
INSERT INTO `t_menu` VALUES ('38', 'column列表', null, '/gridColumn/list.html', '37', '0', '1', '511');
INSERT INTO `t_menu` VALUES ('39', 'add报表列', null, '/gridColumn/formAdd.html', '37', '0', '1', '512');
INSERT INTO `t_menu` VALUES ('40', 'add报表列action', null, '/gridColumn/add.html', '37', '0', '1', '513');
INSERT INTO `t_menu` VALUES ('41', 'update报表列', null, '/gridColumn/formUpdate.html', '37', '0', '1', '514');
INSERT INTO `t_menu` VALUES ('42', 'update报表列action', null, '/gridColumn/update.html', '37', '0', '1', '515');
INSERT INTO `t_menu` VALUES ('43', 'delete报表列', null, '/gridColumn/delete.html', '37', '0', '1', '516');
INSERT INTO `t_menu` VALUES ('44', '渠道报表', null, '', '0', '0', '1', '6');
INSERT INTO `t_menu` VALUES ('45', '渠道列表', null, '/user/listChannelUser.html', '1', '0', '1', '118');
INSERT INTO `t_menu` VALUES ('46', '新增支付项目', '', '/amountItem/form.html', '1', '0', '1', '141');
INSERT INTO `t_menu` VALUES ('47', '新增支付项目action', null, '/amountItem/add.html', '1', '0', '1', '142');
INSERT INTO `t_menu` VALUES ('48', '支付项目列表', null, '/amountItem/list.html', '1', '0', '1', '143');
INSERT INTO `t_menu` VALUES ('49', '修改支付项目', null, '/amountItem/updateForm.html', '1', '0', '1', '144');
INSERT INTO `t_menu` VALUES ('50', '修改支付项目action', null, '/amountItem/update.html', '1', '0', '1', '145');
INSERT INTO `t_menu` VALUES ('51', '删除支付项目', null, '/amountItem/delete.html', '1', '0', '1', '146');
INSERT INTO `t_menu` VALUES ('52', '支付报表', '渠道本身的支付报表 —— 对外', '/report/channelAmountReport.html', '44', '0', '1', '611');
INSERT INTO `t_menu` VALUES ('53', '支付报表', '所有渠道支付报表 —— 对内', '/report/allChannelAmountReport.html', '44', '0', '1', '612');
INSERT INTO `t_menu` VALUES ('66', '财务中心', '', '', '0', '1', '1', '3');
INSERT INTO `t_menu` VALUES ('67', '帐户管理', '', '', '0', '1', '1', '4');
INSERT INTO `t_menu` VALUES ('68', '财务信息', '', '/financial/overview', '66', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('69', '财务明细', '', '/financial/accounts', '66', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('70', '申请汇款', '', '/financial/remittance', '66', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('71', '汇款记录', '', '/financial/remittance_history', '66', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('72', '收入报表', '', '', '0', '1', '1', '2');
INSERT INTO `t_menu` VALUES ('73', '广告报表', '', '', '0', '1', '1', '1');
INSERT INTO `t_menu` VALUES ('74', '小时统计', '', '', '72', '0', '1', '0');
INSERT INTO `t_menu` VALUES ('75', '每日统计', '', '/report/incoming/daily', '72', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('76', '每月统计', '', '/report/incoming/monthly', '72', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('77', '广告推送', '', '/report/advert/pushes', '73', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('78', '应用内广告', '', '/report/advert/advertising', '73', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('79', '个人资料', '', '/accounts/overview', '67', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('80', '修改Email', '', '/accounts/change_email', '67', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('81', '修改资料', '', '/accounts/change_profile', '67', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('82', '修改密码', '', '/accounts/change_pwd', '67', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('83', '用户渠道', '', '', '0', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('84', '添加用户渠道', '', '/userchannel/formpage.html', '83', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('85', '用户渠道列表', '', '/userchannel/userChannelList.html', '83', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('86', '添加厂商', '', '/company/formpage.html', '83', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('87', '厂商列表', '', '/company/companyList.html', '83', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('88', '用户审核', '', '', '0', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('89', '用户注册资料列表', '', '/accounts/userReview.html', '88', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('90', '广告渠道管理', '', '', '0', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('91', '添加广告渠道', '', '/adchannel/formpage.html', '90', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('92', '修改渠道', '', '', '90', '0', '1', '0');
INSERT INTO `t_menu` VALUES ('93', '渠道列表', '', '/adchannel/adChannelList.html', '90', '1', '1', '0');
INSERT INTO `t_menu` VALUES ('94', '用户审核列表', '', '/accounts/userReview.html', '88', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('95', '增加应用分类', '', '/apps/formpage.html', '1', '1', '1', '8');
INSERT INTO `t_menu` VALUES ('96', '应用分类列表', '', '/apps/appTypeList.html', '1', '1', '1', '7');

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
-- Table structure for `t_push_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_push_test`;
CREATE TABLE `t_push_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app_key` varchar(32) NOT NULL,
  `test_key` varchar(32) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_key` (`app_key`) USING BTREE,
  KEY `app_key_uid` (`app_key`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_push_test
-- ----------------------------
INSERT INTO `t_push_test` VALUES ('3', '23', '9a3b327c837794a67e854a2c24d32b46', '   test ', 'test key', '2013-06-08 10:00:11');
INSERT INTO `t_push_test` VALUES ('4', '23', 'fd62421b5824f4af33887e79462b75bb', 'test', 'test', '2013-06-08 10:00:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_remittance
-- ----------------------------
INSERT INTO `t_remittance` VALUES ('1', '20', '10', '覃建栋', '华夏银行', '425202520014225852', '0', null, null, '2013-06-02 10:41:37', '2013-06-02 10:41:37');
INSERT INTO `t_remittance` VALUES ('2', '18', '12', 'aaa', '中国工商银行', '123567', '0', null, null, '2013-06-02 15:26:12', '2013-06-02 15:26:12');
INSERT INTO `t_remittance` VALUES ('3', '20', '12', '覃建栋', '华夏银行', '425202520014225852', '0', null, null, '2013-06-02 15:35:20', '2013-06-02 15:35:20');
INSERT INTO `t_remittance` VALUES ('4', '20', '100', '覃建栋', '华夏银行', '425202520014225852', '0', null, null, '2013-07-02 13:28:44', '2013-07-02 13:28:44');

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
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(4) DEFAULT '0' COMMENT '状态：0-有效 1-无效',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'Admin', '1', '2013-04-07 11:18:49');
INSERT INTO `t_role` VALUES ('2', '运营管理', '1', '2013-04-07 14:27:39');
INSERT INTO `t_role` VALUES ('3', '个人开发者', '1', '2013-04-22 16:13:21');
INSERT INTO `t_role` VALUES ('4', '方案商', '1', '2013-05-14 14:01:05');
INSERT INTO `t_role` VALUES ('5', 'test', '1', '2013-07-07 22:18:50');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色ID',
  `menu_id` int(4) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1769 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('1565', '4', '66');
INSERT INTO `t_role_menu` VALUES ('1566', '4', '68');
INSERT INTO `t_role_menu` VALUES ('1567', '4', '69');
INSERT INTO `t_role_menu` VALUES ('1568', '4', '70');
INSERT INTO `t_role_menu` VALUES ('1569', '4', '71');
INSERT INTO `t_role_menu` VALUES ('1570', '4', '67');
INSERT INTO `t_role_menu` VALUES ('1571', '4', '79');
INSERT INTO `t_role_menu` VALUES ('1572', '4', '80');
INSERT INTO `t_role_menu` VALUES ('1573', '4', '81');
INSERT INTO `t_role_menu` VALUES ('1574', '4', '82');
INSERT INTO `t_role_menu` VALUES ('1575', '4', '72');
INSERT INTO `t_role_menu` VALUES ('1576', '4', '74');
INSERT INTO `t_role_menu` VALUES ('1577', '4', '75');
INSERT INTO `t_role_menu` VALUES ('1578', '4', '76');
INSERT INTO `t_role_menu` VALUES ('1579', '4', '73');
INSERT INTO `t_role_menu` VALUES ('1580', '4', '77');
INSERT INTO `t_role_menu` VALUES ('1581', '4', '78');
INSERT INTO `t_role_menu` VALUES ('1582', '4', '26');
INSERT INTO `t_role_menu` VALUES ('1583', '4', '27');
INSERT INTO `t_role_menu` VALUES ('1584', '4', '28');
INSERT INTO `t_role_menu` VALUES ('1585', '4', '29');
INSERT INTO `t_role_menu` VALUES ('1586', '4', '30');
INSERT INTO `t_role_menu` VALUES ('1587', '4', '31');
INSERT INTO `t_role_menu` VALUES ('1588', '4', '32');
INSERT INTO `t_role_menu` VALUES ('1614', '5', '66');
INSERT INTO `t_role_menu` VALUES ('1615', '5', '68');
INSERT INTO `t_role_menu` VALUES ('1616', '5', '69');
INSERT INTO `t_role_menu` VALUES ('1617', '5', '70');
INSERT INTO `t_role_menu` VALUES ('1618', '5', '71');
INSERT INTO `t_role_menu` VALUES ('1619', '5', '67');
INSERT INTO `t_role_menu` VALUES ('1620', '5', '79');
INSERT INTO `t_role_menu` VALUES ('1621', '5', '80');
INSERT INTO `t_role_menu` VALUES ('1622', '5', '81');
INSERT INTO `t_role_menu` VALUES ('1623', '5', '82');
INSERT INTO `t_role_menu` VALUES ('1624', '5', '72');
INSERT INTO `t_role_menu` VALUES ('1625', '5', '74');
INSERT INTO `t_role_menu` VALUES ('1626', '5', '75');
INSERT INTO `t_role_menu` VALUES ('1627', '5', '76');
INSERT INTO `t_role_menu` VALUES ('1628', '5', '73');
INSERT INTO `t_role_menu` VALUES ('1629', '5', '77');
INSERT INTO `t_role_menu` VALUES ('1630', '5', '78');
INSERT INTO `t_role_menu` VALUES ('1631', '5', '83');
INSERT INTO `t_role_menu` VALUES ('1632', '5', '84');
INSERT INTO `t_role_menu` VALUES ('1633', '5', '85');
INSERT INTO `t_role_menu` VALUES ('1634', '5', '86');
INSERT INTO `t_role_menu` VALUES ('1635', '5', '87');
INSERT INTO `t_role_menu` VALUES ('1636', '5', '88');
INSERT INTO `t_role_menu` VALUES ('1637', '5', '89');
INSERT INTO `t_role_menu` VALUES ('1638', '5', '90');
INSERT INTO `t_role_menu` VALUES ('1639', '5', '91');
INSERT INTO `t_role_menu` VALUES ('1640', '5', '92');
INSERT INTO `t_role_menu` VALUES ('1641', '5', '93');
INSERT INTO `t_role_menu` VALUES ('1642', '5', '1');
INSERT INTO `t_role_menu` VALUES ('1643', '5', '2');
INSERT INTO `t_role_menu` VALUES ('1644', '5', '3');
INSERT INTO `t_role_menu` VALUES ('1645', '5', '22');
INSERT INTO `t_role_menu` VALUES ('1646', '5', '23');
INSERT INTO `t_role_menu` VALUES ('1647', '5', '24');
INSERT INTO `t_role_menu` VALUES ('1648', '5', '25');
INSERT INTO `t_role_menu` VALUES ('1649', '5', '45');
INSERT INTO `t_role_menu` VALUES ('1650', '5', '4');
INSERT INTO `t_role_menu` VALUES ('1651', '5', '5');
INSERT INTO `t_role_menu` VALUES ('1652', '5', '13');
INSERT INTO `t_role_menu` VALUES ('1653', '5', '14');
INSERT INTO `t_role_menu` VALUES ('1654', '5', '6');
INSERT INTO `t_role_menu` VALUES ('1655', '5', '7');
INSERT INTO `t_role_menu` VALUES ('1656', '5', '15');
INSERT INTO `t_role_menu` VALUES ('1657', '5', '16');
INSERT INTO `t_role_menu` VALUES ('1658', '5', '17');
INSERT INTO `t_role_menu` VALUES ('1659', '5', '46');
INSERT INTO `t_role_menu` VALUES ('1660', '5', '47');
INSERT INTO `t_role_menu` VALUES ('1661', '5', '48');
INSERT INTO `t_role_menu` VALUES ('1662', '5', '49');
INSERT INTO `t_role_menu` VALUES ('1663', '5', '50');
INSERT INTO `t_role_menu` VALUES ('1664', '5', '51');
INSERT INTO `t_role_menu` VALUES ('1665', '5', '8');
INSERT INTO `t_role_menu` VALUES ('1666', '5', '9');
INSERT INTO `t_role_menu` VALUES ('1667', '5', '10');
INSERT INTO `t_role_menu` VALUES ('1668', '5', '18');
INSERT INTO `t_role_menu` VALUES ('1669', '5', '19');
INSERT INTO `t_role_menu` VALUES ('1670', '5', '21');
INSERT INTO `t_role_menu` VALUES ('1671', '5', '26');
INSERT INTO `t_role_menu` VALUES ('1672', '5', '27');
INSERT INTO `t_role_menu` VALUES ('1673', '5', '28');
INSERT INTO `t_role_menu` VALUES ('1674', '5', '29');
INSERT INTO `t_role_menu` VALUES ('1675', '5', '33');
INSERT INTO `t_role_menu` VALUES ('1676', '5', '30');
INSERT INTO `t_role_menu` VALUES ('1677', '5', '31');
INSERT INTO `t_role_menu` VALUES ('1678', '5', '32');
INSERT INTO `t_role_menu` VALUES ('1702', '2', '83');
INSERT INTO `t_role_menu` VALUES ('1703', '2', '84');
INSERT INTO `t_role_menu` VALUES ('1704', '2', '85');
INSERT INTO `t_role_menu` VALUES ('1705', '2', '86');
INSERT INTO `t_role_menu` VALUES ('1706', '2', '87');
INSERT INTO `t_role_menu` VALUES ('1707', '2', '88');
INSERT INTO `t_role_menu` VALUES ('1708', '2', '89');
INSERT INTO `t_role_menu` VALUES ('1709', '2', '90');
INSERT INTO `t_role_menu` VALUES ('1710', '2', '91');
INSERT INTO `t_role_menu` VALUES ('1711', '2', '92');
INSERT INTO `t_role_menu` VALUES ('1712', '2', '93');
INSERT INTO `t_role_menu` VALUES ('1713', '2', '8');
INSERT INTO `t_role_menu` VALUES ('1714', '2', '9');
INSERT INTO `t_role_menu` VALUES ('1715', '2', '10');
INSERT INTO `t_role_menu` VALUES ('1716', '2', '18');
INSERT INTO `t_role_menu` VALUES ('1717', '2', '19');
INSERT INTO `t_role_menu` VALUES ('1718', '2', '21');
INSERT INTO `t_role_menu` VALUES ('1719', '2', '26');
INSERT INTO `t_role_menu` VALUES ('1720', '2', '33');
INSERT INTO `t_role_menu` VALUES ('1721', '3', '66');
INSERT INTO `t_role_menu` VALUES ('1722', '3', '68');
INSERT INTO `t_role_menu` VALUES ('1723', '3', '69');
INSERT INTO `t_role_menu` VALUES ('1724', '3', '70');
INSERT INTO `t_role_menu` VALUES ('1725', '3', '71');
INSERT INTO `t_role_menu` VALUES ('1726', '3', '67');
INSERT INTO `t_role_menu` VALUES ('1727', '3', '79');
INSERT INTO `t_role_menu` VALUES ('1728', '3', '80');
INSERT INTO `t_role_menu` VALUES ('1729', '3', '81');
INSERT INTO `t_role_menu` VALUES ('1730', '3', '82');
INSERT INTO `t_role_menu` VALUES ('1731', '3', '72');
INSERT INTO `t_role_menu` VALUES ('1732', '3', '75');
INSERT INTO `t_role_menu` VALUES ('1733', '3', '76');
INSERT INTO `t_role_menu` VALUES ('1734', '3', '73');
INSERT INTO `t_role_menu` VALUES ('1735', '3', '77');
INSERT INTO `t_role_menu` VALUES ('1736', '3', '78');
INSERT INTO `t_role_menu` VALUES ('1737', '3', '26');
INSERT INTO `t_role_menu` VALUES ('1738', '3', '27');
INSERT INTO `t_role_menu` VALUES ('1739', '3', '28');
INSERT INTO `t_role_menu` VALUES ('1740', '3', '29');
INSERT INTO `t_role_menu` VALUES ('1741', '3', '30');
INSERT INTO `t_role_menu` VALUES ('1742', '3', '31');
INSERT INTO `t_role_menu` VALUES ('1743', '3', '32');
INSERT INTO `t_role_menu` VALUES ('1744', '1', '1');
INSERT INTO `t_role_menu` VALUES ('1745', '1', '95');
INSERT INTO `t_role_menu` VALUES ('1746', '1', '96');
INSERT INTO `t_role_menu` VALUES ('1747', '1', '2');
INSERT INTO `t_role_menu` VALUES ('1748', '1', '3');
INSERT INTO `t_role_menu` VALUES ('1749', '1', '22');
INSERT INTO `t_role_menu` VALUES ('1750', '1', '23');
INSERT INTO `t_role_menu` VALUES ('1751', '1', '24');
INSERT INTO `t_role_menu` VALUES ('1752', '1', '25');
INSERT INTO `t_role_menu` VALUES ('1753', '1', '45');
INSERT INTO `t_role_menu` VALUES ('1754', '1', '4');
INSERT INTO `t_role_menu` VALUES ('1755', '1', '5');
INSERT INTO `t_role_menu` VALUES ('1756', '1', '13');
INSERT INTO `t_role_menu` VALUES ('1757', '1', '14');
INSERT INTO `t_role_menu` VALUES ('1758', '1', '6');
INSERT INTO `t_role_menu` VALUES ('1759', '1', '7');
INSERT INTO `t_role_menu` VALUES ('1760', '1', '15');
INSERT INTO `t_role_menu` VALUES ('1761', '1', '16');
INSERT INTO `t_role_menu` VALUES ('1762', '1', '17');
INSERT INTO `t_role_menu` VALUES ('1763', '1', '46');
INSERT INTO `t_role_menu` VALUES ('1764', '1', '47');
INSERT INTO `t_role_menu` VALUES ('1765', '1', '48');
INSERT INTO `t_role_menu` VALUES ('1766', '1', '49');
INSERT INTO `t_role_menu` VALUES ('1767', '1', '50');
INSERT INTO `t_role_menu` VALUES ('1768', '1', '51');

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
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('22', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '144@qq.com', '1', '', '覃建栋', '13631661621', null, '', '2013-06-02 17:43:46', '5925bbdbcf484fdd8d9b7142373ab49b', '2013-07-15 00:02:51', '1');
INSERT INTO `t_user` VALUES ('33', 'dev001', 'E10ADC3949BA59ABBE56E057F20F883E', 'dev001@gmail.com', '3', null, 'dev001', '13631661621', '', null, '2013-07-08 00:13:23', '8bd8cd6b53a94e9799363ade53234d3f', '2013-07-15 18:31:52', '1');
INSERT INTO `t_user` VALUES ('31', 'jd_test', '4297F44B13955235245B2497399D7A93', 'qinjiandong21010@gmail.com', '5', 'Powerall networks', '覃建栋', '13631661621', null, 'http://localhost:8081/', '2013-07-07 23:19:48', '4289c363fde745d388ec1aa9e4d12069', '2013-07-07 23:40:53', '1');
INSERT INTO `t_user` VALUES ('32', 'yygl001', 'E10ADC3949BA59ABBE56E057F20F883E', 'yygl@gmail.com', '2', '', 'yygl', '13631661621', null, 'http://localhost:8080', '2013-07-08 00:12:45', '8cbc2fc113d64929ad5bac417592e357', '2013-07-15 13:41:24', '1');

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
INSERT INTO `t_user_account` VALUES ('25', '0', '2013-06-08 10:30:27');
INSERT INTO `t_user_account` VALUES ('26', '0', '2013-06-08 10:58:14');
INSERT INTO `t_user_account` VALUES ('27', '0', '2013-06-08 13:20:36');
INSERT INTO `t_user_account` VALUES ('28', '0', '2013-06-08 13:23:58');
INSERT INTO `t_user_account` VALUES ('30', '0', '2013-07-05 07:48:18');
INSERT INTO `t_user_account` VALUES ('31', '0', '2013-07-07 23:19:48');
INSERT INTO `t_user_account` VALUES ('32', '0', '2013-07-08 00:12:45');
INSERT INTO `t_user_account` VALUES ('33', '0', '2013-07-08 00:13:23');

-- ----------------------------
-- Table structure for `t_user_channel`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_channel
-- ----------------------------
INSERT INTO `t_user_channel` VALUES ('17', '0', '', 'com.aa.bb', null, '2013-05-30 05:51:03', '2013-05-30 00:00:00', '0');
INSERT INTO `t_user_channel` VALUES ('18', '0', '', 'com.aa.cc', null, '2013-05-30 07:35:10', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('19', '0', '', 'com.aa.bb', null, '2013-05-30 07:35:57', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('20', '0', '', 'com.aa.bb', null, '2013-05-30 07:36:04', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('21', '0', '', 'com.aa.cc', null, '2013-05-30 07:36:13', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('22', '0', '', 'com.aa.cc', null, '2013-05-30 07:36:22', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('23', '0', '', 'com.aa.bb', null, '2013-05-30 07:36:32', '2013-05-30 00:00:00', '1');
INSERT INTO `t_user_channel` VALUES ('24', '0', '', 'com.aa.dd', null, '2013-05-30 07:39:37', '2013-05-30 00:00:00', '2');
INSERT INTO `t_user_channel` VALUES ('25', '0', '', 'com.aa.dd', null, '2013-05-30 07:39:49', '2013-05-30 00:00:00', '3');
INSERT INTO `t_user_channel` VALUES ('26', '0', '', 'com.aa.bb', null, '2013-05-30 07:40:01', '2013-05-30 00:00:00', '3');
INSERT INTO `t_user_channel` VALUES ('28', '3', '测试2', '234234', '渠道描述', '2013-07-12 12:53:10', '2013-07-12 12:53:10', '1');
INSERT INTO `t_user_channel` VALUES ('30', '1', '测试1', '234234', '渠道描述', '2013-07-12 13:14:23', '2013-07-12 13:14:23', '1');
INSERT INTO `t_user_channel` VALUES ('31', '4', '测试3', '234234', '渠道描述', '2013-07-12 13:34:53', '2013-07-12 13:34:53', '1');
INSERT INTO `t_user_channel` VALUES ('33', '1', '测试1', '234234', 'test', '2013-07-14 23:56:17', '2013-07-14 23:56:17', '1');
INSERT INTO `t_user_channel` VALUES ('34', '1', '测试1', '99685', 'Google广告', '2013-07-15 00:01:31', '2013-07-15 00:01:31', '1');

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
