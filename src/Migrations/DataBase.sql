-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.99.100:3306
-- Generation Time: May 29, 2020 at 05:18 PM
-- Server version: 10.4.10-MariaDB-1:10.4.10+maria~bionic-log
-- PHP Version: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `walter_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `list`
--
CREATE DATABASE IF NOT EXISTS walter_code DEFAULT CHARACTER SET utf8_general_ci;
USE walter_code;
CREATE TABLE `list` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `list`
--

/*INSERT INTO `list` (`id`, `name`, `date`, `userId`) VALUES
(52, 'List3', '2020-05-26 10:22:04', 3),
(54, 'List14', '2020-05-28 16:26:03', 3),
(55, 'List15', '2020-05-28 16:26:12', 3),
(56, 'List55', '2020-05-28 16:26:42', 3); */

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/* INSERT INTO `product` (`id`, `name`) VALUES
(22, 'Product-test-22'),
(23, 'Product2'),
(24, 'Product2'),
(25, 'Product3'),
(26, 'Product5'),
(27, 'Product6'),
(28, 'Product7'),
(29, 'Product8'),
(30, 'Product1'),
(31, 'Product2'); */

-- --------------------------------------------------------

--
-- Table structure for table `productList`
--

CREATE TABLE `productList` (
  `id` int(11) NOT NULL,
  `listId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productList`
--

/* INSERT INTO `productList` (`id`, `listId`, `productId`, `quantity`) VALUES
(8, 52, 30, 1),
(9, 52, 27, 2),
(12, 56, 30, 14),
(13, 56, 31, 15); */

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/* INSERT INTO `users` (`userId`, `firstName`, `lastName`, `email`, `password`) VALUES
(3, 'Dejan', 'Vujicic', 'dejan.vujicic@gmail.com', '$2b$10$5uGMUOCIYh4XklAvr8y8X.M1Fnmzu35XbDSCfc3yWQWsDE0fjQAeO'),
(4, 'Mak', 'Dzonlagic', 'mak.dzonlagic@gmail.com', '$2b$10$EqF6QO4xWXIp.0ZNi6vXyuxacdY5Ye/Tra/08q00dhQhftDzEVZNu'),
(5, 'Damir', 'Silajdzic', 'damir.silajdzic@gmail.com', '$2b$10$1pbeMRfvG532ehjbZ0Xz/e9GnxoMxl/e4a50U0pqoCKN2g.PZRJFa'),
(6, 'Haris', 'Zujo', 'haris.zujo@gmail.com', '$2b$10$Lx7PYh4TFBYvINtMYun8tu6Ss4jb2l.d7acnLd6h4m33auhfsi4J.'),
(7, 'Admin', 'Admin', 'admin.test@gmail.com', '$2b$10$.XRK91bjH/7NYrJAWxgb2OHLCocAAqiNaSlBXnzK0I8SjX6nBHG7a'); */

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productList`
--
ALTER TABLE `productList`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listId` (`listId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `productList`
--
ALTER TABLE `productList`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `list_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productList`
--
ALTER TABLE `productList`
  ADD CONSTRAINT `productList_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productList_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
