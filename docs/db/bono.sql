-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 02, 2021 at 02:53 AM
-- Server version: 10.6.3-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bono`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `audit_trail`
--


-- --------------------------------------------------------

--
-- Table structure for table `previleges`
--

CREATE TABLE `previleges` (
  `id` int(11) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `submodule` varchar(255) DEFAULT NULL,
  `ordering` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `previleges`
--

INSERT INTO `previleges` (`id`, `module`, `submodule`, `ordering`, `action`, `uri`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'All', 'All', '1', 'Developer Controls', '*', 1, '1', '1', '2021-02-23 09:39:25', '2021-02-23 09:39:25'),
(2, 'Dashboard', 'Dashboard', '1', 'View', '/', 1, '1', '1', '2021-08-30 14:03:58', '2021-08-30 14:03:58'),
(3, 'User Management', 'User', '1', 'List', '/user', 1, '1', '1', '2021-08-30 14:04:23', '2021-08-31 19:22:58'),
(4, 'User Management', 'User', '2', 'View', '/user/:id', 1, '1', '1', '2021-08-30 14:04:39', '2021-08-31 19:22:43'),
(5, 'User Management', 'User', '4', 'Edit', '/user/:id/update', 1, '1', '1', '2021-08-31 18:11:58', '2021-08-31 19:22:22'),
(6, 'User Management', 'User', '5', 'Destroy', '/user/:id/delete', 1, '1', '1', '2021-08-31 18:14:33', '2021-08-31 19:22:12'),
(7, 'User Management', 'User', '6', 'Trash', '/user/:id/trash', 1, '1', '1', '2021-08-31 18:14:47', '2021-08-31 19:21:58'),
(8, 'User Management', 'User', '3', 'Write', '/user/null/create', 1, '1', '1', '2021-08-31 19:23:29', '2021-08-31 19:23:29'),
(9, 'Configuration', 'Sysparam', '1', 'List', '/sysparam', 1, '1', '1', '2021-08-31 19:27:17', '2021-08-31 19:27:17'),
(10, 'Configuration', 'Sysparam', '2', 'View', '/sysparam/:id', 1, '1', '1', '2021-08-31 19:27:37', '2021-08-31 19:27:37'),
(11, 'Configuration', 'Sysparam', '3', 'Write', '/sysparam/null/create', 1, '1', '1', '2021-08-31 19:27:58', '2021-08-31 19:27:58'),
(12, 'Configuration', 'Sysparam', '4', 'Edit', '/sysparam/:id/update', 1, '1', '1', '2021-08-31 19:28:30', '2021-08-31 19:28:30'),
(13, 'Configuration', 'Sysparam', '5', 'Destroy', '/sysparam/:id/delete', 1, '1', '1', '2021-08-31 19:28:39', '2021-08-31 19:28:39'),
(14, 'Configuration', 'Sysparam', '5', 'Trash', '/sysparam/:id/trash', 1, '1', '1', '2021-08-31 19:28:46', '2021-08-31 19:28:46'),
(15, 'Configuration', 'Permissions', '1', 'List', '/previleges', 1, '1', '1', '2021-08-31 19:29:48', '2021-08-31 19:29:48'),
(16, 'Configuration', 'Permissions', '2', 'View', '/previleges/:id', 1, '1', '1', '2021-08-31 19:29:55', '2021-08-31 19:29:55'),
(17, 'Configuration', 'Permissions', '3', 'Write', '/previleges/null/create', 1, '1', '1', '2021-08-31 19:30:05', '2021-08-31 19:30:05'),
(18, 'Configuration', 'Permissions', '4', 'Edit', '/previleges/:id/update', 1, '1', '1', '2021-08-31 19:30:15', '2021-08-31 19:30:15'),
(19, 'Configuration', 'Permissions', '5', 'Destroy', '/previleges/:id/delete', 1, '1', '1', '2021-08-31 19:30:21', '2021-08-31 19:30:21'),
(20, 'Configuration', 'Permissions', '6', 'Trash', '/previleges/:id/trash', 1, '1', '1', '2021-08-31 19:30:28', '2021-08-31 19:30:28'),
(21, 'Configuration', 'Roles', '1', 'List', '/role', 1, '1', '1', '2021-08-31 19:31:04', '2021-08-31 19:31:04'),
(22, 'Configuration', 'Roles', '2', 'View', '/role/:id', 1, '1', '1', '2021-08-31 19:31:11', '2021-08-31 19:31:11'),
(23, 'Configuration', 'Roles', '3', 'Write', '/role/null/create', 1, '1', '1', '2021-08-31 19:31:22', '2021-08-31 19:31:22'),
(24, 'Configuration', 'Roles', '4', 'Edit', '/role/:id/update', 1, '1', '1', '2021-08-31 19:31:34', '2021-08-31 19:31:34'),
(25, 'Configuration', 'Roles', '5', 'Destroy', '/role/:id/delete', 1, '1', '1', '2021-08-31 19:31:42', '2021-08-31 19:31:42'),
(26, 'Configuration', 'Roles', '6', 'Trash', '/role/:id/trash', 1, '1', '1', '2021-08-31 19:31:53', '2021-08-31 19:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Admin', 1, '1', '1', '2021-02-23 09:38:49', '2021-08-31 19:34:38'),
(2, 'User', 1, '1', '1', '2021-02-23 16:17:21', '2021-08-31 19:40:55'),
(3, 'Developer', 1, '1', '1', '2021-08-31 19:33:41', '2021-08-31 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_previleges`
--

