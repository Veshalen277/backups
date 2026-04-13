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
-- Database: `bethelin_dir`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `depth` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(60) DEFAULT NULL,
  `sort_order` smallint(6) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `depth`, `name`, `slug`, `description`, `icon`, `sort_order`, `is_active`, `created_at`) VALUES
(1, NULL, 0, 'Restaurants', 'restaurants', 'Find the best local dining spots.', 'utensils', 0, 1, '2026-03-14 09:42:31'),
(2, NULL, 0, 'Technology', 'technology', 'Software developers and IT services.', 'laptop-code', 0, 1, '2026-03-14 09:42:31'),
(3, NULL, 0, 'Accommodation', 'accommodation', 'Hotels, lodges, and guest houses.', 'bed', 0, 1, '2026-03-14 09:42:31'),
(4, NULL, 0, 'Retail', 'retail', 'Local shops and boutiques.', 'shopping-bag', 0, 1, '2026-03-14 09:42:31'),
(5, NULL, 0, 'Health & Wellness', 'health-wellness', 'Gyms, spas, and medical practitioners.', 'heartbeat', 0, 1, '2026-03-14 09:42:43'),
(6, NULL, 0, 'Professional Services', 'professional-services', 'Legal, accounting, and consulting.', 'briefcase', 0, 1, '2026-03-14 09:42:43'),
(7, NULL, 0, 'Events & Entertainment', 'events-entertainment', 'Venues, planners, and local attractions.', 'calendar-star', 0, 1, '2026-03-14 09:42:43'),
(8, NULL, 0, 'Automotive', 'automotive', 'Repairs, sales, and transport services.', 'car', 0, 1, '2026-03-14 09:42:43'),
(9, NULL, 0, 'Education', 'education', 'Schools, tutoring, and training centers.', 'graduation-cap', 0, 1, '2026-03-14 09:42:43'),
(10, NULL, 0, 'Logistics & Transport', 'logistics-transport', 'Shipping, courier, and freight services.', 'truck', 0, 1, '2026-03-14 09:59:00'),
(11, NULL, 0, 'Beauty & Hair', 'beauty-hair', 'Salons, barbers, and skincare clinics.', 'scissors', 0, 1, '2026-03-14 09:59:00'),
(12, NULL, 0, 'Home & Garden', 'home-garden', 'Landscaping, interior design, and DIY.', 'home', 0, 1, '2026-03-14 09:59:00'),
(13, NULL, 0, 'Medical & Health', 'medical-health', 'Doctors, pharmacies, and clinics.', 'stethascope', 0, 1, '2026-03-14 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_definitions`
--

CREATE TABLE `custom_field_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `field_key` varchar(60) NOT NULL,
  `field_label` varchar(100) NOT NULL,
  `field_type` enum('text','number','select','checkbox','url','date') NOT NULL DEFAULT 'text',
  `field_options` text DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_field_definitions`
--

INSERT INTO `custom_field_definitions` (`id`, `category_id`, `field_key`, `field_label`, `field_type`, `field_options`, `is_required`, `sort_order`) VALUES
(1, 2, 'years_experience', 'Years of Experience', 'number', NULL, 1, 1),
(2, 3, 'check_in_time', 'Standard Check-in Time', 'text', NULL, 0, 1),
(3, 3, 'pool_available', 'Swimming Pool', 'checkbox', NULL, 0, 2),
(4, 8, 'emergency_service', '24/7 Emergency Support', 'checkbox', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tier_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `category_id` int(10) UNSIGNED NOT NULL,
  `listing_type` enum('business','freelancer','event','product') NOT NULL DEFAULT 'business',
  `status` enum('draft','pending','active','rejected','suspended') NOT NULL DEFAULT 'draft',
  `slug` varchar(180) NOT NULL,
  `name` varchar(160) NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `email` varchar(160) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address_line1` varchar(160) DEFAULT NULL,
  `address_line2` varchar(160) DEFAULT NULL,
  `suburb` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `province` varchar(80) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(40) DEFAULT NULL,
  `hours_mon` varchar(60) DEFAULT NULL,
  `hours_tue` varchar(60) DEFAULT NULL,
  `hours_wed` varchar(60) DEFAULT NULL,
  `hours_thu` varchar(60) DEFAULT NULL,
  `hours_fri` varchar(60) DEFAULT NULL,
  `hours_sat` varchar(60) DEFAULT NULL,
  `hours_sun` varchar(60) DEFAULT NULL,
  `avg_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `review_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `owner_user_id`, `tier_id`, `category_id`, `listing_type`, `status`, `slug`, `name`, `tagline`, `description`, `logo`, `banner`, `email`, `phone`, `website`, `address_line1`, `address_line2`, `suburb`, `city`, `province`, `postal_code`, `lat`, `lng`, `facebook`, `instagram`, `twitter`, `linkedin`, `whatsapp`, `hours_mon`, `hours_tue`, `hours_wed`, `hours_thu`, `hours_fri`, `hours_sat`, `hours_sun`, `avg_rating`, `review_count`, `view_count`, `is_verified`, `approved_by`, `approved_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, 'business', 'active', 'the-smoking-coffee', 'The Smoking Coffee', 'Premium beans, local vibes', 'The best coffee shop in the heart of the city.', 'https://via.placeholder.com/200x200.png?text=Logo', 'https://via.placeholder.com/1200x400.png?text=Banner', 'hello@smokingcoffee.com', '+27 31 123 4567', 'https://smokingcoffee.com', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:42:31', '2026-03-15 11:29:24'),
(2, 3, 4, 3, 'business', 'active', 'laletsa-lodge', 'Laletsa Lodge', 'Your home away from home', 'Luxury accommodation featuring world-class service.', 'https://via.placeholder.com/200x200.png?text=Lodge+Logo', 'https://via.placeholder.com/1200x400.png?text=Lodge+Banner', 'info@laletsa.co.za', '+27 32 987 6543', 'https://laletsa.co.za', NULL, NULL, NULL, 'Tongaat', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:42:31', '2026-03-15 10:42:13'),
(3, 2, 2, 2, 'freelancer', 'active', 'dev-pro-services', 'DevPro Solutions', 'Expert WordPress Development', 'Full-stack development specializing in modern web apps.', 'https://via.placeholder.com/200x200.png?text=Dev+Logo', NULL, 'dev@example.com', '+27 31 555 0123', 'https://devpro.co.za', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:42:31', '2026-03-15 10:42:38'),
(4, 2, 4, 2, 'business', 'active', 'wtt-zap-portal', 'WTT Zap Solutions', 'Business Intelligence & Reporting', 'Centralized employee portal for activity aggregation and reporting.', 'https://via.placeholder.com/200x200.png?text=WTT+Logo', 'https://via.placeholder.com/1200x400.png?text=WTT+Banner', 'support@wttzap.co.za', '+27 31 100 2000', 'https://wttzap.co.za', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 3, 0, NULL, NULL, NULL, '2026-03-14 09:42:54', '2026-03-14 13:23:49'),
(5, 3, 3, 5, 'business', 'active', 'umoya-league-hq', 'Umoya League', 'Augmented Reality Card Gaming', 'Developing the future of interactive tabletop gaming through AR.', 'https://via.placeholder.com/200x200.png?text=Umoya+Logo', 'https://via.placeholder.com/1200x400.png?text=Umoya+Banner', 'play@umoyaleague.co.za', '+27 31 300 4000', 'https://umoyaleague.co.za', NULL, NULL, NULL, 'Tongaat', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 4, 0, NULL, NULL, NULL, '2026-03-14 09:42:54', '2026-03-15 10:42:31'),
(6, 2, 2, 8, 'business', 'active', 'kzn-auto-repairs', 'KZN Precision Auto', 'Reliable vehicle maintenance', 'Specializing in major and minor services for all makes.', 'https://via.placeholder.com/200x200.png?text=Auto+Logo', NULL, 'service@kznauto.co.za', '+27 32 500 6000', NULL, NULL, NULL, NULL, 'Tongaat', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:42:54', '2026-03-14 10:25:40'),
(7, 3, 4, 7, 'business', 'active', 'durban-event-space', 'The Durban Pavilion', 'Premium Event Hosting', 'The perfect venue for weddings, corporate functions, and parties.', 'https://via.placeholder.com/200x200.png?text=Venue+Logo', 'https://via.placeholder.com/1200x400.png?text=Venue+Banner', 'events@pavilion.co.za', '+27 31 700 8000', 'https://durbanpavilion.co.za', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:42:54', '2026-03-14 13:43:14'),
(8, 2, 1, 6, 'business', 'active', 'coastal-legal-associates', 'Coastal Legal', 'Your legal partners', 'Comprehensive legal services for small businesses and individuals.', 'https://via.placeholder.com/200x200.png?text=Legal+Logo', NULL, 'legal@coastal.co.za', '+27 31 900 1000', NULL, NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, '2026-03-14 09:42:54', '2026-03-14 09:42:54'),
(9, 4, 4, 9, 'business', 'active', 'grindrod-logistics', 'Grindrod Port Services', 'Leading JSE-listed logistics', 'Specialized terminal and logistics solutions for African trade.', 'https://via.placeholder.com/200/000000/FFFFFF?text=Grindrod', 'https://via.placeholder.com/1200x400/333/fff?text=Port+Operations', 'info@grindrod.com', '+27 31 304 1451', 'https://grindrod.com', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 3, 1, NULL, NULL, NULL, '2026-03-14 09:59:00', '2026-03-15 11:29:16'),
(10, 5, 2, 10, 'business', 'active', 'tongaat-trim-barbers', 'Tongaat Trim', 'The cleanest fades in KZN', 'Modern barbershop specializing in classic cuts and beard grooming.', 'https://via.placeholder.com/200/000000/FFFFFF?text=Barber', NULL, 'cuts@tongaattrim.co.za', '+27 32 944 1000', NULL, NULL, NULL, NULL, 'Tongaat', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, 1, NULL, NULL, NULL, '2026-03-14 09:59:00', '2026-03-14 09:59:00'),
(11, 2, 3, 11, 'business', 'active', 'coastal-landscaping', 'Coastal Greens', 'Expert Garden Design', 'Transforming outdoor spaces with indigenous South African flora.', 'https://via.placeholder.com/200/000000/FFFFFF?text=Garden', 'https://via.placeholder.com/1200x400/228B22/fff?text=Garden+Showcase', 'hello@coastalgreens.co.za', '+27 31 888 2222', 'https://coastalgreens.co.za', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 2, 0, NULL, NULL, NULL, '2026-03-14 09:59:00', '2026-03-14 10:34:35'),
(12, 3, 4, 5, 'business', 'active', 'durban-yoga-studio', 'Namaste Durban', 'Find your inner peace', 'Vinyasa and Hatha yoga classes overlooking the ocean.', 'https://via.placeholder.com/200/000000/FFFFFF?text=Yoga', 'https://via.placeholder.com/1200x400/FFB6C1/333?text=Yoga+Beachfront', 'zen@namastedurban.co.za', '+27 31 500 5000', 'https://namastedurban.co.za', NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 3, 1, NULL, NULL, NULL, '2026-03-14 09:59:00', '2026-03-15 10:42:05'),
(13, 4, 3, 6, 'freelancer', 'active', 'desmond-seo-audits', 'Desmond SEO & UX', 'Rank higher, convert better', 'Specialized technical SEO audits and website accessibility improvements.', 'https://via.placeholder.com/200/000000/FFFFFF?text=SEO', NULL, 'desmond@webpro.co.za', '+27 31 200 3000', NULL, NULL, NULL, NULL, 'Durban', 'KwaZulu-Natal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 3, 1, NULL, NULL, NULL, '2026-03-14 09:59:00', '2026-03-18 11:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `listing_custom_fields`
--

CREATE TABLE `listing_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `field_def_id` int(10) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listing_images`
--

CREATE TABLE `listing_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `caption` varchar(160) DEFAULT NULL,
  `sort_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listing_images`
--

INSERT INTO `listing_images` (`id`, `listing_id`, `filename`, `caption`, `sort_order`, `created_at`) VALUES
(1, 1, 'https://via.placeholder.com/800x600.png?text=Coffee+Interior', 'Cozy Seating Area', 1, '2026-03-14 09:42:31'),
(2, 1, 'https://via.placeholder.com/800x600.png?text=Latte+Art', 'Our Signature Latte', 2, '2026-03-14 09:42:31'),
(3, 2, 'https://via.placeholder.com/800x600.png?text=Lodge+Room', 'Executive Suite', 1, '2026-03-14 09:42:31'),
(4, 2, 'https://via.placeholder.com/800x600.png?text=Lodge+Pool', 'Swimming Pool Area', 2, '2026-03-14 09:42:31'),
(5, 6, 'https://via.placeholder.com/800x600/333/fff?text=Shipping+Containers', 'Port Storage', 1, '2026-03-14 09:59:00'),
(6, 6, 'https://via.placeholder.com/800x600/444/fff?text=Cargo+Trucks', 'Fleet Management', 2, '2026-03-14 09:59:00'),
(7, 9, 'https://via.placeholder.com/800x600/FFB6C1/333?text=Yoga+Mat', 'Morning Session', 1, '2026-03-14 09:59:00'),
(8, 10, 'https://via.placeholder.com/800x600/000/fff?text=SEO+Dashboard', 'Detailed Reporting', 1, '2026-03-14 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `listing_tags`
--

CREATE TABLE `listing_tags` (
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listing_tags`
--

INSERT INTO `listing_tags` (`listing_id`, `tag_id`) VALUES
(1, 1),
(2, 1),
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `listing_tiers`
--

CREATE TABLE `listing_tiers` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `tier_key` varchar(20) NOT NULL,
  `tier_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT 0,
  `max_gallery` tinyint(4) NOT NULL DEFAULT 0,
  `has_banner` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_sponsored` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listing_tiers`
--

INSERT INTO `listing_tiers` (`id`, `tier_key`, `tier_name`, `description`, `sort_order`, `max_gallery`, `has_banner`, `is_featured`, `is_sponsored`) VALUES
(1, 'free', 'Free', 'Basic listing', 0, 0, 0, 0, 0),
(2, 'featured', 'Featured', 'Highlighted with priority placement', 1, 5, 0, 1, 0),
(3, 'premium', 'Premium', 'Gallery, banner, custom fields', 2, 20, 1, 1, 0),
(4, 'sponsored', 'Sponsored', 'Top placement in category and homepage', 3, 20, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `listing_views`
--

CREATE TABLE `listing_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `ip_hash` varchar(64) DEFAULT NULL,
  `viewed_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `listing_views`
--

INSERT INTO `listing_views` (`id`, `listing_id`, `ip_hash`, `viewed_at`) VALUES
(1, 1, '66efff4c945d3c3b87fc271b47d456db', '2026-03-14 09:43:14'),
(2, 1, '8a120ff3e2c86713f4d346d20f763ee7', '2026-03-14 09:43:14'),
(3, 2, 'cc9d4028d80b7d9c2242cf5fc8cb25f2', '2026-03-14 09:43:14'),
(4, 3, 'da07c7660bbda839a12c23a45e267f5f', '2026-03-14 09:43:14'),
(5, 4, '2e9e9f7c017ee2a1645a236d182fb28c', '2026-03-14 09:43:14'),
(6, 5, '428e996031cc52e6948e992887dd9330', '2026-03-14 09:43:14'),
(7, 3, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:43:59'),
(8, 4, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:44:07'),
(9, 2, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:44:16'),
(10, 5, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:47:05'),
(11, 1, '66efff4c945d3c3b87fc271b47d456db', '2026-03-14 09:59:00'),
(12, 2, '3b0272341a4760a5a1f8ad4ddc98f766', '2026-03-14 09:59:00'),
(13, 3, '655b94b8f66ce0f8a6bfad2f06ddece1', '2026-03-14 09:59:00'),
(14, 4, '0564b722bc8d03ba288bb91c7e0e21a1', '2026-03-14 09:59:00'),
(15, 5, 'f5bd816f10010c236cc13ca397e5959b', '2026-03-14 09:59:00'),
(16, 6, '55a89fe174d6fd8673533b1bb46904af', '2026-03-14 09:59:00'),
(17, 7, 'fbb47297227c88edaa4e44de48262745', '2026-03-14 09:59:00'),
(18, 8, '8281aea965e2956278767ec62286756b', '2026-03-14 09:59:00'),
(19, 9, 'b58ce42097390b6e363f53863cf2e1e1', '2026-03-14 09:59:00'),
(20, 10, '1bac027cf67efcc4d10125724221fc48', '2026-03-14 09:59:00'),
(21, 11, 'ee519fb02205bf17b03ef00f6daf6c6e', '2026-03-14 09:59:00'),
(22, 12, '8349a7c319841935b4588f84743fd542', '2026-03-14 09:59:00'),
(23, 13, 'a1da2d7f486736ee2dd05da00409f14e', '2026-03-14 09:59:00'),
(26, 13, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:59:25'),
(27, 6, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:59:35'),
(28, 11, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 09:59:42'),
(29, 6, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:25:40'),
(30, 12, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:28:52'),
(31, 4, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:29:40'),
(32, 7, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:30:08'),
(33, 5, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:34:25'),
(34, 11, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 10:34:35'),
(35, 9, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 13:13:08'),
(36, 1, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 13:13:14'),
(37, 4, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 13:23:49'),
(38, 7, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 13:43:14'),
(39, 12, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 14:14:44'),
(40, 5, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 14:14:52'),
(41, 13, '08f64d464185e8193efdef936255caa363f03dc79db33aaec4e9b3b33053b606', '2026-03-14 14:15:09'),
(42, 12, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 10:42:05'),
(43, 2, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 10:42:13'),
(44, 5, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 10:42:31'),
(45, 3, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 10:42:38'),
(46, 9, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 10:42:58'),
(47, 9, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 11:29:16'),
(48, 1, 'cc51ae93b374ee231318865b8125c19178015f32cd4f382209ed2d3a6bc64ece', '2026-03-15 11:29:24'),
(49, 13, 'eab4c1d0bedfe1eb6147409f03ea36ad7f13c87e01c737fa74b53217d5850079', '2026-03-18 11:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(160) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 5,
  `title` varchar(160) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `listing_id`, `user_id`, `rating`, `title`, `body`, `status`, `created_at`) VALUES
(1, 1, 1, 5, 'Great Coffee!', 'Loved the atmosphere and the beans were fresh.', 'approved', '2026-03-14 09:42:31'),
(2, 2, 2, 4, 'Comfortable stay', 'The rooms were clean and the staff were very helpful.', 'approved', '2026-03-14 09:42:31'),
(3, 3, 1, 5, 'Highly Recommended', 'The AR mechanics are incredible and very smooth.', 'approved', '2026-03-14 09:43:14'),
(4, 4, 2, 4, 'Fast Service', 'Got my car back the same day. Very professional.', 'approved', '2026-03-14 09:43:14'),
(5, 5, 3, 5, 'Perfect Venue', 'Hosted our March into Madness campaign event here, great vibe.', 'approved', '2026-03-14 09:43:14'),
(6, 6, 5, 5, 'Solid investment', 'Reliable operations and great communication.', 'approved', '2026-03-14 09:59:00'),
(7, 7, 4, 4, 'Great haircut', 'A bit of a wait but the fade was perfect.', 'approved', '2026-03-14 09:59:00'),
(8, 9, 6, 5, 'Relaxing', 'Best way to start my Monday morning in Durban.', 'approved', '2026-03-14 09:59:00'),
(9, 10, 2, 5, 'Fixed my SEO', 'Helped clear up our blocking issues quickly.', 'approved', '2026-03-14 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `role_key` varchar(30) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `hierarchy_level` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_key`, `role_name`, `hierarchy_level`) VALUES
(1, 'guest', 'Guest', 0),
(2, 'user', 'User', 1),
(3, 'owner', 'Business Owner', 2),
(4, 'editor', 'Editor', 3),
(5, 'super_admin', 'Super Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `saved_listings`
--

CREATE TABLE `saved_listings` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `listing_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`) VALUES
(1, 'WiFi Free', 'wifi-free'),
(2, 'Pet Friendly', 'pet-friendly'),
(3, 'Secure Parking', 'secure-parking'),
(4, 'WordPress', 'wordpress');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL DEFAULT '',
  `full_name` varchar(160) NOT NULL,
  `email` varchar(160) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'active',
  `email_verified_at` datetime DEFAULT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `full_name`, `email`, `username`, `password_hash`, `phone`, `avatar`, `status`, `email_verified_at`, `must_change_password`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 5, 'Admin', 'User', 'System Administrator', 'admin@bethelin.co.za', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:42:31', '2026-03-14 09:42:31'),
(2, 3, 'John', 'Doe', 'John Doe', 'john@example.com', 'johndoe', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:42:31', '2026-03-14 09:42:31'),
(3, 3, 'Sarah', 'Smith', 'Sarah Smith', 'sarah@example.com', 'sarahsmith', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:42:31', '2026-03-14 09:42:31'),
(4, 5, 'Veshalen', 'Ramsamy', 'Veshalen Ramsamy', 'veshalenr17@gmail.com', 'admin21', '$2y$10$NVkfEup.04HO.eP729W28OlENc5BlQ7iIkYGa9c6umnohGa9jBN4.', NULL, NULL, 'active', NULL, 0, '2026-03-15 10:42:54', '2026-03-14 09:48:00', '2026-03-15 11:09:50'),
(5, 3, 'Desmond', 'Designer', 'Desmond Designer', 'desmond@seoaudit.co.za', 'desmond_seo', '$2y$10$hash', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:59:00', '2026-03-14 09:59:00'),
(6, 2, 'Thabo', 'Mkhize', 'Thabo Mkhize', 'thabo@example.com', 'thabom', '$2y$10$hash', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:59:00', '2026-03-14 09:59:00'),
(7, 2, 'Priya', 'Naidoo', 'Priya Naidoo', 'priya@example.com', 'priyan', '$2y$10$hash', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:59:00', '2026-03-14 09:59:00'),
(8, 2, 'Kevin', 'Smit', 'Kevin Smit', 'kevin@example.com', 'kevins', '$2y$10$hash', NULL, NULL, 'active', NULL, 0, NULL, '2026-03-14 09:59:00', '2026-03-14 09:59:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_slug` (`slug`),
  ADD KEY `idx_parent` (`parent_id`);

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing` (`listing_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `custom_field_definitions`
--
ALTER TABLE `custom_field_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category_id`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_tier` (`tier_id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_owner` (`owner_user_id`);

--
-- Indexes for table `listing_custom_fields`
--
ALTER TABLE `listing_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_listing_field` (`listing_id`,`field_def_id`),
  ADD KEY `fk_lcf_def` (`field_def_id`);

--
-- Indexes for table `listing_images`
--
ALTER TABLE `listing_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing` (`listing_id`);

--
-- Indexes for table `listing_tags`
--
ALTER TABLE `listing_tags`
  ADD PRIMARY KEY (`listing_id`,`tag_id`),
  ADD KEY `fk_lt_tag` (`tag_id`);

--
-- Indexes for table `listing_tiers`
--
ALTER TABLE `listing_tiers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tier_key` (`tier_key`);

--
-- Indexes for table `listing_views`
--
ALTER TABLE `listing_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing` (`listing_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_token` (`token`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing` (`listing_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_role_key` (`role_key`);

--
-- Indexes for table `saved_listings`
--
ALTER TABLE `saved_listings`
  ADD PRIMARY KEY (`user_id`,`listing_id`),
  ADD KEY `fk_sl_listing` (`listing_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`),
  ADD UNIQUE KEY `uq_username` (`username`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_definitions`
--
ALTER TABLE `custom_field_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `listing_custom_fields`
--
ALTER TABLE `listing_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listing_images`
--
ALTER TABLE `listing_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `listing_tiers`
--
ALTER TABLE `listing_tiers`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `listing_views`
--
ALTER TABLE `listing_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_cat_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `fk_claim_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_claim_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_definitions`
--
ALTER TABLE `custom_field_definitions`
  ADD CONSTRAINT `fk_cfd_cat` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `fk_listing_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_listing_owner` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_listing_tier` FOREIGN KEY (`tier_id`) REFERENCES `listing_tiers` (`id`);

--
-- Constraints for table `listing_custom_fields`
--
ALTER TABLE `listing_custom_fields`
  ADD CONSTRAINT `fk_lcf_def` FOREIGN KEY (`field_def_id`) REFERENCES `custom_field_definitions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lcf_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `listing_images`
--
ALTER TABLE `listing_images`
  ADD CONSTRAINT `fk_img_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `listing_tags`
--
ALTER TABLE `listing_tags`
  ADD CONSTRAINT `fk_lt_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lt_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `listing_views`
--
ALTER TABLE `listing_views`
  ADD CONSTRAINT `fk_lv_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_rev_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rev_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_listings`
--
ALTER TABLE `saved_listings`
  ADD CONSTRAINT `fk_sl_listing` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sl_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
