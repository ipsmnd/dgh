-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 07:30 PM
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
-- Database: `girls_hostel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `category` enum('electrical','plumbing','cleaning','furniture','security','other') DEFAULT 'other',
  `status` enum('pending','in_progress','resolved') DEFAULT 'pending',
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `assigned_to` int(11) DEFAULT NULL COMMENT 'Staff ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `resolved_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `student_id`, `title`, `description`, `category`, `status`, `priority`, `assigned_to`, `created_at`, `updated_at`, `resolved_at`) VALUES
(1, 1, 'AC Not Working', 'The air conditioner in room 08A is not cooling properly. It makes strange noise when turned on.', 'electrical', 'resolved', 'high', 6, '2025-11-10 04:00:00', '2025-11-18 00:39:35', '2025-11-11 08:50:00'),
(2, 3, 'Leaking Tap', 'The bathroom tap in room 07A is leaking continuously, causing water wastage.', 'plumbing', 'in_progress', 'medium', 7, '2025-11-12 05:45:00', '2025-11-18 00:39:35', NULL),
(3, 5, 'Broken Study Table', 'One leg of the study table in room 09A is broken and needs immediate repair.', 'furniture', 'pending', 'medium', NULL, '2025-11-13 11:15:00', '2025-11-18 00:39:35', NULL),
(4, 7, 'WiFi Connectivity Issue', 'Poor WiFi signal in room 11A, especially in the corner beds. Need router adjustment.', 'other', 'resolved', 'low', 6, '2025-11-14 04:50:00', '2025-11-18 00:39:35', '2025-11-15 06:00:00'),
(5, 2, 'Room Cleaning Required', 'Room 08A needs deep cleaning. Dust accumulation in corners and under beds.', 'cleaning', 'in_progress', 'low', 3, '2025-11-15 09:00:00', '2025-11-18 00:39:35', NULL),
(6, 9, 'Security Concern', 'Street light near hostel back gate is not working, creating security concerns at night.', 'security', 'pending', 'high', 4, '2025-11-16 13:50:00', '2025-11-18 00:39:35', NULL),
(7, 4, 'Power Socket Not Working', 'The power socket near bed 2 in room 09A is not working. Cannot charge devices.', 'electrical', 'resolved', 'medium', 6, '2025-11-17 03:15:00', '2025-11-18 00:39:35', '2025-11-17 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mess_menu`
--

CREATE TABLE `mess_menu` (
  `id` int(11) NOT NULL,
  `day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') DEFAULT NULL,
  `breakfast` text DEFAULT NULL,
  `lunch` text DEFAULT NULL,
  `dinner` text DEFAULT NULL,
  `special_notes` text DEFAULT NULL,
  `week_start_date` date DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mess_menu`
--

INSERT INTO `mess_menu` (`id`, `day`, `breakfast`, `lunch`, `dinner`, `special_notes`, `week_start_date`, `is_current`, `created_by`, `updated_at`, `created_at`) VALUES
(1, 'monday', 'Poha, Bread Butter, Tea, Milk', 'Dal Makhani, Jeera Rice, Roti, Mix Veg, Salad, Pickle', 'Chole Masala, Rice, Roti, Raita, Salad', 'Special dessert: Kheer', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(2, 'tuesday', 'Sandwich, Cornflakes, Tea, Coffee', 'Rajma, Rice, Roti, Aloo Gobhi, Salad, Curd', 'Paneer Butter Masala, Rice, Roti, Salad, Papad', 'Evening snack: Samosa', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(3, 'wednesday', 'Idli Sambhar, Tea, Milk', 'Chana Masala, Rice, Roti, Bhindi, Salad, Pickle', 'Egg Curry, Rice, Roti, Salad', 'Non-veg day', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(4, 'thursday', 'Paratha with Curd, Tea, Coffee', 'Dal Tadka, Rice, Roti, Baingan Bharta, Salad', 'Kadhi Pakoda, Rice, Roti, Salad, Pickle', 'Special: Gulab Jamun', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(5, 'friday', 'Aloo Paratha, Tea, Milk', 'Mix Dal, Rice, Roti, Aloo Matar, Salad, Curd', 'Fish Curry, Rice, Roti, Salad', 'Non-veg day, Special fish preparation', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(6, 'saturday', 'Dosa, Chutney, Tea, Coffee', 'Vegetable Biryani, Raita, Papad, Salad', 'Matar Paneer, Rice, Roti, Salad', 'Weekend special menu', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(7, 'sunday', 'Puri Sabzi, Tea, Milk', 'Chicken Curry, Rice, Roti, Salad', 'Pav Bhaji, Salad, Buttermilk', 'Non-veg day, Special chicken preparation', '2025-11-17', 1, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `mess_menu_templates`
--

CREATE TABLE `mess_menu_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lunch_items` text NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT 'general',
  `created_by` int(11) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mess_menu_templates`
--

INSERT INTO `mess_menu_templates` (`id`, `name`, `lunch_items`, `description`, `category`, `created_by`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'repit', 'h', '', 'special', 10, 1, '2025-11-18 07:59:45', '2025-11-18 07:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('rent','mess','security','maintenance','fine','other') DEFAULT 'rent',
  `payment_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('paid','pending','overdue','cancelled') DEFAULT 'pending',
  `description` text DEFAULT NULL,
  `receipt_number` varchar(50) DEFAULT NULL,
  `payment_method` enum('cash','bank_transfer','online','cheque') DEFAULT 'cash',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `student_id`, `amount`, `payment_type`, `payment_date`, `due_date`, `status`, `description`, `receipt_number`, `payment_method`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 6000.00, 'rent', '2025-11-05', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT001', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(2, 1, 3500.00, 'mess', '2025-11-05', '2025-11-10', 'paid', 'Monthly mess charges - November 2025', 'RCPT002', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(3, 2, 6000.00, 'rent', '2025-11-06', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT003', 'bank_transfer', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(4, 2, 3500.00, 'mess', '2025-11-06', '2025-11-10', 'paid', 'Monthly mess charges - November 2025', 'RCPT004', 'bank_transfer', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(5, 3, 8000.00, 'rent', '2025-11-07', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT005', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(6, 3, 3500.00, 'mess', '2025-11-07', '2025-11-10', 'paid', 'Monthly mess charges - November 2025', 'RCPT006', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(7, 4, 7000.00, 'rent', '2025-11-08', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT007', 'cash', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(8, 5, 7000.00, 'rent', '2025-11-12', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT008', 'cash', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(9, 6, 7000.00, 'rent', NULL, '2025-11-10', 'pending', 'Monthly hostel rent - November 2025', NULL, 'cash', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(10, 7, 8000.00, 'rent', NULL, '2025-11-10', 'pending', 'Monthly hostel rent - November 2025', NULL, 'cash', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(11, 8, 8000.00, 'rent', '2025-11-09', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT009', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(12, 9, 5000.00, 'rent', '2025-11-10', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT010', 'bank_transfer', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(13, 10, 5000.00, 'rent', '2025-11-21', '2025-11-10', 'overdue', 'Monthly hostel rent - November 2025', NULL, 'cash', NULL, '2025-11-18 00:39:35', '2025-11-21 08:04:10'),
(14, 11, 5000.00, 'rent', '2025-11-11', '2025-11-10', 'paid', 'Monthly hostel rent - November 2025', 'RCPT011', 'online', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(15, 15, 8000.00, 'rent', NULL, '2025-11-25', 'pending', 'Monthly hostel rent - November 2025', NULL, 'cash', NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `floor` int(11) NOT NULL,
  `capacity` int(11) DEFAULT 4,
  `occupied` int(11) DEFAULT 0,
  `type` enum('single','double','triple','quad','dormitory') DEFAULT 'quad',
  `rent` decimal(10,2) NOT NULL,
  `facilities` text DEFAULT NULL COMMENT 'JSON array of facilities',
  `status` enum('available','occupied','maintenance','cleaning') DEFAULT 'available',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `floor`, `capacity`, `occupied`, `type`, `rent`, `facilities`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(3, '10A', 1, 3, 0, 'triple', 8500.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\"]', 'available', 'Corner room with extra space', '2025-11-17 21:32:30', '2025-11-21 05:09:56'),
(4, '09A', 1, 3, 0, 'triple', 8500.00, '[\"Attached Bathroom\", \"WiFi\"]', 'available', 'Near staircase', '2025-11-17 21:44:55', '2025-11-21 05:09:33'),
(5, '08A', 1, 3, 2, 'triple', 8500.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Balcony\"]', 'occupied', 'Recently renovated', '2025-11-17 21:45:31', '2025-11-21 05:09:15'),
(6, '07A', 1, 1, 1, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Study Table\"]', 'occupied', 'Premium single room', '2025-11-17 21:45:59', '2025-11-21 05:08:52'),
(7, '06A', 1, 2, 0, 'double', 9500.00, '[\"Attached Bathroom\", \"WiFi\", \"Cupboard\"]', 'available', 'Spacious double room', '2025-11-17 21:46:51', '2025-11-21 05:08:40'),
(8, '05A', 1, 1, 1, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Study Table\"]', 'available', 'Quiet room', '2025-11-17 22:46:25', '2025-11-21 05:08:27'),
(9, '04A', 1, 2, 2, 'double', 9500.00, '[\"Attached Bathroom\", \"WiFi\"]', 'occupied', 'Fully occupied', '2025-11-17 22:47:15', '2025-11-21 05:08:02'),
(10, '03A', 1, 2, 1, 'double', 9500.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\"]', 'occupied', 'One bed available', '2025-11-17 22:48:32', '2025-11-21 05:06:43'),
(11, '02A', 1, 1, 1, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Balcony\"]', 'occupied', 'Luxury single room', '2025-11-17 22:48:58', '2025-11-21 05:06:06'),
(12, '01A', 1, 1, 1, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\"]', 'occupied', 'Standard single room', '2025-11-17 22:49:15', '2025-11-21 05:05:34'),
(13, '11A', 1, 4, 3, 'quad', 7500.00, '[\"WiFi\", \"Common Bathroom\"]', 'occupied', 'Economy quad sharing', '2025-11-17 22:52:33', '2025-11-21 05:10:12'),
(14, '12A', 1, 3, 0, 'triple', 8500.00, '[\"Attached Bathroom\", \"WiFi\"]', 'maintenance', 'Under maintenance until next week', '2025-11-17 22:53:02', '2025-11-21 05:10:36'),
(15, '01B', 2, 1, 0, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Balcony\"]', 'occupied', 'Newly furnished', '2025-11-17 22:53:02', '2025-11-21 05:10:57'),
(16, '02B', 2, 1, 0, 'single', 11000.00, '[\"AC\", \"Attached Bathroom\", \"WiFi\", \"Study Table\"]', 'occupied', 'Quiet corner room', '2025-11-17 22:53:02', '2025-11-21 05:11:10'),
(17, '03B', 2, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-20 18:14:31', '2025-11-21 05:11:32'),
(18, '01C', 3, 4, 0, 'quad', 7500.00, NULL, 'maintenance', NULL, '2025-11-20 18:16:22', '2025-11-21 05:12:28'),
(19, '02C', 3, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-20 18:16:50', '2025-11-21 05:12:35'),
(20, '03C', 3, 4, 0, 'quad', 7500.00, NULL, 'occupied', NULL, '2025-11-20 18:17:14', '2025-11-21 05:12:41'),
(21, '04C', 3, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-20 18:17:36', '2025-11-21 05:12:19'),
(22, '05C', 3, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-20 18:22:41', '2025-11-21 05:14:03'),
(23, '06C', 3, 3, 0, 'triple', 7500.00, NULL, 'available', NULL, '2025-11-20 18:22:59', '2025-11-21 05:14:09'),
(24, '07C', 3, 2, 0, 'triple', 7500.00, NULL, 'available', NULL, '2025-11-21 04:42:59', '2025-11-21 05:14:15'),
(25, '08C', 3, 1, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 04:43:41', '2025-11-21 05:14:28'),
(26, '09C', 3, 2, 0, 'double', 9500.00, NULL, 'occupied', NULL, '2025-11-21 04:44:07', '2025-11-21 05:14:35'),
(27, '10C', 3, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 04:47:46', '2025-11-21 05:14:43'),
(28, '11C', 3, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 04:48:18', '2025-11-21 05:15:33'),
(29, '12C', 3, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 04:48:37', '2025-11-21 05:15:44'),
(30, '04B', 2, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:17:23', '2025-11-21 05:17:23'),
(31, '05B', 2, 2, 2, 'double', 9500.00, NULL, 'occupied', NULL, '2025-11-21 05:17:47', '2025-11-21 08:00:44'),
(32, '06B', 2, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:18:08', '2025-11-21 05:18:08'),
(33, '07B', 2, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:18:27', '2025-11-21 05:18:27'),
(34, '08B', 2, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:26:01', '2025-11-21 05:26:01'),
(35, '09B', 2, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:26:18', '2025-11-21 05:26:18'),
(36, '10B', 2, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:26:38', '2025-11-21 05:26:38'),
(37, '11B', 2, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:28:31', '2025-11-21 05:28:31'),
(38, '12B', 2, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:28:49', '2025-11-21 05:28:49'),
(39, '01D', 4, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:32:17', '2025-11-21 05:32:17'),
(40, '02D', 4, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:32:34', '2025-11-21 05:32:34'),
(41, '03D', 4, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:32:49', '2025-11-21 05:32:49'),
(42, '04D', 4, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:33:05', '2025-11-21 05:33:05'),
(43, '05D', 4, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:33:21', '2025-11-21 05:33:21'),
(44, '10D', 4, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:33:40', '2025-11-21 05:36:44'),
(45, '06D', 4, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:33:55', '2025-11-21 05:33:55'),
(46, '07D', 4, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:34:14', '2025-11-21 05:34:14'),
(47, '08D', 4, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:34:40', '2025-11-21 05:37:13'),
(48, '09D', 4, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:35:00', '2025-11-21 05:37:35'),
(49, '11D', 4, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:39:03', '2025-11-21 05:39:03'),
(50, '12D', 4, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:39:18', '2025-11-21 05:39:18'),
(51, '01E', 5, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:42:58', '2025-11-21 05:42:58'),
(52, '02E', 5, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:43:13', '2025-11-21 05:43:13'),
(53, '03E', 5, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:43:29', '2025-11-21 05:43:29'),
(54, '04E', 5, 4, 0, 'quad', 7500.00, NULL, 'available', NULL, '2025-11-21 05:43:45', '2025-11-21 05:43:45'),
(55, '05E', 5, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:44:00', '2025-11-21 05:44:00'),
(56, '06E', 5, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:44:16', '2025-11-21 05:44:16'),
(57, '07E', 5, 3, 0, 'triple', 8500.00, NULL, 'available', NULL, '2025-11-21 05:44:36', '2025-11-21 05:44:36'),
(58, '08E', 5, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:45:17', '2025-11-21 05:45:17'),
(59, '09E', 5, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:45:31', '2025-11-21 05:45:31'),
(60, '10E', 5, 2, 0, 'double', 9500.00, NULL, 'available', NULL, '2025-11-21 05:45:47', '2025-11-21 05:45:47'),
(61, '11E', 5, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:46:13', '2025-11-21 05:46:13'),
(62, '12E', 5, 1, 0, 'single', 11000.00, NULL, 'available', NULL, '2025-11-21 05:46:32', '2025-11-21 05:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `room_allocations`
--

CREATE TABLE `room_allocations` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `move_in_date` date NOT NULL,
  `move_out_date` date DEFAULT NULL,
  `special_requirements` text DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_allocations`
--

INSERT INTO `room_allocations` (`id`, `student_id`, `room_id`, `move_in_date`, `move_out_date`, `special_requirements`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2025-11-25', '2025-11-21', NULL, 'completed', '2025-11-20 20:48:16', '2025-11-20 20:48:39'),
(2, 2, 5, '2025-11-25', '2025-11-21', NULL, 'completed', '2025-11-20 20:48:16', '2025-11-20 20:49:45'),
(3, 3, 6, '2025-11-26', '2025-11-21', NULL, 'completed', '2025-11-20 20:48:16', '2025-11-20 20:49:52'),
(4, 4, 9, '2025-11-27', '2025-11-21', NULL, 'completed', '2025-11-20 20:48:16', '2025-11-20 20:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `room_maintenance`
--

CREATE TABLE `room_maintenance` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('cleaning','repair','inspection','renovation','other') DEFAULT 'repair',
  `status` enum('scheduled','in_progress','completed','cancelled') DEFAULT 'scheduled',
  `priority` enum('low','medium','high','urgent') DEFAULT 'medium',
  `scheduled_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT 0.00,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_maintenance`
--

INSERT INTO `room_maintenance` (`id`, `room_id`, `title`, `description`, `type`, `status`, `priority`, `scheduled_date`, `completed_date`, `assigned_to`, `cost`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 14, 'Electrical Wiring Check', 'Complete electrical wiring inspection and replacement of old wires in room 12A', 'repair', 'completed', 'high', '2025-11-10', '2025-11-12', 6, 2500.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(2, 3, 'Deep Cleaning', 'Deep cleaning and sanitization of room 10A before new student allocation', 'cleaning', 'scheduled', 'medium', '2025-11-20', NULL, 3, 500.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(3, 7, 'Furniture Repair', 'Repair and polishing of all furniture in room 06A', 'repair', 'in_progress', 'medium', '2025-11-15', NULL, 2, 1200.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(4, 16, 'AC Servicing', 'Regular maintenance and servicing of AC units in room 02B', 'repair', 'scheduled', 'low', '2025-11-25', NULL, 6, 800.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(5, 13, 'Bathroom Renovation', 'Partial renovation of attached bathroom including tile work and plumbing', 'renovation', 'scheduled', 'high', '2025-12-01', NULL, 7, 5000.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(6, 8, 'Safety Inspection', 'Quarterly safety inspection including fire safety equipment check', 'inspection', 'completed', 'medium', '2025-11-05', '2025-11-08', 2, 0.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(7, 5, 'Window Repair', 'Repair of broken window latch and glass panel replacement', 'repair', 'in_progress', 'medium', '2025-11-18', NULL, 2, 1500.00, NULL, '2025-11-18 00:39:35', '2025-11-18 00:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `position` enum('warden','caretaker','cleaner','cook','security','electrician','plumber','admin_staff') DEFAULT 'admin_staff',
  `department` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `shift` enum('morning','evening','night','general') DEFAULT 'general',
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','on_leave') DEFAULT 'active',
  `emergency_contact` varchar(15) DEFAULT NULL,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `email`, `phone`, `address`, `position`, `department`, `salary`, `join_date`, `shift`, `image_path`, `status`, `emergency_contact`, `emergency_contact_name`, `created_at`, `updated_at`) VALUES
(1, 'STF001', 'Mrs. Sunita Sharma', 'sunita.sharma@hostel.com', '9876543201', '45 Green Park, Delhi', 'warden', 'Administration', 75000.00, '2023-01-15', 'general', 'assets/images/staff/warden.jpg', 'active', '9876543202', 'Mr. Sharma', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(2, 'STF002', 'Mr. Raj Kumar', 'raj.kumar@hostel.com', '9876543203', '78 Sector 15, Noida', 'caretaker', 'Maintenance', 35000.00, '2023-02-20', 'morning', 'assets/images/staff/caretaker.jpg', 'active', '9876543204', 'Mrs. Kumar', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(3, 'STF003', 'Mrs. Laxmi Devi', 'laxmi.devi@hostel.com', '9876543205', '23 Krishna Nagar, Delhi', 'cleaner', 'Housekeeping', 18000.00, '2023-03-10', 'morning', 'assets/images/staff/cleaner1.jpg', 'active', '9876543206', 'Mr. Devi', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(4, 'STF004', 'Mr. Ram Singh', 'ram.singh@hostel.com', '9876543207', '56 Patel Road, Delhi', 'security', 'Security', 22000.00, '2023-01-20', 'night', 'assets/images/staff/security1.jpg', 'active', '9876543208', 'Mrs. Singh', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(5, 'STF005', 'Mrs. Geeta Rani', 'geeta.rani@hostel.com', '9876543209', '89 Malviya Nagar, Delhi', 'cook', 'Mess', 25000.00, '2023-02-15', 'morning', 'assets/images/staff/cook1.jpg', 'active', '9876543210', 'Mr. Rani', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(6, 'STF006', 'Mr. Anil Gupta', 'anil.gupta@hostel.com', '9876543211', '34 Lajpat Nagar, Delhi', 'electrician', 'Maintenance', 28000.00, '2023-04-05', 'general', 'assets/images/staff/electrician.jpg', 'active', '9876543212', 'Mrs. Gupta', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(7, 'STF007', 'Mr. Suresh Kumar', 'suresh.kumar@hostel.com', '9876543213', '67 Saket, Delhi', 'plumber', 'Maintenance', 26000.00, '2023-03-25', 'general', 'assets/images/staff/plumber.jpg', 'active', '9876543214', 'Mrs. Kumar', '2025-11-18 00:39:35', '2025-11-18 00:39:35'),
(8, 'STF008', 'Ms. Priya Verma', 'priya.verma@hostel.com', '9876543215', '12 Hauz Khas, Delhi', 'admin_staff', 'Administration', 32000.00, '2023-01-10', 'general', 'assets/images/staff/admin1.jpg', 'active', '9876543216', 'Mr. Verma', '2025-11-18 00:39:35', '2025-11-18 00:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(15) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','graduated','left') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `name`, `email`, `phone`, `address`, `guardian_name`, `guardian_phone`, `guardian_relation`, `room_id`, `admission_date`, `image_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'STU001', 'Priya Sharma', 'priya.sharma@example.com', '9876543210', '123 Main Street, Mumbai', 'Rajesh Sharma', '9876543211', 'Father', 5, '2025-08-01', 'STU001_1763665411.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:03:31'),
(2, 'STU002', 'Anjali Patel', 'anjali.patel@example.com', '9876543212', '456 Park Avenue, Delhi', 'Sunil Patel', '9876543213', 'Father', 5, '2025-08-01', 'STU002_1763665315.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:01:55'),
(3, 'STU003', 'Sneha Reddy', 'sneha.reddy@example.com', '9876543214', '789 MG Road, Bangalore', 'Kumar Reddy', '9876543215', 'Father', 6, '2025-08-01', 'STU003_1763665444.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:04:04'),
(4, 'STU004', 'Meera Iyer', 'meera.iyer@example.com', '9876543216', '321 Temple Street, Chennai', 'Ramesh Iyer', '9876543217', 'Father', 9, '2025-08-01', 'STU004_1763665358.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:02:38'),
(5, 'STU005', 'Kavita Singh', 'kavita.singh@example.com', '9876543218', '654 Rose Lane, Kolkata', 'Amit Singh', '9876543219', 'Father', 9, '2025-08-01', 'STU005_1763665343.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:02:23'),
(6, 'STU006', 'Divya Kumar', 'divya.kumar@example.com', '9876543220', '987 Lake View, Hyderabad', 'Vikram Kumar', '9876543221', 'Father', 10, '2025-08-01', 'STU006_1763665331.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:02:11'),
(7, 'STU007', 'Pooja Verma', 'pooja.verma@example.com', '9876543222', '147 Hill Road, Pune', 'Sanjay Verma', '9876543223', 'Father', 11, '2025-08-01', 'STU007_1763665382.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:03:02'),
(8, 'STU008', 'Neha Gupta', 'neha.gupta@example.com', '9876543224', '258 Market Street, Ahmedabad', 'Rahul Gupta', '9876543225', 'Father', 12, '2025-08-01', 'STU008_1763665369.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:02:49'),
(9, 'STU009', 'Ritu Joshi', 'ritu.joshi@example.com', '9876543226', '369 Garden Avenue, Jaipur', 'Anil Joshi', '9876543227', 'Father', 13, '2025-08-01', 'STU009_1763665423.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:03:43'),
(10, 'STU010', 'Shweta Malhotra', 'shweta.malhotra@example.com', '9876543228', '741 Palace Road, Udaipur', 'Vijay Malhotra', '9876543229', 'Father', 13, '2025-08-01', 'STU010_1763665434.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:03:54'),
(11, 'STU011', 'Nisha Choudhary', 'nisha.choudhary@example.com', '9876543230', '852 Fort Area, Jodhpur', 'Prakash Choudhary', '9876543231', 'Father', 13, '2025-08-01', 'STU011_1763665394.jpg', 'active', '2025-11-17 21:32:30', '2025-11-20 19:03:14'),
(15, 'RJ001', 'rani dev', 'rani@dev.com', '4589589966', 'panjab', 'jagu dev', '4585625566', 'Father', 8, '2025-11-18', 'RJ001_1763665476.jpg', 'active', '2025-11-18 00:24:59', '2025-11-20 19:04:36'),
(17, 'STU013', 'Amrita Mahanta', 'mahanta@gmail.com', '8545952159', 'boyanika sector 5 rourkela odisha', 'Pratip Mahanta', '4585852269', 'Father', 31, '2025-11-21', 'STU013_1763711560.jpg', 'active', '2025-11-21 07:52:40', '2025-11-21 07:52:40'),
(18, 'STU014', 'Shivani Shing', 'shibanishing12@gmail.com', '7896585589', '42C, Sector 42, Chandigarh, 160036', 'Sunil Shing', '9987548545', 'Mother', 31, '2025-11-21', 'STU014_1763712044.jpg', 'active', '2025-11-21 08:00:44', '2025-11-21 08:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manager','staff','student') DEFAULT 'staff',
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `status`, `last_login`, `profile_image`, `created_at`, `updated_at`) VALUES
(9, 'admin', 'admin@hostel.com', '$2y$10$Bwx3jiN1tzVaALkfJyYsHuneYO8ivQzzKUEu/ab3ffR/yTykv.YRC', 'admin', 'active', NULL, NULL, '2025-11-18 07:45:06', '2025-11-20 15:48:26'),
(10, 'staff', 'staff@hostel.com', '$2y$10$oV9zavYEg39Ah6bEWt/Y1eKghruqJ0bQaro0ByQJ1rqZjUP4Jbd76', 'staff', 'active', NULL, NULL, '2025-11-18 07:45:06', '2025-11-18 07:45:06'),
(11, 'manager', 'manager@hostel.com', '$2y$10$NFFuiK3Xdbt0SugIIz3EXuqTKLF0NOMgDL.DhKkK/dw0mDgCUDKSe', 'manager', 'active', NULL, NULL, '2025-11-18 07:45:06', '2025-11-18 07:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `visitor_name` varchar(100) NOT NULL,
  `visitor_phone` varchar(15) DEFAULT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `visit_date` date NOT NULL,
  `entry_time` time NOT NULL,
  `exit_time` time DEFAULT NULL,
  `status` enum('checked_in','checked_out') DEFAULT 'checked_in',
  `id_proof_type` varchar(50) DEFAULT NULL,
  `id_proof_number` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `mess_menu`
--
ALTER TABLE `mess_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `mess_menu_templates`
--
ALTER TABLE `mess_menu_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `room_allocations`
--
ALTER TABLE `room_allocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room_maintenance`
--
ALTER TABLE `room_maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_ibfk_1` (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `created_by` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mess_menu`
--
ALTER TABLE `mess_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mess_menu_templates`
--
ALTER TABLE `mess_menu_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `room_allocations`
--
ALTER TABLE `room_allocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_maintenance`
--
ALTER TABLE `room_maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `staff` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `mess_menu`
--
ALTER TABLE `mess_menu`
  ADD CONSTRAINT `mess_menu_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `mess_menu_templates`
--
ALTER TABLE `mess_menu_templates`
  ADD CONSTRAINT `mess_menu_templates_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `room_allocations`
--
ALTER TABLE `room_allocations`
  ADD CONSTRAINT `room_allocations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_allocations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_maintenance`
--
ALTER TABLE `room_maintenance`
  ADD CONSTRAINT `room_maintenance_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_maintenance_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `staff` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `room_maintenance_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visitors_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