CREATE TABLE `role_previleges` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rule` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role_previleges`
--

INSERT INTO `role_previleges` (`id`, `role`, `type`, `rule`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(23, '3', 'uri', '*', NULL, '1', '1', '2021-08-31 19:33:41', '2021-08-31 19:33:41'),
(24, '1', 'uri', '/', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(25, '1', 'uri', '/user', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(26, '1', 'uri', '/user/:id', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(27, '1', 'uri', '/user/null/create', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(28, '1', 'uri', '/user/:id/update', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(29, '1', 'uri', '/user/:id/trash', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(30, '1', 'uri', '/previleges', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(31, '1', 'uri', '/previleges/:id', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(32, '1', 'uri', '/previleges/null/create', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(33, '1', 'uri', '/previleges/:id/update', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(34, '1', 'uri', '/previleges/:id/trash', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(35, '1', 'uri', '/role', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(36, '1', 'uri', '/role/:id', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(37, '1', 'uri', '/role/null/create', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(38, '1', 'uri', '/role/:id/update', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(39, '1', 'uri', '/role/:id/trash', NULL, '1', '1', '2021-08-31 19:34:38', '2021-08-31 19:34:38'),
(40, '2', 'uri', '/', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(41, '2', 'uri', '/user', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(42, '2', 'uri', '/user/:id', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(43, '2', 'uri', '/user/null/create', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(44, '2', 'uri', '/user/:id/update', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(45, '2', 'uri', '/sysparam', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(46, '2', 'uri', '/sysparam/:id', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(47, '2', 'uri', '/sysparam/null/create', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55'),
(48, '2', 'uri', '/sysparam/:id/update', NULL, '1', '1', '2021-08-31 19:40:55', '2021-08-31 19:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `sysparam`
--

CREATE TABLE `sysparam` (
  `id` int(11) NOT NULL,
  `groups` varchar(255) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `long_value` text DEFAULT NULL,
  `order_param` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sysparam`
--

INSERT INTO `sysparam` (`id`, `groups`, `key`, `value`, `long_value`, `order_param`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Gender', '1', 'Male', 'Male', 1, '1', '1', '1', '2021-02-23 15:47:29', '2021-02-23 15:47:29'),
(2, 'Gender', '2', 'Female', 'Female', 2, '1', '1', '1', '2021-02-23 15:47:41', '2021-02-23 15:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `file2` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `dropdown` varchar(10) DEFAULT NULL,
  `select` varchar(10) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `role2` varchar(255) DEFAULT NULL,
  `user` varchar(10) DEFAULT NULL,
  `user1` varchar(10) DEFAULT NULL,
  `testdate` date DEFAULT NULL,
  `testdate2` date DEFAULT NULL,
  `testdate3` date DEFAULT NULL,
  `testdate4` datetime DEFAULT NULL,
  `sysparam` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `photo`, `nama`, `alamat`, `ktp`, `file2`, `file`, `dropdown`, `select`, `role`, `role2`, `user`, `user1`, `testdate`, `testdate2`, `testdate3`, `testdate4`, `sysparam`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '{\"name\":\"aqua_aqua-botol-air-mineral--600-ml-_full02.jpeg\",\"filename\":\"1b9be0234b98c5337e71197cb8916038.jpeg\",\"bucket\":\"storage\",\"mime_type\":\"image\\/jpeg\"}', 'Gigant', 'Jakarta', '12-3456-78_90.123', '{\"name\":\"Gmail - Terima Kasih! Pesanan (15863) diterima!.pdf\",\"filename\":\"e42eb84bffb2fed4d283f456c28e5246.pdf\",\"bucket\":\"data\",\"mime_type\":\"application\\/pdf\"}', '{\"name\":\"Gmail - Terima Kasih! Pesanan (15864) diterima!.pdf\",\"filename\":\"1abaec505eb51e822fab9b4cc21c2edb.pdf\",\"bucket\":\"storage1\",\"mime_type\":\"application\\/pdf\"}', 'a', 'b', '[\"1\"]', '[\"2\"]', '4', '3', '2021-02-24', '2021-02-24', '2021-02-24', '2021-02-24 07:57:00', '1', 1, '1', '6', '2021-02-24 07:57:55', '2021-09-02 06:15:53'),
(3, '{\"name\":\"5849972.jpeg\",\"filename\":\"28cf498e8e315ae6f9bbe165e5b37763.jpeg\",\"bucket\":\"storage\",\"mime_type\":\"image\\/jpeg\"}', 'Wahyu Taufik', 'Jakarta', '317503037930006', '{\"name\":\"0001.jpeg\",\"filename\":\"1719aa8b1b6cd90aa1781774b83cdb07.jpeg\",\"bucket\":\"data\",\"mime_type\":\"image\\/jpeg\"}', '{\"name\":\"5f1e3e8b7d508.jpeg\",\"filename\":\"405394c0f43b6f45f9d22f9e296f3507.jpeg\",\"bucket\":\"data\",\"mime_type\":\"image\\/jpeg\"}', 'a', 'a', '[\"2\"]', '[\"3\"]', NULL, NULL, '2021-09-01', '2021-08-31', NULL, NULL, '1', 1, '6', '6', '2021-09-01 19:01:37', '2021-09-01 20:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `normalized_username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `photo`, `username`, `email`, `normalized_username`, `password`, `birthday`, `gender`, `address`, `mobile_phone`, `role`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Admin', 'Ganteng', '{\"name\":\"logo-gigant-store.png\",\"filename\":\"098b16f2b114e681af0ad3894d7749c7.png\",\"bucket\":\"storage\",\"mime_type\":\"image\\/png\"}', 'admin', 'admin@m.io', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, '[\"1\",\"3\"]', 1, '1', '6', '2021-02-22 16:28:19', '2021-09-02 09:34:19'),
(6, 'Wahyu', 'Taufik', '[]', 'wahyu', 'wahyutaufik37@gmail.com', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, '[\"3\"]', 1, '1', '6', '2021-08-31 16:32:06', '2021-09-02 06:36:39'),
(7, 'Abdul', 'Rasman', '{\"name\":\"photo_2021-08-21 07.07.57.jpeg\",\"filename\":\"3c59afd25147d0dfb14eca45b66abb7f.jpeg\",\"bucket\":\"storage\",\"mime_type\":\"image\\/jpeg\"}', 'adoel', 'adoel4razman@gmail.com', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, NULL, 1, '1', '6', '2021-08-31 16:48:51', '2021-09-01 20:39:11'),
(8, 'Apriyanto Pramana', 'Putra', '{\"name\":\"Screen Shot 2021-04-23 at 09.49.28.png\",\"filename\":\"ca0b0394757821a350f829df6e42e10a.png\",\"bucket\":\"storage\",\"mime_type\":\"image\\/png\"}', 'putra', 'putra@sagara.id', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, '[\"2\"]', 1, '1', '6', '2021-08-31 16:49:19', '2021-09-02 06:36:22'),
(9, 'Nur', 'Alam', '[]', 'alam', 'nur.alam@sagara.id', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, '[\"2\"]', 1, '1', '6', '2021-09-01 05:32:04', '2021-09-02 06:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(17, 7, 2, NULL, '6', '6', '2021-09-01 20:39:11', '2021-09-01 20:39:11'),
(19, 8, 2, NULL, '6', '6', '2021-09-02 06:36:22', '2021-09-02 06:36:22'),
(20, 6, 3, NULL, '6', '6', '2021-09-02 06:36:39', '2021-09-02 06:36:39'),
(22, 9, 2, NULL, '6', '6', '2021-09-02 06:37:12', '2021-09-02 06:37:12'),
(23, 1, 1, NULL, '6', '6', '2021-09-02 09:34:19', '2021-09-02 09:34:19'),
(24, 1, 3, NULL, '6', '6', '2021-09-02 09:34:19', '2021-09-02 09:34:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `previleges`
--
ALTER TABLE `previleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_previleges`
--
ALTER TABLE `role_previleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sysparam`
--
ALTER TABLE `sysparam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `previleges`
--
ALTER TABLE `previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_previleges`
--
ALTER TABLE `role_previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `sysparam`
--
ALTER TABLE `sysparam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
