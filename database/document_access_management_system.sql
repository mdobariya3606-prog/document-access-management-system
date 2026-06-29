-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2026 at 07:05 AM
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
-- Database: `document_access_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `action` enum('REGISTER','UPDATE_PROFILE','LOGIN','LOGOUT','UPLOAD','DOWNLOAD','DELETE_FILE','DELETE_USER','RENAME','SHARE','PASSWORD_RESET','PASSWORD_CHANGE') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `document_id`, `action`, `created_at`) VALUES
(7, 2, NULL, 'LOGIN', '2026-06-19 08:43:44'),
(8, 2, NULL, 'LOGOUT', '2026-06-19 08:56:06'),
(9, 2, NULL, 'LOGIN', '2026-06-19 08:57:50'),
(10, 2, NULL, 'LOGOUT', '2026-06-19 08:57:53'),
(11, 2, NULL, 'LOGIN', '2026-06-19 08:57:57'),
(12, 2, NULL, 'LOGOUT', '2026-06-19 09:04:50'),
(13, 2, NULL, 'LOGIN', '2026-06-19 09:06:45'),
(14, 2, NULL, 'LOGOUT', '2026-06-19 09:07:14'),
(15, 2, NULL, 'LOGIN', '2026-06-19 09:07:20'),
(16, 2, NULL, 'PASSWORD_RESET', '2026-06-19 09:22:29'),
(17, 2, NULL, 'LOGOUT', '2026-06-19 09:22:34'),
(18, 2, NULL, 'PASSWORD_RESET', '2026-06-19 09:23:13'),
(19, 2, NULL, 'LOGIN', '2026-06-19 09:23:19'),
(20, 2, NULL, 'LOGOUT', '2026-06-19 09:24:17'),
(21, 1, NULL, 'REGISTER', '2026-06-19 09:24:40'),
(22, 1, NULL, 'LOGIN', '2026-06-19 09:26:10'),
(23, 1, NULL, 'LOGOUT', '2026-06-19 09:29:33'),
(24, 1, NULL, 'LOGIN', '2026-06-19 09:29:48'),
(25, 1, NULL, 'LOGOUT', '2026-06-19 09:30:30'),
(26, 1, NULL, 'LOGIN', '2026-06-19 09:30:35'),
(27, 1, NULL, 'LOGOUT', '2026-06-19 09:30:46'),
(30, 1, NULL, 'LOGIN', '2026-06-19 09:31:07'),
(31, 1, NULL, 'LOGOUT', '2026-06-19 10:18:59'),
(32, 1, NULL, 'LOGIN', '2026-06-19 10:21:21'),
(33, 1, NULL, 'LOGIN', '2026-06-19 10:21:52'),
(34, 1, NULL, 'LOGOUT', '2026-06-19 10:22:00'),
(35, 1, NULL, 'LOGOUT', '2026-06-19 10:22:59'),
(36, 1, NULL, 'LOGIN', '2026-06-19 10:23:04'),
(37, 1, NULL, 'LOGOUT', '2026-06-19 10:23:45'),
(38, 1, NULL, 'LOGIN', '2026-06-19 10:23:50'),
(39, 1, NULL, 'LOGIN', '2026-06-19 10:24:13'),
(40, 1, NULL, 'LOGOUT', '2026-06-19 10:25:36'),
(41, 1, NULL, 'LOGIN', '2026-06-19 10:25:44'),
(42, 1, NULL, 'LOGOUT', '2026-06-19 10:25:54'),
(43, 1, NULL, 'LOGIN', '2026-06-19 10:26:24'),
(48, 1, NULL, 'LOGIN', '2026-06-19 10:40:20'),
(49, 1, NULL, 'LOGOUT', '2026-06-19 10:40:24'),
(53, 2, NULL, 'LOGIN', '2026-06-19 11:26:18'),
(54, 2, NULL, 'LOGIN', '2026-06-19 11:31:46'),
(55, 2, NULL, 'LOGIN', '2026-06-19 11:32:02'),
(56, 2, NULL, 'LOGOUT', '2026-06-19 11:39:24'),
(57, 2, NULL, 'LOGIN', '2026-06-19 11:39:29'),
(58, 2, NULL, 'LOGOUT', '2026-06-19 11:51:08'),
(59, 2, NULL, 'LOGIN', '2026-06-19 11:51:13'),
(60, 2, NULL, 'PASSWORD_RESET', '2026-06-19 12:06:29'),
(61, 2, NULL, 'LOGOUT', '2026-06-19 12:06:33'),
(62, 2, NULL, 'LOGIN', '2026-06-19 12:06:48'),
(63, 2, NULL, 'PASSWORD_RESET', '2026-06-19 12:09:57'),
(70, 2, NULL, 'LOGIN', '2026-06-20 03:35:39'),
(71, 2, NULL, 'PASSWORD_RESET', '2026-06-20 03:39:15'),
(72, 2, NULL, 'LOGOUT', '2026-06-20 03:39:25'),
(73, 2, NULL, 'LOGIN', '2026-06-20 03:39:36'),
(74, 2, NULL, 'PASSWORD_RESET', '2026-06-20 03:39:48'),
(75, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:09:03'),
(76, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:09:08'),
(77, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:09:51'),
(78, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:10:01'),
(79, 1, NULL, 'LOGIN', '2026-06-20 04:13:47'),
(80, 1, NULL, 'UPDATE_PROFILE', '2026-06-20 04:13:59'),
(81, 1, NULL, 'UPDATE_PROFILE', '2026-06-20 04:14:03'),
(82, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:14:31'),
(83, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:15:24'),
(84, 2, NULL, 'UPDATE_PROFILE', '2026-06-20 04:15:31'),
(85, 2, NULL, 'LOGOUT', '2026-06-20 06:17:32'),
(101, 1, NULL, 'LOGIN', '2026-06-20 06:52:15'),
(105, 2, NULL, 'LOGIN', '2026-06-22 04:28:56'),
(107, 2, NULL, 'LOGOUT', '2026-06-22 04:53:35'),
(108, 1, NULL, 'LOGIN', '2026-06-22 04:53:48'),
(109, 1, NULL, 'LOGOUT', '2026-06-22 04:56:34'),
(110, 2, NULL, 'LOGIN', '2026-06-22 04:56:39'),
(111, 2, NULL, 'LOGOUT', '2026-06-22 05:25:09'),
(112, 1, NULL, 'LOGIN', '2026-06-22 05:25:21'),
(117, 1, NULL, 'LOGOUT', '2026-06-22 06:15:57'),
(119, 1, NULL, 'LOGIN', '2026-06-22 06:17:35'),
(128, 2, NULL, 'LOGIN', '2026-06-22 06:41:51'),
(129, 2, NULL, 'LOGOUT', '2026-06-22 06:47:56'),
(141, 2, NULL, 'LOGIN', '2026-06-22 07:13:08'),
(145, 2, NULL, 'LOGOUT', '2026-06-22 07:16:42'),
(153, 2, NULL, 'LOGIN', '2026-06-22 07:23:02'),
(154, 2, NULL, 'LOGOUT', '2026-06-22 08:21:04'),
(155, 2, NULL, 'LOGIN', '2026-06-22 08:21:37'),
(161, 2, NULL, 'LOGOUT', '2026-06-22 10:54:18'),
(162, 2, NULL, 'LOGIN', '2026-06-22 10:54:24'),
(163, 2, NULL, 'LOGOUT', '2026-06-22 11:01:32'),
(165, 1, NULL, 'LOGIN', '2026-06-22 11:27:44'),
(167, 2, NULL, 'LOGIN', '2026-06-22 11:38:12'),
(168, 2, NULL, 'LOGIN', '2026-06-22 11:38:35'),
(169, 2, NULL, 'LOGIN', '2026-06-22 11:38:53'),
(177, 2, NULL, 'LOGIN', '2026-06-22 12:29:04'),
(178, 2, NULL, 'LOGIN', '2026-06-22 12:30:21'),
(179, 2, NULL, 'LOGIN', '2026-06-22 12:31:05'),
(180, 1, NULL, 'LOGOUT', '2026-06-22 12:53:15'),
(181, 2, NULL, 'LOGIN', '2026-06-23 03:42:06'),
(182, 1, NULL, 'LOGIN', '2026-06-23 03:42:27'),
(183, 2, NULL, 'LOGIN', '2026-06-23 03:42:42'),
(184, 2, NULL, 'LOGIN', '2026-06-23 05:44:40'),
(188, 2, NULL, 'LOGOUT', '2026-06-23 08:27:42'),
(189, 1, NULL, 'UPDATE_PROFILE', '2026-06-23 08:30:12'),
(190, 1, NULL, 'UPDATE_PROFILE', '2026-06-23 08:30:18'),
(191, 1, NULL, 'LOGIN', '2026-06-23 08:45:25'),
(192, 1, NULL, 'LOGOUT', '2026-06-23 08:49:07'),
(193, 2, NULL, 'LOGIN', '2026-06-23 08:49:14'),
(194, 1, NULL, 'LOGOUT', '2026-06-23 08:50:26'),
(195, 2, NULL, 'LOGIN', '2026-06-23 08:50:31'),
(196, 2, NULL, 'DOWNLOAD', '2026-06-23 08:54:12'),
(197, 2, NULL, 'DOWNLOAD', '2026-06-23 09:00:22'),
(205, 2, NULL, 'LOGOUT', '2026-06-23 09:28:40'),
(206, 1, NULL, 'LOGIN', '2026-06-23 09:28:45'),
(207, 1, NULL, 'LOGOUT', '2026-06-23 09:29:05'),
(210, 15, NULL, 'REGISTER', '2026-06-23 09:30:13'),
(214, 1, NULL, 'LOGIN', '2026-06-23 09:31:08'),
(215, 15, NULL, 'LOGIN', '2026-06-23 09:33:13'),
(219, 15, NULL, 'LOGOUT', '2026-06-23 09:33:47'),
(245, 1, NULL, 'LOGOUT', '2026-06-23 10:32:40'),
(246, 15, NULL, 'LOGIN', '2026-06-23 10:32:46'),
(249, 15, NULL, 'LOGOUT', '2026-06-23 10:33:04'),
(250, 1, NULL, 'LOGIN', '2026-06-23 10:33:08'),
(259, 1, NULL, 'PASSWORD_RESET', '2026-06-23 10:51:35'),
(268, 2, NULL, 'LOGOUT', '2026-06-23 12:08:52'),
(277, 1, NULL, 'LOGOUT', '2026-06-23 12:17:08'),
(278, 1, NULL, 'LOGIN', '2026-06-23 12:17:14'),
(280, 2, NULL, 'LOGIN', '2026-06-23 12:17:26'),
(281, 1, NULL, 'LOGIN', '2026-06-24 03:56:54'),
(283, 1, NULL, 'LOGOUT', '2026-06-24 05:32:52'),
(284, 2, NULL, 'LOGIN', '2026-06-24 05:32:58'),
(285, 2, NULL, 'LOGIN', '2026-06-24 06:07:53'),
(286, 2, NULL, 'LOGOUT', '2026-06-24 06:08:03'),
(287, 1, NULL, 'LOGIN', '2026-06-24 06:08:09'),
(289, 2, NULL, 'LOGIN', '2026-06-24 06:16:28'),
(292, 2, NULL, 'UPDATE_PROFILE', '2026-06-24 06:40:05'),
(293, 2, NULL, 'UPDATE_PROFILE', '2026-06-24 06:40:08'),
(294, 1, NULL, 'LOGIN', '2026-06-24 08:40:24'),
(295, 1, NULL, 'LOGOUT', '2026-06-24 09:05:24'),
(296, 2, NULL, 'LOGIN', '2026-06-24 09:05:31'),
(297, 1, NULL, 'LOGOUT', '2026-06-24 09:42:50'),
(298, 2, NULL, 'PASSWORD_RESET', '2026-06-24 09:44:57'),
(299, 2, NULL, 'PASSWORD_RESET', '2026-06-24 09:45:20'),
(300, 2, NULL, 'LOGIN', '2026-06-24 09:45:29'),
(301, 2, NULL, 'PASSWORD_RESET', '2026-06-24 09:45:42'),
(302, 2, NULL, 'LOGOUT', '2026-06-24 09:45:44'),
(303, 2, NULL, 'LOGIN', '2026-06-24 09:45:59'),
(306, 2, 81, 'UPLOAD', '2026-06-24 10:30:00'),
(307, 2, 82, 'UPLOAD', '2026-06-24 10:32:50'),
(308, 1, NULL, 'LOGIN', '2026-06-24 10:47:54'),
(309, 2, NULL, 'LOGOUT', '2026-06-24 11:42:08'),
(310, 1, NULL, 'LOGIN', '2026-06-24 11:42:14'),
(312, 2, 84, 'UPLOAD', '2026-06-24 11:46:48'),
(313, 2, 85, 'UPLOAD', '2026-06-24 11:47:03'),
(314, 2, 86, 'UPLOAD', '2026-06-24 11:47:15'),
(315, 2, 87, 'UPLOAD', '2026-06-24 11:47:24'),
(316, 2, NULL, 'LOGIN', '2026-06-25 04:13:47'),
(317, 2, NULL, 'LOGOUT', '2026-06-25 04:16:29'),
(318, 1, NULL, 'LOGIN', '2026-06-25 04:16:34'),
(320, 2, NULL, 'LOGIN', '2026-06-25 04:17:51'),
(327, 2, NULL, 'LOGIN', '2026-06-25 04:22:17'),
(328, 2, NULL, 'LOGOUT', '2026-06-25 04:22:46'),
(329, 2, NULL, 'PASSWORD_RESET', '2026-06-25 04:23:55'),
(330, 2, NULL, 'LOGIN', '2026-06-25 04:24:11'),
(331, 2, NULL, 'LOGOUT', '2026-06-25 04:24:56'),
(335, 1, NULL, 'LOGOUT', '2026-06-25 04:30:07'),
(337, 21, NULL, 'REGISTER', '2026-06-25 04:30:33'),
(344, 2, NULL, 'LOGIN', '2026-06-25 04:47:10'),
(345, 2, NULL, 'PASSWORD_RESET', '2026-06-25 04:47:19'),
(347, 1, NULL, 'LOGIN', '2026-06-25 05:01:38'),
(348, 2, NULL, 'LOGOUT', '2026-06-25 05:25:31'),
(349, 2, NULL, 'LOGIN', '2026-06-25 05:26:08'),
(350, 2, NULL, 'UPLOAD', '2026-06-25 05:29:51'),
(351, 2, NULL, 'UPLOAD', '2026-06-25 05:38:51'),
(352, 2, NULL, 'LOGOUT', '2026-06-25 05:40:20'),
(353, 2, NULL, 'LOGIN', '2026-06-25 05:40:25'),
(354, 2, NULL, 'LOGIN', '2026-06-25 05:41:47'),
(355, 2, NULL, 'LOGOUT', '2026-06-25 05:41:49'),
(356, 2, NULL, 'LOGIN', '2026-06-25 05:41:55'),
(357, 2, NULL, 'LOGIN', '2026-06-25 05:42:14'),
(361, 2, NULL, 'LOGOUT', '2026-06-25 05:57:44'),
(362, 2, NULL, 'LOGIN', '2026-06-25 05:57:50'),
(363, 2, NULL, 'LOGOUT', '2026-06-25 06:18:40'),
(364, 2, NULL, 'LOGIN', '2026-06-25 06:19:32'),
(365, 2, NULL, 'LOGOUT', '2026-06-25 06:26:21'),
(366, 2, NULL, 'LOGIN', '2026-06-25 06:26:25'),
(367, 2, NULL, 'LOGOUT', '2026-06-25 06:50:28'),
(368, 2, NULL, 'LOGIN', '2026-06-25 06:50:32'),
(370, 2, NULL, 'LOGOUT', '2026-06-25 07:11:31'),
(371, 2, NULL, 'LOGIN', '2026-06-25 07:11:36'),
(372, 1, NULL, 'LOGOUT', '2026-06-25 07:20:46'),
(373, 1, NULL, 'LOGIN', '2026-06-25 07:20:51'),
(374, 2, NULL, 'LOGOUT', '2026-06-25 08:18:28'),
(375, 2, NULL, 'LOGIN', '2026-06-25 08:18:33'),
(376, 2, NULL, 'LOGOUT', '2026-06-25 08:20:12'),
(377, 2, NULL, 'LOGIN', '2026-06-25 08:20:18'),
(397, 1, NULL, 'LOGIN', '2026-06-25 10:58:14'),
(398, 1, NULL, 'LOGIN', '2026-06-25 11:11:28'),
(418, 1, NULL, 'LOGIN', '2026-06-26 03:57:43'),
(422, 1, NULL, 'LOGIN', '2026-06-26 04:07:55'),
(423, 1, NULL, 'LOGOUT', '2026-06-26 04:13:27'),
(424, 2, NULL, 'LOGIN', '2026-06-26 04:13:34'),
(427, 2, NULL, 'LOGOUT', '2026-06-26 04:16:33'),
(428, 2, NULL, 'LOGIN', '2026-06-26 04:22:06'),
(429, 2, NULL, 'LOGOUT', '2026-06-26 04:28:22'),
(430, 2, NULL, 'LOGIN', '2026-06-26 04:48:08'),
(431, 2, NULL, 'LOGOUT', '2026-06-26 05:52:58'),
(432, 23, NULL, 'REGISTER', '2026-06-26 05:53:12'),
(433, 23, NULL, 'LOGIN', '2026-06-26 05:53:35'),
(434, 23, NULL, 'LOGOUT', '2026-06-26 06:59:46'),
(435, 2, NULL, 'PASSWORD_RESET', '2026-06-26 07:00:21'),
(436, 2, NULL, 'LOGIN', '2026-06-26 07:00:35'),
(437, 2, NULL, 'PASSWORD_RESET', '2026-06-26 07:00:45'),
(438, 2, NULL, 'PASSWORD_CHANGE', '2026-06-26 07:08:45'),
(439, 2, NULL, 'LOGOUT', '2026-06-26 08:32:38'),
(440, 1, NULL, 'LOGIN', '2026-06-26 08:32:42'),
(441, 1, NULL, 'LOGOUT', '2026-06-26 08:42:47'),
(442, 2, NULL, 'LOGIN', '2026-06-26 08:42:55'),
(466, 1, NULL, 'UPDATE_PROFILE', '2026-06-26 12:06:10'),
(467, 1, NULL, 'UPDATE_PROFILE', '2026-06-26 12:06:20'),
(482, 1, NULL, 'LOGIN', '2026-06-29 05:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `delete_log`
--

CREATE TABLE `delete_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delete_log`
--

INSERT INTO `delete_log` (`id`, `user_id`, `document_id`, `deleted_at`) VALUES
(1, 1, 68, '2026-06-26 12:17:01'),
(2, 1, 69, '2026-06-26 12:17:09'),
(3, 1, 70, '2026-06-29 05:01:17'),
(4, 1, 71, '2026-06-29 05:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `document_info`
--

CREATE TABLE `document_info` (
  `document_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `file_name` text NOT NULL,
  `file_size` text NOT NULL,
  `extension` varchar(10) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_user_permission`
--

CREATE TABLE `document_user_permission` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `type` enum('DOWNLOAD','SHARE','ALL') NOT NULL DEFAULT 'DOWNLOAD'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_user_permission`
--

