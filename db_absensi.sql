/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE IF NOT EXISTS `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `entry_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exit_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exit_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `time` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `attendances` (`id`, `employee_id`, `entry_ip`, `entry_location`, `exit_ip`, `exit_location`, `registered`, `created_at`, `updated_at`, `time`, `attendance_images`) VALUES
	(22, 4, '127.0.0.1', 'Ujung Hyang, Ujung, Bali, 80811, Indonesia', NULL, NULL, NULL, '2021-12-10 04:09:07', '2021-12-10 04:09:07', '23', NULL),
	(23, 3, '127.0.0.1', 'Ujung Hyang, Ujung, Bali, 80811, Indonesia', '127.0.0.1', 'Ujung Hyang, Ujung, Bali, 80811, Indonesia', 'yes', '2021-12-10 04:47:08', '2021-12-10 05:02:29', '12', NULL),
	(24, 3, '127.0.0.1', 'Jalan Situ Sari Wetan, Cijagra, Lengkong, Bandung, Jawa Barat, Jawa, 40266, Indonesia', NULL, NULL, NULL, '2023-09-11 14:44:10', '2023-09-11 14:44:10', '09', NULL),
	(25, 4, '127.0.0.1', 'Sukaasih, Bojongloa Kaler, Bandung, Jawa Barat, Jawa, 40231, Indonesia', '127.0.0.1', 'Sukaasih, Bojongloa Kaler, Bandung, Jawa Barat, Jawa, 40231, Indonesia', 'yes', '2023-09-12 08:46:08', '2023-09-12 08:46:13', '03', NULL),
	(31, 5, '127.0.0.1', 'Simpang Dago, Jalan Siliwangi, Lebak Siliwangi, Coblong, Bandung, Jawa Barat, Jawa, 40132, Indonesia', '127.0.0.1', 'Simpang Dago, Jalan Siliwangi, Lebak Siliwangi, Coblong, Bandung, Jawa Barat, Jawa, 40132, Indonesia', 'yes', '2023-09-16 10:50:24', '2023-09-16 10:51:07', '05:50:24', '1694857824_pertemuan4.jpg'),
	(32, 6, '127.0.0.1', 'HokBen, 177, Jalan Siliwangi, Lebak Siliwangi, Coblong, Bandung, Jawa Barat, Jawa, 40132, Indonesia', NULL, NULL, NULL, '2023-09-16 11:27:39', '2023-09-16 11:27:39', '06:27:39', '1694860059_pertemuan.jpg');

CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Backend Developer', '2021-12-09 03:49:38', '2021-12-09 03:50:28'),
	(2, 'Frontend Developer', '2023-09-16 10:24:45', '2023-09-16 10:24:46');

CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_date` datetime NOT NULL,
  `salary` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `employees` (`id`, `user_id`, `first_name`, `last_name`, `dob`, `sex`, `desg`, `department_id`, `join_date`, `salary`, `created_at`, `updated_at`, `photo`) VALUES
	(3, 9, 'Anul', 'Emp', '2000-12-09 00:00:00', 'Male', 'Manajer', '1', '2021-12-09 00:00:00', 220000.00, '2021-12-09 04:12:32', '2021-12-10 04:56:40', 'download_1639112200.png'),
	(4, 10, 'Muhammad', 'Rizky', '2000-12-09 00:00:00', 'Male', 'Staff', '1', '2021-12-09 00:00:00', 200000.00, '2021-12-09 07:26:16', '2021-12-09 07:26:16', 'download.png'),
	(5, 23, 'sani', 'swandika', '2023-09-12 00:00:00', 'Male', 'Staff', '1', '2023-09-12 00:00:00', 100000.00, '2023-09-12 08:54:30', '2023-09-12 08:54:30', 'user.png'),
	(6, 26, 'dara', 'atria', '2023-09-16 00:00:00', 'Female', 'Magang', '2', '2023-09-16 00:00:00', 100000.00, '2023-09-16 11:26:03', '2023-09-16 11:26:03', 'user.png');

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `expenses` (`id`, `employee_id`, `reason`, `status`, `description`, `amount`, `receipt`, `created_at`, `updated_at`) VALUES
	(1, 3, 'Isolasi Mandiri', 'approved', 'Isolasi Mandiri', 14.00, '13.20 Visualisasi - Pola Transaksi - seleksi item merah 2_1639033270.PNG', '2021-12-09 04:31:10', '2021-12-09 04:32:06'),
	(2, 3, 'Cuti', 'pending', 'Cuti', 10.00, '13.26 Visualisasi - Persentase Line Riwayat Penghasilan_1639033446.PNG', '2021-12-09 04:34:06', '2021-12-09 04:34:06'),
	(3, 3, 'bulan madu', 'pending', 'bulan madu', 14.00, '13.29 Visualisasi - Persentase Line Riwayat Penghasilan - Proses per bulan_1639033469.PNG', '2021-12-09 04:34:29', '2021-12-09 04:34:29');

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `holidays` (`id`, `name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
	(1, 'Hari Raya Idul Adha', '2021-04-06 00:00:00', '2021-04-10 00:00:00', '2021-12-09 04:16:43', '2021-12-09 08:37:52');

