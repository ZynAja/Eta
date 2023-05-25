-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2023 at 12:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_etacatridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin123', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `printer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tinta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `pelanggan`, `printer`, `tinta`, `warna`, `status`, `created_at`, `updated_at`) VALUES
('183943', 'jj', 'HP Laser P1122', 'Canon 510 - Black', 'Black', '3', '2023-05-25 00:48:31', '2023-05-25 00:49:31'),
('268028', 'sad', 'HP Laser P1122', 'bb', 'Black', '2', '2023-05-25 01:06:37', '2023-05-25 01:06:46'),
('287280', 'asd', 'HP Laser P1122', 'bb', 'Yellow', '2', '2023-05-25 01:06:05', '2023-05-25 01:07:30'),
('287416', 'ww', 'Brother XI-12', 'w', 'Black', '2', '2023-05-25 00:55:35', '2023-05-25 00:55:43'),
('446619', 'asd', 'HP Laser P1122', 'bb', 'Magenta', '2', '2023-05-25 01:06:23', '2023-05-25 01:07:54'),
('603005', 'asd', 'HP Laser P1122', 'bb', 'Yellow', '2', '2023-05-25 01:05:55', '2023-05-25 01:08:00'),
('802237', 'Switi', 'Brother XI-12', 'Drum Laserjet 126A - Black', 'Black', '3', '2023-05-25 00:41:52', '2023-05-25 00:44:17'),
('891721', 'asd', 'Brother XI-12', 'bb', 'Black', '2', '2023-05-25 01:06:14', '2023-05-25 01:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_16_011811_create_tintas_table', 1),
(6, '2023_05_16_011932_create_pelanggans_table', 1),
(7, '2023_05_16_071029_create_admins_table', 1),
(8, '2023_05_17_012226_create_printers_table', 1),
(9, '2023_05_22_043028_create_bookings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gedung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departemen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `username`, `gedung`, `area`, `departemen`, `created_at`, `updated_at`) VALUES
(1, 'ddd', 'G5', 'Gudang', 'ddd', '2023-05-24 20:22:35', '2023-05-24 20:22:35'),
(2, 'eeee', 'G5', 'Produksi', 'eeee', '2023-05-24 20:28:37', '2023-05-24 20:28:37'),
(3, 'eee', 'G5A', 'Produksi', 'eee', '2023-05-24 20:30:08', '2023-05-24 20:30:08'),
(4, '333', 'G5', 'Produksi', '3333', '2023-05-24 20:40:24', '2023-05-24 20:40:24'),
(5, 'eeeeee', 'G5A', 'Produksi', 'eeeeee', '2023-05-24 20:44:05', '2023-05-24 20:44:05'),
(6, 'asdad', 'G5A', 'Office', 'HCM', '2023-05-24 20:46:20', '2023-05-24 20:46:20'),
(7, 'Mogu mogu', 'G5', 'Produksi', 'guhan', '2023-05-24 20:47:51', '2023-05-24 20:47:51'),
(8, 'ddd', 'G5', 'Gudang', 'dddd', '2023-05-24 21:16:54', '2023-05-24 21:16:54'),
(9, 'Elanda', 'G5', 'Office', 'HCM', '2023-05-24 23:38:10', '2023-05-24 23:38:10'),
(10, 'Switi', 'G5A', 'Produksi', 'Aero', '2023-05-25 00:41:52', '2023-05-25 00:41:52'),
(11, 'jj', 'G5', 'Office', 'jj', '2023-05-25 00:48:31', '2023-05-25 00:48:31'),
(12, 'ww', 'G5', 'Gudang', 'ww', '2023-05-25 00:55:35', '2023-05-25 00:55:35'),
(13, 'asd', 'G5A', 'Produksi', 'asd', '2023-05-25 01:05:55', '2023-05-25 01:05:55'),
(14, 'asd', 'G5', 'Gudang', 'asd', '2023-05-25 01:06:05', '2023-05-25 01:06:05'),
(15, 'asd', 'G5', 'Produksi', 'asd', '2023-05-25 01:06:14', '2023-05-25 01:06:14'),
(16, 'asd', 'G5', 'Gudang', 'sad', '2023-05-25 01:06:23', '2023-05-25 01:06:23'),
(17, 'sad', 'G5', 'Produksi', 'sad', '2023-05-25 01:06:37', '2023-05-25 01:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `nama`, `warna`, `created_at`, `updated_at`) VALUES
(8, 'Brother XI-12', '1', '2023-05-25 00:41:02', '2023-05-25 00:41:02'),
(9, 'HP Laser P1122', '2', '2023-05-25 00:41:13', '2023-05-25 00:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `tintas`
--

CREATE TABLE `tintas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stok` int(255) NOT NULL,
  `namatinta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minQ` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tintas`
--

INSERT INTO `tintas` (`id`, `stok`, `namatinta`, `minQ`, `created_at`, `updated_at`) VALUES
(8, 10, 'Laserjet 76A - Black', 5, '2023-05-24 20:55:13', '2023-05-24 20:55:13'),
(9, 10, 'Laserjet 85A - Black', 5, '2023-05-24 20:55:43', '2023-05-24 20:55:43'),
(10, 9, 'Laserjet 107A - Black', 5, '2023-05-24 20:56:19', '2023-05-24 23:38:42'),
(11, 9, 'Drum Laserjet 126A - Black', 5, '2023-05-24 20:57:46', '2023-05-25 00:43:01'),
(12, 10, 'Laserjet 79A - Black', 5, '2023-05-24 20:58:47', '2023-05-24 20:58:47'),
(13, 10, 'Laserjet 12A - Black', 5, '2023-05-24 21:00:14', '2023-05-24 21:00:14'),
(16, 10, 'C311A - Cyan', 5, '2023-05-24 21:27:03', '2023-05-24 21:27:03'),
(17, 9, 'Canon 510 - Black', 5, '2023-05-24 21:33:55', '2023-05-25 00:49:17'),
(18, 10, 'Canon 512 - Black', 5, '2023-05-24 21:34:38', '2023-05-24 21:34:38'),
(19, 10, 'Canon 513 - Color', 5, '2023-05-24 21:35:50', '2023-05-24 21:35:50'),
(20, 10, 'CF510A - Black', 5, '2023-05-24 21:42:01', '2023-05-24 21:42:01'),
(21, 10, 'Laserjet 204A - Cyan', 5, '2023-05-24 21:44:29', '2023-05-24 21:44:29'),
(22, 10, 'Epson 003 - Black', 5, '2023-05-24 23:11:23', '2023-05-24 23:11:23'),
(23, 10, 'Epson 003 - Cyan', 5, '2023-05-24 23:11:32', '2023-05-24 23:11:32'),
(24, 10, 'Epson 003 - Magenta', 5, '2023-05-24 23:11:48', '2023-05-24 23:11:48'),
(25, 10, 'Epson 003 - Yellow', 5, '2023-05-24 23:12:02', '2023-05-24 23:12:02'),
(26, 10, 'CE312A - Yellow', 5, '2023-05-24 23:13:06', '2023-05-24 23:13:06'),
(27, 10, 'Toner Fuji Xerox P115w - Black', 5, '2023-05-24 23:16:55', '2023-05-24 23:16:55'),
(28, 10, 'Laserjet 35A - Black', 5, '2023-05-24 23:20:02', '2023-05-24 23:20:02'),
(29, 10, 'Laserjet 204A - Yellow', 5, '2023-05-24 23:21:50', '2023-05-24 23:21:50'),
(30, 10, 'CB285A - Black', 5, '2023-05-24 23:24:43', '2023-05-24 23:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tintas`
--
ALTER TABLE `tintas`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tintas`
--
ALTER TABLE `tintas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