INSERT INTO `document_user_permission` (`id`, `user_id`, `document_id`, `type`) VALUES
(1, 1, 1, 'ALL'),
(2, 2, 2, 'ALL'),
(3, 2, 3, 'ALL'),
(4, 14, 2, 'DOWNLOAD'),
(5, 19, 4, 'ALL'),
(7, 2, 4, 'SHARE'),
(8, 22, 5, 'ALL'),
(9, 22, 6, 'ALL'),
(10, 22, 7, 'ALL'),
(11, 2, 5, 'DOWNLOAD'),
(12, 9, 5, 'DOWNLOAD'),
(13, 14, 5, 'DOWNLOAD'),
(14, 2, 6, 'DOWNLOAD'),
(15, 9, 6, 'DOWNLOAD'),
(16, 14, 6, 'DOWNLOAD'),
(17, 15, 7, 'DOWNLOAD'),
(18, 19, 7, 'DOWNLOAD'),
(19, 20, 7, 'DOWNLOAD'),
(20, 2, 9, 'ALL'),
(22, 14, 9, 'DOWNLOAD'),
(23, 2, 10, 'ALL'),
(24, 1, 11, 'ALL'),
(25, 1, 12, 'ALL'),
(26, 1, 13, 'ALL'),
(27, 1, 14, 'ALL'),
(28, 2, 15, 'ALL'),
(29, 2, 16, 'ALL'),
(30, 2, 17, 'ALL'),
(31, 2, 18, 'ALL'),
(32, 2, 19, 'ALL'),
(33, 2, 20, 'ALL'),
(35, 14, 20, 'DOWNLOAD'),
(36, 2, 21, 'ALL'),
(37, 2, 22, 'ALL'),
(38, 2, 23, 'ALL'),
(39, 2, 24, 'ALL'),
(40, 2, 25, 'ALL'),
(41, 2, 26, 'ALL'),
(42, 1, 27, 'ALL'),
(43, 1, 28, 'ALL'),
(44, 1, 29, 'ALL'),
(45, 1, 30, 'ALL'),
(46, 1, 31, 'ALL'),
(47, 1, 32, 'ALL'),
(48, 1, 33, 'ALL'),
(49, 1, 34, 'ALL'),
(50, 1, 35, 'ALL'),
(51, 1, 36, 'ALL'),
(52, 1, 37, 'ALL'),
(53, 2, 38, 'ALL'),
(54, 2, 39, 'ALL'),
(55, 2, 40, 'ALL'),
(56, 2, 41, 'ALL'),
(57, 1, 42, 'ALL'),
(58, 1, 43, 'ALL'),
(59, 1, 44, 'ALL'),
(60, 2, 45, 'ALL'),
(61, 2, 46, 'ALL'),
(62, 2, 42, 'ALL'),
(63, 1, 47, 'ALL'),
(64, 1, 48, 'ALL'),
(65, 1, 49, 'ALL'),
(66, 1, 50, 'ALL'),
(67, 1, 51, 'ALL'),
(68, 1, 52, 'ALL'),
(69, 1, 53, 'ALL'),
(70, 1, 54, 'ALL'),
(71, 1, 55, 'ALL'),
(72, 1, 56, 'ALL'),
(73, 1, 57, 'ALL'),
(74, 1, 58, 'ALL'),
(75, 1, 59, 'ALL'),
(76, 1, 60, 'ALL'),
(77, 2, 61, 'ALL'),
(79, 2, 58, 'ALL'),
(80, 2, 62, 'ALL'),
(106, 1, 63, 'ALL'),
(107, 1, 64, 'ALL'),
(108, 1, 65, 'ALL'),
(109, 1, 66, 'ALL'),
(110, 1, 67, 'ALL'),
(111, 1, 68, 'ALL'),
(112, 1, 69, 'ALL'),
(113, 1, 70, 'ALL'),
(114, 1, 71, 'ALL'),
(115, 1, 72, 'ALL');

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` enum('PENDING','SENT') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_queue`
--

