
DROP DATABASE IF EXISTS `adplatform`;

CREATE DATABASE `adplatform`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `adplatform`;

--
-- 表的结构 `t_ad_channel`
--

DROP TABLE IF EXISTS `t_ad_channel`;
CREATE TABLE IF NOT EXISTS `t_ad_channel` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

--
-- 表的结构 `t_config`
--

DROP TABLE IF EXISTS `t_config`;
CREATE TABLE IF NOT EXISTS `t_config` (
  `cmd_name` varchar(100) NOT NULL,
  `cmd_value` varchar(300) DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cmd_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_config`
--

INSERT INTO `t_config` (`cmd_name`, `cmd_value`, `last_update_time`) VALUES
('released_sdk', 'sa_sdk_0.2.4.zip', '2013-01-06 02:16:03'),
('files_path', '/home/sd/files', '2013-05-28 08:59:14');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

--
-- 表的结构 `t_extra_applist`
--

DROP TABLE IF EXISTS `t_extra_applist`;
CREATE TABLE IF NOT EXISTS `t_extra_applist` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
(33, '应用列表', '所有开发者应用列表', '/apps/listAll.html', 26, 1, 1, '313'),
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
(89, '用户审核列表', '', '/accounts/userReviewList.html', 88, 1, 1, '0'),
(90, '广告渠道管理', '', '', 0, 1, 1, '0'),
(91, '添加广告渠道', '', '/adchannel/formpage.html', 90, 1, 1, '0'),
(92, '修改渠道', '', '', 90, 0, 1, '0'),
(93, '渠道列表', '', '/adchannel/adChannelList.html', 90, 1, 1, '0'),
(94, '增加应用分类', '', '/apps/formpage.html', 1, 1, 1, '8'),
(95, '应用分类列表', '', '/apps/appTypeList.html', 1, 1, 1, '7'),
(96, '回收站', '', '/adResource/listRecycle.html', 8, 1, 1, '3');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000;

--
-- 表的结构 `t_reset_pwd`
--

DROP TABLE IF EXISTS `t_reset_pwd`;
CREATE TABLE IF NOT EXISTS `t_reset_pwd` (
  `email` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable` bit(1) NOT NULL COMMENT '0 is enable',
  PRIMARY KEY (`email`),
  UNIQUE KEY `id_token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- 转存表中的数据 `t_role`
--

INSERT INTO `t_role` (`id`, `role_name`, `status`, `create_date`) VALUES
(1, 'Admin', 1, '2013-04-07 03:18:49'),
(2, '运营管理', 1, '2013-04-07 06:27:39'),
(3, '个人开发者', 1, '2013-04-22 08:13:21'),
(4, '公司', 1, '2013-05-14 06:01:05'),
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
-- 表的结构 `t_transfer_history`
--

DROP TABLE IF EXISTS `t_transfer_history`;
CREATE TABLE IF NOT EXISTS `t_transfer_history` (
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

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1350080;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`uid`, `account_name`, `account_pwd`, `email`, `type`, `company`, `contact_name`, `contact_tel`, `qq`, `website`, `createtime`, `login_token`, `login_token_time`, `status`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@adplatform.com', 1, '', '系统管理员', '', NULL, '', '2013-06-02 17:43:46', '', '2013-07-17 07:45:30', 1),
(2, 'spadmin', 'e10adc3949ba59abbe56e057f20f883e', 'spadmin@adplatform.com', 2, '', '运营管理员', '', NULL, '', '2013-07-08 00:12:45', '', '2013-07-18 06:50:32', 1),
(1350070, 'developer', 'e10adc3949ba59abbe56e057f20f883e', 'developer@adplatform.com', 3, '', '个人开发者', '', '', NULL, '2013-07-08 00:13:23', '', '2013-07-15 18:31:52', 1),
(1350071, 'company', 'e10adc3949ba59abbe56e057f20f883e', 'company@adplatform.com', 4, '', '公司', '', '', NULL, '2013-07-08 00:13:23', '', '2013-07-15 18:31:52', 1);


--
-- 表的结构 `t_user_account`
--

DROP TABLE IF EXISTS `t_user_account`;
CREATE TABLE IF NOT EXISTS `t_user_account` (
  `uid` varchar(20) NOT NULL COMMENT '用户',
  `balance` double NOT NULL COMMENT '余额',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新日期',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user_account`
--

INSERT INTO `t_user_account` (`uid`, `balance`, `last_update_time`) VALUES
('1', 0, '2013-06-02 02:41:21'),
('2', 0, '2013-06-02 09:47:41'),
('1350070', 0, '2013-06-06 16:57:00'),
('1350071', 0, '2013-06-06 16:57:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000; 
