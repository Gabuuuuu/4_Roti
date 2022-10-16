-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 16, 2022 at 09:11 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivered_fridges_invoices`
--

DROP TABLE IF EXISTS `delivered_fridges_invoices`;
CREATE TABLE IF NOT EXISTS `delivered_fridges_invoices` (
  `delivered_fridges_invoice_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fridge_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nume_beneficiar` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nr_telefon` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresa_livrare` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_postal` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantitate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxa_livrare` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pret` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pret_total` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emiterii` date NOT NULL,
  PRIMARY KEY (`delivered_fridges_invoice_id`),
  KEY `delivered_fridges_invoices_user_id_foreign` (`user_id`),
  KEY `delivered_fridges_invoices_fridge_id_foreign` (`fridge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_departament` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `denumire_departament`) VALUES
(1, 'Departamentul de aprovizionare/desfacere'),
(2, 'Departamentul financiar'),
(3, 'Departamentul de întreţinere vehicule');

-- --------------------------------------------------------

--
-- Table structure for table `driving_licenses`
--

DROP TABLE IF EXISTS `driving_licenses`;
CREATE TABLE IF NOT EXISTS `driving_licenses` (
  `driving_license_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`driving_license_id`),
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
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `nume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenume_angajat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CNP` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actDeIdentitate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nr` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataEliberarii` date DEFAULT NULL,
  `domiciliul` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strada` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrStrada` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartament` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sector` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_inceput_ang` date DEFAULT NULL,
  `data_semnare_contract` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `employees_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `role_id`, `nume_angajat`, `prenume_angajat`, `CNP`, `actDeIdentitate`, `nr`, `dataEliberarii`, `domiciliul`, `strada`, `nrStrada`, `apartament`, `sector`, `data_inceput_ang`, `data_semnare_contract`) VALUES
(1, 2, 'Gabi', 'Gabitzu', '31231331212', 'buletin', '3212', '2022-10-12', '21312321312', 'GAGA', '3123', '1321', '1', '2022-10-04', '2022-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
CREATE TABLE IF NOT EXISTS `fines` (
  `fine_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `data_emiterii` date NOT NULL,
  `pret_daune` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `fines_employee_id_foreign` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fridge_invoices`
--

DROP TABLE IF EXISTS `fridge_invoices`;
CREATE TABLE IF NOT EXISTS `fridge_invoices` (
  `fridge_invoice_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `denumire_model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pret` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantitate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emiterii` date NOT NULL,
  PRIMARY KEY (`fridge_invoice_id`),
  KEY `fridge_invoices_supplier_id_foreign` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fridge_models`
--

DROP TABLE IF EXISTS `fridge_models`;
CREATE TABLE IF NOT EXISTS `fridge_models` (
  `fridge_model_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `an_fabricatie` date NOT NULL,
  `greutate` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consum_energetic` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calitate` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volum` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pret` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fridge_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `insurance_companies`
--

DROP TABLE IF EXISTS `insurance_companies`;
CREATE TABLE IF NOT EXISTS `insurance_companies` (
  `insurance_company_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_companie_asigurari` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`insurance_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_types`
--

DROP TABLE IF EXISTS `insurance_types`;
CREATE TABLE IF NOT EXISTS `insurance_types` (
  `insurance_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tip_asigurare` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`insurance_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(39, '2022_10_15_203633_create_driving_licenses', 18),
(40, '2022_10_16_094007_create_fines_table', 19),
(41, '2022_10_16_100450_create_insurance_companies_table', 20),
(42, '2022_10_16_100550_create_insurance_types_table', 20),
(43, '2022_10_16_101125_create_suppliers_table', 21),
(44, '2022_10_16_101224_create_fridge_models_table', 21),
(45, '2022_10_16_101531_create_fridge_invoices_table', 21),
(46, '2022_10_16_101933_create_delivered_fridges_invoices_table', 22),
(47, '2022_10_16_114210_add_employee_id_column', 23),
(48, '2022_10_16_114415_remove_role_id_column', 23),
(49, '2022_10_16_115657_add_department_id_column', 23),
(50, '2022_10_16_121143_add_employee_id_column', 24),
(51, '2022_10_15_173518_create_employees_table2', 25),
(52, '2022_10_15_173832_create_departments_table2', 26),
(53, '2022_10_15_192804_create_roles_table2', 27),
(54, '2022_10_15_203633_create_driving_licenses2', 27),
(55, '2022_10_16_094007_create_fines_table2', 27),
(56, '2022_10_16_100450_create_insurance_companies_table2', 27),
(57, '2022_10_16_100550_create_insurance_types_table2', 27),
(58, '2022_10_16_101125_create_suppliers_table2', 28),
(59, '2022_10_16_101224_create_fridge_models_table2', 28),
(60, '2022_10_16_101531_create_fridge_invoices_table2', 28),
(61, '2022_10_16_101933_create_delivered_fridges_invoices_table2', 28),
(62, '2022_10_15_173518_create_employees_table3', 29),
(63, '2022_10_16_115657_add_department_1id_column', 30),
(64, '2014_10_12_000000_create_users_table1', 31),
(65, '2014_10_12_000000_create_users_table2', 32),
(66, '2022_10_15_173518_create_employees_table4', 32),
(67, '2014_10_12_000000_create_users_table4', 33),
(68, '2014_10_12_000000_create_users_table5', 34),
(69, '2022_10_16_101933_create_delivered_fridges_invoices_table3', 35),
(70, '2022_10_16_153048_update_employees_table', 36),
(71, '2014_10_12_000000_create_users_table6', 37),
(72, '2022_10_15_173518_create_employees_table5', 38);

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(61, 'App\\Models\\User', 7, 'auth_token', 'ebbc4be010eaef6c2952e7e178a7b6f7312fd9070632d7eb773670ab86726716', '[\"*\"]', NULL, '2022-08-22 06:23:03', '2022-08-22 06:23:03'),
(62, 'App\\Models\\User', 1, 'auth_token', '925ce96cd6eb3958c83a171802d4268f2b546a1be3e2f73a23f2d6ab2d6d0dd4', '[\"*\"]', NULL, '2022-10-16 10:04:56', '2022-10-16 10:04:56'),
(63, 'App\\Models\\User', 2, 'auth_token', '508b865a8ed1cf70936e5fd3499936b2cfc82a300d20e9c9f0bd40af795ec292', '[\"*\"]', NULL, '2022-10-16 10:41:54', '2022-10-16 10:41:54'),
(64, 'App\\Models\\User', 3, 'auth_token', 'a6c8e0f2ada453fb38c1353e1e1ba46021640f31fa30d0c8d54d9734ac9d7bcd', '[\"*\"]', NULL, '2022-10-16 10:49:30', '2022-10-16 10:49:30'),
(65, 'App\\Models\\User', 4, 'auth_token', '9d8336e87ad833fdf918b2fac88ce6046cd993c47844aaccfdcb37822369d8d6', '[\"*\"]', NULL, '2022-10-16 10:50:41', '2022-10-16 10:50:41'),
(66, 'App\\Models\\User', 5, 'auth_token', '9faceeab2c940bf0473f9ea62d3aa0532394529bd7cfd94772227eb45f74ff20', '[\"*\"]', NULL, '2022-10-16 10:53:14', '2022-10-16 10:53:14'),
(67, 'App\\Models\\User', 6, 'auth_token', '960395d0c74f208999e71698acb92f6cb2e412406eec263b28fb6f06b270d581', '[\"*\"]', NULL, '2022-10-16 10:56:15', '2022-10-16 10:56:15'),
(68, 'App\\Models\\User', 7, 'auth_token', '4a5ce15f5b81a0071cf58450764be7e0fefe6c77352ef489020fcf9fe343c24d', '[\"*\"]', NULL, '2022-10-16 11:00:34', '2022-10-16 11:00:34'),
(69, 'App\\Models\\User', 8, 'auth_token', '7e0b668d641c7bc9bcc1112344ac1b477d5b1655607649892893930ad1ed8948', '[\"*\"]', NULL, '2022-10-16 11:00:59', '2022-10-16 11:00:59'),
(70, 'App\\Models\\User', 9, 'auth_token', 'c8c13f1ebc8e4afc48bdb27de8cd5400c4f53c8d8dc63016c6a91a7e08dbfe75', '[\"*\"]', NULL, '2022-10-16 11:01:53', '2022-10-16 11:01:53'),
(71, 'App\\Models\\User', 10, 'auth_token', '1d8a431dafe991add8e81b43e7b0e7083ec0c336cb922cc9433c8d7758f46df0', '[\"*\"]', NULL, '2022-10-16 11:02:40', '2022-10-16 11:02:40'),
(72, 'App\\Models\\User', 11, 'auth_token', '249adb919d6505a7992ad62b9a8086c0152a2dc4fa3df6445f7c75bd3dce160f', '[\"*\"]', NULL, '2022-10-16 11:10:55', '2022-10-16 11:10:55'),
(73, 'App\\Models\\User', 12, 'auth_token', '43979efad536f7d4b2d8083c5797e0c135864055850d1a8fb95f46ec8c175022', '[\"*\"]', NULL, '2022-10-16 11:30:07', '2022-10-16 11:30:07'),
(74, 'App\\Models\\User', 13, 'auth_token', 'a276c2dd8517fcf552069ccb10c643e5a6a8a2f5cace70ab088858412aee2a23', '[\"*\"]', NULL, '2022-10-16 11:35:09', '2022-10-16 11:35:09'),
(75, 'App\\Models\\User', 12, 'auth_token', '2b9266cbd7ec74fcb0da38e5f5c4be0c3f998c9433c3d44f77f602351503ba18', '[\"*\"]', NULL, '2022-10-16 11:46:55', '2022-10-16 11:46:55'),
(76, 'App\\Models\\User', 12, 'auth_token', '87e2e8eb5147108bb18da989dad1f0ba907fc1211ffdd2bfc78c7ea7f142fa5d', '[\"*\"]', NULL, '2022-10-16 11:48:21', '2022-10-16 11:48:21'),
(77, 'App\\Models\\User', 12, 'auth_token', '568133c305b88713ff0587b039f571f538edcd0a676b8f321f742e17176a577a', '[\"*\"]', NULL, '2022-10-16 11:51:58', '2022-10-16 11:51:58'),
(78, 'App\\Models\\User', 12, 'auth_token', '32677b86bf9ffbaccdacee07efbcc792b94d22bfe89a96e3f5456ff91d27f65a', '[\"*\"]', NULL, '2022-10-16 12:22:54', '2022-10-16 12:22:54'),
(79, 'App\\Models\\User', 1, 'auth_token', 'b99b9012aae05b2db7d3fc1e0572cb6ab7c330ef9536aa552cf7aa6d77c5367e', '[\"*\"]', NULL, '2022-10-16 12:48:55', '2022-10-16 12:48:55'),
(80, 'App\\Models\\User', 1, 'auth_token', '8cfda47563fd96e284cade51be83c040637b5d3f6742a4f2d0a5661f06517353', '[\"*\"]', NULL, '2022-10-16 13:15:21', '2022-10-16 13:15:21'),
(81, 'App\\Models\\User', 1, 'auth_token', 'ea703d5b2abdd4700ea0bd5dc694a7a35e72f38d7e4d9301381fe6272dc22e37', '[\"*\"]', NULL, '2022-10-16 15:34:31', '2022-10-16 15:34:31'),
(82, 'App\\Models\\User', 2, 'auth_token', '1627b0d27c4c3615e3a5a0bb3b6b6b2a76cfcbb874748e4b80ca105281b07da3', '[\"*\"]', NULL, '2022-10-16 16:08:50', '2022-10-16 16:08:50'),
(83, 'App\\Models\\User', 2, 'auth_token', 'd4cbf7e309eba7931dfb0b3ccdd01c0c4896d5f99387c77943bcdcee4fbf9b97', '[\"*\"]', NULL, '2022-10-16 16:53:57', '2022-10-16 16:53:57'),
(84, 'App\\Models\\User', 2, 'auth_token', '4ce7c399c0d5168a490ec1da1265e74c08d42977950db7941502930942d67c8a', '[\"*\"]', NULL, '2022-10-16 16:54:46', '2022-10-16 16:54:46'),
(85, 'App\\Models\\User', 2, 'auth_token', 'acf5a3d01c9409da191f122ff440d0f6f2b4f1173d8aaa917901b0cc55b81e9d', '[\"*\"]', NULL, '2022-10-16 16:57:58', '2022-10-16 16:57:58'),
(86, 'App\\Models\\User', 2, 'auth_token', '2d794c0ba880f935309660474e52a5f83f51e35e1239da7f76f0948fca500fcc', '[\"*\"]', NULL, '2022-10-16 17:02:35', '2022-10-16 17:02:35'),
(87, 'App\\Models\\User', 2, 'auth_token', '8a66808fab5b488f41d95aa0d021651585c9c2fcd7281e8849dd3d7645cfe0c6', '[\"*\"]', NULL, '2022-10-16 17:04:59', '2022-10-16 17:04:59'),
(88, 'App\\Models\\User', 2, 'auth_token', 'ea139256c2f4658cfbaf9da5bfb067f94cbaa71789898219d9bc760393d04cdd', '[\"*\"]', NULL, '2022-10-16 17:05:19', '2022-10-16 17:05:19'),
(89, 'App\\Models\\User', 2, 'auth_token', 'e8e0f846f1b234cd48980f3c352204fabb5520e52248145fb5d9bc7654364fb8', '[\"*\"]', NULL, '2022-10-16 17:19:08', '2022-10-16 17:19:08'),
(90, 'App\\Models\\User', 2, 'auth_token', '3c4f8dcec33936233011c15688aeb89aa4924225f775b255b82e4eb496090e70', '[\"*\"]', NULL, '2022-10-16 17:19:55', '2022-10-16 17:19:55'),
(91, 'App\\Models\\User', 2, 'auth_token', '3776230ffe89d2aa2eb91614ec0695ac494df94f69fcbd06b8e962854af012f7', '[\"*\"]', NULL, '2022-10-16 17:26:43', '2022-10-16 17:26:43'),
(92, 'App\\Models\\User', 2, 'auth_token', '2f9139b9833e5ec26e7f1bc67f6b2d2230a14614dd2b91d3f257f7cddb62c25b', '[\"*\"]', NULL, '2022-10-16 17:27:29', '2022-10-16 17:27:29'),
(93, 'App\\Models\\User', 2, 'auth_token', '34387023fc2d07ab017ab122e7d05fee3338616da758c0e92948ea43d42cd72f', '[\"*\"]', NULL, '2022-10-16 17:28:33', '2022-10-16 17:28:33'),
(94, 'App\\Models\\User', 2, 'auth_token', 'a0f96225581d63f353554a1f2c51102b1e801149cca9d60d1a421f2639e0a026', '[\"*\"]', NULL, '2022-10-16 17:29:40', '2022-10-16 17:29:40'),
(95, 'App\\Models\\User', 2, 'auth_token', '4a57ea2932b4232b2d2cb9b6337c44930cfd0564481e516ef5371baba5fbb339', '[\"*\"]', NULL, '2022-10-16 17:32:52', '2022-10-16 17:32:52'),
(96, 'App\\Models\\User', 2, 'auth_token', 'f86c4c9f9533f5719dcb4f778ff208fc6b5bf38c8f7ffeecef8ab4ad364e09e2', '[\"*\"]', NULL, '2022-10-16 17:33:11', '2022-10-16 17:33:11'),
(97, 'App\\Models\\User', 2, 'auth_token', '83b4f44350b40061c6e112d076ddeaa77c63116e3be4e1b9f6fa88563edcc82a', '[\"*\"]', NULL, '2022-10-16 17:34:22', '2022-10-16 17:34:22'),
(98, 'App\\Models\\User', 2, 'auth_token', '13f6191e3a39a2f53a43ffd98c8125401885affda472bdb7be2282c994ac9609', '[\"*\"]', NULL, '2022-10-16 17:35:43', '2022-10-16 17:35:43'),
(99, 'App\\Models\\User', 2, 'auth_token', 'fac1d4dcb2d095cae90e25779d1df682d3be2f2554710fce3dc230f69b31f7e2', '[\"*\"]', NULL, '2022-10-16 17:36:00', '2022-10-16 17:36:00'),
(100, 'App\\Models\\User', 2, 'auth_token', 'd52bfce1616ce0de4ad8d38b2824f3d753a0982cadb0ddf7fd44e3f6e32a38e2', '[\"*\"]', NULL, '2022-10-16 17:36:57', '2022-10-16 17:36:57'),
(101, 'App\\Models\\User', 2, 'auth_token', '112903d703f580ff9e54cb9a72172a6fa1e27f7666092f7c75f4b557f70da7b8', '[\"*\"]', NULL, '2022-10-16 17:37:31', '2022-10-16 17:37:31'),
(102, 'App\\Models\\User', 2, 'auth_token', '704129a5f1ca777764fe04476c8defa62e7317b58b744e016b78f605c5d82a51', '[\"*\"]', NULL, '2022-10-16 17:38:01', '2022-10-16 17:38:01'),
(103, 'App\\Models\\User', 2, 'auth_token', '4fcee630bfae39d01d372dd844ffc306039b89d5eee6e9ecf5b76470d7559e6b', '[\"*\"]', NULL, '2022-10-16 17:38:30', '2022-10-16 17:38:30'),
(104, 'App\\Models\\User', 2, 'auth_token', '3d0f6ff911e8b8c3d4c82cba55fc8a2d3789b3681b92e7212db54c9a1d5fefe0', '[\"*\"]', NULL, '2022-10-16 17:39:42', '2022-10-16 17:39:42'),
(105, 'App\\Models\\User', 2, 'auth_token', '951e1be972697ab8f4c912452f6eecabfa45183e02f2614250d3c56c2a6e88f2', '[\"*\"]', NULL, '2022-10-16 17:40:39', '2022-10-16 17:40:39'),
(106, 'App\\Models\\User', 2, 'auth_token', '5409e2f900320a0ba6c1817b21964ec2a0a82b59a1866e7faced76222af8ca56', '[\"*\"]', NULL, '2022-10-16 17:41:57', '2022-10-16 17:41:57'),
(107, 'App\\Models\\User', 2, 'auth_token', '50a837b95eb753957aaf3b0c6158ae9fcd2a9dcbe33845b73e6bd4e65919fa65', '[\"*\"]', NULL, '2022-10-16 17:42:16', '2022-10-16 17:42:16'),
(108, 'App\\Models\\User', 2, 'auth_token', '10915fbf587a3a1ee275097d77b385933d2adedab5fdafcab23335f627830e95', '[\"*\"]', NULL, '2022-10-16 17:43:11', '2022-10-16 17:43:11'),
(109, 'App\\Models\\User', 2, 'auth_token', 'a6a179e52247c77a415c24af045afad7fb25c2ce73e12f805959e6498f42f848', '[\"*\"]', NULL, '2022-10-16 17:43:45', '2022-10-16 17:43:45'),
(110, 'App\\Models\\User', 2, 'auth_token', '1467590006cf56ef7434cca62ce80aac7255d7b07bc96839c9970dc9011248b8', '[\"*\"]', NULL, '2022-10-16 17:44:24', '2022-10-16 17:44:24'),
(111, 'App\\Models\\User', 2, 'auth_token', '0f6a2fdc8bbd9e4e31657145c29912f906a1965d4c5390497df9bdef2223d448', '[\"*\"]', NULL, '2022-10-16 17:49:07', '2022-10-16 17:49:07'),
(112, 'App\\Models\\User', 2, 'auth_token', 'fc6e5b2f78f5c4a37a8bfb9ca455fcc0e5e519a22cdac545b505f3c0b4e6fbc7', '[\"*\"]', NULL, '2022-10-16 17:54:37', '2022-10-16 17:54:37'),
(113, 'App\\Models\\User', 2, 'auth_token', '2e329a38153b1d3da11c2da1d6776470e1ecf7d79c63ad4dfa2f701b0ecca911', '[\"*\"]', NULL, '2022-10-16 17:58:44', '2022-10-16 17:58:44'),
(114, 'App\\Models\\User', 1, 'auth_token', 'd8a62ef00e9af852f25f337dcd9454b8cb7b3b3c9abcbfeca0a46795eeb45267', '[\"*\"]', NULL, '2022-10-16 17:59:38', '2022-10-16 17:59:38'),
(115, 'App\\Models\\User', 2, 'auth_token', 'f269ef4eb06bac294eaf67b33bcdbbe5d58b41d52164e6f30952dad2a1e9b8f2', '[\"*\"]', NULL, '2022-10-16 18:00:37', '2022-10-16 18:00:37'),
(116, 'App\\Models\\User', 2, 'auth_token', 'ca4e36c7a3a0b7ef97a713ad25d320bb733c623d37d36eb1e2f9b677eb45a9ab', '[\"*\"]', NULL, '2022-10-16 18:05:50', '2022-10-16 18:05:50'),
(117, 'App\\Models\\User', 1, 'auth_token', '4209072d0228f10a8562e4401a405d01e81e1dd5dc80c6fe7838af184fd165e8', '[\"*\"]', NULL, '2022-10-16 18:05:56', '2022-10-16 18:05:56'),
(118, 'App\\Models\\User', 1, 'auth_token', '55848abac34303502032da47f42a0655038f7600aa0ccf27996a8f627a41af44', '[\"*\"]', NULL, '2022-10-16 18:06:11', '2022-10-16 18:06:11'),
(119, 'App\\Models\\User', 1, 'auth_token', '0cd08b70fd6f208f21a07c000b34c4b290e60a2d1fc6f5a2282c6f82729f4369', '[\"*\"]', NULL, '2022-10-16 18:06:21', '2022-10-16 18:06:21'),
(120, 'App\\Models\\User', 2, 'auth_token', '5d1d673fc67ad782dab01a2ed12c92d2a0d67b681b23bb549fe8dabd8a68a689', '[\"*\"]', NULL, '2022-10-16 18:06:26', '2022-10-16 18:06:26'),
(121, 'App\\Models\\User', 2, 'auth_token', '73b8dc6ba43959dc0e4b60a3ec126f66dfb5912761877cffb3a586c28243503a', '[\"*\"]', NULL, '2022-10-16 18:06:38', '2022-10-16 18:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_rol` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `roles_department_id_foreign` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `denumire_rol`, `department_id`) VALUES
(1, 'Guest', 0),
(2, 'Director departament aprovizionare', 1),
(3, 'Director departament financiar', 2),
(4, 'Director departament intretinere', 3),
(5, 'Mecanic', 3),
(6, 'Contabil', 2),
(7, 'Curier', 1);

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
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_furnizor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_employee_id_foreign` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `employee_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'Gabi123', 'gamingro99@yahoo.com', NULL, '$2y$10$R6GkTI.6ow7Ae8h6lDs4KeIwWGMwS92s8WREiED2kA/RN8JQublCC', NULL, '2022-10-16 12:48:55', '2022-10-16 12:48:55'),
(2, 1, 'Anonimul', 'marianpoto@yahoo.com', NULL, '$2y$10$wAqNPDK7A1xWMAuEct.CgOCscUFo3yJZgT/M8TXh9egN7cPnoPxZa', NULL, '2022-10-16 16:08:50', '2022-10-16 16:08:50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
