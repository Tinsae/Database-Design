/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100137
Source Host           : localhost:3306
Source Database       : testchegg

Target Server Type    : MYSQL
Target Server Version : 100137
File Encoding         : 65001

Date: 2019-04-21 14:20:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adolescent
-- ----------------------------
DROP TABLE IF EXISTS `adolescent`;
CREATE TABLE `adolescent` (
  `PATIENT_ID` int(11) NOT NULL,
  `ADOLESCENT_GRADE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  CONSTRAINT `FK_pateint_adolescent` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adolescent
-- ----------------------------

-- ----------------------------
-- Table structure for baby
-- ----------------------------
DROP TABLE IF EXISTS `baby`;
CREATE TABLE `baby` (
  `PATIENT_ID` int(11) NOT NULL,
  `BABY_WEIGHT` float(2,2) DEFAULT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  CONSTRAINT `FK_pateint_baby` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of baby
-- ----------------------------

-- ----------------------------
-- Table structure for caretaker
-- ----------------------------
DROP TABLE IF EXISTS `caretaker`;
CREATE TABLE `caretaker` (
  `CARETAKER_ID` int(11) NOT NULL,
  `CARETAKER_FIRST` varchar(50) DEFAULT NULL,
  `CARETAKER_LAST` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CARETAKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caretaker
-- ----------------------------

-- ----------------------------
-- Table structure for elderly
-- ----------------------------
DROP TABLE IF EXISTS `elderly`;
CREATE TABLE `elderly` (
  `PATIENT_ID` int(11) NOT NULL,
  `ELDERLY_DISA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PATIENT_ID`),
  CONSTRAINT `FK_pateint_elderly` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of elderly
-- ----------------------------

-- ----------------------------
-- Table structure for elderly_taker
-- ----------------------------
DROP TABLE IF EXISTS `elderly_taker`;
CREATE TABLE `elderly_taker` (
  `PATIENT_ID` int(11) NOT NULL,
  `CARETAKER_ID` int(11) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`,`CARETAKER_ID`),
  KEY `FK_caretaker_elderlytaker` (`CARETAKER_ID`),
  CONSTRAINT `FK_caretaker_elderlytaker` FOREIGN KEY (`CARETAKER_ID`) REFERENCES `caretaker` (`CARETAKER_ID`),
  CONSTRAINT `FK_elderly_elderlytaker` FOREIGN KEY (`PATIENT_ID`) REFERENCES `elderly` (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of elderly_taker
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `PATIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PATIENT_ID_DESC` varchar(20) DEFAULT NULL,
  `PATIENT_FIRST` varchar(40) DEFAULT NULL,
  `PATIENT_LAST` varchar(40) DEFAULT NULL,
  `PATIENT_AGE` int(20) NOT NULL,
  `PATIENT_ID_CODE` int(6) NOT NULL,
  PRIMARY KEY (`PATIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of patient
-- ----------------------------

-- ----------------------------
-- Table structure for patient_id
-- ----------------------------
DROP TABLE IF EXISTS `patient_id`;
CREATE TABLE `patient_id` (
  `PATIENT_ID_CODE` int(6) NOT NULL AUTO_INCREMENT,
  `PATIENT_ID_DESC` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PATIENT_ID_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of patient_id
-- ----------------------------
