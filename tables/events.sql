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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `eventID` varchar(16) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `eventDate` date NOT NULL,
  `eventTime` time NOT NULL,
  `eventLocation` varchar(100) NOT NULL,
  `maxParticipant` int(11) NOT NULL,
  `shortDescription` varchar(100) NOT NULL,
  `longDescription` text DEFAULT NULL,
  `organizerID` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `eventID`, `eventName`, `eventDate`, `eventTime`, `eventLocation`, `maxParticipant`, `shortDescription`, `longDescription`, `organizerID`) VALUES
(4, 'cc788d49997d2d37', 'Coffe Meeting With Friends', '2023-12-20', '06:30:00', 'Back Fish', 15, 'Gonna get coffe with friends.', 'We\'ll chat and drin our coffe with friends, feel free to join!', '68d3d32bdde3f5fc'),
(5, '2046e31c125e398e', 'Podcast Event', '2023-12-27', '06:30:00', 'Online', 53, 'Chill podcast event.', 'It\'ll be a short podcast about upcoming movies.', '68d3d32bdde3f5fc'),
(37, 'da399f6d5fe90470', 'Find Wellness: Yoga and Meditation', '2024-01-13', '12:00:00', 'City Park Yoga Studio', 20, 'A calm yoga and meditation workshop to revitalize your soul and body.', 'This event will offer participants basic yoga poses and meditation techniques to relieve daily stress, increase flexibility and find inner peace. It is suitable for all levels, so everyone is welcome.', '49a68dd1c7082628'),
(38, '986d31b861695126', 'Behind the Lens: Basic Photography Workshop', '2023-12-16', '14:00:00', 'Art Gallery Meeting Hall', 15, 'An interactive workshop to develop basic photography skills for those interested in photography.', 'This workshop will help you understand the basic principles of photography and give participants the opportunity to develop their own creative style. Please bring your own digital cameras.', '49a68dd1c7082628'),
(39, '4208270b28b08c6b', 'Innovation Meeting: Entrepreneurship Panel', '2024-02-01', '15:30:00', 'Teknopark Conference Hall, 102. Street No:10', 50, 'The opportunity to meet successful entrepreneurs and share their experiences.', 'This event will offer an inspiring panel for those interested in entrepreneurship. Panelists will share their processes of starting their own business, the challenges they faced and their success stories. Afterwards, time will be allocated for networking among the participants.', '49a68dd1c7082628'),
(40, '38db42e2ce9b6b38', 'Python Getting Started Workshop', '2023-12-18', '19:00:00', 'Technology Innovation Center, 1097. Street No:456', 25, 'An interactive workshop to learn the basics of the Python programming language.', 'This workshop is for beginners who want to understand the basic concepts of Python. Participants will have the opportunity to learn basic programming concepts in the Python language with interactive examples and practical exercises.', '49a68dd1c7082628'),
(41, '55c72fe13edb0f6a', 'Science Workshop for Children', '2024-03-03', '12:00:00', 'Stark Science Center, Education Hall', 15, 'An interactive science workshop that will spark your children\'s curiosity.', 'This event, to be held at the Science Center, aims to teach children basic science concepts in a fun and interactive way. This workshop, full of experiments, games and interesting shows, will allow children to have fun while learning.', '49a68dd1c7082628'),
(42, '8ce0e7876c01d02f', 'Paint and Sip Night', '2024-01-27', '18:00:00', 'Van Gogh Art Studio No:25', 10, 'How about drinking wine while painting on a fun evening?', 'The event will take place with an art instructor and each participant will create their own canvas. Painting materials will be provided. Attendees will be offered a glass of wine and light snacks.', '49a68dd1c7082628'),
(43, 'c6f252bb55a3c7bf', 'Cooking Class: Mediterranean Cuisine', '2024-04-13', '12:00:00', 'Chef\'s Kitchen Workshop, 546. Street No:13', 12, 'You are invited to learn Mediterranean cuisine!', 'At the event, participants will learn delicious recipes of Mediterranean cuisine accompanied by a chef. Materials will be provided. Each participant will cook their own meal and then enjoy it.', 'f24a59b6fb42b379'),
(44, 'd3dbbafa0b4cc5de', 'Book Club Meeting', '2024-03-04', '18:00:00', 'City Library Meeting Hall', 25, 'An enjoyable evening to discuss the selected book together and meet with literature enthusiasts.', 'This month\'s book is \"Anna Karenina\" and anyone who wants to join the discussion is welcome. Participants can share their thoughts and get new book recommendations.', 'f24a59b6fb42b379'),
(45, '3b352afffa113a05', 'Poetry Evening and Open Mic', '2024-02-05', '20:00:00', 'City Cultural Center', 30, 'A wonderful evening for poetry lovers! Share your own poems or listen to poems you love.', 'Are you ready to be caught up in the magic of poetry? At our Poetry Evening and Open Microphone event, you can share the poems you wrote or listen to your favorite poems. This event, open to everyone\'s participation, offers an emotional and creative atmosphere. Max number of participants is limited, so book your place in advance!', 'f24a59b6fb42b379'),
(47, 'bab94532e681020a', 'Jazz Night: Melodies Under the Stars', '2024-06-13', '21:00:00', 'Open Air Concert Area, Seaside', 800, 'Feel the magic of jazz under the stars.', 'JazzUnderStars will let you enjoy jazz music with an open-air concert by the sea. Famous jazz artists will fascinate the participants by performing unique performances throughout the night. Enjoy an unforgettable jazz experience under the stars in a romantic atmosphere.', 'f24a59b6fb42b379'),
(48, '252febb9d563b9b2', 'RockFest', '2024-07-10', '21:00:00', 'City Amphitheater', 1000, 'An unforgettable night full of the energy of rock music!', 'RockFest is a spectacular concert event where local and national rock bands will perform. A night full of electric performances, exciting solos and unforgettable moments awaits you. An amazing experience for rock music lovers!', 'f24a59b6fb42b379'),
(49, '617843b033af166c', 'Art-Full Museum Trip', '2024-04-12', '15:00:00', 'City Art Museum', 30, 'Journey to unique works in the city\'s most important art museum.', 'The ArtExplorer event invites participants to discover the city\'s rich art heritage. The event, which will start with a guided museum tour, will focus on important works from different art movements and periods. Additionally, there will be conversations about art and sharing of experiences among the participants.', 'f24a59b6fb42b379'),
(50, '755a16d98e9d42d4', 'Multilingual Language Marathon', '2023-12-14', '18:00:00', 'European Language School', 50, 'Language marathon with language instructors for those who want to learn more than one language!', 'TheMultilingual Language Marathon event offers participants the opportunity to learn more than one language at the same time. During a day full of language instructors, language practices and language exchanges, participants will interact with each other while learning new languages. The event will also include language learning strategies, grammar games and cultural sharing.', 'f24a59b6fb42b379');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_eventID` (`eventID`),
  ADD KEY `organizerID` (`organizerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`organizerID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
