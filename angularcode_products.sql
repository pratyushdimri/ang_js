-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2015 at 10:46 AM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `angularcode_products`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers_auth`
--

CREATE TABLE IF NOT EXISTS `customers_auth` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Dumping data for table `customers_auth`
--

INSERT INTO `customers_auth` (`uid`, `name`, `email`, `phone`, `password`, `address`, `city`, `created`) VALUES
(169, 'Swadesh Behera', 'swadesh@gmail.com', '1234567890', '$2a$10$251b3c3d020155f7553c1ugKfEH04BD6nbCbo78AIDVOqS3GVYQ46', '4092 Furth Circle', 'Singapore', '2014-08-31 12:51:20'),
(170, 'Ipsita Sahoo', 'ipsita@gmail.com', '1111111111', '$2a$10$d84ffcf46967db4e1718buENHT7GVpcC7FfbSqCLUJDkKPg4RcgV2', '2, rue du Commerce', 'NYC', '2014-08-31 13:00:58'),
(171, 'Trisha Tamanna Priyadarsini', 'trisha@gmail.com', '2222222222', '$2a$10$c9b32f5baa3315554bffcuWfjiXNhO1Rn4hVxMXyJHJaesNHL9U/O', 'C/ Moralzarzal, 86', 'Burlingame', '2014-08-31 13:02:03'),
(172, 'Sai Rimsha', 'rimsha@gmail.com', '3333333333', '$2a$10$477f7567571278c17ebdees5xCunwKISQaG8zkKhvfE5dYem5sTey', '897 Long Airport Avenue', 'Madrid', '2014-08-31 15:04:21'),
(173, 'Satwik Mohanty', 'satwik@gmail.com', '4444444444', '$2a$10$2b957be577db7727fed13O2QmHMd9LoEUjioYe.zkXP5lqBumI6Dy', 'Lyonerstr. 34', 'San Francisco\n', '2014-08-31 15:06:02'),
(174, 'Tapaswini Sahoo', 'linky@gmail.com', '5555555555', '$2a$10$b2f3694f56fdb5b5c9ebeulMJTSx2Iv6ayQR0GUAcDsn0Jdn4c1we', 'ul. Filtrowa 68', 'Warszawa', '2014-08-31 15:14:54'),
(175, 'Manas Ranjan Subudhi', 'manas@gmail.com', '6666666666', '$2a$10$03ab40438bbddb67d4f13Odrzs6Rwr92xKEYDbOO7IXO8YvBaOmlq', '5677 Strong St.', 'Stavern\n', '2014-08-31 15:15:08'),
(178, 'AngularCode Administrator', 'admin@angularcode.com', '0000000000', '$2a$10$72442f3d7ad44bcf1432cuAAZAURj9dtXhEMBQXMn9C8SpnZjmK1S', 'C/1052, Bangalore', '', '2014-08-31 15:30:26'),
(179, 'Paresh', 'paresh.sarkar@indianic.com', 'Sarkar', '$2a$10$dad413f13f35795cacc93uwoTtwW60PYl0cQgfhQiQyQj/aVPg64i', 'Dev Arc Mall', '', '2015-01-08 08:33:27'),
(181, 'Rahul', 'rahul.mathur@indianic.com', 'Mathur', 'indianic', 'asdfsa sadf', '', '2015-01-10 09:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `mrp` double NOT NULL,
  `description` varchar(500) NOT NULL,
  `packing` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `category` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=969 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `mrp`, `description`, `packing`, `image`, `category`, `stock`, `status`) VALUES
(248, 386, 'Adidas Deo Ice Dive Deo Body Spray   ', 199, 199, '', '150 ml ', 'adidas-adidas-body-deo-ice-dive-150-ml.png', 130, 20, 'Active'),
(318, 6124, 'Baba Ramdev Patanjali Anti Bacterial Herbal Hand Wash Refill   ', 40, 40, '', '200 ml ', 'baba-ramdev-patanjali-anti-bacterial-herbal-hand-wash-refill-200-ml.png', 160, 50, 'Active'),
(432, 5625, 'Adidas Ice Dive Shower Gel   ', 150, 150, '', '250 ml ', 'adidas-ice-dive-shower-gel-250-ml.png', 170, 0, 'Active'),
(448, 2298, 'Axe Denim Cologne Talc   ', 115, 115, '', '300 g ', '1327941212-Jan30-1147.png', 180, 0, 'Active'),
(490, 8909, 'All Out Off Family Insect Repellent Lotion   ', 39, 39, '', '50 ml ', 'missingimagegr200.png', 190, 0, 'Active'),
(589, 4202, 'Baba Ramdev Patanjali Gulab Jal   ', 25, 25, '', '120 ml ', 'patanjali-gulab-jal-120-ml.png', 220, 0, 'Active'),
(722, 8068, 'Areev Melon &amp; Peach Mild Shampoo   ', 275, 275, '', '300 ml ', 'areev-melon-peach-mild-shampoo-v-300-ml-3.png', 200, 0, 'Active'),
(769, 8152, '18 Herbs K-Oil 100% Herbal Care   ', 275, 275, 'Hair Oil', '100 ml ', '18-herbs-18-herbs-k-oil-100-herbal-care-100-ml-1.png', 210, 100, 'Active'),
(797, 8273, 'Baba Ramdev Patanjali Kesh Kanti Anti Dandruff Hair Cleanser With Natural Conditioner   ', 110, 110, 'Anti Dandruff Shampoo', '200 ml ', 'baba-ramdev-patanjali-kesh-kanti-hair-cleanser-with-natural-conditioner-200-ml.png', 230, 22, 'Active'),
(901, 3936, 'Roots Hair Brush 2011   ', 175, 175, 'Hair Brush1', '2 pc', 'roots-hair-brush-2011-1-pc.png', 240, 50, 'Active'),
(918, 4273, 'XYXXYY', 1991, 199, 'Powder and', '2000 ml', 'biotique-bio-henna-fresh-powder-hair-color-90-g.png', 250, 30, 'Active'),
(950, 0, 'dfasfd', 33, 0, 'sdfsadf', '100 gm', '', 0, 3, 'Active'),
(951, 0, 'Testing product', 12, 0, 'tesing product descrition', '200 ml', '', 0, 2, 'Active'),
(952, 0, 'hello product', 500, 0, 'hello product description', '100 gm', '', 0, 200, 'Active'),
(953, 0, 'TG1', 50, 0, 'hello testing', '100 gm', '', 0, 100, 'Active'),
(954, 0, 'Xiaomi', 1000, 0, 'xiaomi smart phone', '10 pc', '', 0, 100, 'Active'),
(955, 0, 'zzsss', 33, 0, 'dfgdsgsd', '10 pc', '', 0, 2, 'Active'),
(956, 0, 'asdfasdf', 22, 0, 'sdfsdfsdf', '200 ml', '', 0, 2, 'Active'),
(957, 0, 'Demo', 12, 0, 'Demo product', '100 gm', '', 0, 300, 'Active'),
(958, 0, 'demo1', 22, 0, 'sfdsdf', '200 ml', '', 0, 23, 'Active'),
(959, 0, 'demo1', 22, 0, 'sfdsdf', '200 ml', '', 0, 23, 'Active'),
(960, 0, 'Demo3', 3, 0, 'example demo3', '100 gm', '', 0, 2, 'Active'),
(961, 0, 'Demo4', 50, 0, 'demo4 example', '100 gm', '', 0, 20, 'Active'),
(962, 0, 'Dmo5', 60, 0, 'demo5 example', '100 gm', '', 0, 55, 'Active'),
(963, 0, 'Dmo5', 60, 0, 'demo5 example', '100 gm', '', 0, 55, 'Active'),
(964, 0, 'Demo6', 3, 0, 'demo6 examle', '4', '', 0, 2, 'Active'),
(965, 0, 'Demo6', 3, 0, 'demo6 examle', '4', '', 0, 2, 'Active'),
(966, 0, 'demo7', 31, 0, 'demo7 example', '2', '', 0, 2, 'Active'),
(967, 0, 'Demo8', 55, 0, 'demo8 example', '22', '', 0, 44, 'Inactive'),
(968, 0, 'Demo9', 6689, 0, 'Demo9 Example', '100 gm', '', 0, 44, 'Inactive');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
