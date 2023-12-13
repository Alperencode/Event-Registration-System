-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 08:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_registration_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_events`
--

CREATE TABLE `user_events` (
  `id` int(11) NOT NULL,
  `userEventID` varchar(16) NOT NULL,
  `userID` varchar(16) NOT NULL,
  `eventID` varchar(16) NOT NULL,
  `eventType` varchar(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_events`
--

INSERT INTO `user_events` (`id`, `userEventID`, `userID`, `eventID`, `eventType`, `date`) VALUES
(46, '201a90abbd364794', '49a68dd1c7082628', 'da399f6d5fe90470', 'Hosting', '2023-12-12 21:18:24'),
(47, '52d0e6e2dd66070a', '49a68dd1c7082628', '986d31b861695126', 'Hosting', '2023-12-12 21:21:14'),
(48, 'dae4a2e331ceffbc', '49a68dd1c7082628', '4208270b28b08c6b', 'Hosting', '2023-12-12 21:22:33'),
(49, 'c5ff5e90ecc2221a', '49a68dd1c7082628', '38db42e2ce9b6b38', 'Hosting', '2023-12-12 21:25:57'),
(50, '33bf3ec150de8d37', '49a68dd1c7082628', '55c72fe13edb0f6a', 'Hosting', '2023-12-12 21:35:20'),
(51, '7d48cdde94f15bc5', '49a68dd1c7082628', '8ce0e7876c01d02f', 'Hosting', '2023-12-12 21:37:21'),
(52, '6492a2484379235b', 'f24a59b6fb42b379', 'c6f252bb55a3c7bf', 'Hosting', '2023-12-12 22:05:07'),
(53, '3991ef109614293b', 'f24a59b6fb42b379', 'd3dbbafa0b4cc5de', 'Hosting', '2023-12-12 22:07:49'),
(54, '7c314b2b614f982b', 'f24a59b6fb42b379', '3b352afffa113a05', 'Hosting', '2023-12-12 22:10:51'),
(56, '0f222dfe46855507', 'f24a59b6fb42b379', 'bab94532e681020a', 'Hosting', '2023-12-12 22:24:31'),
(57, 'd7b6c6e3a58e38e2', 'f24a59b6fb42b379', '252febb9d563b9b2', 'Hosting', '2023-12-12 22:25:32'),
(58, '889aaeceaa49c0c0', 'f24a59b6fb42b379', '617843b033af166c', 'Hosting', '2023-12-12 22:28:33'),
(59, '427b47683eac5728', 'f24a59b6fb42b379', '755a16d98e9d42d4', 'Hosting', '2023-12-12 21:00:00'),
(62, '0f2c39e24df44ffb', 'ebbf9e8e298d7fc7', '986d31b861695126', 'Joined', '2023-12-13 14:25:38'),
(75, '8c892b19a238adb8', '68d3d32bdde3f5fc', '252febb9d563b9b2', 'Saved', '2023-12-13 16:45:44'),
(76, 'f09439939359a01f', '68d3d32bdde3f5fc', 'da399f6d5fe90470', 'Joined', '2023-12-13 16:46:01'),
(77, '689b207b4376d195', '68d3d32bdde3f5fc', '4208270b28b08c6b', 'Joined', '2023-12-13 16:46:10'),
(78, '40ce3fb347aad7fc', '68d3d32bdde3f5fc', '4208270b28b08c6b', 'Saved', '2023-12-13 16:46:13'),
(79, 'fb45d9eb093fe2d9', 'd88c20327a04e882', 'd3dbbafa0b4cc5de', 'Joined', '2023-12-13 16:50:25'),
(80, '8ebc6adf88e72c57', 'ebbf9e8e298d7fc7', 'd3dbbafa0b4cc5de', 'Joined', '2023-12-13 16:51:33'),
(87, 'e5e065c676c5f741', '68d3d32bdde3f5fc', '55c72fe13edb0f6a', 'Joined', '2023-12-13 19:14:20'),
(88, '69b924d47aa84f43', '49a68dd1c7082628', '3b352afffa113a05', 'Joined', '2023-12-13 19:37:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `eventID` (`eventID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_events`
--
ALTER TABLE `user_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_events`
--
ALTER TABLE `user_events`
  ADD CONSTRAINT `user_events_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_events_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`eventID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
