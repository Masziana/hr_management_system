-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 09:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendanceID` int(11) NOT NULL,
  `employeeID` varchar(10) DEFAULT NULL,
  `attendanceDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendanceID`, `employeeID`, `attendanceDate`, `status`) VALUES
(1, 'emp0001', '2025-06-01', 'Present'),
(3, 'emp0003', '2025-06-01', 'Absent'),
(5, 'emp0005', '2025-06-01', 'Absent'),
(7, 'emp0002', '2025-06-02', 'Absent'),
(8, 'emp0003', '2025-06-02', 'On Leave'),
(23, 'emp0001', '2025-06-14', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `depName` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `depName`, `description`) VALUES
(1, 'IT', 'Handles all technology-related tasks.'),
(2, 'Human Resource', 'Manages employee relations and hiring.'),
(3, 'Administration', 'Responsible for office operations.'),
(4, 'Finance', 'Manages financial records and payroll.'),
(5, 'Marketing', 'Promotes the company\'s products.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` varchar(10) NOT NULL,
  `empName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNo` varchar(15) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `empName`, `email`, `phoneNo`, `jobTitle`, `joinDate`, `departmentID`) VALUES
('emp0001', 'Ali bin Ahmad', 'ali.ahmad@example.com', '0112233445', 'Software Engineer', '2023-01-16', 1),
('emp0002', 'Farah binti Ismail', 'farah.ismail@example.com', '0123344556', 'HR Executive', '2022-10-01', 2),
('emp0003', 'John Tan', 'john.tan@example.com', '0178899771', 'System Analyst', '2023-06-10', 1),
('emp0005', 'Michael Chong', 'michael.chong@example.com', '0136655443', 'UI/UX Designer', '2023-08-25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `leaveID` int(11) NOT NULL,
  `employeeID` varchar(10) DEFAULT NULL,
  `leaveType` varchar(50) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`leaveID`, `employeeID`, `leaveType`, `startDate`, `endDate`, `reason`, `status`) VALUES
(8, 'emp0003', 'Emergency Leave', '2025-06-08', '2025-06-08', 'Kids sick', 'Approved'),
(16, 'emp0003', 'Medical', '2025-06-10', '2025-06-12', 'sick', 'Approved'),
(17, 'emp0003', 'Medical', '2025-06-10', '2025-06-11', 'sick', 'Rejected'),
(25, 'emp0001', 'Annual', '2025-06-10', '2025-06-11', 'sick', 'Rejected'),
(26, 'emp0001', 'Medical', '2025-06-12', '2025-06-13', 'sick', 'Rejected'),
(27, 'emp0001', 'Annual', '2025-06-12', '2025-06-13', 'sick', 'Pending'),
(28, 'emp0001', 'Medical', '2025-06-12', '2025-06-14', 'sick', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `username`, `password`, `role`) VALUES
(1, 'emp0001', 'ali', '1234', 'staff'),
(2, 'EMP0002', 'abu', '5678', 'manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendanceID`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `departmentID` (`departmentID`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`leaveID`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `leaveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE SET NULL;

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