CREATE TABLE IF NOT EXISTS `leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `half_day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `leaves` (`id`, `employee_id`, `reason`, `description`, `half_day`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `attachment`) VALUES
	(23, 3, 'Sakit', 'asasas', 'no', '2021-12-11 00:00:00', '2022-01-13 00:00:00', 'pending', '2021-12-10 02:17:58', '2021-12-10 02:17:58', NULL),
	(24, 3, 'Sakit', 'Isolasi Mandiri', 'no', '2021-12-14 00:00:00', '2022-01-28 00:00:00', 'approved', '2021-12-10 02:18:10', '2023-09-12 08:42:09', NULL),
	(25, 3, 'Cuti', 'Bulan Madu', 'no', '2021-12-07 00:00:00', '2022-01-05 00:00:00', 'declined', '2021-12-10 02:18:38', '2021-12-10 03:36:27', NULL);

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2020_08_25_125219_create_roles_table', 1),
	(6, '2020_08_25_125921_create_role_user_table', 1),
	(7, '2020_08_25_202641_create_employees_table', 1),
	(8, '2020_08_26_074103_create_attendances_table', 1),
	(9, '2020_08_26_123244_create_departments_table', 1),
	(10, '2020_08_27_204750_create_leaves_table', 1),
	(11, '2020_08_29_112051_create_holidays_table', 1),
	(12, '2020_08_29_145328_create_expenses_table', 1),
	(13, '2020_08_30_172041_add_photo_to_employees_table', 1);

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2021-12-09 05:11:53', '2021-12-09 05:11:53'),
	(2, 'employee', '2021-12-09 05:11:53', '2021-12-09 05:11:53');

