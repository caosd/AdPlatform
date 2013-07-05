/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : stomato

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-07-05 09:28:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_list`
-- ----------------------------
DROP TABLE IF EXISTS `ad_list`;
CREATE TABLE `ad_list` (
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad_list
-- ----------------------------
INSERT INTO `ad_list` VALUES ('65', '1号药店', '掌上医院全新更名为“1号药店”，更直观，更贴切。万款药品，保证正品，平民价格，送货上门，货到付款，远超实体药店的购物体验。', 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/icon/1231faf.png', '50', '掌上医院全新更名为“1号药店”，更直观，更贴切。万款药品，保证正品，平民价格，送货上门，货到付款，远超实体药店的购物体验。', '2.5.9', '2103', 'com.yiwang', 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/images/111.png,http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/images/222.png', '2013-04-10 10:06:04', '2013-04-09 16:00:00', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.yiwang-20130410/1号药店.apk', '20130409', '20130511', '0');
INSERT INTO `ad_list` VALUES ('66', '淘宝', '淘宝客户端依托淘宝网强大的自身优势,整合旗下团购聚划算、品质保证淘宝商城、商品品类丰富的淘宝集市为一体,为用户提供更方便快捷流畅、随时随地进行移动购物的完美体验;', 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/icon/fa123a.png', '50', '淘宝客户端依托淘宝网强大的自身优势,整合旗下团购聚划算、品质保证淘宝商城、商品品类丰富的淘宝集市为一体,为用户提供更方便快捷流畅、随时随地进行移动购物的完美体验;', '3.5.2', '8058', 'com.taobao.taobao', 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/images/淘宝1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/images/淘宝2.jpg', '2013-04-10 10:06:29', '2013-04-09 16:00:00', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.taobao.taobao-20130410/淘宝.apk', '20130409', '20130511', '0');
INSERT INTO `ad_list` VALUES ('67', '航班管家', '最受欢迎的APP之一，国内唯一一款能显示实时余票量的航班查询手机软件！是您过年回家的抢票利器！', 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/icon/fas123a1f2.png', '60', '最受欢迎的APP之一，国内唯一一款能显示实时余票量的航班查询手机软件！是您过年回家的抢票利器！', '3.6.4', '3776', 'com.flightmanager.view', 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/images/航班管家1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/images/航班管家2.jpg', '2013-04-10 10:06:55', '2013-04-09 16:00:00', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.flightmanager.view-20130410/航班管家.apk', '20130408', '20130511', '0');
INSERT INTO `ad_list` VALUES ('68', '超强音乐播放器', '超强音乐播放器', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/icon/icon.png', '30', 'dj.android.soundbest', '2.0', '13163', 'dj.android.soundbest', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/images/1.png', '2013-04-10 09:44:55', '2013-04-10 10:07:16', '0', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.soundbest-20130410/SoundBestMusicPlayer.apk', '20130410', '20130503', '0');
INSERT INTO `ad_list` VALUES ('69', '计算器美化', '计算器美化', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/icon/icon.png', '50', 'lak.dj.calculator计算器美化', '3.0', '414', 'lak.dj.calculator', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/1.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/2.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/images/4.png', '2013-04-10 09:46:42', '2013-04-10 10:07:25', '0', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.calculator-20130410/calculator.apk', '20130402', '20130509', '0');
INSERT INTO `ad_list` VALUES ('70', '掌上宝免费电话', '掌上宝电话最火手机电话软件，超强群聊功能（支持4人同聊）、来去电显示、智能拨号，通话清晰，接通率国内第一，安装就送免费通话，最高达60分钟', 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/icon/123a.png', '45', '    新注册用户：\r\n1、充50元到帐100元，充100元到帐580元话费，所有话费一次性到帐；\r\n2、充值满100元送 VIP黄金会员，并送“去电显示”功能。\r\n掌上宝电话最火手机电话软件，超强群聊功能（支持4人同聊）、来去电显示、智能拨号，通话清晰，接通率国内第一，安装就送免费通话，最高达60分钟', '6.1.3', '3781', 'com.dft.hb.app', 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/images/s掌上宝免费电话1.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/images/掌上宝免费电话2.jpg', '2013-04-10 09:52:55', '2013-04-09 16:00:00', '1', 'http://113.98.254.204:58080/ChannelReport/upload/com.dft.hb.app-20130410/掌上宝免费电话.apk', '20130408', '20130511', '0');
INSERT INTO `ad_list` VALUES ('71', '截屏助手', '截屏助手', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/icon/lithiclogogrey.png', '50', 'dj.android.lithic', '3.0', '2672', 'dj.android.lithic', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/images/2.png', '2013-04-10 09:48:29', '2013-04-10 09:48:29', '1', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.lithic-20130410/Lithic.apk', '20130404', '20130509', '0');
INSERT INTO `ad_list` VALUES ('72', '进程杀手', '进程杀手', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/icon/widgeticon.png', '60', 'dj.android.prokiller', '6.3', '201', 'dj.android.prokiller', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/3.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/images/1.png', '2013-04-10 09:51:18', '2013-04-10 09:51:18', '1', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.prokiller-20130410/TaskKiller.apk', '20130401', '20130509', '0');
INSERT INTO `ad_list` VALUES ('73', '多米音乐', '多米音乐android5.0.4带你进入一个全新的音乐世界。', 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/icon/aa.png', '70', '国内唯一不限流量音乐软件！】多米音乐android5.0.4带你进入一个全新的音乐世界。联通用户包流量畅听，扔掉数据线，再无流量压力！在这里，我们集合了众多音乐达人从上千万首歌曲中甄选出来的优质歌单，只为让你发现更多好听的音乐，安心享受音乐带来的快乐；多米音乐具有颠覆性的时尚界面，最智能的音乐搜索引擎，海量320Kps高品质音乐内容和前所未有的歌单分享体系，会让你很难相信这仅仅是一款音乐软件，来吧亲们，和多米一起体验新时代的音乐潮流！', '5.0.4', '4694', 'com.duomi.android', 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/images/sy_201304081750355836.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/images/sy_201304081750359320.jpg', '2013-04-10 09:51:54', '2013-04-10 09:51:54', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.duomi.android-20130410/com.duomi.android_175034.apk', '20130409', '20130511', '0');
INSERT INTO `ad_list` VALUES ('74', '私密相册', '私密相册', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/icon/icon.png', '30', 'dj.android.simiphoto', '3.0', '325', 'dj.android.simiphoto', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/images/1.png', '2013-04-10 09:52:12', '2013-04-10 10:07:45', '0', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.simiphoto-20130410/PhotoVault.apk', '20130403', '20130509', '0');
INSERT INTO `ad_list` VALUES ('75', '文本编辑器', '文本编辑器', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/icon/icon.png', '30', 'dj.android.textEditor', '3.0', '604', 'dj.android.textEditor', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/images/1.png', '2013-04-10 09:53:51', '2013-04-10 09:53:51', '1', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.textEditor-20130410/TextEditor.apk', '20130402', '20130426', '0');
INSERT INTO `ad_list` VALUES ('76', '同花顺手机炒股票', '同花顺(300033)手机炒股股票软件是目前国内用户使用量最高、性能最稳定', 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/icon/201304091341251196.png', '50', '同花顺(300033)手机炒股股票软件是目前国内用户使用量最高、性能最稳定、支持券商最多并支持手机在线交易的随身免费炒股(财经/证券)软件。是拥有12年专业经验团队为您量身打造，1G光纤带宽高速行情，海量专业证券资讯，快速安全在线委托,投资理财好助手。\r\n同花顺手机炒股创新结合沪深Level-2数据，强势推出：MACD云参数选股、股价预警、股票池、决策密码、Level-2、选股模型，为您实时监控盘中大资金流向，让您随时掌握市场热点，轻松炒股决策，投资下单先人一步！ ', '6.9', '3850', 'com.hexin.plat.android', 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/images/sy_201303271050065684.png,http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/images/sy_201303271050075941.png', '2013-04-10 09:55:05', '2013-04-10 09:55:05', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.hexin.plat.android-20130410/com.hexin.plat.android_134126.apk', '20130409', '20130511', '0');
INSERT INTO `ad_list` VALUES ('77', '文档扫描仪', '文档扫描仪', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/icon/icon.png', '30', 'dj.android.docscanner', '3.0', '6140', 'dj.android.docscanner', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/images/3.png', '2013-04-10 09:55:45', '2013-04-10 09:55:45', '1', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.docscanner-20130410/DocScanner.apk', '20130409', '20130425', '0');
INSERT INTO `ad_list` VALUES ('78', '压缩大师', '压缩大师', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/icon/icon.png', '50', 'dj.android.arsazpaid', '6.3', '6140', 'dj.android.arsazpaid', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/images/3.png', '2013-04-10 09:56:53', '2013-04-10 09:56:53', '1', 'http://113.98.254.204:58080/ChannelReport/upload/dj.android.arsazpaid-20130410/DocScanner.apk', '20130402', '20130510', '0');
INSERT INTO `ad_list` VALUES ('79', 'UC浏览器', 'UC浏览器是一款免费网页浏览软件,适用于以手机为主的各类手持移动终端。 ', 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/icon/201304101412088817.png', '65', 'UC浏览器是一款免费网页浏览软件,适用于以手机为主的各类手持移动终端。 ', '9.0.0', '9816', 'com.UCMobile', 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/images/sy_201304101414030687.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/images/sy_201304101414054827.jpg', '2013-04-10 10:01:34', '2013-04-09 16:00:00', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.UCMobile-20130410/com.UCMobile_141208.apk', '20130409', '20130430', '0');
INSERT INTO `ad_list` VALUES ('80', '彩虹便签', '彩虹便签', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/icon/icon.png', '30', 'lak.dj.note', '3.2.0', '743', 'lak.dj.note', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/images/4.png,http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/images/2.png', '2013-04-10 09:57:58', '2013-04-10 09:57:58', '1', 'http://113.98.254.204:58080/ChannelReport/upload/lak.dj.note-20130410/ColorNote.apk', '20130401', '20130503', '0');
INSERT INTO `ad_list` VALUES ('81', '天天动听播放器', '好音质，天天动听！摇一摇，邂逅你的音乐知音！', 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/icon/201303291442030431.png', '55', '好音质，天天动听！摇一摇，邂逅你的音乐知音！\r\n\r\n【核心功能】\r\n1.全面支持APE、FLAC、MP3、AAC、M4A、WMA、 ALAC、WAV等各种音频格式\r\n2.专业的EQ均衡器设置\r\n3.专业的重低音、环绕声和环境音效设置\r\n4.一键红心收藏歌曲，如此简单\r\n5.独创横屏舞台，打造春晚舞台效果\r\n6.海量歌词，最新最准\r\n7.高清图片，不一样的视觉享受\r\n8.多彩皮肤，彰显你的自我个性\r\n9.桌面迷你歌词(和电脑上一样)\r\n10.功能贴心，睡眠模式、线控、甩歌方便实用', '5.1.0', '5640', 'com.sds.android.ttpod', 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/images/sy_201303290917499277.jpg,http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/images/sy_201303290917508289.jpg', '2013-04-10 09:59:11', '2013-04-10 09:59:11', '0', 'http://113.98.254.204:58080/ChannelReport/upload/com.sds.android.ttpod-20130410/com.sds.android.ttpod_144205.apk', '20130408', '20130511', '0');
INSERT INTO `ad_list` VALUES ('82', '亮灯', '亮灯', 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/icon/icon.png', '60', '亮灯（Light Up）》是一个有趣和令人上瘾的益智游戏。鲍勃是一个有才华的男孩，谁爱使灯泡有趣的拼图。在实验室，生产间，储藏室或陈列室，Bob已经准备了共有240级别的灯泡游戏。他在等待着你的挑战！\r\n\r\n游戏操作：\r\n\r\n- 与电流流动相同的颜色匹配的灯泡连接。所有的颜色配对，并填满整个板来解决每一个难题。但是请注意，电流将打破，如果他们交叉或重叠！\r\n\r\n游戏特色\r\n\r\n- 精心设计的水平，简单，容易上瘾。\r\n\r\n- 美丽和辉煌的场景\r\n\r\n- 为整个家庭添加乐趣', '3.3', '20925', 'com.droidpower.flow', 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/images/1.png', '2013-04-15 12:44:18', '2013-04-14 16:00:00', '0', 'http://127.0.0.1:8888/ChannelReport/upload/com.droidpower.flow-20130415/n-Light_Up_v1_0-groupB.apk', '20130415', '20130607', '0');
INSERT INTO `ad_list` VALUES ('83', '外星粉碎机', '外星粉碎机', 'http://127.0.0.1:8888/ChannelReport/upload/com.twodstar.ac-20130415/icon/icon.png', '61', '', '', '14075', 'com.twodstar.ac', '', '2013-04-15 12:48:24', '2013-04-14 16:00:00', '0', 'http://127.0.0.1:8888/ChannelReport/upload/com.twodstar.ac-20130415/n-Alien_Crusher_Pro_v2-groupB.apk', '20130410', '20130510', '0');
INSERT INTO `ad_list` VALUES ('84', '相片组合', '相片组合', 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/icon/icon.png', '50', 'luxi.top.photogrid', '3.0', '2928', 'luxi.top.photogrid', 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/1.png,http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/2.png,http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/images/3.png', '2013-04-22 07:03:57', '2013-04-22 07:03:57', '2', 'http://127.0.0.1:8888/ChannelReport/upload/luxi.top.photogrid-20130422/luxi.top.photogrid.apk', '20130422', '20130522', '0');
INSERT INTO `ad_list` VALUES ('85', '天草', '所发放', 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/icon/icon.png', '50', 'sfsa', '3.3.2', '8668', 'com.cc.saeweq', 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/images/1.png', '2013-04-28 09:24:16', '2013-04-28 09:24:16', '0', 'http://127.0.0.1:8888/ChannelReport/upload/com.cc.saeweq-20130428/com.cc.saeweq.apk', '20130428', '20130528', '0');
INSERT INTO `ad_list` VALUES ('86', '啊啊啊啊啊', '啊啊啊啊', 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/icon/icon.png', '100', '上的撒', '3.0', '17089', 'aaa.bbb.ccc', 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/images/1.png', '2013-05-21 10:19:07', '2013-05-13 16:00:00', '0', 'http://127.0.0.1:8888/ChannelReport/upload/aaa.bbb.ccc-20130514/aaa.bbb.ccc.apk', '20130514', '20130614', '1');
INSERT INTO `ad_list` VALUES ('87', 'afa', '司法法', 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/icon/20130521182002.png', '50', 'afafa', '3.0', '367', 'com.asdfa.d', 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/images/20130521182002a.png', '2013-05-21 10:20:16', '2013-05-20 16:00:00', '0', 'http://127.0.0.1:8888/ChannelReport/upload/com.asdfa.d-20130521/com.asdfa.d.apk', '20130521', '20130621', '1');

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
INSERT INTO `t_apps` VALUES ('2', '9a3b327c837794a67e854a2c24d32b46', '23', '小青菜', 'com.elevenbitstudios.FunkySmugglers', 'drawable-xxhdpi#icon.png', '1', '0', '2013-06-08 09:37:36', '2013-06-05 18:04:03', '', '', '1');
INSERT INTO `t_apps` VALUES ('3', '678f1cfeaf2cfe14207d90c998acc70b', '23', '红萝卜', 'com.appspot.swisscodemonkeys.camerafx', 'drawable-ldpi#ic_launcher_camera2.png', '1', '1', '2013-06-07 00:07:10', '2013-06-07 00:06:15', '', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credentials
-- ----------------------------
INSERT INTO `t_credentials` VALUES ('1', '20', '1', '452124199012230077', '/files/20/credentials/1_452124199012230077_photo1.png', '/files/20/credentials/1_452124199012230077_photo2.png', '华夏银行', '425202520014225852', '覃建栋', '深圳南山支行', '2013-06-02 12:05:25', '2013-05-29 22:48:23');
INSERT INTO `t_credentials` VALUES ('2', '18', '1', '123456789', '', '', '中国工商银行', '123567', 'aaa', 'com', '2013-06-02 15:25:40', '2013-06-02 15:25:40');
INSERT INTO `t_credentials` VALUES ('3', '23', '1', '123456789', '1_123456789_photo1.png', '1_123456789_photo2.jpeg', '中国工商银行', '622655555555', '张三', '深圳', '2013-06-06 23:05:45', '2013-06-06 23:05:45');
INSERT INTO `t_credentials` VALUES ('4', '27', '2', '452124199012230077', '2_452124199012230077_photo1.jpeg', '', null, null, null, null, '2013-06-08 13:21:28', '2013-06-08 13:21:28');
INSERT INTO `t_credentials` VALUES ('5', '28', '2', '', '2__photo1.null', '', null, null, null, null, '2013-06-08 13:23:58', '2013-06-08 13:23:58');

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
  `_status` int(4) DEFAULT '0' COMMENT '是否有效 0-有效，1-无效',
  `order_no` varchar(50) DEFAULT '0' COMMENT '排序标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '系统管理', null, '', '0', '1', '0', '1');
INSERT INTO `t_menu` VALUES ('2', '新增用户', '', '/accounts/formpage.html', '1', '1', '0', '111');
INSERT INTO `t_menu` VALUES ('3', '用户列表', null, '/accounts/listUser.html', '1', '1', '0', '112');
INSERT INTO `t_menu` VALUES ('4', '新增角色', null, '/role/formpage.html', '1', '1', '0', '121');
INSERT INTO `t_menu` VALUES ('5', '角色列表', null, '/role/listRole.html', '1', '1', '0', '122');
INSERT INTO `t_menu` VALUES ('6', '新增菜单', null, '/menu/formpage.html', '1', '1', '0', '131');
INSERT INTO `t_menu` VALUES ('7', '菜单列表', null, '/menu/listMenu.html', '1', '1', '0', '132');
INSERT INTO `t_menu` VALUES ('8', '资源管理', null, '', '0', '1', '0', '2');
INSERT INTO `t_menu` VALUES ('9', '资源录入', null, '/adResource/formpage.html', '8', '1', '0', '211');
INSERT INTO `t_menu` VALUES ('10', '资源列表', null, '/adResource/adResourceList.html', '8', '1', '0', '212');
INSERT INTO `t_menu` VALUES ('13', '查看权限', null, '/role/roleFormpage.html', '1', '0', '0', '124');
INSERT INTO `t_menu` VALUES ('14', '设置角色权限', null, '/role/setRoleMenu.html', '1', '0', '0', '125');
INSERT INTO `t_menu` VALUES ('15', '新增菜单', null, '/menu/formpage.html', '1', '0', '0', '133');
INSERT INTO `t_menu` VALUES ('16', '查找菜单', null, '/menu/getMenu.html', '1', '0', '0', '134');
INSERT INTO `t_menu` VALUES ('17', '修改菜单', null, '/menu/updateMenu.html', '1', '0', '0', '135');
INSERT INTO `t_menu` VALUES ('18', '查找资源', null, '/adResource/getAdResource.html', '8', '0', '0', '213');
INSERT INTO `t_menu` VALUES ('19', '展示资源', null, '/adResource/showAdResource.html', '8', '0', '0', '214');
INSERT INTO `t_menu` VALUES ('21', '修改资源', null, '/adResource/updateAdResource.html', '8', '0', '0', '216');
INSERT INTO `t_menu` VALUES ('22', '编辑用户', null, '/user/editUser.html', '1', '0', '0', '114');
INSERT INTO `t_menu` VALUES ('23', '修改用户角色&状态', null, '/user/updateUserRoleAndStatus.html', '1', '0', '0', '115');
INSERT INTO `t_menu` VALUES ('24', '重置密码', null, '/ajax/updateUser.html', '1', '0', '0', '116');
INSERT INTO `t_menu` VALUES ('25', '检测用户名', null, '/hasUser.html', '1', '0', '0', '117');
INSERT INTO `t_menu` VALUES ('26', '开发者应用', null, '', '0', '1', '0', '3');
INSERT INTO `t_menu` VALUES ('27', '应用上传', null, '/appInfo/formpage.html', '26', '1', '0', '311');
INSERT INTO `t_menu` VALUES ('28', '上传应用action', null, '/appInfo/addAppInfo.html', '26', '0', '0', '312');
INSERT INTO `t_menu` VALUES ('29', '应用列表', '开发者个人应用列表', '/appInfo/listAppInfo.html', '26', '1', '0', '313');
INSERT INTO `t_menu` VALUES ('30', '查询应用', null, '/appInfo/selectAppInfo.html', '26', '0', '0', '314');
INSERT INTO `t_menu` VALUES ('31', '修改应用', null, '/appInfo/updateAppInfo.html', '26', '0', '0', '315');
INSERT INTO `t_menu` VALUES ('32', '删除应用', null, '/appInfo/deleteAppInfo.html', '26', '0', '0', '316');
INSERT INTO `t_menu` VALUES ('33', '应用列表', '所有开发者应用列表', '/appInfo/listAppInfoAll.html', '26', '1', '0', '313');
INSERT INTO `t_menu` VALUES ('34', 'SDK报表', null, '', '0', '1', '0', '4');
INSERT INTO `t_menu` VALUES ('35', '用户报表', null, '/report/userDayReport.html', '34', '0', '0', '411');
INSERT INTO `t_menu` VALUES ('36', '应用安装上报报表', null, '/report/appInstallReport.html', '34', '0', '0', '412');
INSERT INTO `t_menu` VALUES ('37', '报表列管理', null, '', '0', '0', '0', '5');
INSERT INTO `t_menu` VALUES ('38', 'column列表', null, '/gridColumn/list.html', '37', '0', '0', '511');
INSERT INTO `t_menu` VALUES ('39', 'add报表列', null, '/gridColumn/formAdd.html', '37', '0', '0', '512');
INSERT INTO `t_menu` VALUES ('40', 'add报表列action', null, '/gridColumn/add.html', '37', '0', '0', '513');
INSERT INTO `t_menu` VALUES ('41', 'update报表列', null, '/gridColumn/formUpdate.html', '37', '0', '0', '514');
INSERT INTO `t_menu` VALUES ('42', 'update报表列action', null, '/gridColumn/update.html', '37', '0', '0', '515');
INSERT INTO `t_menu` VALUES ('43', 'delete报表列', null, '/gridColumn/delete.html', '37', '0', '0', '516');
INSERT INTO `t_menu` VALUES ('44', '渠道报表', null, '', '0', '0', '0', '6');
INSERT INTO `t_menu` VALUES ('45', '渠道列表', null, '/user/listChannelUser.html', '1', '0', '0', '118');
INSERT INTO `t_menu` VALUES ('46', '新增支付项目', '', '/amountItem/form.html', '1', '0', '0', '141');
INSERT INTO `t_menu` VALUES ('47', '新增支付项目action', null, '/amountItem/add.html', '1', '0', '0', '142');
INSERT INTO `t_menu` VALUES ('48', '支付项目列表', null, '/amountItem/list.html', '1', '0', '0', '143');
INSERT INTO `t_menu` VALUES ('49', '修改支付项目', null, '/amountItem/updateForm.html', '1', '0', '0', '144');
INSERT INTO `t_menu` VALUES ('50', '修改支付项目action', null, '/amountItem/update.html', '1', '0', '0', '145');
INSERT INTO `t_menu` VALUES ('51', '删除支付项目', null, '/amountItem/delete.html', '1', '0', '0', '146');
INSERT INTO `t_menu` VALUES ('52', '支付报表', '渠道本身的支付报表 —— 对外', '/report/channelAmountReport.html', '44', '0', '0', '611');
INSERT INTO `t_menu` VALUES ('53', '支付报表', '所有渠道支付报表 —— 对内', '/report/allChannelAmountReport.html', '44', '0', '0', '612');
INSERT INTO `t_menu` VALUES ('66', '财务中心', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('67', '帐户管理', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('68', '财务信息', '', '/financial/overview', '66', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('69', '财务明细', '', '/financial/accounts', '66', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('70', '申请汇款', '', '/financial/remittance', '66', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('71', '汇款记录', '', '/financial/remittance_history', '66', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('72', '收入报表', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('73', '广告报表', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('74', '小时统计', '', '', '72', '0', '0', '0');
INSERT INTO `t_menu` VALUES ('75', '每日统计', '', '/report/incoming/daily', '72', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('76', '每月统计', '', '/report/incoming/monthly', '72', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('77', '广告推送', '', '/report/advert/pushes', '73', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('78', '应用内广告', '', '/report/advert/advertising', '73', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('79', '个人资料', '', '/accounts/overview', '67', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('80', '修改Email', '', '/accounts/change_email', '67', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('81', '修改资料', '', '/accounts/change_profile', '67', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('82', '修改密码', '', '/accounts/change_pwd', '67', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('83', '用户渠道', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('84', '添加用户渠道', '', '', '83', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('85', '用户渠道列表', '', '', '83', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('86', '添加厂商', '', '', '83', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('87', '厂商列表', '', '', '83', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('88', '用户审核', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('89', '用户注册资料列表', '', '', '88', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('90', '渠道管理', '', '', '0', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('91', '添加渠道', '', '', '90', '1', '0', '0');
INSERT INTO `t_menu` VALUES ('92', '修改渠道', '', '', '90', '0', '0', '0');
INSERT INTO `t_menu` VALUES ('93', '渠道列表', '', '', '90', '1', '0', '0');

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
  `_status` int(4) DEFAULT '0' COMMENT '状态：0-有效 1-无效',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'Admin', '0', '2013-04-07 11:18:49');
INSERT INTO `t_role` VALUES ('2', '运营管理', '0', '2013-04-07 14:27:39');
INSERT INTO `t_role` VALUES ('4', '个人开发者', '0', '2013-04-22 16:13:21');
INSERT INTO `t_role` VALUES ('5', '方案商', '0', '2013-05-14 14:01:05');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色ID',
  `menu_id` int(4) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('1453', '1', '66');
INSERT INTO `t_role_menu` VALUES ('1454', '1', '68');
INSERT INTO `t_role_menu` VALUES ('1455', '1', '69');
INSERT INTO `t_role_menu` VALUES ('1456', '1', '70');
INSERT INTO `t_role_menu` VALUES ('1457', '1', '71');
INSERT INTO `t_role_menu` VALUES ('1458', '1', '67');
INSERT INTO `t_role_menu` VALUES ('1459', '1', '79');
INSERT INTO `t_role_menu` VALUES ('1460', '1', '80');
INSERT INTO `t_role_menu` VALUES ('1461', '1', '81');
INSERT INTO `t_role_menu` VALUES ('1462', '1', '82');
INSERT INTO `t_role_menu` VALUES ('1463', '1', '72');
INSERT INTO `t_role_menu` VALUES ('1464', '1', '74');
INSERT INTO `t_role_menu` VALUES ('1465', '1', '75');
INSERT INTO `t_role_menu` VALUES ('1466', '1', '76');
INSERT INTO `t_role_menu` VALUES ('1467', '1', '73');
INSERT INTO `t_role_menu` VALUES ('1468', '1', '77');
INSERT INTO `t_role_menu` VALUES ('1469', '1', '78');
INSERT INTO `t_role_menu` VALUES ('1470', '1', '83');
INSERT INTO `t_role_menu` VALUES ('1471', '1', '84');
INSERT INTO `t_role_menu` VALUES ('1472', '1', '85');
INSERT INTO `t_role_menu` VALUES ('1473', '1', '86');
INSERT INTO `t_role_menu` VALUES ('1474', '1', '87');
INSERT INTO `t_role_menu` VALUES ('1475', '1', '88');
INSERT INTO `t_role_menu` VALUES ('1476', '1', '89');
INSERT INTO `t_role_menu` VALUES ('1477', '1', '90');
INSERT INTO `t_role_menu` VALUES ('1478', '1', '91');
INSERT INTO `t_role_menu` VALUES ('1479', '1', '92');
INSERT INTO `t_role_menu` VALUES ('1480', '1', '93');
INSERT INTO `t_role_menu` VALUES ('1481', '1', '1');
INSERT INTO `t_role_menu` VALUES ('1482', '1', '2');
INSERT INTO `t_role_menu` VALUES ('1483', '1', '3');
INSERT INTO `t_role_menu` VALUES ('1484', '1', '22');
INSERT INTO `t_role_menu` VALUES ('1485', '1', '23');
INSERT INTO `t_role_menu` VALUES ('1486', '1', '24');
INSERT INTO `t_role_menu` VALUES ('1487', '1', '25');
INSERT INTO `t_role_menu` VALUES ('1488', '1', '45');
INSERT INTO `t_role_menu` VALUES ('1489', '1', '4');
INSERT INTO `t_role_menu` VALUES ('1490', '1', '5');
INSERT INTO `t_role_menu` VALUES ('1491', '1', '13');
INSERT INTO `t_role_menu` VALUES ('1492', '1', '14');
INSERT INTO `t_role_menu` VALUES ('1493', '1', '6');
INSERT INTO `t_role_menu` VALUES ('1494', '1', '7');
INSERT INTO `t_role_menu` VALUES ('1495', '1', '15');
INSERT INTO `t_role_menu` VALUES ('1496', '1', '16');
INSERT INTO `t_role_menu` VALUES ('1497', '1', '17');
INSERT INTO `t_role_menu` VALUES ('1498', '1', '46');
INSERT INTO `t_role_menu` VALUES ('1499', '1', '47');
INSERT INTO `t_role_menu` VALUES ('1500', '1', '48');
INSERT INTO `t_role_menu` VALUES ('1501', '1', '49');
INSERT INTO `t_role_menu` VALUES ('1502', '1', '50');
INSERT INTO `t_role_menu` VALUES ('1503', '1', '51');
INSERT INTO `t_role_menu` VALUES ('1504', '1', '8');
INSERT INTO `t_role_menu` VALUES ('1505', '1', '9');
INSERT INTO `t_role_menu` VALUES ('1506', '1', '10');
INSERT INTO `t_role_menu` VALUES ('1507', '1', '18');
INSERT INTO `t_role_menu` VALUES ('1508', '1', '19');
INSERT INTO `t_role_menu` VALUES ('1509', '1', '21');
INSERT INTO `t_role_menu` VALUES ('1510', '1', '26');
INSERT INTO `t_role_menu` VALUES ('1511', '1', '27');
INSERT INTO `t_role_menu` VALUES ('1512', '1', '28');
INSERT INTO `t_role_menu` VALUES ('1513', '1', '29');
INSERT INTO `t_role_menu` VALUES ('1514', '1', '33');
INSERT INTO `t_role_menu` VALUES ('1515', '1', '30');
INSERT INTO `t_role_menu` VALUES ('1516', '1', '31');
INSERT INTO `t_role_menu` VALUES ('1517', '1', '32');
INSERT INTO `t_role_menu` VALUES ('1518', '1', '34');
INSERT INTO `t_role_menu` VALUES ('1519', '1', '35');
INSERT INTO `t_role_menu` VALUES ('1520', '1', '36');
INSERT INTO `t_role_menu` VALUES ('1521', '1', '37');
INSERT INTO `t_role_menu` VALUES ('1522', '1', '38');
INSERT INTO `t_role_menu` VALUES ('1523', '1', '39');
INSERT INTO `t_role_menu` VALUES ('1524', '1', '40');
INSERT INTO `t_role_menu` VALUES ('1525', '1', '41');
INSERT INTO `t_role_menu` VALUES ('1526', '1', '42');
INSERT INTO `t_role_menu` VALUES ('1527', '1', '43');
INSERT INTO `t_role_menu` VALUES ('1528', '1', '44');
INSERT INTO `t_role_menu` VALUES ('1529', '1', '52');
INSERT INTO `t_role_menu` VALUES ('1530', '1', '53');
INSERT INTO `t_role_menu` VALUES ('1548', '4', '66');
INSERT INTO `t_role_menu` VALUES ('1549', '4', '68');
INSERT INTO `t_role_menu` VALUES ('1550', '4', '69');
INSERT INTO `t_role_menu` VALUES ('1551', '4', '70');
INSERT INTO `t_role_menu` VALUES ('1552', '4', '71');
INSERT INTO `t_role_menu` VALUES ('1553', '4', '67');
INSERT INTO `t_role_menu` VALUES ('1554', '4', '79');
INSERT INTO `t_role_menu` VALUES ('1555', '4', '80');
INSERT INTO `t_role_menu` VALUES ('1556', '4', '81');
INSERT INTO `t_role_menu` VALUES ('1557', '4', '82');
INSERT INTO `t_role_menu` VALUES ('1558', '4', '26');
INSERT INTO `t_role_menu` VALUES ('1559', '4', '27');
INSERT INTO `t_role_menu` VALUES ('1560', '4', '28');
INSERT INTO `t_role_menu` VALUES ('1561', '4', '29');
INSERT INTO `t_role_menu` VALUES ('1562', '4', '30');
INSERT INTO `t_role_menu` VALUES ('1563', '4', '31');
INSERT INTO `t_role_menu` VALUES ('1564', '4', '32');
INSERT INTO `t_role_menu` VALUES ('1565', '5', '66');
INSERT INTO `t_role_menu` VALUES ('1566', '5', '68');
INSERT INTO `t_role_menu` VALUES ('1567', '5', '69');
INSERT INTO `t_role_menu` VALUES ('1568', '5', '70');
INSERT INTO `t_role_menu` VALUES ('1569', '5', '71');
INSERT INTO `t_role_menu` VALUES ('1570', '5', '67');
INSERT INTO `t_role_menu` VALUES ('1571', '5', '79');
INSERT INTO `t_role_menu` VALUES ('1572', '5', '80');
INSERT INTO `t_role_menu` VALUES ('1573', '5', '81');
INSERT INTO `t_role_menu` VALUES ('1574', '5', '82');
INSERT INTO `t_role_menu` VALUES ('1575', '5', '72');
INSERT INTO `t_role_menu` VALUES ('1576', '5', '74');
INSERT INTO `t_role_menu` VALUES ('1577', '5', '75');
INSERT INTO `t_role_menu` VALUES ('1578', '5', '76');
INSERT INTO `t_role_menu` VALUES ('1579', '5', '73');
INSERT INTO `t_role_menu` VALUES ('1580', '5', '77');
INSERT INTO `t_role_menu` VALUES ('1581', '5', '78');
INSERT INTO `t_role_menu` VALUES ('1582', '5', '26');
INSERT INTO `t_role_menu` VALUES ('1583', '5', '27');
INSERT INTO `t_role_menu` VALUES ('1584', '5', '28');
INSERT INTO `t_role_menu` VALUES ('1585', '5', '29');
INSERT INTO `t_role_menu` VALUES ('1586', '5', '30');
INSERT INTO `t_role_menu` VALUES ('1587', '5', '31');
INSERT INTO `t_role_menu` VALUES ('1588', '5', '32');
INSERT INTO `t_role_menu` VALUES ('1589', '2', '83');
INSERT INTO `t_role_menu` VALUES ('1590', '2', '84');
INSERT INTO `t_role_menu` VALUES ('1591', '2', '85');
INSERT INTO `t_role_menu` VALUES ('1592', '2', '86');
INSERT INTO `t_role_menu` VALUES ('1593', '2', '87');
INSERT INTO `t_role_menu` VALUES ('1594', '2', '88');
INSERT INTO `t_role_menu` VALUES ('1595', '2', '89');
INSERT INTO `t_role_menu` VALUES ('1596', '2', '90');
INSERT INTO `t_role_menu` VALUES ('1597', '2', '91');
INSERT INTO `t_role_menu` VALUES ('1598', '2', '92');
INSERT INTO `t_role_menu` VALUES ('1599', '2', '93');
INSERT INTO `t_role_menu` VALUES ('1600', '2', '8');
INSERT INTO `t_role_menu` VALUES ('1601', '2', '9');
INSERT INTO `t_role_menu` VALUES ('1602', '2', '10');
INSERT INTO `t_role_menu` VALUES ('1603', '2', '18');
INSERT INTO `t_role_menu` VALUES ('1604', '2', '19');
INSERT INTO `t_role_menu` VALUES ('1605', '2', '21');
INSERT INTO `t_role_menu` VALUES ('1606', '2', '26');
INSERT INTO `t_role_menu` VALUES ('1607', '2', '33');
INSERT INTO `t_role_menu` VALUES ('1608', '2', '34');
INSERT INTO `t_role_menu` VALUES ('1609', '2', '35');
INSERT INTO `t_role_menu` VALUES ('1610', '2', '36');
INSERT INTO `t_role_menu` VALUES ('1611', '2', '44');
INSERT INTO `t_role_menu` VALUES ('1612', '2', '52');
INSERT INTO `t_role_menu` VALUES ('1613', '2', '53');

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
  `_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('22', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '144@qq.com', '1', '', '覃建栋', '13631661621', null, '', '2013-06-02 17:43:46', 'f1482b3e36d648f48b334b7f9724a2a7', '2013-07-05 08:02:51', '0');
