-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 07:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_doctor`
--

CREATE TABLE `appointment_doctor` (
  `appointmentId` int(10) NOT NULL,
  `patientId` char(10) CHARACTER SET latin1 NOT NULL,
  `dueDate` date NOT NULL,
  `scheduleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_doctor`
--

INSERT INTO `appointment_doctor` (`appointmentId`, `patientId`, `dueDate`, `scheduleId`) VALUES
(63, '970313664V', '2020-05-05', 2),
(64, '970313664V', '2020-06-10', 1),
(65, '980313664V', '2020-05-08', 3),
(68, '970313664V', '2020-05-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_scheduling`
--

CREATE TABLE `appointment_scheduling` (
  `Schedule_id` int(11) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  `D_id` int(11) NOT NULL,
  `H_id` int(11) NOT NULL,
  `App_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_scheduling`
--

INSERT INTO `appointment_scheduling` (`Schedule_id`, `Date`, `Start_Time`, `End_Time`, `D_id`, `H_id`, `App_id`) VALUES
(1, 'Sunday', '08:00:00', '10:00:00', 1, 1, 1),
(2, 'Monday', '09:30:00', '12:00:00', 2, 2, 1),
(3, 'Tuesday', '12:00:00', '17:00:00', 3, 4, 2),
(4, 'wednesday', '10:00:00', '12:00:00', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_type`
--

CREATE TABLE `appointment_type` (
  `appointment_Id` int(11) NOT NULL,
  `Appointment_Type` varchar(15) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_type`
--

INSERT INTO `appointment_type` (`appointment_Id`, `Appointment_Type`) VALUES
(1, 'eye'),
(2, 'skin');

-- --------------------------------------------------------

--
-- Table structure for table `authuser`
--

CREATE TABLE `authuser` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authuser`
--

INSERT INTO `authuser` (`id`, `username`, `password`, `user_role`) VALUES
(1, 'admin ', 'admin', 'admin'),
(2, 'saumya ', '123', 'patient'),
(3, 'janitha ', '123', 'admin'),
(4, 'praba ', '123', 'admin'),
(5, 'uvini ', '123', 'doctors'),
(7, 'cha ', '123', 'doctors');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int(5) NOT NULL,
  `DoctorName` varchar(100) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `MobileNo` int(10) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Specialization` varchar(250) NOT NULL,
  `HospitalName` varchar(200) NOT NULL,
  `DepartmentName` varchar(200) NOT NULL,
  `Status` varchar(15) NOT NULL DEFAULT 'Accepted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `DoctorName`, `NIC`, `Address`, `MobileNo`, `Email`, `Specialization`, `HospitalName`, `DepartmentName`, `Status`) VALUES
(1, 'Ariana Grande', '948575962V', 'Malabe', 774589622, 'araiana@gmail.com', 'Eye', 'National Hospital of Sri Lanka', 'Eye', 'Accepted'),
(2, 'Taylor Swift', '894512635V', 'Colombo', 774518544, 'taytay@gmail.com', 'Eye', 'Royal Hospital', 'Eye', 'Accepted'),
(3, 'Harry Styles', '961254129V', 'Colombo 2', 771256322, 'harry@gmail.com', 'ENT', 'Nawaloka Hospitals PLC', 'ENT', 'Accepted'),
(5, 'Chandler Bing', '604712599V', 'Kaduwela', 724589651, 'chandler@gmail.com', 'Eye', 'Golden Key Eye Hospital', 'Eye', 'Accepted'),
(6, 'Chainsmokers', '884517525V', 'Kaduwala', 774582144, 'chan@gmail.com', 'Eye', 'Nawaloka Hospital', 'Eye', 'Accepted'),
(7, 'Chainsmokers1', '884517525V', 'Kaduwala', 774582144, 'chan@gmail.com', 'Eye', 'Nawaloka Hospital', 'Eye', 'Accepted'),
(8, 'Chainsmokers2', '884517525V', 'Kaduwala', 774582144, 'chan@gmail.com', 'Eye', 'Nawaloka Hospital', 'Eye', 'Accepted'),
(9, 'Chainsmokers3', '884517525V', 'Kaduwala', 774582144, 'chan@gmail.com', 'Eye', 'Nawaloka Hospital', 'Eye', 'Accepted'),
(10, 'Chainsmokers4', '884517525V', 'Kaduwala', 774582144, 'chan@gmail.com', 'Eye', 'Nawaloka Hospital', 'Eye', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hid` int(11) NOT NULL,
  `hname` varchar(15) CHARACTER SET latin1 NOT NULL,
  `docid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hid`, `hname`, `docid`) VALUES
(1, 'lanka hospitals', 1),
(2, 'kegalle', 1),
(3, 'hemas', 3),
(4, 'colombo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `patientdetails`
--

CREATE TABLE `patientdetails` (
  `id` int(11) NOT NULL,
  `patientID` char(10) NOT NULL,
  `firstName` char(10) NOT NULL,
  `middleName` char(50) NOT NULL,
  `lastName` char(50) NOT NULL,
  `email` char(200) NOT NULL,
  `sex` char(10) NOT NULL,
  `dob` date NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `contactNumber` int(10) NOT NULL,
  `maritalStatus` char(10) NOT NULL,
  `streetAddL1` char(50) NOT NULL,
  `streetAddL2` char(50) NOT NULL,
  `city` char(50) NOT NULL,
  `state` char(50) NOT NULL,
  `postalCode` int(10) NOT NULL,
  `password` char(1) NOT NULL,
  `emergencyCNanme` char(50) DEFAULT NULL,
  `emergencyCrelationship` char(20) DEFAULT NULL,
  `emergencynumber` int(10) DEFAULT NULL,
  `takeMedication` tinyint(1) DEFAULT NULL,
  `currentMedication` varchar(300) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientdetails`
--

INSERT INTO `patientdetails` (`id`, `patientID`, `firstName`, `middleName`, `lastName`, `email`, `sex`, `dob`, `height`, `weight`, `contactNumber`, `maritalStatus`, `streetAddL1`, `streetAddL2`, `city`, `state`, `postalCode`, `password`, `emergencyCNanme`, `emergencyCrelationship`, `emergencynumber`, `takeMedication`, `currentMedication`, `age`) VALUES
(1, '970313664V', 'Hasith', 'Pramodya', 'Hettiarachchi', 'hasithpramodya@gmail.com', 'Male', '2020-04-05', 5.8, 74, 716547480, 'Single', 'Kaluthara', '', 'Kaluthara south', 'Western', 12000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '980313664V', 'Odhara', 'Viranjalee', 'Kodikara', 'odharakodokara@gmail.com', 'Female', '2020-04-12', 5.4, 60, 716547480, 'Singla (So', 'Peradeniya', 'Kandy', '', '', 12000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '970313664', 'Hasith', 'Pramodya', 'Hettiarachchi', 'pramodyahettiarachchi@gmail.com', 'Male', '2020-04-02', 68, 5.8, 716547480, 'Single', 'Isuru Uyana', '4th', 'Kaluthara', 'Western', 12000, 's', 'Nandana', 'Father', 772458458, 0, 'gfdbfbf', NULL),
(6, '970313688', 'Update999', 'New Name 9', 'Update decs 9', 'gdfgdg9', 'male', '1997-04-02', 56, 6.8, 255545, 'singl', 'dgdgsd', 'fgsfg', 'dfgsdgd', 'gdgd', 2424, 's', 'Nandana', 'Father', 772458458, 0, 'gfdbfbf', 23),
(9, '97055565V', 'Hasith', 'Pramodya', 'Hettiarachchi', 'pramodyahettiarachchi@gmail.com', 'Male', '1997-04-02', 68, 5.8, 716547480, 'Single', 'Isuru Uyana', '4th', 'Kaluthara', 'Western', 12000, 's', 'Nandana', 'Father', 772458458, 0, 'gfdbfbf', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_doctor`
--
ALTER TABLE `appointment_doctor`
  ADD PRIMARY KEY (`appointmentId`),
  ADD KEY `appointment_doctor_ibfk_1` (`scheduleId`),
  ADD KEY `appointment_doctor_ibfk_2` (`patientId`);

--
-- Indexes for table `appointment_scheduling`
--
ALTER TABLE `appointment_scheduling`
  ADD PRIMARY KEY (`Schedule_id`),
  ADD KEY `appointment_scheduling_ibfk_2` (`H_id`),
  ADD KEY `appointment_scheduling_ibfk_3` (`App_id`),
  ADD KEY `appointment_scheduling_ibfk_1` (`D_id`);

--
-- Indexes for table `appointment_type`
--
ALTER TABLE `appointment_type`
  ADD PRIMARY KEY (`appointment_Id`);

--
-- Indexes for table `authuser`
--
ALTER TABLE `authuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hid`),
  ADD KEY `hospital_ibfk_1` (`docid`);

--
-- Indexes for table `patientdetails`
--
ALTER TABLE `patientdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patientID` (`patientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_doctor`
--
ALTER TABLE `appointment_doctor`
  MODIFY `appointmentId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `appointment_scheduling`
--
ALTER TABLE `appointment_scheduling`
  MODIFY `Schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appointment_type`
--
ALTER TABLE `appointment_type`
  MODIFY `appointment_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `DoctorID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patientdetails`
--
ALTER TABLE `patientdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_doctor`
--
ALTER TABLE `appointment_doctor`
  ADD CONSTRAINT `appointment_doctor_ibfk_1` FOREIGN KEY (`scheduleId`) REFERENCES `appointment_scheduling` (`Schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_doctor_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patientdetails` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_scheduling`
--
ALTER TABLE `appointment_scheduling`
  ADD CONSTRAINT `appointment_scheduling_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `doctors` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_scheduling_ibfk_2` FOREIGN KEY (`H_id`) REFERENCES `hospital` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_scheduling_ibfk_3` FOREIGN KEY (`App_id`) REFERENCES `appointment_type` (`appointment_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`docid`) REFERENCES `doctor` (`did`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
