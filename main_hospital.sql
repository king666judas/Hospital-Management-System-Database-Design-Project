-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2024 at 12:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appointments`
--

CREATE TABLE `Appointments` (
  `AppointmentID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Status` enum('Scheduled','Completed','Cancelled') NOT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `PatientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Appointments`
--

INSERT INTO `Appointments` (`AppointmentID`, `Date`, `Time`, `Status`, `DoctorID`, `PatientID`) VALUES
(16, '2024-12-20', '10:00:00', 'Scheduled', 1, 1),
(17, '2024-12-21', '11:00:00', 'Completed', 2, 2),
(18, '2024-12-22', '12:00:00', 'Cancelled', 3, 3),
(19, '2024-12-23', '09:00:00', 'Scheduled', 4, 4),
(20, '2024-12-24', '14:00:00', 'Scheduled', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE `Departments` (
  `DepartmentID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`DepartmentID`, `Name`, `Location`) VALUES
(1, 'Cardiology', 'Building A'),
(2, 'Neurology', 'Building B'),
(3, 'Orthopedics', 'Building C'),
(4, 'Pediatrics', 'Building D'),
(5, 'General Medicine', 'Building E'),
(6, 'Cardiology', 'Building A'),
(7, 'Neurology', 'Building B'),
(8, 'Orthopedics', 'Building C'),
(9, 'Pediatrics', 'Building D'),
(10, 'General Medicine', 'Building E'),
(11, 'Cardiology', 'Building A'),
(12, 'Neurology', 'Building B'),
(13, 'Orthopedics', 'Building C'),
(14, 'Pediatrics', 'Building D'),
(15, 'General Medicine', 'Building E');

-- --------------------------------------------------------

--
-- Table structure for table `Doctors`
--

CREATE TABLE `Doctors` (
  `DoctorID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Specialization` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Doctors`
--

INSERT INTO `Doctors` (`DoctorID`, `Name`, `Specialization`, `Phone`, `DepartmentID`) VALUES
(1, 'Dr. John Smith', 'Cardiologist', '1234567890', 1),
(2, 'Dr. Emma Brown', 'Neurologist', '0987654321', 2),
(3, 'Dr. Liam Johnson', 'Orthopedic', '1122334455', 3),
(4, 'Dr. Ava Davis', 'Pediatrician', '6677889900', 4),
(5, 'Dr. Noah Wilson', 'General Physician', '5566778899', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `drsmithappointments`
-- (See below for the actual view)
--
CREATE TABLE `drsmithappointments` (
`AppointmentID` int(11)
,`Date` date
,`Time` time
,`Status` enum('Scheduled','Completed','Cancelled')
,`PatientName` varchar(100)
,`PatientPhone` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `PatientID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `Phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`PatientID`, `Name`, `Age`, `Gender`, `Phone`) VALUES
(1, 'Alice Green', 30, 'Female', '9998887776'),
(2, 'Bob White', 45, 'Male', '8887776665'),
(3, 'Charlie Black', 29, 'Male', '7776665554'),
(4, 'Diana Gray', 12, 'Female', '6665554443'),
(5, 'Eve Blue', 34, 'Female', '5554443332');

-- --------------------------------------------------------

--
-- Structure for view `drsmithappointments`
--
DROP TABLE IF EXISTS `drsmithappointments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `drsmithappointments`  AS SELECT `a`.`AppointmentID` AS `AppointmentID`, `a`.`Date` AS `Date`, `a`.`Time` AS `Time`, `a`.`Status` AS `Status`, `p`.`Name` AS `PatientName`, `p`.`Phone` AS `PatientPhone` FROM ((`appointments` `a` join `doctors` `d` on(`a`.`DoctorID` = `d`.`DoctorID`)) join `patients` `p` on(`a`.`PatientID` = `p`.`PatientID`)) WHERE `d`.`Name` = 'Dr. John Smith' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appointments`
--
ALTER TABLE `Appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`PatientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Appointments`
--
ALTER TABLE `Appointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Departments`
--
ALTER TABLE `Departments`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appointments`
--
ALTER TABLE `Appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors` (`DoctorID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `Patients` (`PatientID`);

--
-- Constraints for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `Departments` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
