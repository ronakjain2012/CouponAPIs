-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2018 at 08:15 AM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.1.18-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_path`
--
CREATE DATABASE IF NOT EXISTS `laravel_path` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;
USE `laravel_path`;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_percentage` double(10,2) DEFAULT NULL,
  `valid_upto` datetime DEFAULT NULL,
  `use_count` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `event_id`, `coupon`, `amount_percentage`, `valid_upto`, `use_count`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 'MOTIVATIONPR1R', NULL, '2018-06-23 00:00:00', 4, '0', '2018-06-14 21:01:04', '2018-06-15 20:03:35'),
(4, 1, 'MOTIVATIONW7SL', NULL, NULL, 16, '0', '2018-06-14 21:01:10', '2018-06-15 20:03:35'),
(5, 1, 'MOTIVATIONETYN', NULL, NULL, 4, '0', '2018-06-14 21:01:12', '2018-06-15 20:03:35'),
(6, 1, 'MOTIVATIONTLCW', NULL, NULL, NULL, '0', '2018-06-14 21:01:13', '2018-06-15 20:03:35'),
(7, 1, 'MOTIVATION7RP5', NULL, '2018-06-14 02:31:14', NULL, '0', '2018-06-14 21:01:14', '2018-06-15 20:03:35'),
(8, 1, 'MOTIVATIONC84B', NULL, '2018-11-11 00:00:00', NULL, '0', '2018-06-15 13:10:55', '2018-06-15 21:11:23'),
(9, 1, 'MOTIVATION0F2U', NULL, '2018-11-12 00:00:00', NULL, '0', '2018-06-15 13:27:26', '2018-06-15 21:14:08'),
(10, 2, 'MANHBCJ', NULL, NULL, NULL, '1', '2018-06-15 13:27:31', '2018-06-15 13:27:31'),
(11, 2, 'MANQIXD', NULL, '2018-11-12 00:00:00', NULL, '1', '2018-06-15 13:27:34', '2018-06-15 21:14:15'),
(12, 2, 'MANYTLW', NULL, NULL, NULL, '1', '2018-06-15 13:27:35', '2018-06-15 13:27:35'),
(13, 2, 'MAN61TQ', NULL, NULL, NULL, '1', '2018-06-15 13:27:37', '2018-06-15 13:27:37'),
(14, 2, 'MANDMVE', NULL, NULL, NULL, '1', '2018-06-15 13:27:40', '2018-06-15 13:27:40'),
(15, 3, 'LARAVELN98X', NULL, NULL, NULL, '1', '2018-06-15 13:27:44', '2018-06-15 13:27:44'),
(16, 3, 'LARAVEL3EWE', NULL, NULL, NULL, '1', '2018-06-15 13:27:46', '2018-06-15 13:27:46'),
(17, 3, 'LARAVELK6TK', NULL, NULL, NULL, '1', '2018-06-15 13:27:47', '2018-06-15 13:27:47'),
(18, 3, 'LARAVELYZBM', NULL, NULL, NULL, '1', '2018-06-15 13:27:48', '2018-06-15 13:27:48'),
(19, 3, 'RB110021', NULL, NULL, NULL, '1', '2018-06-15 13:28:44', '2018-06-15 13:28:44'),
(20, 3, 'XLARAVELRONAK', NULL, NULL, NULL, '1', '2018-06-15 13:29:42', '2018-06-15 13:29:42'),
(21, 3, 'XLARAVELRONAKP', NULL, NULL, NULL, '1', '2018-06-15 13:30:52', '2018-06-15 13:30:52'),
(22, 3, 'LARAVEL127Q', NULL, NULL, NULL, '1', '2018-06-15 13:31:51', '2018-06-15 13:31:51'),
(23, 3, 'LARAVELZ168', NULL, '2018-06-15 18:58:44', NULL, '1', '2018-06-15 13:52:57', '2018-06-15 13:52:57'),
(24, 3, 'LARAVELW2BB', NULL, '2018-06-18 00:00:00', NULL, '1', '2018-06-15 13:53:12', '2018-06-15 13:53:12'),
(25, 3, 'LARAVELVQVC', NULL, '2018-06-19 00:00:00', NULL, '1', '2018-06-15 13:53:19', '2018-06-15 13:53:19'),
(26, 5, 'NOKIA6NV6', NULL, NULL, NULL, '1', '2018-06-15 20:53:26', '2018-06-15 20:53:26'),
(27, 6, 'SAMSUNGQFEM', NULL, NULL, NULL, '1', '2018-06-15 20:53:29', '2018-06-15 20:53:29'),
(28, 7, 'SONYWCEI', NULL, NULL, NULL, '1', '2018-06-15 20:53:34', '2018-06-15 20:53:34'),
(29, 8, 'TECHFLDG', NULL, NULL, NULL, '1', '2018-06-15 20:53:37', '2018-06-15 20:53:37'),
(30, 8, 'TECHKORI', NULL, NULL, NULL, '1', '2018-06-15 20:53:41', '2018-06-15 20:53:41'),
(31, 8, 'TECHI6U2', NULL, NULL, NULL, '1', '2018-06-15 20:53:42', '2018-06-15 20:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_conditions`
--

CREATE TABLE `coupon_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `conditions` enum('location','max_use') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conditions_data` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_conditions`
--

INSERT INTO `coupon_conditions` (`id`, `coupon_id`, `conditions`, `conditions_data`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'location', '1', '1', NULL, NULL),
(2, 4, 'max_use', '15', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_logs`
--

CREATE TABLE `coupon_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `category` enum('error','failed','invalid','success','condition_fail','create','update') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double(10,8) DEFAULT NULL,
  `long` double(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_logs`
--

INSERT INTO `coupon_logs` (`id`, `user_id`, `coupon_id`, `category`, `log`, `lat`, `long`, `created_at`, `updated_at`) VALUES
(1, NULL, 4, 'condition_fail', 'Failed due to use limit exceeded', 26.88267000, 75.76747400, '2018-06-15 12:57:28', '2018-06-15 12:57:28'),
(2, NULL, 5, 'success', 'Successfully applied coupon MOTIVATIONETYN', 26.88267000, 75.76747400, '2018-06-15 12:58:14', '2018-06-15 12:58:14'),
(3, NULL, 5, 'success', 'Successfully applied coupon MOTIVATIONETYN', 26.88267000, 75.76747400, '2018-06-15 12:58:17', '2018-06-15 12:58:17'),
(4, NULL, 5, 'success', 'Successfully applied coupon MOTIVATIONETYN', 26.88267000, 75.76747400, '2018-06-15 12:58:18', '2018-06-15 12:58:18'),
(5, NULL, 5, 'success', 'Successfully applied coupon MOTIVATIONETYN', 26.88267000, 75.76747400, '2018-06-15 13:08:00', '2018-06-15 13:08:00'),
(6, NULL, 8, 'create', 'Successfully created MOTIVATIONC84B', NULL, NULL, '2018-06-15 13:10:55', '2018-06-15 13:10:55'),
(7, NULL, 9, 'create', 'Successfully created MOTIVATION0F2U', NULL, NULL, '2018-06-15 13:27:27', '2018-06-15 13:27:27'),
(8, NULL, 10, 'create', 'Successfully created MANHBCJ', NULL, NULL, '2018-06-15 13:27:31', '2018-06-15 13:27:31'),
(9, NULL, 11, 'create', 'Successfully created MANQIXD', NULL, NULL, '2018-06-15 13:27:35', '2018-06-15 13:27:35'),
(10, NULL, 12, 'create', 'Successfully created MANYTLW', NULL, NULL, '2018-06-15 13:27:36', '2018-06-15 13:27:36'),
(11, NULL, 13, 'create', 'Successfully created MAN61TQ', NULL, NULL, '2018-06-15 13:27:38', '2018-06-15 13:27:38'),
(12, NULL, 14, 'create', 'Successfully created MANDMVE', NULL, NULL, '2018-06-15 13:27:40', '2018-06-15 13:27:40'),
(13, NULL, 15, 'create', 'Successfully created LARAVELN98X', NULL, NULL, '2018-06-15 13:27:44', '2018-06-15 13:27:44'),
(14, NULL, 16, 'create', 'Successfully created LARAVEL3EWE', NULL, NULL, '2018-06-15 13:27:46', '2018-06-15 13:27:46'),
(15, NULL, 17, 'create', 'Successfully created LARAVELK6TK', NULL, NULL, '2018-06-15 13:27:47', '2018-06-15 13:27:47'),
(16, NULL, 18, 'create', 'Successfully created LARAVELYZBM', NULL, NULL, '2018-06-15 13:27:48', '2018-06-15 13:27:48'),
(17, NULL, 22, 'create', 'Successfully created LARAVEL127Q', NULL, NULL, '2018-06-15 13:31:52', '2018-06-15 13:31:52'),
(18, NULL, 23, 'create', 'Successfully created LARAVELZ168', NULL, NULL, '2018-06-15 13:52:57', '2018-06-15 13:52:57'),
(19, NULL, 24, 'create', 'Successfully created LARAVELW2BB', NULL, NULL, '2018-06-15 13:53:12', '2018-06-15 13:53:12'),
(20, NULL, 25, 'create', 'Successfully created LARAVELVQVC', NULL, NULL, '2018-06-15 13:53:19', '2018-06-15 13:53:19'),
(21, NULL, NULL, 'error', 'Trying to get property of non-object -> MOTIVATIONW7SL', 26.88267000, 75.76747400, '2018-06-15 19:30:59', '2018-06-15 19:30:59'),
(22, NULL, NULL, 'error', 'Trying to get property of non-object -> MOTIVATIONW7SL', 26.88267000, 75.76747400, '2018-06-15 19:31:01', '2018-06-15 19:31:01'),
(23, NULL, NULL, 'error', 'Trying to get property of non-object -> MOTIVATIONW7SL', 26.88267000, 75.76747400, '2018-06-15 19:31:31', '2018-06-15 19:31:31'),
(24, NULL, NULL, 'error', 'Trying to get property of non-object -> MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:32:30', '2018-06-15 19:32:30'),
(25, NULL, 3, 'success', 'Successfully applied coupon MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:32:46', '2018-06-15 19:32:46'),
(26, NULL, NULL, 'error', 'Trying to get property of non-object -> MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:33:32', '2018-06-15 19:33:32'),
(27, NULL, 3, 'success', 'Successfully applied coupon MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:33:44', '2018-06-15 19:33:44'),
(28, NULL, 3, 'success', 'Successfully applied coupon MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:34:02', '2018-06-15 19:34:02'),
(29, NULL, 3, 'success', 'Successfully applied coupon MOTIVATIONPR1R', 26.88267000, 75.76747400, '2018-06-15 19:34:29', '2018-06-15 19:34:29'),
(30, NULL, NULL, 'update', 'Coupons for event Motivation behind my success - Mr. Bokaria  marked inactive', NULL, NULL, '2018-06-15 20:02:20', '2018-06-15 20:02:20'),
(31, NULL, NULL, 'update', 'Coupons for event Motivation behind my success - Mr. Bokaria  marked inactive', NULL, NULL, '2018-06-15 20:03:28', '2018-06-15 20:03:28'),
(32, NULL, NULL, 'update', 'Coupons for event Motivation behind my success - Mr. Bokaria  marked inactive', NULL, NULL, '2018-06-15 20:03:35', '2018-06-15 20:03:35'),
(33, NULL, 26, 'create', 'Successfully created NOKIA6NV6', NULL, NULL, '2018-06-15 20:53:26', '2018-06-15 20:53:26'),
(34, NULL, 27, 'create', 'Successfully created SAMSUNGQFEM', NULL, NULL, '2018-06-15 20:53:29', '2018-06-15 20:53:29'),
(35, NULL, 28, 'create', 'Successfully created SONYWCEI', NULL, NULL, '2018-06-15 20:53:34', '2018-06-15 20:53:34'),
(36, NULL, 29, 'create', 'Successfully created TECHFLDG', NULL, NULL, '2018-06-15 20:53:37', '2018-06-15 20:53:37'),
(37, NULL, 30, 'create', 'Successfully created TECHKORI', NULL, NULL, '2018-06-15 20:53:41', '2018-06-15 20:53:41'),
(38, NULL, 31, 'create', 'Successfully created TECHI6U2', NULL, NULL, '2018-06-15 20:53:43', '2018-06-15 20:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(10,8) DEFAULT NULL,
  `long` double(11,8) DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `lat`, `long`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Motivation behind my success - Mr. Bokaria ', 26.88692200, 75.76804300, '0', NULL, '2018-06-15 19:57:04'),
(2, 'Man In Middle Of Development by John Deo', 26.88692200, 75.76804300, '1', NULL, NULL),
(3, 'Laravel Development by John Deo', 26.88692200, 75.76804300, '1', NULL, NULL),
(5, 'Nokia Conf', 26.88267000, 75.76747400, '1', '2018-06-15 20:45:32', '2018-06-15 20:45:32'),
(6, 'Samsung Conf', 26.88267000, 75.76747400, '1', '2018-06-15 20:46:26', '2018-06-15 20:46:26'),
(7, 'Sony Conf', 26.88267000, 75.76747400, '1', '2018-06-15 20:46:33', '2018-06-15 20:46:33'),
(8, 'Tech Cruch Event08', 26.88267000, 75.76747500, '1', '2018-06-15 20:47:00', '2018-06-15 20:56:07'),
(9, 'Tech Cruch Event', 26.88267000, 75.76747400, '1', '2018-06-15 20:47:06', '2018-06-15 20:47:06'),
(10, 'Tech Cruch Event', 26.88267000, 75.76747500, '1', '2018-06-15 20:54:03', '2018-06-15 20:54:03'),
(11, 'Tech Cruch Event', 26.88267000, 75.76747500, '1', '2018-06-15 20:54:40', '2018-06-15 20:54:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_14_160623_create_events_table', 1),
(4, '2018_06_14_160754_create_coupons_table', 1),
(5, '2018_06_14_160827_create_coupon_conditions_table', 1),
(6, '2018_06_14_160854_create_coupon_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_event_id_foreign` (`event_id`);

--
-- Indexes for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_conditions_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `coupon_logs`
--
ALTER TABLE `coupon_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_logs_user_id_foreign` (`user_id`),
  ADD KEY `coupon_logs_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `coupon_logs`
--
ALTER TABLE `coupon_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD CONSTRAINT `coupon_conditions_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `coupon_logs`
--
ALTER TABLE `coupon_logs`
  ADD CONSTRAINT `coupon_logs_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `coupon_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
