-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2021 at 01:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25
-- Author: Pham Quang Huy
-- Mail: pqhuy2@software.misa.com.vn

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phamhuy_misa_thithu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 1,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'ADMIN', 1, '2021-11-09 21:55:03', 1, 'avatar-default.jpg', '1997-01-01'),
(2, 'admin001', 'admin001@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Phạm Quang Huy', 1, '0000-00-00 00:00:00', 1, 'avatar-default.jpg', '1997-01-28');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `grade_id` int(10) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `grade_id`, `class_name`, `teacher_id`) VALUES
(1, 1, 'Khối Toán 001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(1) NOT NULL,
  `gender_detail` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_detail`) VALUES
(1, 'Chưa Xác Định'),
(2, 'Nam'),
(3, 'Nữ');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `detail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `detail`) VALUES
(1, 'Khối 1'),
(2, 'Khối 2'),
(3, 'Khối 3'),
(4, 'Khối 4'),
(5, 'Khối 5'),
(6, 'Khối 6'),
(7, 'Khối 7'),
(8, 'Khối 8'),
(9, 'Khối 9'),
(10, 'Khối 10'),
(11, 'Khối 11'),
(12, 'Khối 12');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `level_id` int(11) NOT NULL,
  `level_detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`level_id`, `level_detail`) VALUES
(1, 'Dễ'),
(2, 'Trung Bình'),
(3, 'Khó');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission` int(11) NOT NULL,
  `permission_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission`, `permission_detail`) VALUES
