-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2015 at 02:57 AM
-- Server version: 5.0.67-community-nt
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `afrochicken`
--

-- --------------------------------------------------------

--
-- Table structure for table `brood`
--

CREATE TABLE IF NOT EXISTS `brood` (
  `farmerID` varchar(50) NOT NULL default '',
  `chickenBreed` varchar(50) NOT NULL,
  `broodType` varchar(50) NOT NULL,
  `noOfChickens` int(11) default NULL,
  `DateBought` varchar(50) default '',
  `DateSold` varchar(50) default '',
  PRIMARY KEY  (`chickenBreed`,`farmerID`),
  KEY `farmerID` (`farmerID`,`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brood`
--

INSERT INTO `brood` (`farmerID`, `chickenBreed`, `broodType`, `noOfChickens`, `DateBought`, `DateSold`) VALUES
('far_1', 'Australorp', 'A', 100, '11/12/2014', '17/04/2015'),
('far_3', 'Australorp', 'B', 21, '08/02/2015', '02/03/2015'),
('far_1', 'Cubalaya', 'A', 8, '19/01/2015', '02/03/2015'),
('far_3', 'Cubalaya', 'A', 11, '10/11/2014', '02/03/2015'),
('far_4', 'Cubalaya', 'D', 25, '11/12/2014', '17/04/2015'),
('far_1', 'Cypriot Chicken', 'C', 12, '08/02/2015', '02/03/2015'),
('far_2', 'Cypriot Chicken', 'A', 9, '17/04/2015', '02/03/2015'),
('far_4', 'Cypriot Chicken', 'A', 14, '19/01/2015', '02/03/2015'),
('far_2', 'Dokki', 'A', 21, '17/04/2015', '02/03/2015'),
('far_5', 'Dokki', 'A', 21, '08/02/2015', '17/04/2015'),
('far_3', 'Ingriido', 'D', 18, '22/01/2015', '17/04/2015'),
('far_5', 'Ingriido', 'A', 22, '19/01/2015', NULL),
('far_2', 'Silkie ', 'A', 13, '19/01/2015', '02/03/2015'),
('far_4', 'Silkie ', 'B', 22, '08/02/2015', NULL),
('far_5', 'Silkie ', 'B', 12, '22/01/2015', '02/03/2015');

-- --------------------------------------------------------

--
-- Table structure for table `chicken`
--

CREATE TABLE IF NOT EXISTS `chicken` (
  `chickenBreed` varchar(50) NOT NULL default '',
  `size` varchar(50) default NULL,
  `skinColor` varchar(50) default NULL,
  `noOfToes` int(11) default NULL,
  `amountOfFeathering` varchar(50) default NULL,
  `placeOfOrigin` varchar(50) default NULL,
  PRIMARY KEY  (`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chicken`
--

INSERT INTO `chicken` (`chickenBreed`, `size`, `skinColor`, `noOfToes`, `amountOfFeathering`, `placeOfOrigin`) VALUES
('Australorp', '21', 'red', 3, 'medium', 'Australia'),
('Cubalaya', '20', 'red/black', 3, 'medium', 'Cuba'),
('Cypriot Chicken', '11', 'black', 2, 'small', 'Cyprus'),
('Dokki', '17', 'light green', 4, 'small', 'Egypt'),
('Ingriido', '34', 'yellow', 2, 'medium', 'Afganistan'),
('Silkie ', '24', 'white', 2, 'large', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `chickenuse`
--

CREATE TABLE IF NOT EXISTS `chickenuse` (
  `chickenBreed` varchar(50) NOT NULL default '',
  `use` varchar(50) NOT NULL,
  PRIMARY KEY  (`chickenBreed`,`use`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countryCode` varchar(50) NOT NULL default '',
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryCode`, `name`) VALUES
('et', 'Ethiopia'),
('tz', 'Tanzania'),
('ug', 'Uganda');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `diseaseID` int(11) NOT NULL default '0',
  `diseaseName` varchar(50) NOT NULL,
  PRIMARY KEY  (`diseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`diseaseID`, `diseaseName`) VALUES
(1, 'Amyloidosis'),
(2, 'Duck Septicaemia'),
(3, 'Arizonosis'),
(4, 'Heat Stress'),
(5, 'Hydropericardium-Hepatitis Syndrome'),
(6, 'Turkey Viral Hepatitis'),
(7, 'Haemorrhagic Anaemia');

-- --------------------------------------------------------

--
-- Table structure for table `diseaseoutbreak`
--

CREATE TABLE IF NOT EXISTS `diseaseoutbreak` (
  `outBreakID` int(11) NOT NULL default '0',
  `diseaseID` int(11) NOT NULL default '0',
  `farmerID` varchar(50) NOT NULL default '',
  `chickenBreed` varchar(50) NOT NULL default '',
  `noOfDeadChickens` int(11) default NULL,
  PRIMARY KEY  (`diseaseID`,`farmerID`,`chickenBreed`,`outBreakID`),
  KEY `FK_outbreak_brood` (`farmerID`,`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diseaseoutbreak`
--

INSERT INTO `diseaseoutbreak` (`outBreakID`, `diseaseID`, `farmerID`, `chickenBreed`, `noOfDeadChickens`) VALUES
(1, 3, 'far_1', 'Australorp', 10),
(2, 3, 'far_1', 'Australorp', 2),
(3, 4, 'far_1', 'Australorp', 7),
(1, 5, 'far_2', 'Cypriot Chicken', 4),
(2, 5, 'far_2', 'Cypriot Chicken', 3),
(3, 5, 'far_2', 'Cypriot Chicken', 11);

-- --------------------------------------------------------

--
-- Table structure for table `diseasevaccinated`
--

CREATE TABLE IF NOT EXISTS `diseasevaccinated` (
  `diseaseID` int(11) NOT NULL default '0',
  `farmerID` varchar(50) NOT NULL default '',
  `chickenBreed` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`diseaseID`,`farmerID`,`chickenBreed`),
  KEY `FK_brood_disvac` (`farmerID`,`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `districtNumber` int(11) NOT NULL default '0',
  `zoneNumber` int(11) NOT NULL default '0',
  `countryCode` varchar(50) NOT NULL default '',
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`districtNumber`,`zoneNumber`,`countryCode`),
  KEY `FK_Zone_District` (`zoneNumber`,`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`districtNumber`, `zoneNumber`, `countryCode`, `name`) VALUES
(1, 1, 'et', 'district_aaa'),
(1, 1, 'tz', 'district_fff'),
(1, 1, 'ug', 'district_kkk'),
(2, 1, 'et', 'district_bbb'),
(2, 1, 'tz', 'district_ggg'),
(2, 1, 'ug', 'district_lll'),
(3, 1, 'et', 'district_ccc'),
(3, 1, 'tz', 'district_hhh'),
(3, 1, 'ug', 'district_mmm'),
(4, 1, 'et', 'district_ddd'),
(4, 1, 'tz', 'district_iii'),
(4, 1, 'ug', 'district_nnn'),
(5, 1, 'et', 'district_eee'),
(5, 1, 'tz', 'district_jjj'),
(5, 1, 'ug', 'district_ooo');

-- --------------------------------------------------------

--
-- Table structure for table `egg`
--

CREATE TABLE IF NOT EXISTS `egg` (
  `weekNumber` int(11) NOT NULL default '0',
  `farmerID` varchar(50) default NULL,
  `chickenBreed` varchar(50) default NULL,
  `numberOfEggs` int(11) default NULL,
  PRIMARY KEY  (`weekNumber`),
  KEY `FK_brood_egg` (`farmerID`,`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `egg`
--

INSERT INTO `egg` (`weekNumber`, `farmerID`, `chickenBreed`, `numberOfEggs`) VALUES
(21, 'far_1', 'Australorp', 20),
(22, 'far_1', 'Australorp', 40),
(23, 'far_1', 'Australorp', 72),
(24, 'far_1', 'Australorp', 136),
(25, 'far_1', 'Australorp', 208),
(26, 'far_1', 'Australorp', 260),
(27, 'far_1', 'Australorp', 296),
(28, 'far_1', 'Australorp', 336),
(29, 'far_1', 'Australorp', 352),
(30, 'far_1', 'Australorp', 368),
(31, 'far_1', 'Australorp', 376);

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE IF NOT EXISTS `farmer` (
  `farmerID` varchar(50) NOT NULL default '',
  `farmerName` varchar(50) default NULL,
  `location` varchar(50) default NULL,
  `positionX` float default NULL,
  `positionY` float default NULL,
  `postionZ` float default NULL,
  `villageNumber` int(11) default NULL,
  `districtNumber` int(11) default NULL,
  `zoneNumber` int(11) default NULL,
  `countryCode` varchar(50) default NULL,
  PRIMARY KEY  (`farmerID`),
  KEY `FK_village_Farmer` (`villageNumber`,`districtNumber`,`zoneNumber`,`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`farmerID`, `farmerName`, `location`, `positionX`, `positionY`, `postionZ`, `villageNumber`, `districtNumber`, `zoneNumber`, `countryCode`) VALUES
('far_1', 'Abebe Dinka', 'Dembi Dolo', 25, 24, 121, 1, 1, 1, 'et'),
('far_10', 'tanzaniafarmer5', 'tanzcity a', 230, 231, 29, 1, 1, 1, 'tz'),
('far_11', 'ugandafarmer1', 'ugacity a', 11, 25, 61, 1, 1, 1, 'ug'),
('far_12', 'ugandafarmer2', 'ugacity b', 211, 44, 255, 1, 1, 1, 'ug'),
('far_13', 'ugandafarmer3', 'ugacity c', 56, 2, 311, 1, 1, 1, 'ug'),
('far_14', 'ugandafarmer4', 'ugacity d', 99, 33, 88, 1, 1, 1, 'ug'),
('far_15', 'ugandafarmer5', 'ugacity c', 22, 234, 333, 1, 1, 1, 'ug'),
('far_2', 'Tolosa Kebede', 'Adama', 24, 123, 77, 1, 1, 1, 'et'),
('far_3', 'Tesfay Gidey', 'Assela', 77, 124, 177, 1, 1, 1, 'et'),
('far_4', 'Agonafer Tekle', 'Dembi Dollo', 122, 33, 132, 1, 1, 1, 'et'),
('far_5', 'Shewaye Mesfin', 'Debrebirhan', 11, 123, 67, 1, 1, 1, 'et'),
('far_6', 'tanzaniafarmer1', 'tanzcity a', 232, 234, 32, 1, 1, 1, 'tz'),
('far_7', 'tanzaniafarmer2', 'tanzcity b', 323, 23, 133, 1, 1, 1, 'tz'),
('far_8', 'tanzaniafarmer3', 'tanzcity c', 111, 78, 288, 1, 1, 1, 'tz'),
('far_9', 'tanzaniafarmer4', 'tanzcity b', 321, 21, 100, 1, 1, 1, 'tz');

-- --------------------------------------------------------

--
-- Table structure for table `feeding`
--

CREATE TABLE IF NOT EXISTS `feeding` (
  `weekNumber` int(11) NOT NULL default '0',
  `farmerID` varchar(50) default NULL,
  `chickenBreed` varchar(50) default NULL,
  `foodType` varchar(50) default NULL,
  `amount` varchar(50) default NULL,
  PRIMARY KEY  (`weekNumber`),
  KEY `FK_brood_Feeding` (`farmerID`,`chickenBreed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subnationalzone`
--

CREATE TABLE IF NOT EXISTS `subnationalzone` (
  `zoneNumber` int(11) NOT NULL default '0',
  `countryCode` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`zoneNumber`,`countryCode`),
  KEY `FK_Country_Zone` (`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subnationalzone`
--

INSERT INTO `subnationalzone` (`zoneNumber`, `countryCode`, `name`) VALUES
(1, 'et', 'zone_aaa'),
(1, 'tz', 'zone_ppp'),
(1, 'ug', 'zone_fff'),
(2, 'et', 'zone_bbb'),
(2, 'tz', 'zone_qqq'),
(2, 'ug', 'zone_ggg'),
(3, 'et', 'zone_ccc'),
(3, 'tz', 'zone_rrr'),
(3, 'ug', 'zone_hhh');

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE IF NOT EXISTS `village` (
  `villageNumber` int(50) NOT NULL default '0',
  `districtNumer` int(11) NOT NULL default '0',
  `zoneNumber` int(11) NOT NULL default '0',
  `countryCode` varchar(50) NOT NULL default '',
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`villageNumber`,`districtNumer`,`zoneNumber`,`countryCode`),
  KEY `FK_district_village` (`districtNumer`,`zoneNumber`,`countryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `village`
--

INSERT INTO `village` (`villageNumber`, `districtNumer`, `zoneNumber`, `countryCode`, `name`) VALUES
(1, 1, 1, 'et', 'village_aaa'),
(1, 1, 1, 'tz', 'village_fff'),
(1, 1, 1, 'ug', 'village_kkk'),
(2, 1, 1, 'et', 'village_bbb'),
(2, 1, 1, 'tz', 'village_ggg'),
(2, 1, 1, 'ug', 'village_lll'),
(3, 1, 1, 'et', 'village_ccc'),
(3, 1, 1, 'tz', 'village_hhh'),
(3, 1, 1, 'ug', 'village_mmm'),
(4, 1, 1, 'et', 'village_ddd'),
(4, 1, 1, 'tz', 'village_iii'),
(4, 1, 1, 'ug', 'village_nnn'),
(5, 1, 1, 'et', 'village_eee'),
(5, 1, 1, 'tz', 'village_jjj'),
(5, 1, 1, 'ug', 'village_ooo');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brood`
--
ALTER TABLE `brood`
  ADD CONSTRAINT `FK_chicken_brood` FOREIGN KEY (`chickenBreed`) REFERENCES `chicken` (`chickenBreed`),
  ADD CONSTRAINT `FK_farmer_brood` FOREIGN KEY (`farmerID`) REFERENCES `farmer` (`farmerID`);

--
-- Constraints for table `chickenuse`
--
ALTER TABLE `chickenuse`
  ADD CONSTRAINT `FK_chicken_chickenbreed` FOREIGN KEY (`chickenBreed`) REFERENCES `chicken` (`chickenBreed`);

--
-- Constraints for table `diseaseoutbreak`
--
ALTER TABLE `diseaseoutbreak`
  ADD CONSTRAINT `FK_Dis_dis_out` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`diseaseID`),
  ADD CONSTRAINT `FK_outbreak_brood` FOREIGN KEY (`farmerID`, `chickenBreed`) REFERENCES `brood` (`farmerID`, `chickenBreed`);

--
-- Constraints for table `diseasevaccinated`
--
ALTER TABLE `diseasevaccinated`
  ADD CONSTRAINT `FK_brood_disvac` FOREIGN KEY (`farmerID`, `chickenBreed`) REFERENCES `brood` (`farmerID`, `chickenBreed`),
  ADD CONSTRAINT `FK_dis_disvac` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`diseaseID`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `FK_Zone_District` FOREIGN KEY (`zoneNumber`, `countryCode`) REFERENCES `subnationalzone` (`zoneNumber`, `countryCode`);

--
-- Constraints for table `egg`
--
ALTER TABLE `egg`
  ADD CONSTRAINT `FK_brood_egg` FOREIGN KEY (`farmerID`, `chickenBreed`) REFERENCES `brood` (`farmerID`, `chickenBreed`);

--
-- Constraints for table `farmer`
--
ALTER TABLE `farmer`
  ADD CONSTRAINT `FK_village_Farmer` FOREIGN KEY (`villageNumber`, `districtNumber`, `zoneNumber`, `countryCode`) REFERENCES `village` (`villageNumber`, `districtNumer`, `zoneNumber`, `countryCode`);

--
-- Constraints for table `feeding`
--
ALTER TABLE `feeding`
  ADD CONSTRAINT `FK_brood_Feeding` FOREIGN KEY (`farmerID`, `chickenBreed`) REFERENCES `brood` (`farmerID`, `chickenBreed`);

--
-- Constraints for table `subnationalzone`
--
ALTER TABLE `subnationalzone`
  ADD CONSTRAINT `FK_Country_Zone` FOREIGN KEY (`countryCode`) REFERENCES `country` (`countryCode`);

--
-- Constraints for table `village`
--
ALTER TABLE `village`
  ADD CONSTRAINT `FK_district_village` FOREIGN KEY (`districtNumer`, `zoneNumber`, `countryCode`) REFERENCES `district` (`districtNumber`, `zoneNumber`, `countryCode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
