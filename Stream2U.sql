-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2019 at 01:24 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.3.3-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Stream2U`
--

-- --------------------------------------------------------

--
-- Table structure for table `Actors`
--

CREATE TABLE `Actors` (
  `actorID` int(255) NOT NULL,
  `actorName` char(255) NOT NULL,
  `gender` char(1) NOT NULL,
  `dpURL` varchar(255) NOT NULL,
  `profileAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Actors`
--

INSERT INTO `Actors` (`actorID`, `actorName`, `gender`, `dpURL`, `profileAddress`) VALUES
(1, 'Scarlett Johnosson', 'F', 'https://static.comicvine.com/uploads/original/0/77/4353098-scarlett-johansson-pictures-e1317279571423.jpg', 'https://www.imdb.com/name/nm0424060/'),
(2, 'Robert Drowney Jr.', 'M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg/1200px-Robert_Downey_Jr_2014_Comic_Con_%28cropped%29.jpg', 'https://www.imdb.com/name/nm0000375/?ref_=nv_sr_1?ref_=nv_sr_1'),
(3, 'Felix Keilberg', 'M', 'https://cdn1.tnwcdn.com/wp-content/blogs.dir/1/files/2016/01/PewDiePie.jpg', 'https://www.youtube.com/channel/UC-lHJZR3Gqxm24_Vd_AJ5Yw'),
(4, 'Anthony Padilla', 'M', 'http://ethnicelebs.com/wp-content/uploads/2016/06/KHI-003413-Anthony-Padilla-400x600.jpg', 'https://www.youtube.com/user/smosh'),
(5, 'Ian Hecox', 'M', 'https://www.famousbirthdays.com/headshots/ian-hecox-3.jpg', 'https://www.youtube.com/user/smosh'),
(6, 'Gal Gadot', 'F', 'http://thefappeningblog.com/wp-content/uploads/2018/01/Gal-Gadot-Sexy-7-thefappeningblog.com_-749x1024.jpg', 'https://www.imdb.com/name/nm2933757/'),
(7, 'Emilia Clarke', 'F', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Emilia_Clarke_by_Gage_Skidmore_2_%28cropped%29.jpg/1200px-Emilia_Clarke_by_Gage_Skidmore_2_%28cropped%29.jpg', 'https://www.imdb.com/name/nm3592338/?ref_=nv_sr_1?ref_=nv_sr_1');

-- --------------------------------------------------------

--
-- Table structure for table `Cast`
--

CREATE TABLE `Cast` (
  `contentID` int(11) NOT NULL,
  `actorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cast`
--

INSERT INTO `Cast` (`contentID`, `actorID`) VALUES
(1, 2),
(1, 4),
(1, 5),
(2, 6),
(2, 3),
(3, 7),
(3, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 5),
(5, 6),
(5, 7),
(6, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Channel`
--

