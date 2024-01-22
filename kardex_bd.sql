-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2023 a las 07:03:45
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kardex_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatarios`
--

CREATE TABLE `destinatarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `destinatarios`
--

INSERT INTO `destinatarios` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Centro de Salud Santa Ana', '2023-11-28 11:57:08', '2023-11-28 11:57:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `numero_referencia` varchar(255) NOT NULL,
  `cantidad` decimal(8,2) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `remitente_id` bigint(20) UNSIGNED NOT NULL,
  `numero_lote` varchar(255) DEFAULT NULL,
  `reajuste_positivo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `producto_id`, `fecha`, `numero_referencia`, `cantidad`, `precio_unitario`, `fecha_vencimiento`, `remitente_id`, `numero_lote`, `reajuste_positivo`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-11-27', '1010', 100.00, 2.00, '2023-12-31', 1, '1010', NULL, '2023-11-28 11:58:28', '2023-11-28 11:58:28');

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
(13, '2023_11_28_054544_create_permission_tables', 1);

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
  `categoria` enum('Medicamento','Equipo quirurgico','Suministros') NOT NULL,
  `nombre` varchar(255) NOT NULL,
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
(1, 'Medicamento', 'Acetaminofen', 'Jarabe', '500 ml', 'Frasco', 'Unidad', '2023-11-28 11:57:49', '2023-11-28 11:57:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitentes`
--

CREATE TABLE `remitentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `remitentes`
--

INSERT INTO `remitentes` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'DRISS', '2023-11-28 11:56:43', '2023-11-28 11:56:43');

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
  `entrada_id` bigint(20) UNSIGNED NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `numero_referencia` varchar(255) NOT NULL,
  `destinatario_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `lote_salida` varchar(255) DEFAULT NULL,
  `cantidad_salida` int(11) NOT NULL,
  `reajuste_negativo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Shayne Gislason DVM', 'admin@admin.com', '2023-11-28 11:46:35', '$2y$12$wVktWNdBF/nak4MouV7vHeA6zR8YCRpzCFdmD8alJKhLk4BUqh696', 'Bv0tLAoaDS', '2023-11-28 11:46:35', '2023-11-28 11:46:35'),
(2, 'Branson Hickle', 'rstreich@hotmail.com', '2023-11-28 11:46:36', '$2y$12$SDYQfTTJnafhucy.IsUZ8OLTT1tOcGL9mB0SaNkLtbhQfhFXFixtm', 'xjMVmgU0AR', '2023-11-28 11:46:38', '2023-11-28 11:46:38'),
(3, 'Jewel Graham', 'yvonne.powlowski@gmail.com', '2023-11-28 11:46:37', '$2y$12$ezCb956dh85A9Uw8sqUSjOyaT90BkGQzzfAcbyxpypzHvF/TiTPY2', 'sMbaKJryds', '2023-11-28 11:46:38', '2023-11-28 11:46:38'),
(4, 'Stefan Windler', 'prath@lockman.info', '2023-11-28 11:46:37', '$2y$12$6mAM/1zSX8EvDCjvJv4AyuDRfQfap007u4HT7cDPsqwqPN3GJQotO', '3SwqWj7OLj', '2023-11-28 11:46:38', '2023-11-28 11:46:38'),
(5, 'Prof. Anthony Hill MD', 'devante48@yahoo.com', '2023-11-28 11:46:37', '$2y$12$/4HMyn4AzCct9hxhwO0y3eMP8oJ0MUYLXIORn0T96/0DqyWl4ZVcu', 'CGn0uYmezh', '2023-11-28 11:46:38', '2023-11-28 11:46:38'),
(6, 'Dr. Letitia Shields III', 'mcclure.antonia@abernathy.net', '2023-11-28 11:46:37', '$2y$12$TP27RHUSM/edmSbFTtJkCOKCck6zTxVQG7yp9doiAa7GMS8QCcZdq', 'fe0Y3o1nkj', '2023-11-28 11:46:38', '2023-11-28 11:46:38');

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
  ADD KEY `entradas_remitente_id_foreign` (`remitente_id`);

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
  ADD KEY `salidas_destinatario_id_foreign` (`destinatario_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `remitentes`
--
ALTER TABLE `remitentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entradas_remitente_id_foreign` FOREIGN KEY (`remitente_id`) REFERENCES `remitentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `destinatarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salidas_entrada_id_foreign` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
