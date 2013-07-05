-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 07 月 05 日 02:11
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
-- 表的结构 `t_menu`
--

CREATE TABLE IF NOT EXISTS `t_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(250) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `path` varchar(250) DEFAULT '' COMMENT '菜单路径',
  `parent` int(4) DEFAULT '0' COMMENT '父菜单',
  `visible` int(4) DEFAULT '1' COMMENT '是否可见：0-不可见，1-可见',
  `_status` int(4) DEFAULT '0' COMMENT '是否有效 0-有效，1-无效',
  `order_no` varchar(50) DEFAULT '0' COMMENT '排序标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `t_menu`
--

INSERT INTO `t_menu` (`id`, `menuname`, `description`, `path`, `parent`, `visible`, `_status`, `order_no`) VALUES
(1, '系统管理', NULL, '', 0, 1, 0, '1'),
(2, '新增用户', '', '/accounts/formpage.html', 1, 1, 0, '111'),
(3, '用户列表', NULL, '/accounts/listUser.html', 1, 1, 0, '112'),
(4, '新增角色', NULL, '/role/formpage.html', 1, 1, 0, '121'),
(5, '角色列表', NULL, '/role/listRole.html', 1, 1, 0, '122'),
(6, '新增菜单', NULL, '/menu/formpage.html', 1, 1, 0, '131'),
(7, '菜单列表', NULL, '/menu/listMenu.html', 1, 1, 0, '132'),
(8, '资源管理', NULL, '', 0, 1, 0, '2'),
(9, '资源录入', NULL, '/adResource/formpage.html', 8, 1, 0, '211'),
(10, '资源列表', NULL, '/adResource/adResourceList.html', 8, 1, 0, '212'),
(13, '查看权限', NULL, '/role/roleFormpage.html', 1, 0, 0, '124'),
(14, '设置角色权限', NULL, '/role/setRoleMenu.html', 1, 0, 0, '125'),
(15, '新增菜单', NULL, '/menu/formpage.html', 1, 0, 0, '133'),
(16, '查找菜单', NULL, '/menu/getMenu.html', 1, 0, 0, '134'),
(17, '修改菜单', NULL, '/menu/updateMenu.html', 1, 0, 0, '135'),
(18, '查找资源', NULL, '/adResource/getAdResource.html', 8, 0, 0, '213'),
(19, '展示资源', NULL, '/adResource/showAdResource.html', 8, 0, 0, '214'),
(21, '修改资源', NULL, '/adResource/updateAdResource.html', 8, 0, 0, '216'),
(22, '编辑用户', NULL, '/user/editUser.html', 1, 0, 0, '114'),
(23, '修改用户角色&状态', NULL, '/user/updateUserRoleAndStatus.html', 1, 0, 0, '115'),
(24, '重置密码', NULL, '/ajax/updateUser.html', 1, 0, 0, '116'),
(25, '检测用户名', NULL, '/hasUser.html', 1, 0, 0, '117'),
(26, '开发者应用', NULL, '', 0, 1, 0, '3'),
(27, '应用上传', NULL, '/appInfo/formpage.html', 26, 1, 0, '311'),
(28, '上传应用action', NULL, '/appInfo/addAppInfo.html', 26, 0, 0, '312'),
(29, '应用列表', '开发者个人应用列表', '/appInfo/listAppInfo.html', 26, 1, 0, '313'),
(30, '查询应用', NULL, '/appInfo/selectAppInfo.html', 26, 0, 0, '314'),
(31, '修改应用', NULL, '/appInfo/updateAppInfo.html', 26, 0, 0, '315'),
(32, '删除应用', NULL, '/appInfo/deleteAppInfo.html', 26, 0, 0, '316'),
(33, '应用列表', '所有开发者应用列表', '/appInfo/listAppInfoAll.html', 26, 1, 0, '313'),
(34, 'SDK报表', NULL, '', 0, 1, 0, '4'),
(35, '用户报表', NULL, '/report/userDayReport.html', 34, 0, 0, '411'),
(36, '应用安装上报报表', NULL, '/report/appInstallReport.html', 34, 0, 0, '412'),
(37, '报表列管理', NULL, '', 0, 0, 0, '5'),
(38, 'column列表', NULL, '/gridColumn/list.html', 37, 0, 0, '511'),
(39, 'add报表列', NULL, '/gridColumn/formAdd.html', 37, 0, 0, '512'),
(40, 'add报表列action', NULL, '/gridColumn/add.html', 37, 0, 0, '513'),
(41, 'update报表列', NULL, '/gridColumn/formUpdate.html', 37, 0, 0, '514'),
(42, 'update报表列action', NULL, '/gridColumn/update.html', 37, 0, 0, '515'),
(43, 'delete报表列', NULL, '/gridColumn/delete.html', 37, 0, 0, '516'),
(44, '渠道报表', NULL, '', 0, 0, 0, '6'),
(45, '渠道列表', NULL, '/user/listChannelUser.html', 1, 0, 0, '118'),
(46, '新增支付项目', '', '/amountItem/form.html', 1, 0, 0, '141'),
(47, '新增支付项目action', NULL, '/amountItem/add.html', 1, 0, 0, '142'),
(48, '支付项目列表', NULL, '/amountItem/list.html', 1, 0, 0, '143'),
(49, '修改支付项目', NULL, '/amountItem/updateForm.html', 1, 0, 0, '144'),
(50, '修改支付项目action', NULL, '/amountItem/update.html', 1, 0, 0, '145'),
(51, '删除支付项目', NULL, '/amountItem/delete.html', 1, 0, 0, '146'),
(52, '支付报表', '渠道本身的支付报表 —— 对外', '/report/channelAmountReport.html', 44, 0, 0, '611'),
(53, '支付报表', '所有渠道支付报表 —— 对内', '/report/allChannelAmountReport.html', 44, 0, 0, '612'),
(66, '财务中心', '', '', 0, 1, 0, '0'),
(67, '帐户管理', '', '', 0, 1, 0, '0'),
(68, '财务信息', '', '/financial/overview', 66, 1, 0, '0'),
(69, '财务明细', '', '/financial/accounts', 66, 1, 0, '0'),
(70, '申请汇款', '', '/financial/remittance', 66, 1, 0, '0'),
(71, '汇款记录', '', '/financial/remittance_history', 66, 1, 0, '0'),
(72, '收入报表', '', '', 0, 1, 0, '0'),
(73, '广告报表', '', '', 0, 1, 0, '0'),
(74, '小时统计', '', '', 72, 0, 0, '0'),
(75, '每日统计', '', '/report/incoming/daily', 72, 1, 0, '0'),
(76, '每月统计', '', '/report/incoming/monthly', 72, 1, 0, '0'),
(77, '广告推送', '', '/report/advert/pushes', 73, 1, 0, '0'),
(78, '应用内广告', '', '/report/advert/advertising', 73, 1, 0, '0'),
(79, '个人资料', '', '/accounts/overview', 67, 1, 0, '0'),
(80, '修改Email', '', '/accounts/change_email', 67, 1, 0, '0'),
(81, '修改资料', '', '/accounts/change_profile', 67, 1, 0, '0'),
(82, '修改密码', '', '/accounts/change_pwd', 67, 1, 0, '0'),
(83, '用户渠道', '', '', 0, 1, 0, '0'),
(84, '添加用户渠道', '', '', 83, 1, 0, '0'),
(85, '用户渠道列表', '', '', 83, 1, 0, '0'),
(86, '添加厂商', '', '', 83, 1, 0, '0'),
(87, '厂商列表', '', '', 83, 1, 0, '0'),
(88, '用户审核', '', '', 0, 1, 0, '0'),
(89, '用户注册资料列表', '', '', 88, 1, 0, '0'),
(90, '渠道管理', '', '', 0, 1, 0, '0'),
(91, '添加渠道', '', '', 90, 1, 0, '0'),
(92, '修改渠道', '', '', 90, 0, 0, '0'),
(93, '渠道列表', '', '', 90, 1, 0, '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
