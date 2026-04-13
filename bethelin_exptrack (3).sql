-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2026 at 10:19 PM
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
-- Database: `bethelin_exptrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `booking_id`, `staff_id`, `action`, `old_value`, `new_value`, `note`, `created_at`) VALUES
(2, 2, 1, 'DEMO CHECK-IN', '', 'In-Yard', 'Demo CRM booking inserted', '2026-04-02 20:25:30'),
(3, 3, 1, 'DEMO CHECK-IN', '', 'In-Yard', 'Demo CRM booking inserted', '2026-04-02 20:25:30'),
(4, 4, 1, 'DEMO CHECK-IN', '', 'In-Yard', 'Demo CRM booking inserted', '2026-04-02 20:25:30'),
(5, 5, 1, 'DEMO CHECK-IN', '', 'In-Yard', 'Demo CRM booking inserted', '2026-04-02 20:25:30'),
(8, 8, NULL, 'Booking created via Telegram bot', '', 'Pending', NULL, '2026-04-03 00:05:25'),
(9, 9, NULL, 'Booking created via Telegram bot', '', 'Pending', NULL, '2026-04-03 11:03:22'),
(10, 9, NULL, 'STATUS CHANGE', 'Pending', 'Ready', NULL, '2026-04-04 07:39:58'),
(11, 8, NULL, 'STATUS CHANGE', 'Pending', 'In-Wash', NULL, '2026-04-04 07:40:01'),
(12, 10, NULL, 'Booking created via Telegram bot', '', 'Pending', NULL, '2026-04-04 09:19:41'),
(13, 3, NULL, 'STATUS CHANGE', 'In-Yard', 'In-Wash', NULL, '2026-04-04 09:20:29'),
(14, 4, NULL, 'STATUS CHANGE', 'Ready', 'Ready', NULL, '2026-04-04 09:20:37'),
(15, 8, NULL, 'STATUS CHANGE', 'In-Wash', 'Completed', NULL, '2026-04-04 09:24:19'),
(16, 9, NULL, 'STATUS CHANGE', 'Ready', 'Completed', NULL, '2026-04-04 09:24:26'),
(17, 3, NULL, 'STATUS CHANGE', 'In-Wash', 'Completed', NULL, '2026-04-04 09:24:30'),
(18, 10, NULL, 'STATUS CHANGE', 'Pending', 'Completed', NULL, '2026-04-04 09:24:33'),
(19, 4, NULL, 'STATUS CHANGE', 'Ready', 'Completed', NULL, '2026-04-04 09:24:39'),
(20, 2, NULL, 'STATUS CHANGE', 'In-Wash', 'In-Wash', NULL, '2026-04-04 09:24:39'),
(22, 2, NULL, 'STATUS CHANGE', 'In-Wash', 'In-Wash', NULL, '2026-04-04 09:24:46'),
(23, 2, NULL, 'STATUS CHANGE', 'In-Wash', 'Completed', NULL, '2026-04-04 09:24:51'),
(24, 11, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-05 07:55:15'),
(25, 12, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-05 08:05:38'),
(26, 13, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-05 08:08:18'),
(27, 14, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-05 08:09:09'),
(28, 15, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-06 09:18:49'),
(29, 16, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-06 09:22:14'),
(30, 17, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-06 09:23:12'),
(31, 18, NULL, 'Booking created via Telegram bot', '', 'Pending', NULL, '2026-04-06 14:15:39'),
(32, 19, NULL, 'Vehicle checked in', '', 'In-Yard', NULL, '2026-04-07 10:53:32'),
(33, 20, NULL, 'Booking created via Telegram bot', '', 'Pending', NULL, '2026-04-07 17:16:33'),
(35, 19, NULL, 'STATUS CHANGE', 'In-Yard', 'Ready', NULL, '2026-04-07 17:27:21'),
(37, 20, NULL, 'STATUS CHANGE', 'Pending', 'Ready', NULL, '2026-04-07 17:27:22'),
(38, 16, NULL, 'STATUS CHANGE', 'In-Yard', 'Ready', NULL, '2026-04-07 17:27:23'),
(39, 17, NULL, 'STATUS CHANGE', 'In-Yard', 'Ready', NULL, '2026-04-07 17:27:24'),
(40, 15, NULL, 'STATUS CHANGE', 'In-Yard', 'Ready', NULL, '2026-04-07 17:27:25'),
(41, 14, NULL, 'STATUS CHANGE', 'In-Yard', 'Ready', NULL, '2026-04-07 17:27:26'),
(42, 18, NULL, 'STATUS CHANGE', 'Pending', 'In-Yard', NULL, '2026-04-07 17:27:30'),
(43, 11, NULL, 'STATUS CHANGE', 'In-Yard', 'Pending', NULL, '2026-04-07 17:27:34'),
(44, 12, NULL, 'STATUS CHANGE', 'In-Yard', 'In-Wash', NULL, '2026-04-07 17:27:35'),
(45, 13, NULL, 'STATUS CHANGE', 'In-Yard', 'In-Yard', NULL, '2026-04-07 17:27:39'),
(48, 18, NULL, 'STATUS CHANGE', 'In-Yard', 'Completed', NULL, '2026-04-12 07:27:41'),
(59, NULL, NULL, 'BOOKING DELETED', 'BV256CB35B', 'BY70VLZN', 'Deleted by staff. Reason: No reason given. Customer: Sundrambal Ramsamy | Phone: 0763410914', '2026-04-13 09:11:07'),
(60, NULL, NULL, 'BOOKING DELETED', 'BVDEMO001', 'ND 123 456', 'Deleted by staff. Reason: No reason given. Customer: Thabo Mkhize | Phone: +27821230001', '2026-04-13 09:46:40'),
(61, NULL, NULL, 'BOOKING DELETED', 'BV03DEA10A', 'CA 123-456', 'Deleted by staff. Reason: No reason given. Customer: Jasmine | Phone: 0803111111', '2026-04-13 09:46:45'),
(62, NULL, NULL, 'BOOKING DELETED', 'BV0530A9BD', 'CA123645', 'Deleted by staff. Reason: No reason given. Customer: Phil | Phone: 0765554444', '2026-04-13 09:46:48'),
(63, NULL, NULL, 'BOOKING DELETED', 'BV799E205B', 'CA 123457', 'Deleted by staff. Reason: No reason given. Customer: Tara Wilson | Phone: +27630228967', '2026-04-13 09:46:52'),
(64, NULL, NULL, 'BOOKING DELETED', 'BVA260519D', 'CA123456', 'Deleted by staff. Reason: No reason given. Customer: Terry | Phone: 0731189798', '2026-04-13 09:46:55'),
(65, NULL, NULL, 'BOOKING DELETED', 'BVDDF7A55C', 'CAN 123456', 'Deleted by staff. Reason: No reason given. Customer: Joe | Phone: 0763410914', '2026-04-13 09:46:58'),
(66, NULL, NULL, 'BOOKING DELETED', 'BVB96BE66E', 'BY70VLZN', 'Deleted by staff. Reason: No reason given. Customer: S. Ramsamy | Phone: 0763410914', '2026-04-13 09:53:20'),
(67, 12, NULL, 'STATUS CHANGE', 'In-Wash', 'Cancelled', NULL, '2026-04-13 09:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `booking_ref` varchar(12) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(120) DEFAULT NULL,
  `vehicle_reg` varchar(15) NOT NULL,
  `vehicle_make` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(50) DEFAULT NULL,
  `vehicle_color` varchar(30) DEFAULT NULL,
  `flight_number` varchar(12) DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `actual_checkin_at` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `actual_checkout_at` datetime DEFAULT NULL,
  `return_flight` varchar(12) DEFAULT NULL,
  `status` enum('Pending','In-Yard','In-Wash','Ready','Dispatched','Completed','Cancelled') DEFAULT 'Pending',
  `parking_bay` varchar(10) DEFAULT NULL,
  `parking_zone` enum('A','B','C','D','VIP') DEFAULT 'A',
  `special_notes` text DEFAULT NULL,
  `damage_noted` tinyint(1) DEFAULT 0,
  `fuel_level` enum('Empty','Quarter','Half','Three-Quarter','Full') DEFAULT 'Full',
  `mileage_in` int(11) DEFAULT NULL,
  `mileage_out` int(11) DEFAULT NULL,
  `assigned_driver` int(11) DEFAULT NULL,
  `rate_per_day` decimal(8,2) DEFAULT 120.00,
  `total_charge` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('Unpaid','Partial','Paid') DEFAULT 'Unpaid',
  `payment_method` enum('Cash','Card','EFT','Voucher') DEFAULT 'Cash',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_demo` tinyint(1) NOT NULL DEFAULT 0,
  `overdue_notified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_id`, `vehicle_id`, `booking_ref`, `customer_name`, `customer_phone`, `customer_email`, `vehicle_reg`, `vehicle_make`, `vehicle_model`, `vehicle_color`, `flight_number`, `departure_date`, `actual_checkin_at`, `return_date`, `actual_checkout_at`, `return_flight`, `status`, `parking_bay`, `parking_zone`, `special_notes`, `damage_noted`, `fuel_level`, `mileage_in`, `mileage_out`, `assigned_driver`, `rate_per_day`, `total_charge`, `payment_status`, `payment_method`, `created_at`, `updated_at`, `created_by`, `is_demo`, `overdue_notified`) VALUES
