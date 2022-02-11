-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2021 at 02:07 AM
-- Server version: 10.5.8-MariaDB
-- PHP Version: 7.3.27

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `user`, `uri`, `method`, `data`, `ip_address`, `user_agent`, `response`, `activity`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, NULL, '/official/bono-metronic/www', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:00', '2021-02-23 18:42:00'),
(2, NULL, '/official/bono-metronic/www/index.php/login', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:02', '2021-02-23 18:42:02'),
(3, NULL, '/official/bono-metronic/www/index.php/favicon.ico', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:02', '2021-02-23 18:42:02'),
(4, NULL, '/official/bono-metronic/www/index.php/login', 'POST', '{\"username\":\"admin\"}', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:05', '2021-02-23 18:42:05'),
(5, NULL, '/official/bono-metronic/www/index.php/favicon.ico', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:05', '2021-02-23 18:42:05'),
(6, NULL, '/official/bono-metronic/www/index.php/login', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:39', '2021-02-23 18:42:39'),
(7, NULL, '/official/bono-metronic/www/index.php/favicon.ico', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:40', '2021-02-23 18:42:40'),
(8, NULL, '/official/bono-metronic/www/index.php/login', 'POST', '{\"username\":\"admin\"}', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:43', '2021-02-23 18:42:43'),
(9, NULL, '/official/bono-metronic/www/index.php/favicon.ico', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:42:43', '2021-02-23 18:42:43'),
(10, NULL, '/official/bono-metronic/www/index.php/login', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:43:43', '2021-02-23 18:43:43'),
(11, NULL, '/official/bono-metronic/www/index.php/favicon.ico', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', NULL, NULL, '2021-02-23 18:43:43', '2021-02-23 18:43:43'),
(12, NULL, '/official/bono-metronic/www/index.php/login', 'POST', '{\"username\":\"admin\"}', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:43:46', '2021-02-23 18:43:46'),
(13, '1', '/official/bono-metronic/www', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:43:46', '2021-02-23 18:43:46'),
(14, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:43:53', '2021-02-23 18:43:53'),
(15, '1', '/official/bono-metronic/www/index.php/test/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:43:55', '2021-02-23 18:43:55'),
(16, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:44:00', '2021-02-23 18:44:00'),
(17, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:44:08', '2021-02-23 18:44:08'),
(18, '1', '/official/bono-metronic/www/index.php/sysparam', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:00', '2021-02-23 18:45:00'),
(19, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:04', '2021-02-23 18:45:04'),
(20, '1', '/official/bono-metronic/www/index.php', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:24', '2021-02-23 18:45:24'),
(21, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:42', '2021-02-23 18:45:42'),
(22, '1', '/official/bono-metronic/www/index.php/user', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:43', '2021-02-23 18:45:43'),
(23, '1', '/official/bono-metronic/www/index.php/user/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:45:55', '2021-02-23 18:45:55'),
(24, '1', '/official/bono-metronic/www/index.php/user/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:29', '2021-02-23 18:54:29'),
(25, '1', '/official/bono-metronic/www/index.php/role', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:31', '2021-02-23 18:54:31'),
(26, '1', '/official/bono-metronic/www/index.php/previleges', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:32', '2021-02-23 18:54:32'),
(27, '1', '/official/bono-metronic/www/index.php/sysparam', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:34', '2021-02-23 18:54:34'),
(28, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:37', '2021-02-23 18:54:37'),
(29, '1', '/official/bono-metronic/www/index.php/test/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 18:54:38', '2021-02-23 18:54:38'),
(30, '1', '/official/bono-metronic/www/index.php', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:26:33', '2021-02-23 21:26:33'),
(31, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:26:36', '2021-02-23 21:26:36'),
(32, '1', '/official/bono-metronic/www/index.php/test/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:26:38', '2021-02-23 21:26:38'),
(33, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:26:42', '2021-02-23 21:26:42'),
(34, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:27:18', '2021-02-23 21:27:18'),
(35, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:27:49', '2021-02-23 21:27:49'),
(36, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:28:00', '2021-02-23 21:28:00'),
(37, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:28:10', '2021-02-23 21:28:10'),
(38, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 21:28:21', '2021-02-23 21:28:21'),
(39, '1', '/official/bono-metronic/www/index.php/metronic/upload_file.json', 'POST', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 22:16:59', '2021-02-23 22:16:59'),
(40, '1', '/official/bono-metronic/www/index.php/metronic/upload_file.json', 'POST', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 22:17:07', '2021-02-23 22:17:07'),
(41, '1', '/official/bono-metronic/www/index.php/test/null/create', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 22:31:44', '2021-02-23 22:31:44'),
(42, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-23 22:31:53', '2021-02-23 22:31:53'),
(43, '1', '/official/bono-metronic/www/index.php/user.json', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-24 07:33:45', '2021-02-24 07:33:45'),
(44, '1', '/official/bono-metronic/www/index.php/user', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:22', '2021-02-25 09:50:22'),
(45, '1', '/official/bono-metronic/www/index.php/role', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:24', '2021-02-25 09:50:24'),
(46, '1', '/official/bono-metronic/www/index.php/previleges', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:25', '2021-02-25 09:50:25'),
(47, '1', '/official/bono-metronic/www/index.php/sysparam', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:26', '2021-02-25 09:50:26'),
(48, '1', '/official/bono-metronic/www/index.php/previleges', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:27', '2021-02-25 09:50:27'),
(49, '1', '/official/bono-metronic/www/index.php/role', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:30', '2021-02-25 09:50:30'),
(50, '1', '/official/bono-metronic/www/index.php/user', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:31', '2021-02-25 09:50:31'),
(51, '1', '/official/bono-metronic/www/index.php/test', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:32', '2021-02-25 09:50:32'),
(52, '1', '/official/bono-metronic/www/index.php/test/1', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:50:33', '2021-02-25 09:50:33'),
(53, '1', '/official/bono-metronic/www/index.php/test/1/update', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:51:00', '2021-02-25 09:51:00'),
(54, '1', '/official/bono-metronic/www/index.php/test/1', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 09:51:05', '2021-02-25 09:51:05'),
(55, '1', '/official/bono-metronic/www', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 17:31:20', '2021-02-25 17:31:20'),
(56, '1', '/official/bono-metronic/www/index.php/user', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 17:31:24', '2021-02-25 17:31:24'),
(57, '1', '/official/bono-metronic/www/index.php/user', 'GET', '[]', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', NULL, '', '1', '1', '2021-02-25 20:19:28', '2021-02-25 20:19:28');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `previleges`
--

INSERT INTO `previleges` (`id`, `module`, `submodule`, `ordering`, `action`, `uri`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'All', 'All', '1', 'All', '*', 1, '1', '1', '2021-02-23 09:39:25', '2021-02-23 09:39:25');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Admin', 1, '1', '1', '2021-02-23 09:38:49', '2021-02-23 09:40:31'),
(2, 'User', 1, '1', '1', '2021-02-23 16:17:21', '2021-02-23 16:17:21');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_previleges`
--

INSERT INTO `role_previleges` (`id`, `role`, `type`, `rule`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'uri', '*', 1, '1', '1', '2021-02-23 09:40:31', '2021-02-23 09:40:31'),
(2, '2', 'uri', '*', NULL, '1', '1', '2021-02-23 16:17:22', '2021-02-23 16:17:22');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `photo`, `nama`, `alamat`, `ktp`, `file2`, `file`, `dropdown`, `select`, `role`, `role2`, `user`, `user1`, `testdate`, `testdate2`, `testdate3`, `testdate4`, `sysparam`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '{\"name\":\"logo-gigant-store.png\",\"filename\":\"460ddc14357a1a310b3940aba1aca2b2.png\",\"bucket\":\"storage\",\"mime_type\":\"image\\/png\"}', 'Gigant', 'Jakarta', '12-3456-78_90.123', '{\"name\":\"Gmail - Terima Kasih! Pesanan (15863) diterima!.pdf\",\"filename\":\"e42eb84bffb2fed4d283f456c28e5246.pdf\",\"bucket\":\"data\",\"mime_type\":\"application\\/pdf\"}', '{\"name\":\"Gmail - Terima Kasih! Pesanan (15864) diterima!.pdf\",\"filename\":\"1abaec505eb51e822fab9b4cc21c2edb.pdf\",\"bucket\":\"storage1\",\"mime_type\":\"application\\/pdf\"}', 'a', 'b', '[\"1\"]', '[\"2\"]', '4', '3', '2021-02-24', '2021-02-24', '2021-02-24', '2021-02-24 07:57:00', '1', 1, '1', '1', '2021-02-24 07:57:55', '2021-02-24 07:57:55');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `photo`, `username`, `email`, `normalized_username`, `password`, `birthday`, `gender`, `address`, `mobile_phone`, `role`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Admin', 'Ganteng', '{\"name\":\"logo-gigant-store.png\",\"filename\":\"098b16f2b114e681af0ad3894d7749c7.png\",\"bucket\":\"storage\",\"mime_type\":\"image\\/png\"}', 'admin', 'admin@m.io', NULL, '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, NULL, NULL, '[\"1\"]', 1, '1', '1', '2021-02-22 16:28:19', '2021-02-25 10:58:52');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `previleges`
--
ALTER TABLE `previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_previleges`
--
ALTER TABLE `role_previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysparam`
--
ALTER TABLE `sysparam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
