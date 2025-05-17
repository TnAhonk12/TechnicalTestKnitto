-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2025 at 04:56 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_api_be_knitto`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy_logs`
--

CREATE TABLE `buy_logs` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `code_order` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buy_logs`
--

INSERT INTO `buy_logs` (`id`, `customer_id`, `code_order`, `amount`, `created_at`) VALUES
(1, 2, 'ORD-0002', 50000, '2025-05-04 19:32:46'),
(2, 2, 'ORD-0002', 50000, '2025-05-05 17:51:41'),
(3, 1, 'ORD-0004', 50000, '2025-05-05 18:16:23'),
(4, 1, 'ORD-0004', 50000, '2025-05-05 18:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `balance`) VALUES
(1, 'aulia fathurohman', 900000),
(2, 'Angga nugroho', 9900000),
(4, 'Aulia Fathurohman', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `price`, `stock`, `created_at`) VALUES
(1, 'combed 30s', 5000, 80, '2025-05-04 07:34:34'),
(2, 'combed 29s', 4000, 100, '2025-05-04 07:34:34'),
(3, 'combed 28s', 7000, 100, '2025-05-04 07:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `order_id`, `create_at`) VALUES
(2, 6, '2025-05-16 07:57:53'),
(4, 8, '2025-05-16 08:20:37'),
(5, 9, '2025-05-16 08:24:38'),
(6, 10, '2025-05-16 08:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `customer_id`, `item_id`, `qty`, `created_at`) VALUES
(15, 'ORDER-4-170525-00001', 4, 1, 2, '2025-05-17 02:20:21'),
(17, 'ORDER-4-170525-06504', 4, 1, 2, '2025-05-17 02:26:46'),
(18, 'ORDER-4-170525-11437', 4, 1, 2, '2025-05-17 02:26:51'),
(19, 'ORDER-4-170525-94115', 4, 1, 2, '2025-05-17 02:34:54'),
(20, 'ORDER-4-170525-76282', 4, 1, 2, '2025-05-17 02:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `task_logs`
--

CREATE TABLE `task_logs` (
  `id` int(11) NOT NULL,
  `message` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_logs`
--