CREATE TABLE IF NOT EXISTS `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2021-12-09 05:14:00', '2021-12-09 05:14:00'),
	(2, 2, 3, '2023-09-12 09:16:42', '2023-09-12 09:16:43'),
	(4, 2, 8, '2023-09-12 09:16:45', '2023-09-12 09:16:44'),
	(5, 2, 9, '2023-09-12 09:16:46', '2023-09-12 09:16:47'),
	(6, 2, 10, '2023-09-12 09:16:48', '2023-09-12 09:16:48'),
	(7, 2, 21, NULL, NULL),
	(8, 2, 23, NULL, NULL),
	(9, 2, 24, NULL, NULL),
	(10, 2, 26, NULL, NULL);

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Firyanul Rizky', 'firyan2903@gmail.com', NULL, '$2y$10$qb6E6a9bURf7LQNLXSHe5Oub0VRoQirzGsT7ty2TwwSL4.0LjDjpi', 'eLlLD3f4NqSywHlcpZ49bYAIqDpLNL3gEaIGgb6mcFmz8cFj1Jin2FDyhEF2', '2021-12-09 02:16:16', '2021-12-09 02:16:16'),
	(3, 'Rizky Emp', 'anul@mail.com', NULL, '$2y$10$aI62xeoFxZQXVUAGzgziJOwD0ixVgjl4jhsvgkmwsm0.JWo4zJaku', 'fAgg5X2PiMa0rHCJljLeyi4XrgzLxB2Aif70oVsyHGFtGIIY8G62kWaM22cM', '2021-12-09 03:54:48', '2021-12-09 03:54:48'),
	(8, 'Anul Emp', 'anul2@mail.com', NULL, '$2y$10$wN5O1WMlRdDwY/Xgqf1vC.YOxu9Cyz3AS1AFV..4fUTFeXkpkJbgq', NULL, '2021-12-09 04:12:02', '2021-12-09 04:12:02'),
	(9, 'Anul Emp', 'anul29@mail.com', NULL, '$2y$10$m0gjjL9anL6IT.O2Es5yRuzmFxuGpWDvAXyxTtbOQGDuy9rIzcedW', '7R1HSMe2grqe9WujEfrwQbHzKxZSXeEqgPmLfunN79KuacIOFiNw43pkH0x8', '2021-12-09 04:12:32', '2021-12-09 04:12:32'),
	(10, 'Muhammad Rizky', 'firyanulrizky@outlook.com', NULL, '$2y$10$MQ0QU2vDjWlieXynE.Boq.3tHbawqmYsCBrCmfKPspTbr..hmVLay', 'XiAjQ5GJOeVINZWvW7f1OueZAkqkIaS4rQf4hcuMBVOydWMFaluqUOkLToVb', '2021-12-09 07:26:16', '2021-12-09 07:26:16'),
	(11, 'Udayana', 'udayana@mail.com', NULL, '$2y$10$jZ9zVJGRtH0ibYI3LPxVkedK8fsZNxXRp5V4OLkk6fdoaWl3VlOF.', NULL, '2021-12-09 23:26:18', '2021-12-09 23:26:18'),
	(12, 'Shinta', 'shin@mail.com', NULL, '$2y$10$xR0ACjCi9RMncc.wiwg7GO8VC9CycS13AClLfJmih5ljggxpuSUBO', NULL, '2021-12-09 23:47:13', '2021-12-09 23:47:13'),
	(13, 'test', 'test@mail.com', NULL, '$2y$10$aofq0ZvWSoDYiXJZKpBZDOZe0uXB0WkTlPpNBpwPycHNQ3LE/B9xi', NULL, '2021-12-09 23:58:03', '2021-12-09 23:58:03'),
	(14, 'test2', 'test2@mail.com', NULL, '$2y$10$YcIRIDHkJ.U6x5UHgYYoteacnJvr6FnfJmgZA/IwaYPy6m3aO.Vn2', NULL, '2021-12-09 23:59:22', '2021-12-09 23:59:22'),
	(15, 'test3', 'test3@mail.com', NULL, '$2y$10$mZqV9HWLavWS2CVcdHQjded..ZWQnyiRSJB.57VtZM2pfgmNaOnl6', NULL, '2021-12-10 00:00:11', '2021-12-10 00:00:11'),
	(16, 'test4', 'test4@mail.com', NULL, '$2y$10$ONXsqIQFmIifgqv7gARzoOiHe4KhgPv8aMMp1ZiiOIsuxC/mPeUN6', NULL, '2021-12-10 00:04:39', '2021-12-10 00:04:39'),
	(17, 'test5', 'test5@mail.com', NULL, '$2y$10$ub92c498yZ2gxOkKAxcqROGcDo2dX0rNk4kwUlXVvaSF9Qx0BjHUK', '7xLCs9d8Nd35cMYSx9YllfWlwBcZgJ6u900ObG2O1QHbw4a0BL4IGA1VVEwR', '2021-12-10 00:05:41', '2021-12-10 00:05:41'),
	(18, 'test6', 'test6@mail.com', NULL, '$2y$10$MQB4e1Leoq.isVGpXFDJ.ehwNYLMHFitKHfWHl6QCm/L4nhEll87y', NULL, '2021-12-10 00:11:33', '2021-12-10 00:11:33'),
	(19, 'test7', 'test7@mail.com', NULL, '$2y$10$h2rxb8dCDYa/UITbdYzLuOBpnhnU2Y5KzysBltrZ/hXs5MAr9zsiu', NULL, '2021-12-10 00:24:55', '2021-12-10 00:24:55'),
	(20, 'firyanul', '$2y$10$gIXVXKpd7ztC1n2cHMsisulWybfLFqVE7HZ5zsjZw6yuSjuTIwGhq', NULL, '$2y$10$LCJAveTlBFIh/vBFWClrG.ur8YqkK3Z4YykLBbPJwXNimRom2KWWm', NULL, '2021-12-10 05:24:55', '2021-12-10 05:24:55'),
	(21, 'sani swandika', 'swandikasani@gmail.com', NULL, '$2y$10$6UMTd57r8MtGqQm8eHracuZZK4qPMPgY3LJdw6Dx3RswFkLKGFukq', NULL, '2023-09-12 08:53:52', '2023-09-12 08:53:52'),
	(23, 'sani swandika', 'swandikasani1234@gmail.com', NULL, '$2y$10$nQqb1jE/jYzWODbOh7aRJOJu.vrdPsCFRfJIcTKGwN6tDyqQucNM.', NULL, '2023-09-12 08:54:30', '2023-09-12 08:54:30'),
	(26, 'dara atria', 'daraatriaferliandini@gmail.com', NULL, '$2y$10$x5OFTcvAQzy996RzyLvq5Ot/zTqiIqQOMPpewL0TORExgAfGLiDMm', NULL, '2023-09-16 11:26:03', '2023-09-16 11:26:03');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