CREATE TABLE `Channel` (
  `channelID` int(11) NOT NULL,
  `channelName` varchar(255) NOT NULL,
  `channelDesc` varchar(255) NOT NULL,
  `channelFollowers` int(11) NOT NULL,
  `interaction_per_user` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Channel`
--

INSERT INTO `Channel` (`channelID`, `channelName`, `channelDesc`, `channelFollowers`, `interaction_per_user`) VALUES
(1, 'Pewdiepie', 'Felix Arvid Ulf Kjellberg, known online as PewDiePie, is a Swedish YouTube personality and game commentator. He has been known for his Let\'s Play commentaries and vlogs, as well as for having the most subscribed channel.', 9200000, 10),
(2, 'Creepy Pasta', 'Creepypastas are horror-related legends or images that have been copied and pasted around the Internet. These Internet entries are often brief, user-generated, paranormal stories intended to scare readers.', 100000, 3.4),
(3, 'Funnzo', 'Funny videos to entertain peoples', 9800120, 7.5);

-- --------------------------------------------------------

--
-- Table structure for table `Device`
--

CREATE TABLE `Device` (
  `deviceID` int(255) NOT NULL,
  `deviceAddress` varchar(255) NOT NULL,
  `deviceAddDate` date NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Device`
--

INSERT INTO `Device` (`deviceID`, `deviceAddress`, `deviceAddDate`, `memberID`) VALUES
(1, '00-04-DC:4902', '2019-04-10', 1),
(2, '00-04-DC:2094', '2019-04-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `memberID` int(255) NOT NULL,
  `firstName` char(255) NOT NULL,
  `lastName` char(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `membershipTypeID` int(11) NOT NULL,
  `quotaUsed` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`memberID`, `firstName`, `lastName`, `dob`, `gender`, `email`, `passwordHash`, `membershipTypeID`, `quotaUsed`) VALUES
(1, 'Ankit', 'Priyarup', '2000-07-26', 'M', 'ankitpriyarup@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 4, 80),
(2, 'Adil', 'Ahmad', '1999-04-04', 'M', 'adilisawesome@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MembershipType`
--

CREATE TABLE `MembershipType` (
  `m_typeID` int(255) NOT NULL,
  `m_typeName` varchar(255) NOT NULL,
  `streamQuota` int(255) NOT NULL,
  `benefit` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MembershipType`
--

INSERT INTO `MembershipType` (`m_typeID`, `m_typeName`, `streamQuota`, `benefit`) VALUES
(1, 'Free', 100, 0),
(2, 'SD', 1000, 1),
(3, 'HD', 2000, 2),
(4, 'HD+', 5000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Stream`
--

CREATE TABLE `Stream` (
  `streamID` int(255) NOT NULL,
  `startView` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `contentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Stream`
--

INSERT INTO `Stream` (`streamID`, `startView`, `contentID`) VALUES
(3, '2019-04-24 20:30:49', 1),
(4, '2019-04-24 20:32:57', 1),
(5, '2019-04-24 20:33:14', 3),
(6, '2019-04-24 20:34:02', 1),
(7, '2019-04-24 20:34:41', 3),
(8, '2019-04-24 20:34:52', 1),
(9, '2019-04-24 20:42:12', 1),
(10, '2019-04-24 20:42:31', 1),
(11, '2019-04-24 20:42:42', 1),
(12, '2019-04-24 20:43:06', 4),
(13, '2019-04-24 20:43:57', 4),
(14, '2019-04-24 20:44:04', 4),
(15, '2019-04-24 20:44:08', 4),
(16, '2019-04-24 20:47:20', 1),
(17, '2019-04-24 20:47:41', 1),
(18, '2019-04-24 20:48:51', 6),
(19, '2019-04-24 20:49:05', 4),
(20, '2019-04-24 20:50:02', 4),
(21, '2019-04-24 20:50:10', 4),
(22, '2019-04-24 20:51:53', 4),
(23, '2019-04-24 20:52:47', 4),
(24, '2019-04-24 20:52:59', 4),
(25, '2019-04-24 20:53:04', 4),
(26, '2019-04-24 21:03:41', 5),
(27, '2019-04-25 05:43:32', 5),
(28, '2019-04-25 06:09:58', 6),
(29, '2019-04-25 06:10:08', 2),
(30, '2019-04-25 06:10:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `StreamContent`
--

CREATE TABLE `StreamContent` (
  `contentID` int(255) NOT NULL,
  `contentName` char(255) NOT NULL,
  `duration` time NOT NULL,
  `rentalCharge` int(255) NOT NULL,
  `contentGenre` char(255) NOT NULL,
  `maturityLevel` varchar(5) NOT NULL,
  `channelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StreamContent`
--

INSERT INTO `StreamContent` (`contentID`, `contentName`, `duration`, `rentalCharge`, `contentGenre`, `maturityLevel`, `channelID`) VALUES
(1, 'Charlie The Drunk Guinea Pig', '00:07:00', 0, 'Funny', '13+', 1),
(2, 'Smosh Live', '01:20:00', 10, 'Funny', 'E', 1),
(3, 'The Chernobyll', '01:30:00', 15, 'Mystery', '18+', 2),
(4, 'Black Mirror: Bandersnatch', '02:00:00', 10, 'Thriller', '15+', 2),
(5, 'Homemade pranks', '00:06:00', 0, 'Funny', 'E', 3),
(6, 'Laugh Compilations', '00:09:00', 0, 'Funny', 'E', 3);

-- --------------------------------------------------------

--
-- Table structure for table `StreamReview`
--

CREATE TABLE `StreamReview` (
  `contentID` int(11) NOT NULL,
  `ratingTitle` varchar(255) NOT NULL,
  `ratingDesc` varchar(255) NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StreamReview`
--

INSERT INTO `StreamReview` (`contentID`, `ratingTitle`, `ratingDesc`, `rating`) VALUES
(1, 'FUNNY', 'Back when smosh was funny', 9),
(1, 'Fresh', 'Man this video is 6 years old.  I remember when this was new.', 10),
(1, 'Made my day', 'Rest in Peace Charlie 2009-2015\r\nHe was drunk on the outside', 7),
(1, 'Adorable', 'I miss charlie he\'s so cute', 8),
(2, 'Not so fun', 'Stevie is cool but who else wanted COURTNEY FREAKIN MILLER?', 5),
(2, 'Kinda Lame', 'Little did Anthony know, he moved on', 4),
(2, 'Stunning', 'Can we talk about how great Courtney\'s Ash impression is?', 8),
(3, 'Blast', 'Stunning blasphomy', 10),
(3, 'UNDERRATED', 'THIS IS REAL GOLD! MUST WATCH', 10),
(4, 'DARK HUMOR', 'I chopped the dad and was so happy when the game got 5 stars.', 9),
(4, 'Different', '\"I\'m watching you!\" my fave line..', 10),
(5, 'FUNN', 'really funny', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Actors`
--
ALTER TABLE `Actors`
  ADD PRIMARY KEY (`actorID`);

--
-- Indexes for table `Cast`
--
ALTER TABLE `Cast`
  ADD KEY `contentID` (`contentID`),
  ADD KEY `actorID` (`actorID`);

--
-- Indexes for table `Channel`
--
ALTER TABLE `Channel`
  ADD PRIMARY KEY (`channelID`);

--
-- Indexes for table `Device`
--
ALTER TABLE `Device`
  ADD PRIMARY KEY (`deviceID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `membershipTypeID` (`membershipTypeID`);

--
-- Indexes for table `MembershipType`
--
ALTER TABLE `MembershipType`
  ADD PRIMARY KEY (`m_typeID`);

--
-- Indexes for table `Stream`
--
ALTER TABLE `Stream`
  ADD PRIMARY KEY (`streamID`),
  ADD KEY `contentID` (`contentID`);

--
-- Indexes for table `StreamContent`
--
ALTER TABLE `StreamContent`
  ADD PRIMARY KEY (`contentID`),
  ADD KEY `channelID` (`channelID`);

--
-- Indexes for table `StreamReview`
--
ALTER TABLE `StreamReview`
  ADD KEY `streamID` (`contentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Actors`
--
ALTER TABLE `Actors`
  MODIFY `actorID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Channel`
--
ALTER TABLE `Channel`
  MODIFY `channelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Device`
--
ALTER TABLE `Device`
  MODIFY `deviceID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Member`
--
ALTER TABLE `Member`
  MODIFY `memberID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `MembershipType`
--
ALTER TABLE `MembershipType`
  MODIFY `m_typeID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Stream`
--
ALTER TABLE `Stream`
  MODIFY `streamID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `StreamContent`
--
ALTER TABLE `StreamContent`
  MODIFY `contentID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cast`
--
ALTER TABLE `Cast`
  ADD CONSTRAINT `Cast_ibfk_1` FOREIGN KEY (`contentID`) REFERENCES `StreamContent` (`contentID`),
  ADD CONSTRAINT `Cast_ibfk_2` FOREIGN KEY (`actorID`) REFERENCES `Actors` (`actorID`);

--
-- Constraints for table `Device`
--
ALTER TABLE `Device`
  ADD CONSTRAINT `Device_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`memberID`);

--
-- Constraints for table `Member`
--
ALTER TABLE `Member`
  ADD CONSTRAINT `Member_ibfk_1` FOREIGN KEY (`membershipTypeID`) REFERENCES `MembershipType` (`m_typeID`);

--
-- Constraints for table `Stream`
--
ALTER TABLE `Stream`
  ADD CONSTRAINT `Stream_ibfk_1` FOREIGN KEY (`contentID`) REFERENCES `StreamContent` (`contentID`);

--
-- Constraints for table `StreamContent`
--
ALTER TABLE `StreamContent`
  ADD CONSTRAINT `StreamContent_ibfk_1` FOREIGN KEY (`channelID`) REFERENCES `Channel` (`channelID`);

--
-- Constraints for table `StreamReview`
--
ALTER TABLE `StreamReview`
  ADD CONSTRAINT `StreamReview_ibfk_1` FOREIGN KEY (`contentID`) REFERENCES `StreamContent` (`contentID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
