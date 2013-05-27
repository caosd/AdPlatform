/*
Navicat MySQL Data Transfer

Source Server         : 117.135.160.59
Source Server Version : 50518
Source Host           : 117.135.160.59:3306
Source Database       : stomato

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2013-04-28 10:19:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_apps`
-- ----------------------------
DROP TABLE IF EXISTS `t_apps`;
CREATE TABLE `t_apps` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_key` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `pkg` varchar(255) DEFAULT NULL,
  `sm_ad_installed` int(11) NOT NULL DEFAULT '0' COMMENT 'app installed',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL,
  `rate` double DEFAULT '0.8',
  `arp` double DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT 'status:   0-normal,    1-delete',
  `push_status` int(11) DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_appKey` (`app_key`),
  UNIQUE KEY `uq_uid_with_pkg` (`uid`,`pkg`),
  KEY `ind_appname` (`name`),
  KEY `ind_uid` (`uid`),
  KEY `ind_appKey` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_apps
-- ----------------------------
INSERT INTO `t_apps` VALUES ('1111', 'ec9a1200h99k6528cdc4h631', '1', 'never look down2', 'u.c', '0', '2013-04-16 17:39:21', '2012-12-20 18:26:09', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('1130', 'ec9a120030046528cdc4d633', '4', 'what u c', 'cc.com', '0', '2013-04-16 17:39:40', '2012-12-22 00:16:01', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('1131', 'ec9a120030046528cdc4d632', '4', 'oh,my', 'com.baidu', '0', '2013-04-16 17:39:31', '2012-12-22 00:21:17', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('1132', 'ec9a120030046528cdc4d634', '4', 'aaa', 'dasdfasdf', '0', '2013-04-16 17:39:33', '2012-12-22 00:25:00', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('1133', 'ec9a120030046528cdc4d6d1', '4', 'asdf', 'sdf', '0', '2013-04-16 17:39:35', '2012-12-22 00:25:41', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('1134', 'ec9a120030046528cdc4d6f1', '4', 'cpu', 'like it', '0', '2013-04-16 17:39:29', '2012-12-22 00:27:21', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('1135', 'ec9a120030046528cdc4d6p1', '4', 'jm', 'may.com', '0', '2013-04-16 17:39:38', '2012-12-22 00:33:28', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('5076', 'cd67cc2e0058730d358087c6', '7', 'demo', 'com.demomo', '0', '2013-04-16 17:39:36', '2012-12-28 16:00:35', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('5077', '5c61fc2469979466fdaf4138', '7', 'hello', 'com.kktv', '0', '2013-04-16 17:40:37', '2012-12-28 16:02:59', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('5079', 'd9add95561dce78878774f02', '5', 'test', 'com.eddie.test1', '0', '2013-04-16 17:40:04', '2012-12-28 16:06:07', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('5083', '5d126862cc053c52939f25d9', '6', 'bad apple', 'com.badapple', '0', '2013-04-16 17:40:10', '2012-12-28 16:26:46', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('5099', '00b49726c8a032cc84babff5', '6', 'test1', 'com.uu.lllkk', '0', '2013-04-16 17:40:08', '2012-12-28 17:48:31', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('5127', '0dc2f0584574778bfd6466ce', '1', 'AngryBird', 'com.angrybird', '0', '2013-04-16 17:40:12', '2012-12-29 14:16:19', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('5128', '6037bf22ae8c018e11ea873c', '2', 'Wimp: Who Stole My Pants?', 'com.flexilstudio.test', '0', '2013-04-16 17:40:14', '2012-12-29 14:32:49', '0.2', '0.5', '1', '1');
INSERT INTO `t_apps` VALUES ('5130', 'cb66ca4fd33910d6d336ab0b', '3', 'Eddie\'s first app', 'cn.eddie.first', '0', '2013-04-16 17:39:42', '2012-12-29 14:46:46', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5143', '2d0df1ab40f2a952828379f4', '4', 'quentin', 'com.quentin.chen', '0', '2013-04-16 17:39:42', '2012-12-29 17:10:21', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5144', '8633c1682872041ab481d3a0', '2', 'test add', 'cn.eddie.second', '0', '2013-04-16 17:39:43', '2012-12-29 17:16:32', '0.2', '0.5', '1', '1');
INSERT INTO `t_apps` VALUES ('5145', '4ca2316b70e83071eb845496', '4', 'com.quentin.test', 'com.quentin.test', '0', '2013-04-16 17:40:15', '2012-12-29 17:28:06', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5183', 'a9011b9b5e8563cc078ee586', '3', 'test', 'com.eddie.second', '0', '2013-04-16 17:39:44', '2012-12-31 15:01:01', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5298', '297a02e686261b2e8357f43c', '3', 'sdk0.2.4', 'com.sdk.t.Four', '0', '2013-04-16 17:39:47', '2013-01-05 09:23:47', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('5309', 'cd9876ac635a46e4966330b7', '5', 'test app', 'com.android.test', '0', '2013-04-16 17:39:45', '2013-01-05 10:17:11', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5371', 'ec3d7881cb6f6f2b30585a25', '2', '测试应用', 'com.topappcamp.trafficviolation', '0', '2013-04-16 17:39:52', '2013-01-05 15:55:21', '0.2', '0.5', '1', '1');
INSERT INTO `t_apps` VALUES ('5374', 'b8c0cd7057957e0a2ac81a7e', '2', 'test', 'com.example.blamejudge', '0', '2013-04-16 17:39:54', '2013-01-05 16:01:47', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('5449', '02e3afc2508e5ed5b438ffcf', '1', 'hate2', 'com.hate', '0', '2013-04-16 17:39:56', '2013-01-06 15:08:06', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('5460', 'c9458b243905036b6dd0b1d9', '3', '最后再加一个测试看看', 'cn.eddie.five', '0', '2013-04-16 17:39:57', '2013-01-06 16:52:33', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5515', '1e0b0e5cd48a0a311aeec2de', '2', 'test2', 'com.test2', '0', '2013-04-16 17:40:01', '2013-01-07 14:00:47', '0.2', '0.5', '0', '1');
INSERT INTO `t_apps` VALUES ('5594', 'ca90e6928fc849f12e8f4608', '7', 'android factory model1', 'com.android.factory.model1', '0', '2013-04-17 15:53:42', '2013-01-08 14:25:24', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('5643', 'cdfb41a58e25ff1368a64d64', '2', 'Wimp: Who Stole My Pants?', 'com.fs.wimp', '0', '2013-04-17 15:53:43', '2013-01-08 18:51:45', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('5800', 'e54b3bcf9ef17ae74b2f72a8', '2', '测试应用', 'com.test', '0', '2013-04-17 15:53:44', '2013-01-11 12:37:52', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('5802', '2d98e3951103572de4cb1f09', '7', 'macweather', 'com.android.macweather', '0', '2013-04-17 15:53:44', '2013-01-11 12:57:59', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('5932', 'dd6e24b343e304b710716c2f', '2', 'tyui', 'com.yuio', '0', '2013-04-17 15:53:45', '2013-01-14 13:58:40', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('6026', '2e58ab671cd805533ec895b1', '11', 'GreedyPig', 'com.mod.pinkKiller', '0', '2013-04-17 15:53:49', '2013-01-15 12:29:49', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('6094', 'd592283c482034b5ee07d4c0', '12', 'example', 'example', '0', '2013-04-17 15:53:51', '2013-01-16 10:03:37', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('6105', '56f36af639b9a96b6bad9b60', '12', 'example', 'com.android.factory.model2', '0', '2013-04-17 15:53:52', '2013-01-16 11:21:38', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('6172', '75d01c536e766fa5089e1cb2', '11', 'GreedyPig', 'com.mod.pigKiller', '0', '2013-04-17 15:53:53', '2013-01-17 11:30:19', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('6391', '81e39a562123ec132d7c9bf2', '14', 'factory.model3', 'com.android.factory.model3', '0', '2013-04-17 15:53:54', '2013-01-21 17:09:22', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('6491', '11356cd4231a53af59eb9a18', '15', 'factory.model4', 'com.android.factory.model4', '0', '2013-04-17 15:53:55', '2013-01-23 11:23:11', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('6523', '5f6855b1b0dac634f32edc63', '16', 'factory.model5', 'com.android.factory.model5', '0', '2013-04-17 15:53:56', '2013-01-23 17:09:34', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7142', '70507839e7a8956ccff10ff7', '3', '我是tomato', 'cn.eddie.tomato', '0', '2013-04-17 15:53:57', '2013-02-02 06:12:44', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7143', 'd3401b8824b846cb3e31246d', '3', '我是tomato 2', 'cn.eddie.tomato.2', '0', '2013-04-17 15:53:58', '2013-02-02 06:19:23', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7145', '15bf0b11cded278db37e0f99', '3', '我是tomato 3', 'cn.eddie.tomato.3', '0', '2013-04-17 15:54:00', '2013-02-02 07:39:11', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7146', 'b114f2752bf34e1231980eae', '7', 'TomFmradio', 'com.mediatek.FMRadio', '0', '2013-04-17 15:54:01', '2013-02-05 13:45:58', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7147', '4526fd8ccffbff36ff722a1f', '7', 'MacFmRadio', 'com.mediatek.FMRadio.FMRadioActivity', '0', '2013-04-17 15:54:03', '2013-02-04 17:28:11', '0.2', '0.5', '1', '2');
INSERT INTO `t_apps` VALUES ('7148', 'f50e06992e85c7c8ecb78c91', '5', '服务器测试', 'com.service.test', '0', '2013-04-17 15:54:04', '2013-02-05 11:22:07', '0.2', '0.5', '0', '2');
INSERT INTO `t_apps` VALUES ('7297', '586e2742ca27b35dfc880b54', '17', 'wimp2', 'ww.apk', '0', '2013-04-17 15:54:05', '2013-03-25 10:08:36', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7327', '41a492dc6dd48ee98fe8b6e6', '17', '44422', '44', '0', '2013-04-17 15:54:07', '2013-03-27 17:29:42', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7328', '5afbaeef2926515432aa2781', '17', '22', '55.apk', '0', '2013-04-16 17:38:35', '2013-03-28 10:12:44', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7329', '507a84c31b6fad1e43651d10', '17', '5245', '666.apk', '0', '2013-04-16 17:38:36', '2013-03-28 14:39:31', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7330', '3cc3b366fea91bb6287c7e37', '17', '444', '555', '0', '2013-04-16 17:38:42', '2013-03-28 14:45:43', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7331', 'e3b2630d3d5c7ad9cea68c80', '17', '666', '667', '0', '2013-04-16 17:38:37', '2013-03-28 14:46:30', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7332', 'ce354965c25e7183b59b52db', '17', '44', '444', '0', '2013-04-16 17:38:38', '2013-03-28 14:55:42', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7333', '8003533e7ed4c452e69ef375', '17', '4', '4', '0', '2013-04-16 17:38:44', '2013-03-28 15:02:21', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7334', 'c55881d564dca5cfa1df0e06', '17', '55', '55', '0', '2013-04-16 17:38:39', '2013-03-28 15:06:20', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7347', '806006280002b5a3d16ea2b1', '17', '2', '6666', '0', '2013-04-16 17:38:46', '2013-03-31 19:12:48', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7348', '35371bbe459a78834f4f990c', '17', '578', '1233', '0', '2013-04-16 17:38:49', '2013-03-31 19:13:01', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7434', 'ec1676d1788d181c7607166e', '17', 'ghjety', 'ethetyyhu', '0', '2013-04-16 17:38:50', '2013-04-16 13:22:50', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7435', 'dd7c2f4b38a981586f76b4c0', '17', 'rtrt', 'rttyyuui', '0', '2013-04-16 17:38:51', '2013-04-16 13:32:52', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7436', '5ad71d90ae09147ab2d4666f', '17', '44', '446677', '0', '2013-04-17 15:17:13', '2013-04-16 17:14:28', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('7437', 'da26acedf9d5773e7ff37107', '17', 'ggrty', 'rtrtt', '0', '2013-04-17 15:17:19', '2013-04-16 17:19:47', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('7438', '2d2cfb6acefcd56dab8f2dc6', '17', '56427562', 'hh', '0', '2013-04-17 15:17:25', '2013-04-16 17:29:02', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20105', 'ec9a120030046528cdc4d655', '1', 'who2', 'else.com', '0', '2013-04-16 17:38:53', '2012-12-25 09:54:44', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20106', 'ec9a120030046528cdc4d631', '1', 'hello', 'com.what', '0', '2013-04-16 17:38:54', '2012-12-25 13:18:01', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20107', 'ec9a120030046528cdc4d621', '1', 'Why are you doing this!!!', 'com.ezjoynetwork.marbleblast', '0', '2013-04-16 17:38:55', '2012-12-25 13:25:14', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('20108', '967d91f4297869f1b78f4f8e', '1', 'hello', 'com.baidu', '0', '2013-04-16 17:38:56', '2012-12-26 16:00:51', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20125', 'fb067e149978333c02c78637', '5', 'test', 'cn.eddie.test12', '0', '2013-04-16 17:38:57', '2012-12-28 03:09:42', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('20126', '1dfd675f0c308179234c2587', '5', 'test2222', 'cn.eddie.test123', '0', '2013-04-16 17:38:59', '2012-12-28 02:55:02', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('20127', '760cef65a1940d077978f34f', '5', 'test222111', 'cn.test.new', '0', '2013-04-16 17:39:01', '2012-12-28 10:15:03', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('20129', '7553d7445efb3b462800c490', '1', 'you cry', 'com.cry', '0', '2013-04-16 17:39:01', '2012-12-28 10:56:45', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('20134', '677657ea01ed7d09ce716963', '1', 'hello', 'what.com', '0', '2013-04-16 17:39:02', '2012-12-29 10:38:09', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('20135', 'db9e3d367f1a03f7e5e41ecf', '1', 'what', 'com.cc1', '0', '2013-04-16 17:39:03', '2012-12-29 10:40:01', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('20136', '663d191e6c8ed20fd9215054', '1', 'ada', 'asdf', '0', '2013-04-16 17:39:04', '2012-12-29 12:26:00', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('20433', '3f78184e89d305b94ff70850', '17', 'fgg', 'tyeryw', '0', '2013-04-17 15:17:31', '2013-04-16 17:31:35', '0.8', '0', '1', '1');
INSERT INTO `t_apps` VALUES ('20434', 'bef2f09aa9a106a89eac8869', '17', 'ey', '3647347', '0', '2013-04-17 15:54:11', '2013-04-17 11:34:29', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20435', '94740a722b312e0657cb42b0', '17', 'hgwytw', 'hteurt', '0', '2013-04-22 09:56:27', '2013-04-17 12:01:16', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('20436', '4cbe762b07c25f9492cb93a2', '17', 'trwrt', 'trtt', '0', '2013-04-17 15:54:13', '2013-04-17 15:16:34', '0.8', '0', '1', '2');
INSERT INTO `t_apps` VALUES ('20437', '2a2882b9b9e02657ecac7253', '17', 'yy', 'yyer', '0', '2013-04-17 15:36:59', '2013-04-17 15:17:56', '0.8', '0', '0', '2');
INSERT INTO `t_apps` VALUES ('20438', 'ea7041b2e1a2fc12af4b500c', '17', 'wye', 'yyrutuu', '0', '2013-04-17 16:06:56', '2013-04-17 16:06:32', '0.8', '0', '0', '1');
INSERT INTO `t_apps` VALUES ('20439', '7c0440db561a20482b40b970', '17', '1', '1', '0', '2013-04-17 16:10:13', '2013-04-17 16:09:50', '0.8', '0', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_payment
-- ----------------------------
INSERT INTO `t_payment` VALUES ('1', '1', '2', null, 'why', 'are', 'you', 'doing', 'this', '', '2012-12-24 13:16:19', '2013-01-10 17:16:46');
INSERT INTO `t_payment` VALUES ('2', '16', '1', '123123123', null, null, null, null, null, '\0', '2013-01-09 10:42:45', '2013-01-09 10:42:45');

-- ----------------------------
-- Table structure for `t_report_daily`
-- ----------------------------
DROP TABLE IF EXISTS `t_report_daily`;
CREATE TABLE `t_report_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idate` int(10) unsigned NOT NULL,
  `dev_id` varchar(255) NOT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `kpi_value_src` double DEFAULT '0' COMMENT '折算前数据\n',
  `kpi_code` varchar(255) DEFAULT NULL,
  `kpi_value` double DEFAULT '0' COMMENT '前端展示数据\n',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ind_idate` (`idate`),
  KEY `ind_devId_code_appId` (`dev_id`,`kpi_code`,`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_daily
-- ----------------------------
INSERT INTO `t_report_daily` VALUES ('1', '20121201', '1', '20107', null, 'sm_user_new', '78', '2012-12-27 10:41:00');
INSERT INTO `t_report_daily` VALUES ('6', '20121202', '1', '20107', null, 'sm_user_new', '10', '2012-12-27 10:43:56');
INSERT INTO `t_report_daily` VALUES ('7', '20121203', '1', '20107', null, 'sm_user_new', '8', '2012-12-27 10:43:56');
INSERT INTO `t_report_daily` VALUES ('8', '20121204', '1', '20107', null, 'sm_user_new', '24', '2012-12-27 10:43:56');
INSERT INTO `t_report_daily` VALUES ('9', '20121205', '1', '20107', null, 'sm_user_new', '64', '2012-12-27 10:43:56');
INSERT INTO `t_report_daily` VALUES ('10', '20121206', '1', '20107', null, 'sm_user_new', '200', '2012-12-27 10:43:56');
INSERT INTO `t_report_daily` VALUES ('11', '20121207', '1', '20107', null, 'sm_user_new', '35', '2012-12-27 10:43:57');
INSERT INTO `t_report_daily` VALUES ('12', '20121208', '1', '20107', null, 'sm_user_new', '48', '2012-12-27 10:43:57');
INSERT INTO `t_report_daily` VALUES ('13', '20121209', '1', '20107', null, 'sm_user_new', '13', '2012-12-27 10:43:57');
INSERT INTO `t_report_daily` VALUES ('14', '20121210', '1', '20107', null, 'sm_user_new', '15', '2012-12-27 10:43:57');
INSERT INTO `t_report_daily` VALUES ('15', '20121211', '1', '20107', null, 'sm_user_new', '9', '2012-12-27 10:43:57');
INSERT INTO `t_report_daily` VALUES ('16', '20121212', '1', '20107', null, 'sm_user_new', '29', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('17', '20121213', '1', '20107', null, 'sm_user_new', '63', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('18', '20121214', '1', '20107', null, 'sm_user_new', '42', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('19', '20121215', '1', '20107', null, 'sm_user_new', '31', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('20', '20121216', '1', '20107', null, 'sm_user_new', '63', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('21', '20121217', '1', '20107', null, 'sm_user_new', '98', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('22', '20121218', '1', '20107', null, 'sm_user_new', '63', '2012-12-27 10:43:58');
INSERT INTO `t_report_daily` VALUES ('23', '20121219', '1', '20107', null, 'sm_user_new', '55', '2012-12-27 10:43:59');
INSERT INTO `t_report_daily` VALUES ('24', '20121220', '1', '20107', null, 'sm_user_new', '36', '2012-12-27 10:43:59');
INSERT INTO `t_report_daily` VALUES ('25', '20121221', '1', '20107', null, 'sm_user_new', '28', '2012-12-27 10:43:59');
INSERT INTO `t_report_daily` VALUES ('26', '20121222', '1', '20107', null, 'sm_user_new', '33', '2012-12-27 10:43:59');
INSERT INTO `t_report_daily` VALUES ('27', '20121223', '1', '20107', null, 'sm_user_new', '60', '2012-12-27 10:43:59');
INSERT INTO `t_report_daily` VALUES ('28', '20121224', '1', '20107', null, 'sm_user_new', '51', '2012-12-27 10:44:00');
INSERT INTO `t_report_daily` VALUES ('29', '20121225', '1', '20107', null, 'sm_user_new', '39', '2012-12-27 10:44:00');
INSERT INTO `t_report_daily` VALUES ('30', '20121226', '1', '20107', null, 'sm_user_new', '400', '2012-12-27 10:44:00');
INSERT INTO `t_report_daily` VALUES ('31', '20121227', '1', '20107', null, 'sm_user_new', '32', '2012-12-27 10:44:00');
INSERT INTO `t_report_daily` VALUES ('32', '20121213', '1', '20107', '0', 'sm_user_online', '4', '2012-12-28 12:38:00');
INSERT INTO `t_report_daily` VALUES ('33', '20121214', '1', '20107', '0', 'sm_user_online', '77', '2012-12-28 12:38:00');
INSERT INTO `t_report_daily` VALUES ('34', '20121215', '1', '20107', '0', 'sm_user_online', '32', '2012-12-28 12:38:01');
INSERT INTO `t_report_daily` VALUES ('35', '20121216', '1', '20107', '0', 'sm_user_online', '63', '2012-12-28 12:38:02');
INSERT INTO `t_report_daily` VALUES ('36', '20121217', '1', '20107', '0', 'sm_user_online', '55', '2012-12-28 12:38:02');
INSERT INTO `t_report_daily` VALUES ('37', '20121218', '1', '20107', '0', 'sm_user_online', '36', '2012-12-28 12:38:02');
INSERT INTO `t_report_daily` VALUES ('38', '20121219', '1', '20107', '0', 'sm_user_online', '55', '2012-12-28 12:38:03');
INSERT INTO `t_report_daily` VALUES ('39', '20121220', '1', '20107', '0', 'sm_user_online', '42', '2012-12-28 12:38:03');
INSERT INTO `t_report_daily` VALUES ('40', '20121221', '1', '20107', '0', 'sm_user_online', '28', '2012-12-28 12:38:04');
INSERT INTO `t_report_daily` VALUES ('41', '20121222', '1', '20107', '0', 'sm_user_online', '21', '2012-12-28 12:38:04');
INSERT INTO `t_report_daily` VALUES ('42', '20121227', '1', '20107', '0', 'sm_user_online', '16', '2012-12-28 12:38:04');
INSERT INTO `t_report_daily` VALUES ('45', '20121226', '1', '20107', '0', 'sm_user_online', '10', '2012-12-28 12:38:05');
INSERT INTO `t_report_daily` VALUES ('50', '20121229', '1', '20107', '0', 'sm_user_amount', '1236', '2012-12-28 16:15:22');
INSERT INTO `t_report_daily` VALUES ('73', '20130110', '2', '5643', '11', 'sm_user_new', '9', '2013-01-10 23:30:08');
INSERT INTO `t_report_daily` VALUES ('74', '20130110', '3', '5130', '1', 'sm_user_new', '1', '2013-01-10 23:30:08');
INSERT INTO `t_report_daily` VALUES ('75', '20130110', '7', '5594', '1', 'sm_user_new', '1', '2013-01-10 23:30:08');
INSERT INTO `t_report_daily` VALUES ('103', '20130111', '2', '5643', '4', 'sm_user_new', '4', '2013-01-11 23:30:08');
INSERT INTO `t_report_daily` VALUES ('110', '20130113', '2', '5643', '1', 'sm_user_new', '1', '2013-01-13 23:30:09');
INSERT INTO `t_report_daily` VALUES ('125', '20130114', '7', '5594', '1', 'sm_user_new', '1', '2013-01-14 23:30:10');
INSERT INTO `t_report_daily` VALUES ('191', '20130116', '12', '6094', '1', 'sm_user_new', '1', '2013-01-16 23:30:11');
INSERT INTO `t_report_daily` VALUES ('192', '20130116', '12', '6105', '1', 'sm_user_new', '1', '2013-01-16 23:30:11');
INSERT INTO `t_report_daily` VALUES ('217', '20130117', '11', '6172', '1', 'sm_user_new', '1', '2013-01-17 23:30:12');
INSERT INTO `t_report_daily` VALUES ('238', '20130118', '11', '6172', '1', 'sm_user_new', '1', '2013-01-18 23:30:12');
INSERT INTO `t_report_daily` VALUES ('251', '20130121', '14', '6391', '1', 'sm_user_new', '1', '2013-01-21 23:30:14');
INSERT INTO `t_report_daily` VALUES ('259', '20130124', '16', '6523', '1', 'sm_user_new', '1', '2013-01-24 23:30:15');
INSERT INTO `t_report_daily` VALUES ('515', '20130125', '16', '6523', '2', 'sm_user_new', '2', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('516', '20130125', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('517', '20130125', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('518', '20130125', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('519', '20130125', '5', '5079', '3', 'sm_user_amount', null, '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('520', '20130125', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('521', '20130125', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('522', '20130125', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('523', '20130125', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('524', '20130125', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('525', '20130125', '16', '6523', '3', 'sm_user_amount', '3', '2013-01-25 23:30:17');
INSERT INTO `t_report_daily` VALUES ('1235', '20130126', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1236', '20130126', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1237', '20130126', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1238', '20130126', '5', '5079', '3', 'sm_user_amount', null, '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1239', '20130126', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1240', '20130126', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1241', '20130126', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1242', '20130126', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1243', '20130126', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1244', '20130126', '16', '6523', '3', 'sm_user_amount', '3', '2013-01-26 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1955', '20130127', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1956', '20130127', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1957', '20130127', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1958', '20130127', '5', '5079', '3', 'sm_user_amount', null, '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1959', '20130127', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1960', '20130127', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1961', '20130127', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1962', '20130127', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1963', '20130127', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('1964', '20130127', '16', '6523', '3', 'sm_user_amount', '3', '2013-01-27 23:30:18');
INSERT INTO `t_report_daily` VALUES ('2990', '20130128', '16', '6523', '3', 'sm_user_new', '3', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2991', '20130128', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2992', '20130128', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2993', '20130128', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2994', '20130128', '5', '5079', '3', 'sm_user_amount', null, '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2995', '20130128', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2996', '20130128', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2997', '20130128', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2998', '20130128', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('2999', '20130128', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('3000', '20130128', '16', '6523', '6', 'sm_user_amount', '6', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('3001', '20130128', '16', '6523', '2', 'sm_user_online', '2', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('3002', '20130128', '16', '6523', '3', 'sm_ad_installed', '3', '2013-01-29 09:05:56');
INSERT INTO `t_report_daily` VALUES ('4175', '20130129', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4176', '20130129', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4177', '20130129', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4178', '20130129', '5', '5079', '3', 'sm_user_amount', null, '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4179', '20130129', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4180', '20130129', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4181', '20130129', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4182', '20130129', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4183', '20130129', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4184', '20130129', '16', '6523', '6', 'sm_user_amount', '6', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4185', '20130129', '16', '6523', '1', 'sm_user_online', '1', '2013-01-30 23:24:19');
INSERT INTO `t_report_daily` VALUES ('4190', '20130130', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4191', '20130130', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4192', '20130130', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4193', '20130130', '5', '5079', '3', 'sm_user_amount', null, '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4194', '20130130', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4195', '20130130', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4196', '20130130', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4197', '20130130', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4198', '20130130', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4199', '20130130', '16', '6523', '6', 'sm_user_amount', '6', '2013-01-30 23:30:37');
INSERT INTO `t_report_daily` VALUES ('4912', '20130131', '2', '5643', '18', 'sm_user_amount', '18', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4913', '20130131', '3', '5130', '5', 'sm_user_amount', '5', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4914', '20130131', '4', '5145', '1', 'sm_user_amount', '1', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4915', '20130131', '5', '5079', '3', 'sm_user_amount', null, '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4916', '20130131', '7', '5594', '2', 'sm_user_amount', '2', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4917', '20130131', '11', '6172', '2', 'sm_user_amount', '2', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4918', '20130131', '12', '6094', '1', 'sm_user_amount', '1', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4919', '20130131', '12', '6105', '1', 'sm_user_amount', '1', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4920', '20130131', '14', '6391', '1', 'sm_user_amount', '1', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('4921', '20130131', '16', '6523', '6', 'sm_user_amount', '6', '2013-01-31 23:30:01');
INSERT INTO `t_report_daily` VALUES ('8145', '20130204', '2', '5643', '15', 'sm_user_online', '15', '2013-02-05 10:53:03');
INSERT INTO `t_report_daily` VALUES ('8661', '20130205', '2', '5643', '11', 'sm_user_online', '11', '2013-02-06 03:05:31');
INSERT INTO `t_report_daily` VALUES ('8662', '20130205', '3', '5130', '1', 'sm_user_online', '1', '2013-02-06 03:05:31');
INSERT INTO `t_report_daily` VALUES ('9395', '20130206', '2', '5643', '12', 'sm_user_online', '12', '2013-02-07 03:05:31');
INSERT INTO `t_report_daily` VALUES ('9396', '20130206', '3', '5130', '1', 'sm_user_online', '1', '2013-02-07 03:05:31');
INSERT INTO `t_report_daily` VALUES ('10151', '20130207', '2', '5643', '12', 'sm_user_online', '12', '2013-02-08 03:05:38');
INSERT INTO `t_report_daily` VALUES ('10152', '20130207', '3', '5130', '1', 'sm_user_online', '1', '2013-02-08 03:05:38');
INSERT INTO `t_report_daily` VALUES ('10907', '20130208', '2', '5643', '9', 'sm_user_online', '9', '2013-02-09 03:05:34');
INSERT INTO `t_report_daily` VALUES ('10908', '20130208', '3', '5130', '1', 'sm_user_online', '1', '2013-02-09 03:05:34');
INSERT INTO `t_report_daily` VALUES ('11641', '20130209', '2', '5643', '8', 'sm_user_online', '8', '2013-02-10 03:05:39');
INSERT INTO `t_report_daily` VALUES ('12373', '20130210', '2', '5643', '8', 'sm_user_online', '8', '2013-02-11 03:05:34');
INSERT INTO `t_report_daily` VALUES ('13105', '20130211', '2', '5643', '4', 'sm_user_online', '4', '2013-02-12 03:05:37');
INSERT INTO `t_report_daily` VALUES ('13836', '20130212', '2', '5643', '5', 'sm_user_online', '5', '2013-02-13 03:05:35');
INSERT INTO `t_report_daily` VALUES ('14567', '20130213', '2', '5643', '9', 'sm_user_online', '9', '2013-02-14 03:05:39');
INSERT INTO `t_report_daily` VALUES ('15299', '20130214', '2', '5643', '6', 'sm_user_online', '6', '2013-02-15 03:05:41');
INSERT INTO `t_report_daily` VALUES ('16030', '20130215', '2', '5643', '6', 'sm_user_online', '6', '2013-02-16 03:05:41');
INSERT INTO `t_report_daily` VALUES ('16762', '20130216', '2', '5643', '4', 'sm_user_online', '4', '2013-02-17 03:05:42');
INSERT INTO `t_report_daily` VALUES ('17494', '20130217', '2', '5643', '7', 'sm_user_online', '7', '2013-02-18 03:05:43');
INSERT INTO `t_report_daily` VALUES ('18226', '20130218', '2', '5643', '6', 'sm_user_online', '6', '2013-02-19 03:05:44');
INSERT INTO `t_report_daily` VALUES ('18669', '20130201', '3', '5130', '2', 'sm_user_new', '2', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18670', '20130201', '2', '5643', '18', 'sm_user_amount', '18', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18671', '20130201', '3', '5130', '7', 'sm_user_amount', '7', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18672', '20130201', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18673', '20130201', '5', '5079', '3', 'sm_user_amount', null, '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18674', '20130201', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18675', '20130201', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18676', '20130201', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18677', '20130201', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18678', '20130201', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18679', '20130201', '16', '6523', '6', 'sm_user_amount', '6', '2013-02-19 17:50:26');
INSERT INTO `t_report_daily` VALUES ('18973', '20130219', '2', '5643', '9', 'sm_user_online', '9', '2013-02-20 03:05:49');
INSERT INTO `t_report_daily` VALUES ('19217', '20130202', '2', '5643', '32', 'sm_user_amount', '32', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19218', '20130202', '2', '5643', '14', 'sm_user_new', '14', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19219', '20130202', '3', '5130', '7', 'sm_user_amount', '7', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19220', '20130202', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19221', '20130202', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19222', '20130202', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19223', '20130202', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19224', '20130202', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19225', '20130202', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19226', '20130202', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19227', '20130202', '16', '6523', '6', 'sm_user_amount', '6', '2013-02-20 10:41:38');
INSERT INTO `t_report_daily` VALUES ('19232', '20130203', '2', '5643', '3', 'sm_user_new', '3', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19233', '20130203', '16', '6523', '1', 'sm_user_new', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19234', '20130203', '2', '5643', '35', 'sm_user_amount', '35', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19235', '20130203', '3', '5130', '7', 'sm_user_amount', '7', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19236', '20130203', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19237', '20130203', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19238', '20130203', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19239', '20130203', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19240', '20130203', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19241', '20130203', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19242', '20130203', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19243', '20130203', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19244', '20130203', '2', '5643', '1', 'sm_ad_installed', '1', '2013-02-20 10:41:57');
INSERT INTO `t_report_daily` VALUES ('19247', '20130204', '2', '5643', '3', 'sm_user_new', '3', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19248', '20130204', '3', '5130', '1', 'sm_user_new', '1', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19249', '20130204', '2', '5643', '38', 'sm_user_amount', '38', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19250', '20130204', '3', '5130', '8', 'sm_user_amount', '8', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19251', '20130204', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19252', '20130204', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19253', '20130204', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19254', '20130204', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19255', '20130204', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19256', '20130204', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19257', '20130204', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19258', '20130204', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:42:17');
INSERT INTO `t_report_daily` VALUES ('19262', '20130205', '2', '5643', '4', 'sm_user_new', '4', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19263', '20130205', '3', '5130', '1', 'sm_user_new', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19264', '20130205', '5', '7148', '1', 'sm_user_new', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19265', '20130205', '7', '7146', '2', 'sm_user_new', '2', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19266', '20130205', '7', '7147', '1', 'sm_user_new', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19267', '20130205', '2', '5643', '42', 'sm_user_amount', '42', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19268', '20130205', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19269', '20130205', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19270', '20130205', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19271', '20130205', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19272', '20130205', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19273', '20130205', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19274', '20130205', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19275', '20130205', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19276', '20130205', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19277', '20130205', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19278', '20130205', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19279', '20130205', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:43:05');
INSERT INTO `t_report_daily` VALUES ('19293', '20130206', '2', '5643', '42', 'sm_user_amount', '42', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19294', '20130206', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19295', '20130206', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19296', '20130206', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19297', '20130206', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19298', '20130206', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19299', '20130206', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19300', '20130206', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19301', '20130206', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19302', '20130206', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19303', '20130206', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19304', '20130206', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19305', '20130206', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:43:47');
INSERT INTO `t_report_daily` VALUES ('19308', '20130207', '2', '5643', '2', 'sm_user_new', '2', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19309', '20130207', '2', '5643', '44', 'sm_user_amount', '44', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19310', '20130207', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19311', '20130207', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19312', '20130207', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19313', '20130207', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19314', '20130207', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19315', '20130207', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19316', '20130207', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19317', '20130207', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19318', '20130207', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19319', '20130207', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19320', '20130207', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19321', '20130207', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:44:19');
INSERT INTO `t_report_daily` VALUES ('19323', '20130208', '2', '5643', '44', 'sm_user_amount', '44', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19324', '20130208', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19325', '20130208', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19326', '20130208', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19327', '20130208', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19328', '20130208', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19329', '20130208', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19330', '20130208', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19331', '20130208', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19332', '20130208', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19333', '20130208', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19334', '20130208', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19335', '20130208', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:44:44');
INSERT INTO `t_report_daily` VALUES ('19338', '20130209', '2', '5643', '44', 'sm_user_amount', '44', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19339', '20130209', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19340', '20130209', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19341', '20130209', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19342', '20130209', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19343', '20130209', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19344', '20130209', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19345', '20130209', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19346', '20130209', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19347', '20130209', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19348', '20130209', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19349', '20130209', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19350', '20130209', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:46:00');
INSERT INTO `t_report_daily` VALUES ('19353', '20130210', '2', '5643', '44', 'sm_user_amount', '44', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19354', '20130210', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19355', '20130210', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19356', '20130210', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19357', '20130210', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19358', '20130210', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19359', '20130210', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19360', '20130210', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19361', '20130210', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19362', '20130210', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19363', '20130210', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19364', '20130210', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19365', '20130210', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:46:53');
INSERT INTO `t_report_daily` VALUES ('19368', '20130211', '2', '5643', '44', 'sm_user_amount', '44', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19369', '20130211', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19370', '20130211', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19371', '20130211', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19372', '20130211', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19373', '20130211', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19374', '20130211', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19375', '20130211', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19376', '20130211', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19377', '20130211', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19378', '20130211', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19379', '20130211', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19380', '20130211', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:50:18');
INSERT INTO `t_report_daily` VALUES ('19383', '20130212', '2', '5643', '1', 'sm_user_new', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19384', '20130212', '2', '5643', '45', 'sm_user_amount', '45', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19385', '20130212', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19386', '20130212', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19387', '20130212', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19388', '20130212', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19389', '20130212', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19390', '20130212', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19391', '20130212', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19392', '20130212', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19393', '20130212', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19394', '20130212', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19395', '20130212', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19396', '20130212', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:50:48');
INSERT INTO `t_report_daily` VALUES ('19398', '20130213', '2', '5643', '45', 'sm_user_amount', '45', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19399', '20130213', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19400', '20130213', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19401', '20130213', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19402', '20130213', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19403', '20130213', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19404', '20130213', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19405', '20130213', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19406', '20130213', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19407', '20130213', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19408', '20130213', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19409', '20130213', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19410', '20130213', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:59:19');
INSERT INTO `t_report_daily` VALUES ('19413', '20130214', '2', '5643', '45', 'sm_user_amount', '45', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19414', '20130214', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19415', '20130214', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19416', '20130214', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19417', '20130214', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19418', '20130214', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19419', '20130214', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19420', '20130214', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19421', '20130214', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19422', '20130214', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19423', '20130214', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19424', '20130214', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19425', '20130214', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 10:59:39');
INSERT INTO `t_report_daily` VALUES ('19443', '20130215', '2', '5643', '1', 'sm_user_new', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19444', '20130215', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19445', '20130215', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19446', '20130215', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19447', '20130215', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19448', '20130215', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19449', '20130215', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19450', '20130215', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19451', '20130215', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19452', '20130215', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19453', '20130215', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19454', '20130215', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19455', '20130215', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19456', '20130215', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 11:00:36');
INSERT INTO `t_report_daily` VALUES ('19459', '20130216', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19460', '20130216', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19461', '20130216', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19462', '20130216', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19463', '20130216', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19464', '20130216', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19465', '20130216', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19466', '20130216', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19467', '20130216', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19468', '20130216', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19469', '20130216', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19470', '20130216', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19471', '20130216', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 11:20:17');
INSERT INTO `t_report_daily` VALUES ('19474', '20130217', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19475', '20130217', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19476', '20130217', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19477', '20130217', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19478', '20130217', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19479', '20130217', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19480', '20130217', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19481', '20130217', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19482', '20130217', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19483', '20130217', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19484', '20130217', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19485', '20130217', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19486', '20130217', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 11:23:02');
INSERT INTO `t_report_daily` VALUES ('19489', '20130218', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19490', '20130218', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19491', '20130218', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19492', '20130218', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19493', '20130218', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19494', '20130218', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19495', '20130218', '7', '7146', '2', 'sm_user_amount', '2', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19496', '20130218', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19497', '20130218', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19498', '20130218', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19499', '20130218', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19500', '20130218', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19501', '20130218', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 11:26:17');
INSERT INTO `t_report_daily` VALUES ('19504', '20130219', '7', '7146', '1', 'sm_user_new', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19505', '20130219', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19506', '20130219', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19507', '20130219', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19508', '20130219', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19509', '20130219', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19510', '20130219', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19511', '20130219', '7', '7146', '3', 'sm_user_amount', '3', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19512', '20130219', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19513', '20130219', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19514', '20130219', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19515', '20130219', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19516', '20130219', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19517', '20130219', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 11:27:56');
INSERT INTO `t_report_daily` VALUES ('19900', '20130220', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19901', '20130220', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19902', '20130220', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19903', '20130220', '5', '5079', '3', 'sm_user_amount', null, '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19904', '20130220', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19905', '20130220', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19906', '20130220', '7', '7146', '3', 'sm_user_amount', '3', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19907', '20130220', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19908', '20130220', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19909', '20130220', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19910', '20130220', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19911', '20130220', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('19912', '20130220', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-20 23:30:00');
INSERT INTO `t_report_daily` VALUES ('20021', '20130220', '2', '5643', '9', 'sm_user_online', '0', '2013-02-21 03:05:36');
INSERT INTO `t_report_daily` VALUES ('20326', '20130221', '2', '5643', '7', 'sm_user_online', '7', '2013-02-21 13:06:05');
INSERT INTO `t_report_daily` VALUES ('20357', '20130221', '2', '5643', '46', 'sm_user_amount', '46', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20358', '20130221', '3', '5130', '9', 'sm_user_amount', '9', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20359', '20130221', '4', '5145', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20360', '20130221', '5', '5079', '3', 'sm_user_amount', null, '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20361', '20130221', '5', '7148', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20362', '20130221', '7', '5594', '2', 'sm_user_amount', '2', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20363', '20130221', '7', '7146', '4', 'sm_user_amount', '4', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20364', '20130221', '7', '7147', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20365', '20130221', '11', '6172', '2', 'sm_user_amount', '2', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20366', '20130221', '12', '6094', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20367', '20130221', '12', '6105', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20368', '20130221', '14', '6391', '1', 'sm_user_amount', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20369', '20130221', '16', '6523', '7', 'sm_user_amount', '7', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('20370', '20130221', '7', '7146', '1', 'sm_user_new', '1', '2013-02-21 14:30:01');
INSERT INTO `t_report_daily` VALUES ('1012150', '20130128', '16', '6523', '1.5', 'sm_earnings', '1.5', '2013-02-28 16:57:27');
INSERT INTO `t_report_daily` VALUES ('1012151', '20130203', '2', '5643', '0.5', 'sm_earnings', '0.5', '2013-02-28 16:57:27');
INSERT INTO `t_report_daily` VALUES ('1012153', '20130128', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:27');
INSERT INTO `t_report_daily` VALUES ('1012155', '20130129', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:27');
INSERT INTO `t_report_daily` VALUES ('1012157', '20130130', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:28');
INSERT INTO `t_report_daily` VALUES ('1012159', '20130131', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:28');
INSERT INTO `t_report_daily` VALUES ('1012161', '20130201', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:28');
INSERT INTO `t_report_daily` VALUES ('1012163', '20130202', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:28');
INSERT INTO `t_report_daily` VALUES ('1012165', '20130203', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012166', '20130203', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012171', '20130204', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012172', '20130204', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012177', '20130205', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012178', '20130205', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012183', '20130206', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012184', '20130206', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:29');
INSERT INTO `t_report_daily` VALUES ('1012189', '20130207', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012190', '20130207', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012195', '20130208', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012196', '20130208', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012201', '20130209', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012202', '20130209', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012207', '20130210', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012208', '20130210', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:30');
INSERT INTO `t_report_daily` VALUES ('1012213', '20130211', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012214', '20130211', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012219', '20130212', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012220', '20130212', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012225', '20130213', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012226', '20130213', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012231', '20130214', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012232', '20130214', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012237', '20130215', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012238', '20130215', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:31');
INSERT INTO `t_report_daily` VALUES ('1012243', '20130216', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012244', '20130216', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012249', '20130217', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012250', '20130217', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012255', '20130218', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012256', '20130218', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012261', '20130219', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012262', '20130219', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:32');
INSERT INTO `t_report_daily` VALUES ('1012267', '20130220', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012268', '20130220', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012273', '20130221', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012274', '20130221', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012279', '20130222', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012280', '20130222', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012285', '20130223', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012286', '20130223', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:33');
INSERT INTO `t_report_daily` VALUES ('1012291', '20130224', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012292', '20130224', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012297', '20130225', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012298', '20130225', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012303', '20130226', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012304', '20130226', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012306', '20130227', '16', '6523', '1.5', 'sm_earnings_amount', '1.5', '2013-02-28 16:57:34');
INSERT INTO `t_report_daily` VALUES ('1012307', '20130227', '2', '5643', '0.5', 'sm_earnings_amount', '0.5', '2013-02-28 16:57:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_hourly
-- ----------------------------
INSERT INTO `t_report_hourly` VALUES ('1', '20121227', '9', '1', '20107', '0', 'sm_user_online', '95', '2012-12-28 20:39:31');
INSERT INTO `t_report_hourly` VALUES ('2', '20121227', '13', '1', '20107', '0', 'sm_user_new', '32', '2012-12-28 20:39:31');
INSERT INTO `t_report_hourly` VALUES ('3', '20121228', '14', '1', '20107', '0', 'sm_user_online', '57', '2012-12-28 20:39:32');
INSERT INTO `t_report_hourly` VALUES ('4', '20121228', '19', '1', '20107', '0', 'sm_user_new', '42', '2012-12-28 20:39:32');
INSERT INTO `t_report_hourly` VALUES ('5', '20121228', '21', '1', '20107', '0', 'sm_user_new', '21', '2012-12-28 20:39:32');

-- ----------------------------
-- Table structure for `t_report_monthly`
-- ----------------------------
DROP TABLE IF EXISTS `t_report_monthly`;
CREATE TABLE `t_report_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mon` int(6) unsigned NOT NULL,
  `dev_id` varchar(255) NOT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `kpi_value_src` double DEFAULT '0' COMMENT '折算前数据',
  `kpi_code` varchar(255) DEFAULT NULL,
  `kpi_value` double DEFAULT '0' COMMENT '前端展示数据',
  `itime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ind_mon` (`mon`),
  KEY `ind_devId_code_appId` (`dev_id`,`kpi_code`,`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_monthly
-- ----------------------------
INSERT INTO `t_report_monthly` VALUES ('2', '201211', '1', '20107', '0', 'sm_earnings', '1057', '2012-12-28 12:41:45');
INSERT INTO `t_report_monthly` VALUES ('3', '201211', '1', '20107', '0', 'sm_user_amount', '3321', '2012-12-28 12:41:45');
INSERT INTO `t_report_monthly` VALUES ('7', '201211', '1', '20107', '0', 'sm_user_online', '987', '2012-12-28 12:41:46');
INSERT INTO `t_report_monthly` VALUES ('8', '201211', '1', '20107', '0', 'sm_user_new', '1326', '2012-12-28 12:41:46');

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
INSERT INTO `t_reset_pwd` VALUES ('caosd@jpush.cn', '905-6a9-c5bfe9f128ca1964be9c', '2013-03-24 15:09:52', '\0');
INSERT INTO `t_reset_pwd` VALUES ('406194332@qq.com', '20d-136-1492361df5ada8db2c1a', '2013-01-09 09:46:30', '');

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
INSERT INTO `t_transfer_history` VALUES ('m6fcxc2s0mgwzxe3ps', '1', '1', '{\"paypalLogin\":\"123123\"}', '2000', '2012-12-24 14:50:00', '2012-12-24 14:50:11');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `account_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '帐户名称',
  `account_pwd` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '帐户密码',
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `account_type` tinyint(4) NOT NULL COMMENT '帐户类型：1个人，2公司',
  `company_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '国家名称',
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `reg_date` datetime NOT NULL COMMENT '注册日期',
  `first_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `login_token` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `login_token_time` datetime DEFAULT NULL,
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '4297F44B13955235245B2497399D7A93', 'caosd@jpush.cn', '2', 'Smile Tomato', 'Malaysia', 'shenzhen, guangdong, china', '2012-12-21 22:22:32', null, null, '369bde70c29e4b6286edddd88dd66723', '2013-01-16 11:19:39');
INSERT INTO `t_user` VALUES ('16', 'admin2', '670B14728AD9902AECBA32E22FA4F6BD', '406194332@qq.com', '1', null, 'Andorra', 'china.bb', '2013-01-09 10:23:22', 'fn', 'ln', '2cdc887819974fb199c26146bcdb2543', '2013-01-09 10:46:37');
INSERT INTO `t_user` VALUES ('17', 'tanwenli', '3F111A2087FE9164C46CA115EF3DA64D', 'tanwl@jpush.cn', '1', '', 'China', '深圳市宝安区', '2013-03-25 10:03:46', '谭', '文丽', '8801477cf25b4528869d5bf2fe1f62e1', '2013-04-22 16:07:29');

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
INSERT INTO `t_user_imei` VALUES ('1', '17', '7297', '123123123004410', '咔布咔', '1', '0', '2013-03-25 10:11:02');
INSERT INTO `t_user_imei` VALUES ('5', '17', '7334', '555555522225', '555', '1', '0', '2013-03-29 16:45:30');
INSERT INTO `t_user_imei` VALUES ('6', '17', '7349', '5555555555555', '33', '1', '0', '2013-04-01 14:56:31');
INSERT INTO `t_user_imei` VALUES ('10', '17', '7437', '4526352289054241', 'tr3t', '1', '0', '2013-04-16 18:18:44');

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
    END;;
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
END;;
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
    END;;
DELIMITER ;
