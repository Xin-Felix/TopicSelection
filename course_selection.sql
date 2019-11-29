/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : course_selection

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-11-29 16:46:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `admin_level` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `admin_type` varchar(255) NOT NULL DEFAULT '1',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for choose_message
-- ----------------------------
DROP TABLE IF EXISTS `choose_message`;
CREATE TABLE `choose_message` (
  `choose_id` int(11) NOT NULL AUTO_INCREMENT,
  `choose_question_id` int(11) NOT NULL,
  `choose_student_id` int(11) NOT NULL,
  `choose_teacher_id` int(11) NOT NULL,
  `choose_teacher_result` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`choose_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for question_message
-- ----------------------------
DROP TABLE IF EXISTS `question_message`;
CREATE TABLE `question_message` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title_source` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title_background` longtext CHARACTER SET utf8 NOT NULL,
  `title_content` longtext CHARACTER SET utf8 NOT NULL,
  `title_require` longtext CHARACTER SET utf8 NOT NULL,
  `title_result` int(11) NOT NULL DEFAULT '1',
  `teacher_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `question_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_message
-- ----------------------------
DROP TABLE IF EXISTS `student_message`;
CREATE TABLE `student_message` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_major` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `student_qq` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for teacher_message
-- ----------------------------
DROP TABLE IF EXISTS `teacher_message`;
CREATE TABLE `teacher_message` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teacher_password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teacher_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teacher_level` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teacher_direction` varchar(255) CHARACTER SET utf8 NOT NULL,
  `teacher_source` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
