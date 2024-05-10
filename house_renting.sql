-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 01:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `house_renting`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `admin_id` int(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `name`, `password`) VALUES
(1, 'admin', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

CREATE TABLE `feedback_details` (
  `tenant_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `subject` text NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_details`
--

CREATE TABLE `house_details` (
  `house_id` int(100) NOT NULL,
  `owner_id` int(100) NOT NULL,
  `address` text NOT NULL,
  `square_footage` varchar(20) NOT NULL,
  `num_of_bedrooms` int(10) NOT NULL,
  `num_of_bathrooms` int(10) NOT NULL,
  `rent_of_house` varchar(100) NOT NULL,
  `house_type` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `request` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `house_details`
--

INSERT INTO `house_details` (`house_id`, `owner_id`, `address`, `square_footage`, `num_of_bedrooms`, `num_of_bathrooms`, `rent_of_house`, `house_type`, `status`, `img`, `request`, `area`) VALUES
(1, 1, '234 Evergreen Terrace, Crestwood County, Tranquility Township, Harmony District, Blissful State, 98765', '1000', 3, 3, '1200', 'Duplex', 'unavailable', 'House1.jpg', 'accept', 'ahmedabad'),
(2, 1, '434 Evergreen Terrace, Crestwood County, Tranquility Township, Harmony District, Blissful State, 98765', '2000', 4, 4, '2200', 'Flat', 'available', 'House2.jpg', 'accept', 'ahmedabad'),
(3, 2, '1234 Willow Lane, Apartment 5678, Springfield Heights, Tranquility Township, 57685', '1500', 3, 2, '1500', 'Flat', 'unavailable', 'House3.jpg', 'accept', 'surat'),
(4, 2, '5678 Maple Avenue, Suite 9101, Cedarwood Court, Harmony Township, Tranquility District 29334', '2000', 3, 3, '3000', 'Bungalow', 'available', 'House4.jpg', 'accept', 'ahmedabad'),
(5, 4, '5678 Elm Road, Suite 9101, Cedarwood Manor, Blissful Township, Harmony District 29334', '2200', 3, 3, '3000', 'Flat', 'available', 'House5.jpg', 'accept', 'ahmedabad'),
(6, 4, '9101 Cedar Lane, Suite 5678, Maplewood Villa, Serenity Township, Tranquility District 29334', '2500', 3, 3, '3555', 'Duplex', 'available', 'House6.jpg', 'accept', 'ahmedabad');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_id` int(100) NOT NULL,
  `login_as` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_id`, `login_as`, `username`, `password`, `date`, `time`) VALUES
(1, 'tenant', 'keyur', 'keyur@23', '22-04-2024', '14:18:00'),
(2, 'tenant', 'dhruvi', 'dhruvi@07', '22-04-2024', '14:31:55'),
(3, 'tenant', 'keyur', 'keyur@23', '22-04-2024', '14:41:54'),
(4, 'tenant', 'dhruvi', 'dhruvi@07', '22-04-2024', '14:52:00'),
(5, 'owner', 'deep', 'Deep@09', '2024-04-22', '14:53:29'),
(6, 'owner', 'deep', 'Deep@09', '2024-04-22', '14:54:01'),
(7, 'tenant', 'dhruvi', 'dhruvi@07', '22-04-2024', '14:57:53'),
(8, 'tenant', 'dhruvi', 'dhruvi@07', '22-04-2024', '15:25:09'),
(9, 'tenant', 'dhruvi', 'dhruvi@07', '22-04-2024', '15:38:06'),
(10, 'tenant', '\'or\'1=1', '\'or\'1=1', '22-04-2024', '15:44:34'),
(11, 'tenant', 'dhruvi', 'Dhruvi@07', '22-04-2024', '15:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `owner_details`
--

CREATE TABLE `owner_details` (
  `owner_id` int(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `email_id` varchar(20) NOT NULL,
  `age` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_details`
--

INSERT INTO `owner_details` (`owner_id`, `name`, `password`, `contact_no`, `email_id`, `age`) VALUES
(1, 'priya', 'priya@07', '9601762168', 'priya@gmail.com', 19),
(2, 'deep', 'deep@09', '9726203485', 'deep@gmail.com', 20),
(4, 'angel', 'angel@29', '9313112288', 'angel@gmail.com', 19);

-- --------------------------------------------------------

--
-- Table structure for table `renting_details`
--

CREATE TABLE `renting_details` (
  `house_id` int(100) NOT NULL,
  `tenant_id` int(100) NOT NULL,
  `owner_id` int(100) NOT NULL,
  `tenant_name` varchar(50) NOT NULL,
  `date` varchar(20) NOT NULL,
  `rent_price` varchar(30) NOT NULL,
  `request` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `renting_details`
--

INSERT INTO `renting_details` (`house_id`, `tenant_id`, `owner_id`, `tenant_name`, `date`, `rent_price`, `request`) VALUES
(3, 4, 2, 'dhruvi', '22-04-2024', '1500', 'accept');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_details`
--

CREATE TABLE `tenant_details` (
  `tenant_id` int(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `email_id` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `cast` varchar(100) NOT NULL,
  `adharno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenant_details`
--

INSERT INTO `tenant_details` (`tenant_id`, `name`, `password`, `contact_no`, `email_id`, `gender`, `cast`, `adharno`) VALUES
(4, 'dhruvi', 'dhruvi@07', '6354827872', 'dhruvi07@gmail.com', 'female', 'hindu', '2554-3343-5443'),
(5, 'keyur', 'keyur@23', '6354827854', 'keyur@gmail.com', 'female', 'hindu', '2323-2345-4532'),
(10, 'sanjay', 'sanjay@1', '1231231231', 'sanjay@gmail.com', 'male', '\"><script>alert(document.cookie)</script>', '1234-5434-2323');

-- --------------------------------------------------------

--
-- Table structure for table `track_activity`
--

CREATE TABLE `track_activity` (
  `Username` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Date` varchar(100) NOT NULL,
  `Time` varchar(100) NOT NULL,
  `Activity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `feedback_details`
--
ALTER TABLE `feedback_details`
  ADD KEY `test2` (`tenant_id`);

--
-- Indexes for table `house_details`
--
ALTER TABLE `house_details`
  ADD PRIMARY KEY (`house_id`),
  ADD KEY `owner` (`owner_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `owner_details`
--
ALTER TABLE `owner_details`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `renting_details`
--
ALTER TABLE `renting_details`
  ADD KEY `house` (`house_id`),
  ADD KEY `tenant` (`tenant_id`),
  ADD KEY `ownerkey` (`owner_id`);

--
-- Indexes for table `tenant_details`
--
ALTER TABLE `tenant_details`
  ADD PRIMARY KEY (`tenant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `admin_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `house_details`
--
ALTER TABLE `house_details`
  MODIFY `house_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `owner_details`
--
ALTER TABLE `owner_details`
  MODIFY `owner_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_details`
--
ALTER TABLE `tenant_details`
  MODIFY `tenant_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback_details`
--
ALTER TABLE `feedback_details`
  ADD CONSTRAINT `test2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);

--
-- Constraints for table `house_details`
--
ALTER TABLE `house_details`
  ADD CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `owner_details` (`owner_id`);

--
-- Constraints for table `renting_details`
--
ALTER TABLE `renting_details`
  ADD CONSTRAINT `house` FOREIGN KEY (`house_id`) REFERENCES `house_details` (`house_id`),
  ADD CONSTRAINT `ownerkey` FOREIGN KEY (`owner_id`) REFERENCES `owner_details` (`owner_id`),
  ADD CONSTRAINT `tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
