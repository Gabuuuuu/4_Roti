-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 15, 2022 at 08:43 PM
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
-- Database: `4roti`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `fuel`, `consumption`, `body`, `seats`, `transmission`, `year`, `price`, `image`, `created_at`, `updated_at`, `description`) VALUES
(4, 'BMW', 'M8 Grand Coupe', 'Gas', '12L/100km', 'Coupe', '2', 'Automatic', '2020', '50', '1653597098.jpg', '2022-05-26 17:31:38', '2022-05-26 17:31:38', 'A luxury car for classy people');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id_departament` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_departament` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_departament`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id_departament`, `denumire_departament`) VALUES
(1, 'Departamentul de aprovizionare/desfacere'),
(2, 'Departamentul financiar'),
(3, 'Departamentul de intretinere');

-- --------------------------------------------------------

--
-- Table structure for table `driving_licenses`
--

DROP TABLE IF EXISTS `driving_licenses`;
CREATE TABLE IF NOT EXISTS `driving_licenses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `license_type_id` int(11) NOT NULL,
  `nume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nasterii` date NOT NULL,
  `locul_nasterii` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emiterii` date NOT NULL,
  `data_expirarii` date NOT NULL,
  `autoritatea_emiterii` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CNP` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nr_permis` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permis_suspendat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `driving_licenses_employee_id_foreign` (`employee_id`),
  KEY `driving_licenses_license_type_id_foreign` (`license_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` int(10) UNSIGNED NOT NULL,
  `nume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CNP` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actDeIdentitate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nr` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataEliberarii` date NOT NULL,
  `domiciliul` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strada` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrStrada` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartament` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_inceput_ang` date NOT NULL,
  `data_semnare_contract` date NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`employee_id`),
  KEY `employees_id_departament_foreign` (`department_id`),
  KEY `employees_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `department_id`, `nume_angajat`, `prenume_angajat`, `CNP`, `actDeIdentitate`, `nr`, `dataEliberarii`, `domiciliul`, `strada`, `nrStrada`, `apartament`, `sector`, `data_inceput_ang`, `data_semnare_contract`, `role_id`) VALUES
(1, 1, 'Gabi', 'Ad', '31231331212', 'buletin', '3212', '2022-10-12', '21312321312', 'GAGA', '3123', '1321', '1', '2022-10-04', '2022-10-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fuel_type`
--

