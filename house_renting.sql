-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2024 at 08:56 AM
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
-- Table structure for table `city_info`
--

CREATE TABLE `city_info` (
  `city_id` int(100) NOT NULL,
  `city_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_details`
--

CREATE TABLE `house_details` (
  `house_id` int(100) NOT NULL,
  `owner_id` int(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `square_footage` varchar(20) NOT NULL,
  `num_of_bedrooms` int(10) NOT NULL,
  `num_of_bathrooms` int(10) NOT NULL,
  `rent_of_house` varchar(100) NOT NULL,
  `house_type` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'user', 'user@123', '1231231231', 'abc@gmail.com', 1),
(2, 'user', 'abc@123', '1231231231', 'abc@gmail.com', 29),
(3, 'user1', 'user1', '1231231231', 'abc@gmail.com', 1),
(4, 'user2', 'abc@123', '1212121212', 'abc@gmail.com', 50);

-- --------------------------------------------------------

--
-- Table structure for table `renting_details`
--

CREATE TABLE `renting_details` (
  `house_id` int(100) NOT NULL,
  `tenant_id` int(100) NOT NULL,
  `tenant_name` varchar(50) NOT NULL,
  `date` varchar(20) NOT NULL,
  `rent_price` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `cast` varchar(20) NOT NULL,
  `adharno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenant_details`
--

INSERT INTO `tenant_details` (`tenant_id`, `name`, `password`, `contact_no`, `email_id`, `gender`, `cast`, `adharno`) VALUES
(9, 'sdfsf', 'abc@123', '1231231231', 'abc@gmail.com', 'male', 'abc', '123121212'),
(10, 'afaf', 'sefwef', '32424', 'abc@gmail.com', '1341', '13412', '123'),
(11, 'abc12', 'abc@123', '1212121212', 'abc@gmail.com', 'male', 'abc', '1234-1234-1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `city_info`
--
ALTER TABLE `city_info`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `house_details`
--
ALTER TABLE `house_details`
  ADD PRIMARY KEY (`house_id`),
  ADD KEY `owner` (`owner_id`);

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
  ADD KEY `tenant` (`tenant_id`);

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
-- AUTO_INCREMENT for table `city_info`
--
ALTER TABLE `city_info`
  MODIFY `city_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_details`
--
ALTER TABLE `house_details`
  MODIFY `house_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner_details`
--
ALTER TABLE `owner_details`
  MODIFY `owner_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_details`
--
ALTER TABLE `tenant_details`
  MODIFY `tenant_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_details` (`tenant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
