-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2024 a las 06:35:06
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

--
-- Volcado de datos para la tabla `destinatarios`
--

INSERT INTO `destinatarios` (`id`, `nombre`, `created_at`, `updated_at`, `id_user`) VALUES
(1, 'Centro de Salud Santa Ana', '2023-11-28 11:57:08', '2024-02-02 12:04:01', 2),
(3, 'C/C PABAQUIT', '2024-02-04 05:14:06', '2024-02-05 11:26:59', 1),
(4, 'C/C SANTA ANA', '2024-02-04 05:14:20', '2024-02-05 11:26:59', 1),
(5, 'C/C CHUABAJ-XEABAJ', '2024-02-04 05:14:41', '2024-02-04 05:14:41', NULL),
(6, 'CIERRE DE MES', '2024-02-04 06:03:40', '2024-02-04 06:03:40', NULL),
(8, 'Aso', '2024-02-22 05:52:11', '2024-02-22 05:52:11', NULL);

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
(8, 1, '2023-01-01', 'ACTA NO. 02-2023', 195, 195.00, 553.80, 2.84, '2025-09-01', 'INVENTARIO', '13085', NULL, '2024-02-04 05:11:58', '2024-02-23 12:48:33', 1, NULL),
(9, 1, '2023-02-21', '17415', 864, 864.00, 3672.00, 4.25, '2025-09-01', 'CENTRAL', '10193', NULL, '2024-02-04 09:39:26', '2024-02-23 12:48:33', 1, NULL),
(10, 3, '2023-01-01', 'ACTA NO. 02-2023', 10, 8.00, NULL, 7.93, '2024-12-01', 'BODEGA', '22181', NULL, '2024-02-05 05:49:23', '2024-02-23 12:48:33', 1, NULL),
(11, 4, '2023-01-10', 'ACTA NO. 02-2023', 8, 8.00, NULL, 32.00, '2025-03-01', 'INVENTARIO', '23810', NULL, '2024-02-05 06:12:01', '2024-02-23 12:48:33', 1, NULL),
(12, 5, '2023-01-01', 'ACTA NO. 02-2023', 125, 125.00, 1250.00, 10.00, '2025-04-01', 'REGIONAL', 'CI-4047 04.22', NULL, '2024-02-05 06:28:07', '2024-02-23 12:48:33', 1, NULL),
(16, 2, '2024-03-01', 'w33', 10000000, 10000000.00, 100000.00, 1.00, '2024-04-04', 'CONTENEDOR', 'kk', NULL, '2024-02-19 22:16:12', '2024-02-23 12:48:33', 1, NULL),
(18, 2, '2024-02-13', '55455', NULL, 250.00, 0.00, 2.00, '2024-02-13', 'CONTENEDOR', '44', 400, '2024-02-20 01:09:44', '2024-02-23 12:48:33', 1, NULL),
(28, 17, '2024-02-09', '5555', NULL, 1425.00, 0.00, 54.00, '2024-02-29', '-', NULL, 600, '2024-02-20 08:28:15', '2024-02-26 11:19:24', 1, NULL),
(29, 17, '2024-02-08', 'kskrsd', 100, 75.00, 200.00, 2.00, NULL, '-', 'N/A', NULL, '2024-02-20 08:29:29', '2024-02-29 03:51:19', 1, NULL),
(45, 1, '2024-02-01', '666', 50, 50.00, 75.00, 1.50, '2027-01-21', 'BODEGA', '667', NULL, '2024-02-22 05:56:06', '2024-02-23 12:48:33', 1, NULL),
(78, 1, '2024-02-22', '3254', 15, 15.00, 22.50, 1.50, '2025-01-01', 'BODEGA', '345', NULL, '2024-02-23 11:47:10', '2024-02-23 12:48:33', 1, 'todo sale bien'),
(80, 1, '2024-02-22', '3255', 15, 0.00, 22.50, 1.50, '2025-01-01', 'BODEGA', '345', NULL, '2024-02-23 12:48:33', '2024-02-23 12:48:33', 1, 'alfin'),
(81, 1, '2024-02-25', 'k1', 100, 120.00, 120.00, 1.20, '2025-01-01', 'Bodega', '12345', NULL, '2024-02-26 10:41:41', '2024-02-26 11:02:33', 1, 'para prueba'),
(82, 1, '2024-02-25', 'k2', 150, 100.00, 225.00, 1.50, '2025-01-01', 'Bodega', '12345', 100, '2024-02-26 10:42:35', '2024-02-26 11:03:16', 1, NULL),
(83, 2, '2024-02-25', 'm1', 1000, 1300.00, 500.00, 0.50, NULL, 'Bodega', NULL, NULL, '2024-02-26 11:09:36', '2024-02-26 11:28:34', 1, 'para revisar error en numero de lote vacio'),
(84, 21, '2024-02-25', 'n1', 1250, 1000.00, 2500.00, 2.00, '2026-01-25', 'Bodega 10', NULL, NULL, '2024-02-26 11:33:45', '2024-02-26 11:37:52', 1, NULL),
(85, 21, '2024-02-25', 'n3', 1200, 1200.00, 2400.00, 2.00, '2026-01-25', 'Bodega', NULL, NULL, '2024-02-26 11:37:00', '2024-02-26 11:37:00', 1, NULL),
(86, 17, '2024-02-25', 'v1', 1000100, 1000100.00, 500000.00, 0.50, NULL, 'Bodega Central', '123456', NULL, '2024-02-26 11:43:24', '2024-02-29 04:13:35', 1, NULL),
(87, 18, '2024-02-28', 'x01', 300, 285.00, 10.00, 0.05, '2027-01-01', 'Bodega 5', 'abc123', NULL, '2024-02-29 04:36:26', '2024-02-29 04:54:54', 1, NULL);

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
(26, '2024_02_19_050522_modify_permiso_column_in_users_table', 9),
(27, '2024_03_05_065445_add_vacuna_to_categoria_enum_in_productos_table', 10);

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
(2, 'App\\Models\\User', 1);

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
  `categoria` enum('Medicamento','Equipo quirurgico','Suministros','Vacuna') NOT NULL,
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
(1, 'Medicamento', 'Acetaminofen', 'Jarabe', '500 ml', 'Frasco', 'Unidad', '2023-11-28 11:57:49', '2023-11-28 11:57:49'),
(2, 'Equipo quirurgico', 'algodon', 'rollo', NULL, 'rollo', 'unidad', '2023-12-05 11:17:39', '2023-12-05 11:17:39'),
(3, 'Medicamento', 'Agua esteril(agua tridestilada), 100 mL, Vial/Ampolla', 'Ampolla', '100 mL', NULL, NULL, '2024-02-05 05:46:55', '2024-02-05 05:46:55'),
(4, 'Medicamento', 'Alcohol Etilico 70%, Gel topico', 'Gel', '80%', 'Galon', NULL, '2024-02-05 06:10:47', '2024-02-12 11:43:04'),
(5, 'Medicamento', 'Alcohol Isopropilico, Solucion topica, 70%, Frasco', 'Solucion topica', '70%', 'Frasco', NULL, '2024-02-05 06:26:29', '2024-02-05 06:26:29'),
(6, 'Medicamento', 'hidroxido', '120 ml', NULL, NULL, NULL, '2024-02-19 10:50:17', '2024-02-19 11:13:58'),
(10, 'Medicamento', 'Acido Folico', 'Tableta', '5 mg', NULL, NULL, '2024-02-19 11:36:05', '2024-02-19 11:36:05'),
(16, 'Medicamento', 'Albendazol', 'Suspension oral', '200mg', 'Frasco', 'ml', '2024-02-19 11:42:02', '2024-02-19 11:42:02'),
(17, 'Equipo quirurgico', 'vendas elasticas', 'tableta', 'sadsad', NULL, 'unidad', '2024-02-19 12:33:47', '2024-02-19 12:33:47'),
(18, 'Medicamento', 'calamina', 'suspencion', NULL, NULL, NULL, '2024-02-19 12:53:14', '2024-02-19 12:53:14'),
(19, 'Medicamento', 'metronidazol', NULL, NULL, NULL, NULL, '2024-02-20 00:08:16', '2024-02-20 00:08:16'),
(20, 'Medicamento', 'nistatina', NULL, NULL, NULL, NULL, '2024-02-20 03:03:59', '2024-02-20 03:03:59'),
(21, 'Medicamento', 'prueba 1', NULL, NULL, NULL, NULL, '2024-02-21 20:59:12', '2024-02-21 20:59:12'),
(22, 'Vacuna', 'covid', NULL, NULL, NULL, NULL, '2024-03-05 12:28:20', '2024-03-05 13:17:50'),
(23, 'Vacuna', 'sarampeon', NULL, NULL, NULL, NULL, '2024-03-05 13:01:40', '2024-03-05 13:09:41');

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

