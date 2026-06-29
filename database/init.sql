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
(12, 'admin', 1, NULL);

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
(1, 'admin', 'admin@dds.com', '$2y$10$R1kiK6ggT4dqtHtkRfQKpePUm33nWqU8kqakmrg6CjpllOeeDp2w2', 'ADMIN', 'ACTIVE', 'YES', '2026-06-19 09:24:40');

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