INSERT INTO `task_logs` (`id`, `message`, `created_at`) VALUES
(2, 'udah jam 9 nih!', '2025-05-05 02:00:00'),
(3, 'udah jam 9 nih!', '2025-05-05 17:53:00'),
(4, 'udah jam 9 nih!', '2025-05-05 17:54:00'),
(5, 'udah jam 9 nih!', '2025-05-05 17:55:00'),
(6, 'udah jam 9 nih!', '2025-05-05 17:56:00'),
(7, 'udah jam 9 nih!', '2025-05-05 17:57:00'),
(8, 'udah jam 9 nih!', '2025-05-05 17:58:00'),
(9, 'udah jam 9 nih!', '2025-05-05 17:59:00'),
(10, 'udah jam 9 nih!', '2025-05-05 18:00:00'),
(11, 'udah jam 9 nih!', '2025-05-05 18:01:00'),
(12, 'udah jam 9 nih!', '2025-05-05 18:02:00'),
(13, 'udah jam 9 nih!', '2025-05-05 18:03:00'),
(14, 'udah jam 9 nih!', '2025-05-05 18:04:00'),
(15, 'udah jam 9 nih!', '2025-05-05 18:05:00'),
(16, 'udah jam 9 nih!', '2025-05-05 18:06:00'),
(17, 'udah jam 9 nih!', '2025-05-05 18:07:00'),
(18, 'udah jam 9 nih!', '2025-05-05 18:08:00'),
(19, 'udah jam 9 nih!', '2025-05-05 18:09:00'),
(20, 'udah jam 9 nih!', '2025-05-05 18:10:00'),
(21, 'udah jam 9 nih!', '2025-05-05 18:11:00'),
(22, 'udah jam 9 nih!', '2025-05-05 18:12:00'),
(23, 'udah jam 9 nih!', '2025-05-05 18:13:00'),
(24, 'udah jam 9 nih!', '2025-05-05 18:14:00'),
(25, 'udah jam 9 nih!', '2025-05-05 18:15:00'),
(26, 'udah jam 9 nih!', '2025-05-05 18:17:00'),
(27, 'udah jam 9 nih!', '2025-05-05 18:18:00'),
(28, 'udah jam 9 nih!', '2025-05-16 07:52:01'),
(29, 'udah jam 9 nih!', '2025-05-16 07:53:00'),
(30, 'udah jam 9 nih!', '2025-05-16 07:54:00'),
(31, 'udah jam 9 nih!', '2025-05-16 07:55:00'),
(32, 'udah jam 9 nih!', '2025-05-16 07:56:00'),
(33, 'udah jam 9 nih!', '2025-05-16 07:57:00'),
(34, 'udah jam 9 nih!', '2025-05-16 07:58:00'),
(35, 'udah jam 9 nih!', '2025-05-16 07:59:00'),
(36, 'udah jam 9 nih!', '2025-05-16 08:00:00'),
(37, 'udah jam 9 nih!', '2025-05-16 08:01:00'),
(38, 'udah jam 9 nih!', '2025-05-16 08:02:00'),
(39, 'udah jam 9 nih!', '2025-05-16 08:03:00'),
(40, 'udah jam 9 nih!', '2025-05-16 08:05:00'),
(41, 'udah jam 9 nih!', '2025-05-16 08:06:00'),
(42, 'udah jam 9 nih!', '2025-05-16 08:07:00'),
(43, 'udah jam 9 nih!', '2025-05-16 08:08:00'),
(44, 'udah jam 9 nih!', '2025-05-16 08:09:00'),
(45, 'udah jam 9 nih!', '2025-05-16 08:10:00'),
(46, 'udah jam 9 nih!', '2025-05-16 08:11:00'),
(47, 'udah jam 9 nih!', '2025-05-16 08:12:00'),
(48, 'udah jam 9 nih!', '2025-05-16 08:13:00'),
(49, 'udah jam 9 nih!', '2025-05-16 08:14:00'),
(50, 'udah jam 9 nih!', '2025-05-16 08:15:00'),
(51, 'udah jam 9 nih!', '2025-05-16 08:16:00'),
(52, 'udah jam 9 nih!', '2025-05-16 08:17:00'),
(53, 'udah jam 9 nih!', '2025-05-16 08:18:00'),
(54, 'udah jam 9 nih!', '2025-05-16 08:19:00'),
(55, 'udah jam 9 nih!', '2025-05-16 08:20:00'),
(56, 'udah jam 9 nih!', '2025-05-16 08:21:00'),
(57, 'udah jam 9 nih!', '2025-05-16 08:22:00'),
(58, 'udah jam 9 nih!', '2025-05-16 08:23:00'),
(59, 'udah jam 9 nih!', '2025-05-16 08:24:00'),
(60, 'udah jam 9 nih!', '2025-05-16 08:25:00'),
(61, 'udah jam 9 nih!', '2025-05-16 08:26:00'),
(62, 'udah jam 9 nih!', '2025-05-16 08:27:00'),
(63, 'udah jam 9 nih!', '2025-05-16 08:28:00'),
(64, 'udah jam 9 nih!', '2025-05-16 08:29:00'),
(65, 'udah jam 9 nih!', '2025-05-16 08:30:00'),
(66, 'udah jam 9 nih!', '2025-05-16 08:31:00'),
(67, 'udah jam 9 nih!', '2025-05-16 08:32:00'),
(68, 'udah jam 9 nih!', '2025-05-16 08:33:00'),
(69, 'udah jam 9 nih!', '2025-05-16 08:34:00'),
(70, 'udah jam 9 nih!', '2025-05-16 08:35:00'),
(71, 'udah jam 9 nih!', '2025-05-16 08:36:00'),
(72, 'udah jam 9 nih!', '2025-05-16 08:37:00'),
(73, 'udah jam 9 nih!', '2025-05-16 08:38:00'),
(74, 'udah jam 9 nih!', '2025-05-16 08:39:00'),
(75, 'udah jam 9 nih!', '2025-05-16 08:40:00'),
(76, 'udah jam 9 nih!', '2025-05-16 08:41:00'),
(77, 'udah jam 9 nih!', '2025-05-16 08:42:00'),
(78, 'udah jam 9 nih!', '2025-05-16 08:43:00'),
(79, 'udah jam 9 nih!', '2025-05-16 08:44:00'),
(80, 'udah jam 9 nih!', '2025-05-16 08:45:00'),
(81, 'udah jam 9 nih!', '2025-05-16 08:46:00'),
(82, 'udah jam 9 nih!', '2025-05-16 08:47:00'),
(83, 'udah jam 9 nih!', '2025-05-16 08:48:00'),
(84, 'udah jam 9 nih!', '2025-05-16 08:49:00'),
(85, 'udah jam 9 nih!', '2025-05-16 08:50:00'),
(86, 'udah jam 9 nih!', '2025-05-16 08:51:00'),
(87, 'udah jam 9 nih!', '2025-05-16 08:52:00'),
(88, 'udah jam 9 nih!', '2025-05-16 08:53:00'),
(89, 'udah jam 9 nih!', '2025-05-16 08:54:00'),
(90, 'udah jam 9 nih!', '2025-05-16 08:55:00'),
(91, 'udah jam 9 nih!', '2025-05-16 08:56:00'),
(92, 'udah jam 9 nih!', '2025-05-16 08:57:00'),
(93, 'udah jam 9 nih!', '2025-05-16 08:58:00'),
(94, 'udah jam 9 nih!', '2025-05-16 08:59:00'),
(95, 'udah jam 9 nih!', '2025-05-16 09:00:00'),
(96, 'udah jam 9 nih!', '2025-05-16 09:01:00'),
(97, 'udah jam 9 nih!', '2025-05-16 09:02:00'),
(98, 'udah jam 9 nih!', '2025-05-16 09:03:00'),
(99, 'udah jam 9 nih!', '2025-05-16 09:04:00'),
(100, 'udah jam 9 nih!', '2025-05-16 09:05:00'),
(101, 'udah jam 9 nih!', '2025-05-16 09:06:00'),
(102, 'udah jam 9 nih!', '2025-05-16 09:07:00'),
(103, 'udah jam 9 nih!', '2025-05-16 09:08:00'),
(104, 'udah jam 9 nih!', '2025-05-16 09:09:00'),
(105, 'udah jam 9 nih!', '2025-05-16 09:10:00'),
(106, 'udah jam 9 nih!', '2025-05-16 09:11:00'),
(107, 'udah jam 9 nih!', '2025-05-16 09:12:00'),
(108, 'udah jam 9 nih!', '2025-05-16 09:13:00'),
(109, 'udah jam 9 nih!', '2025-05-16 09:14:00'),
(110, 'udah jam 9 nih!', '2025-05-16 09:15:00'),
(111, 'udah jam 9 nih!', '2025-05-16 09:16:00'),
(112, 'udah jam 9 nih!', '2025-05-16 09:17:00'),
(113, 'udah jam 9 nih!', '2025-05-16 09:18:00'),
(114, 'udah jam 9 nih!', '2025-05-16 09:19:00'),
(115, 'udah jam 9 nih!', '2025-05-16 09:20:00'),
(116, 'udah jam 9 nih!', '2025-05-16 09:21:00'),
(117, 'udah jam 9 nih!', '2025-05-16 09:22:00'),
(118, 'udah jam 9 nih!', '2025-05-16 09:23:00'),
(119, 'udah jam 9 nih!', '2025-05-16 09:24:00'),
(120, 'udah jam 9 nih!', '2025-05-16 09:25:00'),
(121, 'udah jam 9 nih!', '2025-05-16 09:26:00'),
(122, 'udah jam 9 nih!', '2025-05-16 09:27:00'),
(123, 'udah jam 9 nih!', '2025-05-16 09:28:00'),
(124, 'udah jam 9 nih!', '2025-05-16 09:29:00'),
(125, 'udah jam 9 nih!', '2025-05-16 09:30:00'),
(126, 'udah jam 9 nih!', '2025-05-16 09:31:00'),
(127, 'udah jam 9 nih!', '2025-05-16 09:32:00'),
(128, 'udah jam 9 nih!', '2025-05-16 09:33:00'),
(129, 'udah jam 9 nih!', '2025-05-16 09:34:00'),
(130, 'udah jam 9 nih!', '2025-05-16 09:35:00'),
(131, 'udah jam 9 nih!', '2025-05-16 09:36:00'),
(132, 'udah jam 9 nih!', '2025-05-16 09:37:00'),
(133, 'udah jam 9 nih!', '2025-05-16 09:38:00'),
(134, 'udah jam 9 nih!', '2025-05-16 09:39:00'),
(135, 'udah jam 9 nih!', '2025-05-16 09:40:00'),
(136, 'udah jam 9 nih!', '2025-05-16 09:41:00'),
(137, 'udah jam 9 nih!', '2025-05-16 09:42:00'),
(138, 'udah jam 9 nih!', '2025-05-16 09:43:00'),
(139, 'udah jam 9 nih!', '2025-05-16 09:44:00'),
(140, 'udah jam 9 nih!', '2025-05-16 09:45:00'),
(141, 'udah jam 9 nih!', '2025-05-16 09:46:00'),
(142, 'udah jam 9 nih!', '2025-05-16 09:47:00'),
(143, 'udah jam 9 nih!', '2025-05-16 09:48:00'),
(144, 'udah jam 9 nih!', '2025-05-16 09:49:00'),
(145, 'udah jam 9 nih!', '2025-05-16 09:50:00'),
(146, 'udah jam 9 nih!', '2025-05-16 09:51:00'),
(147, 'udah jam 9 nih!', '2025-05-16 09:52:00'),
(148, 'udah jam 9 nih!', '2025-05-16 09:53:00'),
(149, 'udah jam 9 nih!', '2025-05-16 09:54:00'),
(150, 'udah jam 9 nih!', '2025-05-16 09:55:00'),
(151, 'udah jam 9 nih!', '2025-05-16 09:56:00'),
(152, 'udah jam 9 nih!', '2025-05-16 09:57:00'),
(153, 'udah jam 9 nih!', '2025-05-16 09:58:00'),
(154, 'udah jam 9 nih!', '2025-05-16 09:59:00'),
(155, 'udah jam 9 nih!', '2025-05-16 10:00:00'),
(156, 'udah jam 9 nih!', '2025-05-16 10:01:00'),
(157, 'udah jam 9 nih!', '2025-05-16 10:02:00'),
(158, 'udah jam 9 nih!', '2025-05-16 10:03:00'),
(159, 'udah jam 9 nih!', '2025-05-16 10:04:00'),
(160, 'udah jam 9 nih!', '2025-05-16 10:05:00'),
(161, 'udah jam 9 nih!', '2025-05-16 10:06:00'),
(162, 'udah jam 9 nih!', '2025-05-16 10:07:00'),
(163, 'udah jam 9 nih!', '2025-05-16 10:08:00'),
(164, 'udah jam 9 nih!', '2025-05-16 10:09:00'),
(165, 'udah jam 9 nih!', '2025-05-16 10:10:00'),
(166, 'udah jam 9 nih!', '2025-05-16 10:11:00'),
(167, 'udah jam 9 nih!', '2025-05-16 10:12:00'),
(168, 'udah jam 9 nih!', '2025-05-16 10:13:00'),
(169, 'udah jam 9 nih!', '2025-05-16 10:14:00'),
(170, 'udah jam 9 nih!', '2025-05-16 10:15:00'),
(171, 'udah jam 9 nih!', '2025-05-16 10:16:00'),
(172, 'udah jam 9 nih!', '2025-05-16 10:17:00'),
(173, 'udah jam 9 nih!', '2025-05-16 10:18:00'),
(174, 'udah jam 9 nih!', '2025-05-16 10:19:00'),
(175, 'udah jam 9 nih!', '2025-05-16 10:20:00'),
(176, 'udah jam 9 nih!', '2025-05-16 10:21:00'),
(177, 'udah jam 9 nih!', '2025-05-16 10:22:00'),
(178, 'udah jam 9 nih!', '2025-05-16 10:23:00'),
(179, 'udah jam 9 nih!', '2025-05-16 10:24:00'),
(180, 'udah jam 9 nih!', '2025-05-16 10:25:00'),
(181, 'udah jam 9 nih!', '2025-05-16 10:26:00'),
(182, 'udah jam 9 nih!', '2025-05-16 10:27:00'),
(183, 'udah jam 9 nih!', '2025-05-16 10:28:00'),
(184, 'udah jam 9 nih!', '2025-05-16 10:29:00'),
(185, 'udah jam 9 nih!', '2025-05-16 10:30:00'),
(186, 'udah jam 9 nih!', '2025-05-16 10:31:00'),
(187, 'udah jam 9 nih!', '2025-05-17 01:38:00'),
(188, 'udah jam 9 nih!', '2025-05-17 01:39:00'),
(189, 'udah jam 9 nih!', '2025-05-17 01:40:00'),
(190, 'udah jam 9 nih!', '2025-05-17 01:41:00'),
(191, 'udah jam 9 nih!', '2025-05-17 01:42:00'),
(192, 'udah jam 9 nih!', '2025-05-17 01:43:00'),
(193, 'udah jam 9 nih!', '2025-05-17 01:44:00'),
(194, 'udah jam 9 nih!', '2025-05-17 02:07:00'),
(195, 'udah jam 9 nih!', '2025-05-17 02:08:00'),
(196, 'udah jam 9 nih!', '2025-05-17 02:09:00'),
(197, 'udah jam 9 nih!', '2025-05-17 02:10:00'),
(198, 'udah jam 9 nih!', '2025-05-17 02:12:00'),
(199, 'udah jam 9 nih!', '2025-05-17 02:13:00'),
(200, 'udah jam 9 nih!', '2025-05-17 02:15:00'),
(201, 'udah jam 9 nih!', '2025-05-17 02:16:00'),
(202, 'udah jam 9 nih!', '2025-05-17 02:18:00'),
(203, 'udah jam 9 nih!', '2025-05-17 02:19:00'),
(204, 'udah jam 9 nih!', '2025-05-17 02:20:00'),
(205, 'udah jam 9 nih!', '2025-05-17 02:21:00'),
(206, 'udah jam 9 nih!', '2025-05-17 02:22:00'),
(207, 'udah jam 9 nih!', '2025-05-17 02:23:00'),
(208, 'udah jam 9 nih!', '2025-05-17 02:24:00'),
(209, 'udah jam 9 nih!', '2025-05-17 02:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `code_unique` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `customer_name`, `address`, `code_unique`) VALUES
(1, 'fathur@gmail.com', 'residentevil', 'aulia fathurohman', 'jl. mario boro', '5F4C9356'),
(2, 'fathur12@gmail.com', 'residentevil', 'Angga nugroho', 'sadas', 'C7B78CF9'),
(4, 'fathurgeometry12@gmail.com', 'residentevil', 'Aulia Fathurohman', 'Test Address', 'CADDD5C4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buy_logs`
--
ALTER TABLE `buy_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_buy_customer_id` (`customer_id`),
  ADD KEY `fk_buy_order_code` (`code_order`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customers_users_name` (`customer_name`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_orders_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `fk_order_customer_id` (`customer_id`),
  ADD KEY `fk_orders_items_id` (`item_id`);

--
-- Indexes for table `task_logs`
--
ALTER TABLE `task_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_customer_id` (`customer_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buy_logs`
--
ALTER TABLE `buy_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `task_logs`
--
ALTER TABLE `task_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buy_logs`
--
ALTER TABLE `buy_logs`
  ADD CONSTRAINT `fk_buy_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_buy_order_code` FOREIGN KEY (`code_order`) REFERENCES `orders` (`code`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_users_name` FOREIGN KEY (`customer_name`) REFERENCES `users` (`customer_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_logs_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_orders_items_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
