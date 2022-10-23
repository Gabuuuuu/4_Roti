-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2022 at 07:47 PM
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
  `car_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_type_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `pret_curent` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pret_achizitie` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oferit_De` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `km` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `an` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `combustibil` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `putere` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transmisie` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VIN` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nr_portiere` int(11) NOT NULL,
  `culoare` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daune` tinyint(1) NOT NULL,
  `data_emiterii` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`car_id`),
  KEY `cars_department_id_foreign` (`department_id`),
  KEY `cars_car_type_id_foreign` (`car_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_type_id`, `department_id`, `pret_curent`, `pret_achizitie`, `oferit_De`, `marca`, `model`, `km`, `an`, `combustibil`, `putere`, `transmisie`, `VIN`, `nr_portiere`, `culoare`, `daune`, `data_emiterii`) VALUES
(9, 1, 1, NULL, '1234', '1234', 'BMW', '1234', '1234', '1234', 'Diesel', '1234', 'Automatic', '1234', 2, 'alb', 0, '2022-10-23 19:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `car_revisions`
--

DROP TABLE IF EXISTS `car_revisions`;
CREATE TABLE IF NOT EXISTS `car_revisions` (
  `Id_revizie` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `StareMotor` tinyint(1) NOT NULL,
  `StareLumini` tinyint(1) NOT NULL,
  `StareSuspensii` tinyint(1) NOT NULL,
  `StareAmortizor` tinyint(1) NOT NULL,
  `StareFrana` tinyint(1) NOT NULL,
  `StareSistemElectric` tinyint(1) NOT NULL,
  `StareDotari` tinyint(1) NOT NULL,
  `StareCauciucuri` tinyint(1) NOT NULL,
  `data_emiterii` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_revizie`),
  KEY `car_revisions_car_id_foreign` (`car_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_revisions`
--

INSERT INTO `car_revisions` (`Id_revizie`, `car_id`, `StareMotor`, `StareLumini`, `StareSuspensii`, `StareAmortizor`, `StareFrana`, `StareSistemElectric`, `StareDotari`, `StareCauciucuri`, `data_emiterii`) VALUES
(1, 2, 0, 1, 1, 1, 0, 1, 0, 0, '2022-10-19 16:02:55'),
(2, 2, 0, 0, 1, 1, 0, 1, 0, 1, '2022-10-19 16:07:31'),
(3, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-22 19:35:24');

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
CREATE TABLE IF NOT EXISTS `car_type` (
  `car_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `denumire_tip_masina` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`car_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`car_type_id`, `denumire_tip_masina`) VALUES
(1, 'Automobil'),
(2, 'Pick-up'),
(3, 'Furgoneta'),
(4, 'Camion'),
(5, 'Autotren');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE IF NOT EXISTS `colors` (
  `Culoare_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Culoare_denumire` varchar(20) NOT NULL,
  PRIMARY KEY (`Culoare_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`Culoare_id`, `Culoare_denumire`) VALUES
(1, 'alb'),
(2, 'negru'),
(3, 'rosu'),
(4, 'albastru'),
(5, 'roz'),
(6, 'galben'),
(7, 'cacaniu'),
(8, 'mov');

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
  `license_type_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  KEY `driving_licenses_employee_id_foreign` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driving_licenses`
--

INSERT INTO `driving_licenses` (`driving_license_id`, `employee_id`, `license_type_id`, `nume_angajat`, `prenume_angajat`, `data_nasterii`, `locul_nasterii`, `data_emiterii`, `data_expirarii`, `autoritatea_emiterii`, `CNP`, `Nr_permis`, `permis_suspendat`) VALUES
(1, 1, 'C+E', 'Moraru', 'Gabriel', '2022-10-05', 'assfaaf', '2022-10-04', '2022-10-05', 'SDCRAPSSAF SDAA', '1231231231231', '1234567890', 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `role_id`, `nume_angajat`, `prenume_angajat`, `CNP`, `actDeIdentitate`, `nr`, `dataEliberarii`, `domiciliul`, `strada`, `nrStrada`, `apartament`, `sector`, `data_inceput_ang`, `data_semnare_contract`) VALUES
(1, 7, 'Gabi', 'Gabitzu', '31231331212', 'buletin', '3212', '2022-10-12', '21312321312', 'GAGA', '3123', '1321', '1', '2022-10-04', '2022-10-19'),
(2, 3, 'Leonte', 'Dalmatianul', '31231331212', 'buletin', '3212', '2022-10-12', '21312321312', 'ADASDADWA', '3123', '1321', '2', '2022-10-04', '2022-10-29');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fridge_invoices`
--

INSERT INTO `fridge_invoices` (`fridge_invoice_id`, `supplier_id`, `denumire_model`, `pret`, `cantitate`, `data_emiterii`) VALUES
(1, 1, '1234', '1234', '1234', '2022-10-23');

-- --------------------------------------------------------

--
-- Table structure for table `fridge_models`
--

DROP TABLE IF EXISTS `fridge_models`;
CREATE TABLE IF NOT EXISTS `fridge_models` (
  `fridge_model_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `denumire_model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `an_fabricatie` date NOT NULL,
  `greutate` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marime` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consum_energetic` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calitate` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `volum` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pret` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`fridge_model_id`),
  KEY `fridge_models_supplier_id_foreign` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fridge_models`
--

INSERT INTO `fridge_models` (`fridge_model_id`, `supplier_id`, `denumire_model`, `an_fabricatie`, `greutate`, `marime`, `consum_energetic`, `calitate`, `volum`, `pret`, `image`) VALUES
(4, 1, '1234', '2022-09-28', '123', '1234', '1234', 'A', '1234', '1234', '1666549942.png');

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(72, '2022_10_15_173518_create_employees_table5', 38),
(73, '2022_10_17_180247_create_car_type_table', 39),
(74, '2022_04_04_084544_create_car_controllers_table2', 40),
(75, '2022_10_18_211412_create_data_emiterii_cars_table', 41),
(77, '2022_10_19_123318_create_car_revisions_table', 42),
(78, '2022_10_19_183855_create_repair_notices_table', 43),
(79, '2022_10_22_213527_create_insurances_table', 44),
(80, '2022_10_23_163620_add_foreign_key_fridge_models', 44),
(81, '2022_10_23_183014_add_image_fridges', 45);

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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(81, 'App\\Models\\User', 2, 'auth_token', '08857dbc1ebefb7a1ac3ce089c0456a42827864028a15aca13f4cbaf95aa5cbd', '[\"*\"]', NULL, '2022-10-16 13:56:29', '2022-10-16 13:56:29'),
(82, 'App\\Models\\User', 2, 'auth_token', '595bc90644707abaf1cb345b61ffe44caca2568b50cacf719ac5adae65eb0270', '[\"*\"]', NULL, '2022-10-16 15:56:41', '2022-10-16 15:56:41'),
(83, 'App\\Models\\User', 2, 'auth_token', '69a7fc79664f251fb49f68960cc708aed5d1396063842b08c5c81dde55abb11d', '[\"*\"]', NULL, '2022-10-16 18:33:04', '2022-10-16 18:33:04'),
(84, 'App\\Models\\User', 2, 'auth_token', 'f8ad1b7e02aab01896eb18b82c7642d0db15f7720cef986409dc5cc870d5fa5e', '[\"*\"]', NULL, '2022-10-17 13:42:40', '2022-10-17 13:42:40'),
(85, 'App\\Models\\User', 2, 'auth_token', 'da6a8f2fe38bfa8190ccca567ded55a9697c6b9c8c80a0c093f8e04e364acb77', '[\"*\"]', NULL, '2022-10-17 14:06:56', '2022-10-17 14:06:56'),
(86, 'App\\Models\\User', 2, 'auth_token', '2f344c2ba5f1fd5ba15429e569a99e665712befc14fc2610be7eaf33bdad8937', '[\"*\"]', NULL, '2022-10-18 06:31:36', '2022-10-18 06:31:36'),
(87, 'App\\Models\\User', 2, 'auth_token', '7d9e0013155a7881abef7ab998eb18b4c6fc7616ee1c0a3ed707b9ab1552e15f', '[\"*\"]', NULL, '2022-10-18 10:03:53', '2022-10-18 10:03:53'),
(88, 'App\\Models\\User', 2, 'auth_token', 'cdb01a8a76788aea730cae588a40986a4a4b6d74f3496961c262e2f9a2809c4f', '[\"*\"]', NULL, '2022-10-19 08:31:06', '2022-10-19 08:31:06'),
(89, 'App\\Models\\User', 3, 'auth_token', '9b6bc1443d42fd3cea3d2be12e1e8240888288598afab07e7b4337d92eb59620', '[\"*\"]', NULL, '2022-10-20 17:45:21', '2022-10-20 17:45:21'),
(90, 'App\\Models\\User', 3, 'auth_token', 'efc542adde45d66471b240ef489398c52179ffdb6c07eb979e49cb8a41d84a65', '[\"*\"]', NULL, '2022-10-20 17:46:04', '2022-10-20 17:46:04'),
(91, 'App\\Models\\User', 3, 'auth_token', '9b3ae57ef12d09b6809ac1f387ae9b292a3981ff115d0b26a8b92ed158ed40dd', '[\"*\"]', NULL, '2022-10-20 18:11:22', '2022-10-20 18:11:22'),
(92, 'App\\Models\\User', 3, 'auth_token', 'd19847c9dc289f89a7a88855deb6569e697a5b1a33e72516dca6b7bcd08810fa', '[\"*\"]', NULL, '2022-10-20 18:16:30', '2022-10-20 18:16:30'),
(93, 'App\\Models\\User', 3, 'auth_token', 'cf30e1235fb0b289e35a7393168d495756119a079ea5b248ddd7db42f3f4b00b', '[\"*\"]', NULL, '2022-10-22 14:49:51', '2022-10-22 14:49:51'),
(94, 'App\\Models\\User', 3, 'auth_token', 'ab11d2d35b05e7010eb905b740b7489012a7e09ef5e23f8b90a717a8c5656eac', '[\"*\"]', NULL, '2022-10-22 14:50:32', '2022-10-22 14:50:32'),
(95, 'App\\Models\\User', 3, 'auth_token', '895e9d6a4c799a8040bf6531f8185f65f302847fb3369576322cc91e8f3e2380', '[\"*\"]', NULL, '2022-10-22 14:51:22', '2022-10-22 14:51:22'),
(96, 'App\\Models\\User', 3, 'auth_token', '1eee83131be0b67e9c283b75dbd33528c2017ed6428bc567333bf4660d87daad', '[\"*\"]', NULL, '2022-10-22 14:52:11', '2022-10-22 14:52:11'),
(97, 'App\\Models\\User', 3, 'auth_token', '600a06e20911210c7452c7503d0b3fee22efe0501f62d42a788aa4e73f323837', '[\"*\"]', NULL, '2022-10-22 14:57:12', '2022-10-22 14:57:12'),
(98, 'App\\Models\\User', 3, 'auth_token', 'd47538fdcbe917e9c0d8782118bcc59b9ccfdb6eb5115e075ced90ce9ba0c714', '[\"*\"]', NULL, '2022-10-22 14:59:18', '2022-10-22 14:59:18'),
(99, 'App\\Models\\User', 3, 'auth_token', '27c7bf5778d27baa9a001c9677b3c039b42b90e9ce449ba20e2f6f93359076c1', '[\"*\"]', NULL, '2022-10-22 15:16:32', '2022-10-22 15:16:32'),
(100, 'App\\Models\\User', 3, 'auth_token', '08b41f2b29588c2c7943d8a76f8d3038f1d81075f90250bfef94fa6359d35cef', '[\"*\"]', NULL, '2022-10-22 15:32:40', '2022-10-22 15:32:40'),
(101, 'App\\Models\\User', 3, 'auth_token', '459905bb9126c2046bdc715393c6c51945514ff8db6ae98dc1e06df0542d87d2', '[\"*\"]', NULL, '2022-10-22 15:33:19', '2022-10-22 15:33:19'),
(102, 'App\\Models\\User', 3, 'auth_token', '289c383200b1dd10ee89ef30e6108cf84cc375e6b535823b8d4ee01cf05bb15c', '[\"*\"]', NULL, '2022-10-22 15:34:09', '2022-10-22 15:34:09'),
(103, 'App\\Models\\User', 3, 'auth_token', '8ec21cc5f2dafeb134b16407a36b36ad6fa786c8e91fb651a94d758651807917', '[\"*\"]', NULL, '2022-10-22 15:35:17', '2022-10-22 15:35:17'),
(104, 'App\\Models\\User', 3, 'auth_token', '1954ad26794b3c2704fbe071dd81afb0cb6da99902ca511c8a38010b2f987053', '[\"*\"]', NULL, '2022-10-22 15:35:23', '2022-10-22 15:35:23'),
(105, 'App\\Models\\User', 3, 'auth_token', 'ad1e71df6c9032b3be82baaf694ad5828729fc6bc33825533d8fe1aed40a4c39', '[\"*\"]', NULL, '2022-10-22 15:37:46', '2022-10-22 15:37:46'),
(106, 'App\\Models\\User', 3, 'auth_token', '726636abaf648560c05fab428f7bf4748997fd07b309a6607643154d827ac02c', '[\"*\"]', NULL, '2022-10-22 15:38:24', '2022-10-22 15:38:24'),
(107, 'App\\Models\\User', 3, 'auth_token', '82fb3c785c9285db7bb244981d08925d72c232e028ac110e7798c1ec7f1ec09d', '[\"*\"]', NULL, '2022-10-22 15:39:30', '2022-10-22 15:39:30'),
(108, 'App\\Models\\User', 3, 'auth_token', '964a282f23acda9ffa76c295510562c18edeb9d84e14b56cb042b9aaa7632926', '[\"*\"]', NULL, '2022-10-22 15:39:43', '2022-10-22 15:39:43'),
(109, 'App\\Models\\User', 3, 'auth_token', 'a42b33adb789cf70e3faa4ab13a310bf6cfc7c39dc1b7243d0941c21f5694137', '[\"*\"]', NULL, '2022-10-22 15:40:16', '2022-10-22 15:40:16'),
(110, 'App\\Models\\User', 3, 'auth_token', 'd2835f2a9eeb67023e86dcb21d730d18d2313f193dfdbd89dd0bc36c518219ef', '[\"*\"]', NULL, '2022-10-22 15:40:36', '2022-10-22 15:40:36'),
(111, 'App\\Models\\User', 3, 'auth_token', '3371a51d321879e12d617830e84f54e154177c2bd73f2c27a7ec2be53079a30c', '[\"*\"]', NULL, '2022-10-22 15:40:46', '2022-10-22 15:40:46'),
(112, 'App\\Models\\User', 3, 'auth_token', 'be4246fcae6d14e71e18c55fad2ee43c4b1aa6c885b6386c6da270e8c78d491b', '[\"*\"]', NULL, '2022-10-22 15:40:59', '2022-10-22 15:40:59'),
(113, 'App\\Models\\User', 3, 'auth_token', '71cbac72c1a33f530dcdf1419fa137b17ee946b509488da35c609dc1146c1ba2', '[\"*\"]', NULL, '2022-10-22 15:42:44', '2022-10-22 15:42:44'),
(114, 'App\\Models\\User', 3, 'auth_token', 'b4eca87c73c6e1b96383b21fbd587d3542ab5960565c6d35b6e76d8d5f61ede8', '[\"*\"]', NULL, '2022-10-22 15:43:58', '2022-10-22 15:43:58'),
(115, 'App\\Models\\User', 3, 'auth_token', 'bb984969ddafd86bdfa14be2c6023a73f1f231e54646465dec30a5694193c24c', '[\"*\"]', NULL, '2022-10-22 15:45:57', '2022-10-22 15:45:57'),
(116, 'App\\Models\\User', 3, 'auth_token', '1b24c652c50b1cc68d4bcd441009c1a88c56652478f9fd50db07c03b662d8b02', '[\"*\"]', NULL, '2022-10-22 15:46:03', '2022-10-22 15:46:03'),
(117, 'App\\Models\\User', 3, 'auth_token', 'cc1efb8d60abf8cd9cd3d9f30829717b4a23726e0880b9c4389a92a91db14698', '[\"*\"]', NULL, '2022-10-22 15:48:35', '2022-10-22 15:48:35'),
(118, 'App\\Models\\User', 3, 'auth_token', '1565f28a6e3c227ad675478ca62b1789dd81aad8e86f004bfbd68bf81bdd9ec2', '[\"*\"]', NULL, '2022-10-22 16:04:29', '2022-10-22 16:04:29'),
(119, 'App\\Models\\User', 3, 'auth_token', 'cc313e04e1b05197f93b87bafcda313b756d4acc0925c860cec12db594195567', '[\"*\"]', NULL, '2022-10-22 16:08:46', '2022-10-22 16:08:46'),
(120, 'App\\Models\\User', 3, 'auth_token', 'df7887bf4e17f442e3be10719663332fdd0861b94d8169d4f460fd36a3bf1d4a', '[\"*\"]', NULL, '2022-10-22 16:13:33', '2022-10-22 16:13:33'),
(121, 'App\\Models\\User', 3, 'auth_token', 'fb12f59fd3d22f6ae981098cbcb40ce85c5d9d6265de26d3da08dc87237e623b', '[\"*\"]', NULL, '2022-10-22 16:22:36', '2022-10-22 16:22:36'),
(122, 'App\\Models\\User', 3, 'auth_token', 'd153301cb5d66e1e486c0322041602bb412b44bb2ed3d69116858c91e90b218b', '[\"*\"]', NULL, '2022-10-22 16:33:21', '2022-10-22 16:33:21'),
(123, 'App\\Models\\User', 3, 'auth_token', '8abff8f4f7602adf946eb0c4c35d94ab302f58d00a16d83ca33922e6c41596f5', '[\"*\"]', NULL, '2022-10-22 16:33:54', '2022-10-22 16:33:54'),
(124, 'App\\Models\\User', 3, 'auth_token', '94caba6b161c684901e6c75258c426331443f360290e9e43599ed714f4a119e9', '[\"*\"]', NULL, '2022-10-22 16:39:17', '2022-10-22 16:39:17'),
(125, 'App\\Models\\User', 3, 'auth_token', 'fd95290ce32472645343c5cdb5f7930ffc93e159d98aeb93dc47b1d721714580', '[\"*\"]', NULL, '2022-10-22 16:42:24', '2022-10-22 16:42:24'),
(126, 'App\\Models\\User', 3, 'auth_token', '7ff962b2b984b21d670ecf5c405583684c9f9735e388477f512664020e99b40c', '[\"*\"]', NULL, '2022-10-22 16:43:30', '2022-10-22 16:43:30'),
(127, 'App\\Models\\User', 3, 'auth_token', 'ee9f2a5f3774624a8c40185ba1d8c70052577f24c710df9f45db5bd6b36fb9e6', '[\"*\"]', NULL, '2022-10-22 16:49:22', '2022-10-22 16:49:22'),
(128, 'App\\Models\\User', 3, 'auth_token', '8c37d3077c9386d0197fb8dac324f727885299b7f110831d88b2c5a36802153d', '[\"*\"]', NULL, '2022-10-22 16:52:10', '2022-10-22 16:52:10'),
(129, 'App\\Models\\User', 3, 'auth_token', '0549e06291c9503cb19cc3d1c815d80ea1a8a277a9fda63168e1b1eba09fad4e', '[\"*\"]', NULL, '2022-10-22 16:53:58', '2022-10-22 16:53:58'),
(130, 'App\\Models\\User', 3, 'auth_token', '29c54e87e7c2560207a6288a1455d4c5e3287e0d8cce350d019f582dd91f5636', '[\"*\"]', NULL, '2022-10-22 16:59:54', '2022-10-22 16:59:54'),
(131, 'App\\Models\\User', 3, 'auth_token', 'c315ef283ad22d34d9eee1150e86fd817c37a9e9833657d145638dfcf4166de3', '[\"*\"]', NULL, '2022-10-22 17:00:41', '2022-10-22 17:00:41'),
(132, 'App\\Models\\User', 3, 'auth_token', '286b14a32e43881c77d030e1cac500b616254164189eca3d4ac699217155a114', '[\"*\"]', NULL, '2022-10-22 17:01:02', '2022-10-22 17:01:02'),
(133, 'App\\Models\\User', 3, 'auth_token', 'efec152a0c0e13dbacefb9e54014c9eba65de0c17c75996667afa2fe9d023497', '[\"*\"]', NULL, '2022-10-22 17:01:46', '2022-10-22 17:01:46'),
(134, 'App\\Models\\User', 3, 'auth_token', 'b20c569fe7634a992a50f17fcdc98b0c7403d540c4d392f79a61da237255293f', '[\"*\"]', NULL, '2022-10-22 17:02:20', '2022-10-22 17:02:20'),
(135, 'App\\Models\\User', 3, 'auth_token', 'c88fc7057a7d4a11c238d73aa49ffdf56ddf621f8d4ec667a6f55d2f637be05b', '[\"*\"]', NULL, '2022-10-22 17:03:04', '2022-10-22 17:03:04'),
(136, 'App\\Models\\User', 3, 'auth_token', '7a47db6dbd328c3f87788cd2a77a0ce9b58ee236758ae3fee0e8e7a5ccd49402', '[\"*\"]', NULL, '2022-10-22 17:03:24', '2022-10-22 17:03:24'),
(137, 'App\\Models\\User', 3, 'auth_token', 'f6a2e2a02db0eaa5c824fd99b58fd40626c5462674d355a49273930c5c317ef3', '[\"*\"]', NULL, '2022-10-22 17:04:57', '2022-10-22 17:04:57'),
(138, 'App\\Models\\User', 3, 'auth_token', 'c20a2e628541cc77ba3513198a2382a6afcad1aae12d72c985260457be22ed34', '[\"*\"]', NULL, '2022-10-22 17:05:27', '2022-10-22 17:05:27'),
(139, 'App\\Models\\User', 3, 'auth_token', '274aab6ebf806cf7f7a532bd0d8c76653e7c2aafe651bd1f753dfe82601281eb', '[\"*\"]', NULL, '2022-10-22 17:05:44', '2022-10-22 17:05:44'),
(140, 'App\\Models\\User', 3, 'auth_token', '648b869ad47083d9f5fb32b103eae419328e3fcdffd52697a9ff749ce400afe7', '[\"*\"]', NULL, '2022-10-22 17:06:37', '2022-10-22 17:06:37'),
(141, 'App\\Models\\User', 3, 'auth_token', '7684eabe6a49c421623b830040529755001999c387feafc17cd00f0c6e61fb5e', '[\"*\"]', NULL, '2022-10-22 17:07:32', '2022-10-22 17:07:32'),
(142, 'App\\Models\\User', 3, 'auth_token', '10489c4e9cc52eab929cd36c640f0b8834e2cd52533f8a4ce3d365b19a35a360', '[\"*\"]', NULL, '2022-10-22 17:08:10', '2022-10-22 17:08:10'),
(143, 'App\\Models\\User', 3, 'auth_token', '250d54e8bc490962bb25bb873454bb54a7c82f36d001a974dcda710bb8e81b7a', '[\"*\"]', NULL, '2022-10-22 17:08:22', '2022-10-22 17:08:22'),
(144, 'App\\Models\\User', 3, 'auth_token', 'ef1c098d92b27246bc18cf68ddda4eef0dd7a8bdf5e25616f3d55a1611771268', '[\"*\"]', NULL, '2022-10-22 17:08:35', '2022-10-22 17:08:35'),
(145, 'App\\Models\\User', 3, 'auth_token', '71d22ace49bdcd68f57c5a57bbb111b9f525d7ff712725cf15ed64e3608b66e4', '[\"*\"]', NULL, '2022-10-22 17:09:08', '2022-10-22 17:09:08'),
(146, 'App\\Models\\User', 3, 'auth_token', '27684da7b2a5a702c0eaada8c81497081b2c52da376ea8f7b02b8fe99ff1f24b', '[\"*\"]', NULL, '2022-10-22 17:11:07', '2022-10-22 17:11:07'),
(147, 'App\\Models\\User', 3, 'auth_token', 'c80d192e75905672c9dc431b9f8cb8c282bdd5c926893a817732be0614d44709', '[\"*\"]', NULL, '2022-10-22 17:11:31', '2022-10-22 17:11:31'),
(148, 'App\\Models\\User', 3, 'auth_token', '0170c7b708c2c49600a6c93676bd682931b9abcd7066f36f85dd7a5beb0e5ecd', '[\"*\"]', NULL, '2022-10-22 17:12:31', '2022-10-22 17:12:31'),
(149, 'App\\Models\\User', 3, 'auth_token', '8cb263286dced73da10068e8ad9276337447aa6af665267f7623af6385adeef4', '[\"*\"]', NULL, '2022-10-22 17:13:05', '2022-10-22 17:13:05'),
(150, 'App\\Models\\User', 3, 'auth_token', 'ca117d3bcd9d8ede39c63aa051e56a58a8fa72ec48435440f2ae05bae5362dbe', '[\"*\"]', NULL, '2022-10-22 17:13:46', '2022-10-22 17:13:46'),
(151, 'App\\Models\\User', 3, 'auth_token', 'ea3629b5fff9d07baf41461219e8125a406a86dc80424fbe2f52ef87ecd1dd65', '[\"*\"]', NULL, '2022-10-22 17:14:14', '2022-10-22 17:14:14'),
(152, 'App\\Models\\User', 3, 'auth_token', '5257a8827b2d30ea88245e88cf6b444c1b2371c2cd14a4ea545f9a6791ef12a9', '[\"*\"]', NULL, '2022-10-22 17:19:33', '2022-10-22 17:19:33'),
(153, 'App\\Models\\User', 3, 'auth_token', '9c076440b5084c60ffdb1db77e321291de252ee613e4959581ed937f69c0e53b', '[\"*\"]', NULL, '2022-10-22 17:21:33', '2022-10-22 17:21:33'),
(154, 'App\\Models\\User', 3, 'auth_token', '428c24e53c4df5c520fe2e630949445008ba880532f7de470c6abc155ba77f4a', '[\"*\"]', NULL, '2022-10-22 17:26:47', '2022-10-22 17:26:47'),
(155, 'App\\Models\\User', 3, 'auth_token', 'e16876f51ec97ce8c9290eef23c3d86143bbe8c914917ee4ddda2ab8efa1a6c6', '[\"*\"]', NULL, '2022-10-22 17:28:54', '2022-10-22 17:28:54'),
(156, 'App\\Models\\User', 3, 'auth_token', 'ec71b3ab86418a9044a0b76dfec791ab520939777e84658b11a4b59a3cf92a9a', '[\"*\"]', NULL, '2022-10-22 17:30:13', '2022-10-22 17:30:13'),
(157, 'App\\Models\\User', 3, 'auth_token', '48bdaf16ada8ed42191873715d5197f0dd9f18ee50d08f2fd9f1289fad591d8b', '[\"*\"]', NULL, '2022-10-22 17:31:18', '2022-10-22 17:31:18'),
(158, 'App\\Models\\User', 3, 'auth_token', '8852affb7610825abb2b6e91a1179ad84a2c444b47f45b8e438247f966bb7e95', '[\"*\"]', NULL, '2022-10-22 17:31:33', '2022-10-22 17:31:33'),
(159, 'App\\Models\\User', 3, 'auth_token', '365e78936d78c7b9e323e97f0030565d835ec397c5d9502964b8e89f2178278b', '[\"*\"]', NULL, '2022-10-22 17:32:02', '2022-10-22 17:32:02'),
(160, 'App\\Models\\User', 3, 'auth_token', 'b4d465d925124d91634a596f2d70eb1b8ab7b6e66829b47b88a8ff70bc81d526', '[\"*\"]', NULL, '2022-10-22 17:43:55', '2022-10-22 17:43:55'),
(161, 'App\\Models\\User', 3, 'auth_token', 'f20b55e50172979e61d45982804fc8ccd8906bcd221e355bdd3d0541fee75a80', '[\"*\"]', NULL, '2022-10-22 17:50:54', '2022-10-22 17:50:54'),
(162, 'App\\Models\\User', 3, 'auth_token', '506de1dcad4c64ea6dff6a5dfc9651e037c2d8ed5d8435060c5f702c2f4e19f9', '[\"*\"]', NULL, '2022-10-22 17:57:26', '2022-10-22 17:57:26'),
(163, 'App\\Models\\User', 3, 'auth_token', 'c058de7c8af0326870fbace8111ececc0e178bc9bfb2d11179c63f53ebdf396b', '[\"*\"]', NULL, '2022-10-22 17:59:20', '2022-10-22 17:59:20'),
(164, 'App\\Models\\User', 3, 'auth_token', '3c5a91d80cd29279cb4dca5c07611bb253d6ed2d75e7288b15b28d8db9e05fbc', '[\"*\"]', NULL, '2022-10-22 18:08:28', '2022-10-22 18:08:28'),
(165, 'App\\Models\\User', 3, 'auth_token', 'aa05a6aeed75b1082cdc59aca089f89fd129c9c67f13a6b50478bd6eb6d1cf08', '[\"*\"]', NULL, '2022-10-22 18:09:53', '2022-10-22 18:09:53'),
(166, 'App\\Models\\User', 3, 'auth_token', 'f13ea2a32c74308195d4f0746f6d1bd3fd5c063faab21e1dbfba5953c4fd9f6a', '[\"*\"]', NULL, '2022-10-22 18:10:23', '2022-10-22 18:10:23'),
(167, 'App\\Models\\User', 3, 'auth_token', '134d1c9d1a73335f37c4a1f9b31a8586b500438adc77bd37993cb4a851f6363f', '[\"*\"]', NULL, '2022-10-22 18:11:01', '2022-10-22 18:11:01'),
(168, 'App\\Models\\User', 3, 'auth_token', '5c5e84ae6cc770ccf874ff519840adcbd4d67409a8859640f93537bd833680db', '[\"*\"]', NULL, '2022-10-22 18:15:19', '2022-10-22 18:15:19'),
(169, 'App\\Models\\User', 3, 'auth_token', 'a4e19cbc88e952cda679fa760b2be0c35c43085f0f8392b6f7483b725794f392', '[\"*\"]', NULL, '2022-10-22 18:19:29', '2022-10-22 18:19:29'),
(170, 'App\\Models\\User', 3, 'auth_token', '820db4e7266e53e22519f76cbe5cfe976b7e26244e7a9bc4eec4621a40a6a83b', '[\"*\"]', NULL, '2022-10-22 18:20:10', '2022-10-22 18:20:10'),
(171, 'App\\Models\\User', 3, 'auth_token', '2f66f33037a2a14d0d015f964159ec698f5250478466f6a369358f15d580fef8', '[\"*\"]', NULL, '2022-10-22 18:26:09', '2022-10-22 18:26:09'),
(172, 'App\\Models\\User', 3, 'auth_token', 'd15110b0647af45507f09778361bb2c0e19be65d4fb4569a380eb5ac28c96417', '[\"*\"]', NULL, '2022-10-22 18:27:31', '2022-10-22 18:27:31'),
(173, 'App\\Models\\User', 3, 'auth_token', '53b9c9485cd6325d415f581e67b7dea9882c9cfaba4f2eb4c805b37c674a0b85', '[\"*\"]', NULL, '2022-10-22 18:28:19', '2022-10-22 18:28:19'),
(174, 'App\\Models\\User', 3, 'auth_token', '3008e70c6868827cdd9c8d5b8a4df02240708ebe73b93e40d5f2d1769241e2c6', '[\"*\"]', NULL, '2022-10-22 18:29:04', '2022-10-22 18:29:04'),
(175, 'App\\Models\\User', 3, 'auth_token', '8e24ebb3f3cdd84b9e7c99a49707a1dc4e14893e036d3d9cf9da64e162d9ede3', '[\"*\"]', NULL, '2022-10-22 18:29:22', '2022-10-22 18:29:22'),
(176, 'App\\Models\\User', 3, 'auth_token', 'e812eef0bacc6d172bda532e6311dc2d0db832c8256319d9d86a1cc2795efbaf', '[\"*\"]', NULL, '2022-10-22 18:30:12', '2022-10-22 18:30:12'),
(177, 'App\\Models\\User', 3, 'auth_token', '49414646df60e0e5dac77e146560515a08463898e01e7b5266b8dbe47eddc665', '[\"*\"]', NULL, '2022-10-23 11:17:19', '2022-10-23 11:17:19'),
(178, 'App\\Models\\User', 3, 'auth_token', '26eadf51d2ec5cce8fe108be0c6b3482b525dcec43fd4db8bf459e85f3a5d43b', '[\"*\"]', NULL, '2022-10-23 11:17:56', '2022-10-23 11:17:56'),
(179, 'App\\Models\\User', 3, 'auth_token', '5a87722d6257370abdc455d0b394ab236a4ed62e2b13b26b74208ca63a1d93ea', '[\"*\"]', NULL, '2022-10-23 11:48:50', '2022-10-23 11:48:50'),
(180, 'App\\Models\\User', 3, 'auth_token', '2ab22fc67c9cd9be7f92ead045217e6de96e0436d69a665e4367031824c77a03', '[\"*\"]', NULL, '2022-10-23 11:49:58', '2022-10-23 11:49:58'),
(181, 'App\\Models\\User', 3, 'auth_token', 'fec785857e81e47df55dfa2dfe179c398914714143848febce9892f48c014735', '[\"*\"]', NULL, '2022-10-23 13:52:54', '2022-10-23 13:52:54'),
(182, 'App\\Models\\User', 3, 'auth_token', '5ba779a9e06ff601ef803ebf076f4d2c20f835c874312354dbe7ab75f0b74b2e', '[\"*\"]', NULL, '2022-10-23 13:53:05', '2022-10-23 13:53:05'),
(183, 'App\\Models\\User', 3, 'auth_token', 'de54c27dfcbab6a2c1012e676ef076eb687fb4a99b13530d5fb78348ae2ff686', '[\"*\"]', NULL, '2022-10-23 13:53:19', '2022-10-23 13:53:19'),
(184, 'App\\Models\\User', 3, 'auth_token', '992e36ea4d16f0d3711ca0903d77f12cf65426cdf1e1d3ab2cd024edac5c8807', '[\"*\"]', NULL, '2022-10-23 14:47:27', '2022-10-23 14:47:27'),
(185, 'App\\Models\\User', 3, 'auth_token', '48a300b3fbc293e6548c91fae65e93020e1486455ae880cc0c1b5bcd9517d0dd', '[\"*\"]', NULL, '2022-10-23 14:49:31', '2022-10-23 14:49:31'),
(186, 'App\\Models\\User', 3, 'auth_token', '9d8aee17c3067d5b55451eecb43892c0ca7ed133915d5cb0ac43c755d4699123', '[\"*\"]', NULL, '2022-10-23 15:42:01', '2022-10-23 15:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `repair_notices`
--

DROP TABLE IF EXISTS `repair_notices`;
CREATE TABLE IF NOT EXISTS `repair_notices` (
  `Id_repair_notice` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `damage_info` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `damage_cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emiterii` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_repair_notice`),
  KEY `repair_notices_car_id_foreign` (`car_id`),
  KEY `repair_notices_employee_id_foreign` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repair_notices`
--

INSERT INTO `repair_notices` (`Id_repair_notice`, `car_id`, `employee_id`, `damage_info`, `damage_cost`, `data_emiterii`) VALUES
(1, 1, 1, 'Masina a fost busita pe stanga da un cocalar cu bemveu d ala vechi d acu 100 da ani', '3000', '2022-10-19 19:38:05'),
(2, 2, 1, 'Masina a fost rupta in cur', '3000', '2022-10-20 14:31:01'),
(3, 1, 1, 'FASFA', '22', '2022-10-20 19:53:04');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `denumire_furnizor`) VALUES
(1, 'LG'),
(2, 'Samsung'),
(3, 'Frigidaire'),
(4, 'Hisense'),
(5, 'Arctic'),
(6, 'Beko'),
(7, 'Boreal'),
(8, 'LDK'),
(9, 'Retro'),
(10, 'Star-Light');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `employee_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Gabi123', 'gamingro99@yahoo.com', NULL, '$2y$10$R6GkTI.6ow7Ae8h6lDs4KeIwWGMwS92s8WREiED2kA/RN8JQublCC', NULL, '2022-10-16 12:48:55', '2022-10-16 12:48:55'),
(2, 1, 'Moraru Gabriel Danut', 'moraru.gabriel00@gmail.com', NULL, '$2y$10$TeMvc9wFwZdxsp2NUx/5o.iBClEIGJ4lXsiOA4vivXDCZCZQn0Fj6', NULL, '2022-10-16 13:56:29', '2022-10-16 13:56:29'),
(3, 2, 'Goose99', 'marianpoto@yahoo.com', NULL, '$2y$10$U6U5RN6s308jNutaDuvoaOjZfZmZ7Hl5CMuOYkGnNhI6kJmWEUTza', NULL, '2022-10-20 17:45:21', '2022-10-20 17:45:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
