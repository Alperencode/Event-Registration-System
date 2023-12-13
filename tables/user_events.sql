-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 02:46 PM
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
(1, '880532442dc7f3fa', '68d3d32bdde3f5fc', 'cc788d49997d2d37', 'Hosting', '2023-12-05 11:52:33'),
(2, '666d5b6b26c2eb73', '68d3d32bdde3f5fc', '2046e31c125e398e', 'Hosting', '2023-12-06 17:45:05'),
(22, '406082a44ee68cb8', 'f24a59b6fb42b379', 'cc788d49997d2d37', 'Joined', '2023-12-11 23:32:00'),
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
(59, '427b47683eac5728', 'f24a59b6fb42b379', '755a16d98e9d42d4', 'Hosting', '2023-12-12 21:00:00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
