/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : daproject

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-06-21 18:50:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dp_free_cost_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_free_cost_user`;
CREATE TABLE `dp_free_cost_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` char(11) NOT NULL,
  `create_at` int(11) NOT NULL,
  `update_at` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `手机号` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
