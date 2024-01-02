-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 12:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `type19_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `year`, `cat_id`, `isDeleted`) VALUES
(1, 'Book about Crime', 'James Band', '2015', 4, 0),
(2, '1983', 'James Carr', '1983', 2, 1),
(3, 'Little Prince', 'Jane Dow', '1999', 3, 0),
(4, 'War and Peace', 'James Band', '1965', 2, 0),
(5, 'Time is Money', 'Fabien Olicard', '2015', 5, 0),
(6, 'do less', 'Kate Northrup', '2018', 5, 0),
(10, 'do less', 'Kate Northrup', '2018', 5, 1),
(11, 'New book from post', 'AS TU', '2024', 2, 0),
(12, 'New book from post 2', 'Naujoviskas', '2024', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `category`) VALUES
(1, 'Comedy'),
(2, 'Thriller'),
(3, 'Fantasy'),
(4, 'Detective'),
(5, 'Spiritual'),
(6, 'Psychology'),
(7, 'Drame');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `author`, `date`, `body`) VALUES
(5, 'Post 5 Update', 'Serbentautas 3000', '2023-12-15', 'Post about Boxing from T. '),
(6, 'Post 5 Update', 'Serbentautas 3000', '2023-11-05', 'Post 6 about Jane'),
(7, 'Post Rest', 'Mike Rest', '2023-12-15', 'Post about Boxing from T. '),
(8, 'Post Rest', 'Mike Rest', '2023-12-15', 'Post about Boxing from T. '),
(9, 'Post from REST REST', 'James Rest', '2000-01-02', 'This is some meaningfull content'),
(10, 'Post from REST REST', 'James Rest', '2000-01-02', 'This is some meaningfull content'),
(11, 'SeKantis Postas', 'James Rest', '2000-01-02', 'This is some meaningfull content'),
(12, 'Najas postas from Front', 'Sarunas Tarvydas', '2023-12-28', 'Kuriu kortele kuri paimta is inputu nuvaziuoja i back i mano db ir is ten sugryzta i sita puslapi ir atsivaizduoja korteles pavidalu'),
(13, '1 Testas Ar nuves mane i index.html ', 'Karen Chen', '2023-12-28', 'Ar nuves mane i index.html '),
(14, 'Test 2', 'Sarah Lee', '2023-12-28', 'Antras testas ar nuves mane i html'),
(15, '3 testas', 'undefined', '2023-12-27', 'bandau dar bet jei blogai tai tik klaida tikriausiai cia window.location.href = \'index.html\';'),
(16, '4 testas', 'Karen Chen', '2023-12-28', 'jau atsibodo bandau dar bet jei blogai tai tik klaida tikriausiai cia window.location.href = \'index.html\';'),
(17, 'SeKantis Postas', 'James Rest', '2000-01-02', 'This is some meaningfull content'),
(18, 'SeKantis Postas', 'James Rest', '2000-01-02', 'This is some meaningfull content'),
(19, 'testas po Mariaus', 'sgg', '2023-12-29', 'Antras .then fetche reikalingas kai norime kazka pasiimti is data is back bet jei ne tai jis mums nereikalingas o jei ieskome atsakymu tokiu kaip statutus ir t.t tai jie randasi 1 then resp');

-- --------------------------------------------------------

--
-- Table structure for table `shirts`
--

CREATE TABLE `shirts` (
  `shirt_id` int(10) UNSIGNED NOT NULL,
  `shirt_brand` varchar(255) NOT NULL,
  `shirt_model` varchar(255) NOT NULL,
  `shirt_size` varchar(5) NOT NULL,
  `shirt_price` decimal(2,0) UNSIGNED NOT NULL,
  `shirt_discription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shirts`
--

INSERT INTO `shirts` (`shirt_id`, `shirt_brand`, `shirt_model`, `shirt_size`, `shirt_price`, `shirt_discription`) VALUES
(1, 'Saint Lorent', '', 'XL', 25, 'Cia jo marskineliai geri'),
(2, 'MIskinis', 'trumpom rankovem', 'XL', 8, 'Nelabai grazus'),
(5, 'guess', '', 'M', 13, 'Cia jo marskineliai geri'),
(6, 'Zara', 'trumpom rankovem', 'L', 18, 'Nelabai grazus'),
(7, 'Loreal', '', 'XXL', 15, 'Cia jo marskineliai geri'),
(8, 'Lombardo', 'trumpom rankovem', 'XXS', 13, 'Nelabai grazus'),
(9, 'Pugaci', '', 'M', 35, 'Cia jo marskineliai geri'),
(10, 'Kiti marskineliai', 'trumpom rankovem', 'XM', 12, 'Nelabai grazus'),
(11, 'Saint Lorent', '', 'XS', 8, 'Cia jo marskineliai geri'),
(12, 'Bucio', 'trumpom rankovem', 'XXL', 18, 'Nelabai grazus'),
(13, 'Saint Lorent', '', 'L', 25, 'Cia jo marskineliai geri'),
(14, 'Kiti marskineliai', 'trumpom rankovem', 'XS', 8, 'Nelabai grazus'),
(15, 'Saint Lorent', '', 'M', 25, 'Cia jo marskineliai geri'),
(16, 'Kiti marskineliai', 'trumpom rankovem', 'XS', 8, 'Nelabai grazus'),
(17, 'Saint Lorent', '', 'XXL', 25, 'Cia jo marskineliai geri'),
(18, 'Doolingo', 'Baliniai', 'L', 99, 'Labai geri ir populiarus');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `timestamp`) VALUES
(1, 'james@band.com', '123456', '2023-12-27 07:32:27'),
(2, 'mike@tison.com', 'secret123', '2023-12-27 07:33:28'),
(3, 'jane@dow.com', 'secret456', '2023-12-27 07:34:19'),
(4, 'testUsername', 'testValue', '2023-12-27 17:15:10'),
(7, 'blue@camme.com', '123456sec', '2023-12-27 17:35:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `shirts`
--
ALTER TABLE `shirts`
  ADD PRIMARY KEY (`shirt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `shirts`
--
ALTER TABLE `shirts`
  MODIFY `shirt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