DROP TABLE IF EXISTS `fuel_type`;
CREATE TABLE IF NOT EXISTS `fuel_type` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fuel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fuel_type`
--

INSERT INTO `fuel_type` (`id`, `fuel`) VALUES
(1, 'Diesel'),
(2, 'Gas');

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
  `cardnumbers` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `brand`, `model`, `priceday`, `email`, `cardname`, `days`, `total`, `created_at`, `updated_at`, `cardnumbers`, `month`, `ccv`, `zip`) VALUES
(1, 'BMW', '640i', '40', 'Maria@gmail.com', 'Marian Popescu', '2', '80', '2022-07-13 21:07:54', '2022-07-13 21:07:54', '2345123454321234', '12/20', '901', '130031'),
(2, 'BMW', '640i', '40', 'Maria@gmail.com', 'Marian Popescu', '1', '40', '2022-07-13 21:07:45', '2022-07-13 21:07:45', '2345123454321234', '12/20', '901', '130031'),
(3, 'BMW', '640i', '40', 'Maria@gmail.com', 'Marian Popescu', '1', '40', '2022-07-13 21:07:38', '2022-07-13 21:07:38', '2345123454321234', '12/20', '901', '130031'),
(4, 'BMW', '640i', '40', 'Maria@gmail.com', 'Marian Popescu', '1', '40', '2022-07-13 21:07:38', '2022-07-13 21:07:38', '2345123454321234', '12/20', '901', '130031'),
(5, 'BMW', '640i', '40', 'Maria@gmail.com', 'Marian Popescu', '2', '80', '2022-07-13 21:07:34', '2022-07-13 21:07:34', '2345123454321234', '12/20', '901', '130031'),
(6, 'BMW', '640i', '40', 'moraruboss6@yahoo.com', 'Moraru Gabriel Danut', '1', '40', '2022-07-13 15:57:44', '2022-07-13 15:57:44', '1234123412341234', '11/24', '500', '140041'),
(7, 'BMW', '640i', '40', 'Robert@gmail.com', 'Andrei Harduchiu', '3', '120', '2022-07-13 21:08:34', '2022-07-13 21:08:34', '988823452134565', '10/13', '523', '160451'),
(8, 'BMW', 'M850', '70', 'Stefan@gmail.com', 'Stefan Harduchi', '2', '140', '2022-07-14 03:16:35', '2022-07-14 03:16:35', '1234123456789087', '11/20', '542', '160029'),
(9, 'BMW', 'M850', '70', 'moraru.gabriel00@gmail.cpm', 'Moraru Gabriel Danut', '3', '210', '2022-08-18 11:39:19', '2022-08-18 11:39:19', '6753453423432344', '12/20', '743', '170012');

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

DROP TABLE IF EXISTS `license_types`;
CREATE TABLE IF NOT EXISTS `license_types` (
  `license_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_categorie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`license_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(23, '2022_05_26_140600_create_invoices_table', 6),
(25, '2022_07_13_161454_add_role_users', 7),
(26, '2022_07_13_182108_add_details', 8),
(27, '2022_10_15_173832_create_departments_table', 9),
(28, '2022_10_15_173518_create_employees_table', 10),
(29, '2022_10_15_192804_create_roles_table', 11),
(30, '2022_10_15_194003_create_role_user_table', 12),
(31, '2022_10_15_194736_create_department_role_table', 12),
(32, '2022_10_15_194003_create_employee_role_table', 13),
(33, '2022_10_15_195953_create_department_role_table', 14),
(34, '2022_10_15_200017_create_role_employee_table', 14),
(35, '2022_10_15_200017_create_remployee_role_table', 15),
(36, '2022_10_15_200017_create_employee_role_table', 16),
(37, '2022_07_13_161454_add_role_employee', 17),
(38, '2022_10_15_203459_create_license_type', 18),
(39, '2022_10_15_203633_create_driving_licenses', 18);

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13, 'App\\Models\\User', 2, 'auth_token', '868a4fb3e97a83614c4a0bc3ac48a2867d3e7b9cb311d10c5223fe1bb676660e', '[\"*\"]', NULL, '2022-05-29 06:50:02', '2022-05-29 06:50:02'),
(14, 'App\\Models\\User', 2, 'auth_token', 'e9e43397d594360b8c54c9cf336f912c5f2378706932c987d74cf48708bb5b03', '[\"*\"]', NULL, '2022-07-02 11:53:39', '2022-07-02 11:53:39'),
(15, 'App\\Models\\User', 2, 'auth_token', '4903b35d1865da6c909dd6d66e55c177120d92005baf03651df48642e55ba6c6', '[\"*\"]', NULL, '2022-07-02 12:35:20', '2022-07-02 12:35:20'),
(16, 'App\\Models\\User', 2, 'auth_token', '5ba2eb740e56e024547637e8a589b6ba34f3472cb3d52b09aa84e8645970289c', '[\"*\"]', NULL, '2022-07-02 12:48:13', '2022-07-02 12:48:13'),
(17, 'App\\Models\\User', 2, 'auth_token', 'b88f498f229d43b4404e9191398692a594064516da2d86dbae6d73e5b2f364f0', '[\"*\"]', NULL, '2022-07-05 03:26:34', '2022-07-05 03:26:34'),
(18, 'App\\Models\\User', 2, 'auth_token', '751a58e0f6cdfa9a58901178149b4ccd22e8e17ac4200b9096251add0bd905f8', '[\"*\"]', NULL, '2022-07-12 10:46:23', '2022-07-12 10:46:23'),
(19, 'App\\Models\\User', 3, 'auth_token', 'f5fd55dea622962b18de233380d057b8fa755fe2f26a669b7d14c730949ac645', '[\"*\"]', NULL, '2022-07-13 13:18:39', '2022-07-13 13:18:39'),
(20, 'App\\Models\\User', 2, 'auth_token', 'bb7f5f4da0e516a6cff87f1716fa3de885c1fea6ee0c75974de537b3c266b9f6', '[\"*\"]', NULL, '2022-07-13 13:24:22', '2022-07-13 13:24:22'),
(21, 'App\\Models\\User', 2, 'auth_token', '7031d931b922fce84c5e6f5bcd8eb95cbb82c587c7000e42cd659128b4e34dbe', '[\"*\"]', NULL, '2022-07-13 13:25:53', '2022-07-13 13:25:53'),
(22, 'App\\Models\\User', 2, 'auth_token', 'f8f8986e1096baf12d0babc6bffff2b47ea494a7d584d2e20cd038dc7f7cbf67', '[\"*\"]', NULL, '2022-07-13 13:35:24', '2022-07-13 13:35:24'),
(23, 'App\\Models\\User', 2, 'auth_token', 'f8ddc2c7e8800ecdcb4dccbec1bbd01eb668857c58c46dc3468782eb41206e4a', '[\"*\"]', NULL, '2022-07-13 13:35:49', '2022-07-13 13:35:49'),
(24, 'App\\Models\\User', 2, 'auth_token', 'f8d47d1af7d5b86db8211a31043f2ab1baf36e3c7f9f60ac4d9a4d627a1a12e7', '[\"*\"]', NULL, '2022-07-13 13:37:17', '2022-07-13 13:37:17'),
(25, 'App\\Models\\User', 2, 'auth_token', 'a499e8483e7e0cc1829b70244d0ba940454aba9b9f3d696521ee21513316d27c', '[\"*\"]', NULL, '2022-07-13 13:37:47', '2022-07-13 13:37:47'),
(26, 'App\\Models\\User', 4, 'auth_token', '5052fb09a4557bf238f90e43a73932a0fc2406bb5d6ba7c9ded66b83dc698cd2', '[\"*\"]', NULL, '2022-07-13 13:42:30', '2022-07-13 13:42:30'),
(27, 'App\\Models\\User', 2, 'auth_token', '2fd3d2ec6ebda74b51ee1ffc5fa3e8e23f7788712b57e422d95a7339883875d3', '[\"*\"]', NULL, '2022-07-13 13:44:28', '2022-07-13 13:44:28'),
(28, 'App\\Models\\User', 2, 'auth_token', '51bf62f52045c279b84c9f437d0f619b5fe7ffbbc4b104bcd2511a7f90edc376', '[\"*\"]', NULL, '2022-07-13 13:46:16', '2022-07-13 13:46:16'),
(29, 'App\\Models\\User', 2, 'auth_token', '101d65ad84fb7b8a088a1350d7373f369865ac6101d12fd15586dc7a6a8cde74', '[\"*\"]', NULL, '2022-07-13 13:47:53', '2022-07-13 13:47:53'),
(30, 'App\\Models\\User', 2, 'auth_token', 'cbfd2e39eeaa0be521cb0e636320e03c3e848d101f11bc0771b9aaeed0c227a3', '[\"*\"]', NULL, '2022-07-13 13:48:20', '2022-07-13 13:48:20'),
(31, 'App\\Models\\User', 2, 'auth_token', 'bc1a2f507c4811b56cba5f327f1b403c3f5ad8d7f9c28822bb9211b7a3c71472', '[\"*\"]', NULL, '2022-07-13 13:50:30', '2022-07-13 13:50:30'),
(32, 'App\\Models\\User', 4, 'auth_token', 'b5fabcdce0f444d095a6e479bd3303b5bd7627e99041bca5c53bd78172fcd077', '[\"*\"]', NULL, '2022-07-13 13:55:45', '2022-07-13 13:55:45'),
(33, 'App\\Models\\User', 2, 'auth_token', '9d93655f28e297f1bdc21ef57be650273cc802877bf4f75db138725d91663aa2', '[\"*\"]', NULL, '2022-07-13 15:58:14', '2022-07-13 15:58:14'),
(34, 'App\\Models\\User', 5, 'auth_token', '376f8ea146b6bcf6b51cf4fd97943fe2362ff0b89d60dfce5c38da504bf840a2', '[\"*\"]', NULL, '2022-07-13 20:57:04', '2022-07-13 20:57:04'),
(35, 'App\\Models\\User', 6, 'auth_token', '36aed5dfa27a094ef6f766cad530346b1f5388b67c7ef4c4bc910dd3bfbd5b20', '[\"*\"]', NULL, '2022-07-13 20:57:37', '2022-07-13 20:57:37'),
(36, 'App\\Models\\User', 7, 'auth_token', '7ce277dd389ccbdabcbcbab448b76b474e4666acfe885023947258f71dee3432', '[\"*\"]', NULL, '2022-07-13 20:57:55', '2022-07-13 20:57:55'),
(37, 'App\\Models\\User', 8, 'auth_token', '0ff7929ffe285dd1a4850428f3c926dc39cc699197902edff865b1582d2b02f6', '[\"*\"]', NULL, '2022-07-13 20:58:11', '2022-07-13 20:58:11'),
(38, 'App\\Models\\User', 9, 'auth_token', '9764aa606616c483d48965fda662f89be1ca94faf2c936e8aec6b993123e3d45', '[\"*\"]', NULL, '2022-07-13 20:58:41', '2022-07-13 20:58:41'),
(39, 'App\\Models\\User', 9, 'auth_token', '696322299a0eb23bafb2c4f3dffa02ea1228aa26f2728f1309ffbb3b0c36e0a0', '[\"*\"]', NULL, '2022-07-13 20:59:23', '2022-07-13 20:59:23'),
(40, 'App\\Models\\User', 9, 'auth_token', '34617a64c863b717373e6d28d5bf53e8dee566e1640846028968a84d9c5735fb', '[\"*\"]', NULL, '2022-07-13 21:48:19', '2022-07-13 21:48:19'),
(41, 'App\\Models\\User', 9, 'auth_token', '664b437072b85e2121099cb801a262772341e29fa41cb2ec94dae2439edeb9b7', '[\"*\"]', NULL, '2022-07-14 06:22:46', '2022-07-14 06:22:46'),
(42, 'App\\Models\\User', 9, 'auth_token', '20399860772fd63f6ea75fcd8ac3ddcd60057a48256e9cf80bd912c86edcc104', '[\"*\"]', NULL, '2022-07-30 09:03:23', '2022-07-30 09:03:23'),
(43, 'App\\Models\\User', 9, 'auth_token', 'd69dd8f1ad9ee7fb08cf68c456a9e31acaa6e5d0f8fa49d188ceb600cefcce5f', '[\"*\"]', NULL, '2022-08-03 18:55:09', '2022-08-03 18:55:09'),
(44, 'App\\Models\\User', 9, 'auth_token', '6f4e8f932fdd40282ef95a6b5042799e1dcf722a6b794b6a242ae8d8682f89f0', '[\"*\"]', NULL, '2022-08-10 05:56:45', '2022-08-10 05:56:45'),
(45, 'App\\Models\\User', 9, 'auth_token', '1dbf14fe151a5cbf8b4c9bf5338d40ca364e908f2dad24fce35fee5943545c24', '[\"*\"]', NULL, '2022-08-10 08:40:35', '2022-08-10 08:40:35'),
(46, 'App\\Models\\User', 9, 'auth_token', 'ff91975b768dad6232a6a1b7ce8d2e5d9cb64f27c38c9c08508c28c44b20793b', '[\"*\"]', NULL, '2022-08-21 13:59:38', '2022-08-21 13:59:38'),
(47, 'App\\Models\\User', 9, 'auth_token', '0391ab90a8a40b73ce66b0eceaa43301e74ff002b86cf62b1c04d24ec3b5f0d6', '[\"*\"]', NULL, '2022-08-21 14:00:18', '2022-08-21 14:00:18'),
(48, 'App\\Models\\User', 9, 'auth_token', 'cd5556ddd59ab49026a5bf9c09b4b58985884445fbeb851387f4db657d3d97a5', '[\"*\"]', NULL, '2022-08-21 14:01:49', '2022-08-21 14:01:49'),
(49, 'App\\Models\\User', 10, 'auth_token', '39b0c304c4f7f19dcadec34bb669fc9fed1aaab9f794d489350b2a3d0930696a', '[\"*\"]', NULL, '2022-08-21 14:40:35', '2022-08-21 14:40:35'),
(50, 'App\\Models\\User', 10, 'auth_token', 'bf765c9594c67013e7fafe4ebe7088a98998e660481d7cf2994dc8151db57ed3', '[\"*\"]', NULL, '2022-08-21 14:43:14', '2022-08-21 14:43:14'),
(51, 'App\\Models\\User', 11, 'auth_token', 'e803095bd4183e44dc1e69ea2d61eb94aaeffcac6f978da0cc535a9df4316ce9', '[\"*\"]', NULL, '2022-08-21 14:45:01', '2022-08-21 14:45:01'),
(52, 'App\\Models\\User', 9, 'auth_token', 'ebb8197fff01509fa4562e03ae454fceeb4f725771cebd8fceea9a4f50c1fc61', '[\"*\"]', NULL, '2022-08-21 14:45:34', '2022-08-21 14:45:34'),
(53, 'App\\Models\\User', 11, 'auth_token', 'e9bb73c9d5e16357572c29c90fa2d76636faafd4da67617f75d9722d312a1bb6', '[\"*\"]', NULL, '2022-08-21 14:48:02', '2022-08-21 14:48:02'),
(54, 'App\\Models\\User', 9, 'auth_token', '7be708d81dec6998328aaa287eb5ab0015e5302d4ad00449e8d742649e155d7b', '[\"*\"]', NULL, '2022-08-21 14:54:56', '2022-08-21 14:54:56'),
(55, 'App\\Models\\User', 11, 'auth_token', '242dcfba838d1d3b85301fbf58b1659c8940e698e3fe6611b3cf6298b217520f', '[\"*\"]', NULL, '2022-08-21 14:56:52', '2022-08-21 14:56:52'),
(56, 'App\\Models\\User', 9, 'auth_token', '5fadf948d0a194309ed8b9853540e8fb24b59e1d600a4869ee5a48448a216d47', '[\"*\"]', NULL, '2022-08-21 15:03:14', '2022-08-21 15:03:14'),
(57, 'App\\Models\\User', 11, 'auth_token', '7fa1450a4d031a8263ed09deb6342ce69f8a507644484c2a89c1f5cc29301d93', '[\"*\"]', NULL, '2022-08-21 15:05:47', '2022-08-21 15:05:47'),
(58, 'App\\Models\\User', 9, 'auth_token', 'ac7157f8f45350b100e566f68dfbbfb67e5fe1e3bd00fe1908198b3c73a97ffc', '[\"*\"]', NULL, '2022-08-21 15:18:22', '2022-08-21 15:18:22'),
(59, 'App\\Models\\User', 11, 'auth_token', '896239b11502fa2394a833f4ebb161c8d7d294dea2cbf6b355e00d22714d46b3', '[\"*\"]', NULL, '2022-08-21 15:23:23', '2022-08-21 15:23:23'),
(60, 'App\\Models\\User', 9, 'auth_token', 'c57ea52bdd633044c5c4379db0bc57756b2c362d0cb485cfc8bef02b1557e29d', '[\"*\"]', NULL, '2022-08-21 15:33:46', '2022-08-21 15:33:46'),
(61, 'App\\Models\\User', 7, 'auth_token', 'ebbc4be010eaef6c2952e7e178a7b6f7312fd9070632d7eb773670ab86726716', '[\"*\"]', NULL, '2022-08-22 06:23:03', '2022-08-22 06:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire-rol` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `denumire-rol`) VALUES
(1, 'Director'),
(2, 'Guest');

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
  `role` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin1', 'admin1@gmail.com', NULL, '$2y$10$WRewoi7b1Gg6sL//jkGN4.ZUFwuLcHQ.67zqeSthjaf3nohPJi4O.', NULL, '2022-04-04 10:00:11', '2022-04-04 10:00:11', 1),