INSERT INTO `email_queue` (`id`, `recipient`, `subject`, `body`, `status`, `created_at`, `sent_at`) VALUES
(1, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 07:27:01', NULL),
(2, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 07:27:02', NULL),
(3, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of backup file (7).pdf', 'SENT', '2026-06-24 08:27:09', '2026-06-24 08:28:28'),
(4, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 08:40:35', '2026-06-24 08:50:24'),
(5, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 08:40:35', '2026-06-24 08:50:24'),
(6, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of index.php', 'SENT', '2026-06-24 08:51:13', '2026-06-24 08:58:48'),
(7, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of index.php', 'SENT', '2026-06-24 08:51:15', '2026-06-24 08:58:48'),
(8, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of backup file (7).pdf', 'SENT', '2026-06-24 08:59:08', '2026-06-24 09:04:41'),
(9, 'booknest44@gmail.com', 'File Invitation', 'admin have gave to access of backup file (7).pdf', 'SENT', '2026-06-24 08:59:08', '2026-06-24 09:04:41'),
(10, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of index.php', 'SENT', '2026-06-24 09:04:59', '2026-06-24 09:09:27'),
(11, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of index.php', 'SENT', '2026-06-24 09:04:59', '2026-06-24 09:09:27'),
(12, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of index.php', 'SENT', '2026-06-24 09:05:06', '2026-06-24 09:09:27'),
(13, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of backup file (9).pdf', 'SENT', '2026-06-24 09:05:41', '2026-06-24 09:09:27'),
(14, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of backup file (9).pdf', 'SENT', '2026-06-24 09:05:42', '2026-06-24 09:09:27'),
(15, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of backup file (7).pdf', 'SENT', '2026-06-24 09:09:41', '2026-06-24 09:27:28'),
(16, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of index.php', 'SENT', '2026-06-24 09:09:48', '2026-06-24 09:27:28'),
(17, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of mine document (1).pdf', 'SENT', '2026-06-24 09:09:58', '2026-06-24 09:27:28'),
(18, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 09:28:52', '2026-06-24 09:32:21'),
(19, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50MB-TESTFILE.ORG.pdf', 'SENT', '2026-06-24 09:28:52', '2026-06-24 09:32:21'),
(20, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of 50MB-TESTFILE.ORG.pdf', 'PENDING', '2026-06-24 09:53:15', NULL),
(21, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of 50MB-TESTFILE.ORG.pdf', 'PENDING', '2026-06-24 09:53:44', NULL),
(22, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of 50MB-TESTFILE.ORG.pdf', 'PENDING', '2026-06-24 09:55:28', NULL),
(23, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document kunal.pdf', 'PENDING', '2026-06-24 12:07:50', NULL),
(24, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of Document kunal.pdf', 'PENDING', '2026-06-24 12:07:57', NULL),
(25, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Spec Sheet CA.pdf', 'PENDING', '2026-06-24 12:12:34', NULL),
(26, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of backup file (11).pdf', 'PENDING', '2026-06-24 12:12:41', NULL),
(27, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of mine document (1).pdf', 'PENDING', '2026-06-24 12:12:56', NULL),
(28, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of 75 mB sample pdf file  123.pdf', 'PENDING', '2026-06-25 04:21:33', NULL),
(29, 'booknest44@gmail.com', 'File Invitation', 'Raju have gave you access of Document.pdf', 'PENDING', '2026-06-25 04:25:39', NULL),
(30, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document.pdf', 'PENDING', '2026-06-25 04:29:19', NULL),
(31, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of Document kunal 123.pdf', 'PENDING', '2026-06-25 04:31:44', NULL),
(32, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of Document kunal 123.pdf', 'PENDING', '2026-06-25 04:31:45', NULL),
(33, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of Document kunal 123.pdf', 'PENDING', '2026-06-25 04:31:45', NULL),
(34, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 75 mB sample pdf file  .pdf', 'PENDING', '2026-06-25 04:31:51', NULL),
(35, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 75 mB sample pdf file  .pdf', 'PENDING', '2026-06-25 04:31:52', NULL),
(36, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 75 mB sample pdf file  .pdf', 'PENDING', '2026-06-25 04:31:52', NULL),
(37, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 50mb.pdf', 'PENDING', '2026-06-25 04:31:59', NULL),
(38, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 50mb.pdf', 'PENDING', '2026-06-25 04:31:59', NULL),
(39, 'booknest44@gmail.com', 'File Invitation', 'Om have gave you access of 50mb.pdf', 'PENDING', '2026-06-25 04:31:59', NULL),
(40, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of document.pdf', 'PENDING', '2026-06-25 05:43:30', NULL),
(41, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of document.pdf', 'PENDING', '2026-06-25 05:43:30', NULL),
(42, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of Document.pdf', 'PENDING', '2026-06-25 09:59:43', NULL),
(43, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of Document.pdf', 'PENDING', '2026-06-25 09:59:43', NULL),
(44, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document (2).pdf', 'PENDING', '2026-06-26 04:27:48', NULL),
(45, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document (2) (1) (1).pdf', 'PENDING', '2026-06-26 09:40:10', NULL),
(46, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document (2) (1) (1).pdf', 'PENDING', '2026-06-26 09:48:17', NULL),
(47, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 10:09:22', NULL),
(48, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 10:09:22', NULL),
(49, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 10:09:22', NULL),
(50, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document (2) (1) (1).pdf', 'PENDING', '2026-06-26 10:26:21', NULL),
(51, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of Document (2) (1) (1).pdf', 'PENDING', '2026-06-26 10:26:31', NULL),
(52, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 10:38:36', NULL),
(53, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 10:38:36', NULL),
(54, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 10:59:19', NULL),
(55, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 11:05:23', NULL),
(56, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 11:08:17', NULL),
(57, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 11:11:23', NULL),
(58, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 11:16:11', NULL),
(59, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of 50mb.pdf', 'PENDING', '2026-06-26 11:16:31', NULL),
(60, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:44:44', NULL),
(61, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:48:03', NULL),
(62, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:52:36', NULL),
(63, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:52:51', NULL),
(64, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:52:51', NULL),
(65, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:52:51', NULL),
(66, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:53:46', NULL),
(67, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:53:46', NULL),
(68, 'booknest44@gmail.com', 'File Invitation', 'Meet have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:53:46', NULL),
(69, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:54:03', NULL),
(70, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:54:03', NULL),
(71, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of meet dobariya.pdf', 'PENDING', '2026-06-26 11:54:04', NULL),
(72, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document.pdf', 'PENDING', '2026-06-29 05:02:00', NULL),
(73, 'booknest44@gmail.com', 'File Invitation', 'Admin have gave you access of Document.pdf', 'PENDING', '2026-06-29 05:02:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` text NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_log`
--

CREATE TABLE `share_log` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `shared_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_folder`
--

CREATE TABLE `user_folder` (
  `id` int(11) NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_folder`
--

INSERT INTO `user_folder` (`id`, `folder_name`, `user_id`, `parent_id`) VALUES
(1, 'user', NULL, NULL),
(2, '2', 2, 1),
(5, '15', 15, 1),
(8, '21', 21, 1),
(12, 'admin', 1, NULL),
(63, '23', 23, 1),
(77, 'meet1', 1, 12),
(78, 'sub-meet', 1, 77);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `can_share` enum('YES','NO') NOT NULL DEFAULT 'YES',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `name`, `email`, `password`, `role`, `status`, `can_share`, `created_at`) VALUES
(1, 'admin', 'admin@dds.com', '$2y$10$R1kiK6ggT4dqtHtkRfQKpePUm33nWqU8kqakmrg6CjpllOeeDp2w2', 'ADMIN', 'ACTIVE', 'YES', '2026-06-19 09:24:40'),
(2, 'meet', 'meet@gmail.com', '$2y$10$zEGFE066ROdLIhbv/ESAmuEC0v3mjb0MHMV202fRPD3WWLD4bs.qS', 'USER', 'ACTIVE', 'YES', '2026-06-18 11:42:27'),
(15, 'bhoutik', 'bhoutik@gmail.com', '$2y$10$AjT1N2YsKjHfFdCiTIWNQ.2C.MDNEvAwURb89jYkxJhW4IwaPeTNy', 'USER', 'ACTIVE', 'YES', '2026-06-23 09:30:12'),
(21, 'lokesh', 'lokesh@gmail.com', '$2y$10$NMxpxMGk0HsIB0ur26AHwuG1InR2xKZmz0ZPX5pI4zsMo4sufy6FW', 'USER', 'ACTIVE', 'YES', '2026-06-25 04:30:33'),
(23, 'raj', 'raj@gmail.com', '$2y$10$iTmoLUFatgKEnnjKcOsiJuW1RBjATVJkfP3y.PbnrlZUyznYnmkQi', 'USER', 'ACTIVE', 'YES', '2026-06-26 05:53:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users` (`user_id`),
  ADD KEY `fk_document` (`document_id`);

--
-- Indexes for table `delete_log`
--
ALTER TABLE `delete_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_info`
--
ALTER TABLE `document_info`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `frk_user` (`owner_id`),
  ADD KEY `frk_folder` (`folder_id`);

--
-- Indexes for table `document_user_permission`
--
ALTER TABLE `document_user_permission`
  ADD PRIMARY KEY (`id`,`user_id`,`document_id`);

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_log`
--
ALTER TABLE `share_log`
  ADD PRIMARY KEY (`id`,`sender_id`,`receiver_id`,`document_id`),
  ADD KEY `frk_sender` (`sender_id`),
  ADD KEY `fk_receiver` (`receiver_id`),
  ADD KEY `frk_document` (`document_id`);

--
-- Indexes for table `user_folder`
--
ALTER TABLE `user_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fr_user` (`user_id`),
  ADD KEY `frk_paren` (`parent_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT for table `delete_log`
--
ALTER TABLE `delete_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `document_info`
--
ALTER TABLE `document_info`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `document_user_permission`
--
ALTER TABLE `document_user_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `share_log`
--
ALTER TABLE `share_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `user_folder`
--
ALTER TABLE `user_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_document` FOREIGN KEY (`document_id`) REFERENCES `document_info` (`document_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `document_info`
--
ALTER TABLE `document_info`
  ADD CONSTRAINT `frk_folder` FOREIGN KEY (`folder_id`) REFERENCES `user_folder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frk_user` FOREIGN KEY (`owner_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `share_log`
--
ALTER TABLE `share_log`
  ADD CONSTRAINT `fk_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frk_document` FOREIGN KEY (`document_id`) REFERENCES `document_info` (`document_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frk_sender` FOREIGN KEY (`sender_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_folder`
--
ALTER TABLE `user_folder`
  ADD CONSTRAINT `fr_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `frk_paren` FOREIGN KEY (`parent_id`) REFERENCES `user_folder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
