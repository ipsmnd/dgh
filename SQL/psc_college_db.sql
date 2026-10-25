-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 07:32 PM
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
-- Database: `psc_college_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendar`
--

CREATE TABLE `academic_calendar` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` text DEFAULT NULL,
  `event_type` enum('Academic','Holiday','Examination','Cultural','Sports','Other') DEFAULT 'Academic',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `academic_year` varchar(20) NOT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `course_id` varchar(50) DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_calendar`
--

INSERT INTO `academic_calendar` (`event_id`, `event_title`, `event_description`, `event_type`, `start_date`, `end_date`, `academic_year`, `semester`, `course_id`, `is_important`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Semester 1 Commencement', 'Beginning of Odd Semester Classes', 'Academic', '2024-08-01', '2024-08-01', '2024-2025', 'Semester 1', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(2, 'Last Date for Course Registration', 'Last date to register for semester courses', 'Academic', '2024-08-10', '2024-08-10', '2024-2025', 'Semester 1', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(3, 'Mid-Semester Examinations', 'First internal assessment examinations', 'Examination', '2024-09-15', '2024-09-20', '2024-2025', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(4, 'Diwali Break', 'Diwali Festival Holidays', 'Holiday', '2024-10-20', '2024-10-25', '2024-2025', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(5, 'Semester 1 End Semester Exams', 'Final examinations for odd semester', 'Examination', '2024-11-25', '2024-12-10', '2024-2025', 'Semester 1', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(6, 'Semester 1 Vacation', 'Winter break after semester 1 exams', 'Holiday', '2024-12-11', '2025-01-05', '2024-2025', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(7, 'Semester 2 Commencement', 'Beginning of Even Semester Classes', 'Academic', '2025-01-06', '2025-01-06', '2024-2025', 'Semester 2', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(8, 'Republic Day', 'National Holiday', 'Holiday', '2025-01-26', '2025-01-26', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(9, 'College Foundation Day', 'Annual college foundation day celebration', 'Cultural', '2025-02-15', '2025-02-15', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(10, 'Mid-Semester Examinations', 'Second internal assessment examinations', 'Examination', '2025-03-01', '2025-03-06', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(11, 'Holi Festival', 'Holi Festival Holiday', 'Holiday', '2025-03-14', '2025-03-14', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(12, 'Annual Sports Meet', 'College sports competition', 'Sports', '2025-03-20', '2025-03-22', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(13, 'Semester 2 End Semester Exams', 'Final examinations for even semester', 'Examination', '2025-04-15', '2025-04-30', '2024-2025', 'Semester 2', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(14, 'Summer Vacation', 'Summer break', 'Holiday', '2025-05-01', '2025-07-31', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(15, 'Semester 1 Commencement', 'Beginning of Odd Semester Classes', 'Academic', '2025-08-01', '2025-08-01', '2025-2026', 'Semester 1', NULL, 1, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(16, 'Independence Day', 'National Holiday', 'Holiday', '2025-08-15', '2025-08-15', '2025-2026', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(17, 'Mid-Semester Examinations', 'First internal assessment examinations', 'Examination', '2025-09-15', '2025-09-20', '2025-2026', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(18, 'Tech Fest 2024', 'Annual technical festival', 'Cultural', '2024-10-05', '2024-10-07', '2024-2025', 'Semester 1', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(19, 'Cultural Fest 2025', 'Annual cultural festival', 'Cultural', '2025-02-25', '2025-02-27', '2024-2025', 'Semester 2', NULL, 0, NULL, '2025-10-03 03:32:12', '2025-10-03 03:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `alumni_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `course_studied` varchar(255) NOT NULL,
  `graduation_year` int(11) NOT NULL,
  `current_occupation` varchar(255) DEFAULT NULL,
  `message_to_college` text DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`alumni_id`, `full_name`, `email`, `phone`, `course_studied`, `graduation_year`, `current_occupation`, `message_to_college`, `registered_at`) VALUES
(1, 'Pabitraswain', 'pabitraswain@gmail.com', '7609562233', 'Integrated Program', 2019, 'diploma', 'While some courses of study are highly structured, others offer more flexibility, allowing students to choose from a range of elective courses within a broader area of study. ', '2025-07-24 11:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `max_marks` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_events`
--

CREATE TABLE `career_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` text DEFAULT NULL,
  `event_type` enum('workshop','seminar','recruitment_drive','webinar') DEFAULT 'workshop',
  `event_date` date NOT NULL,
  `event_time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(50) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_description` text DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `duration_years` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `course_type` varchar(50) DEFAULT 'Available',
  `course_image` varchar(255) DEFAULT NULL,
  `course_fee` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_description`, `credits`, `duration_years`, `department`, `course_type`, `course_image`, `course_fee`) VALUES
('AI002', 'Artificial Intelligence', 'Artificial Intelligence', 12, 10, 'AI', 'Popular', 'uploads/course_images/course_68cedf69cf524.jpg', 0.00),
('App0021', 'App development', 'Application development is the process of planning, designing, coding, testing, and deploying software applications to solve specific business problems or fulfill user needs', 2, 3, 'App', 'Available', 'uploads/course_images/course_68cef87faea03.jpg', 0.00),
('AWS', 'AWS', 'One can define AWS be understanding that Amazon Web Services (AWS) represents Amazon\\\'s cloud computing platform, enabling individuals and organizations to access essential IT resources including storage solutions, computing power, and database management via internet connectivity.', 6, 7, 'Cloud', 'Trending', 'uploads/course_images/course_68cee05bdef59.png', 0.00),
('BCA001', 'BCA', 'BCA stands for Bachelor of Computer Applications. a three-year undergraduate degree program focused on computer applications and software development.', 3, 3, 'Courses', 'Available', 'uploads/course_images/course_68cee2a9e8bee.webp', 0.00),
('bda0011', 'Big data analytics', 'Big data analytics refers to the methods, tools, and applications used to collect, process, and derive insights from varied, high-volume, high-velocity data sets', 1, 2, 'Analytics', 'Trending', 'uploads/course_images/course_68cef51ea20b6.jpg', 0.00),
('BI002', 'Business intelligence', 'Business Intelligence (BI) is a process and set of technologies that collect, analyze, and transform raw business data into actionable insights to inform decision-making, improve performance, and provide a competitive advantage', 2, 2, 'Business intelligence', 'Upcoming', 'uploads/course_images/course_68ceea21a3970.png', 0.00),
('BT001', 'Blockchain Technology', 'Focuses on distributed ledger technology that enables secure and transparent transactions. ', 8, 6, 'Technology', 'Upcoming', 'uploads/course_images/course_68cee1f206adf.jpg', 0.00),
('BT01', 'BTech', 'BTech, or Bachelor of Technology, is a four-year undergraduate degree focused on engineering and technology. It combines theoretical knowledge with practical, hands-on training, preparing students for careers in various technical fields. Students can choose from a wide range of specializations, including Computer Science, Electrical, Mechanical, and Civil Engineering', 4, 4, 'Courses', 'Available', 'uploads/course_images/course_68cee286c6c3e.jpg', 0.00),
('CC001', 'Cloud Computing', 'Deals with delivering computing services over the internet.', 8, 2, 'Cloud', 'Popular', 'uploads/course_images/course_68cee0f9aa685.jpg', 0.00),
('CCNA001', 'CCNA', '', 1, 1, 'Networking', 'Popular', 'uploads/course_images/course_68cef1c419c72.jpg', 0.00),
('CCNP001', 'CCNP', '', 2, 1, 'IT Security', 'Popular', 'uploads/course_images/course_68cef19410cf7.jpg', 0.00),
('CH01', ' Ethical-Hacking', 'The seven types of cybersecurity are: Network Security, Application Security, Endpoint Security, Information Security, Cloud Security, IoT Security, and Mobile Security. These areas represent key aspects of protecting digital assets and infrastructure from cyber threats. ', 2, 2, 'Cyber security', 'Trending', 'uploads/course_images/course_68cee7bc72592.webp', 0.00),
('CHN001', 'Computer Hardware and Networking', 'Focuses on the physical components of computers and how they connect to form networks.', 12, 6, 'Hardware ', 'Upcoming', 'uploads/course_images/course_68cee0285449a.jpg', 0.00),
('CN0012', 'Computer Networking', 'Computer networking is the practice of connecting two or more devices, like computers and printers, to share resources, data, and services, using a common set of rules called communication protocols over digital interconnections', 1, 1, 'Networking', 'Popular', 'uploads/course_images/course_68cef2d066259.jpg', 0.00),
('CS001', 'Cyber Security', 'Cybersecurity refers to the practice of protecting computer systems, networks, and data from digital attacks, unauthorized access, and other malicious activities', 8, 4, 'IT Security', 'Trending', 'uploads/course_images/course_68cee684e2aaf.jpg', 0.00),
('DA01', 'Data Analyst', 'A data analyst gathers, cleans, analyzes, and interprets data to provide actionable insights that help organizations make informed decisions.', 3, 3, 'Analyst', 'Trending', 'uploads/course_images/course_68cee611cdc08.png', 0.00),
('DBS0012', 'Diploma cybersecurity', 'Diploma cybersecurity courses are specialized programs, often 6 months to a year long, that equip students with skills in areas like ethical hacking, network security, malware analysis, and digital forensics to protect systems from cyber threats', 2, 2, 'Diploma', 'Upcoming', 'uploads/course_images/course_68cef737a0518.png', 0.00),
('DM0011', 'Digital marketing', 'Digital Marketing? (At Home & For Free)Digital marketing is the process of promoting and selling products and services using digital technologies and platforms like the internet, mobile devices, social media, and search engines', 2, 1, 'Digital marketing', 'Upcoming', 'uploads/course_images/course_68ceefa35dab4.png', 0.00),
('DM0022', 'Data Management', 'Data Management on BI and AnalyticsData management is the process of collecting, organizing, securing, storing, and maintaining an organization\\\\\\\'s data throughout its lifecycle to ensure quality, accessibility, and usability for decision-making, analytics, and compliance', 1, 1, 'Data Management', 'Trending', 'uploads/course_images/course_68cef5c932b94.jpg', 0.00),
('DO0012', 'DevOps', 'DevOps', 12, 4, 'Development', 'Popular', 'uploads/course_images/course_68cee16f641f5.webp', 0.00),
('DS001', 'Data Science', 'Data science is an interdisciplinary field that uses scientific methods, algorithms, and systems to extract knowledge and insights from data. ', 3, 3, 'Data ', 'Trending', 'uploads/course_images/course_68cee60623325.jpg', 0.00),
('DSE0001', 'Diploma in software engineering', 'A diploma in software engineering is a program that provides foundational and advanced skills in software development, including programming, software design, testing, project management, and web development', 2, 2, 'Diploma ', 'Upcoming', 'uploads/course_images/course_68cef6a4f228b.jpg', 0.00),
('ITS110', 'IT support', 'Contact our customer support center where you can open a support ticket, chat with us 24 hours a day, Monday through Friday; or call the TI support team', 1, 1, 'Support', 'Popular', 'uploads/course_images/course_68cef445c45e2.jpg', 0.00),
('MAP001', 'Mobile App Development', 'Involves creating applications for mobile devices like smartphones and tablets.', 8, 10, 'App', 'Available', 'uploads/course_images/course_68cee41adb3e4.jpg', 0.00),
('MCA002', 'MCA', 'MCA stands for Master of Computer Applications, a postgraduate degree focused on computer applications and software development. ', 2, 2, 'Courses', 'Available', 'uploads/course_images/course_68cee38310bbe.webp', 0.00),
('ML001', 'Machine Learning', 'A subset of AI that allows systems to learn from data without being explicitly programmed.', 12, 10, 'IT', 'Upcoming', 'uploads/course_images/course_68cee3119ed11.jpg', 0.00),
('MT01', 'M.Tech', 'M.Tech, or Master of Technology, is a postgraduate degree in engineering and technology. It\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s a two-year program that builds upon a bachelor\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s degree in a related field, offering specialization in various engineering disciplines', 3, 3, 'Courses', 'Available', 'uploads/course_images/course_68cee3a49e989.png', 0.00),
('PM001', 'Project Management', 'Involves planning, organizing, and managing resources to achieve specific project goals.', 8, 5, 'Management', 'Upcoming', 'uploads/course_images/course_68cee4f1ec441.jpg', 0.00),
('PSC1120', 'Cyber Security Specialist', 'cyber security specialist protects an organization\\\\\\\\\\\\\\\'s computer systems, networks, and data from threats, vulnerabilities, and attacks by conducting audits, implementing security measures like firewalls, monitoring for anomalies, and training staff on best practices', 2, 4, 'IT Security', 'Upcoming', 'uploads/course_images/course_68cef9e5d443f.webp', 0.00),
('SA011', 'Software Architect', 'A software architect is a senior technical leader responsible for the high-level design and structure of a software system, ensuring it meets business requirements and technical goals', 1, 1, 'Architect', 'Upcoming', 'uploads/course_images/course_68cef3baefd50.png', 0.00),
('SD0012', 'Software development', 'Software development is the entire process of conceptualizing, designing, coding, testing, deploying, and maintaining software applications to meet user needs and achieve specific goals', 1, 1, 'Development', 'Trending', 'uploads/course_images/course_68cef7bfb34a8.jpg', 0.00),
('SPSC001', 'Software Testing', 'Software testing is a crucial process within the software development lifecycle, designed to evaluate a software application to ensure it meets specified requirements, functions correctly, and is free of defects', 2, 2, 'Software Testing', 'Trending', 'uploads/course_images/course_68cee97f5432f.jpg', 0.00),
('SS003', 'Master the Art of Soft Skills', 'Soft skills, also known as interpersonal skills, are the personal attributes that enable someone to interact effectively and harmoniously with other people. These skills are increasingly becoming the differentiator in professional success.', 5, 2, 'HR', 'Upcoming', 'uploads/course_images/course_68cee1af09d5e.png', 0.00),
('WDD001', 'Web Designing & Development', 'Covers the design and development of websites.', 8, 10, 'IT', 'Available', 'uploads/course_images/course_68cee5282ec92.webp', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `material_id` int(11) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `material_title` varchar(255) NOT NULL,
  `material_description` text DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  `material_type` enum('Lecture Notes','Assignment','Reading','Video','Other') DEFAULT 'Lecture Notes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_schedule`
--

CREATE TABLE `course_schedule` (
  `id` int(11) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `class_type` enum('Lecture','Lab','Tutorial','Seminar') DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_audit_log`
--

CREATE TABLE `database_audit_log` (
  `log_id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `operation` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structures`
--

CREATE TABLE `fee_structures` (
  `fee_structure_id` int(11) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL,
  `tuition_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `library_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `laboratory_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `examination_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `development_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sports_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hostel_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transportation_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `other_charges` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_structures`
--

INSERT INTO `fee_structures` (`fee_structure_id`, `course_id`, `course_name`, `academic_year`, `semester`, `tuition_fee`, `library_fee`, `laboratory_fee`, `examination_fee`, `development_fee`, `sports_fee`, `hostel_fee`, `transportation_fee`, `other_charges`, `total_fee`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BT01', 'B.Tech Computer Science', '2024-2025', 1, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(2, 'BT01', 'B.Tech Computer Science', '2024-2025', 2, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(3, 'BT01', 'B.Tech Computer Science', '2024-2025', 3, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(4, 'BT01', 'B.Tech Computer Science', '2024-2025', 4, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(5, 'BT01', 'B.Tech Computer Science', '2024-2025', 5, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(6, 'BT01', 'B.Tech Computer Science', '2024-2025', 6, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(7, 'BT01', 'B.Tech Computer Science', '2024-2025', 7, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(8, 'BT01', 'B.Tech Computer Science', '2024-2025', 8, 50000.00, 2000.00, 5000.00, 3000.00, 5000.00, 1000.00, 0.00, 0.00, 2000.00, 67000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(9, 'BCA001', 'BCA', '2024-2025', 1, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(10, 'BCA001', 'BCA', '2024-2025', 2, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(11, 'BCA001', 'BCA', '2024-2025', 3, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(12, 'BCA001', 'BCA', '2024-2025', 4, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(13, 'BCA001', 'BCA', '2024-2025', 5, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(14, 'BCA001', 'BCA', '2024-2025', 6, 35000.00, 2000.00, 3000.00, 2500.00, 4000.00, 1000.00, 0.00, 0.00, 1500.00, 49000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(15, 'MCA002', 'MCA', '2024-2025', 1, 45000.00, 2000.00, 4000.00, 3000.00, 4500.00, 1000.00, 0.00, 0.00, 1800.00, 61300.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(16, 'MCA002', 'MCA', '2024-2025', 2, 45000.00, 2000.00, 4000.00, 3000.00, 4500.00, 1000.00, 0.00, 0.00, 1800.00, 61300.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(17, 'MCA002', 'MCA', '2024-2025', 3, 45000.00, 2000.00, 4000.00, 3000.00, 4500.00, 1000.00, 0.00, 0.00, 1800.00, 61300.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(18, 'MCA002', 'MCA', '2024-2025', 4, 45000.00, 2000.00, 4000.00, 3000.00, 4500.00, 1000.00, 0.00, 0.00, 1800.00, 61300.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(19, 'MT01', 'M.Tech Computer Science', '2024-2025', 1, 60000.00, 2500.00, 6000.00, 3500.00, 5500.00, 1200.00, 0.00, 0.00, 2200.00, 80900.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(20, 'MT01', 'M.Tech Computer Science', '2024-2025', 2, 60000.00, 2500.00, 6000.00, 3500.00, 5500.00, 1200.00, 0.00, 0.00, 2200.00, 80900.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(21, 'MT01', 'M.Tech Computer Science', '2024-2025', 3, 60000.00, 2500.00, 6000.00, 3500.00, 5500.00, 1200.00, 0.00, 0.00, 2200.00, 80900.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(22, 'MT01', 'M.Tech Computer Science', '2024-2025', 4, 60000.00, 2500.00, 6000.00, 3500.00, 5500.00, 1200.00, 0.00, 0.00, 2200.00, 80900.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(23, 'BT01', 'B.Tech Computer Science', '2025-2026', 1, 52000.00, 2200.00, 5200.00, 3200.00, 5200.00, 1100.00, 0.00, 0.00, 2100.00, 71100.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(24, 'BCA001', 'BCA', '2025-2026', 1, 37000.00, 2200.00, 3200.00, 2700.00, 4200.00, 1100.00, 0.00, 0.00, 1600.00, 52000.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(25, 'MCA002', 'MCA', '2025-2026', 1, 47000.00, 2200.00, 4200.00, 3200.00, 4700.00, 1100.00, 0.00, 0.00, 1900.00, 64500.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15'),
(26, 'MT01', 'M.Tech Computer Science', '2025-2026', 1, 62000.00, 2700.00, 6200.00, 3700.00, 5700.00, 1300.00, 0.00, 0.00, 2300.00, 84100.00, 1, '2025-10-03 03:25:15', '2025-10-03 03:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `library_books`
--

CREATE TABLE `library_books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `total_copies` int(11) NOT NULL DEFAULT 1,
  `available_copies` int(11) NOT NULL DEFAULT 1,
  `shelf_location` varchar(50) DEFAULT NULL,
  `book_language` varchar(50) DEFAULT 'English',
  `description` text DEFAULT NULL,
  `book_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_books`
--

INSERT INTO `library_books` (`book_id`, `title`, `author`, `isbn`, `publisher`, `publication_year`, `category`, `total_copies`, `available_copies`, `shelf_location`, `book_language`, `description`, `book_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', '9780262033848', 'MIT Press', 2009, 'Computer Science', 5, 3, 'CS-A1', 'English', 'Comprehensive guide to algorithms and data structures', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(2, 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', '9780132350884', 'Prentice Hall', 2008, 'Software Engineering', 3, 1, 'SE-B2', 'English', 'Best practices for writing clean and maintainable code', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(3, 'The Pragmatic Programmer', 'Andrew Hunt, David Thomas', '9780201616224', 'Addison-Wesley', 1999, 'Software Engineering', 4, 2, 'SE-B3', 'English', 'Your journey to mastery in software development', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(4, 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides', '9780201633610', 'Addison-Wesley', 1994, 'Software Engineering', 3, 2, 'SE-B1', 'English', 'Classic book on software design patterns', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(5, 'Computer Networks', 'Andrew S. Tanenbaum', '9780132126953', 'Pearson', 2010, 'Networking', 4, 2, 'NET-C1', 'English', 'Comprehensive introduction to computer networks', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(6, 'Database System Concepts', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', '9780073523323', 'McGraw-Hill', 2010, 'Database', 3, 2, 'DB-D1', 'English', 'Fundamental concepts of database systems', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(7, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell, Peter Norvig', '9780136042594', 'Pearson', 2009, 'Artificial Intelligence', 2, 0, 'AI-E1', 'English', 'Comprehensive introduction to artificial intelligence', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(8, 'Operating System Concepts', 'Abraham Silberschatz, Peter B. Galvin, Greg Gagne', '9781118063330', 'Wiley', 2012, 'Operating Systems', 3, 1, 'OS-F1', 'English', 'Fundamental concepts of operating systems', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(9, 'The C Programming Language', 'Brian W. Kernighan, Dennis M. Ritchie', '9780131103627', 'Prentice Hall', 1988, 'Programming', 5, 3, 'PROG-G1', 'English', 'Classic book on C programming language', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(10, 'Structure and Interpretation of Computer Programs', 'Harold Abelson, Gerald Jay Sussman', '9780262510875', 'MIT Press', 1996, 'Computer Science', 2, 0, 'CS-A2', 'English', 'Classic textbook on computer science', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `library_borrowings`
--

CREATE TABLE `library_borrowings` (
  `borrowing_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `borrowed_date` date NOT NULL,
  `due_date` date NOT NULL,
  `returned_date` date DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT 0.00,
  `status` enum('borrowed','returned','overdue') DEFAULT 'borrowed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_borrowings`
--

INSERT INTO `library_borrowings` (`borrowing_id`, `book_id`, `user_id`, `borrowed_date`, `due_date`, `returned_date`, `fine_amount`, `status`, `created_at`) VALUES
(1, 1, 1, '2024-09-01', '2024-09-15', '2024-09-10', 0.00, 'returned', '2025-10-03 03:32:12'),
(2, 2, 1, '2024-09-05', '2024-09-19', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12'),
(3, 3, 2, '2024-09-10', '2024-09-24', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12'),
(4, 4, 3, '2024-08-20', '2024-09-03', '2024-09-05', 20.00, 'returned', '2025-10-03 03:32:12'),
(5, 5, 4, '2024-09-02', '2024-09-16', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12'),
(6, 6, 5, '2024-08-25', '2024-09-08', '2024-09-07', 0.00, 'returned', '2025-10-03 03:32:12'),
(7, 7, 6, '2024-09-08', '2024-09-22', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12'),
(8, 8, 7, '2024-09-12', '2024-09-26', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12'),
(9, 9, 8, '2024-08-30', '2024-09-13', '2024-09-12', 0.00, 'returned', '2025-10-03 03:32:12'),
(10, 10, 9, '2024-09-03', '2024-09-17', NULL, 0.00, 'borrowed', '2025-10-03 03:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `notification_type` enum('info','warning','success','error') DEFAULT 'info',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `full_name`, `email`, `phone`, `department`, `position`, `qualification`, `experience_years`, `date_of_joining`, `profile_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Rajesh Kumar', 'rajesh.kumar@psccollege.edu', '9876543210', 'Computer Science', 'Professor', 'Ph.D. in Computer Science', 15, '2010-08-15', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(2, 'Prof. Sunita Sharma', 'sunita.sharma@psccollege.edu', '9876543211', 'Mathematics', 'Associate Professor', 'M.Sc., M.Phil. in Mathematics', 12, '2012-06-01', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(3, 'Dr. Amit Patel', 'amit.patel@psccollege.edu', '9876543212', 'Physics', 'Professor', 'Ph.D. in Physics', 18, '2008-03-10', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(4, 'Ms. Priya Singh', 'priya.singh@psccollege.edu', '9876543213', 'Computer Science', 'Assistant Professor', 'M.Tech in Computer Science', 8, '2016-07-20', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(5, 'Dr. Vikram Malhotra', 'vikram.malhotra@psccollege.edu', '9876543214', 'Chemistry', 'Professor', 'Ph.D. in Chemistry', 20, '2005-01-15', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(6, 'Mr. Sanjay Verma', 'sanjay.verma@psccollege.edu', '9876543215', 'Administration', 'Administrative Officer', 'MBA', 10, '2014-11-05', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(7, 'Ms. Anjali Gupta', 'anjali.gupta@psccollege.edu', '9876543216', 'Library', 'Librarian', 'M.Lib', 7, '2017-09-12', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(8, 'Dr. Ramesh Iyer', 'ramesh.iyer@psccollege.edu', '9876543217', 'Electronics', 'Professor', 'Ph.D. in Electronics', 16, '2009-04-18', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(9, 'Mrs. Meena Reddy', 'meena.reddy@psccollege.edu', '9876543218', 'Computer Science', 'Lab Assistant', 'B.Tech', 5, '2019-02-22', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(10, 'Mr. Alok Mishra', 'alok.mishra@psccollege.edu', '9876543219', 'Physical Education', 'Sports Officer', 'M.P.Ed', 9, '2015-08-30', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_fee_payments`
--

CREATE TABLE `student_fee_payments` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `fee_structure_id` int(11) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` enum('cash','card','bank_transfer','online') DEFAULT 'cash',
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','completed','failed','refunded') DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `late_fee` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_results`
--

CREATE TABLE `student_results` (
  `result_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `semester` int(11) NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `total_marks` decimal(5,2) NOT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `grade_point` decimal(3,2) DEFAULT NULL,
  `result_status` enum('pass','fail','supplementary') DEFAULT 'pass',
  `exam_type` enum('internal','external','practical','project') DEFAULT 'external',
  `exam_date` date DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('student','faculty','admin','staff','alumni') NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `first_name`, `last_name`, `phone`, `profile_image`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'System', 'Administrator', '9876543201', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(2, 'student001', 'student001@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Aarav', 'Sharma', '9876543202', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(3, 'student002', 'student002@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Priya', 'Verma', '9876543203', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(4, 'student003', 'student003@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Rahul', 'Kumar', '9876543204', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(5, 'faculty001', 'faculty001@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'faculty', 'Dr. Neha', 'Singh', '9876543205', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(6, 'faculty002', 'faculty002@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'faculty', 'Prof. Anil', 'Gupta', '9876543206', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(7, 'staff001', 'staff001@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Mr. Sanjay', 'Mishra', '9876543207', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(8, 'alumni001', 'alumni001@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'alumni', 'Ms. Deepa', 'Reddy', '9876543208', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12'),
(9, 'student004', 'student004@psccollege.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Kiran', 'Patel', '9876543209', NULL, 1, '2025-10-03 03:32:12', '2025-10-03 03:32:12', '2025-10-03 03:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendar`
--
ALTER TABLE `academic_calendar`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `academic_year` (`academic_year`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`alumni_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `career_events`
--
ALTER TABLE `career_events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_date` (`event_date`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `database_audit_log`
--
ALTER TABLE `database_audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `table_name` (`table_name`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD PRIMARY KEY (`fee_structure_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `academic_year` (`academic_year`);

--
-- Indexes for table `library_books`
--
ALTER TABLE `library_books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `library_borrowings`
--
ALTER TABLE `library_borrowings`
  ADD PRIMARY KEY (`borrowing_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `due_date` (`due_date`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_fee_payments`
--
ALTER TABLE `student_fee_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `fee_structure_id` (`fee_structure_id`);

--
-- Indexes for table `student_results`
--
ALTER TABLE `student_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendar`
--
ALTER TABLE `academic_calendar`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `alumni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `career_events`
--
ALTER TABLE `career_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_schedule`
--
ALTER TABLE `course_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_audit_log`
--
ALTER TABLE `database_audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structures`
--
ALTER TABLE `fee_structures`
  MODIFY `fee_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `library_books`
--
ALTER TABLE `library_books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `library_borrowings`
--
ALTER TABLE `library_borrowings`
  MODIFY `borrowing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_fee_payments`
--
ALTER TABLE `student_fee_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_results`
--
ALTER TABLE `student_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD CONSTRAINT `course_materials_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD CONSTRAINT `course_schedule_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `database_audit_log`
--
ALTER TABLE `database_audit_log`
  ADD CONSTRAINT `database_audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `fee_structures`
--
ALTER TABLE `fee_structures`
  ADD CONSTRAINT `fee_structures_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `library_borrowings`
--
ALTER TABLE `library_borrowings`
  ADD CONSTRAINT `library_borrowings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `library_books` (`book_id`),
  ADD CONSTRAINT `library_borrowings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `student_fee_payments`
--
ALTER TABLE `student_fee_payments`
  ADD CONSTRAINT `student_fee_payments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `student_fee_payments_ibfk_2` FOREIGN KEY (`fee_structure_id`) REFERENCES `fee_structures` (`fee_structure_id`);

--
-- Constraints for table `student_results`
--
ALTER TABLE `student_results`
  ADD CONSTRAINT `student_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `student_results_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