--
-- Volcado de datos para la tabla `remitentes`
--

INSERT INTO `remitentes` (`id`, `nombre`, `created_at`, `updated_at`, `id_user`) VALUES
(2, 'DAST', '2024-02-04 05:06:43', '2024-02-22 05:59:41', 1),
(4, 'DAST', '2024-02-04 05:15:48', '2024-02-05 11:30:34', 1),
(6, 'INVENTARIO 2024', '2024-02-22 05:56:51', '2024-02-22 05:56:51', NULL),
(7, 'INVENTARIO INICIAL 2023', '2024-02-22 05:59:41', '2024-02-22 05:59:41', 1),
(8, 'INVENTARIO 2024', '2024-02-22 05:59:41', '2024-02-22 05:59:41', NULL);

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
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
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
(2, 8, 'Acetaminofen', '2023-01-11', 'STOCK NO. 92', 'CLINICA 2', '2025-09-01', '13085', 15, 383.52, 136, 2.82, NULL, '2024-02-04 05:20:34', '2024-02-04 05:21:49', 1, NULL),
(3, 8, 'Acetaminofen', '2023-01-11', 'STOCK NO. 94', 'CLINICA 3', '2025-09-01', '13085', 20, 327.12, 116, 2.82, NULL, '2024-02-04 05:22:55', '2024-02-04 05:22:55', 1, NULL),
(5, 8, 'Acetaminofen', '2023-01-24', 'STOCK NO. 97', 'HOSPITAL', '2025-09-01', '13085', 16, 142.82, 51, 2.82, NULL, '2024-02-04 05:27:29', '2024-02-04 05:27:29', 1, NULL),
(6, 8, 'Acetaminofen', '2023-01-24', 'STOCK NO. 99', 'CENTRAL', '2025-09-01', '13085', 26, 70.50, 25, 2.82, NULL, '2024-02-04 05:28:27', '2024-02-23 12:48:33', 1, NULL),
(7, 8, 'Acetaminofen', '2023-01-24', 'STOCK NO. 100', 'BODEGA 2', '2025-09-01', '13085', 5, 56.40, 20, 2.82, NULL, '2024-02-04 05:30:33', '2024-02-23 12:48:33', 1, NULL),
(8, 8, 'Acetaminofen', '2023-01-25', '-', 'BODEGA 2', '2025-09-01', '13085', NULL, 56.40, 20, 2.82, NULL, '2024-02-04 06:04:57', '2024-02-23 12:48:33', 1, NULL),
(11, 9, 'Acetaminofen', '2023-02-24', 'STOCK NO. 115', 'CENTRAL', '2025-09-01', '10193', 3, 3642.25, 857, 4.25, NULL, '2024-02-04 10:55:59', '2024-02-04 10:57:50', 1, NULL),
(12, 9, 'Acetaminofen', '2023-02-25', '-', 'CLINICA 1', '2025-09-01', '10193', NULL, 3642.25, 857, 4.25, NULL, '2024-02-04 11:05:15', '2024-02-19 21:49:08', 1, NULL),
(14, 9, 'Acetaminofen', '2023-03-13', 'STOCK NO. 120', 'CLINICA 1', '2025-09-01', '10193', 36, 3208.75, 755, 4.25, NULL, '2024-02-04 12:18:16', '2024-02-04 12:18:16', 1, NULL),
(15, 9, 'Acetaminofen', '2023-03-13', 'STOCK NO. 122', 'CENTRAL', '2025-09-01', '10193', 39, 3043.00, 716, 4.25, NULL, '2024-02-04 12:58:29', '2024-02-23 12:48:33', 1, NULL),
(16, 9, 'Acetaminofen', '2023-03-13', 'STOCK NO. 124', 'BODEGA 2', '2025-09-01', '10193', 8, 3009.00, 708, 4.25, NULL, '2024-02-04 13:46:23', '2024-02-23 12:48:33', 1, NULL),
(17, 9, 'Acetaminofen', '2023-03-23', 'STOCK NO. 125', 'BODEGA 1', '2025-09-01', '10193', 2, 3000.50, 706, 4.25, NULL, '2024-02-04 13:50:54', '2024-02-23 12:48:33', 1, NULL),
(18, 9, 'Acetaminofen', '2023-03-24', 'STOCK NO.126', 'CENTRAL', '2025-09-01', '10193', 20, 2915.50, 686, 4.25, NULL, '2024-02-04 13:54:35', '2024-02-23 12:48:33', 1, NULL),
(21, 10, 'Agua esteril(agua tridestilada), 100 mL, Vial/Ampolla', '2023-01-25', '--', 'CENTRAL', '2024-12-01', '22181', NULL, 38.25, 9, 4.25, NULL, '2024-02-08 11:37:08', '2024-02-23 12:48:33', 1, NULL),
(27, 11, 'Alcohol Etilico 70%, Gel topico', '2024-02-14', '555', 'CENTRAL', '2025-03-01', '23810', 2, 192.00, 6, 32.00, NULL, '2024-02-19 23:53:42', '2024-02-23 12:48:33', 1, NULL),
(35, 11, 'Alcohol Etilico 70%, Gel topico', '2024-01-31', '5555', 'CENTRAL', '2025-03-01', '23810', NULL, 300.00, 6, 50.00, 1, '2024-02-20 00:21:19', '2024-02-23 12:48:33', 1, NULL),
(36, 11, 'Alcohol Etilico 70%, Gel topico', '2024-02-07', '5555', 'CLINICA 1', '2025-03-01', '23810', NULL, 350.00, 7, 50.00, -1, '2024-02-20 00:22:23', '2024-02-23 12:48:33', 1, NULL),
(55, 18, 'algodon', '2024-02-02', '55', 'CLINICA 1', '2024-02-13', '44', 80, 300.00, 300, 1.00, NULL, '2024-02-20 03:49:29', '2024-02-23 12:48:33', 14, NULL),
(56, 18, 'algodon', '2024-02-14', '6555', 'CENTRAL', '2024-02-13', '44', 50, 250.00, 250, 1.00, NULL, '2024-02-20 03:49:59', '2024-02-23 12:48:33', 14, NULL),
(57, 29, 'vendas elasticas', '2024-02-10', '54444', '-', NULL, 'N/A', 10, 200.00, 100, 2.00, NULL, '2024-02-20 08:30:43', '2024-02-23 12:48:33', 1, NULL),
(59, 9, 'Acetaminofen', '2024-02-09', '555', 'CLINICA 2', '2025-09-01', '10193', 46, 3672.00, 864, 4.25, NULL, '2024-02-21 08:54:29', '2024-02-23 12:48:33', 1, NULL),
(67, 9, 'Acetaminofen', '2024-03-21', '845', 'CLINICA 3', '2025-09-01', '10193', 50, 3672.00, 864, 4.25, NULL, '2024-02-21 22:18:25', '2024-02-23 12:48:33', 1, NULL),
(71, 9, 'Acetaminofen', '2024-02-22', '3214', 'CLINICA 3', '2025-09-01', '10193', 15, 375.00, 375, 1.00, NULL, '2024-02-23 11:49:54', '2024-02-23 12:48:33', 1, 'TODO SALE DE BODEGA'),
(72, 82, 'Acetaminofen', '2024-02-25', 'k3', 'Clinica 20', '2025-01-01', '12345', 50, 100.00, 100, 1.00, NULL, '2024-02-26 10:43:54', '2024-02-26 10:43:54', 1, 'para pruebas'),
(73, 81, 'Acetaminofen', '2024-02-25', 'k4', 'Clinica 4', '2025-01-01', '12345', 50, 50.00, 50, 1.00, NULL, '2024-02-26 10:51:22', '2024-02-26 10:51:22', 1, 'siguen las pruebas'),
(74, 82, 'Acetaminofen', '2024-02-25', 'k6', 'clinica maya', '2025-01-01', '12345', 5, 45.00, 45, 1.00, NULL, '2024-02-26 10:52:21', '2024-02-26 10:52:21', 1, NULL),
(75, 82, 'Acetaminofen', '2024-02-25', 'k7', 'Bodega', '2025-01-01', '12345', 10, 140.00, 140, 1.00, NULL, '2024-02-26 10:54:32', '2024-02-26 10:54:32', 1, NULL),
(76, 81, 'Acetaminofen', '2024-02-25', 'k9', 'Casa', '2025-01-01', '12345', 20, 120.00, 120, 1.00, NULL, '2024-02-26 11:02:34', '2024-02-26 11:02:34', 1, 'Seguimos pruebas'),
(77, 82, 'Acetaminofen', '2024-02-25', 'k9', 'pruebas', '2025-01-01', '12345', 40, 100.00, 100, 1.00, NULL, '2024-02-26 11:03:16', '2024-02-26 11:03:16', 1, NULL),
(78, 83, 'algodon', '2024-02-25', 'm2', 'Clinica Antigua', NULL, NULL, 100, 900.00, 900, 1.00, NULL, '2024-02-26 11:11:29', '2024-02-26 11:11:29', 1, 'para pruba de erroe numero lote vacio'),
(79, 83, 'algodon', '2024-02-25', 'm3', 'clinica Antigua', NULL, NULL, 50, 850.00, 850, 1.00, NULL, '2024-02-26 11:12:42', '2024-02-26 11:12:42', 1, 'Prueba error lote vacio'),
(80, 83, 'algodon', '2024-02-25', 'm5', 'clinica Antigua', NULL, NULL, 25, 712.50, 1425, 0.50, NULL, '2024-02-26 11:13:40', '2024-02-26 11:19:26', 1, NULL),
(81, 83, 'algodon', '2024-02-25', 'm6', 'bodega', NULL, NULL, 100, 1325.00, 1325, 1.00, NULL, '2024-02-26 11:27:21', '2024-02-26 11:27:21', 1, 'lote vacio'),
(82, 83, 'algodon', '2024-02-25', 'm7', 'bodega', NULL, NULL, NULL, 1300.00, 1300, 1.00, -50, '2024-02-26 11:28:35', '2024-02-26 11:29:57', 1, NULL),
(83, 84, 'prueba 1', '2024-02-25', 'n2', 'Antigua', '2026-01-25', NULL, 50, 1200.00, 1200, 1.00, NULL, '2024-02-26 11:35:11', '2024-02-26 11:35:11', 1, NULL),
(84, 84, 'prueba 1', '2024-02-25', 'n4', 'Jocotenango', '2026-01-25', NULL, 200, 1000.00, 1000, 1.00, NULL, '2024-02-26 11:37:54', '2024-02-26 11:37:54', 1, 'pureba lote vacio'),
(85, 86, 'vendas elasticas', '2024-02-25', 'l1', 'pueblo nuevo', NULL, '123456', 200, 499900.00, 999800, 0.50, NULL, '2024-02-26 11:44:56', '2024-02-29 03:50:04', 1, NULL),
(86, 86, 'vendas elasticas', '2024-02-25', 'l3', 'publo nuevo', NULL, '123456', NULL, 999905.00, 999905, 1.00, 5, '2024-02-26 11:54:45', '2024-02-26 11:54:45', 1, NULL),
(87, 86, 'vendas elasticas', '2024-02-25', 'l4', 'pueblo', NULL, '123456', NULL, 999900.00, 999900, 1.00, -5, '2024-02-26 11:55:44', '2024-02-26 11:55:44', 1, NULL),
(88, 29, 'vendas elasticas', '2024-02-28', '99999', 'Casa', NULL, 'N/A', 25, 75.00, 75, 1.00, NULL, '2024-02-29 03:51:20', '2024-02-29 03:51:20', 1, NULL),
(89, 87, 'calamina', '2024-02-28', 'x02', 'clinica 5', '2027-01-01', 'abc123', 5, 195.00, 195, 1.00, NULL, '2024-02-29 04:37:27', '2024-02-29 04:37:27', 1, 'para pruebas update'),
(90, 87, 'calamina', '2024-02-28', 'x03', 'hogar', '2027-01-01', 'abc123', 10, 285.00, 285, 1.00, NULL, '2024-02-29 04:54:56', '2024-02-29 04:54:56', 1, 'para pruebas de update');

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
(1, 'Mr. Shayne Gislason DVM', 'admin@admin.com', '2023-11-28 11:46:35', '$2y$12$wVktWNdBF/nak4MouV7vHeA6zR8YCRpzCFdmD8alJKhLk4BUqh696', '3sIaeQvNgfY89isU4U2eVCmJWbMLvWowwhpVafS6TRCHSejiI273sdbbsNZV', '2023-11-28 11:46:35', '2023-11-28 11:46:35', 'Antigua', 0),
(2, 'Branson Hickle', 'rstreich@hotmail.com', '2023-11-28 11:46:36', '$2y$12$SDYQfTTJnafhucy.IsUZ8OLTT1tOcGL9mB0SaNkLtbhQfhFXFixtm', 'xjMVmgU0AR', '2023-11-28 11:46:38', '2024-02-14 05:12:03', 'Totonicapan1', 0),
(3, 'Jewel Graham', 'yvonne.powlowski@gmail.com', '2023-11-28 11:46:37', '$2y$12$ezCb956dh85A9Uw8sqUSjOyaT90BkGQzzfAcbyxpypzHvF/TiTPY2', 'sMbaKJryds', '2023-11-28 11:46:38', '2023-11-28 11:46:38', 'Peten', 0),
(4, 'Stefan Windler', 'prath@lockman.info', '2023-11-28 11:46:37', '$2y$12$6mAM/1zSX8EvDCjvJv4AyuDRfQfap007u4HT7cDPsqwqPN3GJQotO', '3SwqWj7OLj', '2023-11-28 11:46:38', '2024-02-14 10:41:28', 'Huehuetenango', 0),
(5, 'Prof. Anthony Hill MD', 'devante48@yahoo.com', '2023-11-28 11:46:37', '$2y$12$/4HMyn4AzCct9hxhwO0y3eMP8oJ0MUYLXIORn0T96/0DqyWl4ZVcu', 'CGn0uYmezh', '2023-11-28 11:46:38', '2023-11-28 11:46:38', 'Guatemala', 0),
(6, 'Dr. Letitia Shields III', 'mcclure.antonia@abernathy.net', '2023-11-28 11:46:37', '$2y$12$TP27RHUSM/edmSbFTtJkCOKCck6zTxVQG7yp9doiAa7GMS8QCcZdq', 'fe0Y3o1nkj', '2023-11-28 11:46:38', '2023-11-28 11:46:38', 'Chimaltenango', 0),
(11, 'David Gaytan', 'edgaytanc@gmail.com', NULL, '$2y$12$C7rZfhaX2ypR3Wq2s0bXOea6DnokD4fY9/u/PZqlY3jLLVVVDPIny', NULL, '2024-02-02 04:33:04', '2024-02-23 12:11:07', 'Jocotenango', 0),
(13, 'Aracely Gomez', 'aracelygbatres@gmail.com', NULL, '$2y$12$YgqRp07ayCO5HtzcCWyaOe1zYVlNn.Ty0Tq6cEIWa/FB6EV974JsK', NULL, '2024-02-14 05:13:07', '2024-02-14 10:34:15', 'El Progreso', 0),
(14, 'Alejandro Morales', 'amorales@gmail.com', NULL, '$2y$12$X5Kum.Oh0yrbIVXJLilgNOCrhTkpj5Jc.JvPW9xiLKJv.2nZozlMK', NULL, '2024-02-19 10:47:56', '2024-02-20 03:43:55', 'San Juan del Obispo', 0),
(15, 'Ruby Morales', 'rmorales@gmail.com', NULL, '$2y$12$EeBXZSd3loerdlftznlAXuPMhdZZH2PwEuc6rT0VTOGv43PgPT.aa', NULL, '2024-02-19 11:46:14', '2024-02-19 11:46:14', 'Ciudad Vieja', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_consolidado_kardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_consolidado_kardex` (
`No.` bigint(21)
,`Categoria` enum('Medicamento','Equipo quirurgico','Suministros','Vacuna')
,`Medicamento` varchar(255)
,`FechaVencimiento` date
,`Lote` varchar(255)
,`FechaKardex` date
,`Saldo` int(12)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_consolidado_kardex`
--
DROP TABLE IF EXISTS `vista_consolidado_kardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_consolidado_kardex`  AS SELECT row_number() over ( order by `s`.`fecha_vencimiento`,`s`.`lote_salida`) AS `No.`, `p`.`categoria` AS `Categoria`, `s`.`nombre_producto` AS `Medicamento`, `s`.`fecha_vencimiento` AS `FechaVencimiento`, `s`.`lote_salida` AS `Lote`, `s`.`fecha` AS `FechaKardex`, `s`.`cantidad_actual` AS `Saldo` FROM (`salidas` `s` join `productos` `p` on(`s`.`nombre_producto` = `p`.`nombre`)) WHERE dayofmonth(`s`.`fecha`) = 25 ORDER BY `s`.`fecha_vencimiento` ASC, `s`.`lote_salida` ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `remitentes`
--
ALTER TABLE `remitentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
