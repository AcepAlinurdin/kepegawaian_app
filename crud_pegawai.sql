-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2024 pada 08.10
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud_pegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2024-02-15 22:50:30', '2024-02-15 22:50:30'),
(2, 1, '127.0.0.1', '2024-02-15 23:10:44', '2024-02-15 23:10:44'),
(3, 1, '127.0.0.1', '2024-02-15 23:23:40', '2024-02-15 23:23:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `metadata`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Admin', 'Person', 'admin', 'admin@example.com', '$2y$10$ppJtPVL4ugPBBQ0D8Q4iPOouPo6fRjZNYdxyt2iNj3qTTadZT/icK', NULL, '$2y$10$1MnFMSECrDRsn0Xwln5i0elDwJM1jxdsYu.GjZxQSjGIaN.MoW1IS', NULL, '', NULL, 1, 2, NULL, '2024-02-15 23:23:40', '2024-02-15 22:47:55', '2024-02-15 23:23:40', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`, `deleted_at`) VALUES
(1, 1, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2024-02-15 22:47:54', '2024-02-15 22:47:54', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2024-02-15 22:47:54', '2024-02-15 22:47:54'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2024-02-15 22:47:54', '2024-02-15 22:47:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `old_template` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `old_content` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) NOT NULL,
  `master_field` varchar(255) NOT NULL,
  `slave_type` varchar(255) NOT NULL,
  `slave_id` varchar(255) NOT NULL,
  `pivot_data` mediumtext DEFAULT NULL,
  `session_key` varchar(255) NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
(27, '2022_08_06_000026_Db_System_Add_App_Birthday_Date', 1),
(28, '2022_10_14_000027_Db_Jobs_FailedJobs_Update', 1),
(29, '2023_09_24_000028_Db_System_Sessions_Indexes', 1),
(30, '2023_10_20_000029_Db_Jobs_Batches', 1),
(31, '2013_10_01_000001_Db_Backend_Users', 2),
(32, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(33, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(34, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(35, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(36, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(37, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(38, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(39, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(40, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(41, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(42, '2023_02_16_000012_Db_Backend_Add_User_Metadata', 2),
(43, '2023_09_09_000013_Db_Backend_Add_Users_Groups_Delete_At', 2),
(44, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(45, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(46, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(47, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` text DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `details` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'PDOException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php:117\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php(117): PDOStatement->execute(NULL)\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(545): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(753): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#18 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#24 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#68 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDO\\Exception: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDO\\Exception.php:18\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php(119): Doctrine\\DBAL\\Driver\\PDO\\Exception::new(Object(PDOException))\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(545): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(753): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#18 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#24 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#68 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null (SQL: insert into `users` (`nama`, `pekerjaan_id`, `email`, `tanggal_lahir`, `jenis_kelamin`, `updated_at`, `created_at`) values (acep, 1, acet@gjgjgkllk, ?, l, 2024-02-16 05:52:17, 2024-02-16 05:52:17)) in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:760\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#18 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#21 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#24 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#65 {main}', NULL, '2024-02-15 22:52:18', '2024-02-15 22:52:18');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(2, 'error', 'PDOException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php:117\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php(117): PDOStatement->execute(NULL)\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(545): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(753): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#18 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#24 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#68 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDO\\Exception: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDO\\Exception.php:18\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOStatement.php(119): Doctrine\\DBAL\\Driver\\PDO\\Exception::new(Object(PDOException))\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(545): Doctrine\\DBAL\\Driver\\PDOStatement->execute()\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(753): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#18 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#24 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#68 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'tanggal_lahir\' cannot be null (SQL: insert into `users` (`nama`, `pekerjaan_id`, `email`, `tanggal_lahir`, `jenis_kelamin`, `updated_at`, `created_at`) values (acep, 1, acet@gjgjgkllk, ?, l, 2024-02-16 05:52:47, 2024-02-16 05:52:47)) in E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:760\nStack trace:\n#0 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(720): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `us...\', Array, Object(Closure))\n#1 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(546): Illuminate\\Database\\Connection->run(\'insert into `us...\', Array, Object(Closure))\n#2 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(498): Illuminate\\Database\\Connection->statement(\'insert into `us...\', Array)\n#3 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\Processor.php(32): Illuminate\\Database\\Connection->insert(\'insert into `us...\', Array)\n#4 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(3322): Illuminate\\Database\\Query\\Processors\\Processor->processInsertGetId(Object(Winter\\Storm\\Database\\QueryBuilder), \'insert into `us...\', Array, \'id\')\n#5 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\QueryBuilder.php(284): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'id\')\n#6 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1869): Winter\\Storm\\Database\\QueryBuilder->insertGetId(Array, \'id\')\n#7 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Builder.php(300): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1330): Winter\\Storm\\Database\\Builder->__call(\'insertGetId\', Array)\n#9 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1295): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Winter\\Storm\\Database\\Builder), Array)\n#10 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1138): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Winter\\Storm\\Database\\Builder))\n#11 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(903): Illuminate\\Database\\Eloquent\\Model->save(Array)\n#12 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Database\\Model.php(927): Winter\\Storm\\Database\\Model->saveInternal(Array)\n#13 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(252): Winter\\Storm\\Database\\Model->save(NULL, \'BxeOTULkQVimTxR...\')\n#14 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(30): Backend\\Behaviors\\FormController->Backend\\Behaviors\\{closure}(Object(Winter\\Storm\\Database\\Connections\\MySqlConnection))\n#15 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(469): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#16 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(338): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#17 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\behaviors\\FormController.php(254): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#18 [internal function]: Backend\\Behaviors\\FormController->create_onSave()\n#19 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Extension\\ExtendableTrait.php(457): call_user_func_array(Array, Array)\n#20 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(186): Backend\\Classes\\Controller->extendableCall(\'create_onSave\', Array)\n#21 [internal function]: Backend\\Classes\\Controller->__call(\'create_onSave\', Array)\n#22 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(631): call_user_func_array(Array, Array)\n#23 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(489): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#24 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\Controller.php(287): Backend\\Classes\\Controller->execAjaxHandlers()\n#25 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(163): Backend\\Classes\\Controller->run(\'create\', Array)\n#26 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): Backend\\Classes\\BackendController->run(\'winter/user/use...\')\n#27 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(111): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#28 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(43): Backend\\Classes\\BackendController->callAction(\'run\', Array)\n#29 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(260): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#30 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\Route->runController()\n#31 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#32 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(162): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#41 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#49 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#50 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#51 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#52 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#53 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#55 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#60 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#62 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#63 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#64 E:\\UAS\\kepegawaian_app\\kepegawaian_app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\resources\\server.php(16): require_once(\'E:\\\\UAS\\\\kepegawa...\')\n#65 {main}', NULL, '2024-02-15 22:52:47', '2024-02-15 22:52:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `attachment_id` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `content_css` text DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n</head>\n<body>\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2024-02-15 22:47:54', '2024-02-15 22:47:54'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n</head>\n<body>\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2024-02-15 22:47:54', '2024-02-15 22:47:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'app', 'birthday', '\"2024-02-16T05:47:52.183086Z\"'),
(2, 'system', 'update', 'count', '0'),
(3, 'system', 'update', 'retry', '1708149034');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `version` varchar(50) NOT NULL,
  `detail` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'Winter.Demo', 'comment', '1.0.1', 'First version of Demo', '2024-02-15 22:47:55'),
