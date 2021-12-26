-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 26, 2021 at 03:06 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gofux`
--

-- --------------------------------------------------------

--
-- Table structure for table `actress`
--

CREATE TABLE `actress` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `firstpage` tinyint(4) NOT NULL,
  `actressname` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `member` tinyint(1) NOT NULL,
  `birthday` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `height` int(11) NOT NULL,
  `cup` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `vdolink` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `actress`
--

INSERT INTO `actress` (`id`, `orderid`, `firstpage`, `actressname`, `member`, `birthday`, `height`, `cup`, `size`, `vdolink`) VALUES
(1, 100, 1, 'Yua Mikami', 0, '16-08-1993', 159, 'F', '33-23-36', '{\"m01\": \"1235\", \"m02\": \"1444\", \"m03\": \"1460\"}'),
(2, 200, 1, 'Anzai Rara', 0, '11-01-1994', 163, 'D', '34-24-36', '{\"m3\": \"1460\", \"m01\": \"1235\", \"m02\": \"1444\"}'),
(3, 300, 1, 'Aika Yumeno', 0, '23-09-1994', 172, 'D', '34-24-36', '{\"m01\": \"1234\", \"m02\": \"1455\", \"m03\": \"8874\"}'),
(4, 400, 1, 'Amin Nina', 0, '4-4-1970', 165, 'D', '36-24-35', '{\"m01\": \"1234\", \"m02\": \"4575\", \"m03\": \"8456\"}'),
(5, 500, 1, 'Ichika Hoshimiya', 1, '6-6-1980', 163, 'F', '34-26-38', '{\"m01\": \"12654\", \"m02\": \"74565\", \"m03\": \"78456\"}');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `at_id` int(11) NOT NULL,
  `at_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `at_folder` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `statview` int(11) NOT NULL,
  `at_weight` int(11) NOT NULL,
  `at_target` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=offline/1=online',
  `at_timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`at_id`, `at_title`, `at_folder`, `statview`, `at_weight`, `at_target`, `status`, `at_timestamp`) VALUES
(1, 'ทดสอบ', 'a001', 0, 100, 'www.finnbet.com', 1, 2147483647),
(2, 'หวยเปลี่ยนโลก', 'a002', 0, 25, 'www.google.com', 1, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `adsstat`
--

CREATE TABLE `adsstat` (
  `id` int(11) NOT NULL,
  `at_id` int(11) NOT NULL,
  `weekno` int(11) NOT NULL COMMENT 'start week1 = 1/9/2564',
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adsstat`
--

INSERT INTO `adsstat` (`id`, `at_id`, `weekno`, `view`) VALUES
(1, 1, 1, 35),
(2, 1, 2, 70);

-- --------------------------------------------------------

--
-- Table structure for table `cartoon`
--

