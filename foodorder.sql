-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 08:20 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(10, 'Pizza', 'Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough.', '2023-02-12 15:41:28'),
(11, 'Pasta', 'Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs.', '2023-02-12 15:50:16'),
(12, 'Soup', 'Soup is liquid food, generally served warm or hot that is made by combining ingredients of meat or vegetables.', '2023-02-12 16:06:06'),
(13, 'Dessert', 'Dessert is a course that concludes a meal. The course consists of sweet foods, such as confections.', '2023-02-12 16:10:54'),
(22, 'Beverage', 'A drink or beverage is a liquid intended for human consumption. In addition to their basic function of satisfying thirst.', '2023-03-09 18:18:27'),
(23, 'Snack', 'A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods.', '2023-03-09 18:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(9, 22, 'sn@gmail.com', 124867595, 17, 'Good Service', '2023-03-09 18:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(7, 9, 22, 'Thank You', '2023-03-09 18:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(12, 10, 104, 1),
(13, 10, 105, 1),
(14, 11, 104, 2),
(15, 12, 103, 1),
(16, 13, 54, 1),
(17, 14, 54, 1),
(18, 15, 55, 1),
(19, 16, 54, 1),
(20, 17, 104, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(17, 22, '3 LORONG SELAYANG UTAMA 7, TAMAN SELAYANG UTAMA', 13020, 124870128, 5, '0', '2', '2023-03-09 18:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(54, 'New York-Style Pizza', 20, 'New York-style pizza is one of Americaâ€™s most famous regional pizza types. Originally a variation of Neapolitan-style pizza, the New York slice has taken on a fame all its own, with some saying its unique flavor has to do with the minerals present in New Yorkâ€™s tap water supply.', 10, '2023-02-12 15:43:20'),
(55, 'Sicilian Pizza', 23, 'Sicilian pizza, also known as \"sfincione,\" provides a thick cut of pizza with pillowy dough, a crunchy crust, and robust tomato sauce. This square-cut pizza is served with or without cheese, and often with the cheese underneath the sauce to prevent the pie from becoming soggy. Sicilian pizza was brought to America in the 19th century by Sicilian immigrants and became popular in the United States after the Second World War.', 10, '2023-02-12 15:47:50'),
(102, 'Spaghetti Carbonara', 15, 'This bacon carbonara is super rich, classic \"bacon and egg\" spaghetti dish that great to serve for people.', 11, '2023-02-12 15:59:30'),
(103, 'Tomato soup', 8, 'A classic creamy soup served with crispy bread croutons. This fresh tomato soup ticks all the boxes of a perfect bowl of comfort food.', 12, '2023-02-12 16:08:52'),
(104, 'CrÃ¨me BrÃ»lÃ©e', 5, 'CrÃ¨me BrulÃ©e, also known as burnt cream or Trinity cream, and virtually identical to the original crema catalana, is a dessert consisting of a rich custard base topped with a layer of hardened caramelized sugar.', 13, '2023-02-12 16:12:45'),
(105, 'Chocolate Ice Cream', 3, 'Chocolate ice cream is ice cream with natural or artificial chocolate flavoring.', 13, '2023-02-12 16:14:40'),
(113, 'Orange Juice', 1, 'Orange juice is a liquid extract of the orange tree fruit, produced by squeezing or reaming oranges. It comes in several different varieties.', 22, '2023-03-09 18:20:38'),
(114, 'Potato Chip', 1, 'A potato chip or crisp is a thin slice of potato that has been deep fried, baked, or air fried until crunchy. ', 23, '2023-03-09 18:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 123456789, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2023-01-11 11:40:58'),
(22, 'sinnee', 'sinnee', 'tan', 'sn@gmail.com', 124867595, '0', '$2y$10$japfJu1ppwFB4JN9mjurVeDlL28yVXDLwoFeD1RIC/gHqeABkagva', '2023-02-28 23:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(2, 54, 1, 2, '2023-02-12 18:31:17'),
(3, 102, 1, 2, '2023-02-12 19:08:50'),
(13, 54, 1, 4, '2023-02-12 20:04:21'),
(15, 103, 1, 3, '2023-02-27 16:43:02'),
(23, 104, 1, 12, '2023-02-28 21:55:54'),
(26, 104, 1, 18, '2023-02-28 22:54:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
