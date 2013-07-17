-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 07 月 18 日 01:56
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `adplatform`
--

DELIMITER $$
--
-- 存储过程
--
DROP PROCEDURE IF EXISTS `proc_confirm_earnings`$$
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
    END$$

DROP PROCEDURE IF EXISTS `proc_update_data_adjusted`$$
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
END$$

DROP PROCEDURE IF EXISTS `proc_update_earnings`$$
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
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `t_ad_channel`
--

DROP TABLE IF EXISTS `t_ad_channel`;
CREATE TABLE IF NOT EXISTS `t_ad_channel` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `t_ad_channel`
--

INSERT INTO `t_ad_channel` (`id`, `channel_name`, `contact_tel`, `qq`, `contact_name`, `description`, `enable`, `create_time`, `is_del`) VALUES
(1, 'test', '13631661621', '63559854', '覃建栋', 'test', 1, '2013-07-11 10:30:16', 1),
(2, 'Google广告', '13631661621', '63559854', '覃建栋', 'Google广告', 1, '2013-07-11 10:33:03', 0),
(3, 'test1', '13631661621', '63559854', '覃建栋', 'test', 1, '2013-07-11 11:28:12', 3),
(4, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:35', 4),
(5, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:36', 5),
(6, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:38', 6),
(7, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:39', 7),
(8, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:40', 8),
(9, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:42', 9),
(10, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:43', 10),
(11, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:44', 11),
(12, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:45', 12),
(13, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:46', 13),
(14, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:47', 14),
(15, 'test', 'test', 'test', 'test', 'test', 1, '2013-07-11 13:13:48', 15),
(16, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:50', 16),
(17, '百度广告渠道', '555577865', '44456666', '百度', '百度广告渠道', 1, '2013-07-11 14:03:50', 0),
(18, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:50', 18),
(19, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:50', 19),
(20, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:50', 20),
(21, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:51', 21),
(22, 'test', '13631661621', '63559854', 'test', 'test', 1, '2013-07-11 14:03:51', 22),
(23, '渠道名称', '13631661621', '63559854', '覃建栋', 'Google广告', 1, '2013-07-14 23:43:04', 23),
(24, 'test', '13631661621', '63559854', 'test', 'Google广告', 1, '2013-07-14 23:46:04', 24),
(25, 'test', '13631661621', '63559854', 'test', 'Google广告', 1, '2013-07-14 23:47:40', 25),
(26, 'TEST', '13631661621', '', 'test', '', 0, '2013-07-17 07:25:57', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_ad_resource`
--

DROP TABLE IF EXISTS `t_ad_resource`;
CREATE TABLE IF NOT EXISTS `t_ad_resource` (
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
  `recom` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_package` (`ad_package`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `t_ad_resource`
--

INSERT INTO `t_ad_resource` (`id`, `channel_id`, `ad_name`, `ad_title`, `ad_icon`, `ad_banner`, `desktop_icon`, `ad_images`, `ad_package`, `file_size`, `version`, `support_platform`, `app_type_id`, `charge_type`, `price`, `clearing_form`, `downloads`, `recommens`, `ad_rating`, `description`, `modify_date`, `create_date`, `apk_url`, `start_time`, `end_time`, `status`, `is_del`, `recom`) VALUES
(1, 2, '愤怒的小鸟', '愤怒的小鸟', '', '', '', '', 'com.app', 34, '2.1', 'andriod4.1', 0, 0, 2000, 'CPA', NULL, NULL, NULL, '资源描述', '2013-07-18 07:53:03', '2013-07-14 23:13:34', NULL, '2013-07-14 15:13:34', '2014-03-14 23:13:34', 1, 0, 0),
(2, 2, '资源名称', '投放标题', '', '', '', '', '应用包名', 12, '1.2', 'andriod4.1', 5, 0, 200, 'CPA', NULL, NULL, NULL, '资源描述', '2013-07-18 07:53:11', '2013-07-14 23:23:35', NULL, '2013-07-14 15:23:35', '2014-03-14 23:23:35', 1, 0, 0),
(4, 2, '愤怒的小鸟', '投放标题', '/files/upload/com.app.ap-20130714/icon/20130715145544.jpg', '/files/upload/com.app.ap-20130714/icon/20130715.jpg', '/files/upload/com.app.ap-20130714/icon/20130714.jpg', '/files/upload/com.app.ap-20130714/images/20130715145731a.jpg,/files/upload/com.app.ap-20130714/images/20130715145731b.jpg,/files/upload/com.app.ap-20130714/images/20130715145731c.jpg,/files/upload/com.app.ap-20130714/images/20130715145731d.jpg', 'com.app.ap', 12, '1.2', 'andriod4.1', 0, 1, 200, 'CPS', NULL, NULL, NULL, '', '2013-07-18 07:50:31', '2013-07-14 23:28:07', NULL, '2013-07-14 15:28:07', '2014-03-14 23:28:07', 1, 0, 0),
(5, 2, '愤怒的小鸟2', '愤怒的小鸟2', '', '', '', '', 'com.app.ap.2', 12, '2.1', 'andriod4.1', 3, 1, 1000, 'CPA', NULL, NULL, NULL, '', '2013-07-18 07:50:41', '2013-07-15 15:32:44', NULL, '2013-07-15 07:32:44', '2014-03-15 15:32:44', 0, 1, 0),
(7, 17, '计算器美', '投放标题', '', '', '', '', 'com.app.ws', 12, '2.1', 'andriod4.1', 6, 0, 0, 'CPA', NULL, NULL, NULL, '', '2013-07-18 07:50:29', '2013-07-18 07:31:29', NULL, '2013-07-17 23:31:29', '2014-03-18 07:31:29', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_ad_rssource`
--

DROP TABLE IF EXISTS `t_ad_rssource`;
CREATE TABLE IF NOT EXISTS `t_ad_rssource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `ad_name` varchar(255) NOT NULL COMMENT '广告应用名称',
  `ad_title` varchar(255) DEFAULT NULL COMMENT '广告语文字',
  `ad_icon` varchar(255) DEFAULT NULL COMMENT '广告图标',
  `ad_banner` varchar(255) DEFAULT NULL,
  `desktop_icon` varchar(255) DEFAULT NULL COMMENT '桌面快捷方式图片',
  `ad_images` varchar(500) DEFAULT NULL COMMENT '应用图片组(a.jpg,c.jpg,b.jpg)',
  `app_package` varchar(255) DEFAULT NULL COMMENT '应用包名',
  `file_size` int(11) DEFAULT NULL COMMENT '安装包大小(KB)',
  `version` varchar(255) DEFAULT NULL COMMENT '应用版本',
  `support_platform` varchar(255) DEFAULT NULL COMMENT '应用支持平台要求',
  `app_type_id` int(8) DEFAULT '1' COMMENT ' 广告类型0:热门,1:应用,2:游戏',
  `charge_type` int(8) DEFAULT NULL COMMENT '收费类型',
  `price` double DEFAULT NULL COMMENT '单价',
  `clearing_form` varchar(10) DEFAULT NULL COMMENT '结算方式 ,CPA/CPS',
  `downloads` int(11) DEFAULT NULL,
  `recommens` int(11) DEFAULT NULL COMMENT '推荐次数',
  `app_rating` int(11) DEFAULT NULL COMMENT '应用t推荐等级',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `modify_date` datetime DEFAULT NULL COMMENT '广告修时间',
  `create_date` datetime NOT NULL,
  `apk_url` varchar(255) DEFAULT NULL COMMENT 'apk 下载地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(8) DEFAULT '0' COMMENT '0,下架，1上架',
  `is_del` tinyint(4) DEFAULT NULL COMMENT '标记删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_package` (`app_package`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `t_ad_rssource`
--

INSERT INTO `t_ad_rssource` (`id`, `channel_id`, `ad_name`, `ad_title`, `ad_icon`, `ad_banner`, `desktop_icon`, `ad_images`, `app_package`, `file_size`, `version`, `support_platform`, `app_type_id`, `charge_type`, `price`, `clearing_form`, `downloads`, `recommens`, `app_rating`, `description`, `modify_date`, `create_date`, `apk_url`, `start_time`, `end_time`, `status`, `is_del`) VALUES
(1, 2, '愤怒的小鸟', '愤怒的小鸟', '', '', '', '', 'com.app', 34, '2.1', 'andriod4.1', 0, 0, 2000, 'CPA', NULL, NULL, NULL, '愤怒的小鸟', NULL, '2013-07-14 23:13:34', NULL, '2013-07-14 15:13:34', '2014-03-14 23:13:34', 1, 1),
(2, 2, '资源名称', '投放标题', '', '', '', '', '应用包名', 12, '1.2', 'andriod4.1', 5, 0, 200, 'CPA', NULL, NULL, NULL, '资源描述', NULL, '2013-07-14 23:23:35', NULL, '2013-07-14 15:23:35', '2014-03-14 23:23:35', 1, 1),
(4, 2, '愤怒的小鸟', '投放标题', '/files/upload/com.app.ap-20130714/icon/20130714.jpg', '/files/upload/com.app.ap-20130714/icon/20130714.jpg', '/files/upload/com.app.ap-20130714/icon/20130714.jpg', '/files/upload/com.app.ap-20130714/images/20130714232807a.jpg', 'com.app.ap', 12, '1.2', 'andriod4.1', 6, 0, 200, 'CPA', NULL, NULL, NULL, '资源描述', NULL, '2013-07-14 23:28:07', NULL, '2013-07-14 15:28:07', '2014-03-14 23:28:07', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_apps`
--

DROP TABLE IF EXISTS `t_apps`;
CREATE TABLE IF NOT EXISTS `t_apps` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `t_apps`
--

INSERT INTO `t_apps` (`id`, `app_key`, `uid`, `name`, `pkg`, `icon`, `status`, `is_del`, `last_update_time`, `create_time`, `allow_push`, `allow_trustee`, `delay_push_interval`) VALUES
(1, 'fd62421b5824f4af33887e79462b75bb', 23, '大白菜', 'com.skycall.oem', 'drawable-mdpi#icon.png', 1, 0, '2013-06-06 16:07:20', '2013-06-05 17:58:17', '1', '1', 0),
(2, '9a3b327c837794a67e854a2c24d32b46', 23, '小青菜', 'com.elevenbitstudios.FunkySmugglers', 'drawable-xxhdpi#icon.png', 1, 0, '2013-06-08 01:37:36', '2013-06-05 18:04:03', '1', '1', 1),
(3, '678f1cfeaf2cfe14207d90c998acc70b', 23, '红萝卜', 'com.appspot.swisscodemonkeys.camerafx', 'drawable-ldpi#ic_launcher_camera2.png', 1, 1, '2013-06-06 16:07:10', '2013-06-07 00:06:15', '1', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_app_type`
--

DROP TABLE IF EXISTS `t_app_type`;
CREATE TABLE IF NOT EXISTS `t_app_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '应用类型名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent` int(11) DEFAULT NULL COMMENT '上一级分类',
  `visible` tinyint(4) DEFAULT NULL COMMENT '是否可见，1=可见，0=隐藏 ',
  `order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_app_type`
--

INSERT INTO `t_app_type` (`id`, `type_name`, `description`, `parent`, `visible`, `order_no`) VALUES
(3, '游戏', '游侠分类', 0, 1, 0),
(4, '应用', '应用分类', 0, 1, 1),
(5, '过山车', '', 3, 1, 1),
(6, '超级射击', '', 3, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `t_channel`
--

DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE IF NOT EXISTS `t_channel` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `t_channel`
--

INSERT INTO `t_channel` (`id`, `name`, `description`, `create_date`, `status`) VALUES
(1, '测试1', '测试测试测试1', '2013-05-21 00:38:41', 0),
(2, '我靠', 'ciao', '2013-05-26 23:10:37', 0),
(3, '测试2', '测试首发发发', '2013-05-21 01:42:45', 0),
(4, '测试3', 'sfasfalfa', '2013-05-21 01:43:59', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_channel_user`
--

DROP TABLE IF EXISTS `t_channel_user`;
CREATE TABLE IF NOT EXISTS `t_channel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` int(8) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_no` varchar(255) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型,0：平板，1：移动，2：联通，3：电信',
  PRIMARY KEY (`id`),
  KEY `T_CHANNEL_USER_LAST_UPDATE_TIME_IDX` (`last_update_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `t_channel_user`
--

INSERT INTO `t_channel_user` (`id`, `create_date`, `last_update_time`, `channel_id`, `channel_no`, `status`) VALUES
(17, '2013-05-29 21:51:03', 20130530, 0, 'com.aa.bb', 0),
(18, '2013-05-29 23:35:10', 20130530, 0, 'com.aa.cc', 1),
(19, '2013-05-29 23:35:57', 20130530, 0, 'com.aa.bb', 1),
(20, '2013-05-29 23:36:04', 20130530, 0, 'com.aa.bb', 1),
(21, '2013-05-29 23:36:13', 20130530, 0, 'com.aa.cc', 1),
(22, '2013-05-29 23:36:22', 20130530, 0, 'com.aa.cc', 1),
(23, '2013-05-29 23:36:32', 20130530, 0, 'com.aa.bb', 1),
(24, '2013-05-29 23:39:37', 20130530, 0, 'com.aa.dd', 2),
(25, '2013-05-29 23:39:49', 20130530, 0, 'com.aa.dd', 3),
(26, '2013-05-29 23:40:01', 20130530, 0, 'com.aa.bb', 3);

-- --------------------------------------------------------

--
-- 表的结构 `t_company`
--

DROP TABLE IF EXISTS `t_company`;
CREATE TABLE IF NOT EXISTS `t_company` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '厂商名称',
  `description` varchar(250) DEFAULT NULL COMMENT '厂商描述',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '0' COMMENT '0：有效， 1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `t_company`
--

INSERT INTO `t_company` (`id`, `name`, `description`, `create_date`, `status`) VALUES
(1, '测试1', '', '2013-05-21 00:38:41', 1),
(2, '我靠', 'ciao', '2013-05-26 23:10:37', 1),
(3, '测试2', '测试首发发发', '2013-05-21 01:42:45', 1),
(4, '测试3', 'sfasfalfa', '2013-05-21 01:43:59', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_config`
--

DROP TABLE IF EXISTS `t_config`;
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

DROP TABLE IF EXISTS `t_credentials`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `t_credentials`
--

INSERT INTO `t_credentials` (`id`, `uid`, `credentials_type`, `credentials_no`, `credentials_photo1`, `credentials_photo2`, `bank_name`, `bank_card`, `bank_account`, `bank_address`, `last_update_time`, `create_time`) VALUES
(1, 20, 1, '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 04:05:25', '2013-05-29 14:48:23'),
(2, 18, 1, '123456789', '', '', '中国工商银行', '123567', 'aaa', 'com', '2013-06-02 07:25:40', '2013-06-02 07:25:40'),
(3, 23, 1, '123456789', '1_123456789_photo1.png', '1_123456789_photo2.jpeg', '中国工商银行', '622655555555', '张三', '深圳', '2013-06-06 15:05:45', '2013-06-06 15:05:45'),
(4, 27, 2, '452124199012230077', '2_452124199012230077_photo1.jpeg', '', NULL, NULL, NULL, NULL, '2013-06-08 05:21:28', '2013-06-08 05:21:28'),
(5, 28, 2, '', '2__photo1.null', '', NULL, NULL, NULL, NULL, '2013-06-08 05:23:58', '2013-06-08 05:23:58'),
(6, 22, 1, '452124199012230077', '1_452124199012230077_photo1.jpeg', '1_452124199012230077_photo2.jpeg', '中国工商银行', '425202520014225852', '覃建栋', '深圳市南山区振业国际大厦10楼1001', '2013-07-07 02:00:12', '2013-07-07 02:00:12'),
(7, 33, 1, '452124199012230077', '1_452124199012230077_photo1.jpeg', '1_452124199012230077_photo2.jpeg', '中国工商银行', '425202520014225852', '覃建栋', '深圳市南山区常兴路统建楼3栋301(A)', '2013-07-12 05:39:38', '2013-07-12 05:39:38');

-- --------------------------------------------------------

--
-- 表的结构 `t_extra_applist`
--

DROP TABLE IF EXISTS `t_extra_applist`;
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
-- 表的结构 `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE IF NOT EXISTS `t_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(250) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `path` varchar(250) DEFAULT '' COMMENT '菜单路径',
  `parent` int(4) DEFAULT '0' COMMENT '父菜单',
  `visible` int(4) DEFAULT '1' COMMENT '是否可见：0-不可见，1-可见',
  `status` int(4) DEFAULT '0' COMMENT '是否有效 0-有效，1-无效',
  `order_no` varchar(50) DEFAULT '0' COMMENT '排序标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `t_menu`
--

INSERT INTO `t_menu` (`id`, `menuname`, `description`, `path`, `parent`, `visible`, `status`, `order_no`) VALUES
(1, '系统管理', NULL, '', 0, 1, 1, '1'),
(2, '新增用户', '', '/accounts/formpage.html', 1, 1, 1, '111'),
(3, '用户列表', NULL, '/accounts/listUser.html', 1, 1, 1, '112'),
(4, '新增角色', NULL, '/role/formpage.html', 1, 1, 1, '121'),
(5, '角色列表', NULL, '/role/listRole.html', 1, 1, 1, '122'),
(6, '新增菜单', NULL, '/menu/formpage.html', 1, 1, 1, '131'),
(7, '菜单列表', NULL, '/menu/listMenu.html', 1, 1, 1, '132'),
(8, '资源管理', NULL, '', 0, 1, 1, '2'),
(9, '资源录入', NULL, '/adResource/formpage.html', 8, 1, 1, '211'),
(10, '资源列表', NULL, '/adResource/adResourceList.html', 8, 1, 1, '212'),
(13, '查看权限', NULL, '/role/roleFormpage.html', 1, 0, 1, '124'),
(14, '设置角色权限', NULL, '/role/setRoleMenu.html', 1, 0, 1, '125'),
(15, '新增菜单', NULL, '/menu/formpage.html', 1, 0, 1, '133'),
(16, '查找菜单', NULL, '/menu/getMenu.html', 1, 0, 1, '134'),
(17, '修改菜单', NULL, '/menu/updateMenu.html', 1, 0, 1, '135'),
(18, '查找资源', NULL, '/adResource/getAdResource.html', 8, 0, 1, '213'),
(19, '展示资源', NULL, '/adResource/showAdResource.html', 8, 0, 1, '214'),
(21, '修改资源', NULL, '/adResource/updateAdResource.html', 8, 0, 1, '216'),
(22, '编辑用户', NULL, '/user/editUser.html', 1, 0, 1, '114'),
(23, '修改用户角色&状态', NULL, '/user/updateUserRoleAndStatus.html', 1, 0, 1, '115'),
(24, '重置密码', NULL, '/ajax/updateUser.html', 1, 0, 1, '116'),
(25, '检测用户名', NULL, '/hasUser.html', 1, 0, 1, '117'),
(26, '开发者应用', '', '', 0, 1, 1, '0'),
(27, '应用上传', '', '/apps/create.html', 26, 1, 1, '311'),
(28, '上传应用action', NULL, '/appInfo/addAppInfo.html', 26, 0, 1, '312'),
(29, '应用列表', '开发者个人应用列表', '/apps/', 26, 1, 1, '313'),
(30, '查询应用', NULL, '/appInfo/selectAppInfo.html', 26, 0, 1, '314'),
(31, '修改应用', NULL, '/appInfo/updateAppInfo.html', 26, 0, 1, '315'),
(32, '删除应用', NULL, '/appInfo/deleteAppInfo.html', 26, 0, 1, '316'),
(33, '应用列表', '所有开发者应用列表', '/appInfo/listAppInfoAll.html', 26, 1, 1, '313'),
(34, 'SDK报表', NULL, '', 0, 1, 1, '4'),
(35, '用户报表', NULL, '/report/userDayReport.html', 34, 0, 1, '411'),
(36, '应用安装上报报表', NULL, '/report/appInstallReport.html', 34, 0, 1, '412'),
(37, '报表列管理', NULL, '', 0, 0, 1, '5'),
(38, 'column列表', NULL, '/gridColumn/list.html', 37, 0, 1, '511'),
(39, 'add报表列', NULL, '/gridColumn/formAdd.html', 37, 0, 1, '512'),
(40, 'add报表列action', NULL, '/gridColumn/add.html', 37, 0, 1, '513'),
(41, 'update报表列', NULL, '/gridColumn/formUpdate.html', 37, 0, 1, '514'),
(42, 'update报表列action', NULL, '/gridColumn/update.html', 37, 0, 1, '515'),
(43, 'delete报表列', NULL, '/gridColumn/delete.html', 37, 0, 1, '516'),
(44, '渠道报表', NULL, '', 0, 0, 1, '6'),
(45, '渠道列表', NULL, '/user/listChannelUser.html', 1, 0, 1, '118'),
(46, '新增支付项目', '', '/amountItem/form.html', 1, 0, 1, '141'),
(47, '新增支付项目action', NULL, '/amountItem/add.html', 1, 0, 1, '142'),
(48, '支付项目列表', NULL, '/amountItem/list.html', 1, 0, 1, '143'),
(49, '修改支付项目', NULL, '/amountItem/updateForm.html', 1, 0, 1, '144'),
(50, '修改支付项目action', NULL, '/amountItem/update.html', 1, 0, 1, '145'),
(51, '删除支付项目', NULL, '/amountItem/delete.html', 1, 0, 1, '146'),
(52, '支付报表', '渠道本身的支付报表 —— 对外', '/report/channelAmountReport.html', 44, 0, 1, '611'),
(53, '支付报表', '所有渠道支付报表 —— 对内', '/report/allChannelAmountReport.html', 44, 0, 1, '612'),
(66, '财务中心', '', '', 0, 1, 1, '3'),
(67, '帐户管理', '', '', 0, 1, 1, '4'),
(68, '财务信息', '', '/financial/overview', 66, 1, 1, '0'),
(69, '财务明细', '', '/financial/accounts', 66, 1, 1, '0'),
(70, '申请汇款', '', '/financial/remittance', 66, 1, 1, '0'),
(71, '汇款记录', '', '/financial/remittance_history', 66, 1, 1, '0'),
(72, '收入报表', '', '', 0, 1, 1, '2'),
(73, '广告报表', '', '', 0, 1, 1, '1'),
(74, '小时统计', '', '', 72, 0, 1, '0'),
(75, '每日统计', '', '/report/incoming/daily', 72, 1, 1, '0'),
(76, '每月统计', '', '/report/incoming/monthly', 72, 1, 1, '0'),
(77, '广告推送', '', '/report/advert/pushes', 73, 1, 1, '0'),
(78, '应用内广告', '', '/report/advert/advertising', 73, 1, 1, '0'),
(79, '个人资料', '', '/accounts/overview', 67, 1, 1, '0'),
(80, '修改Email', '', '/accounts/change_email', 67, 1, 1, '0'),
(81, '修改资料', '', '/accounts/change_profile', 67, 1, 1, '0'),
(82, '修改密码', '', '/accounts/change_pwd', 67, 1, 1, '0'),
(83, '用户渠道', '', '', 0, 1, 1, '0'),
(84, '添加用户渠道', '', '/userchannel/formpage.html', 83, 1, 1, '0'),
(85, '用户渠道列表', '', '/userchannel/userChannelList.html', 83, 1, 1, '0'),
(86, '添加厂商', '', '/company/formpage.html', 83, 1, 1, '0'),
(87, '厂商列表', '', '/company/companyList.html', 83, 1, 1, '0'),
(88, '用户审核', '', '', 0, 1, 1, '0'),
(89, '用户注册资料列表', '', '/accounts/userReview.html', 88, 1, 1, '0'),
(90, '广告渠道管理', '', '', 0, 1, 1, '0'),
(91, '添加广告渠道', '', '/adchannel/formpage.html', 90, 1, 1, '0'),
(92, '修改渠道', '', '', 90, 0, 1, '0'),
(93, '渠道列表', '', '/adchannel/adChannelList.html', 90, 1, 1, '0'),
(94, '用户审核列表', '', '/accounts/userReview.html', 88, 1, 0, '0'),
(95, '增加应用分类', '', '/apps/formpage.html', 1, 1, 1, '8'),
(96, '应用分类列表', '', '/apps/appTypeList.html', 1, 1, 1, '7'),
(97, '回收站', '', '/adResource/listRecycle.html', 8, 1, 1, '3');

-- --------------------------------------------------------

--
-- 表的结构 `t_payment`
--

DROP TABLE IF EXISTS `t_payment`;
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
-- 表的结构 `t_push_test`
--

DROP TABLE IF EXISTS `t_push_test`;
CREATE TABLE IF NOT EXISTS `t_push_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app_key` varchar(32) NOT NULL,
  `test_key` varchar(32) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_key` (`app_key`) USING BTREE,
  KEY `app_key_uid` (`app_key`,`uid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `t_push_test`
--

INSERT INTO `t_push_test` (`id`, `uid`, `app_key`, `test_key`, `description`, `last_update_time`) VALUES
(3, 23, '9a3b327c837794a67e854a2c24d32b46', '   test ', 'test key', '2013-06-08 10:00:11'),
(4, 23, 'fd62421b5824f4af33887e79462b75bb', 'test', 'test', '2013-06-08 10:00:44');

-- --------------------------------------------------------

--
-- 表的结构 `t_remittance`
--

DROP TABLE IF EXISTS `t_remittance`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `t_remittance`
--

INSERT INTO `t_remittance` (`id`, `uid`, `money`, `bank_account`, `bank_name`, `bank_card`, `status`, `remark`, `remittance_time`, `create_time`, `last_update_time`) VALUES
(1, 20, 10, '覃建栋', '华夏银行', '425202520014225852', 0, NULL, NULL, '2013-06-02 02:41:37', '2013-06-02 02:41:37'),
(2, 18, 12, 'aaa', '中国工商银行', '123567', 0, NULL, NULL, '2013-06-02 07:26:12', '2013-06-02 07:26:12'),
(3, 20, 12, '覃建栋', '华夏银行', '425202520014225852', 0, NULL, NULL, '2013-06-02 07:35:20', '2013-06-02 07:35:20'),
(4, 20, 100, '覃建栋', '华夏银行', '425202520014225852', 0, NULL, NULL, '2013-07-02 05:28:44', '2013-07-02 05:28:44');

-- --------------------------------------------------------

--
-- 表的结构 `t_report_daily`
--

DROP TABLE IF EXISTS `t_report_daily`;
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

DROP TABLE IF EXISTS `t_report_hourly`;
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

DROP TABLE IF EXISTS `t_report_monthly`;
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

DROP TABLE IF EXISTS `t_reset_pwd`;
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
-- 表的结构 `t_role`
--

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(4) DEFAULT '0' COMMENT '状态：0-有效 1-无效',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `t_role`
--

INSERT INTO `t_role` (`id`, `role_name`, `status`, `create_date`) VALUES
(1, 'Admin', 1, '2013-04-07 03:18:49'),
(2, '运营管理', 1, '2013-04-07 06:27:39'),
(3, '个人开发者', 1, '2013-04-22 08:13:21'),
(4, '方案商', 1, '2013-05-14 06:01:05'),
(5, 'test', 1, '2013-07-07 14:18:50');

-- --------------------------------------------------------

--
-- 表的结构 `t_role_menu`
--

DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE IF NOT EXISTS `t_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色ID',
  `menu_id` int(4) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1789 ;

--
-- 转存表中的数据 `t_role_menu`
--

INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`) VALUES
(1565, 4, 66),
(1566, 4, 68),
(1567, 4, 69),
(1568, 4, 70),
(1569, 4, 71),
(1570, 4, 67),
(1571, 4, 79),
(1572, 4, 80),
(1573, 4, 81),
(1574, 4, 82),
(1575, 4, 72),
(1576, 4, 74),
(1577, 4, 75),
(1578, 4, 76),
(1579, 4, 73),
(1580, 4, 77),
(1581, 4, 78),
(1582, 4, 26),
(1583, 4, 27),
(1584, 4, 28),
(1585, 4, 29),
(1586, 4, 30),
(1587, 4, 31),
(1588, 4, 32),
(1614, 5, 66),
(1615, 5, 68),
(1616, 5, 69),
(1617, 5, 70),
(1618, 5, 71),
(1619, 5, 67),
(1620, 5, 79),
(1621, 5, 80),
(1622, 5, 81),
(1623, 5, 82),
(1624, 5, 72),
(1625, 5, 74),
(1626, 5, 75),
(1627, 5, 76),
(1628, 5, 73),
(1629, 5, 77),
(1630, 5, 78),
(1631, 5, 83),
(1632, 5, 84),
(1633, 5, 85),
(1634, 5, 86),
(1635, 5, 87),
(1636, 5, 88),
(1637, 5, 89),
(1638, 5, 90),
(1639, 5, 91),
(1640, 5, 92),
(1641, 5, 93),
(1642, 5, 1),
(1643, 5, 2),
(1644, 5, 3),
(1645, 5, 22),
(1646, 5, 23),
(1647, 5, 24),
(1648, 5, 25),
(1649, 5, 45),
(1650, 5, 4),
(1651, 5, 5),
(1652, 5, 13),
(1653, 5, 14),
(1654, 5, 6),
(1655, 5, 7),
(1656, 5, 15),
(1657, 5, 16),
(1658, 5, 17),
(1659, 5, 46),
(1660, 5, 47),
(1661, 5, 48),
(1662, 5, 49),
(1663, 5, 50),
(1664, 5, 51),
(1665, 5, 8),
(1666, 5, 9),
(1667, 5, 10),
(1668, 5, 18),
(1669, 5, 19),
(1670, 5, 21),
(1671, 5, 26),
(1672, 5, 27),
(1673, 5, 28),
(1674, 5, 29),
(1675, 5, 33),
(1676, 5, 30),
(1677, 5, 31),
(1678, 5, 32),
(1721, 3, 66),
(1722, 3, 68),
(1723, 3, 69),
(1724, 3, 70),
(1725, 3, 71),
(1726, 3, 67),
(1727, 3, 79),
(1728, 3, 80),
(1729, 3, 81),
(1730, 3, 82),
(1731, 3, 72),
(1732, 3, 75),
(1733, 3, 76),
(1734, 3, 73),
(1735, 3, 77),
(1736, 3, 78),
(1737, 3, 26),
(1738, 3, 27),
(1739, 3, 28),
(1740, 3, 29),
(1741, 3, 30),
(1742, 3, 31),
(1743, 3, 32),
(1744, 1, 1),
(1745, 1, 95),
(1746, 1, 96),
(1747, 1, 2),
(1748, 1, 3),
(1749, 1, 22),
(1750, 1, 23),
(1751, 1, 24),
(1752, 1, 25),
(1753, 1, 45),
(1754, 1, 4),
(1755, 1, 5),
(1756, 1, 13),
(1757, 1, 14),
(1758, 1, 6),
(1759, 1, 7),
(1760, 1, 15),
(1761, 1, 16),
(1762, 1, 17),
(1763, 1, 46),
(1764, 1, 47),
(1765, 1, 48),
(1766, 1, 49),
(1767, 1, 50),
(1768, 1, 51),
(1769, 2, 26),
(1770, 2, 33),
(1771, 2, 83),
(1772, 2, 84),
(1773, 2, 85),
(1774, 2, 86),
(1775, 2, 87),
(1776, 2, 88),
(1777, 2, 89),
(1778, 2, 90),
(1779, 2, 91),
(1780, 2, 92),
(1781, 2, 93),
(1782, 2, 8),
(1783, 2, 9),
(1784, 2, 10),
(1785, 2, 18),
(1786, 2, 19),
(1787, 2, 21),
(1788, 2, 97);

-- --------------------------------------------------------

--
-- 表的结构 `t_temp_apps`
--

DROP TABLE IF EXISTS `t_temp_apps`;
CREATE TABLE IF NOT EXISTS `t_temp_apps` (
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

--
-- 转存表中的数据 `t_temp_apps`
--

INSERT INTO `t_temp_apps` (`app_key`, `uid`, `name`, `pkg`, `status`, `create_time`, `last_update_time`) VALUES
('01880cff2ba30b0ee48b4ffd1f9d8c6f', 23, 'tomcat', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-04 16:21:47', '2013-06-04 08:21:47'),
('0bd0eb861a00e0b1f0885f2ee619cfa2', 23, 'tomcat', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-04 16:23:19', '2013-06-04 08:23:19'),
('25160fcc09db77c4eb7e5b8547aa7f20', 23, 'stand', 'com.skycall.oem', 0, '2013-06-04 16:51:20', '2013-06-04 08:51:20'),
('4be7f1078b965ca25a4c4824f0b84872', 23, 'tomcat', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-04 16:11:13', '2013-06-04 08:11:13'),
('516bf5a567d9cca38b266782b37f5116', 23, 'camera360', 'vStudio.Android.Camera360\r', 0, '2013-06-07 18:35:17', '2013-06-07 10:35:17'),
('6f13b74bb9482c5e56f748242eb15fe3', 23, 'hello', 'com.appspot.swisscodemonkeys.camerafx', 0, '2013-06-02 17:51:50', '2013-06-02 09:51:50'),
('84028c32bb095f6fa429ff3b0dbd8786', 23, 'oooooo', 'com.appspot.swisscodemonkeys.camerafx', 0, '2013-06-05 16:11:28', '2013-06-05 08:11:28'),
('9a3b327c837794a67e854a2c24d32b46', 23, '小青菜', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-05 18:04:00', '2013-06-05 10:04:00'),
('a16f60cc6e84d2af29b7ad4967ad66ee', 23, 'tomcat', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-04 16:11:30', '2013-06-04 08:11:30'),
('a4ff1b50c6404a8622de1d48724fcf9d', 23, '白啊', 'com.elevenbitstudios.FunkySmugglers', 0, '2013-06-04 19:21:22', '2013-06-04 11:21:22'),
('a52286f46d778b244a0ad5e785db8298', 23, 'camera360', 'vStudio.Android.Camera360\r', 0, '2013-06-07 18:37:13', '2013-06-07 10:37:13'),
('b525de412cdae3aa274fd32cb21084c4', 23, '大炮', 'com.skycall.oem', 0, '2013-06-05 16:10:45', '2013-06-05 08:10:45'),
('f525a2fd94e951419b057765de3871c4', 23, 'tomcat', 'com.skycall.oem', 0, '2013-06-04 16:35:31', '2013-06-04 08:35:31'),
('fd62421b5824f4af33887e79462b75bb', 23, '大白菜', 'com.skycall.oem', 0, '2013-06-05 17:58:12', '2013-06-05 09:58:12');

-- --------------------------------------------------------

--
-- 表的结构 `t_transfer_history`
--

DROP TABLE IF EXISTS `t_transfer_history`;
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

DROP TABLE IF EXISTS `t_user`;
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
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`uid`, `account_name`, `account_pwd`, `email`, `type`, `company`, `contact_name`, `contact_tel`, `qq`, `website`, `createtime`, `login_token`, `login_token_time`, `status`) VALUES
(22, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '144@qq.com', 1, '', '覃建栋', '13631661621', NULL, '', '2013-06-02 17:43:46', '162d5e92571d4763960385d30a0c1522', '2013-07-17 07:45:30', 1),
(33, 'dev001', 'e10adc3949ba59abbe56e057f20f883e', 'dev001@gmail.com', 3, NULL, 'dev001', '13631661621', '', NULL, '2013-07-08 00:13:23', '8bd8cd6b53a94e9799363ade53234d3f', '2013-07-15 18:31:52', 1),
(31, 'jd_test', '4297F44B13955235245B2497399D7A93', 'qinjiandong21010@gmail.com', 5, 'Powerall networks', '覃建栋', '13631661621', NULL, 'http://localhost:8081/', '2013-07-07 23:19:48', '4289c363fde745d388ec1aa9e4d12069', '2013-07-07 23:40:53', 1),
(32, 'yygl001', 'e10adc3949ba59abbe56e057f20f883e', 'yygl@gmail.com', 2, '', 'yygl', '13631661621', NULL, 'http://localhost:8080', '2013-07-08 00:12:45', '2b84d1daac8e4fa398d4cfad250642b4', '2013-07-18 06:50:32', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_account`
--

DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE IF NOT EXISTS `t_user_account` (
  `uid` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户',
  `balance` double NOT NULL COMMENT '余额',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新日期',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `t_user_account`
--

INSERT INTO `t_user_account` (`uid`, `balance`, `last_update_time`) VALUES
('20', 400, '2013-06-02 02:41:21'),
('23', 0, '2013-06-02 09:47:41'),
('24', 0, '2013-06-06 16:57:00'),
('25', 0, '2013-06-08 02:30:27'),
('26', 0, '2013-06-08 02:58:14'),
('27', 0, '2013-06-08 05:20:36'),
('28', 0, '2013-06-08 05:23:58'),
('30', 0, '2013-07-04 23:48:18'),
('31', 0, '2013-07-07 15:19:48'),
('32', 0, '2013-07-07 16:12:45'),
('33', 0, '2013-07-07 16:13:23');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_channel`
--

DROP TABLE IF EXISTS `t_user_channel`;
CREATE TABLE IF NOT EXISTS `t_user_channel` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `t_user_channel`
--

INSERT INTO `t_user_channel` (`id`, `company_id`, `company_name`, `channel_no`, `description`, `create_date`, `last_update_time`, `status`) VALUES
(31, 4, '测试3', '234234', '渠道描述', '2013-07-12 13:34:53', '2013-07-17 06:57:19', 1),
(33, 1, '测试1', '234234', 'test', '2013-07-14 23:56:17', '2013-07-17 06:57:29', 0),
(34, 1, '测试1', '99685', 'Google广告', '2013-07-15 00:01:31', '2013-07-16 07:46:57', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_imei`
--

DROP TABLE IF EXISTS `t_user_imei`;
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
