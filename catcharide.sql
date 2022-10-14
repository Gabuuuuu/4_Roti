-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 29, 2022 at 10:27 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catcharide`
--

-- --------------------------------------------------------

--
-- Table structure for table `body_type`
--

DROP TABLE IF EXISTS `body_type`;
CREATE TABLE IF NOT EXISTS `body_type` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `body_type`
--

INSERT INTO `body_type` (`id`, `body`) VALUES
(1, 'Sedan'),
(2, 'Coupe'),
(3, 'Hatchback'),
(4, 'SUV'),
(5, 'Crossover'),
(6, 'Convertibles');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand`) VALUES
(1, 'BMW\r\n'),
(2, 'AUDI'),
(3, 'MERCEDES'),
(4, 'Volkswagen'),
(5, 'Tesla'),
(6, 'Porsche'),
(7, 'Lexus'),
(8, 'Volvo'),
(9, 'Lamborghini'),
(10, 'Ferrari'),
(11, 'Jaguar'),
(12, 'Cadillac'),
(13, 'Rolls-Royce'),
(14, 'Maserati'),
(15, 'Opel');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transmission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cars_description_unique` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `fuel`, `consumption`, `body`, `seats`, `transmission`, `year`, `price`, `image`, `created_at`, `updated_at`, `description`) VALUES
(2, 'BMW', '640i', 'Gas', '12L/100km', 'Coupe', '2', 'Automatic', '2020', '40', '1653506001.jpg', '2022-05-25 16:13:21', '2022-05-25 16:13:21', 'Masina intretinuta de o babuta din Germania'),
(3, 'BMW', 'M850', 'Gas', '15L/100km', 'Coupe', '2', 'Automatic', '2022', '70', '1653596946.jpg', '2022-05-26 17:29:06', '2022-05-26 17:29:06', 'One of the fastest models from the BMW series'),
(4, 'BMW', 'M750', 'Gas', '14L/100km', 'Hatchback', '5', 'Automatic', '2021', '60', '1653596974.jpg', '2022-05-26 17:29:34', '2022-05-26 17:29:34', 'Some really good model'),
(5, 'BMW', 'M650', 'Gas', '12L/100km', 'Hatchback', '5', 'Automatic', '2020', '50', '1653597036.jpg', '2022-05-26 17:30:36', '2022-05-26 17:30:36', 'A fast car for enthusiasts'),
(6, 'BMW', 'M8 Grand Coupe', 'Gas', '12L/100km', 'Coupe', '2', 'Automatic', '2020', '50', '1653597098.jpg', '2022-05-26 17:31:38', '2022-05-26 17:31:38', 'A luxury car for classy people'),
(7, 'AUDI', 'Audi Q8', 'Gas', '10L/100km', 'SUV', '5', 'Automatic', '2010', '40', '1653597190.jpg', '2022-05-26 17:33:10', '2022-05-26 17:33:10', 'A really good car'),
(8, 'Opel', 'Opel Air Force One', 'Kerosene', '5l/100km', 'Hatchback', '5', 'Manual', '2004', '400', '1653597697.jpg', '2022-05-26 17:41:38', '2022-05-26 17:41:38', 'Em line paket/Evacoare Tzeava goala/km apsolut real 199000/inport Germaneea/Nu a avut volan pe dreapta promit/Trage periculos fara urma de fum');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_type`
--

