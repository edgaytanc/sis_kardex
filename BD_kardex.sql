-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 06:39:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kardex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatarios`
--

CREATE TABLE `destinatarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `numero_referencia` varchar(255) NOT NULL,
  `cantidad` decimal(12,0) DEFAULT NULL,
  `cantidad_actual` decimal(12,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(12,2) DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `remitente` varchar(200) NOT NULL,
  `numero_lote` varchar(255) DEFAULT NULL,
  `reajuste_positivo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `producto_id`, `fecha`, `numero_referencia`, `cantidad`, `cantidad_actual`, `precio`, `precio_unitario`, `fecha_vencimiento`, `remitente`, `numero_lote`, `reajuste_positivo`, `created_at`, `updated_at`, `id_user`, `observaciones`) VALUES
(9, 3, '2024-04-26', '-', 30, 4.00, 0.00, 4.25, '2026-03-31', 'VIENEN DEL KARDEX No. 057645', '11203', NULL, '2024-05-10 23:12:37', '2024-05-16 04:02:08', 14, NULL),
(10, 3, '2024-04-26', '-', 197, 108.00, 837.25, 4.25, '2026-03-31', 'VIENEN DEL KARDEX No. 057645', '11363', NULL, '2024-05-10 23:14:36', '2024-05-17 23:42:11', 14, NULL),
(11, 3, '2024-04-26', '-', 22, 22.00, 93.50, 4.25, '2027-02-28', 'VIENEN DEL KARDEX No. 057645', '10104', NULL, '2024-05-10 23:16:36', '2024-05-10 23:16:36', 14, NULL),
(12, 3, '2024-04-26', '-', 122, 122.00, 518.50, 4.25, '2027-02-28', 'VIENEN DEL KARDEX No. 057645', '10114', NULL, '2024-05-10 23:17:43', '2024-05-10 23:17:43', 14, NULL),
(13, 3, '2024-04-26', '-', 288, 288.00, 1224.00, 4.25, '2027-02-28', 'VIENEN DEL KARDEX No. 057645', '10144', NULL, '2024-05-10 23:18:25', '2024-05-10 23:18:25', 14, NULL),
(14, 4, '2024-04-26', '-', 8310, 7485.00, 914.10, 0.11, '2026-03-31', 'VIENEN DEL KARDEX No. 057646', 'PRA157', NULL, '2024-05-11 00:25:45', '2024-05-17 23:46:11', 14, NULL),
(15, 4, '2024-04-26', '-', 50, 0.00, 5.50, 0.11, '2026-03-31', 'VIENEN DEL KARDEX No. 057646', 'PRA158', NULL, '2024-05-11 00:26:37', '2024-05-16 04:11:54', 14, NULL),
(16, 5, '2024-04-26', '-', 6218, 5090.00, 373.08, 0.06, '2026-03-31', 'VIENEN DEL KARDEX No. 057647', 'E23031', NULL, '2024-05-11 00:44:07', '2024-05-17 23:52:56', 14, NULL),
(17, 6, '0204-04-26', '-', 9, 9.00, 71.37, 7.93, '2025-07-31', 'VIENEN DEL KARDEX No. 057648', '22821', NULL, '2024-05-11 00:55:52', '2024-05-11 00:55:52', 14, NULL),
(18, 8, '2024-04-26', '-', 91, 91.00, 22.75, 0.25, '2026-02-28', 'VIENEN DEL KARDEX No. 057649', 'T124C23', NULL, '2024-05-11 01:00:10', '2024-05-11 01:00:10', 14, NULL),
(19, 8, '2024-04-26', '-', 641, 641.00, 147.43, 0.23, '2026-04-30', 'VIENEN DEL KARDEX No. 057649', 'T044E23', NULL, '2024-05-11 01:01:13', '2024-05-11 01:01:13', 14, NULL),
(20, 10, '2024-04-26', '-', 29, 28.00, 265.35, 9.15, '2025-03-31', 'VIENEN DEL KARDEX No. 057650', '40961', NULL, '2024-05-11 01:05:54', '2024-05-11 01:08:12', 14, NULL),
(21, 10, '2024-04-26', '-', 19, 19.00, 190.00, 10.00, '2025-04-30', 'VIENEN DEL KARDEX No. 057650', 'CI-40470.04.22', NULL, '2024-05-11 01:06:52', '2024-05-11 01:06:52', 14, NULL),
(22, 12, '2024-04-26', '-', 27, 5.00, 97.20, 3.60, '2026-03-31', 'VIENEN DEL KARDEX No. 057651', 'DR329', NULL, '2024-05-11 01:09:33', '2024-05-18 00:01:44', 14, NULL),
(23, 12, '2024-04-26', '-', 455, 361.00, 1638.00, 3.60, '2027-02-28', 'VIENEN DEL KARDEX No. 057651', '0347024', NULL, '2024-05-11 01:10:16', '2024-05-18 00:04:15', 14, NULL),
(24, 15, '2024-04-26', '-', 7, 0.00, 126.00, 18.00, '2026-02-28', 'VIENEN DEL KARDEX No. 058635', 'E1554', NULL, '2024-05-11 02:31:28', '2024-05-18 00:09:55', 14, NULL),
(25, 15, '2024-04-26', '-', 54, 40.00, 972.00, 18.00, '2026-02-28', 'VIENEN DEL KARDEX No. 058635', 'E1575', NULL, '2024-05-11 02:32:14', '2024-05-18 00:10:38', 14, NULL),
(26, 15, '2024-04-26', '-', 45, 45.00, 0.00, 18.00, '2026-02-28', 'VIENEN DEL KARDEX No. 058635', 'EL539', NULL, '2024-05-11 02:33:01', '2024-05-18 00:11:29', 14, NULL),
(27, 16, '2024-04-26', '-', 1790, 1433.00, 1611.00, 0.90, '2025-05-31', 'VIENEN DEL KARDEX No. 058642', '2380007', NULL, '2024-05-11 02:50:13', '2024-05-18 00:19:26', 14, NULL),
(28, 13, '2024-04-26', '-', 8, 1.00, 30.88, 3.86, '2027-06-30', 'VIENEN DEL KARDEX No. 058637', 'DY249', NULL, '2024-05-11 02:58:45', '2024-05-18 00:30:09', 14, NULL),
(29, 13, '2024-04-26', '-', 18, 4.00, 69.48, 3.86, '2027-06-30', 'VIENEN DEL KARDEX No. 058637', 'DY257', NULL, '2024-05-11 02:59:49', '2024-05-18 00:27:06', 14, NULL),
(30, 13, '2024-04-26', '-', 50, 31.00, 193.00, 3.86, '2027-06-30', 'VIENEN DEL KARDEX No. 058637', 'DY263', NULL, '2024-05-11 03:01:28', '2024-05-18 00:32:22', 14, NULL),
(31, 13, '2024-04-26', '-', 28, 27.00, 0.00, 3.86, '2027-08-31', 'VIENEN DEL KARDEX No. 058637', 'DX654', NULL, '2024-05-11 03:02:13', '2024-05-18 00:34:15', 14, NULL),
(32, 14, '2024-04-26', '-', 23, 23.00, 4.14, 0.18, '2025-08-31', 'VIENEN DEL KARDEX No. 058632', '727220905', NULL, '2024-05-11 03:19:59', '2024-05-11 03:19:59', 14, NULL),
(33, 14, '2024-04-26', '-', 7305, 6990.00, 1168.80, 0.16, '2026-07-31', 'VIENEN DEL KARDEX No. 058632', '707230817', NULL, '2024-05-11 03:20:46', '2024-05-16 03:13:27', 14, NULL),
(34, 14, '2024-04-26', '-', 200, 200.00, 32.00, 0.16, '2026-07-31', 'VIENEN DEL KARDEX No. 058632', '707230818', NULL, '2024-05-11 03:21:22', '2024-05-11 03:21:22', 14, NULL),
(35, 18, '2024-04-26', '-', 80, 65.00, 150.40, 1.88, '2025-10-31', 'VIENEN DEL KARDEX No. 057652', '896101', NULL, '2024-05-11 03:29:14', '2024-05-11 04:14:57', 14, NULL),
(36, 18, '2024-04-26', '-', 94, 86.00, 128.78, 1.37, '2026-10-31', 'VIENEN DEL KARDEX No. 057652', '1661102', NULL, '2024-05-11 03:30:01', '2024-05-11 04:14:27', 14, NULL),
(37, 18, '2024-04-26', '-', 100, 100.00, 137.00, 1.37, '2028-02-29', 'VIENEN DEL KARDEX No. 057652', '0550024', NULL, '2024-05-11 03:30:46', '2024-05-11 03:30:46', 14, NULL),
(38, 20, '2024-04-26', '-', 29, 29.00, 230.84, 7.96, '2024-10-31', 'VIENEN DEL KARDEX No. 057653', 'DJ539', NULL, '2024-05-11 03:36:29', '2024-05-11 03:36:29', 14, NULL),
(39, 21, '2024-04-26', '-', 34, 32.00, 250.58, 7.37, '2025-04-30', 'VIENEN DEL KARDEX No. 057654', '170-23', NULL, '2024-05-11 03:37:50', '2024-05-11 04:14:07', 14, NULL),
(40, 23, '2024-04-26', '-', 72, 72.00, 57.60, 0.80, '2025-10-31', 'VIENEN DEL KARDEX No. 057655', 'T2110619', NULL, '2024-05-11 03:40:40', '2024-05-11 03:40:40', 14, NULL),
(41, 23, '2024-04-26', '-', 285, 271.00, 256.50, 0.90, '2026-05-31', 'VIENEN DEL KARDEX No. 057655', '04613', NULL, '2024-05-11 03:41:27', '2024-05-11 04:13:50', 14, NULL),
(42, 23, '2024-04-26', '-', 800, 800.00, 560.00, 0.70, '2026-05-31', 'VIENEN DEL KARDEX No. 057655', 'S727', NULL, '2024-05-11 03:42:32', '2024-05-11 03:42:32', 14, NULL),
(43, 24, '2024-04-26', '-', 18, 14.00, 44.82, 2.49, '2026-06-30', 'VIENEN DEL KARDEX No. 057656', 'G230761', NULL, '2024-05-11 03:45:13', '2024-05-11 04:13:39', 14, NULL),
(44, 24, '2024-04-26', '-', 30, 29.00, 63.00, 2.10, '2026-05-31', 'VIENEN DEL KARDEX No. 057656', 'CFEX-02', NULL, '2024-05-11 03:45:53', '2024-05-11 04:13:28', 14, NULL),
(45, 25, '2024-04-26', '-', 289, 233.00, 83.81, 0.29, '2025-11-30', 'VIENEN DEL KARDEX No. 057657', 'MD22714', NULL, '2024-05-11 03:50:28', '2024-05-11 04:13:18', 14, NULL),
(46, 25, '2024-04-26', '-', 600, 600.00, 174.00, 0.29, '2025-11-30', 'VIENEN DEL KARDEX No. 057657', 'MD22717', NULL, '2024-05-11 03:51:24', '2024-05-11 03:51:24', 14, NULL),
(47, 25, '2024-04-26', '-', 200, 200.00, 58.00, 0.29, '2026-09-30', 'VIENEN DEL KARDEX No. 057657', 'MG231085', NULL, '2024-05-11 03:52:39', '2024-05-11 03:52:39', 14, NULL),
(48, 27, '2024-04-26', '-', 29, 29.00, 72.50, 2.50, '2025-06-30', 'VIENEN DEL KARDEX No. 057659', '119105', NULL, '2024-05-11 03:57:43', '2024-05-11 03:57:43', 14, NULL),
(49, 27, '2024-04-26', '-', 10, 10.00, 18.70, 1.87, '2028-02-29', 'VIENEN DEL KARDEX No. 057659', '12669', NULL, '2024-05-11 03:58:21', '2024-05-11 03:58:21', 14, NULL),
(50, 27, '2024-04-26', '-', 191, 191.00, 357.17, 1.87, '2028-04-30', 'VIENEN DEL KARDEX No. 057659', '12714', NULL, '2024-05-11 03:59:12', '2024-05-11 03:59:12', 14, NULL),
(51, 27, '2024-04-26', '-', 400, 400.00, 512.00, 1.28, '2028-02-29', 'VIENEN DEL KARDEX No 057659', 'G182', NULL, '2024-05-11 04:00:03', '2024-05-11 04:00:03', 14, NULL),
(52, 28, '2024-04-26', '-', 5, 5.00, 49.50, 9.90, '2025-02-28', 'VIENEN DEL KARDEX No. 058640', '31303', NULL, '2024-05-11 04:05:44', '2024-05-11 04:05:44', 14, NULL),
(53, 28, '2024-04-26', '-', 6, 6.00, 54.00, 9.00, '2025-09-30', 'VIENEN DEL KARDEX No. 058640', 'EF133', NULL, '2024-05-11 04:06:30', '2024-05-11 04:06:30', 14, NULL),
(54, 29, '2024-04-26', '-', 65, 65.00, 572.00, 8.80, '0026-12-31', 'VIENEN DEL KARDEX No. 058640', 'EM813', NULL, '2024-05-11 04:07:13', '2024-05-11 04:07:13', 14, NULL),
(55, 28, '2024-04-26', '-', 65, 318.00, 572.00, 8.80, '0026-12-31', 'VIENEN DEL KARDEX No. 058640', 'EM813', NULL, '2024-05-11 04:08:37', '2024-05-11 04:12:28', 14, NULL),
(56, 2, '2024-04-26', '-', 7, 6.00, 29.40, 4.20, '2026-08-31', 'VIENEN DEL KARDEX No. 057644', 'DF279', NULL, '2024-05-16 03:45:41', '2024-05-16 03:50:49', 14, NULL),
(57, 2, '2024-04-26', '-', 3, 2.00, 12.60, 4.20, '2026-09-30', 'VIENEN DEL KARDEX No. 057644', 'DH235', NULL, '2024-05-16 03:46:25', '2024-05-16 03:48:16', 14, NULL),
(58, 2, '2024-04-26', '-', 91, 83.00, 382.20, 4.20, '2027-09-30', 'VIENEN DEL KARDEX No. 057644', 'EE414', NULL, '2024-05-16 03:47:13', '2024-05-17 23:44:52', 14, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_06_000001_create_destinatarios_table', 1),
(7, '2023_11_06_000001_create_entradas_table', 1),
(8, '2023_11_06_000002_create_productos_table', 1),
(9, '2023_11_06_000003_create_remitentes_table', 1),
(10, '2023_11_06_000004_create_salidas_table', 1),
(11, '2023_11_06_009001_add_foreigns_to_entradas_table', 1),
(12, '2023_11_06_009002_add_foreigns_to_salidas_table', 1),
(13, '2023_11_28_054544_create_permission_tables', 1),
(14, '2024_01_25_235948_add_localidad_to_users_table', 2),
(15, '2024_01_28_182329_add_user_id_to_salidas_table', 2),
(16, '2024_01_28_182532_add_user_id_to_entradas_table', 2),
(17, '2024_01_28_183105_add_user_id_to_destinatarios_table', 2),
(18, '2024_01_28_183247_add_user_id_to_remitentes_table', 2),
(19, '2024_02_04_044612_add_cantidad_actual_to_entradas_table', 3),
(20, '2024_02_04_055510_add_precio_unitario_to_salidas_table', 4),
(21, '2024_02_04_063855_add_cantidad_actual_to_salidas_table', 5),
(22, '2024_02_04_071945_add_precio_to_entradas_table', 6),
(23, '2024_02_04_071956_add_precio_to_salidas_table', 6),
(24, '2024_02_13_041005_add_permiso_to_users_table', 7),
(25, '2024_02_13_041440_add_permiso_to_users_table', 8),
(26, '2024_02_19_050522_modify_permiso_column_in_users_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'list destinatarios', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(2, 'view destinatarios', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(3, 'create destinatarios', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(4, 'update destinatarios', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(5, 'delete destinatarios', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(6, 'list entradas', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(7, 'view entradas', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(8, 'create entradas', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(9, 'update entradas', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(10, 'delete entradas', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(11, 'list productos', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(12, 'view productos', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(13, 'create productos', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(14, 'update productos', 'web', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(15, 'delete productos', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(16, 'list remitentes', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(17, 'view remitentes', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(18, 'create remitentes', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(19, 'update remitentes', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(20, 'delete remitentes', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(21, 'list salidas', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(22, 'view salidas', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(23, 'create salidas', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(24, 'update salidas', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(25, 'delete salidas', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(26, 'list roles', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(27, 'view roles', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(28, 'create roles', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(29, 'update roles', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(30, 'delete roles', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(31, 'list permissions', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(32, 'view permissions', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(33, 'create permissions', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(34, 'update permissions', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(35, 'delete permissions', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(36, 'list users', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(37, 'view users', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(38, 'create users', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(39, 'update users', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(40, 'delete users', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria` enum('Medicamento','Equipo quirurgico','Suministros','DONACIONES y traslados','BIOLOGICOS','Repuestos') DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `concentracion` varchar(255) DEFAULT NULL,
  `envase` varchar(255) DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `nombre`, `presentacion`, `concentracion`, `envase`, `unidad_medida`, `created_at`, `updated_at`) VALUES
