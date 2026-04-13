-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2026 at 10:20 PM
-- Server version: 10.6.20-MariaDB-cll-lve
-- PHP Version: 8.1.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bethelin_work`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('super_admin','admin','editor') NOT NULL DEFAULT 'admin',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `full_name`, `email`, `password_hash`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'admin', 'veshalenr17@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'super_admin', 1, '2026-03-25 03:57:49', '2026-03-25 03:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `bot_sessions`
--

CREATE TABLE `bot_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `current_step` varchar(50) NOT NULL,
  `previous_step` varchar(100) DEFAULT NULL,
  `navigation_stack` text DEFAULT NULL,
  `last_menu_payload` text DEFAULT NULL,
  `entry_source` varchar(50) DEFAULT NULL,
  `referrer_code` varchar(100) DEFAULT NULL,
  `started_at` datetime NOT NULL DEFAULT current_timestamp(),
  `abandoned_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `last_user_message_at` datetime DEFAULT NULL,
  `last_bot_message_at` datetime DEFAULT NULL,
  `selected_family_id` int(10) UNSIGNED DEFAULT NULL,
  `selected_product_id` int(10) UNSIGNED DEFAULT NULL,
  `selected_variant_id` int(10) UNSIGNED DEFAULT NULL,
  `selected_size_grams` decimal(8,2) DEFAULT NULL,
  `selected_budget_cents` int(10) UNSIGNED DEFAULT NULL,
  `context_json` longtext DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bot_sessions`
--

