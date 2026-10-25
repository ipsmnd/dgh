-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 07:31 PM
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
-- Database: `graceful_living_hostel`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `available_rooms`
-- (See below for the actual view)
--
CREATE TABLE `available_rooms` (
`id` int(11)
,`room_number` varchar(10)
,`floor` int(11)
,`type` enum('single','double','triple','quad')
,`capacity` int(11)
,`rent` decimal(10,2)
,`facilities` longtext
,`status` enum('available','occupied','maintenance','cleaning')
,`notes` text
,`created_at` timestamp
,`updated_at` timestamp
,`current_occupants` bigint(21)
,`available_spots` bigint(22)
);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_in_date` date NOT NULL,
  `check_out_date` date DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `security_deposit` decimal(10,2) DEFAULT 5000.00,
  `special_requests` text DEFAULT NULL,
  `admin_notes` text DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high','urgent') DEFAULT 'medium',
  `status` enum('pending','in_progress','completed','cancelled') DEFAULT 'pending',
  `assigned_to` int(11) DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `student_feedback` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('booking','payment','maintenance','announcement','system') DEFAULT 'system',
  `is_read` tinyint(1) DEFAULT 0,
  `related_id` int(11) DEFAULT NULL,
  `related_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('rent','security_deposit','maintenance','other') NOT NULL,
  `payment_method` enum('cash','card','bank_transfer','upi') DEFAULT 'cash',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('pending','completed','failed','refunded') DEFAULT 'pending',
  `description` text DEFAULT NULL,
  `receipt_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `floor` int(11) NOT NULL,
  `type` enum('single','double','triple','quad') NOT NULL,
  `capacity` int(11) NOT NULL,
  `rent` decimal(10,2) NOT NULL,
  `facilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`facilities`)),
  `status` enum('available','occupied','maintenance','cleaning') DEFAULT 'available',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `floor`, `type`, `capacity`, `rent`, `facilities`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, '101', 1, 'single', 1, 8000.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"AC\"]', 'available', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(2, '102', 1, 'double', 2, 6000.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"Fan\"]', 'available', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(3, '103', 1, 'triple', 3, 5000.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"Fan\"]', 'available', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(4, '201', 2, 'single', 1, 8500.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"AC\", \"Balcony\"]', 'available', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(5, '202', 2, 'double', 2, 6500.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"AC\"]', 'available', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(6, '203', 2, 'quad', 4, 4000.00, '[\"WiFi\", \"Attached Bathroom\", \"Study Table\", \"Wardrobe\", \"Fan\"]', 'maintenance', NULL, '2025-11-20 21:34:16', '2025-11-20 21:34:16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `room_occupancy_summary`
-- (See below for the actual view)
--
CREATE TABLE `room_occupancy_summary` (
`type` enum('single','double','triple','quad')
,`total_rooms` bigint(21)
,`available_rooms` decimal(22,0)
,`occupied_rooms` decimal(22,0)
,`maintenance_rooms` decimal(22,0)
,`cleaning_rooms` decimal(22,0)
,`total_students` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `enrollment_number` varchar(20) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(15) DEFAULT NULL,
  `emergency_contact` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `college_name` varchar(100) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `year_of_study` varchar(10) DEFAULT NULL,
  `status` enum('active','inactive','graduated','left') DEFAULT 'active',
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `security_deposit` decimal(10,2) DEFAULT 5000.00,
  `deposit_status` enum('paid','pending','refunded') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` enum('admin','student','manager') DEFAULT 'student',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`, `phone`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gracefulliving.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Hostel Administrator', '9876543210', 'admin', 'active', '2025-11-20 21:34:16', '2025-11-20 21:34:16'),
(2, 'student01', 'priya.sharma@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Priya Sharma', '9876543211', 'student', 'active', '2025-11-20 21:34:16', '2025-11-20 21:34:16');

-- --------------------------------------------------------

--
-- Structure for view `available_rooms`
--
DROP TABLE IF EXISTS `available_rooms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `available_rooms`  AS SELECT `r`.`id` AS `id`, `r`.`room_number` AS `room_number`, `r`.`floor` AS `floor`, `r`.`type` AS `type`, `r`.`capacity` AS `capacity`, `r`.`rent` AS `rent`, `r`.`facilities` AS `facilities`, `r`.`status` AS `status`, `r`.`notes` AS `notes`, `r`.`created_at` AS `created_at`, `r`.`updated_at` AS `updated_at`, (select count(0) from `students` `s` where `s`.`room_id` = `r`.`id` and `s`.`status` = 'active') AS `current_occupants`, `r`.`capacity`- (select count(0) from `students` `s` where `s`.`room_id` = `r`.`id` and `s`.`status` = 'active') AS `available_spots` FROM `rooms` AS `r` WHERE `r`.`status` = 'available' ;

-- --------------------------------------------------------

--
-- Structure for view `room_occupancy_summary`
--
DROP TABLE IF EXISTS `room_occupancy_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `room_occupancy_summary`  AS SELECT `r`.`type` AS `type`, count(0) AS `total_rooms`, sum(case when `r`.`status` = 'available' then 1 else 0 end) AS `available_rooms`, sum(case when `r`.`status` = 'occupied' then 1 else 0 end) AS `occupied_rooms`, sum(case when `r`.`status` = 'maintenance' then 1 else 0 end) AS `maintenance_rooms`, sum(case when `r`.`status` = 'cleaning' then 1 else 0 end) AS `cleaning_rooms`, (select count(0) from `students` `s` where `s`.`status` = 'active') AS `total_students` FROM `rooms` AS `r` GROUP BY `r`.`type` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `idx_bookings_status` (`status`),
  ADD KEY `idx_bookings_user_id` (`user_id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user_id` (`user_id`),
  ADD KEY `idx_notifications_is_read` (`is_read`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `idx_payments_status` (`status`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`),
  ADD KEY `idx_rooms_status` (`status`),
  ADD KEY `idx_rooms_type` (`type`),
  ADD KEY `idx_rooms_floor` (`floor`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollment_number` (`enrollment_number`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `idx_students_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD CONSTRAINT `maintenance_requests_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `maintenance_requests_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `maintenance_requests_ibfk_3` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