(1, 'Admin'),
(2, 'Giáo Viên'),
(3, 'Học Sinh');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `grade_id` int(10) NOT NULL,
  `unit` int(2) NOT NULL,
  `level_id` int(11) NOT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_a` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_b` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_c` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_d` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL DEFAULT 1,
  `sent_by` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`grade_id`, `unit`, `level_id`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`, `subject_id`, `sent_by`, `status_id`) VALUES
(1, 1, 1, '30 - 12 = ?', '10', '15', '18', '82', '18', 1, 1, 'Teacher01', 4),
(1, 1, 1, '5 + 7 = ?', '12', '13', '14', '11', '12', 2, 1, 'Teacher01', 4),
(1, 1, 1, '5 + 9 = ?', '13', '15', '17', '14', '14', 3, 1, 'Teacher01', 4),
(1, 1, 2, '2 x 1 = ?', '1', '2', '3', '4', '2', 4, 1, 'Teacher01', 4),
(1, 1, 2, '11 + 2 = ?', '15', '16', '13', '18', '13', 5, 1, 'Teacher01', 4),
(1, 1, 2, '18 + 5 = ?', '20', '21', '22', '23', '23', 6, 1, 'Teacher01', 4),
(1, 1, 3, '14 + 8 = ?', '20', '21', '22', '23', '22', 7, 1, 'Teacher01', 4),
(1, 1, 3, '13 - 3 = ?', '7', '8', '9', '10', '10', 8, 1, 'Teacher01', 4),
(1, 1, 3, '14 - 7 = ?', '7', '6', '5', '8', '7', 9, 1, 'Teacher01', 4),
(1, 2, 1, '10 - 8 = ?', '2', '3', '4', '5', '2', 10, 1, 'Teacher01', 4),
(1, 2, 1, '3 + 6 = ?', '7', '6', '9', '8', '9', 11, 1, 'Teacher01', 4),
(1, 2, 1, '5+10 ?', '15', '10', '5', '4', '15', 12, 1, 'Teacher01', 4),
(1, 2, 2, '2 x 7 = ?', '14', '16', '18', '12', '14', 13, 1, 'Teacher01', 4),
(1, 2, 2, '2 x 9 = ?', '14', '16', '18', '12', '18', 14, 1, 'Teacher01', 4),
(1, 2, 2, '3 x 7 = ?', '14', '16', '18', '21', '21', 15, 1, 'Teacher01', 4),
(1, 2, 3, '3 x 5 = ?', '14', '16', '15', '12', '15', 16, 1, 'Teacher01', 4),
(1, 2, 3, '4 x 10 = ?', '40', '4', '10', '1', '40', 17, 1, 'Teacher01', 4),
(1, 2, 3, '2 x 10 = ?', '14', '16', '18', '20', '20', 18, 1, 'Teacher01', 4),
(1, 2, 3, '10 + 20 = ?', '10', '20', '30', '03', '30', 19, 1, 'Teacher01', 4),
(1, 3, 1, '10 x 10 = ?', '10', '20', '100', '11', '100', 20, 1, 'Teacher01', 4),
(1, 3, 1, '2 x 5 = ?', '14', '16', '10', '12', '10', 21, 1, 'Teacher01', 4),
(1, 3, 1, '4 x 7 =?', '27', '28', '29', '30', '28', 22, 1, 'Teacher01', 4),
(1, 3, 2, '10 * 0 = ?', '10', '0', '1', '11', '0', 23, 1, 'Teacher01', 4),
(1, 3, 2, '4 x 5 =?', '27', '28', '29', '20', '20', 24, 1, 'Teacher01', 4),
(1, 3, 2, '5 x 8 =?', '37', '38', '39', '40', '40', 25, 1, 'Teacher01', 4),
(1, 3, 3, '5 x 5 =?', '27', '28', '25', '30', '25', 26, 1, 'Teacher01', 4),
(1, 3, 3, '7 x 9 = ?', '61', '63', '65', '67', '63', 27, 1, 'Teacher01', 4),
(1, 3, 3, '7 x 7 = ?', '41', '43', '45', '49', '49', 28, 1, 'Teacher01', 4),
(1, 3, 3, '7 x 8 = ?', '61', '63', '56', '67', '56', 29, 1, 'Teacher01', 4),
(1, 4, 1, '9 x 9 = ?', '81', '63', '65', '67', '81', 30, 1, 'Teacher01', 4),
(1, 4, 1, '6 x 9 = ?', '61', '63', '65', '54', '54', 31, 1, 'Teacher01', 4),
(1, 4, 1, '21 : 3 = ?', '5', '6', '7', '8', '7', 32, 1, 'Teacher01', 4),
(1, 4, 2, '24 : 8 = ?', '1', '2', '3', '4', '3', 33, 1, 'Teacher01', 4),
(1, 4, 2, '27 : 3 = ?', '6', '7', '8', '9', '9', 34, 1, 'Teacher01', 1),
(1, 4, 2, '32 : 8 = ?', '1', '2', '3', '4', '4', 35, 1, 'Teacher01', 4),
(1, 4, 1, '25 : 5 = ?', '5', '2', '3', '4', '5', 36, 1, 'Teacher01', 4),
(1, 4, 1, '42 : 7 = ?', '6', '5', '3', '4', '6', 37, 1, 'Teacher01', 4),
(1, 4, 2, '56 : 8 = ?', '8', '7', '3', '4', '7', 38, 1, 'Teacher01', 4),
(1, 4, 2, '81 : 9 = ?', '7', '8', '9', '81', '9', 39, 1, 'Teacher01', 4),
(1, 4, 3, '40 : 8 = ?', '5', '2', '3', '4', '5', 40, 1, 'Teacher01', 4),
(1, 4, 3, '18 : 9 = ?', '1', '2', '3', '4', '2', 41, 1, 'Teacher01', 4),
(12, 12, 3, '<p>NgOninit Trong Angular dùng để làm gì</p>', '<p>Khởi tạo directive / component sau khi Angular hiển thị các thuộc tính ràng buộc dữ liệu và đặt các thuộc tính đầu vào của directive / component. Được gọi một lần, sau ngOnChanges() đầu tiên.</p>', '<p>Phát hiện và hành động theo những thay đổi mà Angular không thể hoặc sẽ không tự mình phát hiện.</p>', '<p>Thự thi sau khi Angular đã kiểm tra nội dung bên ngoài đã được đưa vào view của component. Được gọi sau ngAfterContentInit() và mọi ngDoCheck() tiếp theo.</p>', '<p>Thự thi sau khi Angular khởi tạo các view của component và các view con / view mà directive được đưa vào. Được gọi một lần sau ngAfterContentChecked() đầu tiên.</p>', '<p>Khởi tạo directive / component sau khi Angular hiển thị các thuộc tính ràng buộc dữ liệu và đặt các thuộc tính đầu vào của directive / component. Được gọi một lần, sau ngOnChanges() đầu tiên.</p>', 12, 1, 'Teacher01', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quest_of_test`
--

