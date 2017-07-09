/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : lingzhu

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-04-02 17:44:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_exchange
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange`;
CREATE TABLE `t_exchange` (
  `id` int(100) DEFAULT NULL,
  `exchange` varchar(4000) NOT NULL,
  `expires_in` varchar(100) DEFAULT NULL,
  `create_time` bigint(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_exchange
-- ----------------------------
INSERT INTO `t_exchange` VALUES ('1', '{\"success\":\"1\",\"result\":{\"JPY\":{\"curno\":\"JPY\",\"curnm\":\"日元\",\"BOC\":{\"bankno\":\"BOC\",\"banknm\":\"中国银行\",\"se_sell\":\"6.2065\",\"se_buy\":\"6.1633\",\"cn_sell\":\"6.2065\",\"cn_buy\":\"5.9713\",\"middle\":\"6.1766\",\"upddate\":\"2017-04-02 10:30:00\"},\"CCB\":{\"bankno\":\"CCB\",\"banknm\":\"建设银行\",\"se_sell\":\"6.2092\",\"se_buy\":\"6.1622\",\"cn_sell\":\"6.2092\",\"cn_buy\":\"5.9859\",\"middle\":\"6.1838\",\"upddate\":\"2017-04-02 09:29:01\"},\"ICBC\":{\"bankno\":\"ICBC\",\"banknm\":\"工商银行\",\"se_sell\":\"6.2117\",\"se_buy\":\"6.1678\",\"cn_sell\":\"6.2117\",\"cn_buy\":\"6.0094\",\"middle\":\"0.0000\",\"upddate\":\"2017-04-01 04:09:57\"},\"ABC\":{\"bankno\":\"ABC\",\"banknm\":\"农业银行\",\"se_sell\":\"6.2070\",\"se_buy\":\"6.1640\",\"cn_sell\":\"0.0000\",\"cn_buy\":\"5.9730\",\"middle\":\"0.0000\",\"upddate\":\"2017-04-02 16:02:18\"},\"CEB\":{\"bankno\":\"CEB\",\"banknm\":\"光大银行\",\"se_sell\":\"6.2073\",\"se_buy\":\"6.1579\",\"cn_sell\":\"6.2073\",\"cn_buy\":\"5.9600\",\"middle\":\"0.0000\",\"upddate\":\"2017-04-01 07:00:00\"}}}}', '1491121120666', '1491121120666');
