-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 06 月 02 日 06:13
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `stomato`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_apps`
--

CREATE TABLE IF NOT EXISTS `t_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=804 ;

--
-- 转存表中的数据 `t_apps`
--

INSERT INTO `t_apps` (`id`, `app_key`, `uid`, `name`, `pkg`, `sm_ad_installed`, `last_update_time`, `create_time`, `rate`, `arp`, `status`, `push_status`) VALUES
(214, '054ba7fd76bee3da704f3ffd', 18, 'ccc', 'com.baidu.', 0, '2013-05-28 05:52:50', '2013-05-28 13:52:50', 0.8, 0, 0, 2),
(305, 'fe74ec41aa2f4111a188f06eb8d4834e', 20, 'test', 'com.test', 0, '2013-06-02 00:53:55', '2013-06-02 08:48:33', 0.8, 0, 0, 2),
(306, '1e5fc3c85c5b07bb7df563c726a28b82', 20, 'test2', 'com.test2', 0, '2013-06-02 00:54:06', '2013-06-02 08:48:48', 0.8, 0, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `t_config`
--

CREATE TABLE IF NOT EXISTS `t_config` (
  `cmd_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `cmd_value` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmd_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `t_config`
--

INSERT INTO `t_config` (`cmd_name`, `cmd_value`, `last_update_time`) VALUES
('released_sdk', 'sa_sdk_0.2.4.zip', '2013-01-06 02:16:03'),
('files_path', '/files', '2013-05-28 08:59:14');

-- --------------------------------------------------------

--
-- 表的结构 `t_credentials`
--

CREATE TABLE IF NOT EXISTS `t_credentials` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_credentials`
--

INSERT INTO `t_credentials` (`id`, `uid`, `credentials_type`, `credentials_no`, `credentials_photo1`, `credentials_photo2`, `bank_name`, `bank_card`, `bank_account`, `bank_address`, `last_update_time`, `create_time`) VALUES
(1, 20, 1, '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 04:05:25', '2013-05-29 14:48:23');

-- --------------------------------------------------------

--
-- 表的结构 `t_extra_applist`
--

CREATE TABLE IF NOT EXISTS `t_extra_applist` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_extra_applist`
--

INSERT INTO `t_extra_applist` (`id`, `ord`, `name`, `size`, `version`, `previews_counts`, `description`, `download_url`, `download_counts`) VALUES
(1, 1, '明年赚多少', '3.2MB', '1.0', NULL, '明年赚多少？你说了算！隐藏在手机里的财富等你来挖掘！<br/>轻轻摇晃手机，控制财神爷，接住天上掉下来的金币啦。专为新年打造的贺岁版财富游戏，祝愿大家金币赚满盆，来年发大财！好寓意，好兆头，尽情赚！', 'http://cdn.market.hiapk.com/data/upload/2012/12_28/18/com.topappcamp.forturnerain_182449.apk', '120.000+'),
(2, 2, '极速手电筒', '3.53MB', '1.0', NULL, '一款简单实用、反应迅速的手电应用。当你走进黑黑的楼洞、街道，或者在黑暗中寻找物品时，它能快速的为您提供照明功能。<br/><br/>软件特点：<br/>1.支持设备范围最广泛；<br/>2.操作更快、更便捷；<br/>3.更省电、节能。', 'http://cdn.market.hiapk.com/data/upload/2012/12_21/13/com.topappcamp.flashLed_134601.apk', '150.000+'),
(3, 3, '3D全景拍照', '6.11MB', '1.0.0', NULL, '3D全景拍照，让你享受360°全景美图！<br/>3D全景拍照是一款让你的Android 设备能够拍摄出360°全景图片的拍照软件。移动你的Mobile Phone，连续扑捉心动的镜头，点击完成，软件自动为您处理成全景照片。如果你厌倦了传统单一的相片模式，如果你玩腻了美图秀秀的相框模式，不如试试全新3D效果的全景拍照吧！<br/><br/>软件功能：<br/>1.360度3D全景效果;<br/>2.自动合成照片;<br/>3.自动拍照;<br/>4.自动对焦;<br/>5.照片存到SD卡;<br/>6.高清模式。', 'http://cdn.market.hiapk.com/data/upload/2013/01_11/14/com.topappcamp.camerafull_142723.apk', '350.000+'),
(4, 4, '毛毛世界', '4.21MB', '1.68', NULL, '就当大家都沉浸在迎接新年的喜悦之中，毛毛世界却遭遇了突如其来的恶魔侵扰，为了保卫毛毛们的美好家园，天使与恶魔之间的保卫战随即拉开。还毛毛们一个幸福家园迎接新年，让所有恶魔都化作灰烬吧！<br/><br/>游戏方法：<br/>点击交换相邻毛毛，形成水平或垂直的三个或更多的毛毛，帮助天使消灭侵入家园的恶魔，让它们烧成灰烬；当更多毛毛相遇时，可触发连锁反应形成级联，同时可获得奖励积分。赶快行动起来帮助天使对抗恶魔吧！', 'http://cdn.market.hiapk.com/data/upload/2013/01_21/11/com.topappcamp.worldofmaomao_110654.apk', '170.000+'),
(6, 6, '匹格猪', '4.98MB', '1.0', NULL, '贪吃的匹格猪怆然闯入了猴子看守的水果园，为了吃掉所有水果，匹格猪和猴子展开了一场斗智斗勇的抢夺战。猴子也拿出自己的看家本领守护果园，原地打圈，固定路线移动，缓慢靠近的防守让匹格猪只能不停躲闪，最后匹格猪能吃掉所有水果嚒？来自秘鲁的休闲小游戏必定让你感受非一般的重力体验。', 'http://www.stomato.com.cn/uploads/pig_goapk_1.0.0.apk', '140.000+'),
(5, 5, '咔布咔', '43.6MB', '1.0.5', NULL, '在绮丽幻化的星球，咔布咔拥有各式超乎想象的能力，凭借智慧冲击一个又一个设计巧妙的关卡，解决各种不可能的障碍，收集足够的手纸卷完成关卡，赢得和大怪兽决斗的机会！来自白俄罗斯超好玩的益智类动作游戏，让你爱上这种“虐”智商的感觉！', 'http://www.stomato.com.cn/uploads/wimp-stomato_1.0.5.apk', '180.000+');

-- --------------------------------------------------------

--
-- 表的结构 `t_payment`
--

CREATE TABLE IF NOT EXISTS `t_payment` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_remittance`
--

CREATE TABLE IF NOT EXISTS `t_remittance` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `t_remittance`
--

INSERT INTO `t_remittance` (`id`, `uid`, `money`, `bank_account`, `bank_name`, `bank_card`, `status`, `remark`, `remittance_time`, `create_time`, `last_update_time`) VALUES
(1, 20, 10, '覃建栋', '华夏银行', '425202520014225852', 0, NULL, NULL, '2013-06-02 02:41:37', '2013-06-02 02:41:37');

-- --------------------------------------------------------

--
-- 表的结构 `t_report_daily`
--

CREATE TABLE IF NOT EXISTS `t_report_daily` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `t_report_daily`
--

INSERT INTO `t_report_daily` (`id`, `idate`, `uid`, `app_id`, `kpi_code`, `kpi_value`, `itime`) VALUES
(1, '2013-06-02', '20', '305', 'sm_total_users', 20, '2013-06-02 08:47:25'),
(2, '2013-06-02', '20', '305', 'sm_total_users', 5, '2013-06-02 08:47:25'),
(3, '2013-06-02', '20', '305', 'sm_push_times', 1, '2013-06-02 08:47:25'),
(4, '2013-06-02', '20', '305', 'sm_display_times', 7, '2013-06-02 08:47:25'),
(5, '2013-06-02', '20', '305', 'sm_new_users', 6, '2013-06-02 08:47:25'),
(6, '2013-06-02', '20', '305', 'sm_online_users', 44, '2013-06-02 08:47:25'),
(7, '2013-06-02', '20', '305', 'sm_conversion_rate', 30, '2013-06-02 08:47:25'),
(8, '2013-06-02', '20', '305', 'sm_fill_rate', 20, '2013-06-02 08:47:25'),
(9, '2013-06-02', '20', '305', 'sm_money_pushes', 30, '2013-06-02 08:47:25'),
(10, '2013-06-02', '20', '305', 'sm_money_advertising', 70, '2013-06-02 08:47:25'),
(11, '2013-06-02', '20', '306', 'sm_total_users', 20, '2013-06-02 09:01:26'),
(12, '2013-06-02', '20', '306', 'sm_push_times', 110, '2013-06-02 09:01:26'),
(13, '2013-06-02', '20', '306', 'sm_display_times', 650, '2013-06-02 09:01:26'),
(14, '2013-06-02', '20', '306', 'sm_new_users', 440, '2013-06-02 09:01:26'),
(15, '2013-06-02', '20', '306', 'sm_online_users', 320, '2013-06-02 09:01:26'),
(16, '2013-06-02', '20', '306', 'sm_conversion_rate', 20, '2013-06-02 09:01:26'),
(17, '2013-06-02', '20', '306', 'sm_fill_rate', 70, '2013-06-02 09:01:26'),
(18, '2013-06-02', '20', '306', 'sm_money_pushes', 234.9, '2013-06-02 09:01:26'),
(19, '2013-06-02', '20', '306', 'sm_money_advertising', 220, '2013-06-02 09:01:26'),
(20, '2013-06-02', '20', '306', 'sm_total_users', 20, '2013-06-02 09:07:29'),
(21, '2013-06-02', '20', '306', 'sm_push_times', 110, '2013-06-02 09:07:29'),
(22, '2013-06-02', '20', '306', 'sm_display_times', 650, '2013-06-02 09:07:29'),
(23, '2013-06-02', '20', '306', 'sm_new_users', 440, '2013-06-02 09:07:29'),
(24, '2013-06-02', '20', '306', 'sm_online_users', 320, '2013-06-02 09:07:29'),
(25, '2013-06-02', '20', '306', 'sm_conversion_rate', 320, '2013-06-02 09:07:29'),
(26, '2013-06-02', '20', '306', 'sm_fill_rate', 10, '2013-06-02 09:07:29'),
(27, '2013-06-02', '20', '306', 'sm_money_pushes', 56.9, '2013-06-02 09:07:29'),
(28, '2013-06-02', '20', '306', 'sm_money_advertising', 35, '2013-06-02 09:07:29');

-- --------------------------------------------------------

--
-- 表的结构 `t_report_hourly`
--

CREATE TABLE IF NOT EXISTS `t_report_hourly` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_report_monthly`
--

CREATE TABLE IF NOT EXISTS `t_report_monthly` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `t_report_monthly`
--

INSERT INTO `t_report_monthly` (`id`, `idate`, `uid`, `app_id`, `kpi_code`, `kpi_value`, `itime`) VALUES
(1, '2013-06-02', 20, 306, 'sm_total_users', 20, '2013-06-02 09:08:36'),
(2, '2013-06-02', 20, 306, 'sm_push_times', 110, '2013-06-02 09:08:36'),
(3, '2013-06-02', 20, 306, 'sm_display_times', 650, '2013-06-02 09:08:36'),
(4, '2013-06-02', 20, 306, 'sm_new_users', 440, '2013-06-02 09:08:36'),
(5, '2013-06-02', 20, 306, 'sm_online_users', 320, '2013-06-02 09:08:36'),
(6, '2013-06-02', 20, 306, 'sm_conversion_rate', 20, '2013-06-02 09:08:36'),
(7, '2013-06-02', 20, 306, 'sm_fill_rate', 70, '2013-06-02 09:08:36'),
(8, '2013-06-02', 20, 306, 'sm_money_pushes', 234.9, '2013-06-02 09:08:36'),
(9, '2013-06-02', 20, 306, 'sm_money_advertising', 220, '2013-06-02 09:08:36');

-- --------------------------------------------------------

--
-- 表的结构 `t_reset_pwd`
--

CREATE TABLE IF NOT EXISTS `t_reset_pwd` (
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `token` varchar(80) COLLATE utf8_bin NOT NULL,
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` bit(1) NOT NULL COMMENT '0 is enable',
  PRIMARY KEY (`email`),
  UNIQUE KEY `id_token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `t_transfer_history`
--

CREATE TABLE IF NOT EXISTS `t_transfer_history` (
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

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`uid`, `account_name`, `account_pwd`, `email`, `type`, `company`, `contact_name`, `contact_tel`, `qq`, `website`, `createtime`, `login_token`, `login_token_time`) VALUES
(19, 'demo01', '4297F44B13955235245B2497399D7A93', '1243@qq.com', 1, '', 'hello', '123123123', '1312312', 'www.baidu.com', '2013-05-28 16:51:03', NULL, NULL),
(20, 'jiandong', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandong@powerallnetworks.com', 1, 'powerall', '覃建栋', '13631661621', '63559854', 'http://localhost:8081/', '2013-05-29 22:42:25', '83cb774b0665454a948dfa513b672304', '2013-06-02 10:30:06'),
(18, 'kewiyi', '4297F44B13955235245B2497399D7A93', '123@qq.com', 1, '', NULL, NULL, NULL, NULL, '2013-05-28 13:25:56', '74cc6915618945c8ab7f0bf7f6961951', '2013-05-28 17:18:47');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_account`
--

CREATE TABLE IF NOT EXISTS `t_user_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户账单编号',
  `uid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户',
  `balance` double NOT NULL COMMENT '余额',
  `last_update_time` datetime NOT NULL COMMENT '最后更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `t_user_account`
--

INSERT INTO `t_user_account` (`id`, `uid`, `balance`, `last_update_time`) VALUES
(20, '20', 400, '2013-06-02 10:41:21');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_imei`
--

CREATE TABLE IF NOT EXISTS `t_user_imei` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