CREATE TABLE `quest_of_test` (
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quest_of_test`
--

INSERT INTO `quest_of_test` (`test_code`, `question_id`, `timest`) VALUES
(124158, 4, '2021-11-05 10:07:39'),
(124158, 5, '2021-11-05 10:07:39'),
(124158, 6, '2021-11-05 10:07:39'),
(197949, 3, '2021-11-09 00:45:35'),
(212063, 4, '2021-11-09 00:46:09'),
(258629, 3, '2021-11-08 15:01:25'),
(258629, 7, '2021-11-08 15:01:25'),
(258629, 9, '2021-11-08 15:01:25'),
(258629, 10, '2021-11-08 15:01:25'),
(258629, 12, '2021-11-08 15:01:25'),
(562834, 3, '2021-11-05 09:41:38'),
(977537, 4, '2021-11-12 06:42:05'),
(977537, 5, '2021-11-12 06:42:05'),
(977537, 11, '2021-11-12 06:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `score_number` varchar(10) DEFAULT NULL,
  `score_detail` varchar(50) NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`student_id`, `test_code`, `score_number`, `score_detail`, `completion_time`) VALUES
(2, 197949, '10', '1/1', '2021-11-13 21:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(1) NOT NULL,
  `detail` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `detail`) VALUES
(1, 'Mở'),
(2, 'Đóng'),
(3, 'Chờ Duyệt'),
(4, 'Đã Duyệt'),
(5, 'Cho Phép Xem Đáp Án'),
(6, 'Kết Thúc'),
(7, 'Ẩn');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 3,
  `class_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `doing_exam` int(11) DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `time_remaining` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `username`, `email`, `password`, `name`, `permission`, `class_id`, `last_login`, `gender_id`, `avatar`, `birthday`, `doing_exam`, `starting_time`, `time_remaining`) VALUES