(2, 'MoraruGabriel', 'testingemail@gmail.com', NULL, '$2y$10$GeDsJRLE5ojhExR6VL4Zrupmf2u0XacQtmQqkE3SYw3XyETjc.9vK', NULL, '2022-07-13 13:42:30', '2022-08-21 09:34:17', 1),
(3, 'Georgescu', 'Georgescu@gmail.com', NULL, '$2y$10$K9N3oHwFz7kEaNRvhhjsl.D7qvXyZI1wtm00CYQe4Qoll00EXmFzy', NULL, '2022-07-13 20:57:04', '2022-07-13 20:57:04', 0),
(4, 'PopescuPetrica', 'PopescuPetrica@gmail.com', NULL, '$2y$10$tVwBPRiHL.Fzs1FqrKEFpu7s/WY7rnYGhibj3CzKtXLbm5VKGblhG', NULL, '2022-07-13 20:57:37', '2022-07-13 20:57:37', 0),
(5, 'MariaIoana', 'MariaIoana@gmail.com', NULL, '$2y$10$d/hX53xG9PyGf7ceS0G8TevSAkD6KGSuMCNMhrlsDQgRSOQpF3MOC', NULL, '2022-07-13 20:57:55', '2022-07-13 20:57:55', 0),
(6, 'IleanaCosanzeana', 'IleanaCosanzeana@gmail.com', NULL, '$2y$10$XGwj5cGkuHmF7qWOdDRyY.kRmOZh62eLDLsrTXoEmXKr.PNaaJxCe', NULL, '2022-07-13 20:58:11', '2022-07-14 03:11:02', 1),
(7, 'MoraruGabriel', 'moraru.gabriel00@gmail.com', NULL, '$2y$10$HQ2IR6XbRGNpxa2Vjg4yIO3ZYYDKlO2JfdcGelI9BHz9iSzPP0yDi', NULL, '2022-07-13 20:58:41', '2022-08-21 14:17:25', 1),
(8, 'asdfasf', 'asdasf@gmail.com', NULL, '$2y$10$IJ50lSxiyfsHYSrFP499pu8EU5RmEiuw40XGd.ygTCouP4R64FmB6', NULL, '2022-08-21 14:40:35', '2022-08-21 14:40:35', 0),
(9, 'qwert413', 'qwert@gmail.com', NULL, '$2y$10$O.EQe54GQTFF43nROYgNNehV/s3Pxcav2uGFWNOnpFv7PuKU/9caO', NULL, '2022-08-21 14:45:01', '2022-08-21 14:45:01', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