INSERT INTO `bot_sessions` (`id`, `user_id`, `current_step`, `previous_step`, `navigation_stack`, `last_menu_payload`, `entry_source`, `referrer_code`, `started_at`, `abandoned_at`, `completed_at`, `last_user_message_at`, `last_bot_message_at`, `selected_family_id`, `selected_product_id`, `selected_variant_id`, `selected_size_grams`, `selected_budget_cents`, `context_json`, `updated_at`, `created_at`) VALUES
(247, 1, 'checkout_name', NULL, NULL, NULL, NULL, NULL, '2026-03-31 18:23:25', NULL, NULL, NULL, NULL, 1, 3, NULL, 5.00, NULL, '{\"delivery_area_key\":\"musgrave\",\"delivery_area_label\":\"Musgrave\",\"delivery_fee_cents\":7000}', '2026-03-31 18:24:00', '2026-03-31 18:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `bot_users`
--

CREATE TABLE `bot_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `telegram_user_id` bigint(20) UNSIGNED NOT NULL,
  `telegram_chat_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `default_recipient_name` varchar(120) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `default_delivery_address` text DEFAULT NULL,
  `default_delivery_notes` text DEFAULT NULL,
  `default_delivery_area_key` varchar(50) DEFAULT NULL,
  `default_delivery_area_label` varchar(120) DEFAULT NULL,
  `default_delivery_fee_cents` int(10) UNSIGNED DEFAULT NULL,
  `marketing_opt_in` tinyint(1) NOT NULL DEFAULT 0,
  `customer_status` enum('new','lead','customer','repeat','vip','inactive') NOT NULL DEFAULT 'new',
  `preferred_contact_method` enum('telegram','phone','email') DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `first_order_at` datetime DEFAULT NULL,
  `last_order_at` datetime DEFAULT NULL,
  `total_orders` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_spent_cents` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `average_order_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_inquiry_at` datetime DEFAULT NULL,
  `tags_json` longtext DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bot_users`
--

INSERT INTO `bot_users` (`id`, `telegram_user_id`, `telegram_chat_id`, `username`, `first_name`, `last_name`, `phone_number`, `default_recipient_name`, `email`, `language_code`, `country_code`, `city`, `default_delivery_address`, `default_delivery_notes`, `default_delivery_area_key`, `default_delivery_area_label`, `default_delivery_fee_cents`, `marketing_opt_in`, `customer_status`, `preferred_contact_method`, `last_seen_at`, `first_order_at`, `last_order_at`, `total_orders`, `total_spent_cents`, `average_order_cents`, `last_inquiry_at`, `tags_json`, `admin_notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7752819171, 7752819171, NULL, 'Veshalen', NULL, '0791333347', 'Veshalen', 'Veshalenr17@gmail.com', 'en', NULL, NULL, 'Tongaat', 'No', 'umhlanga', 'Umhlanga', 10000, 0, 'new', NULL, NULL, '2026-03-26 14:06:07', '2026-03-26 14:06:07', 4, 6397000, 1599250, NULL, NULL, NULL, '2026-03-25 00:20:17', '2026-03-26 14:06:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','ordered','abandoned') NOT NULL DEFAULT 'active',
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `status`, `currency`, `created_at`, `updated_at`) VALUES
(1, 1, 'ordered', 'ZAR', '2026-03-25 02:04:37', '2026-03-25 02:20:13'),
(2, 1, 'ordered', 'ZAR', '2026-03-25 02:44:17', '2026-03-25 02:44:27'),
(3, 1, 'ordered', 'ZAR', '2026-03-25 02:57:29', '2026-03-25 02:57:39'),
(4, 1, 'ordered', 'ZAR', '2026-03-25 04:12:48', '2026-03-25 04:12:58'),
(5, 1, 'ordered', 'ZAR', '2026-03-25 09:00:37', '2026-03-25 09:00:54'),
(6, 1, 'ordered', 'ZAR', '2026-03-25 09:45:23', '2026-03-25 09:45:34'),
(7, 1, 'ordered', 'ZAR', '2026-03-25 14:10:40', '2026-03-25 14:10:51'),
(8, 1, 'ordered', 'ZAR', '2026-03-25 14:12:52', '2026-03-25 22:12:40'),
(9, 1, 'ordered', 'ZAR', '2026-03-25 22:18:30', '2026-03-25 22:18:41'),
(10, 1, 'ordered', 'ZAR', '2026-03-26 10:24:02', '2026-03-26 10:24:11'),
(11, 1, 'ordered', 'ZAR', '2026-03-26 10:30:43', '2026-03-26 10:30:55'),
(12, 1, 'ordered', 'ZAR', '2026-03-26 11:19:23', '2026-03-26 11:19:39'),
(13, 1, 'ordered', 'ZAR', '2026-03-26 12:05:10', '2026-03-26 12:06:13'),
(14, 1, 'ordered', 'ZAR', '2026-03-26 12:39:00', '2026-03-26 12:40:30'),
(15, 1, 'ordered', 'ZAR', '2026-03-26 12:52:52', '2026-03-26 13:25:15'),
(16, 1, 'ordered', 'ZAR', '2026-03-26 13:26:09', '2026-03-26 13:26:53'),
(17, 1, 'ordered', 'ZAR', '2026-03-26 13:27:25', '2026-03-26 13:51:59'),
(18, 1, 'ordered', 'ZAR', '2026-03-26 13:52:48', '2026-03-26 14:06:07'),
(19, 1, 'active', 'ZAR', '2026-03-26 14:14:44', '2026-03-26 14:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `unit_price_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `line_total_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_variant_id`, `quantity`, `unit_price_cents`, `line_total_cents`, `created_at`, `updated_at`) VALUES
(1, 1, 25, 1, 150000, 150000, '2026-03-25 02:04:37', '2026-03-25 02:04:37'),
(2, 1, 130, 1, 520000, 520000, '2026-03-25 02:20:00', '2026-03-25 02:20:00'),
(3, 2, 295, 1, 2400000, 2400000, '2026-03-25 02:44:17', '2026-03-25 02:44:17'),
(4, 3, 30, 1, 150000, 150000, '2026-03-25 02:57:29', '2026-03-25 02:57:29'),
(5, 4, 113, 1, 280000, 280000, '2026-03-25 04:12:48', '2026-03-25 04:12:48'),
(6, 5, 233, 1, 1250000, 1250000, '2026-03-25 09:00:37', '2026-03-25 09:00:37'),
(7, 6, 113, 1, 280000, 280000, '2026-03-25 09:45:23', '2026-03-25 09:45:23'),
(8, 7, 298, 1, 2400000, 2400000, '2026-03-25 14:10:40', '2026-03-25 14:10:40'),
(9, 8, 78, 1, 280000, 280000, '2026-03-25 14:12:52', '2026-03-25 14:12:52'),
(10, 8, 217, 1, 1250000, 1250000, '2026-03-25 22:12:30', '2026-03-25 22:12:30'),
(11, 9, 75, 1, 280000, 280000, '2026-03-25 22:18:30', '2026-03-25 22:18:30'),
(12, 10, 110, 1, 280000, 280000, '2026-03-26 10:24:02', '2026-03-26 10:24:02'),
(13, 11, 47, 1, 150000, 150000, '2026-03-26 10:30:43', '2026-03-26 10:30:43'),
(14, 12, 29, 1, 150000, 150000, '2026-03-26 11:19:23', '2026-03-26 11:19:23'),
(15, 13, 79, 1, 280000, 280000, '2026-03-26 12:05:10', '2026-03-26 12:05:10'),
(16, 14, 162, 1, 520000, 520000, '2026-03-26 12:39:00', '2026-03-26 12:39:00'),
(17, 15, 76, 1, 280000, 280000, '2026-03-26 12:52:52', '2026-03-26 12:52:52'),
(18, 15, 48, 1, 150000, 150000, '2026-03-26 13:24:16', '2026-03-26 13:24:16'),
(19, 16, 193, 1, 1250000, 1250000, '2026-03-26 13:26:09', '2026-03-26 13:26:09'),
(20, 17, 204, 1, 1250000, 1250000, '2026-03-26 13:27:25', '2026-03-26 13:27:25'),
(21, 17, 174, 1, 520000, 520000, '2026-03-26 13:51:14', '2026-03-26 13:51:14'),
(22, 18, 267, 1, 2400000, 2400000, '2026-03-26 13:52:48', '2026-03-26 13:52:48'),
(23, 18, 150, 1, 520000, 520000, '2026-03-26 14:05:32', '2026-03-26 14:05:32'),
(24, 19, 203, 1, 1250000, 1250000, '2026-03-26 14:14:44', '2026-03-26 14:14:44'),
(25, 19, 37, 1, 150000, 150000, '2026-03-26 14:47:40', '2026-03-26 14:47:40'),
(26, 19, 110, 1, 280000, 280000, '2026-03-26 17:31:35', '2026-03-26 17:31:35'),
(27, 19, 193, 1, 1250000, 1250000, '2026-03-27 12:04:35', '2026-03-27 12:04:35'),
(28, 19, 3, 1, 150000, 150000, '2026-03-31 18:23:46', '2026-03-31 18:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `customer_events`
--

CREATE TABLE `customer_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `variant_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_inquiries`
--

CREATE TABLE `customer_inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED DEFAULT NULL,
  `inquiry_status` enum('new','reviewing','contacted','closed') NOT NULL DEFAULT 'new',
  `requested_callback` tinyint(1) NOT NULL DEFAULT 0,
  `contact_number` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `handled_by_admin_id` int(10) UNSIGNED DEFAULT NULL,
  `first_response_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_messages`
--

CREATE TABLE `inquiry_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inquiry_id` bigint(20) UNSIGNED NOT NULL,
  `sender_type` enum('user','admin','system') NOT NULL DEFAULT 'user',
  `message_text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `stock_units` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reserved_units` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `available_units` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_restocked_at` datetime DEFAULT NULL,
  `last_sold_at` datetime DEFAULT NULL,
  `stock_note` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant_id`, `stock_units`, `reserved_units`, `available_units`, `last_restocked_at`, `last_sold_at`, `stock_note`, `updated_at`) VALUES
(1, 1, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(2, 64, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(3, 127, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(4, 190, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(5, 253, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(6, 2, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(7, 65, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(8, 128, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(9, 191, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(10, 254, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(11, 3, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(12, 66, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(13, 129, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(14, 192, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(15, 255, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(16, 4, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(17, 67, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(18, 130, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(19, 193, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(20, 256, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(21, 5, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(22, 68, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(23, 131, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(24, 194, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(25, 257, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(26, 6, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(27, 69, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(28, 132, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(29, 195, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(30, 258, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(31, 7, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(32, 70, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(33, 133, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(34, 196, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(35, 259, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(36, 8, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(37, 71, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(38, 134, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(39, 197, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(40, 260, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(41, 9, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(42, 72, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(43, 135, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(44, 198, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(45, 261, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(46, 10, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(47, 73, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(48, 136, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(49, 199, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(50, 262, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(51, 11, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(52, 74, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(53, 137, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(54, 200, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(55, 263, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(56, 12, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(57, 75, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(58, 138, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(59, 201, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(60, 264, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(61, 13, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(62, 76, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(63, 139, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(64, 202, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(65, 265, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(66, 14, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(67, 77, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(68, 140, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(69, 203, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(70, 266, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(71, 15, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(72, 78, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(73, 141, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(74, 204, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(75, 267, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(76, 16, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(77, 79, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(78, 142, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(79, 205, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(80, 268, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(81, 17, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(82, 80, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(83, 143, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(84, 206, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(85, 269, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(86, 18, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(87, 81, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(88, 144, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(89, 207, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(90, 270, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(91, 19, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(92, 82, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(93, 145, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(94, 208, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(95, 271, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(96, 20, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(97, 83, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(98, 146, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(99, 209, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(100, 272, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(101, 21, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(102, 84, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(103, 147, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(104, 210, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(105, 273, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(106, 22, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(107, 85, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(108, 148, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(109, 211, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(110, 274, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(111, 23, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(112, 86, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(113, 149, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(114, 212, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(115, 275, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(116, 24, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(117, 87, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(118, 150, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(119, 213, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(120, 276, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(121, 25, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(122, 88, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(123, 151, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(124, 214, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(125, 277, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(126, 26, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(127, 89, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(128, 152, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(129, 215, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(130, 278, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(131, 27, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(132, 90, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(133, 153, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(134, 216, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(135, 279, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(136, 28, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(137, 91, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(138, 154, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(139, 217, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(140, 280, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(141, 29, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(142, 92, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(143, 155, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(144, 218, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(145, 281, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(146, 30, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(147, 93, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(148, 156, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(149, 219, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(150, 282, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(151, 31, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(152, 94, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(153, 157, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(154, 220, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(155, 283, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(156, 32, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(157, 95, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(158, 158, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(159, 221, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(160, 284, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(161, 33, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(162, 96, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(163, 159, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(164, 222, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(165, 285, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(166, 34, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(167, 97, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(168, 160, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(169, 223, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(170, 286, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(171, 35, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(172, 98, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(173, 161, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(174, 224, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(175, 287, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(176, 36, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(177, 99, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(178, 162, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(179, 225, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(180, 288, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(181, 37, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(182, 100, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(183, 163, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(184, 226, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(185, 289, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(186, 38, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(187, 101, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(188, 164, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(189, 227, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(190, 290, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(191, 39, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(192, 102, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(193, 165, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(194, 228, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(195, 291, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(196, 40, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(197, 103, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(198, 166, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(199, 229, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(200, 292, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(201, 41, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(202, 104, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(203, 167, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(204, 230, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(205, 293, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(206, 42, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(207, 105, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(208, 168, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(209, 231, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(210, 294, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(211, 43, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(212, 106, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(213, 169, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(214, 232, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(215, 295, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(216, 44, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(217, 107, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(218, 170, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(219, 233, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(220, 296, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(221, 45, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(222, 108, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(223, 171, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(224, 234, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(225, 297, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(226, 46, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(227, 109, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(228, 172, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(229, 235, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(230, 298, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(231, 47, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(232, 110, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(233, 173, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(234, 236, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(235, 299, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(236, 48, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(237, 111, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(238, 174, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(239, 237, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(240, 300, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(241, 49, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(242, 112, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(243, 175, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(244, 238, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(245, 301, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(246, 50, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(247, 113, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(248, 176, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(249, 239, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49'),
(250, 302, 10, 0, 10, NULL, NULL, 'Available for inquiry', '2026-03-25 04:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `nft_cart_orders`
--

CREATE TABLE `nft_cart_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(60) NOT NULL,
  `status` enum('pending','awaiting_payment','paid','cancelled','fulfilled') NOT NULL DEFAULT 'pending',
  `subtotal_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `recipient_name` varchar(120) DEFAULT NULL,
  `customer_phone` varchar(40) DEFAULT NULL,
  `delivery_method` varchar(40) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_status` varchar(50) DEFAULT NULL,
  `fulfillment_status` varchar(50) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nft_cart_orders`
--

INSERT INTO `nft_cart_orders` (`id`, `user_id`, `cart_id`, `order_number`, `status`, `subtotal_cents`, `total_cents`, `currency`, `recipient_name`, `customer_phone`, `delivery_method`, `delivery_address`, `delivery_notes`, `created_at`, `updated_at`, `payment_status`, `fulfillment_status`, `paid_at`, `fulfilled_at`) VALUES
(1, 1, 1, 'NFTC-20260325002013-1', 'awaiting_payment', 670000, 670000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 02:20:13', '2026-03-25 02:20:13', NULL, NULL, NULL, NULL),
(2, 1, 2, 'NFTC-20260325004427-1', 'awaiting_payment', 2400000, 2400000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 02:44:27', '2026-03-25 02:44:27', NULL, NULL, NULL, NULL),
(3, 1, 3, 'NFTC-20260325005739-1', 'awaiting_payment', 150000, 150000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 02:57:39', '2026-03-25 02:57:39', NULL, NULL, NULL, NULL),
(4, 1, 4, 'NFTC-20260325021258-1', 'paid', 280000, 280000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 04:12:58', '2026-03-25 21:33:00', 'successful', NULL, '2026-03-25 21:33:00', NULL),
(5, 1, 5, 'NFTC-20260325070054-1', 'cancelled', 1250000, 1250000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 09:00:54', '2026-03-25 21:24:50', NULL, NULL, NULL, NULL),
(6, 1, 6, 'NFTC-20260325074534-1', 'cancelled', 280000, 280000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 09:45:34', '2026-03-25 21:24:47', NULL, NULL, NULL, NULL),
(7, 1, 7, 'NFTC-20260325121051-1', 'cancelled', 2400000, 2400000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 14:10:51', '2026-03-25 21:24:45', NULL, NULL, NULL, NULL),
(8, 1, 8, 'NFTC-20260325201240-1', 'paid', 1530000, 1530000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 22:12:40', '2026-03-25 22:18:56', 'successful', NULL, '2026-03-25 22:18:56', NULL),
(9, 1, 9, 'NFTC-20260325201841-1', 'paid', 280000, 280000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-25 22:18:41', '2026-03-26 10:08:49', 'successful', NULL, '2026-03-26 10:08:49', NULL),
(10, 1, 10, 'NFTC-20260326082411-1', 'paid', 280000, 280000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-26 10:24:11', '2026-03-26 10:24:19', 'successful', NULL, '2026-03-26 10:24:19', NULL),
(11, 1, 11, 'NFTC-20260326083055-1', 'paid', 150000, 150000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-26 10:30:55', '2026-03-26 10:31:08', 'successful', NULL, '2026-03-26 10:31:08', NULL),
(12, 1, 12, 'NFTC-20260326091939-1', 'paid', 150000, 150000, 'ZAR', NULL, NULL, NULL, NULL, NULL, '2026-03-26 11:19:39', '2026-03-26 11:20:01', 'successful', NULL, '2026-03-26 11:20:01', NULL),
(13, 1, 13, 'NFTC-20260326100613-1', 'paid', 280000, 280000, 'ZAR', 'Veshalen', '0630229965', 'delivery', '3 peony place tongaat', '', '2026-03-26 12:06:13', '2026-03-26 12:06:24', 'successful', NULL, '2026-03-26 12:06:24', NULL),
(14, 1, 14, 'NFTC-20260326104030-1', 'paid', 520000, 530000, 'ZAR', 'Travis', '0315675555', 'delivery', '12 County road', 'No', '2026-03-26 12:40:30', '2026-03-26 12:40:41', 'successful', NULL, '2026-03-26 12:40:41', NULL),
(15, 1, 15, 'NFTC-20260326112515-1', 'paid', 430000, 435000, 'ZAR', 'Veshalen', '0791333347', 'delivery', '3 Peony Place, Buffelsdale, Tongaat', 'No', '2026-03-26 13:25:15', '2026-03-26 13:25:29', 'successful', NULL, '2026-03-26 13:25:29', NULL),
(16, 1, 16, 'NFTC-20260326112653-1', 'paid', 1250000, 1256000, 'ZAR', 'Tom', '0734567878', 'delivery', 'Tongaat', 'No', '2026-03-26 13:26:53', '2026-03-26 13:27:02', 'successful', NULL, '2026-03-26 13:27:02', NULL),
(17, 1, 17, 'NFTC-20260326115159-1', 'paid', 1770000, 1776000, 'ZAR', 'Tom', '0763412657', 'delivery', '5 Thomas lane', 'No', '2026-03-26 13:51:59', '2026-03-26 13:52:16', 'successful', NULL, '2026-03-26 13:52:16', NULL),
(18, 1, 18, 'NFTC-20260326120607-1', 'paid', 2920000, 2930000, 'ZAR', 'Veshalen', '0791333347', 'delivery', 'Tongaat', 'No', '2026-03-26 14:06:07', '2026-03-26 14:14:36', 'successful', NULL, '2026-03-26 14:14:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nft_cart_order_items`
--

CREATE TABLE `nft_cart_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `variant_label` varchar(120) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `unit_price_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `line_total_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nft_cart_order_items`
--

INSERT INTO `nft_cart_order_items` (`id`, `order_id`, `product_id`, `variant_id`, `product_name`, `variant_label`, `quantity`, `unit_price_cents`, `line_total_cents`, `created_at`) VALUES
(1, 1, 25, 25, 'Flower 5 Type 5', 'Edition 5', 1, 150000, 150000, '2026-03-25 02:20:13'),
(2, 1, 4, 130, 'Flower 1 Type 4', 'Edition 20', 1, 520000, 520000, '2026-03-25 02:20:13'),
(3, 2, 43, 295, 'Flower 9 Type 3', 'Edition 100', 1, 2400000, 2400000, '2026-03-25 02:44:27'),
(4, 3, 30, 30, 'Flower 6 Type 5', 'Edition 5', 1, 150000, 150000, '2026-03-25 02:57:39'),
(5, 4, 50, 113, 'Flower 10 Type 5', 'Edition 10', 1, 280000, 280000, '2026-03-25 04:12:58'),
(6, 5, 44, 233, 'Flower 9 Type 4', 'Edition 50', 1, 1250000, 1250000, '2026-03-25 09:00:54'),
(7, 6, 50, 113, 'Flower 10 Type 5', 'Edition 10', 1, 280000, 280000, '2026-03-25 09:45:34'),
(8, 7, 46, 298, 'Flower 10 Type 1', 'Edition 100', 1, 2400000, 2400000, '2026-03-25 14:10:51'),
(9, 8, 15, 78, 'Flower 3 Type 5', 'Edition 10', 1, 280000, 280000, '2026-03-25 22:12:40'),
(10, 8, 28, 217, 'Flower 6 Type 3', 'Edition 50', 1, 1250000, 1250000, '2026-03-25 22:12:40'),
(11, 9, 12, 75, 'Flower 3 Type 2', 'Edition 10', 1, 280000, 280000, '2026-03-25 22:18:41'),
(12, 10, 47, 110, 'Flower 10 Type 2', 'Edition 10', 1, 280000, 280000, '2026-03-26 10:24:11'),
(13, 11, 47, 47, 'Flower 10 Type 2', 'Edition 5', 1, 150000, 150000, '2026-03-26 10:30:55'),
(14, 12, 29, 29, 'Flower 6 Type 4', 'Edition 5', 1, 150000, 150000, '2026-03-26 11:19:39'),
(15, 13, 16, 79, 'Flower 4 Type 1', 'Edition 10', 1, 280000, 280000, '2026-03-26 12:06:13'),
(16, 14, 36, 162, 'Flower 8 Type 1', 'Edition 20', 1, 520000, 520000, '2026-03-26 12:40:30'),
(17, 15, 13, 76, 'Flower 3 Type 3', 'Edition 10', 1, 280000, 280000, '2026-03-26 13:25:15'),
(18, 15, 48, 48, 'Flower 10 Type 3', 'Edition 5', 1, 150000, 150000, '2026-03-26 13:25:15'),
(19, 16, 4, 193, 'Flower 1 Type 4', 'Edition 50', 1, 1250000, 1250000, '2026-03-26 13:26:53'),
(20, 17, 15, 204, 'Flower 3 Type 5', 'Edition 50', 1, 1250000, 1250000, '2026-03-26 13:51:59'),
(21, 17, 48, 174, 'Flower 10 Type 3', 'Edition 20', 1, 520000, 520000, '2026-03-26 13:51:59'),
(22, 18, 15, 267, 'Flower 3 Type 5', 'Edition 100', 1, 2400000, 2400000, '2026-03-26 14:06:07'),
(23, 18, 24, 150, 'Flower 5 Type 4', 'Edition 20', 1, 520000, 520000, '2026-03-26 14:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `nft_cart_payments`
--

CREATE TABLE `nft_cart_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'manual',
  `provider_name` varchar(100) DEFAULT NULL,
  `provider_reference` varchar(255) DEFAULT NULL,
  `amount_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `status` enum('pending','successful','failed','refunded') NOT NULL DEFAULT 'pending',
  `raw_response` longtext DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verification_notes` text DEFAULT NULL,
  `proof_file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nft_cart_payments`
--

INSERT INTO `nft_cart_payments` (`id`, `order_id`, `payment_method`, `provider_name`, `provider_reference`, `amount_cents`, `currency`, `status`, `raw_response`, `paid_at`, `created_at`, `updated_at`, `verification_notes`, `proof_file_path`) VALUES
(1, 1, 'manual', 'manual', NULL, 670000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 02:20:13', '2026-03-25 02:20:13', NULL, NULL),
(2, 2, 'manual', 'manual', NULL, 2400000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 02:44:27', '2026-03-25 02:44:27', NULL, NULL),
(3, 3, 'manual', 'manual', NULL, 150000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 02:57:39', '2026-03-25 02:57:39', NULL, NULL),
(4, 4, 'manual', 'manual', NULL, 280000, 'ZAR', 'successful', NULL, '2026-03-25 21:33:00', '2026-03-25 04:12:58', '2026-03-25 21:33:00', NULL, NULL),
(5, 5, 'manual', 'manual', NULL, 1250000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 09:00:54', '2026-03-25 09:00:54', NULL, NULL),
(6, 6, 'manual', 'manual', NULL, 280000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 09:45:34', '2026-03-25 09:45:34', NULL, NULL),
(7, 7, 'manual', 'manual', NULL, 2400000, 'ZAR', 'pending', NULL, NULL, '2026-03-25 14:10:51', '2026-03-25 14:10:51', NULL, NULL),
(8, 8, 'manual', 'manual', NULL, 1530000, 'ZAR', 'successful', NULL, '2026-03-25 22:18:56', '2026-03-25 22:12:40', '2026-03-25 22:18:56', NULL, NULL),
(9, 9, 'manual', 'manual', NULL, 280000, 'ZAR', 'successful', NULL, '2026-03-26 10:08:49', '2026-03-25 22:18:41', '2026-03-26 10:08:49', NULL, NULL),
(10, 10, 'manual', 'manual', NULL, 280000, 'ZAR', 'successful', NULL, '2026-03-26 10:24:19', '2026-03-26 10:24:11', '2026-03-26 10:24:19', NULL, NULL),
(11, 11, 'manual', 'manual', NULL, 150000, 'ZAR', 'successful', NULL, '2026-03-26 10:31:08', '2026-03-26 10:30:55', '2026-03-26 10:31:08', NULL, NULL),
(12, 12, 'manual', 'manual', NULL, 150000, 'ZAR', 'successful', NULL, '2026-03-26 11:20:01', '2026-03-26 11:19:39', '2026-03-26 11:20:01', NULL, NULL),
(13, 13, 'manual', 'manual', NULL, 280000, 'ZAR', 'successful', NULL, '2026-03-26 12:06:24', '2026-03-26 12:06:13', '2026-03-26 12:06:24', NULL, NULL),
(14, 14, 'manual', 'manual', NULL, 530000, 'ZAR', 'successful', NULL, '2026-03-26 12:40:41', '2026-03-26 12:40:30', '2026-03-26 12:40:41', NULL, NULL),
(15, 15, 'manual', 'manual', NULL, 435000, 'ZAR', 'successful', NULL, '2026-03-26 13:25:29', '2026-03-26 13:25:15', '2026-03-26 13:25:29', NULL, NULL),
(16, 16, 'manual', 'manual', NULL, 1256000, 'ZAR', 'successful', NULL, '2026-03-26 13:27:02', '2026-03-26 13:26:53', '2026-03-26 13:27:02', NULL, NULL),
(17, 17, 'manual', 'manual', NULL, 1776000, 'ZAR', 'successful', NULL, '2026-03-26 13:52:16', '2026-03-26 13:51:59', '2026-03-26 13:52:16', NULL, NULL),
(18, 18, 'manual', 'manual', NULL, 2930000, 'ZAR', 'successful', NULL, '2026-03-26 14:14:36', '2026-03-26 14:06:07', '2026-03-26 14:14:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nft_invoices`
--

CREATE TABLE `nft_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `invoice_payload` varchar(120) NOT NULL,
  `subtotal_cents` int(10) UNSIGNED NOT NULL,
  `total_cents` int(10) UNSIGNED NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `status` enum('draft','sent','paid','void') NOT NULL DEFAULT 'draft',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nft_orders`
--

CREATE TABLE `nft_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `nft_item_id` int(10) UNSIGNED NOT NULL,
  `nft_variant_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `status` enum('pending','awaiting_payment','paid','cancelled','fulfilled') NOT NULL DEFAULT 'pending',
  `subtotal_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `wallet_address` varchar(255) DEFAULT NULL,
  `buyer_note` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nft_payments`
--

CREATE TABLE `nft_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'manual',
  `provider_name` varchar(100) DEFAULT NULL,
  `provider_reference` varchar(255) DEFAULT NULL,
  `amount_cents` int(10) UNSIGNED NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `status` enum('pending','successful','failed','refunded') NOT NULL DEFAULT 'pending',
  `raw_response` longtext DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `family_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(160) NOT NULL,
  `slug` varchar(160) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `product_type` varchar(50) NOT NULL DEFAULT 'physical',
  `brand_name` varchar(120) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `search_keywords` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `discontinued_at` datetime DEFAULT NULL,
  `medical_value_note` text DEFAULT NULL,
  `effects_note` text DEFAULT NULL,
  `aroma_note` text DEFAULT NULL,
  `strength_label` varchar(50) DEFAULT NULL,
  `best_for_note` text DEFAULT NULL,
  `usage_time` varchar(50) DEFAULT NULL,
  `featured_facts` text DEFAULT NULL,
  `related_product_ids` varchar(255) DEFAULT NULL,
  `origin_note` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `family_id`, `name`, `slug`, `description`, `short_description`, `sku`, `product_type`, `brand_name`, `meta_title`, `meta_description`, `search_keywords`, `sort_order`, `published_at`, `discontinued_at`, `medical_value_note`, `effects_note`, `aroma_note`, `strength_label`, `best_for_note`, `usage_time`, `featured_facts`, `related_product_ids`, `origin_note`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Flower 1 Type 1', 'flower-1-type-1', 'Catalog item for Flower 1 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(2, 1, 'Flower 1 Type 2', 'flower-1-type-2', 'Catalog item for Flower 1 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(3, 1, 'Flower 1 Type 3', 'flower-1-type-3', 'Catalog item for Flower 1 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(4, 1, 'Flower 1 Type 4', 'flower-1-type-4', 'Catalog item for Flower 1 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(5, 1, 'Flower 1 Type 5', 'flower-1-type-5', 'Catalog item for Flower 1 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(6, 2, 'Flower 2 Type 1', 'flower-2-type-1', 'Catalog item for Flower 2 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(7, 2, 'Flower 2 Type 2', 'flower-2-type-2', 'Catalog item for Flower 2 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(8, 2, 'Flower 2 Type 3', 'flower-2-type-3', 'Catalog item for Flower 2 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(9, 2, 'Flower 2 Type 4', 'flower-2-type-4', 'Catalog item for Flower 2 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(10, 2, 'Flower 2 Type 5', 'flower-2-type-5', 'Catalog item for Flower 2 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(11, 3, 'Flower 3 Type 1', 'flower-3-type-1', 'Catalog item for Flower 3 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(12, 3, 'Flower 3 Type 2', 'flower-3-type-2', 'Catalog item for Flower 3 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(13, 3, 'Flower 3 Type 3', 'flower-3-type-3', 'Catalog item for Flower 3 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(14, 3, 'Flower 3 Type 4', 'flower-3-type-4', 'Catalog item for Flower 3 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(15, 3, 'Flower 3 Type 5', 'flower-3-type-5', 'Catalog item for Flower 3 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(16, 4, 'Flower 4 Type 1', 'flower-4-type-1', 'Catalog item for Flower 4 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(17, 4, 'Flower 4 Type 2', 'flower-4-type-2', 'Catalog item for Flower 4 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(18, 4, 'Flower 4 Type 3', 'flower-4-type-3', 'Catalog item for Flower 4 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(19, 4, 'Flower 4 Type 4', 'flower-4-type-4', 'Catalog item for Flower 4 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(20, 4, 'Flower 4 Type 5', 'flower-4-type-5', 'Catalog item for Flower 4 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(21, 5, 'Flower 5 Type 1', 'flower-5-type-1', 'Catalog item for Flower 5 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(22, 5, 'Flower 5 Type 2', 'flower-5-type-2', 'Catalog item for Flower 5 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(23, 5, 'Flower 5 Type 3', 'flower-5-type-3', 'Catalog item for Flower 5 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Reference notes only', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(24, 5, 'Flower 5 Type 4', 'flower-5-type-4', 'Catalog item for Flower 5 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(25, 5, 'Flower 5 Type 5', 'flower-5-type-5', 'Catalog item for Flower 5 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(26, 6, 'Flower 6 Type 1', 'flower-6-type-1', 'Catalog item for Flower 6 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(27, 6, 'Flower 6 Type 2', 'flower-6-type-2', 'Catalog item for Flower 6 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(28, 6, 'Flower 6 Type 3', 'flower-6-type-3', 'Catalog item for Flower 6 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(29, 6, 'Flower 6 Type 4', 'flower-6-type-4', 'Catalog item for Flower 6 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(30, 6, 'Flower 6 Type 5', 'flower-6-type-5', 'Catalog item for Flower 6 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(31, 7, 'Flower 7 Type 1', 'flower-7-type-1', 'Catalog item for Flower 7 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(32, 7, 'Flower 7 Type 2', 'flower-7-type-2', 'Catalog item for Flower 7 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(33, 7, 'Flower 7 Type 3', 'flower-7-type-3', 'Catalog item for Flower 7 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(34, 7, 'Flower 7 Type 4', 'flower-7-type-4', 'Catalog item for Flower 7 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(35, 7, 'Flower 7 Type 5', 'flower-7-type-5', 'Catalog item for Flower 7 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(36, 8, 'Flower 8 Type 1', 'flower-8-type-1', 'Catalog item for Flower 8 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(37, 8, 'Flower 8 Type 2', 'flower-8-type-2', 'Catalog item for Flower 8 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(38, 8, 'Flower 8 Type 3', 'flower-8-type-3', 'Catalog item for Flower 8 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(39, 8, 'Flower 8 Type 4', 'flower-8-type-4', 'Catalog item for Flower 8 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(40, 8, 'Flower 8 Type 5', 'flower-8-type-5', 'Catalog item for Flower 8 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(41, 9, 'Flower 9 Type 1', 'flower-9-type-1', 'Catalog item for Flower 9 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(42, 9, 'Flower 9 Type 2', 'flower-9-type-2', 'Catalog item for Flower 9 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(43, 9, 'Flower 9 Type 3', 'flower-9-type-3', 'Catalog item for Flower 9 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(44, 9, 'Flower 9 Type 4', 'flower-9-type-4', 'Catalog item for Flower 9 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(45, 9, 'Flower 9 Type 5', 'flower-9-type-5', 'Catalog item for Flower 9 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(46, 10, 'Flower 10 Type 1', 'flower-10-type-1', 'Catalog item for Flower 10 Type 1', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(47, 10, 'Flower 10 Type 2', 'flower-10-type-2', 'Catalog item for Flower 10 Type 2', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(48, 10, 'Flower 10 Type 3', 'flower-10-type-3', 'Catalog item for Flower 10 Type 3', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(49, 10, 'Flower 10 Type 4', 'flower-10-type-4', 'Catalog item for Flower 10 Type 4', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(50, 10, 'Flower 10 Type 5', 'flower-10-type-5', 'Catalog item for Flower 10 Type 5', NULL, NULL, 'physical', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Reference notes only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Indoor', 1, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_families`
--

CREATE TABLE `product_families` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_families`
--

INSERT INTO `product_families` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `deleted_at`) VALUES
(1, 'Table Mountain Haze', 'flower-1', '(Sativa Hybrid): A local cross of Durban Poison and Silver Haze, created specifically for a premium, energizing, and euphoric high suitable for the local market', 1, '2026-03-25 00:26:39', NULL),
(2, 'Wedding Cake (Pink Cookies)', 'flower-2', '(Hybrid): A top-tier strain in SA for its intense sweetness and high potency, offering heavy sedation and euphoria.', 1, '2026-03-25 00:26:39', NULL),
(3, 'Transkei', 'flower-3', '(Sativa-dominant Landrace): A South African classic prized for a clear-headed, functional high with mild visual enhancements, popular among connoisseurs looking for indigenous, high-grade buds.', 1, '2026-03-25 00:26:39', NULL),
(4, 'Girl Scout Cookies (GSC)', 'flower-4', '(Hybrid): Known for its cookie dough aroma and intense euphoria. A highly popular top-shelf imported strain in South African dispensaries.', 1, '2026-03-25 00:26:39', NULL),
(5, 'Malawi Gold', 'flower-5', '(Pure Sativa): Famed as one of the best landraces on the planet, known for a powerful, long-lasting cerebral high. It is a prized \"high-grade\" sativa from the neighboring region.', 1, '2026-03-25 00:26:39', NULL),
(6, 'Durban Poison', 'flower-6', '(Pure Sativa): South Africa\'s most famous landrace, renowned for high THC (18–24%), intense cerebral energy, and citrus-pine aromas. A top-shelf staple in nearly all SA dispensaries.', 1, '2026-03-25 00:26:39', NULL),
(7, 'Gelato #33 / Wedding Gelato', 'flower-7', '(Indica-dominant Hybrid): A premium dessert strain popular in SA clubs, known for sweet berry/mint flavors and potent, euphoric effects, often reaching 25%+ THC.', 1, '2026-03-25 00:26:39', NULL),
(8, 'Gorilla Glue', 'flower-8', '(Hybrid): Highly sought after in SA for its massive resin production and potency, often testing over 23-25% THC. Known for a strong couch-lock effect and earthy, diesel scent.', 1, '2026-03-25 00:26:39', NULL),
(9, 'Do-Si-Dos', 'flower-9', '(Indica-dominant Hybrid): Frequently found in top-shelf SA stocks, this \"Strain of the Year\" contender is known for high THC and heavy, calming physical relaxation.', 1, '2026-03-25 00:26:39', NULL),
(10, 'Swazi Gold', 'flower-10', '(Sativa Landrace): Celebrated for a smooth, uplifting high and golden trichomes. Thrives in the region, offering a \"high-grade\" experience often preferred by connoisseurs.', 1, '2026-03-25 00:26:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variant_name` varchar(160) NOT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `pack_size_grams` decimal(8,2) NOT NULL,
  `reference_price_cents` int(10) UNSIGNED DEFAULT NULL,
  `compare_at_price_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cost_price_cents` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reorder_level` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `max_per_order` int(10) UNSIGNED DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'ZAR',
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_name`, `sku`, `barcode`, `pack_size_grams`, `reference_price_cents`, `compare_at_price_cents`, `cost_price_cents`, `reorder_level`, `max_per_order`, `currency`, `is_visible`, `is_default`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Flower 1 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(2, 2, 'Flower 1 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(3, 3, 'Flower 1 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(4, 4, 'Flower 1 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(5, 5, 'Flower 1 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(6, 6, 'Flower 2 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(7, 7, 'Flower 2 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(8, 8, 'Flower 2 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(9, 9, 'Flower 2 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(10, 10, 'Flower 2 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(11, 11, 'Flower 3 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(12, 12, 'Flower 3 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(13, 13, 'Flower 3 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(14, 14, 'Flower 3 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(15, 15, 'Flower 3 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(16, 16, 'Flower 4 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(17, 17, 'Flower 4 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(18, 18, 'Flower 4 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(19, 19, 'Flower 4 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(20, 20, 'Flower 4 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(21, 21, 'Flower 5 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(22, 22, 'Flower 5 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(23, 23, 'Flower 5 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(24, 24, 'Flower 5 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(25, 25, 'Flower 5 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(26, 26, 'Flower 6 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(27, 27, 'Flower 6 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(28, 28, 'Flower 6 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(29, 29, 'Flower 6 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(30, 30, 'Flower 6 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(31, 31, 'Flower 7 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(32, 32, 'Flower 7 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(33, 33, 'Flower 7 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(34, 34, 'Flower 7 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(35, 35, 'Flower 7 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(36, 36, 'Flower 8 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(37, 37, 'Flower 8 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(38, 38, 'Flower 8 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(39, 39, 'Flower 8 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(40, 40, 'Flower 8 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(41, 41, 'Flower 9 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(42, 42, 'Flower 9 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(43, 43, 'Flower 9 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(44, 44, 'Flower 9 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(45, 45, 'Flower 9 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(46, 46, 'Flower 10 Type 1 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(47, 47, 'Flower 10 Type 2 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(48, 48, 'Flower 10 Type 3 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(49, 49, 'Flower 10 Type 4 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(50, 50, 'Flower 10 Type 5 - 5g', NULL, NULL, 5.00, 150000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(64, 1, 'Flower 1 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(65, 2, 'Flower 1 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(66, 3, 'Flower 1 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(67, 4, 'Flower 1 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(68, 5, 'Flower 1 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(69, 6, 'Flower 2 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(70, 7, 'Flower 2 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(71, 8, 'Flower 2 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(72, 9, 'Flower 2 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(73, 10, 'Flower 2 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(74, 11, 'Flower 3 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(75, 12, 'Flower 3 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(76, 13, 'Flower 3 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(77, 14, 'Flower 3 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(78, 15, 'Flower 3 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(79, 16, 'Flower 4 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(80, 17, 'Flower 4 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(81, 18, 'Flower 4 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(82, 19, 'Flower 4 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(83, 20, 'Flower 4 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(84, 21, 'Flower 5 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(85, 22, 'Flower 5 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(86, 23, 'Flower 5 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(87, 24, 'Flower 5 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(88, 25, 'Flower 5 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(89, 26, 'Flower 6 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(90, 27, 'Flower 6 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(91, 28, 'Flower 6 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(92, 29, 'Flower 6 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(93, 30, 'Flower 6 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(94, 31, 'Flower 7 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(95, 32, 'Flower 7 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(96, 33, 'Flower 7 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(97, 34, 'Flower 7 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(98, 35, 'Flower 7 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(99, 36, 'Flower 8 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(100, 37, 'Flower 8 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(101, 38, 'Flower 8 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(102, 39, 'Flower 8 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(103, 40, 'Flower 8 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(104, 41, 'Flower 9 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(105, 42, 'Flower 9 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(106, 43, 'Flower 9 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(107, 44, 'Flower 9 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(108, 45, 'Flower 9 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(109, 46, 'Flower 10 Type 1 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(110, 47, 'Flower 10 Type 2 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(111, 48, 'Flower 10 Type 3 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(112, 49, 'Flower 10 Type 4 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(113, 50, 'Flower 10 Type 5 - 10g', NULL, NULL, 10.00, 280000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(127, 1, 'Flower 1 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(128, 2, 'Flower 1 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(129, 3, 'Flower 1 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(130, 4, 'Flower 1 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(131, 5, 'Flower 1 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(132, 6, 'Flower 2 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(133, 7, 'Flower 2 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(134, 8, 'Flower 2 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(135, 9, 'Flower 2 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(136, 10, 'Flower 2 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(137, 11, 'Flower 3 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(138, 12, 'Flower 3 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(139, 13, 'Flower 3 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(140, 14, 'Flower 3 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(141, 15, 'Flower 3 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(142, 16, 'Flower 4 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(143, 17, 'Flower 4 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(144, 18, 'Flower 4 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(145, 19, 'Flower 4 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(146, 20, 'Flower 4 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(147, 21, 'Flower 5 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(148, 22, 'Flower 5 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(149, 23, 'Flower 5 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(150, 24, 'Flower 5 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(151, 25, 'Flower 5 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(152, 26, 'Flower 6 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(153, 27, 'Flower 6 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(154, 28, 'Flower 6 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(155, 29, 'Flower 6 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(156, 30, 'Flower 6 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(157, 31, 'Flower 7 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(158, 32, 'Flower 7 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(159, 33, 'Flower 7 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(160, 34, 'Flower 7 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(161, 35, 'Flower 7 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(162, 36, 'Flower 8 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(163, 37, 'Flower 8 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(164, 38, 'Flower 8 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(165, 39, 'Flower 8 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(166, 40, 'Flower 8 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(167, 41, 'Flower 9 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(168, 42, 'Flower 9 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(169, 43, 'Flower 9 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(170, 44, 'Flower 9 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(171, 45, 'Flower 9 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(172, 46, 'Flower 10 Type 1 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(173, 47, 'Flower 10 Type 2 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(174, 48, 'Flower 10 Type 3 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(175, 49, 'Flower 10 Type 4 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(176, 50, 'Flower 10 Type 5 - 20g', NULL, NULL, 20.00, 520000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(190, 1, 'Flower 1 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(191, 2, 'Flower 1 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(192, 3, 'Flower 1 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(193, 4, 'Flower 1 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(194, 5, 'Flower 1 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(195, 6, 'Flower 2 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(196, 7, 'Flower 2 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(197, 8, 'Flower 2 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(198, 9, 'Flower 2 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(199, 10, 'Flower 2 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(200, 11, 'Flower 3 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(201, 12, 'Flower 3 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(202, 13, 'Flower 3 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(203, 14, 'Flower 3 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(204, 15, 'Flower 3 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(205, 16, 'Flower 4 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(206, 17, 'Flower 4 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(207, 18, 'Flower 4 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(208, 19, 'Flower 4 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(209, 20, 'Flower 4 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(210, 21, 'Flower 5 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(211, 22, 'Flower 5 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(212, 23, 'Flower 5 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(213, 24, 'Flower 5 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(214, 25, 'Flower 5 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(215, 26, 'Flower 6 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(216, 27, 'Flower 6 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(217, 28, 'Flower 6 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(218, 29, 'Flower 6 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(219, 30, 'Flower 6 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(220, 31, 'Flower 7 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(221, 32, 'Flower 7 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(222, 33, 'Flower 7 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(223, 34, 'Flower 7 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(224, 35, 'Flower 7 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(225, 36, 'Flower 8 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(226, 37, 'Flower 8 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(227, 38, 'Flower 8 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(228, 39, 'Flower 8 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(229, 40, 'Flower 8 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(230, 41, 'Flower 9 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(231, 42, 'Flower 9 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(232, 43, 'Flower 9 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(233, 44, 'Flower 9 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(234, 45, 'Flower 9 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(235, 46, 'Flower 10 Type 1 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(236, 47, 'Flower 10 Type 2 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(237, 48, 'Flower 10 Type 3 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(238, 49, 'Flower 10 Type 4 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(239, 50, 'Flower 10 Type 5 - 50g', NULL, NULL, 50.00, 1250000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(253, 1, 'Flower 1 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(254, 2, 'Flower 1 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(255, 3, 'Flower 1 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(256, 4, 'Flower 1 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(257, 5, 'Flower 1 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(258, 6, 'Flower 2 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(259, 7, 'Flower 2 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(260, 8, 'Flower 2 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(261, 9, 'Flower 2 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(262, 10, 'Flower 2 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(263, 11, 'Flower 3 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(264, 12, 'Flower 3 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(265, 13, 'Flower 3 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(266, 14, 'Flower 3 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(267, 15, 'Flower 3 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(268, 16, 'Flower 4 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(269, 17, 'Flower 4 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(270, 18, 'Flower 4 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(271, 19, 'Flower 4 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(272, 20, 'Flower 4 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(273, 21, 'Flower 5 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(274, 22, 'Flower 5 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(275, 23, 'Flower 5 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(276, 24, 'Flower 5 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(277, 25, 'Flower 5 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(278, 26, 'Flower 6 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(279, 27, 'Flower 6 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(280, 28, 'Flower 6 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(281, 29, 'Flower 6 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(282, 30, 'Flower 6 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(283, 31, 'Flower 7 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(284, 32, 'Flower 7 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(285, 33, 'Flower 7 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(286, 34, 'Flower 7 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(287, 35, 'Flower 7 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(288, 36, 'Flower 8 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(289, 37, 'Flower 8 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(290, 38, 'Flower 8 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(291, 39, 'Flower 8 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(292, 40, 'Flower 8 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(293, 41, 'Flower 9 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(294, 42, 'Flower 9 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(295, 43, 'Flower 9 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(296, 44, 'Flower 9 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(297, 45, 'Flower 9 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(298, 46, 'Flower 10 Type 1 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(299, 47, 'Flower 10 Type 2 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(300, 48, 'Flower 10 Type 3 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(301, 49, 'Flower 10 Type 4 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL),
(302, 50, 'Flower 10 Type 5 - 100g', NULL, NULL, 100.00, 2400000, 0, 0, 5, NULL, 'ZAR', 1, 0, 0, '2026-03-25 00:26:39', '2026-03-25 00:26:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bot_sessions`
--
ALTER TABLE `bot_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_bot_sessions_user` (`user_id`);

--
-- Indexes for table `bot_users`
--
ALTER TABLE `bot_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_user_id` (`telegram_user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_carts_user_status` (`user_id`,`status`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cart_variant` (`cart_id`,`product_variant_id`),
  ADD KEY `idx_cart_items_cart` (`cart_id`),
  ADD KEY `fk_cart_items_variant` (`product_variant_id`);

--
-- Indexes for table `customer_events`
--
ALTER TABLE `customer_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_inquiries`
--
ALTER TABLE `customer_inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inquiries_user` (`user_id`),
  ADD KEY `fk_inquiries_product` (`product_id`),
  ADD KEY `fk_inquiries_variant` (`variant_id`);

--
-- Indexes for table `inquiry_messages`
--
ALTER TABLE `inquiry_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inquiry_messages_inquiry` (`inquiry_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_id` (`variant_id`);

--
-- Indexes for table `nft_cart_orders`
--
ALTER TABLE `nft_cart_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_nft_cart_orders_user` (`user_id`),
  ADD KEY `idx_nft_cart_orders_cart` (`cart_id`);

--
-- Indexes for table `nft_cart_order_items`
--
ALTER TABLE `nft_cart_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nft_cart_order_items_order` (`order_id`),
  ADD KEY `fk_nft_cart_order_items_product` (`product_id`),
  ADD KEY `fk_nft_cart_order_items_variant` (`variant_id`);

--
-- Indexes for table `nft_cart_payments`
--
ALTER TABLE `nft_cart_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nft_cart_payments_order` (`order_id`);

--
-- Indexes for table `nft_invoices`
--
ALTER TABLE `nft_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD UNIQUE KEY `invoice_payload` (`invoice_payload`),
  ADD KEY `fk_nft_invoices_order` (`order_id`);

--
-- Indexes for table `nft_orders`
--
ALTER TABLE `nft_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `fk_nft_orders_user` (`user_id`),
  ADD KEY `fk_nft_orders_item` (`nft_item_id`),
  ADD KEY `fk_nft_orders_variant` (`nft_variant_id`);

--
-- Indexes for table `nft_payments`
--
ALTER TABLE `nft_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nft_payments_order` (`order_id`),
  ADD KEY `fk_nft_payments_invoice` (`invoice_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_products_family` (`family_id`);

--
-- Indexes for table `product_families`
--
ALTER TABLE `product_families`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_images_product` (`product_id`),
  ADD KEY `idx_product_images_variant` (`variant_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_variants_product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bot_sessions`
--
ALTER TABLE `bot_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `bot_users`
--
ALTER TABLE `bot_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customer_events`
--
ALTER TABLE `customer_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_inquiries`
--
ALTER TABLE `customer_inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry_messages`
--
ALTER TABLE `inquiry_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `nft_cart_orders`
--
ALTER TABLE `nft_cart_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `nft_cart_order_items`
--
ALTER TABLE `nft_cart_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `nft_cart_payments`
--
ALTER TABLE `nft_cart_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `nft_invoices`
--
ALTER TABLE `nft_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nft_orders`
--
ALTER TABLE `nft_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nft_payments`
--
ALTER TABLE `nft_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_families`
--
ALTER TABLE `product_families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bot_sessions`
--
ALTER TABLE `bot_sessions`
  ADD CONSTRAINT `fk_bot_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `bot_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_user` FOREIGN KEY (`user_id`) REFERENCES `bot_users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_items_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `customer_inquiries`
--
ALTER TABLE `customer_inquiries`
  ADD CONSTRAINT `fk_inquiries_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inquiries_user` FOREIGN KEY (`user_id`) REFERENCES `bot_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inquiries_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `inquiry_messages`
--
ALTER TABLE `inquiry_messages`
  ADD CONSTRAINT `fk_inquiry_messages_inquiry` FOREIGN KEY (`inquiry_id`) REFERENCES `customer_inquiries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nft_cart_orders`
--
ALTER TABLE `nft_cart_orders`
  ADD CONSTRAINT `fk_nft_cart_orders_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `fk_nft_cart_orders_user` FOREIGN KEY (`user_id`) REFERENCES `bot_users` (`id`);

--
-- Constraints for table `nft_cart_order_items`
--
ALTER TABLE `nft_cart_order_items`
  ADD CONSTRAINT `fk_nft_cart_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `nft_cart_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nft_cart_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_nft_cart_order_items_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `nft_cart_payments`
--
ALTER TABLE `nft_cart_payments`
  ADD CONSTRAINT `fk_nft_cart_payments_order` FOREIGN KEY (`order_id`) REFERENCES `nft_cart_orders` (`id`);

--
-- Constraints for table `nft_invoices`
--
ALTER TABLE `nft_invoices`
  ADD CONSTRAINT `fk_nft_invoices_order` FOREIGN KEY (`order_id`) REFERENCES `nft_orders` (`id`);

--
-- Constraints for table `nft_orders`
--
ALTER TABLE `nft_orders`
  ADD CONSTRAINT `fk_nft_orders_item` FOREIGN KEY (`nft_item_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_nft_orders_user` FOREIGN KEY (`user_id`) REFERENCES `bot_users` (`id`),
  ADD CONSTRAINT `fk_nft_orders_variant` FOREIGN KEY (`nft_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `nft_payments`
--
ALTER TABLE `nft_payments`
  ADD CONSTRAINT `fk_nft_payments_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `nft_invoices` (`id`),
  ADD CONSTRAINT `fk_nft_payments_order` FOREIGN KEY (`order_id`) REFERENCES `nft_orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_family` FOREIGN KEY (`family_id`) REFERENCES `product_families` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_images_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_variants_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
