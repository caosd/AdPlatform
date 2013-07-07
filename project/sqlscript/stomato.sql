-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 07 月 07 日 18:47
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

DELIMITER $$
--
-- 存储过程
--
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
-- 表的结构 `t_ad_rssource`
--

CREATE TABLE IF NOT EXISTS `t_ad_rssource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) NOT NULL COMMENT '广告应用名称',
  `ad_text` varchar(255) DEFAULT NULL COMMENT '广告语文字',
  `ad_icon` varchar(255) DEFAULT NULL COMMENT '广告图标',
  `ad_point` int(11) DEFAULT NULL COMMENT '广告积分',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `version` varchar(255) DEFAULT NULL COMMENT '应用版本',
  `file_size` int(11) DEFAULT NULL COMMENT '安装包大小(KB)',
  `ad_package` varchar(255) DEFAULT NULL COMMENT '应用包名',
  `ad_images` varchar(500) DEFAULT NULL COMMENT '应用图片组(a.jpg,c.jpg,b.jpg)',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '广告修时间',
  `itime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `ad_type` tinyint(4) DEFAULT '1' COMMENT ' 广告类型0:热门,1:应用,2:游戏',
  `apk_url` varchar(255) DEFAULT NULL COMMENT 'apk 下载地址',
  `start_time` int(8) DEFAULT '0' COMMENT '开始时间',
  `end_time` int(8) DEFAULT '0' COMMENT '结束时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '0,有效，1无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_package` (`ad_package`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- 转存表中的数据 `t_ad_rssource`
--

INSERT INTO `t_ad_rssource` (`id`, `ad_name`, `ad_text`, `ad_icon`, `ad_point`, `description`, `version`, `file_size`, `ad_package`, `ad_images`, `modify_date`, `itime`, `ad_type`, `apk_url`, `start_time`, `end_time`, `status`) VALUES
(65, '1号药店', '掌上医院全新更名为“1号药店”，更直观，更贴切。万款药品，保证正品，平民价格，送货上门，货到付款，远超实体药店的购物体验。', 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/icon/1231faf.png', 50, '掌上医院全新更名为“1号药店”，更直观，更贴切。万款药品，保证正品，平民价格，送货上门，货到付款，远超实体药店的购物体验。', '2.5.9', 2103, 'com.yiwang', 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/images/111.png,http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/images/222.png', '2013-04-10 02:06:04', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/1号药店.apk', 20130409, 20130511, 1),
(66, '淘宝', '淘宝客户端依托淘宝网强大的自身优势,整合旗下团购聚划算、品质保证淘宝商城、商品品类丰富的淘宝集市为一体,为用户提供更方便快捷流畅、随时随地进行移动购物的完美体验;', 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/icon/fa123a.png', 50, '淘宝客户端依托淘宝网强大的自身优势,整合旗下团购聚划算、品质保证淘宝商城、商品品类丰富的淘宝集市为一体,为用户提供更方便快捷流畅、随时随地进行移动购物的完美体验;', '3.5.2', 8058, 'com.taobao.taobao', 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/images/淘宝1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/images/淘宝2.jpg', '2013-04-10 02:06:29', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/淘宝.apk', 20130409, 20130511, 1),
(67, '航班管家', '最受欢迎的APP之一，国内唯一一款能显示实时余票量的航班查询手机软件！是您过年回家的抢票利器！', 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/icon/fas123a1f2.png', 60, '最受欢迎的APP之一，国内唯一一款能显示实时余票量的航班查询手机软件！是您过年回家的抢票利器！', '3.6.4', 3776, 'com.flightmanager.view', 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/images/航班管家1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/images/航班管家2.jpg', '2013-04-10 02:06:55', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/航班管家.apk', 20130408, 20130511, 1),
(68, '超强音乐播放器', '超强音乐播放器', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/icon/icon.png', 30, 'dj.android.soundbest', '2.0', 13163, 'dj.android.soundbest', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/images/1.png', '2013-04-10 01:44:55', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/SoundBestMusicPlayer.apk', 20130410, 20130503, 1),
(69, '计算器美化', '计算器美化', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/icon/icon.png', 50, 'lak.dj.calculator计算器美化', '3.0', 414, 'lak.dj.calculator', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/1.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/2.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/4.png', '2013-04-10 01:46:42', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/calculator.apk', 20130402, 20130509, 1),
(70, '掌上宝免费电话', '掌上宝电话最火手机电话软件，超强群聊功能（支持4人同聊）、来去电显示、智能拨号，通话清晰，接通率国内第一，安装就送免费通话，最高达60分钟', 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/icon/123a.png', 45, '    新注册用户：\r\n1、充50元到帐100元，充100元到帐580元话费，所有话费一次性到帐；\r\n2、充值满100元送 VIP黄金会员，并送“去电显示”功能。\r\n掌上宝电话最火手机电话软件，超强群聊功能（支持4人同聊）、来去电显示、智能拨号，通话清晰，接通率国内第一，安装就送免费通话，最高达60分钟', '6.1.3', 3781, 'com.dft.hb.app', 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/images/s掌上宝免费电话1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/images/掌上宝免费电话2.jpg', '2013-04-10 01:52:55', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/掌上宝免费电话.apk', 20130408, 20130511, 1),
(71, '截屏助手', '截屏助手', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/icon/lithiclogogrey.png', 50, 'dj.android.lithic', '3.0', 2672, 'dj.android.lithic', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/images/2.png', '2013-04-10 01:48:29', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/Lithic.apk', 20130404, 20130509, 1),
(72, '进程杀手', '进程杀手', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/icon/widgeticon.png', 60, 'dj.android.prokiller', '6.3', 201, 'dj.android.prokiller', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/1.png', '2013-04-10 01:51:18', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/TaskKiller.apk', 20130401, 20130509, 1),
(73, '多米音乐', '多米音乐android5.0.4带你进入一个全新的音乐世界。', 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/icon/aa.png', 70, '国内唯一不限流量音乐软件！】多米音乐android5.0.4带你进入一个全新的音乐世界。联通用户包流量畅听，扔掉数据线，再无流量压力！在这里，我们集合了众多音乐达人从上千万首歌曲中甄选出来的优质歌单，只为让你发现更多好听的音乐，安心享受音乐带来的快乐；多米音乐具有颠覆性的时尚界面，最智能的音乐搜索引擎，海量320Kps高品质音乐内容和前所未有的歌单分享体系，会让你很难相信这仅仅是一款音乐软件，来吧亲们，和多米一起体验新时代的音乐潮流！', '5.0.4', 4694, 'com.duomi.android', 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/images/sy_201304081750355836.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/images/sy_201304081750359320.jpg', '2013-04-10 01:51:54', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/com.duomi.android_175034.apk', 20130409, 20130511, 1),
(74, '私密相册', '私密相册', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/icon/icon.png', 30, 'dj.android.simiphoto', '3.0', 325, 'dj.android.simiphoto', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/images/1.png', '2013-04-10 01:52:12', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/PhotoVault.apk', 20130403, 20130509, 1),
(75, '文本编辑器', '文本编辑器', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/icon/icon.png', 30, 'dj.android.textEditor', '3.0', 604, 'dj.android.textEditor', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/images/1.png', '2013-04-10 01:53:51', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/TextEditor.apk', 20130402, 20130426, 1),
(76, '同花顺手机炒股票', '同花顺(300033)手机炒股股票软件是目前国内用户使用量最高、性能最稳定', 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/icon/201304091341251196.png', 50, '同花顺(300033)手机炒股股票软件是目前国内用户使用量最高、性能最稳定、支持券商最多并支持手机在线交易的随身免费炒股(财经/证券)软件。是拥有12年专业经验团队为您量身打造，1G光纤带宽高速行情，海量专业证券资讯，快速安全在线委托,投资理财好助手。\r\n同花顺手机炒股创新结合沪深Level-2数据，强势推出：MACD云参数选股、股价预警、股票池、决策密码、Level-2、选股模型，为您实时监控盘中大资金流向，让您随时掌握市场热点，轻松炒股决策，投资下单先人一步！ ', '6.9', 3850, 'com.hexin.plat.android', 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/images/sy_201303271050065684.png,http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/images/sy_201303271050075941.png', '2013-04-10 01:55:05', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/com.hexin.plat.android_134126.apk', 20130409, 20130511, 1),
(77, '文档扫描仪', '文档扫描仪', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/icon/icon.png', 30, 'dj.android.docscanner', '3.0', 6140, 'dj.android.docscanner', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/images/3.png', '2013-04-10 01:55:45', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/DocScanner.apk', 20130409, 20130425, 1),
(78, '压缩大师', '压缩大师', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/icon/icon.png', 50, 'dj.android.arsazpaid', '6.3', 6140, 'dj.android.arsazpaid', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/images/3.png', '2013-04-10 01:56:53', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/DocScanner.apk', 20130402, 20130510, 1),
(79, 'UC浏览器', 'UC浏览器是一款免费网页浏览软件,适用于以手机为主的各类手持移动终端。 ', 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/icon/201304101412088817.png', 65, 'UC浏览器是一款免费网页浏览软件,适用于以手机为主的各类手持移动终端。 ', '9.0.0', 9816, 'com.UCMobile', 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/images/sy_201304101414030687.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/images/sy_201304101414054827.jpg', '2013-04-10 02:01:34', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/com.UCMobile_141208.apk', 20130409, 20130430, 1),
(80, '彩虹便签', '彩虹便签', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/icon/icon.png', 30, 'lak.dj.note', '3.2.0', 743, 'lak.dj.note', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/images/2.png', '2013-04-10 01:57:58', '2013-07-06 08:08:35', 1, 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/ColorNote.apk', 20130401, 20130503, 1),
(81, '天天动听播放器', '好音质，天天动听！摇一摇，邂逅你的音乐知音！', 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/icon/201303291442030431.png', 55, '好音质，天天动听！摇一摇，邂逅你的音乐知音！\r\n\r\n【核心功能】\r\n1.全面支持APE、FLAC、MP3、AAC、M4A、WMA、 ALAC、WAV等各种音频格式\r\n2.专业的EQ均衡器设置\r\n3.专业的重低音、环绕声和环境音效设置\r\n4.一键红心收藏歌曲，如此简单\r\n5.独创横屏舞台，打造春晚舞台效果\r\n6.海量歌词，最新最准\r\n7.高清图片，不一样的视觉享受\r\n8.多彩皮肤，彰显你的自我个性\r\n9.桌面迷你歌词(和电脑上一样)\r\n10.功能贴心，睡眠模式、线控、甩歌方便实用', '5.1.0', 5640, 'com.sds.android.ttpod', 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/images/sy_201303290917499277.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/images/sy_201303290917508289.jpg', '2013-04-10 01:59:11', '2013-07-06 08:08:35', 0, 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/com.sds.android.ttpod_144205.apk', 20130408, 20130511, 1),
(82, '亮灯', '亮灯', 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/icon/icon.png', 60, '亮灯（Light Up）》是一个有趣和令人上瘾的益智游戏。鲍勃是一个有才华的男孩，谁爱使灯泡有趣的拼图。在实验室，生产间，储藏室或陈列室，Bob已经准备了共有240级别的灯泡游戏。他在等待着你的挑战！\r\n\r\n游戏操作：\r\n\r\n- 与电流流动相同的颜色匹配的灯泡连接。所有的颜色配对，并填满整个板来解决每一个难题。但是请注意，电流将打破，如果他们交叉或重叠！\r\n\r\n游戏特色\r\n\r\n- 精心设计的水平，简单，容易上瘾。\r\n\r\n- 美丽和辉煌的场景\r\n\r\n- 为整个家庭添加乐趣', '3.3', 20925, 'com.droidpower.flow', 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/images/1.png', '2013-04-15 04:44:18', '2013-07-06 08:08:35', 0, 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/n-Light_Up_v1_0-groupB.apk', 20130415, 20130607, 1),
(83, '外星粉碎机', '外星粉碎机', 'http://127.0.0.1:8888/ChannelReport/upload/com.twodstar.ac-20130415/icon/icon.png', 61, '', '', 14075, 'com.twodstar.ac', '', '2013-04-15 04:48:24', '2013-07-06 08:08:35', 0, 'http://127.0.0.1:8888/ChannelReport/upload/com.twodstar.ac-20130415/n-Alien_Crusher_Pro_v2-groupB.apk', 20130410, 20130510, 1),
(84, '相片组合', '相片组合', 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/icon/icon.png', 50, 'luxi.top.photogrid', '3.0', 2928, 'luxi.top.photogrid', 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/1.png,http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/2.png,http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/3.png', '2013-04-21 23:03:57', '2013-07-06 08:08:35', 2, 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/luxi.top.photogrid.apk', 20130422, 20130522, 1),
(85, '天草', '所发放', 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/icon/icon.png', 50, 'sfsa', '3.3.2', 8668, 'com.cc.saeweq', 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/images/1.png', '2013-04-28 01:24:16', '2013-07-06 08:08:35', 0, 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/com.cc.saeweq.apk', 20130428, 20130528, 1),
(86, '啊啊啊啊啊', '啊啊啊啊', 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/icon/icon.png', 100, '上的撒', '3.0', 17089, 'aaa.bbb.ccc', 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/images/1.png', '2013-05-21 02:19:07', '2013-07-06 08:08:35', 0, 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/aaa.bbb.ccc.apk', 20130514, 20130614, 1),
(87, 'afa', '司法法', 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/icon/20130521182002.png', 50, 'afafa', '3.0', 367, 'com.asdfa.d', 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/images/20130521182002a.png', '2013-05-21 02:20:16', '2013-07-06 08:08:35', 0, 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/com.asdfa.d.apk', 20130521, 20130621, 1);

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
(1, 'fd62421b5824f4af33887e79462b75bb', 23, '大白菜', 'com.skycall.oem', 'drawable-mdpi#icon.png', 1, 0, '2013-06-06 16:07:20', '2013-06-05 17:58:17', '0', '1', 0),
(2, '9a3b327c837794a67e854a2c24d32b46', 23, '小青菜', 'com.elevenbitstudios.FunkySmugglers', 'drawable-xxhdpi#icon.png', 1, 0, '2013-06-08 01:37:36', '2013-06-05 18:04:03', '0', '0', 1),
(3, '678f1cfeaf2cfe14207d90c998acc70b', 23, '红萝卜', 'com.appspot.swisscodemonkeys.camerafx', 'drawable-ldpi#ic_launcher_camera2.png', 1, 1, '2013-06-06 16:07:10', '2013-06-07 00:06:15', '0', '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_channel`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_credentials`
--

INSERT INTO `t_credentials` (`id`, `uid`, `credentials_type`, `credentials_no`, `credentials_photo1`, `credentials_photo2`, `bank_name`, `bank_card`, `bank_account`, `bank_address`, `last_update_time`, `create_time`) VALUES
(1, 20, 1, '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 04:05:25', '2013-05-29 14:48:23'),
(2, 18, 1, '123456789', '', '', '中国工商银行', '123567', 'aaa', 'com', '2013-06-02 07:25:40', '2013-06-02 07:25:40'),
(3, 23, 1, '123456789', '1_123456789_photo1.png', '1_123456789_photo2.jpeg', '中国工商银行', '622655555555', '张三', '深圳', '2013-06-06 15:05:45', '2013-06-06 15:05:45'),
(4, 27, 2, '452124199012230077', '2_452124199012230077_photo1.jpeg', '', NULL, NULL, NULL, NULL, '2013-06-08 05:21:28', '2013-06-08 05:21:28'),
(5, 28, 2, '', '2__photo1.null', '', NULL, NULL, NULL, NULL, '2013-06-08 05:23:58', '2013-06-08 05:23:58'),
(6, 22, 1, '452124199012230077', '1_452124199012230077_photo1.jpeg', '1_452124199012230077_photo2.jpeg', '中国工商银行', '425202520014225852', '覃建栋', '深圳市南山区振业国际大厦10楼1001', '2013-07-07 02:00:12', '2013-07-07 02:00:12');

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
-- 表的结构 `t_menu`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

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
(26, '开发者应用', NULL, '', 0, 1, 1, '3'),
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
(66, '财务中心', '', '', 0, 1, 1, '0'),
(67, '帐户管理', '', '', 0, 1, 1, '0'),
(68, '财务信息', '', '/financial/overview', 66, 1, 1, '0'),
(69, '财务明细', '', '/financial/accounts', 66, 1, 1, '0'),
(70, '申请汇款', '', '/financial/remittance', 66, 1, 1, '0'),
(71, '汇款记录', '', '/financial/remittance_history', 66, 1, 1, '0'),
(72, '收入报表', '', '', 0, 1, 1, '0'),
(73, '广告报表', '', '', 0, 1, 1, '0'),
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
(84, '添加用户渠道', '', '', 83, 1, 1, '0'),
(85, '用户渠道列表', '', '', 83, 1, 1, '0'),
(86, '添加厂商', '', '', 83, 1, 1, '0'),
(87, '厂商列表', '', '', 83, 1, 1, '0'),
(88, '用户审核', '', '', 0, 1, 1, '0'),
(89, '用户注册资料列表', '', '', 88, 1, 1, '0'),
(90, '渠道管理', '', '', 0, 1, 1, '0'),
(91, '添加渠道', '', '', 90, 1, 1, '0'),
(92, '修改渠道', '', '', 90, 0, 1, '0'),
(93, '渠道列表', '', '', 90, 1, 1, '0');

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
-- 表的结构 `t_push_test`
--

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
-- 表的结构 `t_role`
--

CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` int(4) DEFAULT '0' COMMENT '状态：0-有效 1-无效',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `t_role`
--