(2, 'student001', 'student001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'student 001', 3, 1, '2021-11-13 21:59:58', 1, 'avatar-default.jpg', '2021-10-20', NULL, NULL, NULL),
(3, 'student002', 'student002@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'student 002', 3, 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '1997-01-30', NULL, NULL, NULL),
(1, '2017HS1', 'example1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Phúc An', 3, 1, '2019-02-21 09:22:31', 2, 'avatar-default.jpg', '2008-01-25', NULL, NULL, NULL),
(2, '2017HS2', 'example2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lều Tuấn Anh', 3, 1, '2018-11-15 19:37:31', 1, 'avatar-default.jpg', '2008-09-07', NULL, NULL, NULL),
(3, '2017HS3', 'example3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Văn Bội', 3, 1, '2018-11-16 08:50:02', 1, 'avatar-default.jpg', '2008-12-01', NULL, NULL, NULL),
(4, '2017HS4', 'example4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Khánh Duy', 3, 1, '2018-09-20 04:19:27', 1, 'avatar-default.jpg', '2008-05-10', NULL, NULL, NULL),
(5, '2017HS5', 'example5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Thành Đạt', 3, 1, '2018-09-19 04:09:18', 1, 'avatar-default.jpg', '2008-05-03', NULL, NULL, NULL),
(6, '2017HS6', 'example6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Quang Điện', 3, 1, '2018-09-24 06:13:23', 1, 'avatar-default.jpg', '2008-10-10', NULL, NULL, NULL),
(7, '2017HS7', 'example7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thị Diệu Hằng', 3, 1, '2018-09-26 05:17:17', 1, 'avatar-default.jpg', '2008-02-03', NULL, NULL, NULL),
(8, '2017HS8', 'example8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Khánh Hoàng', 3, 1, '2018-09-18 06:17:12', 1, 'avatar-default.jpg', '2008-01-01', NULL, NULL, NULL),
(9, '2017HS9', 'example9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Khánh Linh', 3, 1, '2018-09-18 05:10:10', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(10, '2017HS10', 'example10@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Trần Khôi', 3, 1, '2018-09-28 06:17:28', 1, 'avatar-default.jpg', '2008-04-06', NULL, NULL, NULL),
(11, '2017HS11', 'example11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Khánh Ly', 3, 1, '2018-09-20 03:13:13', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(12, '2017HS12', 'example12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Phương Mai', 3, 1, '2018-09-20 09:13:13', 1, 'avatar-default.jpg', '2008-01-06', NULL, NULL, NULL),
(13, '2017HS13', 'example13@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đỗ Thị Mùi', 3, 1, '2018-09-20 03:07:11', 1, 'avatar-default.jpg', '2008-09-13', NULL, NULL, NULL),
(14, '2017HS14', 'example14@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Kim Oanh', 3, 1, '2018-09-20 10:23:16', 1, 'avatar-default.jpg', '2008-10-30', NULL, NULL, NULL),
(15, '2017HS15', 'example15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Kiều Oanh', 3, 1, '2018-09-15 00:00:00', 1, 'avatar-default.jpg', '2008-11-20', NULL, NULL, NULL),
(16, '2017HS16', 'example16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị Hà', 3, 1, '2018-09-22 08:17:14', 1, 'avatar-default.jpg', '2008-03-26', NULL, NULL, NULL),
(17, '2017HS17', 'example17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị G', 3, 1, '2018-09-14 06:15:15', 1, 'avatar-default.jpg', '2008-01-12', NULL, NULL, NULL),
(18, '2017HS18', 'example18@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị H', 3, 1, '2018-09-21 10:20:11', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(19, '2017HS19', 'example19@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Khánh Ly', 3, 1, '2018-09-20 06:14:11', 1, 'avatar-default.jpg', '2008-06-06', NULL, NULL, NULL),
(20, '2017HS20', 'example20@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Huy Hoàng', 3, 1, '2018-09-28 13:12:12', 1, 'avatar-default.jpg', '2008-01-02', NULL, NULL, NULL),
(21, '2017HS21', 'example21@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Văn Thịnh', 3, 1, '2018-01-26 02:06:09', 1, 'avatar-default.jpg', '2008-01-26', NULL, NULL, NULL),
(22, '2017HS22', 'example22@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Thi', 3, 1, '2018-01-26 02:06:09', 1, 'avatar-default.jpg', '2008-01-26', NULL, NULL, NULL),
(23, '2017HS23', 'example23@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Nguyễn Thị Thu', 3, 1, '2018-11-16 10:48:33', 1, 'avatar-default.jpg', '2008-01-26', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_test_detail`
--

CREATE TABLE `student_test_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_b` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_c` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_d` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_answer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_test_detail`
--

INSERT INTO `student_test_detail` (`ID`, `student_id`, `test_code`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `student_answer`, `timest`) VALUES
(625995385, 2, 197949, 3, '<p>k</p>', '<p>l</p>', '<p>j</p>', '<p>h</p>', '<p>k</p>', '2021-11-13 14:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_detail`) VALUES
(1, 'Toán'),
(2, 'Văn'),
(3, 'Anh'),
(4, 'Sinh'),
(5, 'Sử'),
(6, 'Địa'),
(7, 'Giáo dục công dân');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 2,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'teacher001', 'teacher001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'teacher 001', 2, '2021-11-08 14:27:32', 1, 'avatar-default.jpg', '2000-12-14'),
(2, 'teacher002', 'teacher002@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'giáo viên 2', 2, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '1997-01-29'),
(3, 'teacher003', 'teacher003@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Phương Anh', 2, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2000-12-14');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_code` int(11) NOT NULL,
  `test_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `grade_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `time_to_do` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_code`, `test_name`, `password`, `subject_id`, `grade_id`, `total_questions`, `time_to_do`, `note`, `status_id`, `timest`) VALUES
(124158, 'Thi thử Hóa THPT	', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 3, 1, '', 5, '2021-11-05 10:08:47'),
(197949, 'f', '', 1, 12, 1, 1, '', 5, '2021-11-09 00:46:46'),
(212063, 'Đề thi test 001', '', 1, 1, 1, 1, 'không nhé', 5, '2021-11-09 00:46:49'),
(258629, 'teacher001', 'e10adc3949ba59abbe56e057f20f883e', 1, 12, 5, 1, 'Các cháu làm bài nhanh lên nhé', 5, '2021-11-08 15:02:18'),
(562834, 'Thi thử Toán THPT', 'e10adc3949ba59abbe56e057f20f883e', 1, 12, 1, 10, 'KHÔNG', 5, '2021-11-05 09:47:26'),
(977537, 'abc', '', 1, 1, 3, 1, '', 5, '2021-11-12 06:43:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n4` (`permission`),
  ADD KEY `admins_gender_id` (`gender_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_name` (`class_name`),
  ADD KEY `n7` (`teacher_id`),
  ADD KEY `k4` (`grade_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `k9` (`grade_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `subjects_key` (`subject_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD PRIMARY KEY (`test_code`,`question_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`student_id`,`test_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n9` (`class_id`),
  ADD KEY `n11` (`permission`),
  ADD KEY `students_gender_id` (`gender_id`);

--
-- Indexes for table `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD PRIMARY KEY (`student_id`,`test_code`,`question_id`),
  ADD KEY `fk4` (`test_code`),
  ADD KEY `fk6` (`question_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n2` (`permission`),
  ADD KEY `teachers_gender_id` (`gender_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_code`),
  ADD KEY `fk1` (`subject_id`),
  ADD KEY `fk2` (`status_id`),
  ADD KEY `grade_id` (`grade_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=977538;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `n4` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `k9` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `subjects_key` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD CONSTRAINT `quest_of_test_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `quest_of_test_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `n11` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `n9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Constraints for table `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `n2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `teachers_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
