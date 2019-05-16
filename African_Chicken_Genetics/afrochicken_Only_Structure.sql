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

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `diseaseID` int(11) NOT NULL default '0',
  `diseaseName` varchar(50) NOT NULL,
  PRIMARY KEY  (`diseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
