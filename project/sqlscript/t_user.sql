-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 07 月 05 日 02:12
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
  `_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`),
  UNIQUE KEY `id_UNIQUE` (`uid`),
  UNIQUE KEY `id_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`uid`, `account_name`, `account_pwd`, `email`, `type`, `company`, `contact_name`, `contact_tel`, `qq`, `website`, `createtime`, `login_token`, `login_token_time`, `_status`) VALUES
(22, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '144@qq.com', 1, '', '覃建栋', '13631661621', NULL, '', '2013-06-02 17:43:46', 'f1482b3e36d648f48b334b7f9724a2a7', '2013-07-05 08:02:51', 0),
(23, 'admin2', '4297F44B13955235245B2497399D7A93', 'www@qq.com', 4, '', '', '', NULL, '', '2013-06-02 17:47:41', 'a83959f8738a42a3b766d914171840e8', '2013-06-17 15:21:22', 0),
(28, 'ageage', '4297F44B13955235245B2497399D7A93', 'jiandong2@powerallnetworks.com', 2, '', '', '', '', '', '2013-06-08 13:23:58', NULL, NULL, 0),
(24, 'baidu', '4297F44B13955235245B2497399D7A93', '142224@qq.com', 1, '', '', '', '', '', '2013-06-07 00:57:00', '8e96e54364e74c55bb2d285e5d0662ae', '2013-06-07 00:57:08', 0),
(19, 'demo01', '4297F44B13955235245B2497399D7A93', '1243@qq.com', 1, '', 'hello', '123123123', '1312312', 'www.baidu.com', '2013-05-28 16:51:03', 'c320decbc978488fbd1abf1cba3e4aa9', '2013-06-07 01:00:38', 0),
(30, 'jd_yygl', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandongee@powerallnetworks.com', 2, '', '覃建栋', '13631661621', NULL, 'http://localhost:8081/', '2013-07-05 07:48:18', 'c512f978b13e43bebb7ec4bdde46f536', '2013-07-05 07:55:47', 0),
(20, 'jiandong', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiandong@powerallnetworks.com', 4, 'Powerall networks', '覃建栋', '13631661621', NULL, 'http://localhost:8081/', '2013-05-29 22:42:25', 'b5ba0fd7a0a644c0b2c47370e30bdec0', '2013-07-05 08:10:00', 0),
(25, 'jiandong1', 'E10ADC3949BA59ABBE56E057F20F883E', 'qinjiandong2010@gmail.com', 2, 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 10:30:27', NULL, NULL, 0),
(18, 'kewiyi', '4297F44B13955235245B2497399D7A93', '123@qq.com', 1, '', NULL, NULL, NULL, NULL, '2013-05-28 13:25:56', 'e2a042d3920049b8b6304d455f0dc0cf', '2013-06-07 01:00:27', 0),
(26, 'test11', '4297F44B13955235245B2497399D7A93', 'jiandong4@powerallnetworks.com', 2, 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 10:58:14', NULL, NULL, 0),
(29, 'test3', 'E10ADC3949BA59ABBE56E057F20F883E', '', 0, NULL, '', '', NULL, '', '2013-06-30 15:46:22', NULL, NULL, 0),
(27, 'test334346', '4297F44B13955235245B2497399D7A93', 'jiandong5@powerallnetworks.com', 2, 'Powerall networks', '覃建栋', '13631661621', '63559854', '深圳市南山区振业国际大厦10楼1001', '2013-06-08 13:20:36', '71e8632d9d4d482eba074507030cdf7e', '2013-06-08 13:22:33', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