INSERT INTO `t_role` (`id`, `role_name`, `status`, `create_date`) VALUES
(1, 'Admin', 1, '2013-04-07 03:18:49'),
(2, '运营管理', 1, '2013-04-07 06:27:39'),
(4, '个人开发者', 1, '2013-04-22 08:13:21'),
(5, '方案商', 1, '2013-05-14 06:01:05'),
(6, 'test', 1, '2013-07-07 14:18:50');

-- --------------------------------------------------------

--
-- 表的结构 `t_role_menu`
--

CREATE TABLE IF NOT EXISTS `t_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色ID',
  `menu_id` int(4) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1721 ;

--
-- 转存表中的数据 `t_role_menu`
--

INSERT INTO `t_role_menu` (`id`, `role_id`, `menu_id`) VALUES
(1548, 4, 66),
(1549, 4, 68),
(1550, 4, 69),
(1551, 4, 70),
(1552, 4, 71),
(1553, 4, 67),
(1554, 4, 79),
(1555, 4, 80),
(1556, 4, 81),
(1557, 4, 82),
(1558, 4, 26),
(1559, 4, 27),
(1560, 4, 28),
(1561, 4, 29),
(1562, 4, 30),
(1563, 4, 31),
(1564, 4, 32),
(1565, 5, 66),
(1566, 5, 68),
(1567, 5, 69),
(1568, 5, 70),
(1569, 5, 71),
(1570, 5, 67),
(1571, 5, 79),
(1572, 5, 80),
(1573, 5, 81),
(1574, 5, 82),
(1575, 5, 72),
(1576, 5, 74),
(1577, 5, 75),
(1578, 5, 76),
(1579, 5, 73),
(1580, 5, 77),
(1581, 5, 78),
(1582, 5, 26),
(1583, 5, 27),
(1584, 5, 28),
(1585, 5, 29),
(1586, 5, 30),
(1587, 5, 31),
(1588, 5, 32),
(1614, 6, 66),
(1615, 6, 68),
(1616, 6, 69),
(1617, 6, 70),
(1618, 6, 71),
(1619, 6, 67),
(1620, 6, 79),
(1621, 6, 80),
(1622, 6, 81),
(1623, 6, 82),
(1624, 6, 72),
(1625, 6, 74),
(1626, 6, 75),
(1627, 6, 76),
(1628, 6, 73),
(1629, 6, 77),
(1630, 6, 78),
(1631, 6, 83),
(1632, 6, 84),
(1633, 6, 85),
(1634, 6, 86),
(1635, 6, 87),
(1636, 6, 88),
(1637, 6, 89),
(1638, 6, 90),
(1639, 6, 91),
(1640, 6, 92),
(1641, 6, 93),
(1642, 6, 1),
(1643, 6, 2),
(1644, 6, 3),
(1645, 6, 22),
(1646, 6, 23),
(1647, 6, 24),
(1648, 6, 25),
(1649, 6, 45),
(1650, 6, 4),
(1651, 6, 5),
(1652, 6, 13),
(1653, 6, 14),
(1654, 6, 6),
(1655, 6, 7),
(1656, 6, 15),
(1657, 6, 16),
(1658, 6, 17),
(1659, 6, 46),
(1660, 6, 47),
(1661, 6, 48),
(1662, 6, 49),
(1663, 6, 50),
(1664, 6, 51),
(1665, 6, 8),
(1666, 6, 9),
(1667, 6, 10),
(1668, 6, 18),
(1669, 6, 19),
(1670, 6, 21),
(1671, 6, 26),
(1672, 6, 27),
(1673, 6, 28),
(1674, 6, 29),
(1675, 6, 33),
(1676, 6, 30),
(1677, 6, 31),
(1678, 6, 32),
(1679, 1, 1),
(1680, 1, 2),
(1681, 1, 3),
(1682, 1, 22),
(1683, 1, 23),
(1684, 1, 24),
(1685, 1, 25),
(1686, 1, 45),
(1687, 1, 4),
(1688, 1, 5),
(1689, 1, 13),
(1690, 1, 14),
(1691, 1, 6),
(1692, 1, 7),
(1693, 1, 15),
(1694, 1, 16),
(1695, 1, 17),
(1696, 1, 46),
(1697, 1, 47),
(1698, 1, 48),
(1699, 1, 49),
(1700, 1, 50),
(1701, 1, 51),
(1702, 2, 83),
(1703, 2, 84),
(1704, 2, 85),
(1705, 2, 86),
(1706, 2, 87),
(1707, 2, 88),
(1708, 2, 89),
(1709, 2, 90),
(1710, 2, 91),
(1711, 2, 92),
(1712, 2, 93),
(1713, 2, 8),
(1714, 2, 9),
(1715, 2, 10),
(1716, 2, 18),
(1717, 2, 19),
(1718, 2, 21),
(1719, 2, 26),
(1720, 2, 33);

-- --------------------------------------------------------

--
-- 表的结构 `t_temp_apps`
--

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
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`uid`, `account_name`, `account_pwd`, `email`, `type`, `company`, `contact_name`, `contact_tel`, `qq`, `website`, `createtime`, `login_token`, `login_token_time`, `status`) VALUES
(22, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '144@qq.com', 1, '', '覃建栋', '13631661621', NULL, '', '2013-06-02 17:43:46', 'aa6211bc8c3d41c4888c4f1060c0a533', '2013-07-08 00:23:42', 1),
(33, 'dev001', 'E10ADC3949BA59ABBE56E057F20F883E', 'dev001@gmail.com', 4, NULL, 'dev001', '13631661621', NULL, 'http://localhost:8080', '2013-07-08 00:13:23', 'dccb3cfa9d8942419701702c7bf9c501', '2013-07-08 00:43:58', 1),
(31, 'jd_test', '4297F44B13955235245B2497399D7A93', 'qinjiandong21010@gmail.com', 6, 'Powerall networks', '覃建栋', '13631661621', NULL, 'http://localhost:8081/', '2013-07-07 23:19:48', '4289c363fde745d388ec1aa9e4d12069', '2013-07-07 23:40:53', 1),
(32, 'yygl001', 'E10ADC3949BA59ABBE56E057F20F883E', 'yygl@gmail.com', 2, '', 'yygl', '13631661621', NULL, 'http://localhost:8080', '2013-07-08 00:12:45', '8092cc0d90b54a6d91aa7268c00bdbe2', '2013-07-08 00:17:04', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_account`
--

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
