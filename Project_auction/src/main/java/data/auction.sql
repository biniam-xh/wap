-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2019 at 06:04 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `imageURL` varchar(200) NOT NULL DEFAULT 'https://images.samsung.com/is/image/samsung/my-uhdtv-nu8000-ua55nu8000kxxm-frontblack-97001972?$PD_GALLERY_L_JPG$',
  `description` varchar(300) NOT NULL,
  `bid_amount` double NOT NULL,
  `current_bidder` varchar(30) NOT NULL,
  `expiration_date` date NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`, `imageURL`, `description`, `bid_amount`, `current_bidder`, `expiration_date`, `paid`) VALUES
(3, 'A French Provincial Fruitwood Cabinet', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/433010/large_293109-3_1.jpg', '17th Century \r\nwith two doors and a drawer, the drawer dated 1645. \r\nHeight 56 1/4 x width 23 1/2 x depth 18 3/4 inches.', 2000, 'ben@gmail.com', '2019-07-15', 1),
(4, 'A French Provincial Bombe Commode', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/431230/large_293088-140_1.jpg', '18th Century\r\nHeight 40 x width 54 x depth 29 inches.', 1502, 'biniam.tenaw8@gmail.com', '2019-07-18', 0),
(5, 'A French Provincial Gilt Bronze Mounted Salon Table', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430968/large_293088-84_1.jpg', '18th Century\r\nHeight 30 x width 62 x depth 39 1/2 inches.', 1520, 'ben@gmail.com', '2019-07-19', 0),
(6, 'A French Provincial Walnut Daybed', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/429645/large_292988-32_1.jpg', '18th Century\r\nwith later upholstery and cushions.\r\nHeight 35 3/8 x width 37 1/4 inches. \r\nProperty from the Estate of Victor Carlson, Chicago, Illinois\r\nProperty from the Estate of Victor Carlson, Chicago, Illinois', 1550, 'ben@gmail.com', '2019-07-19', 0),
(7, 'A French Provincial Walnut Commode', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/433008/large_293109-7_2_1.jpg', 'Late 18th Century \r\nHeight 34 1/2 x width 47 x depth 24 1/2 inches. \r\n\r\nProvenance: \r\nPurchased Tess Sinclair, Suffolk, United Kingdom, November 15, 1996', 1500, '', '2019-07-31', 0),
(8, 'A French Provincial Oak Bookcase', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/431598/large_293086-10_2_1.jpg', 'Late 18th/Early 19th Century\r\nHeight 87 x width 59 1/2 x depth 21 inches. ', 1205, 'ben@gmail.com', '2019-07-29', 0),
(9, 'A Régence Painted Side Cabinet', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430979/large_293088-93_1.jpg', '18th Century with Later Elements \r\nHeight 33 1/2 x width 54 x depth 21 1/2 inches.', 5002, 'ben@gmail.com', '2019-07-18', 0),
(10, 'A Régence Style Walnut Center Table', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/431220/large_293088-124_1.jpg', '19th Century with Associated Top \r\nHeight 30 1/2 x width 58 3/4 x depth 34 inches. ', 3500, '', '2019-07-18', 0),
(11, 'A Pair of Louis XV Style Gilt Bronze Chenets', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430917/large_293088-154_1.jpg', '19th Century\r\nHeight 19 1/2 x width 16 inches.', 7000, 'ben@gmail.com', '2019-07-16', 0),
(12, 'A Régence Style Walnut Center Table', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/431220/large_293088-124_1.jpg', '19th Century with Associated Top \r\nHeight 30 1/2 x width 58 3/4 x depth 34 inches. ', 3500, '', '2019-07-19', 0),
(13, 'A French Provincial Walnut Daybed hyui', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/429645/large_292988-32_1.jpg', '18th Century\r\nwith later upholstery and cushions.\r\nHeight 35 3/8 x width 37 1/4 inches. \r\nProperty from the Estate of Victor Carlson, Chicago, Illinois\r\nProperty from the Estate of Victor Carlson, Chicago, Illinois', 8000, '', '2019-07-27', 0),
(14, 'A Pair of Régence Style Walnut Bergères', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430747/large_292905-37_1_1.jpg', 'Late 19th/Early 20th Century\r\nthe domed padded back, sides and arms above the stuffover seat, raised on cabriole legs, the upholstery depicting flowering urns. \r\nHeight 41 1/2 inches. \r\nProperty from the Collection of James Flynn and Bill Wiley, Chicago, Illinois \r\nProperty from the Collection of Ja', 7000, '', '2019-07-17', 0),
(15, 'A Louis XV Style Gilt Bronze Mounted Vernis Martin Cabinet', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430431/large_293088-174_1.jpg', 'Height 76 x width 36 x depth 18 inches.', 2000, '', '2019-07-18', 0),
(16, 'A French Provincial Gilt Bronze Mounted Salon Table 2', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/430968/large_293088-84_1.jpg', '18th Century\r\nHeight 30 x width 62 x depth 39 1/2 inches.', 1510, 'biniam.tenaw@gmail.com', '2019-07-19', 0),
(17, 'A French Provincial Walnut Daybed 2', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/429645/large_292988-32_1.jpg', '18th Century\r\nwith later upholstery and cushions.\r\nHeight 35 3/8 x width 37 1/4 inches. \r\nProperty from the Estate of Victor Carlson, Chicago, Illinois\r\nProperty from the Estate of Victor Carlson, Chicago, Illinois', 1500, '', '2019-07-19', 0),
(18, 'A French Provincial Walnut Commode 2', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/433008/large_293109-7_2_1.jpg', 'Late 18th Century \r\nHeight 34 1/2 x width 47 x depth 24 1/2 inches. \r\n\r\nProvenance: \r\nPurchased Tess Sinclair, Suffolk, United Kingdom, November 15, 1996', 1500, '', '2019-07-31', 0),
(19, 'A Pair of Louis XV Style Gilt Bronze Five-Light Sconces', 'https://hindman-production.s3.amazonaws.com/uploads/published_image/the_image/431558/large_292847-2_1.jpg', '19th Century \r\nHeight 15 1/2 x width 15 3/4 inches. ', 1000, '', '2019-07-20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `address`) VALUES
(1, 'Biniam', 'Tenaw', 'biniam.tenaw@gmail.com', 'password1', '1000 North 4th St ,  Fairfield Iowa, USA,52557'),
(2, 'Biniam', 'Tenaw', 'ben@gmail.com', 'password1', '1000 North 4th St ,  Fairfield Iowa, USA,52557'),
(3, 'Biniam', 'Tenaw', 'biniam.tenaw2@gmail.com', 'jlkjljjkj9', '1000 North 4th St ,  Fairfield Iowa, USA,52557'),
(4, 'Biniam', 'Tenaw', 'biniam.tenaw0@gmail.com', 'password1', '1000 North 4th St ,  Fairfield Iowa, USA,52557'),
(5, 'Biniam', 'Tenaw', 'biniam.tenaw3@gmail.com', 'password1', '1000 North 4th St ,  Fairfield Iowa, USA,52557'),
(6, 'Biniam', 'Tenaw', 'biniam.tenaw8@gmail.com', 'password1', '1000 North 4th St ,  Fairfield Iowa, USA,52557');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