CREATE TABLE `cartoon` (
  `ct_id` int(11) NOT NULL,
  `ct_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ct_folder` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `statview` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=offline, 1= online',
  `ct_timestamp` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cartoon`
--

INSERT INTO `cartoon` (`ct_id`, `ct_title`, `ct_folder`, `statview`, `status`, `ct_timestamp`) VALUES
(3, 'เพราะเธอเป็นของเรา', 'c01', 25, 1, '1630955817016'),
(6, 'หมอนวดหัตถ์เทวะ', 'c02', 20, 1, '1631025790364'),
(7, 'test88x2', 'c03', 60, 1, '1631135438450'),
(8, 'คุณแม่ทางเลือก', 'c04', 10, 1, '1631135577993'),
(9, 'แค่เธอพูดว่าลาออก', 'c05', 0, 1, '1631135545448'),
(10, 'คุณแม่ทางเลือก', 'c06', 0, 1, '1631135703672'),
(11, 'ความลับของพี่สาว', 'c07', 0, 1, '1631135721728'),
(12, 'อยากได้ก็ต้องยั่ว', 'c08', 0, 1, '1631135738296'),
(13, 'สี่สาวพลังเวท', 'c10', 0, 1, '1631135812657'),
(14, 'สี่สาวน่ารัก', 'c09', 0, 1, '1631135825903'),
(15, 'เปียกหมดแล้ว', 'c11', 0, 0, '1631135883732'),
(16, 'รักษาอาการให้น้องสาว', 'c12', 0, 0, '1631176874807'),
(17, 'ผมโดนขย่มโดยน้องสาว', 'c13', 0, 0, '1631176889476'),
(18, 'ฤดูร้อนกับกวางน้อย', 'c14', 0, 0, '1631176900745'),
(19, 'ดาบอสูรสุดเสียว', 'c15', 0, 0, '1631176913627'),
(20, 'โจรสลัดสาวปาร์ตี้เสียว', 'c16', 0, 0, '1631176995384'),
(21, 'ลับสุดยอด', 'c17', 0, 0, '1631177003735'),
(22, 'สถานการณ์มันพาไป', 'c18', 0, 0, '1631177162929'),
(23, 'ถ้าได้ลองกลัวติดใจ', 'c19', 0, 0, '1631177214152'),
(24, 'ทนต่อไม่ไหวแล้ว', 'c20', 0, 0, '1631177255385'),
(25, 'คืนนี้เธออยากได้ใคร #1', 'c21', 0, 0, '1631177453553'),
(26, 'คืนนี้เธออยากได้ใคร #2', 'c22', 0, 0, '1631177458316'),
(27, 'คืนนี้เธออยากได้ใคร #3', 'c23', 0, 0, '1631177464929'),
(28, 'คืนนี้เธออยากได้ใคร #4', 'c24', 0, 0, '1631177469721'),
(29, 'มันผิดศีลธรรมนะคะ', 'c25', 0, 0, '1631177483506'),
(30, 'หนูทำดี พี่มีรางวัลให้', 'c26', 0, 0, '1631177734005'),
(31, 'เพื่อนลูก เล่นฉันซะแล้ว', 'c27', 0, 0, '1631177749070'),
(32, 'จัดไปหนึ่งดอกกับลูกศิษย์', 'c28', 0, 0, '1631177764920'),
(33, 'เมื่อพาแฟนพาบ้าน', 'c29', 0, 0, '1631177774784'),
(34, 'ได้เสียวที่ห้องเพื่อน', 'c30', 0, 0, '1631177784974'),
(35, 'ได้แอ้มกับแม่มดสาว', 'c31', 0, 0, '1631177794633'),
(36, 'ทดสอบระบบ', 'c32', 0, 0, '1632985407782');

-- --------------------------------------------------------

--
-- Table structure for table `cartoonstat`
--

CREATE TABLE `cartoonstat` (
  `id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `weekno` int(11) NOT NULL COMMENT 'start week1 = 1/9/2564',
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cartoonstat`
--

INSERT INTO `cartoonstat` (`id`, `ct_id`, `weekno`, `view`) VALUES
(1, 3, 1, 25),
(2, 3, 2, 60);

-- --------------------------------------------------------

--
-- Table structure for table `moviecat`
--

CREATE TABLE `moviecat` (
  `mc_id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `catname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=offline/1online'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `moviecat`
--

INSERT INTO `moviecat` (`mc_id`, `orderid`, `catname`, `status`) VALUES
(1, 100, 'จีน', 0),
(5, 500, 'ไทย', 1),
(6, 400, 'ลาว', 0),
(7, 101, 'พม่า', 1),
(8, 401, 'อินเดีย', 1);

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `pt_id` int(11) NOT NULL,
  `pt_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_mode_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=offline / 1 = online',
  `statview` int(11) NOT NULL DEFAULT '0',
  `pt_folder` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_warning` int(11) NOT NULL DEFAULT '0' COMMENT '0ไม่มีเตือน 1 มีเตือน',
  `pt_access` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pt_timestamp` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `picture`
--

INSERT INTO `picture` (`pt_id`, `pt_title`, `pt_mode_id`, `status`, `statview`, `pt_folder`, `pt_warning`, `pt_access`, `pt_timestamp`) VALUES
(4, 'DJ Miu', 3, 1, 0, 'p001', 0, 'ทั่วไป', '1632058266055'),
(5, 'Eunkyung Oh', 3, 1, 0, 'p002', 0, 'ทั่วไป', '1632058435606'),
(6, 'Lee Hye-yeon', 3, 0, 60, 'p003', 0, 'ทั่วไป', '1632072638407'),
(7, 'Lily Ivy', 14, 1, 0, 'p004', 0, 'ทั่วไป', '1632059769509'),
(8, 'Amalie Olufsen', 14, 1, 0, 'p005', 0, 'ทั่วไป', '1632060615780'),
(9, 'Aika Yumeno', 13, 1, 0, 'p006', 0, 'ทั่วไป', '1632060762584'),
(10, 'Honami Uehara', 13, 1, 0, 'p007', 0, 'ทั่วไป', '1632066549351'),
(11, 'Julia Boin', 13, 1, 0, 'p008', 0, 'ทั่วไป', '1632066704646'),
(12, 'Anri Sugihara', 13, 1, 0, 'p009', 0, 'ทั่วไป', '1632066806469'),
(13, 'Lavinia', 15, 1, 0, 'p010', 0, 'ทั่วไป', '1632067404379'),
(14, 'Zhao Weiyi', 15, 1, 0, 'p011', 0, 'ทั่วไป', '1632067862851');

-- --------------------------------------------------------

--
-- Table structure for table `picturemode`
--

CREATE TABLE `picturemode` (
  `pm_id` int(11) NOT NULL,
  `pm_order` int(11) NOT NULL,
  `pm_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `picturemode`
--

INSERT INTO `picturemode` (`pm_id`, `pm_order`, `pm_title`, `timestamp`) VALUES
(3, 100, 'เกาหลี', '1632058185446'),
(4, 200, 'ไทย', '1631241529721'),
(13, 300, 'ญี่ปุ่น', '1632058201259'),
(14, 400, 'ฝรั่ง', '1632058214708'),
(15, 500, 'จีน', '1632067113387');

-- --------------------------------------------------------

--
-- Table structure for table `picturestat`
--

CREATE TABLE `picturestat` (
  `id` int(11) NOT NULL,
  `pt_id` int(11) NOT NULL,
  `weekno` int(11) NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `picturestat`
--

INSERT INTO `picturestat` (`id`, `pt_id`, `weekno`, `view`) VALUES
(1, 1, 1, 20),
(2, 1, 2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `securitykey`
--

CREATE TABLE `securitykey` (
  `id` int(11) NOT NULL,
  `securitykey` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `securitykey`
--

INSERT INTO `securitykey` (`id`, `securitykey`) VALUES
(11, '1456481223');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL COMMENT '0ปิด 1 ใช้งาน',
  `token` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `telephone`, `timestamp`, `status`, `token`) VALUES
(1, 'artzy', '123456', '0912553665', '2021-12-25 15:33:23', 1, 'fslkfdl1234'),
(3, 'Mamxx', '447788', '0854514455', '2021-12-25 15:33:51', 1, 'fklfjksdfjwpfjsld'),
(4, 'reity', '554446', '0987545544', '2021-12-25 15:36:01', 1, 'fdsafsdffs');

-- --------------------------------------------------------

--
-- Table structure for table `usersystem`
--

CREATE TABLE `usersystem` (
  `userid` int(11) NOT NULL,
  `username` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `realname` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `rolename` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `editor` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usersystem`
--

INSERT INTO `usersystem` (`userid`, `username`, `password`, `realname`, `roleid`, `rolename`, `timestamp`, `editor`, `token`) VALUES
(8, 'testxx', '1234', 'สมชาย', 5, 'ผู้จัดทำเนื้อหา', '1640445546441', 'admin', 'ixAWmA818dHDnUX7Ezgw'),
(9, 'admin', '1234', 'admin', 1, 'admin', '1629833791926', 'admin', '9GfjM4OlSEjA2KcnCaRm'),
(19, 'art', '1234', 'art', 6, 'การตลาด', '1632448833317', 'admin', 'sujuMvfDqgvDp8mVFh9f');

-- --------------------------------------------------------

--
-- Table structure for table `usersystemtype`
--

CREATE TABLE `usersystemtype` (
  `id` int(11) NOT NULL,
  `typename` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frontpanel` int(11) NOT NULL,
  `actress` int(11) NOT NULL,
  `movie` int(11) NOT NULL,
  `cartoon` int(11) NOT NULL,
  `story` int(11) NOT NULL,
  `picture` int(11) NOT NULL,
  `ads` int(11) NOT NULL,
  `stat` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `system` int(11) NOT NULL,
  `editor` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usersystemtype`
--

INSERT INTO `usersystemtype` (`id`, `typename`, `frontpanel`, `actress`, `movie`, `cartoon`, `story`, `picture`, `ads`, `stat`, `member`, `system`, `editor`, `timestamp`) VALUES
(1, 'admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'admin', '1640445384057'),
(5, 'ผู้จัดทำเนื้อหา', 3, 1, 1, 1, 1, 1, 0, 0, 1, 0, 'admin', '1640444208031'),
(6, 'การตลาด', 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 'admin', '1632426271198');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actress`
--
ALTER TABLE `actress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`at_id`);

--
-- Indexes for table `adsstat`
--
ALTER TABLE `adsstat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartoon`
--
ALTER TABLE `cartoon`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `cartoonstat`
--
ALTER TABLE `cartoonstat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moviecat`
--
ALTER TABLE `moviecat`
  ADD PRIMARY KEY (`mc_id`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`pt_id`);

--
-- Indexes for table `picturemode`
--
ALTER TABLE `picturemode`
  ADD PRIMARY KEY (`pm_id`);

--
-- Indexes for table `picturestat`
--
ALTER TABLE `picturestat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitykey`
--
ALTER TABLE `securitykey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersystem`
--
ALTER TABLE `usersystem`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `usersystemtype`
--
ALTER TABLE `usersystemtype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actress`
--
ALTER TABLE `actress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `at_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adsstat`
--
ALTER TABLE `adsstat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cartoon`
--
ALTER TABLE `cartoon`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `cartoonstat`
--
ALTER TABLE `cartoonstat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `moviecat`
--
ALTER TABLE `moviecat`
  MODIFY `mc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `pt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `picturemode`
--
ALTER TABLE `picturemode`
  MODIFY `pm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `picturestat`
--
ALTER TABLE `picturestat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `securitykey`
--
ALTER TABLE `securitykey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usersystem`
--
ALTER TABLE `usersystem`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `usersystemtype`
--
ALTER TABLE `usersystemtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
