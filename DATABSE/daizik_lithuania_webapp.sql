-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2017 at 09:29 AM
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
(1, 1, 'ADVERTISING AGENCIES, PUBLISHING\r\n', '', 'image1.png', 1508933690),
(2, 1, 'AGRICULTURE, FOOD INDUSTRY', '', 'image2.png', 1508933690),
(3, 1, 'Communication, Internet, IT\r\n', '', 'image3.png', 1508933690),
(4, 1, 'Finance, insurance, law\r\n', '', 'image1.png', 1508933690),
(5, 1, 'Government institutions\r\n', '', 'image2.png', 1508933690);

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
  `website` text NOT NULL,
  `rating` varchar(100) NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `category_id`, `sub_category_id`, `logo`, `title`, `address`, `phone`, `mobile`, `fax`, `latitude`, `longitude`, `email_address`, `company_description`, `website`, `rating`, `postedTime`) VALUES
(1, 5, 1, 1, 'comp_logo1.jpg', 'AOLA, UAB', 'M. Daukšos g. 8 (Senamiestis), 02101 Vilnius\r\nZip code LT-02101\r\n', '(+370) 52312055', '', '', '54.6726025', '25.2894088', 'info@aola.lt', 'Contact person Laima Adomaviciene, Director', 'www.aola.lt', '4.5', 1508934567),
(2, 5, 1, 1, 'comp_logo2.jpg', 'Finaneta, UAB', 'Silute pl. 4, 91173 Klaipeda', '(+370) 61011828, (+370) 46494505', '', '', '55.70252', '21.1605729', 'info@finaneta.lt', 'Director Julija Zaiceva\r\nGamybos skyrius (8 46) 484814\r\nDirektore (8 46) 484810\r\nCompany code 301540600\r\n', 'www.finaneta.lt', '4.5', 1508934567),
(3, 5, 1, 1, 'comp_logo3.jpg', 'Metalo forma, UAB\r\n', 'Kauno g. 36/ Smolensko g. 7 (Naujamiestis), 03202 Vilnius\r\n', '(+370) 52395848', '', '', '54.6683846', '25.2613028', 'info@metaloforma.lt', 'Director Antanas Vaicekauskas\r\nCompany code 125646738\r\n', 'www.metaloforma.lt', '4.6', 1508934567),
(4, 5, 1, 1, 'comp_logo4.png', 'RK gildija, UAB\r\n', 'Park g. 59-33, 37320 Panevezys', '(+370) 60029693', '', '', '55.7349766', '24.3237281', 'reklamosgildija@gmail.com', 'Director Remigijus Kupstas\r\nCompany code 301336537\r\n', '', '4.2', 1508934567),
(5, 5, 1, 2, 'comp_logo5.png', 'Adcom, UAB', '\r\nSeimyniskiu g. 21 (Zirmunai), 09200 Vilnius', '(+370) 52106450', '', '', '54.694976', '25.2897651', 'media@adcom.lt', 'Director Eimantas Gurevi?ius\r\nCompany code 300597228\r\n', 'www.adcom.lt', '4.3', 1508934567),
(6, 5, 1, 1, 'image1.png', 'Techprostudio', '703 & 704, 7th Floor, DN-51, Merlin Infinite, Sector V, Kolkata - 700091', '+91 33 4601 6343', '', '', '22.5770964', '88.4307494', 'support@techprostudio.com', '\"Techpro Studio Understands The Pulse Of Future Web And So Prescribes Apt Solution For That.\"\r\n\r\nInnovative people working together in this organization understands that the age of unstructured data processing is over, now is the time when intelligent solutions have to be delivered befitting semantic web infrastructure. Web 3.0 is the core of existence of any solution for present market and so Techpro Studio is focusing on that usability ', 'http://www.techprostudio.com/', '4.9', 1508934567),
(7, 5, 1, 2, 'comp_logo6.png', 'Ambermja, UAB', 'Mokyklos g. 23-115, 91262 Klaipeda\r\n', '(+370) 65521009', '', '', '55.7082858', '21.1554416', 'comisaras11@gmail.com', 'Director Renatas Vaisvilas\r\nCompany code 302928367', '', '4.3', 1508934567),
(8, 5, 1, 2, 'comp_logo7.jpg', 'Aveniu publika, VsI\r\n', 'Vingri g. 25-6 (Senamiestis), 01141 Vilnius', '(+370) 61146751', '', '', '54.679079', '25.2742373', 'info@aveniu-vilnius.lt', 'Vadov Jolanta Lunevii\r\nCompany code 302665457\r\n', 'www.aveniu-vilnius.lt', '4.1', 1508934567),
(9, 5, 1, 2, 'comp_logo8.png', 'Berklis, UAB', 'Pieni g. 36-3, Užliedži k., 54305 Kauno r.', '(+370) 65521188', '', '', '54.9593297', '23.8131444', '', 'Director Žydrnas Bielskis\r\nCompany code 303093475', '', '3.6', 1508934567),
(10, 5, 1, 2, 'comp_logo6.png', 'Bvrg, UAB', 'Mesiniu g. 5 (Senamiestis), 01133 Vilnius', '(+370) 52153377', '', '', '54.6781603', '25.2806611', 'info@bvrg.lt', 'Manager Jonas Blinstrubas\r\nCompany code 301163601', 'www.bvrg.lt', '4.3', 1508934567);

