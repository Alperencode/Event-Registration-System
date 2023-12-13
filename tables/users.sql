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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userID` varchar(16) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userID`, `username`, `email`, `password`, `creationDate`) VALUES
(1, 'f24a59b6fb42b379', 'adminNew', 'admin@gmail.com', 'a665a45920422f9d417e4867efdc4fb8', '2023-12-03 15:53:55'),
(2, '68d3d32bdde3f5fc', 'Alperen123', 'alperen@gmail.com', '03ac674216f3e15c761ee1a5e255f067', '2023-12-03 15:54:23'),
(3, '9e3bf42e08c5eb71', 'simal', 'simal@gmail.com', 'c775e7b757ede630cd0aa1113bd10266', '2023-12-04 05:27:24'),
(7, 'd88c20327a04e882', 'danyal', 'danyalbabur@gmail.com', '5994471abb01112afcc18159f6cc74b4', '2023-12-08 16:33:50'),
(9, '08f884f253d3354f', 'deneme', 'x@gmail.com', 'a665a45920422f9d417e4867efdc4fb8', '2023-12-10 18:35:07'),
(10, '683430a3b9f69bfc', 'yenideneme', 'yenideneme@gmail.com', '03ac674216f3e15c761ee1a5e255f067', '2023-12-10 22:46:38'),
(11, 'a547696fa04565a9', 'root', 'root@gmail.com', '96cae35ce8a9b0244178bf28e4966c2c', '2023-12-11 00:25:39'),
(18, '49a68dd1c7082628', 'simoi', 'simal.arifoglu@gmail.com', 'a665a45920422f9d417e4867efdc4fb8', '2023-12-11 21:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_userID` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
