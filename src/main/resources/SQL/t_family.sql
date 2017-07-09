/*
Navicat MySQL Data Transfer

Source Server         : localhost1
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : lingzhu

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-06-19 23:47:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_family
-- ----------------------------
DROP TABLE IF EXISTS `t_family`;
CREATE TABLE `t_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `lunar_birth` varchar(255) DEFAULT NULL,
  `lunar_birth2` varchar(20) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `remind_date` varchar(255) DEFAULT NULL,
  `animals_year` varchar(20) DEFAULT NULL,
  `m_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_family
-- ----------------------------
INSERT INTO `t_family` VALUES ('1', '宋明磊', '1984-1-14', '腊月十二', '1983-12-12', '33', null, '猪', '2017-06-19');
INSERT INTO `t_family` VALUES ('2', '宋得军', '1960-5-25', '五月初一', '1960-5-1', '57', null, '鼠', '2017-06-19');
INSERT INTO `t_family` VALUES ('3', '宋美文', '1960-12-23', '十一月初六', '1960-11-6', '57', null, '鼠', '2017-06-19');
INSERT INTO `t_family` VALUES ('4', '宋嘉诚', '2013-6-29', '五月廿二', '2013-5-22', '4', null, '蛇', '2017-06-19');
INSERT INTO `t_family` VALUES ('5', '李田田', '1987-10-4', '八月十二', '1987-8-12', '30', null, '兔', '2017-06-19');
INSERT INTO `t_family` VALUES ('6', '李柱风', '1965-10-23', '九月廿九', '1965-9-29', '52', null, '蛇', '2017-06-19');
INSERT INTO `t_family` VALUES ('7', '淮凤英', '1964-10-21', '九月十六', '1964-9-16', '53', '', '龙', '2017-06-19');
INSERT INTO `t_family` VALUES ('8', '李浩轩', '1989-2-18', '正月十三', '1989-1-13', '28', null, '蛇', '2017-06-19');
INSERT INTO `t_family` VALUES ('9', '李翠', '1984-11-29', '闰十月初七', '1984-10-7', '33', null, '鼠', '2017-06-19');