INSERT INTO `t_user` VALUES ('23', 'admin2', '4297F44B13955235245B2497399D7A93', 'www@qq.com', '4', '', '', '', null, '', '2013-06-02 17:47:41', 'a83959f8738a42a3b766d914171840e8', '2013-06-17 15:21:22', '0');
INSERT INTO `t_user` VALUES ('28', 'ageage', '4297F44B13955235245B2497399D7A93', 'jiandong2@powerallnetworks.com', '2', '', '', '', '', '', '2013-06-08 13:23:58', null, null, '0');
INSERT INTO `t_user` VALUES ('24', 'baidu', '4297F44B13955235245B2497399D7A93', '142224@qq.com', '1', '', '', '', '', '', '2013-06-07 00:57:00', '8e96e54364e74c55bb2d285e5d0662ae', '2013-06-07 00:57:08', '0');
INSERT INTO `t_user` VALUES ('19', 'demo01', '4297F44B13955235245B2497399D7A93', '1243@qq.com', '1', '', 'hello', '123123123', '1312312', 'www.baidu.com', '2013-05-28 16:51:03', 'c320decbc978488fbd1abf1cba3e4aa9', '2013-06-07 01:00:38', '0');
INSERT INTO `t_user` VALUES ('30', 'jd_yygl', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandongee@powerallnetworks.com', '2', '', '覃建栋', '13631661621', null, 'http://localhost:8081/', '2013-07-05 07:48:18', 'c512f978b13e43bebb7ec4bdde46f536', '2013-07-05 07:55:47', '0');
INSERT INTO `t_user` VALUES ('20', 'jiandong', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandong@powerallnetworks.com', '4', 'Powerall networks', '覃建栋', '13631661621', null, 'http://localhost:8081/', '2013-05-29 22:42:25', 'b5ba0fd7a0a644c0b2c47370e30bdec0', '2013-07-05 08:10:00', '0');
INSERT INTO `t_user` VALUES ('25', 'jiandong1', 'E10ADC3949BA59ABBE56E057F20F883E', 'qinjiandong2010@gmail.com', '2', 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 10:30:27', null, null, '0');
INSERT INTO `t_user` VALUES ('18', 'kewiyi', '4297F44B13955235245B2497399D7A93', '123@qq.com', '1', '', null, null, null, null, '2013-05-28 13:25:56', 'e2a042d3920049b8b6304d455f0dc0cf', '2013-06-07 01:00:27', '0');
INSERT INTO `t_user` VALUES ('26', 'test11', '4297F44B13955235245B2497399D7A93', 'jiandong4@powerallnetworks.com', '2', 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 10:58:14', null, null, '0');
INSERT INTO `t_user` VALUES ('29', 'test3', 'E10ADC3949BA59ABBE56E057F20F883E', '', '0', null, '', '', null, '', '2013-06-30 15:46:22', null, null, '0');
INSERT INTO `t_user` VALUES ('27', 'test334346', '4297F44B13955235245B2497399D7A93', 'jiandong5@powerallnetworks.com', '2', 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 13:20:36', '71e8632d9d4d482eba074507030cdf7e', '2013-06-08 13:22:33', '0');

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
