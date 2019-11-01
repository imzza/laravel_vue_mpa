-- phpMyAdmin SQL Dump
-- version 5.0.0-alpha1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2019 at 12:48 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.3.8-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(98, '2014_10_12_000000_create_users_table', 1),
(99, '2014_10_12_100000_create_password_resets_table', 1),
(100, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(101, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(102, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(103, '2016_06_01_000004_create_oauth_clients_table', 1),
(104, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(121, '2019_07_09_135648_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0213ecdf044117739d204bdeb7c284beb4259dd72282e085ed753c8d8f13526132923b093633a39a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-15 05:00:28', '2019-07-15 05:00:28', '2020-07-15 10:00:28'),
('02ad6591da6d44c64d93a845c0fd027a0604945d72d067d98c80a68271f14ab293ac75b0f74915b9', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:17:52', '2019-07-24 08:17:52', '2020-07-24 13:17:52'),
('08592b54b9b5d873caa4d2582fae2ac72a5397eac977c62b6b5c9a67a2c850bc473ae393f97aaab3', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 03:25:30', '2019-09-01 03:25:30', '2020-08-31 20:25:30'),
('0aa18b8d277b4bc9013b091a560d576c2e6109c79a0a8c42245049062a299ea6e2b87990a69688f4', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-15 04:16:07', '2019-07-15 04:16:07', '2020-07-15 09:16:07'),
('0af1af99a8a6fbbbf60f4ea9a7a3d20e8bea3c17aa610e260bb8430e39b834e5b5b008929572de9a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-25 07:26:04', '2019-06-25 07:26:04', '2020-06-25 12:26:04'),
('0cf1d2d8fdf325d6b8416eb4b00fe038b68fc08bcaf122d26c6d1065e2cdd1aec202fe13145629ac', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-08-28 04:20:30', '2019-08-28 04:20:30', '2020-08-27 21:20:30'),
('102eb78191846cb5d65be1475869237124c248a642dbf16fb37730264355723ec2a3f6e1bc34f7a5', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 21:25:50', '2019-09-01 21:25:50', '2020-09-01 14:25:50'),
('111e5d0cdeb58f5c865636231165056c4886ce382be927badcb412454f4db8aaf7b5c35c84008335', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-27 13:20:40', '2019-06-27 13:20:40', '2020-06-27 18:20:40'),
('17a1edb17ce399b7b02e2c328f810ceb9e631412f61a409094a9d5d3b2dc7829bd51f3ab8aaf8017', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-16 06:55:38', '2019-07-16 06:55:38', '2020-07-16 11:55:38'),
('17e8711ae3ca0d23ebfcfc4a37e98db908e1e7d35f115214edbeb04447fc1ef7e411925c7438c2bc', 1, 3, NULL, '[]', 0, '2019-09-13 14:06:48', '2019-09-13 14:06:48', '2020-09-13 07:06:48'),
('1c98e5d38c1ec06a0bf50915eb0eadf51697e3cea826945cb373e42c49cb685ad9b13ae41b087e0d', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-15 05:29:36', '2019-07-15 05:29:36', '2020-07-15 10:29:36'),
('23604b02217a8ddee9a52b7ab1f2b73134bc9e8ac3f203416595ce3c52adf64d5ae9c858712e21ed', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 00:45:38', '2019-09-01 00:45:38', '2020-08-31 17:45:38'),
('26ad29dcf2c4222c7cb81f51d6d90c419171eeaac35384f371612bda977b316822e56e406afcdb78', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-11 12:27:42', '2019-07-11 12:27:42', '2020-07-11 17:27:42'),
('287851941255b63c5631a51603562abf079da53d1cd837032d99baf4c3fbe2d6d7e1441bf0b6595c', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 01:58:43', '2019-09-01 01:58:43', '2020-08-31 18:58:43'),
('2bc617c3beed6184457b965cdcce8c48805d434a423e056771af0b65e50c50682bad7ef624d1ac78', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-15 11:26:44', '2019-06-15 11:26:44', '2020-06-15 16:26:44'),
('2dafdfee63cf24f685f9db07270baeb6cd894d3e2dcd5c3482b29be322f83630a381e41d0e89f69b', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:30:58', '2019-07-24 08:30:58', '2020-07-24 13:30:58'),
('2e1a5dc748c839b7fa6be3ba1d126aa7df1d8e596abc7b3725d8f94939778b981c8576024f581e13', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-18 04:09:16', '2019-06-18 04:09:16', '2020-06-18 09:09:16'),
('2fea4bd966a5da26cc3ddc23f83b34fe387c449d17c12155ba91ef5dc79fd4bd779d0895bd5b67fe', 1, 3, NULL, '[]', 0, '2019-09-03 13:01:33', '2019-09-03 13:01:33', '2020-09-03 06:01:33'),
('32ec5060297cd98aaef84849b107b8f665eb3d3035831417231e297036bb203efa052625a9516059', 1, 3, NULL, '[]', 0, '2019-10-23 05:04:46', '2019-10-23 05:04:46', '2020-10-22 22:04:46'),
('33ccce258633757480e7c6833ab80c3bc2aa4536f28c8da22cbe4fc7b677c51e75794cb7e052b676', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:19:05', '2019-07-24 08:19:05', '2020-07-24 13:19:05'),
('36d1492901e0b9889178b2eba4bde780b4448d7a601a462dfa72ad7359a7adf0eb38f5daa52b3c75', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-21 08:48:41', '2019-06-21 08:48:41', '2020-06-21 13:48:41'),
('55e62012eda41e2bf05824837050479227d4f300c4e650bbfbdbfcaa162c3add94176ca7ecf0ba68', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-26 06:20:08', '2019-06-26 06:20:08', '2020-06-26 11:20:08'),
('6b54fa6f68d9061d03b3b9adc9bd774a50d0c0f7b39c27069aadba0d44422a06b59a788e65c40892', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-08-27 14:43:58', '2019-08-27 14:43:58', '2020-08-27 07:43:58'),
('6df3ed0effa3df0f44c82d942f6f8459d7ff2aa3fda12ee1ff4e10b42eb99bb0cb07a1b6ee017f32', 1, 3, NULL, '[]', 0, '2019-09-03 12:52:10', '2019-09-03 12:52:10', '2020-09-03 05:52:10'),
('74f02ebe28bc7f6933d889fce9b53cfffa307b53e8a9b76bab44abbe5153d48740f2722de5c1eaec', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-17 07:01:58', '2019-07-17 07:01:58', '2020-07-17 12:01:58'),
('7f37db7a29e93ca079ee573f8a86fa6f933a31fa55e62903c0d3918c5856887467f264c8da0a804f', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-12 08:38:49', '2019-07-12 08:38:49', '2020-07-12 13:38:49'),
('82618dc4445e0025c0b0578b7b43c822d52b7c6a80ebe681eff653b832d5c38fdba00167bc7f7d92', 1, 3, NULL, '[]', 0, '2019-10-31 05:21:10', '2019-10-31 05:21:10', '2020-10-30 22:21:10'),
('828d6d8c1e07a385a510e6a62e72c4ccbb3efb7c86fe9e3fee7d92b547781695bb7d370be87f4934', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-06-27 13:20:46', '2019-06-27 13:20:46', '2020-06-27 18:20:46'),
('83faf3057edf53281bc747617810c8fe8147bfe6a69679a882b532c176bb7e918c35f7d773da6e5a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-13 09:56:30', '2019-07-13 09:56:30', '2020-07-13 14:56:30'),
('8c45f1bc7419fa7142c70e631b04869968d3f429639cf154d1d2244f10e7c2a83ec1221fe24f72c3', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-29 09:42:00', '2019-07-29 09:42:00', '2020-07-29 14:42:00'),
('8cfd6c812c89dbe811c31343ffe68bde62421a450e8a258f37219570db6d36d019674467eba96847', 5, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-26 07:17:09', '2019-07-26 07:17:09', '2020-07-26 12:17:09'),
('8fc23e6cb75a2220b5c0cd7e90acae6a9b75b65e5c71fdb2931a279cca4a94d83325ea95bd178dd7', 1, 3, NULL, '[]', 0, '2019-09-04 03:39:27', '2019-09-04 03:39:27', '2020-09-03 20:39:27'),
('90392af65189649a5da593c1c1e549c7d2c52768e22febeea0dfcbf940d397e7b9165a2f9dec2bc9', 1, 3, NULL, '[]', 0, '2019-09-18 04:59:28', '2019-09-18 04:59:28', '2020-09-17 21:59:28'),
('99d3cc51c0a925de17956ed13acf8b2b80b49e8933cfcd84803e9433ae637ec99d50f869ca538732', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 04:18:54', '2019-09-01 04:18:54', '2020-08-31 21:18:54'),
('9b331dcd5868aad6989f52489764aced079942a55d48806fbc759c825f098e549c07ad56b52b86b7', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:30:06', '2019-07-24 08:30:06', '2020-07-24 13:30:06'),
('a9d067ae0e0c4a3b121c851342ea0ab5357e868ba6d1574773ded696329322f22874d89ff99738bc', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-08-28 04:22:12', '2019-08-28 04:22:12', '2020-08-27 21:22:12'),
('aad7378ef493a8be2347b7980c6af10359fdac8f4c67fd1eb835473c5d0d29f86616aa1360ed16d5', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:32:15', '2019-07-24 08:32:15', '2020-07-24 13:32:15'),
('ad8d04e982bf95f153dbc9faa941b00ad1c01c0b599300841000d4479945de9e2de8966cd1a4348d', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-08-09 14:59:23', '2019-08-09 14:59:23', '2020-08-09 07:59:23'),
('af0bef8d23eb8a039220e72e6415c04918ae61c4b7cd62a2b4402ef02be4b2dc37cd23b42359e40a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 05:26:35', '2019-07-24 05:26:35', '2020-07-24 10:26:35'),
('b4d53fb1e8f078988c3af3372c61b87a5fdfb3d28b26f86253f064fc29596b4f5fb61be735d6ee34', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-15 05:44:37', '2019-07-15 05:44:37', '2020-07-15 10:44:37'),
('b83937515ab71c0ebb3ea01e833561aa6b85e61138eef2ef4f835bade070029ee318e852be94314e', 1, 3, NULL, '[]', 0, '2019-09-17 12:40:11', '2019-09-17 12:40:11', '2020-09-17 05:40:11'),
('b9cd2e99abfe615536d4562a6ac08cc24dd60363ac70234cce393583ecea8b1fc384b0d294ea644e', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-16 09:01:06', '2019-07-16 09:01:06', '2020-07-16 14:01:06'),
('bc494718a104327369fe4a4da809b4705a82672e987bfec9f50d9e6bb9294c655a0f549c618b74cd', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 00:46:25', '2019-09-01 00:46:25', '2020-08-31 17:46:25'),
('cbf04b28950049faca3dbf822e07525568e009f3307ae3f6ebcb8dff44d9530934e94d1588b0cdbb', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:29:44', '2019-07-24 08:29:44', '2020-07-24 13:29:44'),
('cc6000876600a223f8a01505b83cec97b435a9012061e4b705985ba05e222384c55a66a186841bdb', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 04:00:27', '2019-09-01 04:00:27', '2020-08-31 21:00:27'),
('d308196919eca229e5e518ca2fa736d39c6000a5cdd8c17258434cb2317bb353dc9e7bc2e1e75231', 1, 3, NULL, '[]', 0, '2019-10-17 14:12:19', '2019-10-17 14:12:19', '2020-10-17 07:12:19'),
('d35caf4499010f9e37f02ae793197dcd6b6108130711ce46ed2b7c61ed453521865998354b006fe5', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:19:15', '2019-07-24 08:19:15', '2020-07-24 13:19:15'),
('d61173f29bc22da2c7228cebcbb9c4cdbd962d899d6f07519b3d36121b30e55e14f49cbd2200c168', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-09-01 04:13:18', '2019-09-01 04:13:18', '2020-08-31 21:13:18'),
('d841fc6a2f450c97f92e567ea8be4e4f3ba0c5814104fc7de123b829039be0efc35878ee8db33e02', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:22:59', '2019-07-24 08:22:59', '2020-07-24 13:22:59'),
('df2527fbfe9a2ccec174ab820d4d6cebb7a02d74a8504d6b9c0a4c6e1064a3690c293d3179feede1', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:32:46', '2019-07-24 08:32:46', '2020-07-24 13:32:46'),
('edf9fc7146de39f68fe092aaa2333506637f4e71ecef1512ccc72d8be46330fc8c59fb052688aa17', 1, 3, NULL, '[]', 0, '2019-09-17 13:37:08', '2019-09-17 13:37:08', '2020-09-17 06:37:08'),
('edff4af5e27ae2a13c8a743cb9daf9413ee9384cb6b9a9872777b6088ac7ae428a1a49e1ac70f1c0', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:20:50', '2019-07-24 08:20:50', '2020-07-24 13:20:50'),
('ee6d7e77f5061f1e3ea648793e3a082fb1303ed54168899d0baa54115f0c915afbd4e10a609b0c1b', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-24 08:28:03', '2019-07-24 08:28:03', '2020-07-24 13:28:03'),
('f06d5a3a78f67a13754710ac000b2960ec95b0c6756c4edd3246e14462001dd3f8d78899c352feb9', 1, 3, NULL, '[]', 0, '2019-10-29 04:36:53', '2019-10-29 04:36:53', '2020-10-28 21:36:53'),
('fc90e1929655dadb0f70dad75b262e61ce24760276c4cfcdff6dd64ab277ea90f6bf878e6d752f1f', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2019-07-15 05:44:42', '2019-07-15 05:44:42', '2020-07-15 10:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'F0VkFJfsTNH8e6eU9xAbgKjnuNoQgxS4DcU7mn4K', 'http://localhost', 1, 0, 0, '2019-03-11 00:54:07', '2019-03-11 00:54:07'),
(2, NULL, 'Laravel Password Grant Client', '1gTbomOfr05z2BJqp3mcebcqtBjcEbrQ1DmWsjL7', 'http://localhost', 0, 1, 0, '2019-03-11 00:54:07', '2019-03-11 00:54:07'),
(3, NULL, 'TimeClock Password Grant Client', 'lHef9ty2asIHrkx16Zz0f4c7fxDM31J0piJaBa6D', 'http://localhost', 0, 1, 0, '2019-09-03 11:54:25', '2019-09-03 11:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-03-11 00:54:07', '2019-03-11 00:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('00d8b073510972cafecaeadefe61e4f8eb0c2274c0f341323f3c68a0c2179f6da7e1f1f734d03cd5', '9b165f657913e8c074b476bb3af4319cc74f774c930a6eaec96af53eb6ef1af84331a1f86a1e1af9', 0, '2020-10-30 21:31:11'),
('04053ffa4e5ae79d1934986f1d81a129bd3e09d3d0dbaec70af8113e9ee551e43839d0267da97b11', '90392af65189649a5da593c1c1e549c7d2c52768e22febeea0dfcbf940d397e7b9165a2f9dec2bc9', 0, '2020-09-17 21:59:28'),
('2d45b2f7f142b672f804ec3c8c45234754eff9b935b6e9b1189ab0abeb5eb1aa3b56174bac4954c3', 'a69aa50c01db4eb3347203761b1c4df17d0b5e43546b203250c59e005a8717756bd6fe5cdf9ebace', 0, '2020-09-17 20:39:11'),
('40177767ca9315887c152491eed66cbfbd97854f64f82de649cdb8c84e54e909245bc31e9b15d9d1', '2319681e2110e52665f39c32e7de39ae4b79a736ed31c3db78c090d6837cea1f02f08818336beab4', 0, '2020-09-17 04:41:00'),
('41d249712aeab6a87b1bb61256ad2e89d573746d6379c345640179d02bd639dd90a60fef9fcc2174', 'a9300690e20fc1e701ec2c95e14157ca8e207d9fc33c1fd247830f36bd058eb87f631afdc8a9720a', 0, '2020-09-17 05:37:34'),
('44f2df270315c82fbaeef185847ef4254ecad0fca0a093620371bc438fa5167e4a8c25d432a57400', 'a441edf9ec3706debaf7bb3c871f5fefe3eee5f4c65e834eac07ad53951c90cc85735b9ece0a8506', 0, '2020-10-30 21:18:46'),
('464ef8126f2e9eceb29309672fd4798ba09a8d258e25228137338dcc122cb65b60dbd62082eddf9e', 'edf9fc7146de39f68fe092aaa2333506637f4e71ecef1512ccc72d8be46330fc8c59fb052688aa17', 0, '2020-09-17 06:37:08'),
('46aafd03a6effd7ae86c38966d0e7b1e7b8648f6f5229f2deb184568627ec1124e0602a5db4a8f16', '28550e868ea681853a7f65f990f36dc05af5ec8b2dca68f65a77ce46f90e88fbc56d02060c3c3c76', 0, '2020-10-30 21:21:47'),
('4ce980db438ae98d437fd0febe3154b5b724650d0618261d42a1692b8b162b3a05d74f73ab6ba6b4', 'f06d5a3a78f67a13754710ac000b2960ec95b0c6756c4edd3246e14462001dd3f8d78899c352feb9', 0, '2020-10-28 21:36:54'),
('5d98fbd27484fd5571f621aa927ae8c64e0791891bf432124df680717954515a90b09af525a66a39', '6df3ed0effa3df0f44c82d942f6f8459d7ff2aa3fda12ee1ff4e10b42eb99bb0cb07a1b6ee017f32', 0, '2020-09-03 05:52:10'),
('61e0b7e7a3065909b44247199c0cb0043a89f81171541350fe0fcb4a905c75b00abf83110dade33a', 'd308196919eca229e5e518ca2fa736d39c6000a5cdd8c17258434cb2317bb353dc9e7bc2e1e75231', 0, '2020-10-17 07:12:19'),
('6227cabe74556126c4f5b59cdc275f1071245350f4601e2a770ce54af6f94bed9af9826de8ea44ae', '5976b150596be128484b7a771a52aa12d2260bf67ec371beca7e23401597fd012ade675d9b712d1f', 0, '2020-10-30 21:22:04'),
('65af6acbd8f1e70c1a96a5b3172250a134102e74e9fd47d83182bf3062d42c5d6716314b5ab616c3', '57872654356bb36e73df9559c8b5c00c6773e5f964682a567ba79cfea8e93e30937d62de50a44897', 0, '2020-09-03 05:02:40'),
('79540ed530b265274f16903c1b30ab0933f2e7fbff851e3ebbcc2e3843fd61ea65820e1e5d3b39ec', '32ec5060297cd98aaef84849b107b8f665eb3d3035831417231e297036bb203efa052625a9516059', 0, '2020-10-22 22:04:47'),
('80aca653f24b1c084aad5a493b1e362cd62144124b95423d7639bf5c8ae37939811f9e374f79f6de', '89a64afeb41d0cb4c7cf82bbe326f82bd6d347ef7ebc60ba4eb9ba85ca4aea02f829559833965954', 0, '2020-10-30 21:08:48'),
('823f58b256e7df731f03101ac51501ffc972b1de38f327c615f5da8c8025537b9effd45494059c03', '187775a9e3770424cc9793c71e62e0038df1108baa6e473b7533f5f88fb03c7c5e18acf2a27dfd0e', 0, '2020-09-17 20:44:38'),
('8cc1290c84c6a54514fdc1a2d917c5d9c66e65c70e14265cc7c0a74c24ed06054c0af98ea17ef7ce', '30c268f59a9c0911090263e2212da13e575c3c94ddf0f8f50201b0a667b24c9dda15d474d498aa23', 0, '2020-09-17 06:41:25'),
('8f8b5da86f0e3abb991d986c09a6d6b652820538b26bc6175207262bcd0eb3dc6a3ec83c577a4c9d', 'b83937515ab71c0ebb3ea01e833561aa6b85e61138eef2ef4f835bade070029ee318e852be94314e', 0, '2020-09-17 05:40:11'),
('92a4745a770a86ddb3aadab616471a11b94b816577becbd08eafce769c16d231357ba56b582376c2', 'cf773628aaf8a6df50e72b8a06dd931818bc4eb831223aa07d924cc4dce485ac66b59cdc60b675a7', 0, '2020-10-30 21:24:45'),
('93b8fc2976839aaddc89b45265437405c7398421541b69ed2aeb92f872d1fb54f6c1347490671185', '47561d62dab0513cc2c0ddf53799d554453c16170ae67f44c5782080cd78fa28e1d9af11e5ebf71f', 0, '2020-09-17 05:34:26'),
('9543cb0ba3bbc9b97bb6898cc4998ef899f9dac86952659228a3bde91b284feb7f1736e278b0dc1c', '39e808bba26169493fa577adf4d256cc1a221f5c9ca385444da3213361efddd12e9f92c45f1bfcd0', 0, '2020-09-17 20:36:58'),
('9cc1cb3fd7764d1ab41de3470687fe4d50b90937a97b61899967d38271a98c97f5a26fea8e9afa5b', '17e8711ae3ca0d23ebfcfc4a37e98db908e1e7d35f115214edbeb04447fc1ef7e411925c7438c2bc', 0, '2020-09-13 07:06:48'),
('9d7fd7d42f56f9342a7d1dae3bf97aa751a4900ce023cb1ffe0015ac68587fe49496d0a1bf0de7f1', '2fea4bd966a5da26cc3ddc23f83b34fe387c449d17c12155ba91ef5dc79fd4bd779d0895bd5b67fe', 0, '2020-09-03 06:01:33'),
('a8e91b04a0c0f85291c331d8834af65a6e3da88131030622f29e361544ffd28642e2caabc54ac6b6', 'dbef664a975b682c8fa2c6bbf6778cd573579194d2213fecf5fb37c1ae7b1530f9b04c791614a616', 0, '2020-10-30 21:06:32'),
('b49644d090ab76eddb8e4270ad8302eff2af56041840ce20315e820c183ab2735507d45b8a8e4482', 'bfb8c6aaf82da110d3e124ab55e73d9ac16e4dec16bf654d7c3513b250462bb90eb35888130e6f4d', 0, '2020-10-30 21:06:06'),
('b9e2f8230b54367c8efb1fa6a1724263242b1317abfad49556edf395e1fd94c50eb241cba3625646', '24faeaa1c91bdd6e8db502d6cf9422f1990d1abed9061c69f2ee62ca7f526743d5ee0db232466bf2', 0, '2020-10-29 20:41:28'),
('bf5cf4aa6d056a7e5348b497b3bc4b118b8f5fcaf04afc251f7eaaff8adb3d11efc6232fb3607fb4', '72073e6ec04eb00d9cd5146ddcbccf671e2dbcf781082a6be9d56203b4a8eca1acda8ef3a06eaaac', 0, '2020-09-17 20:45:03'),
('cc91b987e09fe8985d4f3cb395fd3aeed4ba505adb07e838b445539b47b15a2ef99acf0a2bdc6e34', '8fc23e6cb75a2220b5c0cd7e90acae6a9b75b65e5c71fdb2931a279cca4a94d83325ea95bd178dd7', 0, '2020-09-03 20:39:28'),
('e68433e62d719dff69a68c421edbedf007eda0142c7053b78ad7b02b6aa680e396acf89353924ad1', '8ea39fc7b0229681892b41d406e62ac4b3657baaec0f19baf334c90637a549e0734d064dbdd75884', 0, '2020-09-17 20:10:26'),
('ecd61a3ea1a5b0f118f44ce70437e249f817720c695ad193825f67ae58ebbacfbcf02fb34a2dfd39', '82618dc4445e0025c0b0578b7b43c822d52b7c6a80ebe681eff653b832d5c38fdba00167bc7f7d92', 0, '2020-10-30 22:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `key`, `type`) VALUES
(1, 'dashboard', 'web', '2019-07-12 12:36:51', NULL, 'Dashboard', 'Dashboard'),
(17, 'role_and_permissions', 'web', '2019-07-12 12:36:51', NULL, 'Roles & Permissions', 'Roles And Permissions'),
(18, 'roles', 'web', '2019-07-12 12:36:51', NULL, 'Roles Index', 'Roles And Permissions'),
(19, 'roles_add', 'web', '2019-07-12 12:36:51', NULL, 'Add Role', 'Roles And Permissions'),
(20, 'roles_edit', 'web', '2019-07-12 12:36:51', NULL, 'Update Role', 'Roles And Permissions'),
(21, 'roles_delete', 'web', '2019-07-12 12:36:51', NULL, 'Delete Role', 'Roles And Permissions'),
(22, 'permissions_assign', 'web', '2019-07-12 12:36:51', NULL, 'Assign Permissions', 'Roles And Permissions'),
(23, 'table', 'web', '2019-09-17 06:43:29', NULL, 'DataTable', 'Datatable');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_descrip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `role_descrip`, `rolename`) VALUES
(1, 'SUP', 'web', '2019-07-09 17:34:10', '2019-07-29 09:40:07', 'Complete Access to the Application', 'SuperVisor'),
(2, 'USER', 'web', '2019-07-09 17:34:10', '2019-07-12 06:57:10', 'Regular User', 'Standered User');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(23, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offers` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `about`, `address`, `address2`, `city`, `email`, `first_name`, `gender`, `image`, `last_name`, `password`, `state`, `zip`, `offers`, `created_at`, `updated_at`) VALUES
(1, 'qwqwqwqwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwqwqwqqwqwqwqwqwqwqwqwqwq', 'qwqwqww', 'qwqwqwqw', 'qwqwqw', 'irfanullah73@gmail.com', 'qwqwq', 'male', '1571780681.jpeg', 'qwqwq', 'qwqwqw', 'LA', '54000', 1, '2019-10-23 11:44:41', '2019-10-23 11:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `password`, `is_admin`, `is_active`, `remember_token`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Test Admin', 'Test', 'Admin', 'admin@test.com', '$2y$10$DpoUX9yNGXXTiF6Fg18sZ.WFbg096Hx17tA00I4oYA4YQ5Xta/V6m', 1, 1, NULL, NULL, '2019-07-22 19:00:00', NULL),
(2, NULL, 'Joe', NULL, 'joe@test.com', '$2y$10$DpoUX9yNGXXTiF6Fg18sZ.WFbg096Hx17tA00I4oYA4YQ5Xta/V6m', 1, 1, NULL, NULL, '2019-07-22 19:00:00', NULL),
(4, 'BULL DOG', NULL, NULL, 'thebull@gmail.com', '$2y$10$oYVZ7ZJ9cSpFevGir5SHFu6FzdflGOKRyZfrmYHGsXTyS6iyvbf7i', 0, 0, NULL, NULL, '2019-07-22 19:00:00', '2019-07-16 06:54:46'),
(5, 'John', 'Peck', 'Malik', 'jgerald@nethomefx.com', '$2y$10$DpoUX9yNGXXTiF6Fg18sZ.WFbg096Hx17tA00I4oYA4YQ5Xta/V6m', 0, 0, NULL, NULL, '2019-07-22 19:00:00', '2019-07-29 09:41:39'),
(6, 'John Brawo', NULL, NULL, 'john@example.com', '$2y$10$emSle6LCoEp4R7v7vLEL7OcRvrlYQYlKyNA0E41xyQTDPjcnY.QP2', 0, 0, NULL, NULL, '2019-07-29 09:38:43', '2019-07-29 09:38:43'),
(7, 'Test User', NULL, NULL, 'test@test.com', '$argon2i$v=19$m=1024,t=2,p=2$SnZESGl2aTRvNndEWW9nWQ$gt5tDvma6cPv2WtVWpyH7MU+x5tTb/6nl1RsLPYXVIg', 0, 0, NULL, NULL, '2019-11-01 13:18:25', '2019-11-01 13:18:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

