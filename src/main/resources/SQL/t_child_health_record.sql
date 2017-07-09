/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : lingzhu

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-04-09 12:57:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_child_health_record
-- ----------------------------
DROP TABLE IF EXISTS `t_child_health_record`;
CREATE TABLE `t_child_health_record` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `weixin_openid` varchar(100) NOT NULL,
  `child_name` varchar(100) NOT NULL,
  `child_sex` varchar(100) NOT NULL,
  `child_birth` varchar(100) NOT NULL,
  `child_age` varchar(100) NOT NULL,
  `child_height` varchar(100) NOT NULL,
  `child_weight` varchar(100) NOT NULL,
  `update_date` varchar(100) NOT NULL,
  `create_time` bigint(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_child_health_record
-- ----------------------------
INSERT INTO `t_child_health_record` VALUES ('1', 'test_o08GJwa_rYPdbwV6jDi2ZTaXyJ6s', '宋嘉诚', '男', '2013/06/29', '47月', '100', '15', '2017-04-09 12:54:33', '20170409125433');
