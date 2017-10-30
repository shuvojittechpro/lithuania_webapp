-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2017 at 10:49 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daizik_lithuania_webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_user_details`
--

CREATE TABLE `business_user_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `preference_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `postedTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `preference_id`, `title`, `description`, `image`, `postedTime`) VALUES
(1, 1, 'Test1', '', 'image1.png', 1508933690),
(2, 1, 'Test2', '', 'image2.png', 1508933690),
(3, 2, 'Test3', '', 'image3.png', 1508933690),
(4, 2, 'Test4', '', 'image1.png', 1508933690);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `fax` varchar(200) NOT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `company_description` text NOT NULL,
  `experties_field` text NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `category_id`, `sub_category_id`, `logo`, `title`, `address`, `phone`, `mobile`, `fax`, `latitude`, `longitude`, `email_address`, `company_description`, `experties_field`, `postedTime`) VALUES
(1, 5, 1, 1, 'image1.png', 'Techprostudio', 'Room No: 703 & 704,\r\n7th Floor, Merlin Infinite,\r\nDN-51, Sector-V, Salt Lake City,\r\nKolkata - 700091', '+91 33 4601 6343', '', '', '22.5772637', '88.4324932', 'support@techprostudio.com (Support)', 'At Techpro Studio We Avoid Doing Those Codes Which Industry Avoids Using.\r\nTechpro is a team of enthusiastic technology champions coming together for making a smarter future. Since the word \'Go\', Techpro has always believed in delivering simple yet effective solutions to clients. This has made people come back to us.', 'Web', 1508934567),
(2, 5, 1, 1, 'image1.png', 'Techprostudio Webel Office', 'Room No: 703 & 704,\r\n7th Floor, Merlin Infinite,\r\nDN-51, Sector-V, Salt Lake City,\r\nKolkata - 700091', '+91 33 4601 6343', '', '', '22.5809382', '88.4802776', 'support@techprostudio.com (Support)', 'At Techpro Studio We Avoid Doing Those Codes Which Industry Avoids Using.\r\nTechpro is a team of enthusiastic technology champions coming together for making a smarter future. Since the word \'Go\', Techpro has always believed in delivering simple yet effective solutions to clients. This has made people come back to us.', 'Web', 1508934567),
(3, 5, 1, 2, 'image1.png', 'Karunamoyee', 'Room No: 703 & 704,\r\n7th Floor, Merlin Infinite,\r\nDN-51, Sector-V, Salt Lake City,\r\nKolkata - 700091', '+91 33 4601 6343', '', '', '22.5851204', '88.4032842', 'support@techprostudio.com (Support)', 'At Techpro Studio We Avoid Doing Those Codes Which Industry Avoids Using.\r\nTechpro is a team of enthusiastic technology champions coming together for making a smarter future. Since the word \'Go\', Techpro has always believed in delivering simple yet effective solutions to clients. This has made people come back to us.', 'Web', 1508934567),
(4, 5, 1, 2, 'image1.png', 'Gorabazar', 'Room No: 703 & 704,\r\n7th Floor, Merlin Infinite,\r\nDN-51, Sector-V, Salt Lake City,\r\nKolkata - 700091', '+91 33 4601 6343', '', '', '22.6302804', '88.4090775', 'support@techprostudio.com (Support)', 'At Techpro Studio We Avoid Doing Those Codes Which Industry Avoids Using.\r\nTechpro is a team of enthusiastic technology champions coming together for making a smarter future. Since the word \'Go\', Techpro has always believed in delivering simple yet effective solutions to clients. This has made people come back to us.', 'Web', 1508934567);

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`id`, `title`, `description`, `postedTime`) VALUES
(1, 'Business', '', 1508933690),
(2, 'Leisure', '', 1508933690);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `postedTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `title`, `description`, `image`, `postedTime`) VALUES
(1, 1, 'A', '', 'image1.png', 1508934567),
(2, 1, 'B', '', 'image2.png', 1508934567),
(3, 2, 'C', '', 'image3.png', 1508934567),
(4, 2, 'D', '', 'image1.png', 1508934567),
(9, 3, 'E', '', 'image2.png', 1508934567),
(10, 3, 'F', '', 'image3.png', 1508934567),
(11, 4, 'G', '', 'image1.png', 1508934567),
(12, 4, 'H', '', 'image2.png', 1508934567);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `social_type` enum('F','G') DEFAULT NULL COMMENT 'F => Facebook; G => Google',
  `social_id` varchar(150) DEFAULT NULL,
  `user_type` enum('A','U','B') NOT NULL COMMENT 'A => Admin; U => User; B => Business Man',
  `postedTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `social_type`, `social_id`, `user_type`, `postedTime`) VALUES
(1, 'admin', '3e679dfe9fe480d5c3c92de6b9210636', NULL, NULL, 'A', 1508917352),
(2, 'fb_127040484625273', 'lithuania123456', 'F', '127040484625273', 'U', 1509108480),
(3, 'gp_117197233629816329718', 'lithuania123456', 'G', '117197233629816329718', 'U', 1509107840);

-- --------------------------------------------------------

--
-- Table structure for table `user_facebook_details`
--

CREATE TABLE `user_facebook_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `image_url` text NOT NULL,
  `postedTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_facebook_details`
--

INSERT INTO `user_facebook_details` (`id`, `user_id`, `full_name`, `email_address`, `image_url`, `postedTime`) VALUES
(1, 2, 'Walker Cowley', 'test.techprostudio@gmail.com', 'https://graph.facebook.com/127040484625273/picture?type=normal', 1509108480);

-- --------------------------------------------------------

--
-- Table structure for table `user_google_details`
--

CREATE TABLE `user_google_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email_address` varchar(150) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_google_details`
--

INSERT INTO `user_google_details` (`id`, `user_id`, `full_name`, `email_address`, `image_url`, `postedTime`) VALUES
(1, 3, 'Techpro Studio', 'test.techprostudio@gmail.com', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/s200/photo.jpg', 1509107840);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_user_details`
--
ALTER TABLE `business_user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_facebook_details`
--
ALTER TABLE `user_facebook_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_google_details`
--
ALTER TABLE `user_google_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_user_details`
--
ALTER TABLE `business_user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_facebook_details`
--
ALTER TABLE `user_facebook_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_google_details`
--
ALTER TABLE `user_google_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