(2, 'Winter.User', 'comment', '1.0.0', 'First version of user', '2024-02-15 22:47:55'),
(3, 'Winter.User', 'script', '1.0.1', 'v1.0.1/create_users_table.php', '2024-02-15 22:47:55'),
(4, 'Winter.User', 'comment', '1.0.1', 'Create users Table', '2024-02-15 22:47:55'),
(5, 'Winter.User', 'script', '1.0.2', 'v1.0.2/create_pekerjaans_table.php', '2024-02-15 22:47:55'),
(6, 'Winter.User', 'comment', '1.0.2', 'Create pekerjaans Table', '2024-02-15 22:47:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'Winter.Demo', '1.0.1', '2024-02-15 22:47:55', 0, 0),
(2, 'Winter.User', '1.0.2', '2024-02-15 22:47:55', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `revisionable_type` varchar(255) NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pekerjaan_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `pekerjaan_id`, `email`, `tanggal_lahir`, `jenis_kelamin`, `created_at`, `updated_at`) VALUES
(1, 'ssss', 2, 'peca@gmail.com', '1996-02-13', 'L', '2024-02-15 22:57:11', '2024-02-15 22:57:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_pekerjaans`
--

CREATE TABLE `user_pekerjaans` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_pekerjaan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_pekerjaans`
--

INSERT INTO `user_pekerjaans` (`id`, `nama_pekerjaan`, `created_at`, `updated_at`) VALUES
(2, 'tani', '2024-02-15 22:56:03', '2024-02-15 22:56:03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Indeks untuk tabel `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indeks untuk tabel `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indeks untuk tabel `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indeks untuk tabel `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Indeks untuk tabel `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indeks untuk tabel `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indeks untuk tabel `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Indeks untuk tabel `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`),
  ADD KEY `sessions_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indeks untuk tabel `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indeks untuk tabel `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indeks untuk tabel `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indeks untuk tabel `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indeks untuk tabel `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indeks untuk tabel `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indeks untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_pekerjaans`
--
ALTER TABLE `user_pekerjaans`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_pekerjaans`
--
ALTER TABLE `user_pekerjaans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
