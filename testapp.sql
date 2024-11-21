-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 01:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `airtime_purchases`
--

CREATE TABLE `airtime_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `network_provider` enum('MTN','GLO','AIRTEL','9MOBILE') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_purchases`
--

CREATE TABLE `data_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `network_provider` varchar(255) NOT NULL,
  `data_plan` enum('1GB','2GB','5GB','10GB') NOT NULL,
  `amount` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_purchases`
--

INSERT INTO `data_purchases` (`id`, `transaction_id`, `phone_number`, `network_provider`, `data_plan`, `amount`, `created_at`, `updated_at`) VALUES
(1, 12, '08102642283', 'MTN', '1GB', '1000', '2024-11-20 16:15:47', '2024-11-20 16:15:47'),
(2, 13, '08102642283', 'MTN', '1GB', '200', '2024-11-20 16:24:37', '2024-11-20 16:24:37'),
(3, 16, '08102642283', 'GLO', '2GB', '3000', '2024-11-20 17:56:53', '2024-11-20 17:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `electricity_payments`
--

CREATE TABLE `electricity_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `meter_number` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(5, '2024_11_20_094941_create_transactions_table', 1),
(6, '2024_11_20_095309_create_airtime_purchases_table', 1),
(7, '2024_11_20_095428_create_electricity_payments_table', 1),
(8, '2024_11_20_095535_create_data_purchases_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'authToken', '809829534c5a6027ade8b85a4bdfe214dd5d23d8adc5ba00ee295e4aa8a224cb', '[\"*\"]', NULL, NULL, '2024-11-20 10:08:05', '2024-11-20 10:08:05'),
(2, 'App\\Models\\User', 7, 'authToken', '9b6836f988a7be77cbd606f0eb7b99cc05f21e8006ca66bf155e586cb0ab0c05', '[\"*\"]', NULL, NULL, '2024-11-20 10:15:01', '2024-11-20 10:15:01'),
(3, 'App\\Models\\User', 8, 'authToken', 'a2e50d16ee03200b3b5f629a579e478c13b8f868d1b9eced50425d3eedfb6e71', '[\"*\"]', NULL, NULL, '2024-11-20 10:22:33', '2024-11-20 10:22:33'),
(4, 'App\\Models\\User', 9, 'authToken', 'c6ff3dffa920da3f88ec576129e97b41eaa9cfaf2992807e94549c6fdf83a9f0', '[\"*\"]', NULL, NULL, '2024-11-20 10:24:56', '2024-11-20 10:24:56'),
(5, 'App\\Models\\User', 10, 'authToken', 'f028cc84b06aea1eee529a103a828c45e76704cbd66000f64ca27ed4bb42c810', '[\"*\"]', '2024-11-20 10:52:39', NULL, '2024-11-20 10:49:16', '2024-11-20 10:52:39'),
(6, 'App\\Models\\User', 11, 'authToken', '5f5db89be436d1fa8426a9cbf79b7624743d5dadff68f3555ead99c55ae2b444', '[\"*\"]', '2024-11-20 14:47:23', NULL, '2024-11-20 10:52:16', '2024-11-20 14:47:23'),
(7, 'App\\Models\\User', 10, 'authToken', '2c9965c89e2523df2ed150016180bcf49103b60a77fcf2026acfd3f3d206a474', '[\"*\"]', '2024-11-20 17:19:46', NULL, '2024-11-20 15:15:17', '2024-11-20 17:19:46'),
(8, 'App\\Models\\User', 10, 'authToken', 'abc406b30d5f4ec9b033fd05ead196857d840203e6c0988fdfd73d51c2dfe396', '[\"*\"]', '2024-11-20 17:58:27', NULL, '2024-11-20 17:41:19', '2024-11-20 17:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `transaction_type`, `amount`, `transaction_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 'Account Funded', 2000.00, '2024-11-20 15:24:17', 'completed', '2024-11-20 15:24:17', '2024-11-20 15:24:17'),
(2, 10, 'Account Funded', 2500.00, '2024-11-20 15:27:17', 'completed', '2024-11-20 15:27:17', '2024-11-20 15:27:17'),
(12, 10, 'MTN', 1000.00, '2024-11-20 16:15:47', 'completed', '2024-11-20 16:15:47', '2024-11-20 16:15:47'),
(13, 10, 'MTN', 200.00, '2024-11-20 16:24:37', 'completed', '2024-11-20 16:24:37', '2024-11-20 16:24:37'),
(14, 10, 'Account Funded', 5000.00, '2024-11-20 17:50:15', 'completed', '2024-11-20 17:50:15', '2024-11-20 17:50:15'),
(15, 10, 'GLO', 3000.00, '2024-11-20 17:52:59', 'completed', '2024-11-20 17:52:59', '2024-11-20 17:52:59'),
(16, 10, 'GLO', 3000.00, '2024-11-20 17:56:53', 'completed', '2024-11-20 17:56:53', '2024-11-20 17:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `wallet_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `wallet_balance`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'val112', 'val@gmail.com', NULL, '$2y$12$Q2dq7IHCvbJhkCvX2FW4Sew0Q7dtqWedcypmYzauqZ2Oa8pXhC/h2', 5300.00, NULL, '2024-11-20 10:49:16', '2024-11-20 17:50:15'),
(11, 'best12', 'best@gmail.com', NULL, '$2y$12$29sQOyB72oswhQuqbTeVBut/nFk5nomXKSsFIfx9ZIPPxq7ZMXIcm', 3833.00, NULL, '2024-11-20 10:52:16', '2024-11-20 12:12:33'),
(12, 'Veronica Feeney', 'edooley@example.net', '2024-11-20 18:06:09', '$2y$12$tQxpmUFx57/wid3X7OOM0uToow.mKPEyEzubrk5vqaeP/i0PEHc2e', 0.00, 'l5SuC56y9w', '2024-11-20 18:06:13', '2024-11-20 18:06:13'),
(13, 'Geoffrey Bechtelar', 'dhalvorson@example.net', '2024-11-20 18:06:10', '$2y$12$G3kW6.b10HaCmKL/9wvkeuqYqHes9EuMtiviwHwqyqBfsQcjwekX2', 0.00, 'l7S8Aa9ds1', '2024-11-20 18:06:13', '2024-11-20 18:06:13'),
(14, 'Tiana Mueller', 'michale.harber@example.net', '2024-11-20 18:06:10', '$2y$12$BYhBNaiNScdM5UXx4lSYlee/TcXNMlqyq2Q7C7BUHkGAa2Y529acC', 0.00, 'RMkquAsoY3', '2024-11-20 18:06:13', '2024-11-20 18:06:13'),
(15, 'Prof. Elise Langosh Jr.', 'kamryn19@example.net', '2024-11-20 18:06:10', '$2y$12$3KYor7IYL8x0YmH1ymgXkeTvjnkzeQ9x5lH6ETxV65JV3BERVTLI6', 0.00, '3aCwM5idCg', '2024-11-20 18:06:13', '2024-11-20 18:06:13'),
(16, 'Rudy Doyle', 'giovanny83@example.net', '2024-11-20 18:06:11', '$2y$12$pdrvGxUqSDgtDRAGrKeyyumT0nyKpGpzqCquKQYnm0/INdzMQzyZS', 0.00, 'YfIanbUoNo', '2024-11-20 18:06:13', '2024-11-20 18:06:13'),
(17, 'Hallie Schaden', 'denesik.alta@example.org', '2024-11-20 18:06:11', '$2y$12$W4Mr21Xy3M1m/jNc5z7rvO/jJIcjNq/c.teidk9neG/EMIvOGtIMO', 0.00, 'vqiLXvjL2F', '2024-11-20 18:06:14', '2024-11-20 18:06:14'),
(18, 'Mr. Travis Roberts', 'lowe.harley@example.net', '2024-11-20 18:06:12', '$2y$12$LvV7PAJWhbrPZOeiiH.MMuqxsXKtbWBDXJOblE5qyZYhgOA8wKX4G', 0.00, 'IK9dTQCbjm', '2024-11-20 18:06:14', '2024-11-20 18:06:14'),
(19, 'Ms. Cordia Douglas', 'maryjane08@example.com', '2024-11-20 18:06:12', '$2y$12$EVUN4dsOIudKqtcnLHRqmObpY9B5VGkPl/3e6H/Br7W7amVjdt3/2', 0.00, 'lzIosGm7qZ', '2024-11-20 18:06:14', '2024-11-20 18:06:14'),
(20, 'Tyree Roob', 'leffler.tristin@example.org', '2024-11-20 18:06:12', '$2y$12$ta4jj2kRsZ7w8hlLSO1oDuU.XN4d6F08FGkS11Ti2t3c7nWUfb0K.', 0.00, 'vYK7b3ATLG', '2024-11-20 18:06:14', '2024-11-20 18:06:14'),
(21, 'Rahsaan Rippin', 'hoeger.pauline@example.org', '2024-11-20 18:06:13', '$2y$12$DQA5m1NIUoldjTVspjt14.K.HYoCkSExmg8TI8qw.2dKp17MuVh4y', 0.00, 'RrsSKfsBf3', '2024-11-20 18:06:14', '2024-11-20 18:06:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airtime_purchases`
--
ALTER TABLE `airtime_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airtime_purchases_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `data_purchases`
--
ALTER TABLE `data_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_purchases_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `electricity_payments`
--
ALTER TABLE `electricity_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electricity_payments_transaction_id_foreign` (`transaction_id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airtime_purchases`
--
ALTER TABLE `airtime_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_purchases`
--
ALTER TABLE `data_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `electricity_payments`
--
ALTER TABLE `electricity_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airtime_purchases`
--
ALTER TABLE `airtime_purchases`
  ADD CONSTRAINT `airtime_purchases_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_purchases`
--
ALTER TABLE `data_purchases`
  ADD CONSTRAINT `data_purchases_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `electricity_payments`
--
ALTER TABLE `electricity_payments`
  ADD CONSTRAINT `electricity_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