-- --------------------------------------------------------

--
-- Table structure for table `companies_gallery`
--

CREATE TABLE `companies_gallery` (
  `id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `postedTime` bigint(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies_gallery`
--

INSERT INTO `companies_gallery` (`id`, `comp_id`, `image`, `postedTime`) VALUES
(1, 6, 'gall_img1.jpg', 1508934567),
(2, 6, 'gall_img2.jpg', 1508934567);

-- --------------------------------------------------------

--
-- Table structure for table `company_skillset`
--

CREATE TABLE `company_skillset` (
  `id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_skillset`
--

INSERT INTO `company_skillset` (`id`, `comp_id`, `skill_id`, `postedTime`) VALUES
(1, 6, 1, 1508934567),
(2, 6, 2, 1508934567),
(3, 6, 3, 1508934567),
(4, 6, 4, 1508934567),
(5, 2, 1, 1508934567),
(6, 2, 2, 1508934567);

-- --------------------------------------------------------

--
-- Table structure for table `connect_request`
--

CREATE TABLE `connect_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `request_status` enum('Y','N') NOT NULL COMMENT 'Y => Accepted; N=> Not Accepted',
  `postedTime` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connect_request`
--

INSERT INTO `connect_request` (`id`, `user_id`, `business_user_id`, `company_id`, `request_status`, `postedTime`) VALUES
(1, 2, 5, 1, 'N', 1509531094),
(2, 2, 5, 2, 'N', 1509531162),
(3, 2, 5, 3, 'N', 1509531421),
(4, 2, 5, 4, 'N', 1509531899),
(8, 2, 5, 6, 'N', 1509608039),
(9, 2, 5, 6, 'N', 1509608300);

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
-- Table structure for table `skill_sets`
--

CREATE TABLE `skill_sets` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `postedTime` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill_sets`
--

INSERT INTO `skill_sets` (`id`, `title`, `logo`, `postedTime`) VALUES
(1, 'Web App', 'image1.png', 1508934567),
(2, 'Mobile App', 'image2.png', 1508934567),
(3, 'SAP', 'image3.png', 1508934567),
(4, 'SEO', 'image1.png', 1508934567);

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
(1, 1, 'Advertising services', '', 'image1.png', 1508934567),
(2, 1, 'Public relation', '', 'image2.png', 1508934567),
(3, 2, 'Agricultural products and their processing', '', 'image3.png', 1508934567),
(4, 2, 'Forest goods and their processing', '', 'image1.png', 1508934567),
(9, 3, 'Computer graphics', '', 'image2.png', 1508934567),
(10, 3, 'Internet services\r\n', '', 'image3.png', 1508934567),
(11, 4, 'Audit\r\n', '', 'image1.png', 1508934567),
(12, 4, 'Banks\r\n', '', 'image2.png', 1508934567),
(13, 5, 'Courts\r\n', '', 'image3.png', 1508934567),
(14, 5, 'Ministries and departments', '', 'image1.png', 1508934567);

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
(2, 'fb_127040484625273', '3e679dfe9fe480d5c3c92de6b9210636', 'F', '127040484625273', 'U', 1509600902),
(3, 'gp_117197233629816329718', '3e679dfe9fe480d5c3c92de6b9210636', 'G', '117197233629816329718', 'U', 1509107840),
(4, 'asdaasasd', '3e679dfe9fe480d5c3c92de6b9210636', 'F', 'sdaasasd', 'U', 1509525043);

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
(1, 2, 'Walker Cowley', 'test.techprostudio@gmail.com', 'https://graph.facebook.com/127040484625273/picture?type=normal', 1509600902),
(2, 4, 'Full Name of the user', 'Email address of the user', 'url of the profile image', 1509525043);

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
-- Indexes for table `companies_gallery`
--
ALTER TABLE `companies_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_skillset`
--
ALTER TABLE `company_skillset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `connect_request`
--
ALTER TABLE `connect_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_sets`
--
ALTER TABLE `skill_sets`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `companies_gallery`
--
ALTER TABLE `companies_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company_skillset`
--
ALTER TABLE `company_skillset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `connect_request`
--
ALTER TABLE `connect_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `skill_sets`
--
ALTER TABLE `skill_sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_facebook_details`
--
ALTER TABLE `user_facebook_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_google_details`
--
ALTER TABLE `user_google_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