DROP TABLE IF EXISTS `fuel_type`;
CREATE TABLE IF NOT EXISTS `fuel_type` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fuel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fuel_type`
--

INSERT INTO `fuel_type` (`id`, `fuel`) VALUES
(1, 'Diesel'),
(2, 'Gas'),
(3, 'Kerosene');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priceday` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cardname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `brand`, `model`, `priceday`, `email`, `cardname`, `days`, `total`, `created_at`, `updated_at`) VALUES
(4, 'AUDI', 'Audi Q8', '40', 'Bepis@gmail.com', 'Bepis Barin', '3', '120', '2022-05-26 17:51:09', '2022-05-26 17:51:09'),
(5, 'AUDI', 'Audi Q8', '40', 'goga@gmail.com', 'Octavian Goga', '1', '40', '2022-05-26 17:52:10', '2022-05-26 17:52:10'),
(6, 'AUDI', 'Audi Q8', '40', 'goga@gmail.com', 'Octavian Goga', '3', '120', '2022-05-26 17:52:12', '2022-05-26 17:52:12'),
(7, 'AUDI', 'Audi Q8', '40', 'octavian@gmail.com', 'Octavian Radoi', '3', '120', '2022-05-26 17:52:24', '2022-05-26 17:52:24'),
(8, 'AUDI', 'Audi Q8', '40', 'octavian@gmail.com', 'Octavian Radoi', '1', '40', '2022-05-26 17:52:26', '2022-05-26 17:52:26'),
(9, 'BMW', 'M850', '70', 'Marian@gmail.com', 'Marian Gogu', '3', '210', '2022-05-26 17:54:31', '2022-05-26 17:54:31'),
(10, 'BMW', 'M850', '70', 'Marian@gmail.com', 'Marian Gogu', '1', '70', '2022-05-26 17:54:33', '2022-05-26 17:54:33'),
(11, 'BMW', 'M850', '70', 'Robert@gmail.com', 'Robert Badoi', '1', '70', '2022-05-26 17:54:44', '2022-05-26 17:54:44'),
(12, 'BMW', 'M850', '70', 'Robert@gmail.com', 'Robert Badoi', '3', '210', '2022-05-26 17:54:45', '2022-05-26 17:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(15, '2022_04_13_120803_brand', 3),
(16, '2022_04_13_121023_fuel_type', 3),
(17, '2022_04_13_121055_body_type', 3),
(18, '2022_04_13_121111_seats', 3),
(19, '2022_04_13_121122_transmission', 3),
(21, '2022_04_04_084544_create_car_controllers_table', 4),
(22, '2022_05_25_190030_add_description_cars', 5),
(23, '2022_05_26_140600_create_invoices_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'dc0b7d9591bca656210a38c66069c2ce155b2e7057853e691451c0ca31bc6949', '[\"*\"]', NULL, '2022-04-13 05:56:32', '2022-04-13 05:56:32'),
(2, 'App\\Models\\User', 1, 'auth_token', '690ff3c20627c8f6920f4513be0c00f948a9f03987f02dfe74c7f83ac5978ad4', '[\"*\"]', NULL, '2022-04-13 08:59:11', '2022-04-13 08:59:11'),
(3, 'App\\Models\\User', 1, 'auth_token', 'a55fe566e48dd0015abea34d950646ee577ba9197a886879249806745ee863e8', '[\"*\"]', NULL, '2022-04-13 09:20:09', '2022-04-13 09:20:09'),
(4, 'App\\Models\\User', 1, 'auth_token', '5d5dce73e2444c663515b9a5781e2216be3b63f7e6b8c9dfd32b83e7e1b9d20a', '[\"*\"]', NULL, '2022-04-13 10:02:07', '2022-04-13 10:02:07'),
(5, 'App\\Models\\User', 1, 'auth_token', '8601cb99f590c85dc4526db6acc54193f37a0548f1d297846441cab60eae8bd9', '[\"*\"]', NULL, '2022-04-13 10:58:56', '2022-04-13 10:58:56'),
(6, 'App\\Models\\User', 1, 'auth_token', '8d86882fdb3243edf67b0b634a7d403f1ae9041fb913a9e2ee893d6e686f5382', '[\"*\"]', NULL, '2022-04-13 14:55:48', '2022-04-13 14:55:48'),
(7, 'App\\Models\\User', 1, 'auth_token', 'c1198934a42d18d4d5ccf18f42b2e234d52d735e9660a2d47487f92f9f988bf4', '[\"*\"]', NULL, '2022-04-13 15:43:06', '2022-04-13 15:43:06'),
(8, 'App\\Models\\User', 1, 'auth_token', 'f1a28dbff0afc1c98d9a94e58b2aa11c23c555a861f2218c4fd59329473219e8', '[\"*\"]', NULL, '2022-04-14 06:01:54', '2022-04-14 06:01:54'),
(9, 'App\\Models\\User', 1, 'auth_token', 'ce3b26d135a4b31488e1bbab486416a80201a22c4053d6d28d8d0af27768df7b', '[\"*\"]', NULL, '2022-04-16 09:34:26', '2022-04-16 09:34:26'),
(10, 'App\\Models\\User', 2, 'auth_token', 'a84ba9af29fa822667fab336eb2f315553e53844208d552013467345e60574d6', '[\"*\"]', NULL, '2022-05-25 18:05:31', '2022-05-25 18:05:31'),
(11, 'App\\Models\\User', 2, 'auth_token', '070d750e9ac14e3f2b4041a42ceffe841b1eae13bd1564ee8c4f94cfb7f7e39e', '[\"*\"]', NULL, '2022-05-26 15:53:07', '2022-05-26 15:53:07'),
(12, 'App\\Models\\User', 2, 'auth_token', '352251804feaf11b359e67bdfb85c0505688720fcba430496a6cf60bcedbee80', '[\"*\"]', NULL, '2022-05-28 09:18:12', '2022-05-28 09:18:12'),
(13, 'App\\Models\\User', 2, 'auth_token', '868a4fb3e97a83614c4a0bc3ac48a2867d3e7b9cb311d10c5223fe1bb676660e', '[\"*\"]', NULL, '2022-05-29 06:50:02', '2022-05-29 06:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seats` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `seats`) VALUES
(1, '2'),
(2, '5'),
(3, '6'),
(4, '7');

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
CREATE TABLE IF NOT EXISTS `transmission` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transmission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`id`, `transmission`) VALUES
(1, 'Automatic'),
(2, 'Manual');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin1', 'admin1@gmail.com', NULL, '$2y$10$WRewoi7b1Gg6sL//jkGN4.ZUFwuLcHQ.67zqeSthjaf3nohPJi4O.', NULL, '2022-04-04 10:00:11', '2022-04-04 10:00:11'),
(2, 'gabiboss123', 'moraruboss6@yahoo.com', NULL, '$2y$10$sS4jcXxXVGS.1RJ2hPl6CODxHOhL09NUKMzygyDgXE8MkptZA9pUG', NULL, '2022-05-25 18:05:31', '2022-05-25 18:05:31');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