(1, 'Medicamento', 'Alimento Complementario Fortificado, Bolsa', NULL, NULL, NULL, 'unidad', '2024-03-04 03:19:34', '2024-03-04 03:19:34'),
(2, 'Medicamento', 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', NULL, NULL, NULL, NULL, '2024-03-04 03:23:23', '2024-03-04 03:23:23'),
(3, 'Medicamento', 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:57', '2024-03-04 04:37:57'),
(4, 'Medicamento', 'Acetaminofen (Paracetamol), Tableta, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:57', '2024-03-04 04:37:57'),
(5, 'Medicamento', 'Acido Folico, Tableta, 5 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(6, 'Medicamento', 'Agua esteril (agua tridestilada), 100 mL,  Vial/Ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(7, 'Medicamento', 'Albendazol, Suspension oral, 200mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(8, 'Medicamento', 'Albendazol, Tableta, 400 mg ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(9, 'Medicamento', 'Alcohol Etilico 70%, Gel topico', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(10, 'Medicamento', 'Alcohol Isopropilico, Solucion topica, 70%, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(11, 'Medicamento', 'Alimento Terapeutico,  Sobre 92 g', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(12, 'Medicamento', 'Ambroxol, Jarabe, 15mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(13, 'Medicamento', 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(14, 'Medicamento', 'Amoxicilina, Tableta/Capsula, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(15, 'Medicamento', 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(16, 'Medicamento', 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(17, 'Medicamento', 'Ampicilina 1 g, Polvo para solucion inyectable Vial/Ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(18, 'Medicamento', 'Azitromicina, Tableta/Capsula, 500 mg ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(19, 'Medicamento', 'Alfametildopa 250 mg ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(20, 'Medicamento', 'Benzoato de Bencilo, Solucion topica, 25%, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(21, 'Medicamento', 'Calamina, Locion, 5%, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(22, 'Medicamento', 'Calcio Gluconato, Solucion inyectable, 10%, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(23, 'Medicamento', 'Cefadroxilo, Tableta/Capsula, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(24, 'Medicamento', 'Ceftriaxona 1 g, Polvo para solucion inyectable Vial/Ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(25, 'Medicamento', 'Ciprofloxacina, Tableta/Capsula, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(26, 'Medicamento', 'Claritromicina, Granulado, 250mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(27, 'Medicamento', 'Claritromicina, Tableta, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(28, 'Medicamento', 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(29, 'Medicamento', 'Clorfeniramina Maleato, Jarabe, 2mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(30, 'Medicamento', 'Clorfeniramina Maleato, Solucion inyectable, 10mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(31, 'Medicamento', 'Clorfeniramina Maleato, Tableta, 4 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(32, 'Medicamento', 'Clorhexidina gluconato, solución 5%, litro', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(33, 'Medicamento', 'Clorhexidina gluconato, jabón 4%, galón', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(34, 'Medicamento', 'Clorhexidina gluconato, solución 4%, litro', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(35, 'Medicamento', 'Cloruro de Sodio, Solucion inyectable, 0.90%, Bolsa/Frasco 500 mL', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(36, 'Medicamento', 'Clotrimazol, Crema topica, 1%, Tubo/Tarro', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(37, 'Medicamento', 'Clotrimazol, Crema vaginal, 2%, Tubo/Tarro', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(38, 'Medicamento', 'Condon masculino', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(39, 'Medicamento', 'Clindamicina 150mg/mL, Solucion inyectable Vial/Ampolla 4ml unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(40, 'Medicamento', 'Dexametasona, Solucion inyectable, 4mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(41, 'Medicamento', 'Diclofenaco Sodico, Solucion inyectable, 25mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(42, 'Medicamento', 'Dipirona (Metamizol Sodica), Solucion inyectable, 500mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(43, 'Medicamento', 'Enantato de Noretisterona, 200 mg, Vial/Ampolla (NORISTERAT)', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(44, 'Medicamento', 'Enantato de Noretisterona + Valerato de Estradiol 50mg+ 5 mg, Ampolla/Jeringa Prellenada', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(45, 'Medicamento', 'Epinefrina Clorhidrato (Adrenalina), 1mg/1mL (1:1000), Vial/Ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(46, 'Medicamento', 'Ferroso Sulfato, Tableta/Capsula, 300 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(47, 'Medicamento', 'Glimepirida, Tableta, 4mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(48, 'Medicamento', 'Hidralazina Clorhidrato, Solucion inyectable, 20mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(49, 'Medicamento', 'Hidrocortisona, Crema topica, 0.25%, Tubo/Tarro', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(50, 'Medicamento', 'Hidroxido de aluminio + Magnesio,  Suspension oral, 185mg + 200mg/5mL', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(51, 'Medicamento', 'Ibuprofeno, Tableta/Capsula, 400 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(52, 'Medicamento', 'Jeringa Pregarcada de Mesigyna, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(53, 'Medicamento', 'Lansoprazol, Tableta/Capsula, 30 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(54, 'Medicamento', 'Levonorgestrel 75 mg, Implante', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(55, 'Medicamento', 'Levonorgestrel + Etinilestradiol + Fumarato Ferroso  0.15mg + 0.03mg + 75mg, ciclo', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(56, 'Medicamento', 'Lidocaina Clorhidrato sin Epinefrina, sin preservante (simple), Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(57, 'Medicamento', 'Lidocaina dental sin Epinefrina, Solucion inyectable, 2%, Cartucho 1.8 mL', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(58, 'Medicamento', 'Losartan Potasico, Tableta, 50 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(59, 'Medicamento', 'Magnesio Sulfato, Solucion inyectable, 50%, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(60, 'Medicamento', 'Medroxiprogesterona Acetato  , Suspension inyectable, 150mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(61, 'Medicamento', 'Metformina, Tableta, 850 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(62, 'Medicamento', 'Metronidazol, Suspension oral, 125mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(63, 'Medicamento', 'Metronidazol, Tableta/Capsula, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(64, 'Medicamento', 'Metronidazol + Nistatina, Ovulo, 500 mg + 100,000 UI', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(65, 'Medicamento', 'Micronutrientes Espolvoreables  Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(66, 'Medicamento', 'Misoprostol, Tableta, 200 mcg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(67, 'Medicamento', 'Nifedipina, Tableta/Capsula, 10 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(68, 'Medicamento', 'Nistatina, Suspension oral, 100,000 UI/mL, Gotero ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(69, 'Medicamento', 'Oxido de Zinc + almidon de maiz (Pasta Lassar), Pasta, 25%, Tubo/Tarro ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(70, 'Medicamento', 'Oxitocina Sintetica, Solucion inyectable, 5 UI/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(71, 'Medicamento', 'Peroxido de Hidrogeno (agua oxigenada), Solucion topica, 3%, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(72, 'Medicamento', 'Propinoxato + Clonixinato de Lisina, 15mg + 100mg, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(73, 'Medicamento', 'Salbutamol Sulfato, Jarabe, 2mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(74, 'Medicamento', 'Sales de Rehidratacion Oral,  Polvo, 3.5g + 2.9g + 1.5g + 20g, Sobre 27.90 g', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(75, 'Medicamento', 'Solucion de Hartman 1000 mL, 0.6g + 0.31g + 0.03g + 0.02g/100mL, Bolsa/Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(76, 'Medicamento', 'Solucion de Hartman 500 mL, 0.6g + 0.31g + 0.03g + 0.02g/100mL, Bolsa/Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(77, 'Medicamento', 'Sulfacetamida Sodica, Solucion oftalmica, 10%, Gotero', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(78, 'Medicamento', 'Sulfadiazina de Plata, Crema topica, 1%, Tubo/Tarro ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(79, 'Medicamento', 'Sulfato de Zinc, Tableta/Capsula, 20mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(80, 'Medicamento', 'T de cobre (DIU), Dispositivo intrauterino', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(81, 'Medicamento', 'Tinidazol, Tableta/Capsula, 500 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(82, 'Medicamento', 'Trimetoprima + Sulfametoxazol, Suspension oral, 40-200mg/5mL, Frasco ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(83, 'Medicamento', 'Trimetoprima + Sulfametoxazol, Tableta, 160mg + 800 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(84, 'Medicamento', 'Vitamina A (Retinol) 100,000 UI, Perla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(85, 'Medicamento', 'Vitamina K1  Solucion inyectable, 10mg/mL, Vial/Ampolla ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(86, 'Medicamento', 'Vitaminas Neurotropas , Solucion Inyectable, Ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(87, 'Medicamento', 'Antimoniato de Meglumina, Solución inyectable, 300 mg/mL, vial/ampolla', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(88, 'Medicamento', 'Artemether + Lumefrantrina 20 mg + 120 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(89, 'Medicamento', 'Bedaquilina 100mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(90, 'Medicamento', 'Cicloserina 250 mg, Tableta / Capsula', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(91, 'Medicamento', 'Cloroquina, Tableta 250 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(92, 'Medicamento', 'Dolutegravir + Lamivudina + Fumarato de Tenofovir Disoproxil 50mg + 300mg + 300mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(93, 'Medicamento', 'Dolutegravir 50 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(94, 'Medicamento', 'Elvitegravir/Cobicistat/Emtricitabina/Alafenamida de Tenofovir  150 mg + 150 mg + 200 mg + 300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(95, 'Medicamento', 'Emtricitabina + Tenofovir 200/300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(96, 'Medicamento', 'Etambutol Clorhidrato  400 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(97, 'Medicamento', 'Isoniazida INH 100 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(98, 'Medicamento', 'Isoniazida INH 300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(99, 'Medicamento', 'Lamivudina + Zidovudina 150/300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(100, 'Medicamento', 'Lamivudina 150 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(101, 'Medicamento', 'Lamivudina 50 mg/5mL, Suspensión oral', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(102, 'Medicamento', 'Lopinavir + Ritonavir 400mg + 100mg/5mL, Solucion oral', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(103, 'Medicamento', 'Nevirapina 50 mg/ 5 mL, Suspensión Oral', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(104, 'Medicamento', 'Nifurtimox, Tableta 120 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(105, 'Medicamento', 'Pirazinamida  500mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(106, 'Medicamento', 'Primaquina, Tableta 15 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(107, 'Medicamento', 'Primaquina, Tableta 5 mg', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(108, 'Medicamento', 'Protionamida 250 mg, Tableta ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(109, 'Medicamento', 'Raltegravir 400 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(110, 'Medicamento', 'Rifampicina  300 mg, Capsula', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(111, 'Medicamento', 'Rifampicina 150mg + Isoniazida 75mg + Pirazinamida 400mg + etambutol 275mg comprimido combinados, Tableta ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(112, 'Medicamento', 'Rifampicina 150mg + Isoniazida 75mg Comprimidos Combinados, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(113, 'Medicamento', 'Rifampicina + isoniazida 75 mg + 50 mg, Tableta ', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(114, 'Medicamento', 'Rifapentina + Isoniazida 300 mg + 300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(115, 'Medicamento', 'Tenofovir  Disopropil fumarato 300 mg, Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(116, 'Medicamento', 'Zidovudina 10 mg/mL, Solución Inyectable', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(117, 'Medicamento', 'Zidovudina 50 mg/5 ml, Suspensión Oral', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(118, 'Medicamento', 'Tuberculina PPD STV 1ml', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(119, 'Medicamento', 'Vitamina B-06, 50mg Piridoxine HCL Tableta', NULL, NULL, NULL, NULL, '2024-03-04 04:37:58', '2024-03-04 04:37:58'),
(120, 'Equipo quirurgico', 'Algodon absorbente 100% puro, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:40:46', '2024-03-04 04:40:46'),
(121, 'Equipo quirurgico', 'Aguja dentales', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(122, 'Equipo quirurgico', 'Acido Acético, Frasco', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(123, 'Equipo quirurgico', 'Bata Estilo Gabacha Resistente a Fluido  talla unica. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(124, 'Equipo quirurgico', 'Bolsa o Balon Respiratoria para Aparato de Anestecia 20lts', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(125, 'Equipo quirurgico', 'Banditas Redondas', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(126, 'Equipo quirurgico', 'Bolsa Recolectora de Orina (adulto)', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(127, 'Equipo quirurgico', 'Cateter intravenoso No. 18G., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:12', '2024-03-04 04:59:12'),
(128, 'Equipo quirurgico', 'Cateter intravenoso No. 20G., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(129, 'Equipo quirurgico', 'Cateter intravenoso No. 22G., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(130, 'Equipo quirurgico', 'Cateter intravenoso No. 24G. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(131, 'Equipo quirurgico', 'Cinta testigo para esterilizacion con vapor , Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(132, 'Equipo quirurgico', 'Clamp umbilical, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(133, 'Equipo quirurgico', 'Curitas Redondas, Caja Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(134, 'Equipo quirurgico', 'Colorante Azul de Metileno ', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(135, 'Equipo quirurgico', 'Colorante Alcohol Acido', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(136, 'Equipo quirurgico', 'Colorante Fucsina Fenicada', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(137, 'Equipo quirurgico', 'Clam Umbilical, Uso Recien Nacido En Sala de Parto CAP y CAIMI', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(138, 'Equipo quirurgico', 'Camara Cefalica', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(139, 'Equipo quirurgico', 'Depresor de lengua (bajalenguas), Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(140, 'Equipo quirurgico', 'Equipo para venoclisis, sin aguja,  con camara de goteo transparente de 20 gotas/ml, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(141, 'Equipo quirurgico', 'Esparadrapo de seda impermeable 0.5 pulgada, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(142, 'Equipo quirurgico', 'Esparadrapo de seda impermeable 1 pulgada, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(143, 'Equipo quirurgico', 'Esparadrapo de seda impermeable 2 pulgadas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(144, 'Equipo quirurgico', 'Esparadrapo de seda impermeable 3 pulgadas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(145, 'Equipo quirurgico', 'Esparadrapo microporoso sintetico  1 pulgada, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(146, 'Equipo quirurgico', 'Esparadrapo microporoso sintetico 0.5 pulgada, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(147, 'Equipo quirurgico', 'Esparadrapo microporoso sintetico  2 pulgadas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(148, 'Equipo quirurgico', 'Esparadrapo microporoso sintetico  3 pulgadas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(149, 'Equipo quirurgico', 'Espatula o Paleta de Ayre, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(150, 'Equipo quirurgico', 'Especulo vaginal descartable mediano, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(151, 'Equipo quirurgico', 'Gasa quirurgica de 36\"x 100 yardas, Pieza', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(152, 'Equipo quirurgico', 'Gel lubricante, Sobre/Sachet Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(153, 'Equipo quirurgico', 'Gel o jalea lubricante hidrosoluble con bacteriostatico, Tubo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(154, 'Equipo quirurgico', 'Gorro descartable para cirujano, Caja Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(155, 'Equipo quirurgico', 'Guante descartable de latex grande, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(156, 'Equipo quirurgico', 'Guante descartable de latex mediano, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(157, 'Equipo quirurgico', 'Guante descartable de latex pequeño, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(158, 'Equipo quirurgico', 'Guante quirurgico No. 6 1/2, Par Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(159, 'Equipo quirurgico', 'Guante quirurgico No. 6, Par Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(160, 'Equipo quirurgico', 'Guante quirurgico No. 7 1/2, Par Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(161, 'Equipo quirurgico', 'Guante quirurgico No. 7, Par Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(162, 'Equipo quirurgico', 'Hisopo de madera, no esteril.', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(163, 'Equipo quirurgico', 'Hoja de Bisturi No. 20, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(164, 'Equipo quirurgico', 'Hoja de Bisturi No. 21, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(165, 'Equipo quirurgico', 'Hoja de Bisturi No. 22, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(166, 'Equipo quirurgico', 'Hoja de Bisturi No. 23, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(167, 'Equipo quirurgico', 'Hoja de Bisturi No. 24, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(168, 'Equipo quirurgico', 'Humificador de Oxigeno', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(169, 'Equipo quirurgico', 'Jeringa descartable 10 mL, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(170, 'Equipo quirurgico', 'Jeringa descartable 3 mL, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(171, 'Equipo quirurgico', 'Jeringa descartable 5 mL., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(172, 'Equipo quirurgico', 'Jeringa de Asepto', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(173, 'Equipo quirurgico', 'Lentes Protectores de Bioseguridad Tipo Monogafas, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(174, 'Equipo quirurgico', 'Lamina Cubreobjetos. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(175, 'Equipo quirurgico', 'Lamina Portaobjetos. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(176, 'Equipo quirurgico', 'Lamina Portaobjeto Esmerilada', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(177, 'Equipo quirurgico', 'Lanceta. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(178, 'Equipo quirurgico', 'Ligadura de Hule', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(179, 'Equipo quirurgico', 'Mascarilla quirurgica descartable, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(180, 'Equipo quirurgico', 'Mascarilla tipo respirador N95/KN95, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(181, 'Equipo quirurgico', 'Mascarilla de 02 con Reservorio', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(182, 'Equipo quirurgico', 'Papel kraft , Bobina', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(183, 'Equipo quirurgico', 'Pulsera de plastico flexible de identificacion para madre y niña color rosado, Par', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(184, 'Equipo quirurgico', 'Pulsera de plastico flexible de identificacion para madre y niño color celeste, Par', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(185, 'Equipo quirurgico', 'Palillo aplicador de madera, Bolsa Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(186, 'Equipo quirurgico', 'Pipeta tipo Pasteur descartable Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(187, 'Equipo quirurgico', 'Prueba para Rotavirus. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(188, 'Equipo quirurgico', 'Prueba rapida de Embarazo. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(189, 'Equipo quirurgico', 'Prueba rapida para Hepatitis A. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(190, 'Equipo quirurgico', 'Prueba rapida para Hepatitis B. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(191, 'Equipo quirurgico', 'Prueba rapida para Hepatitis C. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(192, 'Equipo quirurgico', 'Prueba rapida para Sifilis (simple). Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(193, 'Equipo quirurgico', 'Prueba rapida para VIH. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(194, 'Equipo quirurgico', 'Prueba rapida para Helicobacter Pylori en Heces Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(195, 'Equipo quirurgico', 'Prueba rápida para deteccion de SARS COVID-19 en hisopado', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(196, 'Equipo quirurgico', 'Recipiente para muestra de orina, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(197, 'Equipo quirurgico', 'Recipiente para muestra de BK. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(198, 'Equipo quirurgico', 'Recipiente para muestra de heces, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(199, 'Equipo quirurgico', 'Resucitador de Ambu Adulto', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(200, 'Equipo quirurgico', 'Sonda Foley  No. 16 Fr., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(201, 'Equipo quirurgico', 'Sonda Foley  No. 18 Fr., Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(202, 'Equipo quirurgico', 'Sutura Sintetica Absorbible 0-0, multifilamento, Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(203, 'Equipo quirurgico', 'Sutura Sintetica Absorbible 1-0, multifilamento, Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(204, 'Equipo quirurgico', 'Sutura Sintetica Absorbible 2-0, multifilamento, Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(205, 'Equipo quirurgico', 'Sutura Sintetica Absorbible 3-0, multifilamento, Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(206, 'Equipo quirurgico', 'Sutura Sintetica Absorbible 4-0, multifilamento, Sobre', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(207, 'Equipo quirurgico', 'Sutura Nylon (Poliamida) 2-0, monofilamento, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(208, 'Equipo quirurgico', 'Sutura Nylon (Poliamida) 3-0, monofilamento, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(209, 'Equipo quirurgico', 'Sutura Nylon (Poliamida) 4-0, monofilamento, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(210, 'Equipo quirurgico', 'Sutura Nylon (Poliamida) 5-0, monofilamento . Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(211, 'Equipo quirurgico', 'Spray fijador, Frasco', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(212, 'Equipo quirurgico', 'Termometro clinico oral, Unidad ', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(213, 'Equipo quirurgico', 'Tira reactiva para Glucosa en sangre. Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(214, 'Equipo quirurgico', 'Tira reactiva para Orina, Frasco Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(215, 'Equipo quirurgico', 'Venda elastica de 2\" x 5 yardas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(216, 'Equipo quirurgico', 'Venda elastica de 4\" x 5 yardas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(217, 'Equipo quirurgico', 'Venda elastica de 6\" x 5 yardas, Rollo', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(218, 'Equipo quirurgico', 'Zapatones para area quirurgica, Unidad', NULL, NULL, NULL, NULL, '2024-03-04 04:59:13', '2024-03-04 04:59:13'),
(220, 'Suministros', 'ALCANCIAS PLASTICAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:08:01', '2024-04-09 21:08:01'),
(221, 'Suministros', 'ATENCION DE PARTO CAIMI (4 HOJAS)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(222, 'Suministros', 'ARCHIVADOR MATERIAL CARTON TAMAÑO OFICIO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(223, 'Suministros', 'AHULADO ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(224, 'Suministros', 'AHULADO ,MATERAIL LATEX', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(225, 'Suministros', 'BATERIA CR2032 3V', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(226, 'Suministros', 'BOLIGRAFO COLOR ROJO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(227, 'Suministros', 'BOLIGRAFO COLOR NEGRO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(228, 'Suministros', 'BOLIGRAFO COLOR AZUL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(229, 'Suministros', 'BLOCK DE 100 FORMULARIO PARA EL REGISTRO EN ESPACIO AMIGABLES DEL COMPONENTE ADOLECENTE  (S.R)', NULL, NULL, NULL, 'BLOCK', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(230, 'Suministros', 'BOLSA COLOR NEGRO PARA BASURA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(231, 'Suministros', 'BOLSA COLOR BLANCO MATERIAL NYLON', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(232, 'Suministros', 'BOLSAS PARA AGUA CALIENTE', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(233, 'Suministros', 'CLIPS ESTÁNDAR', NULL, NULL, NULL, 'CAJA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(234, 'Suministros', 'CLIPS JUMBO', NULL, NULL, NULL, 'CAJA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(235, 'Suministros', 'CALENDARIO DEL COMPONENTE EDUCACION INTEGRAL (S.R)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(236, 'Suministros', 'CARNE DE COMISIONES DE SALUD COMPLEMENTO DE  IDENTIFICACION', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(237, 'Suministros', 'CARNE DE MANIPULACION DE ALIMENTOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(238, 'Suministros', 'CARNET DE VACUNACION COVID-19 ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(239, 'Suministros', 'CARNE DE NIÑO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(240, 'Suministros', 'CARNE DE NIÑA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(241, 'Suministros', 'CARNET DE PLANIFICACION FAMILIAR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(242, 'Suministros', 'CERA LIQUIDA', NULL, NULL, NULL, 'GALON', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(243, 'Suministros', 'CEPILLO DE MANO/TIPO PLANCHA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(244, 'Suministros', 'GAS PROPANO DE 25 LIBRAS ', NULL, NULL, NULL, 'CARGA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(245, 'Suministros', 'CUADERNOS DE SEGUIMIENTO CASOS DESNUTRICION AGUDA NIÑOS Y NIÑAS MENORES DE 5 AÑOS SIGSA 5DA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(246, 'Suministros', 'CUATRIFOLIARES DE METODOS DE PLANIFICACION FAMILIAR ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(247, 'Suministros', 'CUPONES DE Q.100.00', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(248, 'Suministros', 'CUPONES DE Q.250.00', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(249, 'Suministros', 'DESINFECTANTE LIQUIDO ', NULL, NULL, NULL, 'GALON', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(250, 'Suministros', 'DETERGENTE ESTADO POLVO', NULL, NULL, NULL, 'BOLSA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(251, 'Suministros', 'DESODORANTE AMBIENTAL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(252, 'Suministros', 'ESCOBAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(253, 'Suministros', 'ESPONJAS PARA LAVAR TRASTOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(254, 'Suministros', 'ESTUCHES PARA LAPICEROS, MATERIAL: TELA, LOGOS MINISTERIO, PNSR Y RES DE PYMR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(255, 'Suministros', 'FICHAS CLINICAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(256, 'Suministros', 'FILIPINA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(257, 'Suministros', 'FORMULARIO 5B', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(258, 'Suministros', 'FORMULARIO 5BA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(259, 'Suministros', 'GABACHA PARA COMADRONAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(260, 'Suministros', 'GANCHO PARA FOLDER', NULL, NULL, NULL, 'CAJA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(261, 'Suministros', 'GRAPAS ', NULL, NULL, NULL, 'CAJA', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(262, 'Suministros', 'GOMA DE PEGAR / RESISTOL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(263, 'Suministros', 'GOMA CONSISTENCIA LIQUIDA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(264, 'Suministros', 'GUIA DE USO DE MISOPROSTOL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(265, 'Suministros', 'HIPOCLORITO DE CALCIO  CONCENTRACION  70%', NULL, NULL, NULL, '100 LITRAS', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(266, 'Suministros', 'HOJA DE SIGNOS VITALES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(267, 'Suministros', 'HOJAS DE EVOLUCION DEL/A RECIEN NACIDO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(268, 'Suministros', 'HOJAS DE PLAN DE PARTO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(269, 'Suministros', 'HOJA REGISTRO DE EXAMEN DE ORINA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(270, 'Suministros', 'HUMEDECEDOR DE DEDOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(271, 'Suministros', 'IMPRESIÓN DE HOJAS PLAN DE PARTO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(272, 'Suministros', 'IMPRESIÓN ANEXO 1 REGISTRO DIARIO DE VACUNACION', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(273, 'Suministros', 'IMPRESIÓN ANEXO 2 CONSOLIDADO DIARIO DE VACUNACION', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(274, 'Suministros', 'IMPRESIÓN DE BOLETAS DE REFERENCIA Y CONTRAREFERENCIA PAPEL SENSIBILIZADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(275, 'Suministros', 'IMPRESIÓN DE BOLETA DE REFERENCIA Y CONTRA REFERNECIA IMPRESA EN UN SOLO LADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(276, 'Suministros', 'IMPRESIÓN DE CONSENTIMIENTO PARA VIH EMERGENCIA IMPRESO EN UN SOLO LADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(277, 'Suministros', 'IMPRESIÓN DE HOJA DE REFERENCIA DEL RECIEN NACIDO CON 2 COPIAS EN PAPEL SENSIBILIZADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(278, 'Suministros', 'IMPRESIÓN DE HOJA DE REGISTRO IVAA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(279, 'Suministros', 'IMPRESIÓN DE BOLETA DE SOLICITUD DE EXAMEN ANATOMICO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(280, 'Suministros', 'IMPRESIÓN EXPEDIENTE ATENCION DEL PARTO CAIMI', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(281, 'Suministros', 'IMPRESIÓN  EXPEDIENTE ATENCION DEL PARTO CAP', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(282, 'Suministros', 'IMPRESIÓN FICHA CLINICA DEL NEONATO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(283, 'Suministros', 'IMPRESIÓN FICHA INDIVIDUAL DE PLANIFICACION FAMILIAR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(284, 'Suministros', 'IMPRESIÓN DE SIGSA 25 REGISTRO DE ADOLESCENTES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(285, 'Suministros', 'IMPRESIÓN SIGSA REGISTRO TAMIZAJE', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(286, 'Suministros', 'IMPRESIÓN DE HOJA DE REFERENCIA OBSTETRICA CON 2 COPIAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(287, 'Suministros', 'IMPRESIÓN SIGSA 4 TAMAÑO OFICIO IMPRESA EN UN SOLO LADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(288, 'Suministros', 'IMPRESIÓN DE CONSENTIMIENTO INFORMADO CAVUNA COVID 19', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(289, 'Suministros', 'IMPRESIÓN SOLICITUD DE PEDIDO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(290, 'Suministros', 'IMPRESIÓN DE CARNET NIÑO MAYORES DE 7 AÑOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(291, 'Suministros', 'IMPRESIÓN SIGSA 1.2 VIH-SIDA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(292, 'Suministros', 'IMPRESIÓN SIGSA 3 C/S', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(293, 'Suministros', 'IMPRESIÓN DE SIGSA 3 P/S EMERGENCIAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(294, 'Suministros', 'IMPRESIÓN DE SISCA-RC-ETA-EE-001 CAMPAÑA NACIONAL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(295, 'Suministros', 'IMPRESIÓN DE SISCA-RPN-EE-001 CAMPAÑA NACIONAL', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(296, 'Suministros', 'IMPRESIÓN DE SIGSA 22 TIRO Y RETIRO TINTA COLOR NEGRO, TAMAÑO DOBLE CARTA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(297, 'Suministros', 'IMPRESIÓN DE ETIQUETAS A FULL COLOR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(298, 'Suministros', 'IMPRESIÓN DE ROTULOS DE ACCESO RESTRINGIDO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(299, 'Suministros', 'IMPRESIÓN DE ROTULO PROHIBIDO EL INGRESO DE ALIMENTOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(300, 'Suministros', 'JABON TIPO BOLA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(301, 'Suministros', 'JUEGO DE FICHAS CLINICAS ADOLECENTE, ADULTO Y ADULTO MAYOR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(302, 'Suministros', 'LAPICES MATERIAL MADERA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(303, 'Suministros', 'LIMPIADOR PARA SANITARIO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(304, 'Suministros', 'LIMPIA MUEBLES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(305, 'Suministros', 'LICENCIAS SANITARIAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(306, 'Suministros', 'LISTADO DE EMBARAZADAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(307, 'Suministros', 'LLANTA 235/70/ R16', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(308, 'Suministros', 'LLANTA 225/70R15', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(309, 'Suministros', 'LLANTA 245/70/ R17', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(310, 'Suministros', 'MASKING TAPE DE \"2\"', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(311, 'Suministros', 'MEMORIAS MICRO SD DE 8GB', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(312, 'Suministros', 'MOCHILA CON IMPRESIÓN DE FRASES PROMOCIONALES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(313, 'Suministros', 'MUESTRARIOS DE METODOS DE PLANIFICACION FAMILIAR ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(314, 'Suministros', 'PACHON CON IMPRESIÓN DE FRASES PROMOCIONALES PLANIFICACION FAMILIAR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(315, 'Suministros', 'PELOTA DE FUTBOL DEL COMPONENTE DE EIS  (S.R)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(316, 'Suministros', 'PELOTA DE BALONCESTO CIRCUNFERENCIA 75 A 76 CENTIMETROS NUMERO 7 COMPONENTE EIS (S.R)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(317, 'Suministros', 'PELOTAS PLASTICAS ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(318, 'Suministros', 'PORTA CONDONES CON IMPRESIÓN DE FRASES PROMOCIONALES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(319, 'Suministros', 'RESMA DE PAPEL BOND TAMAÑO CARTA', NULL, NULL, NULL, 'RESMAS', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(320, 'Suministros', 'RESMA DE PAPEL BOND TAMAÑO OFICIO', NULL, NULL, NULL, 'RESMAS', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(321, 'Suministros', 'ROTAFOLIO DE CANCER DE CERVIX', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(322, 'Suministros', 'ROTAFOLIO DE CANCER DE MAMA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(323, 'Suministros', 'SACAPUNTAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(324, 'Suministros', 'SACABASURAS (PALAS)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(325, 'Suministros', 'SOLICITUD DE LICENCIAS SANITARIAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(326, 'Suministros', 'STICKERS DE DOSIFICACION', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(327, 'Suministros', 'TAPE DE 2 PULGADAS  (SELLADOR)', NULL, NULL, NULL, 'ROLLO', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(328, 'Suministros', 'TARJETA DE SALUD ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(329, 'Suministros', 'TARJETAS DE CONTROL DE SUMINISTROS KARDEX MOVIL CON SELLO IMPRESO AUTORIZADO POR CONTRALORIA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(330, 'Suministros', 'TONER 49A', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(331, 'Suministros', 'TONER TK-1175 FOR FS-1035/1135 (PARA FOTOCOPIADORAS)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(332, 'Suministros', 'TONER 26A', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(333, 'Suministros', 'TONER 85A', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(334, 'Suministros', 'TONER 151', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(335, 'Suministros', 'TONER 35A', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(336, 'Suministros', 'TONER 3182', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(337, 'Suministros', 'TONER 3162', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(338, 'Suministros', 'TONER 58X', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(339, 'Suministros', 'TONER 58A', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(340, 'Suministros', 'TRIFOLAR AUTOESTIMA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(341, 'Suministros', 'TRIFOLIAR DE PROMOCION DE LA PARTICIPACION MASCULINA LA PATERNIDAD RESPONSABLE EN LA SALUD REPRODUCTIVA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(342, 'Suministros', 'TRIFOLIARES INFORMATIVOS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(343, 'Suministros', 'TRIFOLIAR DE METODOS DE PLANIFICACION FAMILIAR ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(344, 'Suministros', 'TRIFOLIAR DE PILDORA ANTICONCEPTIVA DE MERGENCIA (PEA)', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(345, 'Suministros', 'PAPEL HIGIENICO CLASE JUMBO ', NULL, NULL, NULL, 'ROLLO', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(346, 'Suministros', 'PIE CUBICO DE OXIGENO TIPO E', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(347, 'Suministros', 'LIBRO DE LABORATORIO DE 200 PAGINAS ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(348, 'Suministros', 'LIBRO DE TRATAMIENTO DE 200 PAGINAS ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(349, 'Suministros', 'CONSENTIMIENTO INFORMADO ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(350, 'Suministros', 'CONSENTIMIENTO INFORMADO TB', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(351, 'Suministros', 'HOJAS DE ESTUDIO DE CONTACTO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(352, 'Suministros', 'FICHAS DE NOTIFICACION Y VIGILANCIA - PAPEL SENSIBILIZADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(353, 'Suministros', 'HOJAS DE CONTRAREFERENCIA DEL PACIENTE', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(354, 'Suministros', 'HOJAS DE REFERENCIA DEL PACIENTE C/TB ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(355, 'Suministros', 'LIBRO DE PESQUISA DE 200 PAGINAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(356, 'Suministros', 'SOLICITUD DE BASILOSCOPIA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(357, 'Suministros', 'SOLICITUD DE CULTIVO ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(358, 'Suministros', 'TARJETA DE CONTROL DE TRATAMIENTO ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(359, 'Suministros', 'AFICHE JORNADA DE DESPARACITACION 4 DISEÑOS C/U', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(360, 'Suministros', 'PISTOLA TERMICA DE SILICON ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(361, 'Suministros', 'MARCADORES RESALTADORES ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(362, 'Suministros', 'ENGRAPADORA DE METAL EF25', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(363, 'Suministros', 'PERFORADORAPARA 25 HOJAS ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(364, 'Suministros', 'TIJERAS GRANDES 8\"', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(365, 'Suministros', 'PERFORADORA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(366, 'Suministros', 'TIJERA DE 20 CMS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55');
INSERT INTO `productos` (`id`, `categoria`, `nombre`, `presentacion`, `concentracion`, `envase`, `unidad_medida`, `created_at`, `updated_at`) VALUES
(367, 'Suministros', 'CINTA ADHESIVA ANCHO 2 PULGADAS 33 YARDAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(368, 'Suministros', 'CAJAS DE LAPIZ MADERA NO.2 TIPO HB', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(369, 'Suministros', 'FICHA CLINICA DEL RECIEN NACIDO ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(370, 'Suministros', 'HOJA DE REGISTRO ULTRASONIDO CON 1 COPIA PAPEL SENSIBILIZADO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(371, 'Suministros', 'TRIFOLIARES DEL DESARROLLO DEL ADOLECENTE ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(372, 'Suministros', 'RODENTICIDA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(373, 'Suministros', 'PERFORADORA PARA 10 HOJAS', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(374, 'Suministros', 'ARCHIVADOR MATERIAL CARTON TAMAÑO CARTA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(375, 'Suministros', 'CAJAS DE CRAYONES JUMBO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(376, 'Suministros', 'PAPELERA DE METAL DE 3 NIVELES ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(377, 'Suministros', 'ALMOHADILLA RECTANGULAR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(378, 'Suministros', 'CLIPS DE COLORES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(379, 'Suministros', 'CAJA PLASTICA DE 40 POR 60 CENTIMETROS ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(380, 'Suministros', 'LIMPIA MUEBLES Y OTRAS SUPERFICIES 650ML', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(381, 'Suministros', 'TOALLA; USO: TRAPEAR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(382, 'Suministros', 'IMPRESIÓN CARNET DE LA EMBARAZADA', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(383, 'Suministros', 'IMPRESIÓN CUADERNILLO FICHA CLINICA PRENATAL Y PUERPERIO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(384, 'Suministros', 'IMPRESION HOJAS DE PLAN DE VIDA A DOBLE CARA ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(385, 'Suministros', 'IMPRESIÓN CALCULADORA DE EMBARAZO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(386, 'Suministros', 'IMPRESIÓN TRIFOLIARES CONSEJOS DE ALIMENTACION DURANTE EL EMBARAZO', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(387, 'Suministros', 'IMPRESIÓN DE TRIFOLIARES PREVENCION DEL EMBARAZO EN ADOLECENTES', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(388, 'Suministros', 'TRIFOLIARES EMBARAZO EN EL ADOLECENTE', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:12:55', '2024-04-09 21:12:55'),
(390, 'DONACIONES y traslados', 'AFICHES DEL CUI IDENTIFICA ¡YO LO NOTO!', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:15:43', '2024-04-09 21:25:23'),
(391, 'DONACIONES y traslados', 'ALGODÓN ROLLO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(392, 'DONACIONES y traslados', 'ALTAVOZ DE TROMPETA SKY DE 20\"', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(393, 'DONACIONES y traslados', 'AMPLIFICADOR SKY PA480', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(394, 'DONACIONES y traslados', 'ATRIL ALTURA 160 CMS MEDICAL MASTER', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(395, 'DONACIONES y traslados', 'BALANZA DIGITAL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(396, 'DONACIONES y traslados', 'BASCULAS CLÍNICAS ADULTO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(397, 'DONACIONES y traslados', 'BASE PARA MONTAR 2 TROMPETAS ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(398, 'DONACIONES y traslados', 'BOCINAS PLUS AUDIO ULTRA 2 GO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(399, 'DONACIONES y traslados', 'BOMBILLO PARA MICROSCOPIO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(400, 'DONACIONES y traslados', 'BOTE ROCIADOR', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(401, 'DONACIONES y traslados', 'BOTON PROMOCIONAL ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(402, 'DONACIONES y traslados', 'CABLE CALIBRE 10 COLOR ROJO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(403, 'DONACIONES y traslados', 'CABLE CALIBRE 14 COLOR AZUL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(404, 'DONACIONES y traslados', 'CABLE S 6M', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(405, 'DONACIONES y traslados', 'CAJAS FRIAS MOCELO C.B. 20 C.F.', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(406, 'DONACIONES y traslados', 'CAMARA CEFALICA ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(407, 'DONACIONES y traslados', 'CARGADOR DE BATERIAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(408, 'DONACIONES y traslados', 'CILINDRO DE OXIGENO CAPACIDAD 622 LITROS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(409, 'DONACIONES y traslados', 'CINTA CEFALICA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(410, 'DONACIONES y traslados', 'CINTA CEFALICA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(411, 'DONACIONES y traslados', 'CINTA METRICA ADULTO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(412, 'DONACIONES y traslados', 'CINTA METRICA NIÑO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(413, 'DONACIONES y traslados', 'COMPUTADORA DE ESCRITORIO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(414, 'DONACIONES y traslados', 'COMPUTADORA DE ESCRITORIO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(415, 'DONACIONES y traslados', 'COMPUTADORA PORTATIL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(416, 'DONACIONES y traslados', 'CORDON UMBILICAL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(417, 'DONACIONES y traslados', 'CUADERNO SIGSA 5A', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(418, 'DONACIONES y traslados', 'CUCHARA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(419, 'DONACIONES y traslados', 'DOPLER FETAL ALTO 13.8 CMS ANCHO 8.5 CMS EDAN', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(420, 'DONACIONES y traslados', 'DUFFE BAG NAVI', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(421, 'DONACIONES y traslados', 'ESFIGMOMANÓMETRO ANEROIDE', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(422, 'DONACIONES y traslados', 'ESFIGNOMANOMETRO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(423, 'DONACIONES y traslados', 'ESTETOSCOPIO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(424, 'DONACIONES y traslados', 'ESTETOSCOPIO LTTMAN', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(425, 'DONACIONES y traslados', 'FICHAS CONTROL DE PRENATAL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(426, 'DONACIONES y traslados', 'FICHAS MENORES DE 28 DIAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(427, 'DONACIONES y traslados', 'FOMY (pliego)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(428, 'DONACIONES y traslados', 'FORMULARIO DE REQUISICION AUTORIZADAS ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(429, 'DONACIONES y traslados', 'FORMULARIO DE REQUISICION AUTORIZADAS Y NO AUTORIZADAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(430, 'DONACIONES y traslados', 'FRAZADA DE FRANELA PARA RECIEN NACIDO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(431, 'DONACIONES y traslados', 'GLUCÓMETRO ACCU ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(432, 'DONACIONES y traslados', 'GORRA DE GABARDINA ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(433, 'DONACIONES y traslados', 'GORRO PARA BEBE TIPICO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(434, 'DONACIONES y traslados', 'GRAFICOS DE CLIPS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(435, 'DONACIONES y traslados', 'GUIAS DE PROVEEDOR', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(436, 'DONACIONES y traslados', 'HERMETICO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(437, 'DONACIONES y traslados', 'HORNILLA ELECTRICA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(438, 'DONACIONES y traslados', 'IMPRESORA DE INYECCION DE TINTA CONTINUA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(439, 'DONACIONES y traslados', 'INSTRUMENTO MUSICAL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(440, 'DONACIONES y traslados', 'JUEGO DE JACKS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(441, 'DONACIONES y traslados', 'KIT DE REPUESTOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(442, 'DONACIONES y traslados', 'KIT REPLICA DE ALIMENTOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(443, 'DONACIONES y traslados', 'LAPICEROS PLASTICOS ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(444, 'DONACIONES y traslados', 'MANTA VINILICA \"SEMANA DE LA LACTANCIA MATERNA\"', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(445, 'DONACIONES y traslados', 'MANUALES PARA ALUMNOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(446, 'DONACIONES y traslados', 'MASCARILLA QUIRURGICA DE 3 CAPAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(447, 'DONACIONES y traslados', 'MEMORIA USB TIPO TARJETA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(448, 'DONACIONES y traslados', 'MESA PLEGABLE OSKA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(449, 'DONACIONES y traslados', 'MICROFONO DINAMICO ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(450, 'DONACIONES y traslados', 'MOCHILA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(451, 'DONACIONES y traslados', 'MOTOCICLETA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(452, 'DONACIONES y traslados', 'MOTOCICLETAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(453, 'DONACIONES y traslados', 'MUÑECA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(454, 'DONACIONES y traslados', 'OLLA DE PELTRE', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(455, 'DONACIONES y traslados', 'OXIMETRO DE PULSO CONTEC', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(456, 'DONACIONES y traslados', 'PALETA DE MADERA', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(457, 'DONACIONES y traslados', 'PAPEL CHINA (PLIEGO)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(458, 'DONACIONES y traslados', 'PAPEL IRIS (PLIEGO)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(459, 'DONACIONES y traslados', 'PAPEL PERIODICO (PLIEGO)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(460, 'DONACIONES y traslados', 'PAQUETE REFRIGERANTE PARA TERMO KING SEALEY', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(461, 'DONACIONES y traslados', 'PAQUETES FRIOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(462, 'DONACIONES y traslados', 'PAQUETES FRIOS 0.6 LITROS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(463, 'DONACIONES y traslados', 'PAQUETES FRIOS/BATERIAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(464, 'DONACIONES y traslados', 'PLATOS DE ALIMENTACION', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(465, 'DONACIONES y traslados', 'POSTER AYUDANDO A LA MADRE A SOBREVIVIR', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(466, 'DONACIONES y traslados', 'RECETA PARA EMBARAZADAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(467, 'DONACIONES y traslados', 'RECETA PARA MENOR DE 1 A 2 AÑOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(468, 'DONACIONES y traslados', 'RECETA PARA MENOR DE 6 A 8 MESES', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(469, 'DONACIONES y traslados', 'RECETA PARA MENOR DE 6 MESES', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(470, 'DONACIONES y traslados', 'RECETA PARA MENOR DE 9 A 11 MESES', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(471, 'DONACIONES y traslados', 'RESMAS DE PAPEL BOND', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(472, 'DONACIONES y traslados', 'ROMPECABEZAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(473, 'DONACIONES y traslados', 'SET DE MANUALES PARA FACILITADOR', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(474, 'DONACIONES y traslados', 'SILLA DE RUEDAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(475, 'DONACIONES y traslados', 'TABLA SHANON', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(476, 'DONACIONES y traslados', 'TARJETA DE CONTROL DE SUMINISTROS MANUAL AUTORIZADAS ', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(477, 'DONACIONES y traslados', 'TAZAS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(478, 'DONACIONES y traslados', 'TERMO MODELO BK.-VC 3.4 C.F.', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(479, 'DONACIONES y traslados', 'TERMO MODELO BK-VC 1.7 C.F.', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(480, 'DONACIONES y traslados', 'TERMO ROJO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(481, 'DONACIONES y traslados', 'TERMOMETRO DE ALCOHOL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(482, 'DONACIONES y traslados', 'TERMÓMETRO DIGITAL', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(483, 'DONACIONES y traslados', 'TERMOMETRO INFRARROJO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(484, 'DONACIONES y traslados', 'TERMOMETRO INFRARROJO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(485, 'DONACIONES y traslados', 'TERMOS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(486, 'DONACIONES y traslados', 'TERMOS KING SEALEY (TERMOS)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(487, 'DONACIONES y traslados', 'TIRAS PARA GLUCOMETRO', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(488, 'DONACIONES y traslados', 'TOALLA (juego de 3 unidades)', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(489, 'DONACIONES y traslados', 'TRIFOLIARES DEL CUI IDENTIFICA ¡YO LO NOTO!', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(490, 'DONACIONES y traslados', 'UPS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(491, 'DONACIONES y traslados', 'UPS/REGULADOR', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(492, 'DONACIONES y traslados', 'UPS', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(493, 'DONACIONES y traslados', 'USB', NULL, NULL, NULL, 'Unidad', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(494, 'DONACIONES y traslados', 'XILOFONO', NULL, NULL, NULL, NULL, '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(495, 'BIOLOGICOS', 'VACUNA HEPATITIS B PEDIATRICA', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(496, 'BIOLOGICOS', 'VACUNA BCG', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(497, 'BIOLOGICOS', 'VACUNA IPV', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(498, 'BIOLOGICOS', 'VACUNA OPV BIOPOLIO 10 DOSIS B1/3', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(499, 'BIOLOGICOS', 'VACUNA PENTAVALENTE', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(500, 'BIOLOGICOS', 'VACUNA ROTAVIRUS', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(501, 'BIOLOGICOS', 'VACUNA NEUMOCOCO 23 VALENTE ADULTO', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(502, 'BIOLOGICOS', 'VACUNA NEUMOCOCO UNIDOSIS', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(503, 'BIOLOGICOS', 'VACUNA SPR ', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(504, 'BIOLOGICOS', 'VACUNA DPT 10 DOSIS', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(505, 'BIOLOGICOS', 'VACUNA TD 10 DOSIS', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(506, 'BIOLOGICOS', 'VACUNA VPH', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(507, 'BIOLOGICOS', 'VACUNA TDAP ', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(508, 'BIOLOGICOS', 'VACUNA HEPATITIS B ADULTO', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(509, 'BIOLOGICOS', 'VACUNA ANTIRRABICA HUMANA TRATAMIENTO DE 4 DOSIS ', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(510, 'BIOLOGICOS', 'JERINGA 25 GX58 1CC', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(511, 'BIOLOGICOS', 'JERINGA 25 G/58 SPR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(512, 'BIOLOGICOS', 'JERINGA 23 G 0.5 CC DPT', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(513, 'BIOLOGICOS', 'JERINGA 23 G*1CC', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(514, 'BIOLOGICOS', 'JERINGA 22 G 0.5 CC ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(515, 'BIOLOGICOS', 'JERINGA 26 0.5 CC ', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(516, 'BIOLOGICOS', 'JERINGA 22 G 5 CC DILUIR', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(517, 'BIOLOGICOS', 'DILUYENTE BCG', NULL, NULL, NULL, 'MULTIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(518, 'BIOLOGICOS', 'DILUYENTE SPR', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(519, 'BIOLOGICOS', 'DILUYENTE SR', NULL, NULL, NULL, 'UNIDOSIS', '2024-04-09 21:25:23', '2024-04-09 21:25:23'),
(520, 'BIOLOGICOS', 'CAJAS DE BIOSEGURIDAD', NULL, NULL, NULL, 'UNIDAD', '2024-04-09 21:25:23', '2024-04-09 21:25:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitentes`
--

CREATE TABLE `remitentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36'),
(2, 'super-admin', 'web', '2023-11-28 11:46:36', '2023-11-28 11:46:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entrada_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `numero_referencia` varchar(255) NOT NULL,
  `destinatario` varchar(200) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `lote_salida` varchar(255) DEFAULT NULL,
  `cantidad_salida` int(12) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `cantidad_actual` int(12) DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `reajuste_negativo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `entrada_id`, `nombre_producto`, `fecha`, `numero_referencia`, `destinatario`, `fecha_vencimiento`, `lote_salida`, `cantidad_salida`, `precio`, `cantidad_actual`, `precio_unitario`, `reajuste_negativo`, `created_at`, `updated_at`, `id_user`, `observaciones`) VALUES
(9, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 4, 820.25, 193, 4.25, NULL, '2024-05-10 23:20:41', '2024-05-10 23:20:41', 14, NULL),
(10, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-04-27', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 811.75, 191, 4.25, NULL, '2024-05-10 23:21:50', '2024-05-10 23:21:50', 14, NULL),
(11, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 803.25, 189, 4.25, NULL, '2024-05-10 23:22:48', '2024-05-10 23:22:48', 14, NULL),
(12, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 667.25, 157, 4.25, NULL, '2024-05-10 23:23:34', '2024-05-11 00:37:48', 14, NULL),
(13, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 7, 765.00, 180, 4.25, NULL, '2024-05-10 23:24:21', '2024-05-10 23:24:21', 14, NULL),
(14, 9, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vaquez Chotacaj', '2026-03-31', '11203', 5, 106.25, 25, 4.25, NULL, '2024-05-10 23:25:59', '2024-05-10 23:25:59', 14, NULL),
(15, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 3, 663.00, 156, 4.25, NULL, '2024-05-10 23:26:34', '2024-05-11 02:37:15', 14, NULL),
(16, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 748.00, 176, 4.25, NULL, '2024-05-10 23:27:23', '2024-05-10 23:27:23', 14, NULL),
(17, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 739.50, 174, 4.25, NULL, '2024-05-10 23:29:44', '2024-05-10 23:29:44', 14, NULL),
(18, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 4, 722.50, 170, 4.25, NULL, '2024-05-10 23:30:09', '2024-05-10 23:30:09', 14, NULL),
(19, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 667.25, 157, 4.25, NULL, '2024-05-10 23:30:33', '2024-05-11 00:38:07', 14, NULL),
(20, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 4, 697.00, 164, 4.25, NULL, '2024-05-10 23:30:59', '2024-05-10 23:30:59', 14, NULL),
(21, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-08', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 688.50, 162, 4.25, NULL, '2024-05-10 23:31:20', '2024-05-10 23:31:20', 14, NULL),
(22, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 5, 667.25, 157, 4.25, NULL, '2024-05-10 23:31:44', '2024-05-10 23:31:44', 14, NULL),
(23, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 60, 907.50, 8250, 0.11, NULL, '2024-05-11 00:28:04', '2024-05-11 00:28:04', 14, NULL),
(24, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-04-27', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 906.40, 8240, 0.11, NULL, '2024-05-11 00:28:29', '2024-05-11 00:28:29', 14, NULL),
(25, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 20, 869.00, 7900, 0.11, NULL, '2024-05-11 00:29:06', '2024-05-11 00:37:22', 14, NULL),
(26, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 40, 899.80, 8180, 0.11, NULL, '2024-05-11 00:29:42', '2024-05-11 00:29:42', 14, NULL),
(27, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-04-30', 'RDDR MX CC50-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 40, 869.00, 7900, 0.11, NULL, '2024-05-11 00:30:36', '2024-05-16 04:06:10', 14, NULL),
(28, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2026-03-31', 'PRA157', 10, 869.00, 7900, 0.11, NULL, '2024-05-11 00:31:42', '2024-05-11 00:37:04', 14, NULL),
(29, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 893.20, 8120, 0.11, NULL, '2024-05-11 00:32:21', '2024-05-11 00:32:21', 14, NULL),
(30, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 20, 891.00, 8100, 0.11, NULL, '2024-05-11 00:32:48', '2024-05-11 00:32:48', 14, NULL),
(31, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 40, 869.00, 7900, 0.11, NULL, '2024-05-11 00:33:16', '2024-05-11 00:36:53', 14, NULL),
(32, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 885.50, 8050, 0.11, NULL, '2024-05-11 00:33:40', '2024-05-11 00:33:40', 14, NULL),
(33, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 80, 869.00, 7900, 0.11, NULL, '2024-05-11 00:34:01', '2024-05-11 00:36:29', 14, NULL),
(34, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 869.00, 7900, 0.11, NULL, '2024-05-11 00:34:24', '2024-05-11 00:36:19', 14, NULL),
(35, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-08', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 30, 869.00, 7900, 0.11, NULL, '2024-05-11 00:34:48', '2024-05-11 00:36:01', 14, NULL),
(36, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 30, 869.00, 7900, 0.11, NULL, '2024-05-11 00:35:17', '2024-05-11 00:35:17', 14, NULL),
(37, 16, 'Acido Folico, Tableta, 5 mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 32, 348.36, 5806, 0.06, NULL, '2024-05-11 00:45:14', '2024-05-16 03:22:08', 14, NULL),
(38, 16, 'Acido Folico, Tableta, 5 mg', '2024-04-27', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 40, 348.36, 5806, 0.06, NULL, '2024-05-11 00:45:49', '2024-05-11 04:17:22', 14, NULL),
(39, 16, 'Acido Folico, Tableta, 5 mg', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 32, 348.36, 5806, 0.06, NULL, '2024-05-11 00:46:21', '2024-05-16 03:21:54', 14, NULL),
(40, 16, 'Acido Folico, Tableta, 5 mg', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 24, 348.36, 5806, 0.06, NULL, '2024-05-11 00:46:54', '2024-05-16 03:21:38', 14, NULL),
(41, 16, 'Acido Folico, Tableta, 5 mg', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 36, 348.36, 5806, 0.06, NULL, '2024-05-11 00:47:26', '2024-05-16 03:21:26', 14, NULL),
(42, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2026-03-31', 'E23031', 60, 359.88, 5998, 0.06, NULL, '2024-05-11 00:48:18', '2024-05-11 00:48:18', 14, NULL),
(43, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 36, 348.36, 5806, 0.06, NULL, '2024-05-11 00:48:45', '2024-05-16 03:21:12', 14, NULL),
(44, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 28, 348.36, 5806, 0.06, NULL, '2024-05-11 00:49:14', '2024-05-16 03:21:02', 14, NULL),
(45, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 16, 348.36, 5806, 0.06, NULL, '2024-05-11 00:49:49', '2024-05-16 03:20:44', 14, NULL),
(46, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 68, 348.36, 5806, 0.06, NULL, '2024-05-11 00:50:20', '2024-05-16 03:20:32', 14, NULL),
(47, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 12, 348.36, 5806, 0.06, NULL, '2024-05-11 00:50:49', '2024-05-16 03:20:21', 14, NULL),
(48, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-08', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 16, 348.36, 5806, 0.06, NULL, '2024-05-11 00:51:15', '2024-05-16 03:20:06', 14, NULL),
(49, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 12, 348.36, 5806, 0.06, NULL, '2024-05-11 00:51:39', '2024-05-16 03:19:54', 14, NULL),
(50, 20, 'Alcohol Isopropilico, Solucion topica, 70%, Frasco', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2025-03-31', '40961', 1, 280.00, 28, 10.00, NULL, '2024-05-11 01:08:12', '2024-05-11 01:08:12', 14, NULL),
(51, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 4, 1472.40, 409, 3.60, NULL, '2024-05-11 01:11:46', '2024-05-16 03:19:38', 14, NULL),
(52, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-04-27', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 2, 1472.40, 409, 3.60, NULL, '2024-05-11 01:12:14', '2024-05-16 03:19:28', 14, NULL),
(53, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 6, 1472.40, 409, 3.60, NULL, '2024-05-11 01:13:25', '2024-05-16 03:19:19', 14, NULL),
(54, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1472.40, 409, 3.60, NULL, '2024-05-11 01:13:53', '2024-05-16 03:19:09', 14, NULL),
(55, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 7, 1472.40, 409, 3.60, NULL, '2024-05-11 01:14:22', '2024-05-16 03:18:28', 14, NULL),
(56, 22, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2026-03-31', 'DR329', 5, 79.20, 22, 3.60, NULL, '2024-05-11 01:15:07', '2024-05-11 01:15:07', 14, NULL),
(57, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 2, 1472.40, 409, 3.60, NULL, '2024-05-11 01:15:33', '2024-05-16 03:18:15', 14, NULL),
(58, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1472.40, 409, 3.60, NULL, '2024-05-11 01:16:00', '2024-05-16 03:18:05', 14, NULL),
(59, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 4, 1472.40, 409, 3.60, NULL, '2024-05-11 01:16:29', '2024-05-16 03:17:56', 14, NULL),
(60, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 4, 1472.40, 409, 3.60, NULL, '2024-05-11 01:16:59', '2024-05-16 03:17:41', 14, NULL),
(61, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1472.40, 409, 3.60, NULL, '2024-05-11 01:17:26', '2024-05-16 03:17:30', 14, NULL),
(62, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1472.40, 409, 3.60, NULL, '2024-05-11 01:17:56', '2024-05-16 03:17:20', 14, NULL),
(63, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 5, 1472.40, 409, 3.60, NULL, '2024-05-11 01:18:25', '2024-05-16 03:17:02', 14, NULL),
(64, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-02-28', 'E1575', 1, 882.00, 49, 18.00, NULL, '2024-05-11 02:42:10', '2024-05-16 03:16:46', 14, NULL),
(65, 24, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2026-02-28', 'E1554', 1, 108.00, 6, 18.00, NULL, '2024-05-11 02:42:44', '2024-05-11 02:42:44', 14, NULL),
(66, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-02-28', 'E1575', 1, 882.00, 49, 18.00, NULL, '2024-05-11 02:43:15', '2024-05-16 03:16:33', 14, NULL),
(67, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-02-28', 'E1575', 1, 882.00, 49, 18.00, NULL, '2024-05-11 02:43:42', '2024-05-16 03:16:24', 14, NULL),
(68, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-02-28', 'E1575', 2, 882.00, 49, 18.00, NULL, '2024-05-11 02:44:12', '2024-05-16 03:16:17', 14, NULL),
(69, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:51:21', '2024-05-16 03:16:08', 14, NULL),
(70, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 42, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:51:47', '2024-05-16 03:15:57', 14, NULL),
(71, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:52:15', '2024-05-16 03:15:47', 14, NULL),
(72, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2025-05-31', '2380007', 14, 1522.80, 1692, 0.90, NULL, '2024-05-11 02:52:48', '2024-05-11 02:52:48', 14, NULL),
(73, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:53:29', '2024-05-16 03:15:35', 14, NULL),
(74, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:53:51', '2024-05-16 03:15:28', 14, NULL),
(75, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 42, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:54:21', '2024-05-16 03:15:15', 14, NULL),
(76, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:54:47', '2024-05-16 03:15:06', 14, NULL),
(77, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 1409.40, 1566, 0.90, NULL, '2024-05-11 02:55:19', '2024-05-16 03:14:59', 14, NULL),
(78, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-04-27', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 1, 23.16, 6, 3.86, NULL, '2024-05-11 03:04:32', '2024-05-16 03:14:51', 14, NULL),
(79, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 1, 23.16, 6, 3.86, NULL, '2024-05-11 03:05:06', '2024-05-16 03:14:43', 14, NULL),
(80, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 3, 23.16, 6, 3.86, NULL, '2024-05-11 03:06:06', '2024-05-16 03:14:33', 14, NULL),
(81, 28, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0053-2024', 'CC Vasquez Chotacaj', '2027-06-30', 'DY249', 1, 27.02, 7, 3.86, NULL, '2024-05-11 03:06:48', '2024-05-11 03:06:48', 14, NULL),
(82, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 1, 23.16, 6, 3.86, NULL, '2024-05-11 03:07:27', '2024-05-16 03:14:24', 14, NULL),
(83, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 2, 23.16, 6, 3.86, NULL, '2024-05-11 03:07:59', '2024-05-16 03:14:13', 14, NULL),
(84, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 1, 23.16, 6, 3.86, NULL, '2024-05-11 03:08:30', '2024-05-16 03:14:04', 14, NULL),
(85, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 1, 23.16, 6, 3.86, NULL, '2024-05-11 03:08:55', '2024-05-16 03:13:53', 14, NULL),
(86, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY257', 2, 23.16, 6, 3.86, NULL, '2024-05-11 03:09:24', '2024-05-16 03:13:44', 14, NULL),
(87, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 1, 189.14, 49, 3.86, NULL, '2024-05-11 03:09:55', '2024-05-16 03:13:36', 14, NULL),
(88, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 21, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:22:40', '2024-05-16 03:13:27', 14, NULL),
(89, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 21, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:23:04', '2024-05-16 03:13:16', 14, NULL),
(90, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 21, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:23:32', '2024-05-11 04:16:23', 14, NULL),
(91, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 42, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:24:04', '2024-05-11 04:16:13', 14, NULL),
(92, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 42, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:24:34', '2024-05-11 04:16:04', 14, NULL),
(93, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 21, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:25:19', '2024-05-11 04:15:52', 14, NULL),
(94, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 63, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:25:47', '2024-05-11 04:15:41', 14, NULL),
(95, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-05-08', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 42, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:26:13', '2024-05-11 04:15:14', 14, NULL),
(96, 33, 'Amoxicilina, Tableta/Capsula, 500 mg', '2024-05-09', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-07-31', '707230817', 42, 1118.40, 6990, 0.16, NULL, '2024-05-11 03:26:36', '2024-05-11 04:15:06', 14, NULL),
(97, 35, 'Azitromicina, Tableta/Capsula, 500 mg', '2024-04-28', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-10-31', '896101', 5, 122.20, 65, 1.88, NULL, '2024-05-11 03:32:28', '2024-05-11 04:14:57', 14, NULL),
(98, 35, 'Azitromicina, Tableta/Capsula, 500 mg', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-10-31', '896101', 5, 122.20, 65, 1.88, NULL, '2024-05-11 03:32:55', '2024-05-11 04:14:46', 14, NULL),
(99, 35, 'Azitromicina, Tableta/Capsula, 500 mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-10-31', '896101', 5, 122.20, 65, 1.88, NULL, '2024-05-11 03:33:22', '2024-05-11 04:14:38', 14, NULL),
(100, 36, 'Azitromicina, Tableta/Capsula, 500 mg', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-10-31', '1661102', 5, 117.82, 86, 1.37, NULL, '2024-05-11 03:33:50', '2024-05-11 04:14:27', 14, NULL),
(101, 36, 'Azitromicina, Tableta/Capsula, 500 mg', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-10-31', '1661102', 3, 117.82, 86, 1.37, NULL, '2024-05-11 03:34:21', '2024-05-11 04:14:16', 14, NULL),
(102, 39, 'Calamina, Locion, 5%, Frasco', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-04-30', '170-23', 1, 235.84, 32, 7.37, NULL, '2024-05-11 03:38:25', '2024-05-11 04:14:07', 14, NULL),
(103, 39, 'Calamina, Locion, 5%, Frasco', '2024-04-29', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-04-30', '170-23', 1, 235.84, 32, 7.37, NULL, '2024-05-11 03:38:51', '2024-05-11 04:13:58', 14, NULL),
(104, 41, 'Cefadroxilo, Tableta/Capsula, 500 mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-05-31', '04613', 14, 243.90, 271, 0.90, NULL, '2024-05-11 03:43:38', '2024-05-11 04:13:50', 14, NULL),
(105, 43, 'Ceftriaxona 1 g, Polvo para solucion inyectable Vial/Ampolla', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-06-30', 'G230761', 4, 34.86, 14, 2.49, NULL, '2024-05-11 03:47:02', '2024-05-11 04:13:39', 14, NULL),
(106, 44, 'Ceftriaxona 1 g, Polvo para solucion inyectable Vial/Ampolla', '2024-05-07', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-05-31', 'CFEX-02', 1, 60.90, 29, 2.10, NULL, '2024-05-11 03:47:33', '2024-05-11 04:13:28', 14, NULL),
(107, 45, 'Ciprofloxacina, Tableta/Capsula, 500 mg', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-11-30', 'MD22714', 14, 67.57, 233, 0.29, NULL, '2024-05-11 03:53:30', '2024-05-11 04:13:18', 14, NULL),
(108, 45, 'Ciprofloxacina, Tableta/Capsula, 500 mg', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-11-30', 'MD22714', 28, 67.57, 233, 0.29, NULL, '2024-05-11 03:53:57', '2024-05-11 04:13:07', 14, NULL),
(109, 45, 'Ciprofloxacina, Tableta/Capsula, 500 mg', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-11-30', 'MD22714', 14, 67.57, 233, 0.29, NULL, '2024-05-11 03:54:25', '2024-05-11 04:12:59', 14, NULL),
(110, 55, 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero', '2024-04-26', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '0026-12-31', 'EM813', 1, 2226.40, 253, 8.80, NULL, '2024-05-11 04:09:08', '2024-05-11 04:12:18', 14, NULL),
(111, 55, 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero', '2024-05-02', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '0026-12-31', 'EM813', 1, 2798.40, 318, 8.80, NULL, '2024-05-11 04:09:35', '2024-05-11 04:12:28', 14, NULL),
(112, 55, 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero', '2024-05-04', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '0026-12-31', 'EM813', 2, 1654.40, 188, 8.80, NULL, '2024-05-11 04:10:18', '2024-05-11 04:12:09', 14, NULL),
(113, 55, 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero', '2024-05-05', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '0026-12-31', 'EM813', 2, 1082.40, 123, 8.80, NULL, '2024-05-11 04:10:44', '2024-05-11 04:11:59', 14, NULL),
(114, 55, 'Cloranfenicol, Solucion oftalmica, 0.50%, Gotero', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'RDDR MX 0050-2024 C 1 Entregado a usuario Clínica 1', '0026-12-31', 'EM813', 1, 510.40, 58, 8.80, NULL, '2024-05-11 04:11:36', '2024-05-11 04:11:36', 14, NULL),
(122, 57, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-04-30', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-09-30', 'DH235', 1, 8.40, 2, 4.20, NULL, '2024-05-16 03:48:16', '2024-05-16 03:48:16', 14, NULL),
(123, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-03', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-09-30', 'EE414', 1, 378.00, 90, 4.20, NULL, '2024-05-16 03:48:53', '2024-05-16 03:48:53', 14, NULL),
(124, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2027-09-30', 'EE414', 1, 373.80, 89, 4.20, NULL, '2024-05-16 03:49:39', '2024-05-16 03:49:39', 14, NULL),
(125, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2027-09-30', 'EE414', 1, 369.60, 88, 4.20, NULL, '2024-05-16 03:50:15', '2024-05-16 03:50:15', 14, NULL),
(126, 56, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-08-31', 'DF279', 1, 25.20, 6, 4.20, NULL, '2024-05-16 03:50:49', '2024-05-16 03:50:49', 14, NULL),
(127, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-09-30', 'EE414', 1, 365.40, 87, 4.20, NULL, '2024-05-16 03:51:22', '2024-05-16 03:51:22', 14, NULL),
(128, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-09-30', 'EE414', 2, 352.80, 84, 4.20, NULL, '2024-05-16 03:51:51', '2024-05-16 03:53:54', 14, NULL),
(129, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-06', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-09-30', 'EE414', 1, 352.80, 84, 4.20, NULL, '2024-05-16 03:52:58', '2024-05-16 03:52:58', 14, NULL),
(130, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-10', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 1, 651.00, 155, 4.20, NULL, '2024-05-16 03:55:27', '2024-05-16 03:55:27', 14, NULL),
(131, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-11', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 6, 625.80, 149, 4.20, NULL, '2024-05-16 03:55:52', '2024-05-16 03:55:52', 14, NULL),
(132, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 1, 621.60, 148, 4.20, NULL, '2024-05-16 03:56:28', '2024-05-16 03:56:28', 14, NULL),
(133, 9, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2026-03-31', '11203', 8, 71.40, 17, 4.20, NULL, '2024-05-16 03:58:25', '2024-05-16 03:58:25', 14, NULL),
(134, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2026-03-31', '11363', 8, 588.00, 140, 4.20, NULL, '2024-05-16 03:58:47', '2024-05-16 03:58:47', 14, NULL),
(135, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', '11363', 15, 531.25, 125, 4.25, NULL, '2024-05-16 03:59:46', '2024-05-16 04:01:14', 14, NULL),
(136, 9, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', '11203', 9, 33.60, 8, 4.20, NULL, '2024-05-16 04:00:55', '2024-05-16 04:00:55', 14, NULL),
(137, 9, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-03-31', '11203', 4, 16.80, 4, 4.20, NULL, '2024-05-16 04:02:08', '2024-05-16 04:02:08', 14, NULL),
(138, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 2, 516.60, 123, 4.20, NULL, '2024-05-16 04:02:42', '2024-05-16 04:02:42', 14, NULL),
(139, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 4, 499.80, 119, 4.20, NULL, '2024-05-16 04:03:06', '2024-05-16 04:03:06', 14, NULL),
(140, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-10', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 33138.00, 7890, 4.20, NULL, '2024-05-16 04:07:33', '2024-05-16 04:07:33', 14, NULL),
(141, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-11', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 30, 33012.00, 7860, 4.20, NULL, '2024-05-16 04:08:05', '2024-05-16 04:08:05', 14, NULL),
(142, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 10, 32970.00, 7850, 4.20, NULL, '2024-05-16 04:08:36', '2024-05-16 04:08:36', 14, NULL),
(143, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2026-03-31', 'PRA157', 80, 32634.00, 7770, 4.20, NULL, '2024-05-16 04:09:21', '2024-05-16 04:09:21', 14, NULL),
(144, 15, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', 'PRA158', 40, 42.00, 10, 4.20, NULL, '2024-05-16 04:10:15', '2024-05-16 04:10:15', 14, NULL),
(145, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', 'PRA157', 140, 32046.00, 7630, 4.20, NULL, '2024-05-16 04:10:44', '2024-05-16 04:10:44', 14, NULL),
(146, 15, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-03-31', 'PRA158', 10, 0.00, 0, 4.20, NULL, '2024-05-16 04:11:54', '2024-05-16 04:11:54', 14, NULL),
(147, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-03-31', 'PRA157', 15, 31983.00, 7615, 4.20, NULL, '2024-05-16 04:12:22', '2024-05-16 04:12:22', 14, NULL),
(148, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 30, 31857.00, 7585, 4.20, NULL, '2024-05-16 04:13:12', '2024-05-16 04:13:12', 14, NULL),
(149, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 30, 31731.00, 7555, 4.20, NULL, '2024-05-16 04:13:41', '2024-05-16 04:13:41', 14, NULL),
(150, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-15', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 7, 470.40, 112, 4.20, NULL, '2024-05-17 22:43:25', '2024-05-17 22:43:25', 14, NULL),
(151, 10, 'Acetaminofen (Paracetamol), Solucion oral, 120mg/5mL, Frasco', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', '11363', 4, 453.60, 108, 4.20, NULL, '2024-05-17 23:42:11', '2024-05-17 23:42:11', 14, NULL),
(152, 58, 'Acetaminofen (Paracetamol), Solucion oral, 100mg/1mL', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-09-30', 'EE414', 1, 348.60, 83, 4.20, NULL, '2024-05-17 23:44:52', '2024-05-17 23:44:52', 14, NULL),
(153, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-15', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 50, 31521.00, 7505, 4.20, NULL, '2024-05-17 23:45:51', '2024-05-17 23:45:51', 14, NULL),
(154, 14, 'Acetaminofen (Paracetamol), Tableta, 500 mg', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'PRA157', 20, 31437.00, 7485, 4.20, NULL, '2024-05-17 23:46:11', '2024-05-17 23:46:11', 14, NULL),
(155, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-10', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 16, 24318.00, 5790, 4.20, NULL, '2024-05-17 23:48:10', '2024-05-17 23:48:10', 14, NULL),
(156, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-11', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 24, 24217.20, 5766, 4.20, NULL, '2024-05-17 23:48:37', '2024-05-17 23:48:37', 14, NULL),
(157, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-12', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 4, 24200.40, 5762, 4.20, NULL, '2024-05-17 23:49:10', '2024-05-17 23:49:10', 14, NULL),
(158, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2026-03-31', 'E23031', 232, 23226.00, 5530, 4.20, NULL, '2024-05-17 23:49:56', '2024-05-17 23:49:56', 14, NULL),
(159, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', 'E23031', 332, 21831.60, 5198, 4.20, NULL, '2024-05-17 23:50:30', '2024-05-17 23:50:30', 14, NULL),
(160, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-03-31', 'E23031', 4, 21814.80, 5194, 4.20, NULL, '2024-05-17 23:51:01', '2024-05-17 23:51:01', 14, NULL),
(161, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 24, 21714.00, 5170, 4.20, NULL, '2024-05-17 23:51:44', '2024-05-17 23:51:44', 14, NULL),
(162, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 24, 21613.20, 5146, 4.20, NULL, '2024-05-17 23:52:06', '2024-05-17 23:52:06', 14, NULL),
(163, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-15', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 32, 21478.80, 5114, 4.20, NULL, '2024-05-17 23:52:30', '2024-05-17 23:52:30', 14, NULL),
(164, 16, 'Acido Folico, Tableta, 5 mg', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-03-31', 'E23031', 24, 21378.00, 5090, 4.20, NULL, '2024-05-17 23:52:56', '2024-05-17 23:52:56', 14, NULL),
(165, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-11', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 2, 1709.40, 407, 4.20, NULL, '2024-05-17 23:56:42', '2024-05-17 23:56:42', 14, NULL),
(166, 22, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2026-03-31', 'DR329', 1, 88.20, 21, 4.20, NULL, '2024-05-17 23:57:54', '2024-05-17 23:57:54', 14, NULL),
(167, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2027-02-28', '0347024', 14, 1650.60, 393, 4.20, NULL, '2024-05-17 23:58:18', '2024-05-17 23:58:18', 14, NULL),
(168, 22, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-03-31', 'DR329', 13, 33.60, 8, 4.20, NULL, '2024-05-18 00:00:01', '2024-05-18 00:00:01', 14, NULL),
(169, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2027-02-28', '0347024', 20, 1566.60, 373, 4.20, NULL, '2024-05-18 00:00:31', '2024-05-18 00:00:31', 14, NULL),
(170, 22, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-03-31', 'DR329', 3, 21.00, 5, 4.20, NULL, '2024-05-18 00:01:44', '2024-05-18 00:01:44', 14, NULL),
(171, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1554.00, 370, 4.20, NULL, '2024-05-18 00:02:59', '2024-05-18 00:02:59', 14, NULL),
(172, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 2, 1545.60, 368, 4.20, NULL, '2024-05-18 00:03:24', '2024-05-18 00:03:24', 14, NULL),
(173, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-15', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 4, 1528.80, 364, 4.20, NULL, '2024-05-18 00:03:52', '2024-05-18 00:03:52', 14, NULL),
(174, 23, 'Ambroxol, Jarabe, 15mg/5mL, Frasco', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-02-28', '0347024', 3, 1516.20, 361, 4.20, NULL, '2024-05-18 00:04:15', '2024-05-18 00:04:15', 14, NULL),
(175, 24, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-02-28', 'E1554', 4, 8.40, 2, 4.20, NULL, '2024-05-18 00:08:34', '2024-05-18 00:08:34', 14, NULL),
(176, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2026-02-28', 'E1575', 8, 172.20, 41, 4.20, NULL, '2024-05-18 00:09:10', '2024-05-18 00:09:10', 14, NULL),
(177, 24, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0054-2024', 'CC Vasquez La Libertad', '2026-02-28', 'E1554', 2, 0.00, 0, 4.20, NULL, '2024-05-18 00:09:55', '2024-05-18 00:09:55', 14, NULL),
(178, 25, 'Amoxicilina + Acido Clavulanico, Suspension oral, 250-62.5mg/5mL, Frasco', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2026-02-28', 'E1575', 1, 168.00, 40, 4.20, NULL, '2024-05-18 00:10:38', '2024-05-18 00:10:38', 14, NULL),
(179, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-10', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 6489.00, 1545, 4.20, NULL, '2024-05-18 00:13:10', '2024-05-18 00:13:10', 14, NULL),
(180, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-12', 'RDDR MX 0052-2024', 'CC Vasquez Centro', '2025-05-31', '2380007', 70, 6195.00, 1475, 4.20, NULL, '2024-05-18 00:18:14', '2024-05-18 00:18:14', 14, NULL),
(181, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 6106.80, 1454, 4.20, NULL, '2024-05-18 00:18:53', '2024-05-18 00:18:53', 14, NULL),
(182, 27, 'Amoxicilina + Acido Clavulanico, Tableta, 500 mg + 125mg', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2025-05-31', '2380007', 21, 6018.60, 1433, 4.20, NULL, '2024-05-18 00:19:26', '2024-05-18 00:19:26', 14, NULL),
(183, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-10', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 1, 201.60, 48, 4.20, NULL, '2024-05-18 00:23:47', '2024-05-18 00:23:47', 14, NULL),
(184, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-11', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 5, 180.60, 43, 4.20, NULL, '2024-05-18 00:24:19', '2024-05-18 00:24:19', 14, NULL),
(185, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0050-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 1, 176.40, 42, 4.20, NULL, '2024-05-18 00:24:59', '2024-05-18 00:24:59', 14, NULL),
(186, 29, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2027-06-30', 'DY257', 2, 16.80, 4, 4.20, NULL, '2024-05-18 00:27:06', '2024-05-18 00:27:06', 14, NULL),
(187, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2027-06-30', 'DY263', 3, 163.80, 39, 4.20, NULL, '2024-05-18 00:27:39', '2024-05-18 00:27:39', 14, NULL),
(188, 31, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Quiacquix', '2027-08-31', 'DX654', 1, 113.40, 27, 4.20, NULL, '2024-05-18 00:29:08', '2024-05-18 00:29:08', 14, NULL),
(189, 28, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-12', 'RDDR MX 0051-2024', 'CC Vasquez Centro', '2027-06-30', 'DY249', 6, 4.20, 1, 4.20, NULL, '2024-05-18 00:30:09', '2024-05-18 00:30:09', 14, NULL),
(190, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-13', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 1, 159.60, 38, 4.20, NULL, '2024-05-18 00:31:13', '2024-05-18 00:31:13', 14, NULL),
(191, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-14', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 1, 155.40, 37, 4.20, NULL, '2024-05-18 00:31:35', '2024-05-18 00:31:35', 14, NULL),
(192, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-15', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 3, 142.80, 34, 4.20, NULL, '2024-05-18 00:32:00', '2024-05-18 00:32:00', 14, NULL),
(193, 30, 'Amoxicilina, Suspension oral, 250mg/5mL, Frasco', '2024-05-16', 'RDDR MX 0055-2024 C 1', 'Entregado a usuario Clínica 1', '2027-06-30', 'DY263', 3, 130.20, 31, 4.20, NULL, '2024-05-18 00:32:22', '2024-05-18 00:32:22', 14, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `permiso` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `localidad`, `permiso`) VALUES
(1, 'Mr. Shayne Gislason DVM', 'admin@admin.com', '2023-11-28 11:46:35', '$2y$12$wVktWNdBF/nak4MouV7vHeA6zR8YCRpzCFdmD8alJKhLk4BUqh696', 'IXgLzLWPqiVSgUphHZRjlk1SFSBUMJpYkK3zEt7BUmSdnZeYPs46PXzjK86c', '2023-11-28 11:46:35', '2024-04-25 09:56:36', 'Antigua', NULL),
(2, 'Branson Hickle', 'rstreich@hotmail.com', '2023-11-28 11:46:36', '$2y$12$SDYQfTTJnafhucy.IsUZ8OLTT1tOcGL9mB0SaNkLtbhQfhFXFixtm', 'xjMVmgU0AR', '2023-11-28 11:46:38', '2024-04-25 09:56:36', 'Totonicapan1', NULL),
(3, 'Jewel Graham', 'yvonne.powlowski@gmail.com', '2023-11-28 11:46:37', '$2y$12$ezCb956dh85A9Uw8sqUSjOyaT90BkGQzzfAcbyxpypzHvF/TiTPY2', 'sMbaKJryds', '2023-11-28 11:46:38', '2024-04-25 09:56:36', 'Peten', NULL),
(4, 'Stefan Windler', 'prath@lockman.info', '2023-11-28 11:46:37', '$2y$12$6mAM/1zSX8EvDCjvJv4AyuDRfQfap007u4HT7cDPsqwqPN3GJQotO', '3SwqWj7OLj', '2023-11-28 11:46:38', '2024-04-25 09:56:36', 'Huehuetenango', NULL),
(5, 'Prof. Anthony Hill MD', 'devante48@yahoo.com', '2023-11-28 11:46:37', '$2y$12$/4HMyn4AzCct9hxhwO0y3eMP8oJ0MUYLXIORn0T96/0DqyWl4ZVcu', 'CGn0uYmezh', '2023-11-28 11:46:38', '2024-04-25 09:56:36', 'Guatemala', NULL),
(6, 'Dr. Letitia Shields III', 'mcclure.antonia@abernathy.net', '2023-11-28 11:46:37', '$2y$12$TP27RHUSM/edmSbFTtJkCOKCck6zTxVQG7yp9doiAa7GMS8QCcZdq', 'fe0Y3o1nkj', '2023-11-28 11:46:38', '2024-04-25 09:56:36', 'Chimaltenango', NULL),
(11, 'David Gaytan', 'edgaytanc@gmail.com', NULL, '$2y$12$C7rZfhaX2ypR3Wq2s0bXOea6DnokD4fY9/u/PZqlY3jLLVVVDPIny', NULL, '2024-02-02 04:33:04', '2024-04-25 09:56:36', 'Jocotenango', NULL),
(13, 'Aracely Gomez', 'aracelygbatres@gmail.com', NULL, '$2y$12$YgqRp07ayCO5HtzcCWyaOe1zYVlNn.Ty0Tq6cEIWa/FB6EV974JsK', NULL, '2024-02-14 05:13:07', '2024-04-25 09:56:36', 'El Progreso', NULL),
(14, 'PUESTO DE SALUD DE CHIPUAC, TOTONICAPAN', 'bodegapschipuactoto@gmail.com', NULL, '$2y$12$7NnLE/EgPpe2GnL7NA.qhu6IBgX/WI6X9Remb2LissVkky60ZYI1W', NULL, '2024-02-19 10:47:56', '2024-05-19 02:02:48', 'PUESTO DE SALUD DE CHIPUAC, TOTONICAPAN', NULL),
(15, 'PUESTO DE SALUD DE CHINIMABE MOMOSTENANGO', 'msanict@miumg.edu.gt', NULL, '$2y$12$b/csmKIe.4ClX/Hnm8R0e.eVviJyZmOBcf5qjGUZqy4MhqY2TjKY2', NULL, '2024-02-19 11:46:14', '2024-04-25 09:56:36', 'PUESTO DE SALUD DE CHINIMABE MOMOSTENANGO', NULL),
(16, 'ANTONIO DE LEON', 'sanictzun@gmail.com', NULL, '$2y$12$twaOWe3G6.VtFV95S.zlA.VAAGRg0oPrykb15TKeBCmul8hFnUWsm', NULL, '2024-04-25 01:09:01', '2024-04-25 09:56:36', 'DDRISST', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consolidado_kardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consolidado_kardex` (
`No.` bigint(21)
,`Categoria` enum('Medicamento','Equipo quirurgico','Suministros','DONACIONES y traslados','BIOLOGICOS','Repuestos')
,`Medicamento` varchar(255)
,`FechaVencimiento` date
,`Lote` varchar(255)
,`FechaKardex` date
,`Saldo` decimal(36,0)
,`Precio_Total` decimal(46,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_datos_kardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_datos_kardex` (
`No` bigint(21)
,`producto_id` bigint(20) unsigned
,`user_id` bigint(20) unsigned
,`Fecha` date
,`Numero_de_referencia` varchar(255)
,`Remitente_Destinatario` varchar(200)
,`Cantidad_Entrada` decimal(12,0)
,`Precio_Unitario` decimal(12,2)
,`Valor_Total` decimal(24,2)
,`Fecha_vencimiento` date
,`Numero_Lote` varchar(255)
,`Cantidad_Salida` int(12)
,`Reajuste` int(11)
,`Observaciones` mediumtext
,`created_at` timestamp
,`Cantidad_Total` decimal(36,0)
,`Precio` decimal(46,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consolidado_kardex`
--
DROP TABLE IF EXISTS `vista_consolidado_kardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consolidado_kardex`  AS SELECT row_number() over ( order by `s`.`fecha_vencimiento`,`s`.`lote_salida`) AS `No.`, `p`.`categoria` AS `Categoria`, `s`.`nombre_producto` AS `Medicamento`, `s`.`fecha_vencimiento` AS `FechaVencimiento`, `s`.`lote_salida` AS `Lote`, max(`s`.`fecha`) AS `FechaKardex`, `d`.`Cantidad_Total` AS `Saldo`, `d`.`Precio` AS `Precio_Total` FROM ((`salidas` `s` join `productos` `p` on(`s`.`nombre_producto` = `p`.`nombre`)) join (select `vista_datos_kardex`.`producto_id` AS `producto_id`,`vista_datos_kardex`.`Cantidad_Total` AS `Cantidad_Total`,`vista_datos_kardex`.`Precio` AS `Precio`,row_number() over ( partition by `vista_datos_kardex`.`producto_id` order by `vista_datos_kardex`.`Fecha` desc,`vista_datos_kardex`.`created_at` desc) AS `r` from `vista_datos_kardex`) `d` on(`d`.`producto_id` = (select `entradas`.`producto_id` from `entradas` where `entradas`.`id` = `s`.`entrada_id` limit 1) and `d`.`r` = 1)) GROUP BY `s`.`nombre_producto`, `s`.`fecha_vencimiento`, `s`.`lote_salida` ORDER BY `s`.`fecha_vencimiento` ASC, `s`.`lote_salida` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_datos_kardex`
--
DROP TABLE IF EXISTS `vista_datos_kardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_datos_kardex`  AS SELECT row_number() over ( partition by `datos`.`producto_id` order by `datos`.`Fecha`,`datos`.`created_at`) AS `No`, `datos`.`producto_id` AS `producto_id`, `datos`.`user_id` AS `user_id`, `datos`.`Fecha` AS `Fecha`, `datos`.`Numero_de_referencia` AS `Numero_de_referencia`, `datos`.`Remitente_Destinatario` AS `Remitente_Destinatario`, `datos`.`Cantidad_Entrada` AS `Cantidad_Entrada`, `datos`.`Precio_Unitario` AS `Precio_Unitario`, `datos`.`Valor_Total` AS `Valor_Total`, `datos`.`Fecha_vencimiento` AS `Fecha_vencimiento`, `datos`.`Numero_Lote` AS `Numero_Lote`, `datos`.`Cantidad_Salida` AS `Cantidad_Salida`, `datos`.`Reajuste` AS `Reajuste`, `datos`.`Observaciones` AS `Observaciones`, `datos`.`created_at` AS `created_at`, sum(coalesce(`datos`.`Cantidad_Entrada`,0) - coalesce(`datos`.`Cantidad_Salida`,0) + coalesce(`datos`.`Reajuste`,0)) over ( partition by `datos`.`producto_id` order by `datos`.`Fecha`,`datos`.`created_at`) AS `Cantidad_Total`, sum(case when coalesce(`datos`.`Cantidad_Entrada`,0) > 0 then coalesce(`datos`.`Valor_Total`,0) when coalesce(`datos`.`Reajuste`,0) <> 0 then coalesce(`datos`.`Reajuste`,0) * coalesce(`datos`.`Precio_Unitario`,0) when coalesce(`datos`.`Cantidad_Salida`,0) > 0 then -coalesce(`datos`.`Cantidad_Salida`,0) * coalesce(`datos`.`Precio_Unitario`,0) else 0 end) over ( partition by `datos`.`producto_id` order by `datos`.`Fecha`,`datos`.`created_at`) AS `Precio` FROM (select `e`.`producto_id` AS `producto_id`,`e`.`id_user` AS `user_id`,`e`.`fecha` AS `Fecha`,`e`.`created_at` AS `created_at`,`e`.`numero_referencia` AS `Numero_de_referencia`,`e`.`remitente` AS `Remitente_Destinatario`,`e`.`cantidad` AS `Cantidad_Entrada`,`e`.`precio_unitario` AS `Precio_Unitario`,`e`.`cantidad` * `e`.`precio_unitario` AS `Valor_Total`,`e`.`fecha_vencimiento` AS `Fecha_vencimiento`,`e`.`numero_lote` AS `Numero_Lote`,NULL AS `Cantidad_Salida`,`e`.`reajuste_positivo` AS `Reajuste`,`e`.`observaciones` AS `Observaciones` from `entradas` `e` union all select (select `entradas`.`producto_id` from `entradas` where `entradas`.`id` = `s`.`entrada_id`) AS `producto_id`,`s`.`id_user` AS `user_id`,`s`.`fecha` AS `Fecha`,`s`.`created_at` AS `created_at`,`s`.`numero_referencia` AS `Numero_de_referencia`,`s`.`destinatario` AS `Remitente_Destinatario`,NULL AS `Cantidad_Entrada`,`s`.`precio_unitario` AS `Precio_Unitario`,NULL AS `Valor_Total`,`s`.`fecha_vencimiento` AS `Fecha_vencimiento`,`s`.`lote_salida` AS `Numero_Lote`,`s`.`cantidad_salida` AS `Cantidad_Salida`,`s`.`reajuste_negativo` AS `Reajuste`,`s`.`observaciones` AS `Observaciones` from `salidas` `s`) AS `datos` ORDER BY `datos`.`Fecha` ASC, `datos`.`created_at` ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinatarios_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entradas_producto_id_foreign` (`producto_id`),
  ADD KEY `entradas_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remitentes`
--
ALTER TABLE `remitentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remitentes_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salidas_entrada_id_foreign` (`entrada_id`),
  ADD KEY `salidas_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT de la tabla `remitentes`
--
ALTER TABLE `remitentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD CONSTRAINT `destinatarios_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `entradas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `remitentes`
--
ALTER TABLE `remitentes`
  ADD CONSTRAINT `remitentes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_entrada_id_foreign` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salidas_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