(2, 2, 2, 'BVDEMO002', 'Anele Naidoo', '+27821230002', 'anele.naidoo@example.com', 'ND 222 901', 'Volkswagen', 'Polo', 'Silver', 'MN221', '2026-04-01 22:25:30', '2026-04-01 22:25:30', '2026-04-03 22:25:30', NULL, 'MN222', 'Completed', '07', 'B', 'Quick exterior wash only', 0, 'Full', 78110, NULL, 1, 120.00, 120.00, 'Unpaid', 'Cash', '2026-04-02 20:25:30', '2026-04-04 09:24:51', 1, 1, 0),
(3, 3, 3, 'BVDEMO003', 'Sibusiso Dlamini', '+27821230003', 'sibusiso.dlamini@example.com', 'ND 778 410', 'Ford', 'Ranger', 'Blue', 'SA703', '2026-03-28 22:25:30', '2026-03-28 22:25:30', '2026-04-01 22:25:30', NULL, 'SA704', 'Completed', '12', 'C', 'Customer delayed return flight. Follow up if no contact.', 0, 'Quarter', 120455, NULL, 1, 120.00, 600.00, 'Partial', 'EFT', '2026-04-02 20:25:30', '2026-04-04 09:24:30', 1, 1, 0),
(4, 4, 4, 'BVDEMO004', 'Lerato Khumalo', '+27821230004', 'lerato.khumalo@example.com', 'ND 555 782', 'BMW', 'X3', 'Black', 'BA118', '2026-03-30 22:25:30', '2026-03-30 22:25:30', '2026-04-03 01:25:30', NULL, 'BA119', 'Completed', '02', 'VIP', 'VIP customer. Prioritize front placement and readiness.', 0, 'Three-Quarter', 33210, NULL, 1, 180.00, 540.00, 'Paid', 'EFT', '2026-04-02 20:25:30', '2026-04-04 09:24:39', 1, 1, 0),
(5, 5, 5, 'BVDEMO005', 'Megan Peters', '+27821230005', 'megan.peters@example.com', 'ND 918 300', 'Hyundai', 'Creta', 'Grey', 'FA900', '2026-03-26 22:25:30', '2026-03-26 22:25:30', '2026-03-31 22:25:30', '2026-03-31 22:25:30', 'FA901', 'Completed', NULL, 'A', 'Completed stay. Good sample for history screens.', 0, 'Half', 65420, 65501, 1, 120.00, 840.00, 'Paid', 'Card', '2026-04-02 20:25:30', '2026-04-02 20:25:30', 1, 1, 0),
(8, NULL, NULL, 'BV3DB3C0B4', 'Veshalen', '083987990', NULL, 'FFHGXHJJ', NULL, NULL, NULL, 'JUGHI8YI', '2025-07-15 06:30:00', NULL, '2025-07-22 14:00:00', NULL, NULL, 'Completed', NULL, 'A', 'Booked via Telegram bot by Veshalen.', 0, 'Full', NULL, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-03 00:05:25', '2026-04-04 09:24:19', NULL, 0, 0),
(9, NULL, NULL, 'BVF8BC8B4C', 'Sue', '0763410914', NULL, 'NJ50326', NULL, NULL, NULL, 'FA911', '2025-07-15 13:03:02', NULL, '2025-07-22 14:00:00', NULL, NULL, 'Completed', NULL, 'A', 'Booked via Telegram bot by Veshalen.', 0, 'Full', NULL, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-03 11:03:22', '2026-04-04 09:24:26', NULL, 0, 0),
(10, NULL, NULL, 'BV29B2C4F1', 'Fred', '0791333347', NULL, 'CA 123-456', NULL, NULL, NULL, 'FA101', '2025-07-15 06:30:00', NULL, '2025-07-22 14:00:00', NULL, NULL, 'Completed', NULL, 'A', 'Booked via Telegram bot by Veshalen.', 0, 'Full', NULL, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-04 09:19:41', '2026-04-04 09:24:33', NULL, 0, 0),
(11, NULL, NULL, 'BVF088C21B', 'Admn27 null', '+27630228965', 'veshalenr17@gmail.com', 'CA 123456', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-05 10:54:00', NULL, '2026-04-08 11:54:00', NULL, 'FA102', 'Pending', '01', 'A', 'Scratch on the driver sidebumper', 0, 'Half', 123456, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-05 07:55:15', '2026-04-08 09:55:03', NULL, 0, 1),
(12, NULL, NULL, 'BVE3D6EF20', 'Admn27 null', '+27630228965', 'veshalenr17@gmail.com', 'CA 123456', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-05 10:54:00', NULL, '2026-04-08 11:54:00', NULL, 'FA102', 'Cancelled', '01', 'A', 'Scratch on the driver sidebumper', 0, 'Half', 123456, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-05 08:05:38', '2026-04-13 09:53:50', NULL, 0, 1),
(13, NULL, NULL, 'BV74266233', 'Admn27 null', '+27630228965', 'veshalenr17@gmail.com', 'CA 123456', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-05 10:54:00', NULL, '2026-04-08 11:54:00', NULL, 'FA102', 'In-Yard', '01', 'A', 'Scratch on the driver sidebumper', 0, 'Half', 123456, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-05 08:08:18', '2026-04-08 09:55:03', NULL, 0, 1),
(14, NULL, NULL, 'BVB938785D', 'Admn27 null', '+27630228965', 'veshalenr17@gmail.com', 'CA 123456', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-05 10:54:00', NULL, '2026-04-08 11:54:00', NULL, 'FA102', 'Ready', '01', 'A', 'Scratch on the driver sidebumper', 0, 'Half', 123456, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-05 08:09:09', '2026-04-08 09:55:03', NULL, 0, 1),
(15, NULL, NULL, 'BVB24D7520', 'Themba Dlamini', '+27827772785', 'themba@ntt_tenders.co.za', 'CA 123457', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-06 23:19:00', NULL, '2026-04-15 11:18:00', NULL, 'FA102', 'Ready', NULL, 'A', NULL, 0, 'Three-Quarter', 12345678, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-06 09:18:49', '2026-04-07 17:27:25', NULL, 0, 0),
(16, NULL, NULL, 'BVA57B202E', 'Themba Dlamini', '+27827772785', 'themba@ntt_tenders.co.za', 'CA 123457', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-06 23:19:00', NULL, '2026-04-15 11:18:00', NULL, 'FA102', 'Ready', NULL, 'A', NULL, 0, 'Three-Quarter', 12345678, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-06 09:22:14', '2026-04-07 17:27:23', NULL, 0, 0),
(17, NULL, NULL, 'BVD1890C72', 'Themba Dlamini', '+27827772785', 'themba@ntt_tenders.co.za', 'CA 123457', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-06 23:19:00', NULL, '2026-04-15 11:18:00', NULL, 'FA102', 'Ready', NULL, 'A', NULL, 0, 'Three-Quarter', 12345678, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-06 09:23:12', '2026-04-07 17:27:24', NULL, 0, 0),
(18, NULL, NULL, 'BVCF908CF4', 'Sundrambal Ramsamy', '0763410914', NULL, 'BY70VLZN', NULL, NULL, NULL, 'SA417', '2026-07-15 16:15:23', NULL, '2025-07-22 14:00:00', NULL, NULL, 'Completed', NULL, 'A', 'Booked via Telegram bot by Sundrambal Ramsamy.', 0, 'Full', NULL, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-06 14:15:39', '2026-04-12 07:27:41', NULL, 0, 1),
(19, NULL, NULL, 'BV1539A779', 'Admn27 null', '+27630228965', 'admin@bethelinternational.co.za', 'CA 123456', 'Toyota', 'Fortuner', 'Silver', 'FA101', '2026-04-09 12:53:00', NULL, '2026-04-22 12:53:00', NULL, 'FA102', 'Ready', '01', 'A', NULL, 0, 'Full', 123456789, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-07 10:53:32', '2026-04-07 17:27:21', NULL, 0, 0),
(20, NULL, NULL, 'BVAC8DF343', 'S. Ramsamy', '0763410914', NULL, 'BY70VLZN', NULL, NULL, NULL, 'SA417', '2025-06-15 19:16:08', NULL, '2026-06-20 19:16:26', NULL, NULL, 'Ready', NULL, 'A', 'Booked via Telegram bot by Sundrambal Ramsamy.', 0, 'Full', NULL, NULL, NULL, 120.00, NULL, 'Unpaid', 'Cash', '2026-04-07 17:16:33', '2026-04-07 17:27:22', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `booking_images`
--

CREATE TABLE `booking_images` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_type` enum('Damage','Checkin','Checkout','ID','Other') NOT NULL DEFAULT 'Other',
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_notes`
--

CREATE TABLE `booking_notes` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `note_type` enum('General','Customer','Ops','Damage','Payment','Internal') NOT NULL DEFAULT 'General',
  `note` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_notes`
--

INSERT INTO `booking_notes` (`id`, `booking_id`, `note_type`, `note`, `created_by`, `created_at`) VALUES
(2, 2, 'Payment', 'Customer will settle balance at pickup.', 1, '2026-04-02 20:25:30'),
(3, 3, 'Customer', 'Customer advised return may be delayed by 24 hours.', 1, '2026-04-02 20:25:30'),
(4, 4, 'Internal', 'VIP handling required for collection window.', 1, '2026-04-02 20:25:30'),
(5, 5, 'General', 'Historical completed booking for CRM testing.', 1, '2026-04-02 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `booking_services`
--

CREATE TABLE `booking_services` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_status_history`
--

CREATE TABLE `booking_status_history` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_status_history`
--

INSERT INTO `booking_status_history` (`id`, `booking_id`, `old_status`, `new_status`, `changed_by`, `note`, `created_at`) VALUES
(3, 2, 'Pending', 'In-Yard', 1, 'Checked in', '2026-04-02 20:25:30'),
(4, 2, 'In-Yard', 'In-Wash', 1, 'Moved to wash queue', '2026-04-02 20:25:30'),
(5, 3, 'Pending', 'In-Yard', 1, 'Checked in', '2026-04-02 20:25:30'),
(6, 4, 'Pending', 'In-Yard', 1, 'Checked in', '2026-04-02 20:25:30'),
(7, 4, 'In-Yard', 'Ready', 1, 'Vehicle staged for VIP collection', '2026-04-02 20:25:30'),
(8, 5, 'Pending', 'In-Yard', 1, 'Checked in', '2026-04-02 20:25:30'),
(9, 5, 'In-Yard', 'Dispatched', 1, 'Vehicle released to customer', '2026-04-02 20:25:30'),
(10, 5, 'Dispatched', 'Completed', 1, 'Booking closed', '2026-04-02 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Active','Inactive','Blacklisted') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `phone`, `email`, `whatsapp`, `notes`, `is_vip`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Thabo Mkhize', '+27821230001', 'thabo.mkhize@example.com', '+27821230001', 'Frequent business traveller. Prefers covered bay when available.', 1, 'Active', '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(2, 'Anele Naidoo', '+27821230002', 'anele.naidoo@example.com', '+27821230002', 'Usually books short stays and asks for wash before pickup.', 0, 'Active', '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(3, 'Sibusiso Dlamini', '+27821230003', 'sibusiso.dlamini@example.com', '+27821230003', 'Travels monthly. Good repeat customer.', 0, 'Active', '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(4, 'Lerato Khumalo', '+27821230004', 'lerato.khumalo@example.com', '+27821230004', 'VIP customer. Wants WhatsApp updates.', 1, 'Active', '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(5, 'Megan Peters', '+27821230005', 'megan.peters@example.com', '+27821230005', 'Family traveller. Sometimes late on return.', 0, 'Active', '2026-04-02 20:25:30', '2026-04-02 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `damage_reports`
--

CREATE TABLE `damage_reports` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `reported_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `severity` enum('Minor','Moderate','Severe') DEFAULT 'Minor',
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_log`
--

CREATE TABLE `message_log` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `provider_key` varchar(50) NOT NULL,
  `channel_key` varchar(50) NOT NULL,
  `template_key` varchar(80) DEFAULT NULL,
  `recipient` varchar(50) NOT NULL,
  `message_body` text NOT NULL,
  `direction` enum('Outbound','Inbound') NOT NULL DEFAULT 'Outbound',
  `status` varchar(50) NOT NULL DEFAULT 'Queued',
  `external_message_id` varchar(150) DEFAULT NULL,
  `provider_response` longtext DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message_log`
--

INSERT INTO `message_log` (`id`, `booking_id`, `customer_id`, `provider_key`, `channel_key`, `template_key`, `recipient`, `message_body`, `direction`, `status`, `external_message_id`, `provider_response`, `error_message`, `created_at`, `sent_at`) VALUES
(1, 14, NULL, 'twilio_whatsapp_sandbox', 'whatsapp', 'checkin_confirmation', '+27630228965', 'Hi Admn27 null, your vehicle CA 123456 has been checked in successfully. Booking ref: BVB938785D. Expected return: 2026-04-08T11:54.', 'Outbound', 'Failed', NULL, NULL, 'Twilio sandbox config is incomplete', '2026-04-05 08:09:09', '2026-04-05 10:09:09'),
(2, 17, NULL, 'twilio_whatsapp_sandbox', 'whatsapp', 'checkin_confirmation', '+27827772785', 'Hi Themba Dlamini, your vehicle CA 123457 has been checked in successfully. Booking ref: BVD1890C72. Expected return: 2026-04-15T11:18.', 'Outbound', 'Failed', NULL, NULL, 'Twilio sandbox config is incomplete', '2026-04-06 09:23:12', '2026-04-06 11:23:12'),
(3, 19, NULL, 'twilio_whatsapp_sandbox', 'whatsapp', 'checkin_confirmation', '+27630228965', 'Hi Admn27 null, your vehicle CA 123456 has been checked in successfully. Booking ref: BV1539A779. Expected return: 2026-04-22T12:53.', 'Outbound', 'Failed', NULL, NULL, 'Twilio sandbox config is incomplete', '2026-04-07 10:53:32', '2026-04-07 12:53:32'),
(4, 24, NULL, 'twilio_whatsapp_sandbox', 'whatsapp', 'checkin_confirmation', '+27630228967', 'Hi Tara Wilson, your vehicle CA 123457 has been checked in successfully. Booking ref: BV799E205B. Expected return: 2026-04-30T10:52.', 'Outbound', 'Failed', NULL, NULL, 'Twilio sandbox config is incomplete', '2026-04-12 08:52:12', '2026-04-12 10:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `message_templates`
--

CREATE TABLE `message_templates` (
  `id` int(11) NOT NULL,
  `template_key` varchar(80) NOT NULL,
  `channel_key` varchar(50) NOT NULL,
  `template_name` varchar(120) NOT NULL,
  `body` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `message_templates`
--

INSERT INTO `message_templates` (`id`, `template_key`, `channel_key`, `template_name`, `body`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'checkin_confirmation', 'whatsapp', 'Check-In Confirmation', 'Hi {{customer_name}}, your vehicle {{vehicle_reg}} has been checked in successfully. Booking ref: {{booking_ref}}. Expected return: {{return_date}}.', 1, '2026-04-02 20:57:03', '2026-04-02 20:57:03'),
(2, 'checkin_confirmation_telegram', 'telegram', 'Check-In Confirmation Telegram', '? Vehicle checked in\nCustomer: {{customer_name}}\nVehicle: {{vehicle_reg}}\nRef: {{booking_ref}}\nReturn: {{return_date}}', 1, '2026-04-02 21:35:28', '2026-04-02 21:35:28'),
(3, 'vehicle_ready_telegram', 'telegram', 'Vehicle Ready Telegram', '? Vehicle ready for collection\nCustomer: {{customer_name}}\nVehicle: {{vehicle_reg}}\nRef: {{booking_ref}}', 1, '2026-04-02 21:35:28', '2026-04-02 21:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `messaging_providers`
--

CREATE TABLE `messaging_providers` (
  `id` int(11) NOT NULL,
  `provider_key` varchar(50) NOT NULL,
  `provider_name` varchar(100) NOT NULL,
  `channel_key` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `config_json` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `messaging_providers`
--

INSERT INTO `messaging_providers` (`id`, `provider_key`, `provider_name`, `channel_key`, `is_active`, `is_default`, `config_json`, `created_at`, `updated_at`) VALUES
(1, 'twilio_whatsapp_sandbox', 'Twilio WhatsApp Sandbox', 'whatsapp', 1, 1, '{\"account_sid\":\"\",\"auth_token\":\"\",\"from\":\"+14155238886\",\"sandbox_mode\":true}', '2026-04-02 20:57:03', '2026-04-02 20:57:03'),
(2, 'telegram_bot', 'Telegram Bot', 'telegram', 1, 1, '{\"bot_token\":\"8672794759:AAGr6rT4L9NzVVO2B0P2D25iw6IqkNGV3xE\",\"default_chat_id\":\"7752819171\",\"admin_chat_id\":\"7752819171\",\"admins\":[{\"chat_id\":7752819171,\"name\":\"Boss Man\",\"email\":\"admin@bethelinternational.co.za\",\"added\":\"2026-04-05 09:22:04\"}],\"admin_chat_ids\":[7752819171]}', '2026-04-02 21:35:28', '2026-04-05 07:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `parking_bays`
--

CREATE TABLE `parking_bays` (
  `id` int(11) NOT NULL,
  `bay_code` varchar(10) NOT NULL,
  `zone` enum('A','B','C','D','VIP') DEFAULT 'A',
  `status` enum('Available','Occupied','Reserved','Blocked') DEFAULT 'Available',
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parking_bays`
--

INSERT INTO `parking_bays` (`id`, `bay_code`, `zone`, `status`, `booking_id`) VALUES
(1, 'A01', 'A', 'Occupied', 19),
(2, 'A02', 'A', 'Available', NULL),
(3, 'A03', 'A', 'Available', NULL),
(4, 'A04', 'A', 'Available', NULL),
(5, 'A05', 'A', 'Available', NULL),
(6, 'A06', 'A', 'Available', NULL),
(7, 'A07', 'A', 'Available', NULL),
(8, 'A08', 'A', 'Available', NULL),
(9, 'A09', 'A', 'Available', NULL),
(10, 'A10', 'A', 'Available', NULL),
(11, 'A11', 'A', 'Available', NULL),
(12, 'A12', 'A', 'Available', NULL),
(13, 'A13', 'A', 'Available', NULL),
(14, 'A14', 'A', 'Available', NULL),
(15, 'A15', 'A', 'Available', NULL),
(16, 'A16', 'A', 'Available', NULL),
(17, 'A17', 'A', 'Available', NULL),
(18, 'A18', 'A', 'Available', NULL),
(19, 'A19', 'A', 'Available', NULL),
(20, 'A20', 'A', 'Available', NULL),
(21, 'B01', 'B', 'Available', NULL),
(22, 'B02', 'B', 'Available', NULL),
(23, 'B03', 'B', 'Available', NULL),
(24, 'B04', 'B', 'Available', NULL),
(25, 'B05', 'B', 'Available', NULL),
(26, 'B06', 'B', 'Available', NULL),
(27, 'B07', 'B', 'Available', NULL),
(28, 'B08', 'B', 'Available', NULL),
(29, 'B09', 'B', 'Available', NULL),
(30, 'B10', 'B', 'Available', NULL),
(31, 'B11', 'B', 'Available', NULL),
(32, 'B12', 'B', 'Available', NULL),
(33, 'B13', 'B', 'Available', NULL),
(34, 'B14', 'B', 'Available', NULL),
(35, 'B15', 'B', 'Available', NULL),
(36, 'B16', 'B', 'Available', NULL),
(37, 'B17', 'B', 'Available', NULL),
(38, 'B18', 'B', 'Available', NULL),
(39, 'B19', 'B', 'Available', NULL),
(40, 'B20', 'B', 'Available', NULL),
(41, 'C01', 'C', 'Available', NULL),
(42, 'C02', 'C', 'Available', NULL),
(43, 'C03', 'C', 'Available', NULL),
(44, 'C04', 'C', 'Available', NULL),
(45, 'C05', 'C', 'Available', NULL),
(46, 'C06', 'C', 'Available', NULL),
(47, 'C07', 'C', 'Available', NULL),
(48, 'C08', 'C', 'Available', NULL),
(49, 'C09', 'C', 'Available', NULL),
(50, 'C10', 'C', 'Available', NULL),
(51, 'C11', 'C', 'Available', NULL),
(52, 'C12', 'C', 'Available', NULL),
(53, 'C13', 'C', 'Available', NULL),
(54, 'C14', 'C', 'Available', NULL),
(55, 'C15', 'C', 'Available', NULL),
(56, 'D01', 'D', 'Available', NULL),
(57, 'D02', 'D', 'Available', NULL),
(58, 'D03', 'D', 'Available', NULL),
(59, 'D04', 'D', 'Available', NULL),
(60, 'D05', 'D', 'Available', NULL),
(61, 'D06', 'D', 'Available', NULL),
(62, 'D07', 'D', 'Available', NULL),
(63, 'D08', 'D', 'Available', NULL),
(64, 'D09', 'D', 'Available', NULL),
(65, 'D10', 'D', 'Available', NULL),
(66, 'D11', 'D', 'Available', NULL),
(67, 'D12', 'D', 'Available', NULL),
(68, 'D13', 'D', 'Available', NULL),
(69, 'D14', 'D', 'Available', NULL),
(70, 'D15', 'D', 'Available', NULL),
(71, 'VIP01', 'VIP', 'Available', NULL),
(72, 'VIP02', 'VIP', 'Available', NULL),
(73, 'VIP03', 'VIP', 'Available', NULL),
(74, 'VIP04', 'VIP', 'Available', NULL),
(75, 'VIP05', 'VIP', 'Available', NULL),
(76, 'VIP06', 'VIP', 'Available', NULL),
(77, 'VIP07', 'VIP', 'Available', NULL),
(78, 'VIP08', 'VIP', 'Available', NULL),
(79, 'VIP09', 'VIP', 'Available', NULL),
(80, 'VIP10', 'VIP', 'Available', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Card','EFT','Voucher') NOT NULL DEFAULT 'Cash',
  `payment_ref` varchar(100) DEFAULT NULL,
  `payment_status` enum('Pending','Paid','Failed','Refunded','Partial') NOT NULL DEFAULT 'Paid',
  `received_by` int(11) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `amount`, `payment_method`, `payment_ref`, `payment_status`, `received_by`, `paid_at`, `created_at`) VALUES
(2, 3, 60.00, 'EFT', 'EFT-DEMO-003A', 'Partial', 1, '2026-04-02 22:25:30', '2026-04-02 20:25:30'),
(3, 4, 540.00, 'EFT', 'EFT-DEMO-004', 'Paid', 1, '2026-04-02 22:25:30', '2026-04-02 20:25:30'),
(4, 5, 840.00, 'Card', 'CARD-DEMO-005', 'Paid', 1, '2026-03-31 22:25:30', '2026-04-02 20:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `can_login` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('Driver','Washer','Dispatcher','Manager','Admin') DEFAULT 'Driver',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `pin_code` varchar(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `full_name`, `email`, `password_hash`, `can_login`, `phone`, `role`, `status`, `pin_code`, `created_at`) VALUES
(1, 'System Admin', 'veshalenr17@gmail.com', '$2y$10$90qa/5625UTiDfhuu/aAjeNoUqipYGHM8c3qum5GnnnX9IyzD6L0a', 1, '0800000000', 'Admin', 'Active', '000000', '2026-04-02 19:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `telegram_sessions`
--

CREATE TABLE `telegram_sessions` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL DEFAULT 'idle',
  `payload_json` longtext DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_json` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `telegram_sessions`
--

INSERT INTO `telegram_sessions` (`id`, `chat_id`, `state`, `payload_json`, `updated_at`, `created_at`, `data_json`) VALUES
(1, '7752819171', 'idle', NULL, '2026-04-07 17:37:21', '2026-04-03 00:03:58', '[]'),
(38, '8704011334', 'idle', NULL, '2026-04-12 09:17:33', '2026-04-06 14:13:26', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reg_number` varchar(15) NOT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `customer_id`, `reg_number`, `make`, `model`, `color`, `notes`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'ND 123 456', 'Toyota', 'Corolla Cross', 'White', 'Primary vehicle', 1, '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(2, 2, 'ND 222 901', 'Volkswagen', 'Polo', 'Silver', 'Compact hatch', 1, '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(3, 3, 'ND 778 410', 'Ford', 'Ranger', 'Blue', 'Bakkie', 1, '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(4, 4, 'ND 555 782', 'BMW', 'X3', 'Black', 'VIP vehicle', 1, '2026-04-02 20:25:30', '2026-04-02 20:25:30'),
(5, 5, 'ND 918 300', 'Hyundai', 'Creta', 'Grey', 'Family SUV', 1, '2026-04-02 20:25:30', '2026-04-02 20:25:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_ref` (`booking_ref`),
  ADD KEY `idx_bookings_customer_id` (`customer_id`),
  ADD KEY `idx_bookings_vehicle_id` (`vehicle_id`),
  ADD KEY `idx_bookings_return_date` (`return_date`),
  ADD KEY `idx_bookings_status` (`status`);

--
-- Indexes for table `booking_images`
--
ALTER TABLE `booking_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_booking_images_booking` (`booking_id`);

--
-- Indexes for table `booking_notes`
--
ALTER TABLE `booking_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_booking_notes_booking` (`booking_id`);

--
-- Indexes for table `booking_services`
--
ALTER TABLE `booking_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking_status_history`
--
ALTER TABLE `booking_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bsh_booking` (`booking_id`),
  ADD KEY `idx_bsh_created` (`created_at`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customers_phone` (`phone`),
  ADD KEY `idx_customers_email` (`email`),
  ADD KEY `idx_customers_name` (`full_name`);

--
-- Indexes for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `message_log`
--
ALTER TABLE `message_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_templates`
--
ALTER TABLE `message_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_key` (`template_key`);

--
-- Indexes for table `messaging_providers`
--
ALTER TABLE `messaging_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `provider_key` (`provider_key`);

--
-- Indexes for table `parking_bays`
--
ALTER TABLE `parking_bays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bay_code` (`bay_code`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_payments_booking` (`booking_id`),
  ADD KEY `idx_payments_paid_at` (`paid_at`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `telegram_sessions`
--
ALTER TABLE `telegram_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_id` (`chat_id`),
  ADD KEY `idx_telegram_sessions_state` (`state`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_vehicle_reg_customer` (`customer_id`,`reg_number`),
  ADD KEY `idx_vehicle_reg` (`reg_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `booking_images`
--
ALTER TABLE `booking_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_notes`
--
ALTER TABLE `booking_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking_services`
--
ALTER TABLE `booking_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_status_history`
--
ALTER TABLE `booking_status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `damage_reports`
--
ALTER TABLE `damage_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_log`
--
ALTER TABLE `message_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message_templates`
--
ALTER TABLE `message_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messaging_providers`
--
ALTER TABLE `messaging_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `parking_bays`
--
ALTER TABLE `parking_bays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `telegram_sessions`
--
ALTER TABLE `telegram_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_bookings_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `booking_images`
--
ALTER TABLE `booking_images`
  ADD CONSTRAINT `fk_booking_images_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_notes`
--
ALTER TABLE `booking_notes`
  ADD CONSTRAINT `fk_booking_notes_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_services`
--
ALTER TABLE `booking_services`
  ADD CONSTRAINT `booking_services_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_status_history`
--
ALTER TABLE `booking_status_history`
  ADD CONSTRAINT `fk_bsh_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `damage_reports`
--
ALTER TABLE `damage_reports`
  ADD CONSTRAINT `damage_reports_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `parking_bays`
--
ALTER TABLE `parking_bays`
  ADD CONSTRAINT `parking_bays_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicles_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
