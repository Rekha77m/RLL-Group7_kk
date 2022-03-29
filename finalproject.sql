-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2022 at 03:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `address`, `zipcode`, `user_id`) VALUES
(1, 'Dhule', '424005', 2),
(2, 'Shirpur', '424002', 3),
(4, 'mumbai', '424003', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer_service`
--

CREATE TABLE `customer_service` (
  `customer_id` bigint(20) NOT NULL,
  `service_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_service`
--

INSERT INTO `customer_service` (`customer_id`, `service_type`) VALUES
(1, 'phone'),
(1, 'landline'),
(2, 'fiber optic'),
(2, 'phone'),
(2, 'landline'),
(4, 'landline');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

CREATE TABLE `engineer` (
  `id` bigint(20) NOT NULL,
  `created_on` date DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`id`, `created_on`, `zipcode`, `user_id`) VALUES
(1, '2022-03-27', '424001', 7),
(2, '2022-03-27', '424001', 8),
(3, '2022-03-27', '424002', 9),
(4, '2022-03-27', '424002', 10),
(5, '2022-03-27', '424003', 11),
(6, '2022-03-27', '424004', 12),
(7, '2022-03-27', '424005', 13);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `ticket_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` bigint(20) NOT NULL,
  `created_on` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `created_on`, `user_id`) VALUES
(1, '2022-03-27', 14),
(2, '2022-03-27', 15);

-- --------------------------------------------------------

--
-- Table structure for table `manager_pincode`
--

CREATE TABLE `manager_pincode` (
  `manager_id` bigint(20) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager_pincode`
--

INSERT INTO `manager_pincode` (`manager_id`, `zipcode`) VALUES
(1, '424002'),
(1, '424001'),
(2, '424003'),
(2, '424004');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `is_customer` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `ticket_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `comments`, `created_on`, `is_customer`, `updated_by`, `ticket_id`) VALUES
(1, 'Problem solved ', '2022-03-27', b'0', 'e7@gmail.com', 100001);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `issue_type` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '"RAISED"',
  `updated_on` date DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `engineer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `address`, `created_on`, `description`, `issue_type`, `mobile`, `service_type`, `status`, `updated_on`, `zipcode`, `customer_id`, `engineer_id`) VALUES
(100001, 'Dhule', '2022-03-27', 'Not able to do call', 'other', '1111111111', 'landline', 'RESOLVED', '2022-03-27', '424005', 1, 7),
(100002, 'Shirpur', '2022-03-27', 'internet is very slow somtime', 'other', '1111111111', 'fiber optic', 'ESCALATED', '2022-03-27', '424002', 2, 3),
(100005, 'mumbai', '2022-03-27', '', 'Cannot make/receive calls', '1111111111', 'landline', 'RESOLVED', '2022-03-27', '424003', 4, 5),
(100006, 'Dhule', '2022-03-27', '', 'Cannot make calls', '1111111111', 'phone', 'WIP', '2022-03-28', '424005', 1, 7),
(100007, 'Dhule', '2022-03-28', '', 'Cannot receive calls', '1111111111', 'phone', 'RESOLVED', '2022-03-28', '424005', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_gen`
--

CREATE TABLE `ticket_gen` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_gen`
--

INSERT INTO `ticket_gen` (`sequence_name`, `next_val`) VALUES
('ticket', 100007);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `full_name`, `password`, `phone`, `role`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', '1234567890', 'admin'),
(2, 'c1@gmail.com', 'Customer1', '12345', '1111111111', 'customer'),
(3, 'c2@gmail.com', 'Customer2', '12345', '1111111111', 'customer'),
(5, 'c4@gmail.com', 'Customer4', '12345', '1111111111', 'customer'),
(7, 'e1@gmail.com', 'Engineer1', '12345', '222222222', 'engineer'),
(8, 'e2@gmail.com', 'Engineer2', '12345', '222222222', 'engineer'),
(9, 'e3@gmail.com', 'Engineer3', '12345', '22222222', 'engineer'),
(10, 'e4@gmail.com', 'Engineer4', '12345', '22222222', 'engineer'),
(11, 'e5@gmail.com', 'Engineer5', '12345', '22222222', 'engineer'),
(12, 'e6@gmail.com', 'Engineer6', '12345', '22222222', 'engineer'),
(13, 'e7@gmail.com', 'Engineer7', '12345', '22222222', 'engineer'),
(14, 'm1@gmail.com', 'Manager1', '12345', '333333333', 'manager'),
(15, 'm2@gmail.com', 'Manager2', '12345', '333333333', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `zipcodes`
--

CREATE TABLE `zipcodes` (
  `id` bigint(20) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zipcodes`
--

INSERT INTO `zipcodes` (`id`, `zipcode`) VALUES
(1, '424001'),
(2, '424002'),
(3, '424003'),
(4, '424004'),
(5, '424005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj8dlm21j202cadsbfkoem0s58` (`user_id`);

--
-- Indexes for table `customer_service`
--
ALTER TABLE `customer_service`
  ADD KEY `FKkgf6lo6x392bcam3491xt4ye3` (`customer_id`);

--
-- Indexes for table `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtme2psrg9v80frp01gjqs8eqq` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8fth5acovhce06e6atsujlb6e` (`ticket_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlx8n4x9vqj3lqv8cj9ienwrv6` (`user_id`);

--
-- Indexes for table `manager_pincode`
--
ALTER TABLE `manager_pincode`
  ADD KEY `FKjk4yickhts885xge9ntx6lbs0` (`manager_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdgmwpnmdoc7gy6y723qie378o` (`ticket_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmli0eqrecnnqvdgv3kcx7d9m8` (`customer_id`),
  ADD KEY `FKielsnpwvisku14pykq22luftl` (`engineer_id`);

--
-- Indexes for table `ticket_gen`
--
ALTER TABLE `ticket_gen`
  ADD PRIMARY KEY (`sequence_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKj8dlm21j202cadsbfkoem0s58` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `customer_service`
--
ALTER TABLE `customer_service`
  ADD CONSTRAINT `FKkgf6lo6x392bcam3491xt4ye3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `FKtme2psrg9v80frp01gjqs8eqq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK8fth5acovhce06e6atsujlb6e` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `FKlx8n4x9vqj3lqv8cj9ienwrv6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `manager_pincode`
--
ALTER TABLE `manager_pincode`
  ADD CONSTRAINT `FKjk4yickhts885xge9ntx6lbs0` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `FKdgmwpnmdoc7gy6y723qie378o` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FKielsnpwvisku14pykq22luftl` FOREIGN KEY (`engineer_id`) REFERENCES `engineer` (`id`),
  ADD CONSTRAINT `FKmli0eqrecnnqvdgv3kcx7d9m8` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
