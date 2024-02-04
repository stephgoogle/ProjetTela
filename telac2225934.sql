-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 30, 2024 at 09:34 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telac2225934`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnements`
--

DROP TABLE IF EXISTS `abonnements`;
CREATE TABLE IF NOT EXISTS `abonnements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_abonnement_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `is_actif` tinyint(1) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abonnements_transaction_id_foreign` (`transaction_id`),
  KEY `abonnements_type_abonnement_id_foreign` (`type_abonnement_id`),
  KEY `abonnements_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `abonnements`
--

INSERT INTO `abonnements` (`id`, `type_abonnement_id`, `start_date`, `end_date`, `transaction_id`, `is_actif`, `type`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 1, '2023-12-16', '2024-01-16', 1, 1, 'Promo', '2023-12-16 16:34:56', '2023-12-16 16:34:56', 8),
(2, 1, '2023-12-16', '2024-01-16', 1, 1, 'Promo', '2023-12-16 16:35:52', '2023-12-16 16:35:52', 1),
(3, 1, '2023-12-26', '2024-01-26', 1, 1, 'Promo', '2023-12-26 11:11:27', '2023-12-26 11:11:27', 84),
(4, 1, '2023-12-26', '2024-01-26', 1, 1, 'Promo', '2023-12-26 15:52:10', '2023-12-26 15:52:10', 16);

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `paragraphe1` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `paragraphe2` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `paragraphe3` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `paragraphe4` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_programme_tvs`
--

DROP TABLE IF EXISTS `categorie_programme_tvs`;
CREATE TABLE IF NOT EXISTS `categorie_programme_tvs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categorie_programme_tvs`
--

INSERT INTO `categorie_programme_tvs` (`id`, `name`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'Publicité', 'pub.png', '2023-12-14 19:00:41', NULL),
(2, 'Emission live', 'live.png', '2023-12-14 19:00:41', NULL),
(3, 'Emission différée', 'differee.png', '2023-12-14 19:00:41', NULL),
(4, 'Rediffusion', 'rediffusion.png', '2023-12-14 19:00:41', NULL),
(5, 'Sport', 'sport.png', '2023-12-14 19:00:41', NULL),
(6, 'Music & films', 'film.png', '2023-12-14 19:00:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `communes`
--

DROP TABLE IF EXISTS `communes`;
CREATE TABLE IF NOT EXISTS `communes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `communes`
--

INSERT INTO `communes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Abobo', '2023-12-14 19:00:41', NULL),
(2, 'Adjamé', '2023-12-14 19:00:41', NULL),
(3, 'Anyama', '2023-12-14 19:00:41', NULL),
(4, 'Attécoubé', '2023-12-14 19:00:41', NULL),
(5, 'Bingerville', '2023-12-14 19:00:41', NULL),
(6, 'Cocody', '2023-12-14 19:00:41', NULL),
(7, 'Koumassi', '2023-12-14 19:00:41', NULL),
(8, 'Marcory', '2023-12-14 19:00:41', NULL),
(9, 'Plateau', '2023-12-14 19:00:41', NULL),
(10, 'Port bouët', '2023-12-14 19:00:41', NULL),
(11, 'Treichville', '2023-12-14 19:00:41', NULL),
(12, 'Songon', '2023-12-14 19:00:41', NULL),
(13, 'Yopougon', '2023-12-14 19:00:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ebank_profils`
--

DROP TABLE IF EXISTS `ebank_profils`;
CREATE TABLE IF NOT EXISTS `ebank_profils` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `is_demarcheur` tinyint(1) DEFAULT '0',
  `is_suspended` tinyint(1) DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_validated` tinyint(1) DEFAULT '0',
  `has_epargne` tinyint(1) DEFAULT '0',
  `information_identity_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ebank_profils_phone_unique` (`phone`),
  KEY `ebank_profils_information_identity_id_foreign` (`information_identity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `ebank_profils`
--

INSERT INTO `ebank_profils` (`id`, `nom`, `prenoms`, `balance`, `photo`, `email`, `phone`, `is_staff`, `is_demarcheur`, `is_suspended`, `email_verified_at`, `password`, `is_validated`, `has_epargne`, `information_identity_id`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', '0', 'assets/img/users/pieces/4060972085670302.jpg', NULL, '0000000000', 0, 1, 0, NULL, '$2y$10$2zD5l9vq41ludyUcrhBs1.u0AfSZ1AZ9r7duDfREBIHv0Z.XHrwuy', 0, 1, 1, '2023-12-14 20:54:01', '2023-12-20 08:01:12'),
(2, 'FAIZAN CHRIST', ' ', '0', '/tmp/phpQ3VhrX', NULL, '01 50 67 57 24', 0, 1, 0, NULL, '$2y$10$emS7OHdR3sBBciJgqOlOUOnLYj1JFUTzjucieON2RlJBNeXIb1xAa', 0, 0, 2, '2023-12-15 05:26:40', '2023-12-15 05:26:40'),
(3, 'Douho Franck', ' ', '0', '/tmp/phpHmK9Ou', NULL, '0142752949', 0, 1, 0, NULL, '$2y$10$95iGXIK0kRpT2BvxM1rRw.Scjj0.R9Y6GwR33EjzPy8I1NkoHYjri', 0, 0, 3, '2023-12-15 05:52:16', '2023-12-15 05:52:16'),
(4, 'Cisse vakaramoko ismail', ' ', '0', 'assets/img/users/pieces/3781923038373931.jpg', NULL, '0767187983', 0, 1, 0, NULL, '$2y$10$GpwdgcZEyVKX7F9/WDQta.pjnitdh3l6FmEBepmruF9Z3MU31NawW', 0, 1, 4, '2023-12-15 06:04:26', '2023-12-29 04:54:00'),
(5, 'KROU KASSI AIME', ' ', '0', '/tmp/phpb6MNNw', NULL, '0767710037', 0, 1, 0, NULL, '$2y$10$ysoLJ5D33YhDPTzvsie2v.uA0LCK4Bh/ggCcM273dAKV1/R.cQtjC', 0, 0, 5, '2023-12-15 06:45:36', '2023-12-15 06:45:36'),
(6, 'M’baye Mamadou', ' ', '0', '/tmp/php1JFcH6', NULL, '0704651768', 0, 1, 0, NULL, '$2y$10$HXOhIev74RJeDEdNksh3wOlIWkL0vm.eHUJDulRiBtpFgu9kZLvmG', 0, 0, 6, '2023-12-15 06:52:39', '2023-12-15 06:52:39'),
(7, 'Brou Ange Constant', ' ', '0', '/tmp/phpfCcccK', NULL, '0142259421', 0, 1, 0, NULL, '$2y$10$ww2TKqjToJ6wiWjSkyazJ.KI2EP4jSDQPPIaQWvZfdUsbMbKlDg0q', 0, 0, 7, '2023-12-15 07:28:13', '2023-12-15 07:28:13'),
(8, 'google', 'test', '0', 'assets/img/users/pieces/4821333170192485.jpg', NULL, '0000000001', 0, 1, 0, NULL, '$2y$10$PxQPaXxOMOGc38dzzYzCW.LPfx8wqR1NryKj2lpgaRtjAe3YKeMyy', 0, 0, 8, '2023-12-15 09:39:22', '2023-12-15 09:39:22'),
(9, 'NANOU JEAN', ' ', '0', 'assets/img/users/pieces/8712385718612122.jpg', NULL, '0586468663', 0, 1, 0, NULL, '$2y$10$OcVdFjULE0TD1hvy1y1aKejDjrmfbkBN4icRloIc33foEma.gu6ba', 0, 1, 9, '2023-12-15 10:06:22', '2023-12-29 02:12:46'),
(10, 'Goore Armand Trazie', ' ', '0', 'assets/img/users/pieces/4579292452620771.jpg', NULL, '0779411622', 0, 1, 0, NULL, '$2y$10$JJtL9kONLNf0RlCwvuDuFOkpZwdanqnVi/uoPpqtCWrnmkyknB7ju', 0, 1, 10, '2023-12-15 10:23:16', '2023-12-29 02:15:19'),
(11, 'Noé Ephraïm Nougi', ' ', '0', 'assets/img/users/pieces/9876509051823949.jpg', NULL, '0757057448', 0, 1, 0, NULL, '$2y$10$fgTop20C/o6TGtMj4Cmc9OcJt.S6pTCjJHeXR/MryxuNqo1/Aiwum', 0, 1, 11, '2023-12-15 10:40:55', '2024-01-16 03:51:12'),
(12, 'Attemené Rodolpho', ' ', '0', 'assets/img/users/pieces/8789262087030910.jpg', NULL, '0779637426', 0, 1, 0, NULL, '$2y$10$pKkZKbjAiFxmOBzwy/Bg1uVj9v7nS80wV7ZuBarqBpiNUzpy0ywpW', 0, 1, 12, '2023-12-15 10:56:16', '2023-12-29 02:20:08'),
(13, 'Kouabenan Uriel Fienin', ' ', '0', 'assets/img/users/pieces/5197089265896931.jpg', NULL, '0789324267', 0, 1, 0, NULL, '$2y$10$sE2NlLc1hJ3IPD3Kt8.sweiZdStYru/55DU1HJMkOF04sF3/4I8YC', 0, 1, 13, '2023-12-15 13:32:21', '2023-12-29 02:23:51'),
(14, 'Dassé Jonathan', ' ', '0', '/tmp/phpT5Bxeh', NULL, '0143834131', 0, 1, 0, NULL, '$2y$10$hAyTgfbmKR0sqMpnGodMAO/4kcjvoN5vy/P16aJgDhMkFfITz0Ioy', 0, 0, 14, '2023-12-15 14:24:49', '2023-12-15 14:24:49'),
(15, 'Annasse Dabré Ousmane', ' ', '0', 'assets/img/users/pieces/4321225667582992.jpg', NULL, '0143926508', 0, 1, 0, NULL, '$2y$10$MVML7t.Jv0Aem2tKU47CTOy/y6N7m1j3PKsfIoUowbObE82ql.fK.', 0, 1, 15, '2023-12-15 14:37:27', '2023-12-29 02:26:45'),
(16, 'Winle Éric', ' ', '0', 'assets/img/users/pieces/7003920862958301.jpg', NULL, '0140062887', 0, 1, 0, NULL, '$2y$10$mYqtwbSpxBoG50Hs3UvF5O0z15PlZ6g5GaU70p5K0xe4D2aVGQoj6', 0, 1, 16, '2023-12-15 14:49:03', '2023-12-29 02:28:11'),
(17, 'SANGARE SIAKA', ' ', '0', 'assets/img/users/pieces/4787504711601775.jpg', NULL, '0544295169', 0, 1, 0, NULL, '$2y$10$/pC1d5lIjNPYxARwrho.COq.hT3teWZ5B493gNC.yT0Ne15DQ6KpG', 0, 1, 17, '2023-12-15 15:05:46', '2023-12-29 02:30:01'),
(18, 'Kouame Axel', ' ', '0', 'assets/img/users/pieces/2009854900830032.jpg', NULL, '0769475516', 0, 1, 0, NULL, '$2y$10$FWbGV.ZcfQwIZ6o0s46X5eSPk0QIEkiT995Y27oIfWhRmo8kc8yGq', 0, 1, 18, '2023-12-15 15:13:14', '2023-12-29 02:31:22'),
(19, 'TANO KOTCHI', ' ', '0', 'assets/img/users/pieces/6899386972319078.jpg', NULL, '0564954570', 0, 1, 0, NULL, '$2y$10$07xIcmSaRmXja0vCBn.fz.HJdkJGety5OGpO8RvaU1GU9lhbh6BqC', 0, 1, 19, '2023-12-15 15:21:25', '2023-12-29 02:36:59'),
(20, 'AHIKPA ROGER DAGOU', ' ', '0', 'assets/img/users/pieces/2812997535444608.jpg', NULL, '0152401971', 0, 1, 0, NULL, '$2y$10$Nr2GrUKq.fTP6EPtCPnkUu/dGfiQT5hhCaXYvCHYzfgWVYPg0IuZC', 0, 1, 20, '2023-12-15 15:28:42', '2023-12-29 02:39:45'),
(21, 'AKOUMIA', 'DÉSIRÉ', '0', 'assets/img/users/pieces/5041894677787629.jpg', 'stevenakoumia2011@gmail.com', '0758819584', 1, 1, 0, NULL, '$2y$10$3lGjzTP8Y5Gs/tcg21N7IuCP8cuEbZc/X1.t/2rPLeYM8B/vi9thS', 0, 0, 21, '2023-12-15 17:04:13', '2023-12-15 17:04:13'),
(22, 'ASSI Félicien', ' ', '0', 'assets/img/users/pieces/7504936091073182.jpg', NULL, '0141903451', 0, 1, 0, NULL, '$2y$10$GAyYhs1XhUKAXPAJ40rxge1C2Nn6rM4XspWFpGOQPsqD.kak1U5RW', 0, 1, 22, '2023-12-15 19:25:05', '2023-12-29 02:45:42'),
(23, 'TAPA David', ' ', '0', 'assets/img/users/pieces/501845272285620.jpg', NULL, '0501295353', 0, 1, 0, NULL, '$2y$10$v9qqEACkqNp3u9A5ve73suIS9mKrKrCKvVWpyIbZEoPLTBB21YwBO', 0, 1, 23, '2023-12-15 20:06:05', '2023-12-29 02:51:55'),
(24, 'Sehi Joëlle', ' ', '0', 'assets/img/users/pieces/4190772256749214.jpg', NULL, '0779366345', 0, 1, 0, NULL, '$2y$10$87pg1AUn9Ey1jnIlxApCoO3TE0ceZMHSSHatZmV1RZ73wIGTDB6NO', 0, 1, 24, '2023-12-15 20:24:25', '2023-12-29 02:53:28'),
(25, 'N’GUESSAN Léonce', ' ', '0', 'assets/img/users/pieces/1702681041.jpg', NULL, '0140885508', 0, 1, 0, NULL, '$2y$10$WP/IfPeXGTiktZO5KGAOSeFDYP9QxX1QDjehh6TEL82.OYRbzEo5i', 0, 1, 25, '2023-12-15 21:57:21', '2023-12-29 02:58:48'),
(26, 'YAPO KEVIN AYMAR ROMUALD MINZAN', ' ', '0', 'assets/img/users/pieces/1702683151.png', NULL, '0757244602', 0, 1, 0, NULL, '$2y$10$jqnYEd0PYEzixQFivss07ecIrjc3Gq3UDWCzp9WRXfdMfo633etdC', 0, 0, 26, '2023-12-15 22:32:31', '2023-12-15 22:32:31'),
(27, 'Bosse Ange', ' ', '0', 'assets/img/users/pieces/1702683424.jpg', NULL, '0171137112', 0, 1, 0, NULL, '$2y$10$zXR6fRXe6A2zE/Zd5Sgvz.G30oMxhXWrxkD8TLz3fE.vQJYn/8x6q', 0, 1, 27, '2023-12-15 22:37:04', '2023-12-29 03:05:21'),
(28, 'OKA Franc', ' ', '0', 'assets/img/users/pieces/3642966458381791.jpg', NULL, '0703819073', 0, 1, 0, NULL, '$2y$10$VTWln0B5gqOR2siqPdO0Auc8jQDiqCCsRIAKivYuX1Olr95o9zijC', 0, 1, 28, '2023-12-15 22:49:24', '2023-12-29 03:09:02'),
(29, 'DJORO Adou Esaïe Jonathan', ' ', '0', 'assets/img/users/pieces/1702684653.jpg', NULL, '0788260424', 0, 1, 0, NULL, '$2y$10$ZxGgPbKNWnZBntB2AeI6ZO8VDECHywRwRfBWHmwlO0YczPtK2FRlS', 0, 1, 29, '2023-12-15 22:57:33', '2023-12-29 03:10:48'),
(30, 'OUALLO Nemlin Noël', ' ', '0', 'assets/img/users/pieces/1702685263.jpg', NULL, '0170901146', 0, 1, 0, NULL, '$2y$10$HfnTEoKNcDbp9eKGXi3vXucIn/AF56VIf8oWjwSiYBPM/Z3GnVf/.', 0, 0, 30, '2023-12-15 23:07:43', '2023-12-15 23:07:43'),
(31, 'CARTES MARIO', ' ', '0', 'assets/img/users/pieces/1702685477.jpg', NULL, '0749589201', 0, 1, 0, NULL, '$2y$10$py/DSSCKPlE5k/JlQkRzOezS2WO9UbHmxF929GYWM70o2QP90lmbq', 0, 0, 31, '2023-12-15 23:11:17', '2023-12-15 23:11:17'),
(32, 'Banse Benjamin', ' ', '0', 'assets/img/users/pieces/881221917542929.jpg', NULL, '0797233146', 0, 1, 0, NULL, '$2y$10$V2Ix5EpDZtpKMpAumvcJh.7cLax6JnltjFBfEx9VpwBoqEYvt9106', 0, 1, 32, '2023-12-15 23:14:43', '2023-12-29 03:16:44'),
(33, 'KELI BORIS', ' ', '0', 'assets/img/users/pieces/1702686809.jpg', NULL, '0778438513', 0, 1, 0, NULL, '$2y$10$l0m5oBOZydFNL.Z07/WdP.C2C4jIOLbcskCYPeSjEg6OvSsAs2M.e', 0, 0, 33, '2023-12-15 23:33:29', '2023-12-15 23:33:29'),
(34, 'Lago Salomon Fabrice', ' ', '0', 'assets/img/users/pieces/1702687518.jpg', NULL, '0709815775', 0, 1, 0, NULL, '$2y$10$KiNgadC.9MgdOb6LdAhbQuyi8MHXBP8CymKgBckSSWdrV1KcMAX3y', 0, 0, 34, '2023-12-15 23:45:18', '2023-12-15 23:45:18'),
(35, 'Dogbo Goffry Isaac Trésor', ' ', '0', 'assets/img/users/pieces/1702690779.jpg', NULL, '0586239318', 0, 1, 0, NULL, '$2y$10$ad.GvTT5CICrpVPWnhgIXeNo75sWAPki1LqqE8l1Vvx6oRphQm.A.', 0, 1, 35, '2023-12-16 00:39:39', '2023-12-29 04:28:05'),
(36, 'N\'GUESSAN ADJOUA FLORENCE', ' ', '0', 'assets/img/users/pieces/1702711720.jpg', NULL, '0707993749', 0, 1, 0, NULL, '$2y$10$flinQh55RyXFA38BQrf8SuDaBLNmYABuV7wS4hEYrURBVrUsClmYy', 0, 0, 36, '2023-12-16 06:28:41', '2023-12-16 06:28:41'),
(37, 'Sereme', 'Habib', '0', 'assets/img/users/pieces/9896626766837350.jpg', NULL, '0151838383', 0, 1, 0, NULL, '$2y$10$81UImEN3jM0d/0DGm/np0OFM5J48dm7FTaP0RYCafROwI/NtqenVm', 0, 1, 37, '2023-12-16 11:25:00', '2023-12-20 10:24:06'),
(38, 'Coulibaly', 'Soro Mohamed', '0', 'assets/img/users/pieces/5511163993920931.jpg', NULL, '0749908783', 0, 1, 0, NULL, '$2y$10$HK.K5bUvqqnm9aXUoUFKSepnOVT/Uze2MOjRcSu9TuoD8Zb6KD5yi', 0, 1, 38, '2023-12-19 07:55:09', '2023-12-29 03:49:22'),
(39, 'Kone', 'Cheick Mohamed', '0', 'assets/img/users/pieces/443134355451237.jpg', NULL, '0758142125', 0, 1, 0, NULL, '$2y$10$ulSDaG7Q/WVrcT5oPscnT.ISK.cf3RuJS5V8Jhzkn1yma3eU51wM6', 0, 1, 39, '2023-12-19 08:11:14', '2023-12-29 03:52:33'),
(40, 'Brou', 'N\'guessan Ayo Herman', '0', 'assets/img/users/pieces/157817777910200.jpg', NULL, '7068422589', 0, 1, 0, NULL, '$2y$10$SDzPfD82xJDPVX8OOBkKiuqXc7PyT4ULewgtpQKUS8RjofJocmcyK', 0, 0, 40, '2023-12-19 08:35:29', '2023-12-19 08:35:29'),
(41, 'Tano', 'Ange Patrick', '0', 'assets/img/users/pieces/4483859066370389.jpg', NULL, '0141176752', 0, 1, 0, NULL, '$2y$10$w8iJPVuMAhqWvRvjlfKJaOsRIMq2p4ClBbk7rWlb.Ge2KOWPQEoDm', 0, 1, 41, '2023-12-19 08:38:13', '2023-12-29 03:59:20'),
(42, 'Traore', 'Mohamed', '0', 'assets/img/users/pieces/9704290363220758.jpg', NULL, '0709024783', 0, 1, 0, NULL, '$2y$10$xaxFJxD9L.vKW.ipR0A0cOVkcCuoGIg3LsrC95..E7MOZWm89ewGe', 0, 1, 42, '2023-12-19 08:40:28', '2023-12-29 04:02:14'),
(43, 'Konan', 'Evariste', '0', 'assets/img/users/pieces/6458234091242813.jpg', NULL, '0777094325', 0, 1, 0, NULL, '$2y$10$G9M2Co1Y08inYgd/29T2ueVRaLphfQJ2zbSsatjSU4pKR2VJphX7K', 0, 1, 43, '2023-12-19 08:42:20', '2023-12-29 04:05:29'),
(44, 'Djoman', 'Junior', '0', 'assets/img/users/pieces/3366978430285906.jpg', NULL, '0704218340', 0, 1, 0, NULL, '$2y$10$4h9vRto8C3O8XxpjYe4pmuDxNpX5e6hz7hwvOMeTVzsvP9vvIF7QW', 0, 1, 44, '2023-12-19 08:43:51', '2023-12-29 04:09:06'),
(45, 'Bogui', 'Roland', '0', 'assets/img/users/pieces/9100352565525234.jpg', NULL, '0101486119', 0, 1, 0, NULL, '$2y$10$ZrFtLxWn3emOuHnGBvriT.PfmHV6J0hLZXDDoKC1OiwGVw68G2NDm', 0, 1, 45, '2023-12-19 08:46:08', '2023-12-29 04:11:45'),
(46, 'Koffi', 'Guy', '0', 'assets/img/users/pieces/4323569974843490.jpg', NULL, '0758381070', 0, 1, 0, NULL, '$2y$10$eOmvPQtBGBR5GuZ0Rf8fTuN7P/RYWLmQD7WYsECk3uPNk9K1Gr.QS', 0, 1, 46, '2023-12-19 08:48:30', '2023-12-29 04:14:02'),
(47, 'Bah', 'Olivier', '0', 'assets/img/users/pieces/9699710927360750.jpg', NULL, '0505480231', 0, 1, 0, NULL, '$2y$10$kUjGbeA/GuMgLjgI1HI1ruHvsPfUIiMO4AEn7KgaffKbQApdo0Bdq', 0, 1, 47, '2023-12-19 08:51:40', '2023-12-29 04:16:15'),
(48, 'Houenou', 'Tinoh', '0', 'assets/img/users/pieces/4887619366304688.jpg', NULL, '0707210937', 0, 1, 0, NULL, '$2y$10$IsxJLfgwBVXHH/aH.pIZuOiifszbz.kjqmZAyMhy1Eoxyg/2qcsvu', 0, 1, 48, '2023-12-19 08:53:42', '2023-12-29 04:18:07'),
(49, 'Gedeon', 'Aimé', '0', 'assets/img/users/pieces/4341760097999608.jpg', NULL, '0748994287', 0, 1, 0, NULL, '$2y$10$qfOzkJmPp3luM.anLaP8H.5pkLlZr3EunhTcP2SdkQqYw.tDRPKf2', 0, 1, 49, '2023-12-19 08:56:05', '2023-12-29 04:20:07'),
(50, 'Tourey', 'Celestin Everest', '0', 'assets/img/users/pieces/9687656490769333.jpg', NULL, '0777014352', 0, 1, 0, NULL, '$2y$10$rqAYrgcj7j/DvAOMyQOhcOP.PXFYuLpsr7dkSMbuMKR0iz9hngsC6', 0, 1, 50, '2023-12-19 08:57:45', '2023-12-29 04:21:58'),
(51, 'Kouassike', 'Sosthene', '0', 'assets/img/users/pieces/2625202735072883.jpg', NULL, '0709443350', 0, 1, 0, NULL, '$2y$10$hcsPVVv4Enmz.Nf0LVYLXOnd4uIDQnrd4hKI8iRezJjZLjpKZNvIy', 0, 1, 51, '2023-12-19 09:00:18', '2023-12-29 04:24:39'),
(52, 'Bedy', 'Emmanuel', '0', 'assets/img/users/pieces/7394276562099205.jpg', NULL, '0769527317', 0, 1, 0, NULL, '$2y$10$WImKQ6fTj6M7MIoLFe5nie4M0/JhxQKkZhOgXWWF4DijrI65dMhc2', 0, 1, 52, '2023-12-19 09:02:13', '2023-12-29 04:26:31'),
(53, 'Boga', 'Samuel', '0', 'assets/img/users/pieces/1849118228068132.jpg', NULL, '0749500502', 0, 1, 0, NULL, '$2y$10$xg5d0aZpEjXQfpr96JJBNeUFHJ/R71DT85BljB5cTWB156vP5EzUm', 0, 1, 53, '2023-12-19 09:18:58', '2023-12-29 04:32:22'),
(54, 'Oulai', 'Habib', '0', 'assets/img/users/pieces/1984438987820488.jpg', NULL, '0757697555', 0, 1, 0, NULL, '$2y$10$MmiH0z32YUkjUJDY8M7DKuZ8DfDlpniyygIOogSpaAV57MIpuTQrO', 0, 1, 54, '2023-12-19 09:22:50', '2023-12-29 04:35:46'),
(55, 'Toe', 'Désiré Abdoul Rasak', '0', 'assets/img/users/pieces/4295208484168105.jpg', NULL, '0769214535', 0, 1, 0, NULL, '$2y$10$MeEvRkCiy2NFsvgsAGJPDO9GenXUyJzWLQ2E1vGc9vsfX.4fkP8r2', 0, 1, 55, '2023-12-19 09:25:42', '2023-12-29 04:38:23'),
(56, 'Lawson', 'Ange Michel', '0', 'assets/img/users/pieces/5683091040079679.jpg', NULL, '0778341044', 0, 1, 0, NULL, '$2y$10$RsP2q8u67TABQUkIrx9uVew7JZjRUOA9lOw92rLmYICBLlw1Hzh9a', 0, 1, 56, '2023-12-19 09:27:15', '2023-12-29 04:41:21'),
(57, 'Zambe', 'Bi Boti David', '0', 'assets/img/users/pieces/6822825787173603.jpg', NULL, '0757678528', 0, 1, 0, NULL, '$2y$10$FFY0UWAtfDV6W7x1NodDpuZYjLo0nQKBfzZwyv4AScL3UCkk/RpI6', 0, 1, 57, '2023-12-19 09:32:05', '2023-12-29 04:46:42'),
(58, 'Bogui', 'Lobognon Bohue Patrick', '0', 'assets/img/users/pieces/405805635035665.jpg', NULL, '0500500194', 0, 1, 0, NULL, '$2y$10$rW1co5nESrwd03/73JPt7OB29Wh5EkFT8fCoLbLNTqUXqdZJaNE8C', 0, 1, 58, '2023-12-19 09:34:21', '2023-12-29 04:49:12'),
(59, 'Brou', 'Nguessan Ayo Herman', '0', 'assets/img/users/pieces/5452865637962780.jpg', NULL, '0768422589', 0, 1, 0, NULL, '$2y$10$11JSKEuCzn3goMUjdz/zPuZ5tUo2U3vc4WFpCnJue7EqRcRC3l2ea', 0, 1, 59, '2023-12-19 10:10:03', '2023-12-29 03:58:15'),
(60, 'test', 'test', '0', 'assets/img/users/pieces/1265806201182911.jpg', NULL, '0101004521', 0, 1, 0, NULL, '$2y$10$UJSf6ej1FC/IrvEtmRuB1uUtj/Tsb4phfi8qG/dA4XeGdplHxZdO2', 0, 0, 60, '2023-12-20 07:53:22', '2023-12-20 07:53:22'),
(61, 'dez', 'cafe', '0', 'assets/img/users/pieces/9169524063911442.jpg', NULL, '0100000010', 0, 1, 0, NULL, '$2y$10$TLedFF5TMvreD9pjDgYRvuxvNqpPGgfFDkdN3I3SfurpTQ6Xqi0Ce', 0, 1, 61, '2023-12-20 10:41:26', '2023-12-20 10:42:52'),
(62, 'tetB', 'ttyt', '0', 'assets/img/users/pieces/2542221950443368.jpg', NULL, '4444444444', 0, 1, 0, NULL, '$2y$10$uRqgnm687rhiBEqsKrUDwOVCSjtiRxBEYfBQf8Nx.zXwkKfpIpVjW', 0, 1, 62, '2023-12-20 11:27:54', '2023-12-20 13:31:39'),
(63, 'ttt', 'ttyyy', '0', 'assets/img/users/pieces/5428542160993701.jpg', NULL, '6666666666', 0, 1, 0, NULL, '$2y$10$uGkp2cMXpVsNkuEdLh5IqOY01qRCjztm0J0RBz9EJ550bCnaJEW.i', 0, 0, 63, '2023-12-20 11:34:34', '2023-12-20 11:34:34'),
(64, 'Konan', 'Emeric', '0', 'assets/img/users/pieces/3105643081632906.jpg', NULL, '0141207043', 0, 1, 0, NULL, '$2y$10$q08oamWyRr2Og353Xp5tuuIp.4ttFzUAjpLsRGhniamYdvmRtwXBy', 0, 0, 64, '2023-12-20 11:37:32', '2023-12-20 11:37:32'),
(65, 'ttrre', 'uusbd', '0', 'assets/img/users/pieces/884556836770311.jpg', NULL, '3535353535', 0, 1, 0, NULL, '$2y$10$.2i/1nLFAr1t7pBOuIDvPOXpl42L6ODHU3V613LrwCUYaw7wtBAVy', 0, 1, 65, '2023-12-20 11:56:11', '2023-12-20 11:56:11'),
(66, 'ttrre', 'uusbd', '0', 'assets/img/users/pieces/4323343155507892.jpg', NULL, '3535353536', 0, 1, 0, NULL, '$2y$10$dy7cYQfoIE7Q0L1zz9CR5ePqbIy6EkUDWycE8Ds6EDHETlriW0GE6', 0, 1, 66, '2023-12-20 11:59:07', '2023-12-20 11:59:07'),
(67, 'ppl', 'hhduej', '0', 'assets/img/users/pieces/3816766015545931.jpg', NULL, '1113332225', 0, 1, 0, NULL, '$2y$10$YKzQgbYNjIJD5euR/Sogzusu7yrv74FzNpIVdcmtQsPSVpyG/z99C', 0, 1, 67, '2023-12-20 12:06:31', '2023-12-20 12:06:31'),
(68, 'ppl', 'hhduej', '0', 'assets/img/users/pieces/8084159250699742.jpg', NULL, '1113332226', 0, 1, 0, NULL, '$2y$10$aBrHTrR2vi42/LyUz7/DPOvmMHpT0ZH2P3Kiz4/2jdBGqRuUqQ7V2', 0, 1, 68, '2023-12-20 12:08:41', '2023-12-20 12:08:41'),
(69, 'ppl', 'hhduej', '0', 'assets/img/users/pieces/7637448131540058.jpg', NULL, '1113332229', 0, 1, 0, NULL, '$2y$10$Gcok8tBrvhpzBucNmDThr.0B2M4E7swEBLSWGbbad1ivvz84eUCuy', 0, 1, 69, '2023-12-20 12:09:09', '2023-12-21 01:00:00'),
(70, 'bahonto', 'simone', '0', 'assets/img/users/pieces/9072512218774408.jpg', NULL, '0778020759', 0, 1, 0, NULL, '$2y$10$8vdwjxNsKEeucBAsgMUqj.1.XMWIFN1TUfush5fjEVwpW78GFZYQm', 0, 0, 70, '2023-12-20 12:58:38', '2023-12-20 12:58:38'),
(71, 'test', 'Habib epargn', '0', 'assets/img/users/pieces/3259953788754913.jpg', NULL, '2233223322', 0, 1, 0, NULL, '$2y$10$YjBe37OjTiRbU0WeNoxz2ubR7pbBprM9TGUFghzUTW04QBM6B9XGi', 0, 1, 71, '2023-12-21 01:04:27', '2023-12-21 01:04:27'),
(72, 'test', 'Habib epargn', '0', 'assets/img/users/pieces/6944956191486836.jpg', NULL, '2525252525', 0, 1, 0, NULL, '$2y$10$yC/rgG6gLtK.kPcOVjcLkOMl1dud3GCKTXYlG3MClnHt50yoPF3jG', 0, 1, 72, '2023-12-21 01:05:07', '2023-12-21 01:05:07'),
(73, 'bon', 'bout', '0', 'assets/img/users/pieces/9619284994820434.jpg', NULL, '0787273597', 0, 1, 0, NULL, '$2y$10$E.5uZ/DgBS9Z/Fzm0r3BcOydzb85iIjZH3uBmqeXQBEZre4M623gy', 0, 1, 73, '2023-12-21 07:20:15', '2023-12-21 07:20:15'),
(74, 'bon', 'bout', '0', 'assets/img/users/pieces/156471048139055.jpg', NULL, '0140011814', 0, 1, 0, NULL, '$2y$10$zaZD1HlNo1hPfqUtMDLoFenPyW7XvScRnh/lhRVVOjzf0YsDA.yJa', 0, 1, 74, '2023-12-21 07:20:55', '2023-12-21 07:20:55'),
(75, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/5203628854233570.jpg', NULL, '9988888888', 0, 1, 0, NULL, '$2y$10$KLR4mcuCdNa3H7dKGRbngeQGaaSnJUDYU9jxTJZ9XYKc8K42svwiW', 0, 1, 75, '2023-12-21 09:27:54', '2023-12-21 09:27:54'),
(76, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/9540560777895292.jpg', NULL, '9988888877', 0, 1, 0, NULL, '$2y$10$jjoADBAvs4HwChbyz5N5mO4Weabj/bNr59ZI7pjc3ikkRhv.zsyWu', 0, 1, 76, '2023-12-21 09:38:36', '2023-12-21 09:38:36'),
(77, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/955796022031759.jpg', NULL, '9988888866', 0, 1, 0, NULL, '$2y$10$W7h0ZlNEfbiNykinoHQ7qeusE7SstbwXXnM4UxrB2x7sugRED/lLa', 0, 1, 77, '2023-12-21 09:39:16', '2023-12-21 09:39:16'),
(78, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/6579247458361615.jpg', NULL, '9988888855', 0, 1, 0, NULL, '$2y$10$lI7BR6OXJjaXC3G9a3jhBOMh3P9KieP4h860NchgI7dvPPEoagMWi', 0, 1, 78, '2023-12-21 09:40:56', '2023-12-21 09:40:56'),
(79, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/2766000949307556.jpg', NULL, '9988888833', 0, 1, 0, NULL, '$2y$10$P3v4mbQZ6BpZd7u7DzNFauBsdYWgQrHHS4HyCJw6U.Skj54..DSsa', 0, 1, 79, '2023-12-21 09:44:33', '2023-12-21 09:44:33'),
(80, 'eeeee', 'eeeee', '0', 'assets/img/users/pieces/14434846291195.jpg', NULL, '9988888822', 0, 1, 0, NULL, '$2y$10$3d9vkwzjIwpgpDSxbkyhWOP3niC6GvbWgUql7dvshq6bJQ6LD/uuS', 0, 1, 80, '2023-12-21 09:48:45', '2023-12-21 09:48:45'),
(81, 'kkkkkk', 'kkkkkkkkkkkk', '0', 'assets/img/users/pieces/1683146648451549.jpg', NULL, '4444444111', 0, 1, 0, NULL, '$2y$10$KjlOF1PPxoS9m19PBRf2SuWHvrdxDP2KQe.M3Dh8t7PvjR.trRrL2', 0, 1, 81, '2023-12-21 09:52:56', '2023-12-21 09:52:56'),
(82, 'kkkkkk', 'kkkkkkkkkkkk', '0', 'assets/img/users/pieces/2895903420879964.jpg', NULL, '4444444222', 0, 1, 0, NULL, '$2y$10$OeSdodp3TUdrSmz.L1KPt.euOOi7QdBzNs.Jy9ogxyj/ZSlJCnAvu', 0, 1, 82, '2023-12-21 09:55:14', '2023-12-21 09:55:14'),
(83, 'kkkkkk', 'kkkkkkkkkkkk', '0', 'assets/img/users/pieces/6663903241829935.jpg', NULL, '4444444333', 0, 1, 0, NULL, '$2y$10$XIlw2zR6GJCvZUESnAB8JOqKQLUlHC3Si5q2fZtxZZdkzjVrH69Qa', 0, 1, 83, '2023-12-21 09:55:28', '2023-12-21 09:55:28'),
(84, 'kkkkkk', 'kkkkkkkkkkkk', '0', 'assets/img/users/pieces/1644868456102027.jpg', NULL, '4444444555', 0, 1, 0, NULL, '$2y$10$x.dAFU524YyxsU7XzXU3PeKCacfCLeE5pTa8W8RdEfWStaYRv7oX.', 0, 1, 84, '2023-12-21 09:59:56', '2023-12-21 10:11:45'),
(85, 'Douon', 'Manou', '0', 'assets/img/users/pieces/8242201470871817.jpg', NULL, '0708385267', 0, 1, 0, NULL, '$2y$10$j88gZ1nUus5DwXMPzldqQuQFSRUwpDFpPolA.umOoH/xuXttusRvS', 0, 1, 85, '2023-12-21 16:01:58', '2023-12-21 16:01:58'),
(86, 'GOETI', 'BI IRIE MAXIME', '0', 'assets/img/users/pieces/4220048622707243.jpg', NULL, '0140902924', 0, 1, 0, NULL, '$2y$10$igQZM60eeLcObsE.DvnXZuNlCK1mcGgnNCEUsbeY6UnQRvn4FKgCe', 0, 1, 86, '2023-12-22 00:37:52', '2023-12-29 02:48:30'),
(87, 'KOUASSI', 'KOUADIO EZECHIEL', '0', 'assets/img/users/pieces/794870104403069.jpg', NULL, '0585052456', 0, 1, 0, NULL, '$2y$10$XvPCqeRRxE8jKdQsUtiQUOxUaxxWdg5DmslzhKuoQ6N5CaVafnfXm', 0, 1, 87, '2023-12-22 01:13:15', '2023-12-29 03:18:49'),
(88, 'LOBOGNON', 'JEAN CLAUDE', '0', 'assets/img/users/pieces/4937149051468101.jpg', NULL, '0172137201', 0, 1, 0, NULL, '$2y$10$eiPcFfOUGr4.6IRcJoRdTuWNJGteDudRpt87IQ8xSc8bnfmdoL6Zq', 0, 1, 88, '2023-12-22 01:21:40', '2023-12-29 03:13:26'),
(89, 'LOUKOU', 'SERGES ISRAEL', '0', 'assets/img/users/pieces/6155157222185541.jpg', NULL, '0160703160', 0, 1, 0, NULL, '$2y$10$aBCsu0AMmv3x1ywqsI.Vgue9Q4sdba1kINLbZi/XQE.GPNBqGeSGC', 0, 1, 89, '2023-12-22 01:26:16', '2023-12-29 02:42:10'),
(90, 'Bessou', 'Didier', '0', 'assets/img/users/pieces/9630028845279758.jpg', NULL, '0778227032', 0, 1, 0, NULL, '$2y$10$tlzPBYSYf3hGmtEniIpwFeLRhGphEL7FBAT6iImeLsxuo/rMYIdxO', 0, 1, 90, '2023-12-28 16:13:54', '2023-12-28 16:13:54'),
(91, 'Dodo', 'Hermann', '0', 'assets/img/users/pieces/1560427177969157.jpg', NULL, '0748717191', 0, 1, 0, NULL, '$2y$10$y/g.Vg6oOQdvWNxS5ZOABejoUyYzVGQwq7IX3Xd/QAH6S/av55Vxi', 0, 1, 91, '2024-01-06 08:32:04', '2024-01-06 08:32:04'),
(92, 'AZEMA', 'YANN', '0', 'assets/img/users/pieces/580245889434733.jpg', NULL, '0748408743', 0, 1, 0, NULL, '$2y$10$LWDh5IVFJvj/hnxXXIPT.edhOQBrtJhn6iBqS6ikhQsnLSs9zX4N.', 0, 1, 92, '2024-01-09 11:55:55', '2024-01-09 11:55:55'),
(93, 'dez', 'la koka', '0', 'assets/img/users/pieces/2213224458264224.jpg', NULL, '0700000001', 0, 1, 0, NULL, '$2y$10$G72gmzdBde8s5vRYrtmJyuNP8wfBGd0YLVd.YtYbq86W1zFvMVTPa', 0, 1, 93, '2024-01-10 09:56:42', '2024-01-10 09:56:42'),
(94, 'Konan', 'Emeric', '0', 'assets/img/users/pieces/9005355163340122.jpg', NULL, '0141204043', 0, 1, 0, NULL, '$2y$10$s5zNuhyq1XhBqRNRT3lx.um/fxlygstX.lIFUYG/qP8sDDfbnsk0a', 0, 1, 94, '2024-01-10 19:01:37', '2024-01-10 19:01:37'),
(95, 'Zamble', 'Yao Sanhou Elvis Privat', '0', 'assets/img/users/pieces/9211112102340972.jpg', NULL, '0777062680', 0, 1, 0, NULL, '$2y$10$t/IAhA3mIO/33b9/8m1Q4.k3qtu710WURC5Ue6E.ESH/nq5ooa3GG', 0, 1, 95, '2024-01-21 22:21:39', '2024-01-21 22:21:40'),
(96, 'Ello', 'Cedric', '0', 'assets/img/users/pieces/6733227394961190.jpg', NULL, '0101060912', 0, 1, 0, NULL, '$2y$10$0v9sYn5fow/c17BmZtGHyudsm2HTM8EvbcgY0fl05p9bbHEJ.zk.S', 0, 1, 96, '2024-01-22 08:07:02', '2024-01-22 08:07:02'),
(97, 'Malahoua', 'kouakou yannick oscar', '0', 'assets/img/users/pieces/6922204018272947.jpg', NULL, '0709213585', 0, 1, 0, NULL, '$2y$10$/kZif00tOqrtSWICDvZs1OIEktDfzpiHt63nF0Tqn2peBRvg.kR9S', 0, 1, 97, '2024-01-22 10:14:10', '2024-01-22 10:14:11'),
(98, 'OKOU', 'Jean Yves kouassi', '0', 'assets/img/users/pieces/4922274247520707.jpg', NULL, '0787382498', 0, 1, 0, NULL, '$2y$10$ztlc7H2sHAU1W9ZHjfsQk..f6GxWNWE1EtXSVuRnP78KH7Qfh9aVK', 0, 1, 98, '2024-01-22 12:11:07', '2024-01-22 12:11:07'),
(99, 'Ouattara', 'Karim', '0', 'assets/img/users/pieces/9486294347685878.jpg', NULL, '0566837675', 0, 1, 0, NULL, '$2y$10$oSHrxW./wgtQ6vT38UaEKuiFkvREZ468VGlhELxDC8ibVVI4GKKOe', 0, 1, 99, '2024-01-22 12:31:16', '2024-01-22 12:31:16'),
(100, 'djoman', 'salomon', '0', 'assets/img/users/pieces/4381657464665540.jpg', NULL, '0103969427', 0, 1, 0, NULL, '$2y$10$G8aBato2Bkw/fU3S9Z8l1.EVq6C4V3aBkns3KZgdGmqo9OK8yv4QG', 0, 1, 100, '2024-01-22 13:51:55', '2024-01-22 13:51:55'),
(101, 'MALAHOUA', 'KOUAKOU DERRICK ELCAR', '0', 'assets/img/users/pieces/9455954979874907.jpg', NULL, '0749609888', 0, 1, 0, NULL, '$2y$10$3nFk3NSNjBQfbjt5NBA1zOf0q3X0FvqowVMhHG0cK5gDr3LMtuQte', 0, 1, 101, '2024-01-22 16:10:28', '2024-01-22 16:10:29'),
(102, 'malahoua', 'eunice', '0', 'assets/img/users/pieces/1596024403889875.jpg', NULL, '0788501107', 0, 1, 0, NULL, '$2y$10$wwBpw0N.qa.VL6sghbwx9OSipPVvEIg/VMKKTFOSaJ0m4oBoUlNmu', 0, 1, 102, '2024-01-22 19:41:21', '2024-01-22 19:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `ebank_transactions`
--

DROP TABLE IF EXISTS `ebank_transactions`;
CREATE TABLE IF NOT EXISTS `ebank_transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ebank_profil_id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `is_retrait` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ebank_transactions_ebank_profil_id_foreign` (`ebank_profil_id`),
  KEY `ebank_transactions_transaction_id_foreign` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epargne_accounts`
--

DROP TABLE IF EXISTS `epargne_accounts`;
CREATE TABLE IF NOT EXISTS `epargne_accounts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ebank_profil_id` bigint UNSIGNED NOT NULL,
  `debut_epargne` date NOT NULL DEFAULT '2023-12-14',
  `fin_epargne` date NOT NULL DEFAULT '2023-12-14',
  `balance` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount_freeze` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epargne_accounts_ebank_profil_id_foreign` (`ebank_profil_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `epargne_accounts`
--

INSERT INTO `epargne_accounts` (`id`, `ebank_profil_id`, `debut_epargne`, `fin_epargne`, `balance`, `amount_freeze`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-14', '2023-12-14', '0', '0', '2023-12-20 08:01:12', '2023-12-20 08:01:12'),
(2, 37, '2023-12-14', '2023-12-14', '0', '0', '2023-12-20 10:24:06', '2023-12-20 10:24:06'),
(3, 61, '2023-12-14', '2023-12-14', '0', '0', '2023-12-20 10:42:52', '2023-12-20 10:42:52'),
(4, 62, '2023-12-14', '2023-12-14', '0', '0', '2023-12-20 13:31:39', '2023-12-20 13:31:39'),
(5, 69, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 01:00:00', '2023-12-21 01:00:00'),
(6, 79, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:44:33', '2023-12-21 09:44:33'),
(7, 80, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:48:45', '2023-12-21 09:48:45'),
(8, 81, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:52:56', '2023-12-21 09:52:56'),
(9, 82, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:55:14', '2023-12-21 09:55:14'),
(10, 83, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:55:28', '2023-12-21 09:55:28'),
(11, 84, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 09:59:56', '2023-12-21 09:59:56'),
(12, 85, '2023-12-14', '2023-12-14', '0', '0', '2023-12-21 16:01:58', '2023-12-21 16:01:58'),
(13, 86, '2023-12-14', '2023-12-14', '0', '0', '2023-12-22 00:37:52', '2023-12-22 00:37:52'),
(14, 87, '2023-12-14', '2023-12-14', '0', '0', '2023-12-22 01:13:15', '2023-12-22 01:13:15'),
(15, 88, '2023-12-14', '2023-12-14', '0', '0', '2023-12-22 01:21:40', '2023-12-22 01:21:40'),
(16, 89, '2023-12-14', '2023-12-14', '0', '0', '2023-12-22 01:26:16', '2023-12-22 01:26:16'),
(17, 16, '2023-12-14', '2023-12-14', '0', '0', '2023-12-27 09:22:15', '2023-12-27 09:22:15'),
(18, 90, '2023-12-14', '2023-12-14', '0', '0', '2023-12-28 16:13:54', '2023-12-28 16:13:54'),
(19, 9, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:11:15', '2023-12-29 02:11:15'),
(20, 10, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:15:19', '2023-12-29 02:15:19'),
(21, 12, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:20:08', '2023-12-29 02:20:08'),
(22, 13, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:23:51', '2023-12-29 02:23:51'),
(23, 15, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:26:45', '2023-12-29 02:26:45'),
(24, 17, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:30:01', '2023-12-29 02:30:01'),
(25, 18, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:31:22', '2023-12-29 02:31:22'),
(26, 19, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:36:59', '2023-12-29 02:36:59'),
(27, 20, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:39:13', '2023-12-29 02:39:13'),
(28, 22, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:44:35', '2023-12-29 02:44:35'),
(29, 23, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:51:55', '2023-12-29 02:51:55'),
(30, 24, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:53:28', '2023-12-29 02:53:28'),
(31, 25, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 02:58:48', '2023-12-29 02:58:48'),
(32, 27, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:05:21', '2023-12-29 03:05:21'),
(33, 28, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:09:02', '2023-12-29 03:09:02'),
(34, 29, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:10:48', '2023-12-29 03:10:48'),
(35, 32, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:15:36', '2023-12-29 03:15:36'),
(36, 38, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:49:22', '2023-12-29 03:49:22'),
(37, 39, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:51:50', '2023-12-29 03:51:50'),
(38, 59, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:58:15', '2023-12-29 03:58:15'),
(39, 41, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 03:59:20', '2023-12-29 03:59:20'),
(40, 42, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:02:14', '2023-12-29 04:02:14'),
(41, 43, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:05:29', '2023-12-29 04:05:29'),
(42, 44, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:06:45', '2023-12-29 04:06:45'),
(43, 45, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:11:45', '2023-12-29 04:11:45'),
(44, 46, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:12:48', '2023-12-29 04:12:48'),
(45, 47, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:15:25', '2023-12-29 04:15:25'),
(46, 48, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:17:32', '2023-12-29 04:17:32'),
(47, 49, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:20:07', '2023-12-29 04:20:07'),
(48, 50, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:21:58', '2023-12-29 04:21:58'),
(49, 51, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:23:50', '2023-12-29 04:23:50'),
(50, 52, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:25:50', '2023-12-29 04:25:50'),
(51, 35, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:28:05', '2023-12-29 04:28:05'),
(52, 53, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:31:34', '2023-12-29 04:31:34'),
(53, 54, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:35:46', '2023-12-29 04:35:46'),
(54, 55, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:38:23', '2023-12-29 04:38:23'),
(55, 56, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:40:51', '2023-12-29 04:40:51'),
(56, 57, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:45:20', '2023-12-29 04:45:20'),
(57, 58, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:48:07', '2023-12-29 04:48:07'),
(58, 4, '2023-12-14', '2023-12-14', '0', '0', '2023-12-29 04:53:31', '2023-12-29 04:53:31'),
(59, 91, '2023-12-14', '2023-12-14', '0', '0', '2024-01-06 08:32:04', '2024-01-06 08:32:04'),
(60, 92, '2023-12-14', '2023-12-14', '0', '0', '2024-01-09 11:55:55', '2024-01-09 11:55:55'),
(61, 93, '2023-12-14', '2023-12-14', '0', '0', '2024-01-10 09:56:42', '2024-01-10 09:56:42'),
(62, 94, '2023-12-14', '2023-12-14', '0', '0', '2024-01-10 19:01:37', '2024-01-10 19:01:37'),
(63, 11, '2023-12-14', '2023-12-14', '0', '0', '2024-01-16 03:50:24', '2024-01-16 03:50:24'),
(64, 95, '2023-12-14', '2023-12-14', '0', '0', '2024-01-21 22:21:40', '2024-01-21 22:21:40'),
(65, 96, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 08:07:02', '2024-01-22 08:07:02'),
(66, 97, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 10:14:11', '2024-01-22 10:14:11'),
(67, 98, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 12:11:07', '2024-01-22 12:11:07'),
(68, 99, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 12:31:16', '2024-01-22 12:31:16'),
(69, 100, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 13:51:55', '2024-01-22 13:51:55'),
(70, 101, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 16:10:29', '2024-01-22 16:10:29'),
(71, 102, '2023-12-14', '2023-12-14', '0', '0', '2024-01-22 19:41:21', '2024-01-22 19:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `epargne_transactions`
--

DROP TABLE IF EXISTS `epargne_transactions`;
CREATE TABLE IF NOT EXISTS `epargne_transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_retrait` tinyint(1) DEFAULT '0',
  `epargne_account_id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epargne_transactions_epargne_account_id_foreign` (`epargne_account_id`),
  KEY `epargne_transactions_transaction_id_foreign` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `place_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_place_id_index` (`place_id`)
) ENGINE=MyISAM AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `url`, `created_at`, `updated_at`, `place_id`) VALUES
(1, 'assets/img/places/657bf3c111ebe.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(2, 'assets/img/places/657bf3c113485.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(3, 'assets/img/places/657bf3c11392b.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(4, 'assets/img/places/657bf3c113dfe.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(5, 'assets/img/places/657bf3c114204.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(6, 'assets/img/places/657bf3c114606.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(7, 'assets/img/places/657bf3c114a49.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(8, 'assets/img/places/657bf3c114ef7.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(9, 'assets/img/places/657bf3c115382.jpg', '2023-12-15 05:35:45', '2023-12-15 05:35:45', 1),
(10, 'assets/img/places/657bf943ec0d4.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(11, 'assets/img/places/657bf943ec8cd.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(12, 'assets/img/places/657bf943ecf53.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(13, 'assets/img/places/657bf943ed5de.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(14, 'assets/img/places/657bf943edc3c.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(15, 'assets/img/places/657bf943ee1df.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(16, 'assets/img/places/657bf943ee7f3.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(17, 'assets/img/places/657bf943eeed0.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(18, 'assets/img/places/657bf943ef4ca.jpg', '2023-12-15 05:59:15', '2023-12-15 05:59:15', 2),
(19, 'assets/img/places/657c02db48f94.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(20, 'assets/img/places/657c02db496e9.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(21, 'assets/img/places/657c02db49d2a.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(22, 'assets/img/places/657c02db4a330.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(23, 'assets/img/places/657c02db4a96b.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(24, 'assets/img/places/657c02db4afb9.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(25, 'assets/img/places/657c02db4b65e.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(26, 'assets/img/places/657c02db4bc48.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(27, 'assets/img/places/657c02db4c17c.jpg', '2023-12-15 06:40:11', '2023-12-15 06:40:11', 3),
(28, 'assets/img/places/657c06fbde513.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(29, 'assets/img/places/657c06fbdeaed.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(30, 'assets/img/places/657c06fbdf114.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(31, 'assets/img/places/657c06fbdf5c6.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(32, 'assets/img/places/657c06fbdfa68.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(33, 'assets/img/places/657c06fbdff25.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(34, 'assets/img/places/657c06fbe0414.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(35, 'assets/img/places/657c06fbe08a7.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(36, 'assets/img/places/657c06fbe0d9d.jpg', '2023-12-15 06:57:47', '2023-12-15 06:57:47', 4),
(37, 'assets/img/places/657c07ab7f463.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(38, 'assets/img/places/657c07ab7fb68.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(39, 'assets/img/places/657c07ab802c0.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(40, 'assets/img/places/657c07ab809ef.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(41, 'assets/img/places/657c07ab80fe7.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(42, 'assets/img/places/657c07ab81704.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(43, 'assets/img/places/657c07ab81c6e.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(44, 'assets/img/places/657c07ab82325.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(45, 'assets/img/places/657c07ab8298c.jpg', '2023-12-15 07:00:43', '2023-12-15 07:00:43', 5),
(46, 'assets/img/places/657c0c42f0be3.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(47, 'assets/img/places/657c0c42f13cc.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(48, 'assets/img/places/657c0c42f1a43.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(49, 'assets/img/places/657c0c42f1f82.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(50, 'assets/img/places/657c0c42f2482.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(51, 'assets/img/places/657c0c42f29c2.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(52, 'assets/img/places/657c0c42f2fb4.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(53, 'assets/img/places/657c0c42f3585.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(54, 'assets/img/places/657c0c42f3b7d.jpg', '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(55, 'assets/img/places/657c0e9cdcbc8.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(56, 'assets/img/places/657c0e9cdd2ca.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(57, 'assets/img/places/657c0e9cdd750.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(58, 'assets/img/places/657c0e9cddc21.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(59, 'assets/img/places/657c0e9cde141.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(60, 'assets/img/places/657c0e9cde5f7.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(61, 'assets/img/places/657c0e9cdeb00.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(62, 'assets/img/places/657c0e9cdf055.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(63, 'assets/img/places/657c0e9cdf48e.jpg', '2023-12-15 07:30:20', '2023-12-15 07:30:20', 7),
(64, 'assets/img/places/657c11753c797.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(65, 'assets/img/places/657c11753cf03.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(66, 'assets/img/places/657c11753d3ef.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(67, 'assets/img/places/657c11753d826.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(68, 'assets/img/places/657c11753dcae.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(69, 'assets/img/places/657c11753e1bf.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(70, 'assets/img/places/657c11753e6ee.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(71, 'assets/img/places/657c11753ebac.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(72, 'assets/img/places/657c11753efe2.jpg', '2023-12-15 07:42:29', '2023-12-15 07:42:29', 8),
(73, 'assets/img/places/657c12a69d2f6.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(74, 'assets/img/places/657c12a69da86.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(75, 'assets/img/places/657c12a69e07e.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(76, 'assets/img/places/657c12a69e5a0.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(77, 'assets/img/places/657c12a69eaff.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(78, 'assets/img/places/657c12a69efba.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(79, 'assets/img/places/657c12a69f4a3.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(80, 'assets/img/places/657c12a69f9b3.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(81, 'assets/img/places/657c12a69fe51.jpg', '2023-12-15 07:47:34', '2023-12-15 07:47:34', 9),
(82, 'assets/img/places/657c155c248c9.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(83, 'assets/img/places/657c155c2529f.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(84, 'assets/img/places/657c155c259c4.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(85, 'assets/img/places/657c155c25fd3.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(86, 'assets/img/places/657c155c266d3.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(87, 'assets/img/places/657c155c26c2d.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(88, 'assets/img/places/657c155c271c5.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(89, 'assets/img/places/657c155c27755.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(90, 'assets/img/places/657c155c27d21.jpg', '2023-12-15 07:59:08', '2023-12-15 07:59:08', 10),
(91, 'assets/img/places/657c18c023698.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(92, 'assets/img/places/657c18c024000.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(93, 'assets/img/places/657c18c0246a6.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(94, 'assets/img/places/657c18c024c9d.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(95, 'assets/img/places/657c18c025233.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(96, 'assets/img/places/657c18c0258aa.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(97, 'assets/img/places/657c18c025ee5.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(98, 'assets/img/places/657c18c02653d.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(99, 'assets/img/places/657c18c026b30.jpg', '2023-12-15 08:13:36', '2023-12-15 08:13:36', 11),
(100, 'assets/img/places/657c1c8f4174c.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(101, 'assets/img/places/657c1c8f41f1c.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(102, 'assets/img/places/657c1c8f42486.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(103, 'assets/img/places/657c1c8f429fc.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(104, 'assets/img/places/657c1c8f42fc2.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(105, 'assets/img/places/657c1c8f434fd.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(106, 'assets/img/places/657c1c8f43a39.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(107, 'assets/img/places/657c1c8f43ffd.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(108, 'assets/img/places/657c1c8f4451d.jpg', '2023-12-15 08:29:51', '2023-12-15 08:29:51', 12),
(109, 'assets/img/places/657c1c905ee2c.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(110, 'assets/img/places/657c1c905f51f.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(111, 'assets/img/places/657c1c905fb0e.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(112, 'assets/img/places/657c1c90600db.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(113, 'assets/img/places/657c1c9060619.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(114, 'assets/img/places/657c1c9060ae2.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(115, 'assets/img/places/657c1c9060fa4.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(116, 'assets/img/places/657c1c906144d.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(117, 'assets/img/places/657c1c90618b1.jpg', '2023-12-15 08:29:52', '2023-12-15 08:29:52', 13),
(118, 'assets/img/places/657c1ec72faf4.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(119, 'assets/img/places/657c1ec7303fb.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(120, 'assets/img/places/657c1ec730aa4.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(121, 'assets/img/places/657c1ec731089.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(122, 'assets/img/places/657c1ec7352ae.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(123, 'assets/img/places/657c1ec735994.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(124, 'assets/img/places/657c1ec735eba.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(125, 'assets/img/places/657c1ec7363a0.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(126, 'assets/img/places/657c1ec73686b.jpg', '2023-12-15 08:39:19', '2023-12-15 08:39:19', 14),
(127, 'assets/img/places/657c320754385.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(128, 'assets/img/places/657c320754d3b.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(129, 'assets/img/places/657c320755515.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(130, 'assets/img/places/657c320755cb7.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(131, 'assets/img/places/657c3207563de.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(132, 'assets/img/places/657c320756a43.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(133, 'assets/img/places/657c320756f79.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(134, 'assets/img/places/657c320758275.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(135, 'assets/img/places/657c3207587bd.jpg', '2023-12-15 10:01:27', '2023-12-15 10:01:27', 15),
(136, 'assets/img/places/657c35a6008b4.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(137, 'assets/img/places/657c35a601190.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(138, 'assets/img/places/657c35a60171f.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(139, 'assets/img/places/657c35a601d16.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(140, 'assets/img/places/657c35a602288.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(141, 'assets/img/places/657c35a602857.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(142, 'assets/img/places/657c35a602cfe.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(143, 'assets/img/places/657c35a6032d4.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(144, 'assets/img/places/657c35a60379a.jpg', '2023-12-15 10:16:54', '2023-12-15 10:16:54', 16),
(145, 'assets/img/places/657c39b8a2e6b.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(146, 'assets/img/places/657c39b8a3569.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(147, 'assets/img/places/657c39b8a3acd.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(148, 'assets/img/places/657c39b8a3f62.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(149, 'assets/img/places/657c39b8a4404.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(150, 'assets/img/places/657c39b8a48d7.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(151, 'assets/img/places/657c39b8a4cc9.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(152, 'assets/img/places/657c39b8a50c0.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(153, 'assets/img/places/657c39b8a54eb.jpg', '2023-12-15 10:34:16', '2023-12-15 10:34:16', 17),
(154, 'assets/img/places/657c3cf0e92de.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(155, 'assets/img/places/657c3cf0e9ac5.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(156, 'assets/img/places/657c3cf0e9ffc.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(157, 'assets/img/places/657c3cf0ea521.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(158, 'assets/img/places/657c3cf0eabcc.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(159, 'assets/img/places/657c3cf0eb0c9.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(160, 'assets/img/places/657c3cf0eb622.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(161, 'assets/img/places/657c3cf0ebcc0.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(162, 'assets/img/places/657c3cf0ec1c0.jpg', '2023-12-15 10:48:00', '2023-12-15 10:48:00', 18),
(163, 'assets/img/places/657c6285df4b4.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(164, 'assets/img/places/657c6285e0bdf.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(165, 'assets/img/places/657c6285e11f8.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(166, 'assets/img/places/657c6285e1798.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(167, 'assets/img/places/657c6285e1d57.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(168, 'assets/img/places/657c6285e22db.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(169, 'assets/img/places/657c6285e27de.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(170, 'assets/img/places/657c6285e2cfd.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(171, 'assets/img/places/657c6285e3219.jpg', '2023-12-15 13:28:21', '2023-12-15 13:28:21', 19),
(172, 'assets/img/places/657c65860cf1d.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(173, 'assets/img/places/657c65860d56d.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(174, 'assets/img/places/657c65860d9b4.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(175, 'assets/img/places/657c65860de0d.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(176, 'assets/img/places/657c65860e297.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(177, 'assets/img/places/657c65860e6f7.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(178, 'assets/img/places/657c65860eb0d.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(179, 'assets/img/places/657c65860ef8d.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(180, 'assets/img/places/657c65860f3a1.jpg', '2023-12-15 13:41:10', '2023-12-15 13:41:10', 20),
(181, 'assets/img/places/657c7170311c0.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(182, 'assets/img/places/657c7170319cd.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(183, 'assets/img/places/657c717031ed4.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(184, 'assets/img/places/657c717032356.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(185, 'assets/img/places/657c717032748.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(186, 'assets/img/places/657c717032b72.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(187, 'assets/img/places/657c717032f76.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(188, 'assets/img/places/657c717033387.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(189, 'assets/img/places/657c71703379a.jpg', '2023-12-15 14:32:00', '2023-12-15 14:32:00', 21),
(190, 'assets/img/places/657c747e76ba5.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(191, 'assets/img/places/657c747e7711d.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(192, 'assets/img/places/657c747e77630.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(193, 'assets/img/places/657c747e77aa3.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(194, 'assets/img/places/657c747e77e26.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(195, 'assets/img/places/657c747e78179.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(196, 'assets/img/places/657c747e785af.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(197, 'assets/img/places/657c747e78943.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(198, 'assets/img/places/657c747e78cee.jpg', '2023-12-15 14:45:02', '2023-12-15 14:45:02', 22),
(199, 'assets/img/places/657c768c2e121.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(200, 'assets/img/places/657c768c2e7c4.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(201, 'assets/img/places/657c768c2ebfb.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(202, 'assets/img/places/657c768c2f174.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(203, 'assets/img/places/657c768c2f602.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(204, 'assets/img/places/657c768c2fab1.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(205, 'assets/img/places/657c768c3000f.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(206, 'assets/img/places/657c768c3050c.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(207, 'assets/img/places/657c768c308d3.jpg', '2023-12-15 14:53:48', '2023-12-15 14:53:48', 23),
(208, 'assets/img/places/657c7a5e42b17.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(209, 'assets/img/places/657c7a5e43058.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(210, 'assets/img/places/657c7a5e43474.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(211, 'assets/img/places/657c7a5e437e6.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(212, 'assets/img/places/657c7a5e43b87.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(213, 'assets/img/places/657c7a5e43f2e.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(214, 'assets/img/places/657c7a5e44306.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(215, 'assets/img/places/657c7a5e4465b.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(216, 'assets/img/places/657c7a5e449e5.jpg', '2023-12-15 15:10:06', '2023-12-15 15:10:06', 24),
(217, 'assets/img/places/657c7c35977de.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(218, 'assets/img/places/657c7c3597f50.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(219, 'assets/img/places/657c7c3598494.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(220, 'assets/img/places/657c7c3598970.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(221, 'assets/img/places/657c7c3598e4a.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(222, 'assets/img/places/657c7c35992ef.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(223, 'assets/img/places/657c7c359977d.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(224, 'assets/img/places/657c7c3599c7e.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(225, 'assets/img/places/657c7c359a182.jpg', '2023-12-15 15:17:57', '2023-12-15 15:17:57', 25),
(226, 'assets/img/places/657c7e2b78c9e.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(227, 'assets/img/places/657c7e2b793d2.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(228, 'assets/img/places/657c7e2b7995d.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(229, 'assets/img/places/657c7e2b79d73.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(230, 'assets/img/places/657c7e2b7a1e5.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(231, 'assets/img/places/657c7e2b7a682.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(232, 'assets/img/places/657c7e2b7aa87.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(233, 'assets/img/places/657c7e2b7ae86.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(234, 'assets/img/places/657c7e2b7b3fa.jpg', '2023-12-15 15:26:19', '2023-12-15 15:26:19', 26),
(235, 'assets/img/places/657c7fa151c28.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(236, 'assets/img/places/657c7fa152364.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(237, 'assets/img/places/657c7fa1528bd.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(238, 'assets/img/places/657c7fa152e7a.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(239, 'assets/img/places/657c7fa1533fb.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(240, 'assets/img/places/657c7fa1538bb.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(241, 'assets/img/places/657c7fa153d88.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(242, 'assets/img/places/657c7fa154387.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(243, 'assets/img/places/657c7fa1548b2.jpg', '2023-12-15 15:32:33', '2023-12-15 15:32:33', 27),
(244, 'assets/img/places/657cb77482062.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(245, 'assets/img/places/657cb774833f2.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(246, 'assets/img/places/657cb7748390e.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(247, 'assets/img/places/657cb77483d64.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(248, 'assets/img/places/657cb774842fb.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(249, 'assets/img/places/657cb7748477d.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(250, 'assets/img/places/657cb77484bf2.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(251, 'assets/img/places/657cb774850df.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(252, 'assets/img/places/657cb774855d0.jpg', '2023-12-15 19:30:44', '2023-12-15 19:30:44', 28),
(253, 'assets/img/places/657cc18f962c5.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(254, 'assets/img/places/657cc18f96a12.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(255, 'assets/img/places/657cc18f96f38.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(256, 'assets/img/places/657cc18f97394.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(257, 'assets/img/places/657cc18f97808.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(258, 'assets/img/places/657cc18f97d77.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(259, 'assets/img/places/657cc18f982c2.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(260, 'assets/img/places/657cc18f98794.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(261, 'assets/img/places/657cc18f98d74.jpg', '2023-12-15 20:13:51', '2023-12-15 20:13:51', 29),
(262, 'assets/img/places/657cc2fcdcb37.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(263, 'assets/img/places/657cc2fcdd2ae.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(264, 'assets/img/places/657cc2fcdd84f.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(265, 'assets/img/places/657cc2fcddd09.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(266, 'assets/img/places/657cc2fcde258.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(267, 'assets/img/places/657cc2fcde6d7.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(268, 'assets/img/places/657cc2fcdebea.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(269, 'assets/img/places/657cc2fcdf0c9.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(270, 'assets/img/places/657cc2fcdf54d.jpg', '2023-12-15 20:19:56', '2023-12-15 20:19:56', 30),
(271, 'assets/img/places/657cc9f29de73.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(272, 'assets/img/places/657cc9f29e4b6.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(273, 'assets/img/places/657cc9f29e981.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(274, 'assets/img/places/657cc9f29edad.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(275, 'assets/img/places/657cc9f29f2d0.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(276, 'assets/img/places/657cc9f29f73b.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(277, 'assets/img/places/657cc9f29fc13.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(278, 'assets/img/places/657cc9f2a005a.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(279, 'assets/img/places/657cc9f2a051c.jpg', '2023-12-15 20:49:38', '2023-12-15 20:49:38', 31),
(280, 'assets/img/places/657cd1523050d.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(281, 'assets/img/places/657cd15230d3d.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(282, 'assets/img/places/657cd1523125d.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(283, 'assets/img/places/657cd1523170c.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(284, 'assets/img/places/657cd15231e16.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(285, 'assets/img/places/657cd15232352.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(286, 'assets/img/places/657cd15232862.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(287, 'assets/img/places/657cd15232d72.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(288, 'assets/img/places/657cd1523326f.jpg', '2023-12-15 21:21:06', '2023-12-15 21:21:06', 32),
(289, 'assets/img/places/657cd38f1a6ab.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(290, 'assets/img/places/657cd38f1afa2.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(291, 'assets/img/places/657cd38f1b526.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(292, 'assets/img/places/657cd38f1bb81.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(293, 'assets/img/places/657cd38f1c1c7.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(294, 'assets/img/places/657cd38f1c91e.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(295, 'assets/img/places/657cd38f1d140.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(296, 'assets/img/places/657cd38f1d94b.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(297, 'assets/img/places/657cd38f1df96.jpg', '2023-12-15 21:30:39', '2023-12-15 21:30:39', 33),
(298, 'assets/img/places/657cd4f6efcdc.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(299, 'assets/img/places/657cd4f6f06be.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(300, 'assets/img/places/657cd4f6f0df0.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(301, 'assets/img/places/657cd4f6f144e.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(302, 'assets/img/places/657cd4f6f1b2a.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(303, 'assets/img/places/657cd4f6f2170.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(304, 'assets/img/places/657cd4f6f2716.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(305, 'assets/img/places/657cd4f6f2cdb.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(306, 'assets/img/places/657cd4f6f32ba.jpg', '2023-12-15 21:36:38', '2023-12-15 21:36:38', 34),
(307, 'assets/img/places/657cd6a80966f.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(308, 'assets/img/places/657cd6a809e21.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(309, 'assets/img/places/657cd6a80a4d4.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(310, 'assets/img/places/657cd6a80a9b5.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(311, 'assets/img/places/657cd6a80ae97.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(312, 'assets/img/places/657cd6a80b399.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(313, 'assets/img/places/657cd6a80b8a9.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(314, 'assets/img/places/657cd6a80bd9a.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(315, 'assets/img/places/657cd6a80c293.jpg', '2023-12-15 21:43:52', '2023-12-15 21:43:52', 35),
(316, 'assets/img/places/657cd834ca47f.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(317, 'assets/img/places/657cd834cab75.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(318, 'assets/img/places/657cd834cb005.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(319, 'assets/img/places/657cd834cb4d9.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(320, 'assets/img/places/657cd834cb8f4.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(321, 'assets/img/places/657cd834cbd96.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(322, 'assets/img/places/657cd834cc1af.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(323, 'assets/img/places/657cd834cc6a0.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(324, 'assets/img/places/657cd834ccadb.jpg', '2023-12-15 21:50:28', '2023-12-15 21:50:28', 36),
(325, 'assets/img/places/657cdafd01ae0.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(326, 'assets/img/places/657cdafd02308.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(327, 'assets/img/places/657cdafd027f4.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(328, 'assets/img/places/657cdafd02c6d.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(329, 'assets/img/places/657cdafd030d3.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(330, 'assets/img/places/657cdafd03563.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(331, 'assets/img/places/657cdafd039d0.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(332, 'assets/img/places/657cdafd03e42.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(333, 'assets/img/places/657cdafd042b8.jpg', '2023-12-15 22:02:21', '2023-12-15 22:02:21', 37),
(334, 'assets/img/places/657cdc6c897f5.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(335, 'assets/img/places/657cdc6c89e64.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(336, 'assets/img/places/657cdc6c8a3f5.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(337, 'assets/img/places/657cdc6c8a916.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(338, 'assets/img/places/657cdc6c8aed5.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(339, 'assets/img/places/657cdc6c8b369.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(340, 'assets/img/places/657cdc6c8b7e9.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(341, 'assets/img/places/657cdc6c8bd1e.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(342, 'assets/img/places/657cdc6c8c1da.jpg', '2023-12-15 22:08:28', '2023-12-15 22:08:28', 38),
(343, 'assets/img/places/657cddbf77126.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(344, 'assets/img/places/657cddbf77841.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(345, 'assets/img/places/657cddbf77cd1.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(346, 'assets/img/places/657cddbf7813b.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(347, 'assets/img/places/657cddbf7858b.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(348, 'assets/img/places/657cddbf78aa6.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(349, 'assets/img/places/657cddbf78fb4.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(350, 'assets/img/places/657cddbf7949c.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(351, 'assets/img/places/657cddbf799d3.jpg', '2023-12-15 22:14:07', '2023-12-15 22:14:07', 39),
(352, 'assets/img/places/657cdedbcaf69.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(353, 'assets/img/places/657cdedbcb601.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(354, 'assets/img/places/657cdedbcbb03.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(355, 'assets/img/places/657cdedbcbf78.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(356, 'assets/img/places/657cdedbcc3d0.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(357, 'assets/img/places/657cdedbcc901.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(358, 'assets/img/places/657cdedbccdb2.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(359, 'assets/img/places/657cdedbcd197.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(360, 'assets/img/places/657cdedbcd615.jpg', '2023-12-15 22:18:51', '2023-12-15 22:18:51', 40),
(361, 'assets/img/places/3532768660330954.jpg', '2023-12-15 22:27:13', '2023-12-29 03:03:24', 41),
(362, 'assets/img/places/657ce0d13d583.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(363, 'assets/img/places/657ce0d13daac.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(364, 'assets/img/places/657ce0d13dfb3.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(365, 'assets/img/places/657ce0d13e48a.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(366, 'assets/img/places/657ce0d13e957.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(367, 'assets/img/places/657ce0d13ee66.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(368, 'assets/img/places/657ce0d13f2bc.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(369, 'assets/img/places/657ce0d13f6f5.jpg', '2023-12-15 22:27:13', '2023-12-15 22:27:13', 41),
(370, 'assets/img/places/657ce1f38cc75.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(371, 'assets/img/places/657ce1f38d272.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(372, 'assets/img/places/657ce1f38d766.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(373, 'assets/img/places/657ce1f38dca2.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(374, 'assets/img/places/657ce1f38e2cc.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(375, 'assets/img/places/657ce1f38e796.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(376, 'assets/img/places/657ce1f38ebd0.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(377, 'assets/img/places/657ce1f38efb0.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(378, 'assets/img/places/657ce1f38f460.jpg', '2023-12-15 22:32:03', '2023-12-15 22:32:03', 42),
(379, 'assets/img/places/657ce403bdb2c.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(380, 'assets/img/places/657ce403be334.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(381, 'assets/img/places/657ce403be87c.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(382, 'assets/img/places/657ce403bee36.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(383, 'assets/img/places/657ce403bf29a.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(384, 'assets/img/places/657ce403bf734.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(385, 'assets/img/places/657ce403bfd8d.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(386, 'assets/img/places/657ce403c02e8.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(387, 'assets/img/places/657ce403c0767.jpg', '2023-12-15 22:40:51', '2023-12-15 22:40:51', 43),
(388, 'assets/img/places/657ce536b3823.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(389, 'assets/img/places/657ce536b3f84.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(390, 'assets/img/places/657ce536b4578.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(391, 'assets/img/places/657ce536b4b47.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(392, 'assets/img/places/657ce536b5070.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(393, 'assets/img/places/657ce536b55fd.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(394, 'assets/img/places/657ce536b5b3f.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(395, 'assets/img/places/657ce536b5fe7.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(396, 'assets/img/places/657ce536b64f9.jpg', '2023-12-15 22:45:58', '2023-12-15 22:45:58', 44),
(397, 'assets/img/places/657ce53825a84.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(398, 'assets/img/places/657ce5382608a.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(399, 'assets/img/places/657ce5382657e.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(400, 'assets/img/places/657ce53826b3c.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(401, 'assets/img/places/657ce538270a5.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(402, 'assets/img/places/657ce5382750d.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(403, 'assets/img/places/657ce53827962.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(404, 'assets/img/places/657ce53827d61.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(405, 'assets/img/places/657ce53828179.jpg', '2023-12-15 22:46:00', '2023-12-15 22:46:00', 45),
(406, 'assets/img/places/657ce6fe27bdc.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(407, 'assets/img/places/657ce6fe280f6.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(408, 'assets/img/places/657ce6fe2849f.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(409, 'assets/img/places/657ce6fe287ec.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(410, 'assets/img/places/657ce6fe28b40.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(411, 'assets/img/places/657ce6fe28e66.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(412, 'assets/img/places/657ce6fe29261.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(413, 'assets/img/places/657ce6fe295a6.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(414, 'assets/img/places/657ce6fe298c8.jpg', '2023-12-15 22:53:34', '2023-12-15 22:53:34', 46),
(415, 'assets/img/places/657ce8ff9a8f5.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(416, 'assets/img/places/657ce8ff9aea3.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(417, 'assets/img/places/657ce8ff9b1e9.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(418, 'assets/img/places/657ce8ff9b51c.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(419, 'assets/img/places/657ce8ff9b8be.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(420, 'assets/img/places/657ce8ff9bc38.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(421, 'assets/img/places/657ce8ff9bf59.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(422, 'assets/img/places/657ce8ff9c292.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(423, 'assets/img/places/657ce8ff9c621.jpg', '2023-12-15 23:02:07', '2023-12-15 23:02:07', 47),
(424, 'assets/img/places/657ceb0da7fe5.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(425, 'assets/img/places/657ceb0da8771.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(426, 'assets/img/places/657ceb0da8c44.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(427, 'assets/img/places/657ceb0da90e0.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(428, 'assets/img/places/657ceb0da96c5.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(429, 'assets/img/places/657ceb0da9c91.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(430, 'assets/img/places/657ceb0daa255.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(431, 'assets/img/places/657ceb0daa7a3.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(432, 'assets/img/places/657ceb0daac7a.jpg', '2023-12-15 23:10:53', '2023-12-15 23:10:53', 48),
(433, 'assets/img/places/657cec8d7793f.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(434, 'assets/img/places/657cec8d77ff2.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(435, 'assets/img/places/657cec8d78483.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(436, 'assets/img/places/657cec8d789c0.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(437, 'assets/img/places/657cec8d78e06.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(438, 'assets/img/places/657cec8d79306.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(439, 'assets/img/places/657cec8d797d1.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(440, 'assets/img/places/657cec8d79c43.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(441, 'assets/img/places/657cec8d7a07e.jpg', '2023-12-15 23:17:17', '2023-12-15 23:17:17', 49),
(442, 'assets/img/places/657ced779aae6.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(443, 'assets/img/places/657ced779b1c4.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(444, 'assets/img/places/657ced779b66f.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(445, 'assets/img/places/657ced779bb25.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(446, 'assets/img/places/657ced779bf8c.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(447, 'assets/img/places/657ced779c431.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(448, 'assets/img/places/657ced779c952.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(449, 'assets/img/places/657ced779cd6f.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(450, 'assets/img/places/657ced779d17b.jpg', '2023-12-15 23:21:11', '2023-12-15 23:21:11', 50),
(451, 'assets/img/places/657cf199810f7.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(452, 'assets/img/places/657cf19981b49.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(453, 'assets/img/places/657cf199820c8.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(454, 'assets/img/places/657cf199827a1.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(455, 'assets/img/places/657cf19982ee4.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(456, 'assets/img/places/657cf19983731.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(457, 'assets/img/places/657cf19983f55.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(458, 'assets/img/places/657cf199845d0.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(459, 'assets/img/places/657cf19984b8b.jpg', '2023-12-15 23:38:49', '2023-12-15 23:38:49', 51),
(460, 'assets/img/places/657cf44304a25.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(461, 'assets/img/places/657cf443051a0.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(462, 'assets/img/places/657cf4430591e.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(463, 'assets/img/places/657cf44305e8e.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(464, 'assets/img/places/657cf443063dc.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(465, 'assets/img/places/657cf4430699c.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(466, 'assets/img/places/657cf44306ef1.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(467, 'assets/img/places/657cf443074c8.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(468, 'assets/img/places/657cf44307a12.jpg', '2023-12-15 23:50:11', '2023-12-15 23:50:11', 52),
(469, 'assets/img/places/657d011ca4def.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(470, 'assets/img/places/657d011ca6002.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(471, 'assets/img/places/657d011ca6b01.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(472, 'assets/img/places/657d011ca70ba.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(473, 'assets/img/places/657d011ca769b.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(474, 'assets/img/places/657d011ca7d81.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(475, 'assets/img/places/657d011ca8275.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(476, 'assets/img/places/657d011ca873f.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(477, 'assets/img/places/657d011ca8cca.jpg', '2023-12-16 00:45:00', '2023-12-16 00:45:00', 53),
(478, 'assets/img/places/657d02027d1cb.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(479, 'assets/img/places/657d02027db1d.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(480, 'assets/img/places/657d02027ead2.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(481, 'assets/img/places/657d02027f5e6.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(482, 'assets/img/places/657d02027fdf2.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(483, 'assets/img/places/657d020280471.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(484, 'assets/img/places/657d02028095e.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(485, 'assets/img/places/657d020280ec5.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(486, 'assets/img/places/657d02028148b.jpg', '2023-12-16 00:48:50', '2023-12-16 00:48:50', 54),
(487, 'assets/img/places/657d4c119646c.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(488, 'assets/img/places/657d4c1196c97.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(489, 'assets/img/places/657d4c1197295.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(490, 'assets/img/places/657d4c1197ad0.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(491, 'assets/img/places/657d4c11981ed.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(492, 'assets/img/places/657d4c1198895.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(493, 'assets/img/places/657d4c1198fae.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(494, 'assets/img/places/657d4c1199595.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(495, 'assets/img/places/657d4c1199bbd.jpg', '2023-12-16 06:04:49', '2023-12-16 06:04:49', 55),
(496, 'assets/img/places/657d52c6aa33b.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(497, 'assets/img/places/657d52c6aaae2.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(498, 'assets/img/places/657d52c6aafb8.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(499, 'assets/img/places/657d52c6ab489.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(500, 'assets/img/places/657d52c6ab87a.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(501, 'assets/img/places/657d52c6abcfa.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(502, 'assets/img/places/657d52c6ac143.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(503, 'assets/img/places/657d52c6ac590.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(504, 'assets/img/places/657d52c6ac9c9.jpg', '2023-12-16 06:33:26', '2023-12-16 06:33:26', 56),
(505, 'assets/img/places/65855a8de6a5d.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(506, 'assets/img/places/65855a8de7f3b.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(507, 'assets/img/places/65855a8de84d3.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(508, 'assets/img/places/65855a8de8a39.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(509, 'assets/img/places/65855a8de8fda.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(510, 'assets/img/places/65855a8de9580.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(511, 'assets/img/places/65855a8de9b9d.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(512, 'assets/img/places/65855a8dea0d8.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(513, 'assets/img/places/65855a8dea67a.jpg', '2023-12-22 08:44:45', '2023-12-22 08:44:45', 57),
(514, 'assets/img/places/65855ce09b924.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(515, 'assets/img/places/65855ce09bfed.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(516, 'assets/img/places/65855ce09c411.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(517, 'assets/img/places/65855ce09c8b3.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(518, 'assets/img/places/65855ce09cceb.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(519, 'assets/img/places/65855ce09d12e.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(520, 'assets/img/places/65855ce09d550.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(521, 'assets/img/places/65855ce09d967.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(522, 'assets/img/places/65855ce09dd9d.jpg', '2023-12-22 08:54:40', '2023-12-22 08:54:40', 58),
(523, 'assets/img/places/65876e76c2151.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(524, 'assets/img/places/65876e76c2a14.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(525, 'assets/img/places/65876e76c3035.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(526, 'assets/img/places/65876e76c3551.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(527, 'assets/img/places/65876e76c3b36.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(528, 'assets/img/places/65876e76c408c.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(529, 'assets/img/places/65876e76c45eb.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(530, 'assets/img/places/65876e76c4bcf.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(531, 'assets/img/places/65876e76c5114.jpg', '2023-12-23 22:34:14', '2023-12-23 22:34:14', 59),
(532, 'assets/img/places/658770d11452b.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(533, 'assets/img/places/658770d114f1e.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60);
INSERT INTO `images` (`id`, `url`, `created_at`, `updated_at`, `place_id`) VALUES
(534, 'assets/img/places/658770d1155d7.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(535, 'assets/img/places/658770d115c5c.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(536, 'assets/img/places/658770d11640d.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(537, 'assets/img/places/658770d116c29.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(538, 'assets/img/places/658770d11736f.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(539, 'assets/img/places/658770d117a77.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(540, 'assets/img/places/658770d118188.jpg', '2023-12-23 22:44:17', '2023-12-23 22:44:17', 60),
(541, 'assets/img/places/658774fa54b2a.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(542, 'assets/img/places/658774fa552fe.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(543, 'assets/img/places/658774fa5570d.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(544, 'assets/img/places/658774fa55b0f.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(545, 'assets/img/places/658774fa55eb2.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(546, 'assets/img/places/658774fa562b5.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(547, 'assets/img/places/658774fa5668e.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(548, 'assets/img/places/658774fa56b30.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(549, 'assets/img/places/658774fa56f73.jpg', '2023-12-23 23:02:02', '2023-12-23 23:02:02', 61),
(550, 'assets/img/places/65877761c7e5e.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(551, 'assets/img/places/65877761c8550.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(552, 'assets/img/places/65877761c8a5f.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(553, 'assets/img/places/65877761c8f08.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(554, 'assets/img/places/65877761c9451.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(555, 'assets/img/places/65877761c9930.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(556, 'assets/img/places/65877761c9d92.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(557, 'assets/img/places/65877761ca27b.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(558, 'assets/img/places/65877761ca758.jpg', '2023-12-23 23:12:17', '2023-12-23 23:12:17', 62),
(559, 'assets/img/places/6587783fd02ee.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(560, 'assets/img/places/6587783fd0bbe.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(561, 'assets/img/places/6587783fd11c7.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(562, 'assets/img/places/6587783fd17b8.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(563, 'assets/img/places/6587783fd1ccf.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(564, 'assets/img/places/6587783fd2235.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(565, 'assets/img/places/6587783fd27f8.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(566, 'assets/img/places/6587783fd2d1e.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(567, 'assets/img/places/6587783fd31b2.jpg', '2023-12-23 23:15:59', '2023-12-23 23:15:59', 63),
(568, 'assets/img/places/6587798fc2cb8.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(569, 'assets/img/places/6587798fc328e.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(570, 'assets/img/places/6587798fc3695.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(571, 'assets/img/places/6587798fc3aa5.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(572, 'assets/img/places/6587798fc3f8b.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(573, 'assets/img/places/6587798fc4361.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(574, 'assets/img/places/6587798fc4795.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(575, 'assets/img/places/6587798fc4b8f.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(576, 'assets/img/places/6587798fc4f56.jpg', '2023-12-23 23:21:35', '2023-12-23 23:21:35', 64),
(577, 'assets/img/places/65877a9de8a42.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(578, 'assets/img/places/65877a9de96b4.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(579, 'assets/img/places/65877a9de9cbe.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(580, 'assets/img/places/65877a9dea208.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(581, 'assets/img/places/65877a9dea6d5.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(582, 'assets/img/places/65877a9deabcb.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(583, 'assets/img/places/65877a9deb12b.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(584, 'assets/img/places/65877a9deb65e.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(585, 'assets/img/places/65877a9debc1a.jpg', '2023-12-23 23:26:05', '2023-12-23 23:26:05', 65),
(586, 'assets/img/places/65877d283a10d.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(587, 'assets/img/places/65877d283a7f7.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(588, 'assets/img/places/65877d283ac67.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(589, 'assets/img/places/65877d283b1eb.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(590, 'assets/img/places/65877d283b5ca.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(591, 'assets/img/places/65877d283bc5b.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(592, 'assets/img/places/65877d283c480.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(593, 'assets/img/places/65877d283c921.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(594, 'assets/img/places/65877d283ce40.jpg', '2023-12-23 23:36:56', '2023-12-23 23:36:56', 66),
(595, 'assets/img/places/6587810a3aba6.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(596, 'assets/img/places/6587810a3b19d.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(597, 'assets/img/places/6587810a3b586.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(598, 'assets/img/places/6587810a3b9bc.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(599, 'assets/img/places/6587810a3bed9.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(600, 'assets/img/places/6587810a3c2ab.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(601, 'assets/img/places/6587810a3c5f7.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(602, 'assets/img/places/6587810a3c947.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(603, 'assets/img/places/6587810a3cc8c.jpg', '2023-12-23 23:53:30', '2023-12-23 23:53:30', 67),
(604, 'assets/img/places/658782520b801.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(605, 'assets/img/places/658782520bf91.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(606, 'assets/img/places/658782520c4fb.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(607, 'assets/img/places/658782520c9a4.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(608, 'assets/img/places/658782520ce36.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(609, 'assets/img/places/658782520d2a6.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(610, 'assets/img/places/658782520d605.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(611, 'assets/img/places/658782520d9ec.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(612, 'assets/img/places/658782520df97.jpg', '2023-12-23 23:58:58', '2023-12-23 23:58:58', 68),
(613, 'assets/img/places/65878516c29f2.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(614, 'assets/img/places/65878516c31f3.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(615, 'assets/img/places/65878516c3659.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(616, 'assets/img/places/65878516c3b7d.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(617, 'assets/img/places/65878516c3fd7.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(618, 'assets/img/places/65878516c4419.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(619, 'assets/img/places/65878516c4993.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(620, 'assets/img/places/65878516c4e6a.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(621, 'assets/img/places/65878516c532b.jpg', '2023-12-24 00:10:46', '2023-12-24 00:10:46', 69),
(622, 'assets/img/places/65883d4ab76c9.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(623, 'assets/img/places/65883d4ab7f4f.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(624, 'assets/img/places/65883d4ab8481.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(625, 'assets/img/places/65883d4ab89c0.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(626, 'assets/img/places/65883d4ab8f2e.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(627, 'assets/img/places/65883d4ab9468.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(628, 'assets/img/places/65883d4ab9afe.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(629, 'assets/img/places/65883d4aba12c.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(630, 'assets/img/places/65883d4aba656.jpg', '2023-12-24 13:16:42', '2023-12-24 13:16:42', 70),
(631, 'assets/img/places/6588413048897.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(632, 'assets/img/places/6588413049203.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(633, 'assets/img/places/658841304992a.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(634, 'assets/img/places/6588413049f59.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(635, 'assets/img/places/658841304a620.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(636, 'assets/img/places/658841304af47.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(637, 'assets/img/places/658841304b5e1.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(638, 'assets/img/places/658841304bd8c.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(639, 'assets/img/places/658841304c35c.jpg', '2023-12-24 13:33:20', '2023-12-24 13:33:20', 71),
(640, 'assets/img/places/658844ca03a37.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(641, 'assets/img/places/658844ca04289.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(642, 'assets/img/places/658844ca047cc.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(643, 'assets/img/places/658844ca04c1c.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(644, 'assets/img/places/658844ca05142.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(645, 'assets/img/places/658844ca055e0.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(646, 'assets/img/places/658844ca05abe.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(647, 'assets/img/places/658844ca05f2c.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(648, 'assets/img/places/658844ca06426.jpg', '2023-12-24 13:48:42', '2023-12-24 13:48:42', 72),
(649, 'assets/img/places/658851f79218b.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(650, 'assets/img/places/658851f7928f5.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(651, 'assets/img/places/658851f792dda.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(652, 'assets/img/places/658851f793344.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(653, 'assets/img/places/658851f793865.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(654, 'assets/img/places/658851f793d0e.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(655, 'assets/img/places/658851f794201.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(656, 'assets/img/places/658851f79470a.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(657, 'assets/img/places/658851f794c37.jpg', '2023-12-24 14:44:55', '2023-12-24 14:44:55', 73),
(658, 'assets/img/places/658853083a98e.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(659, 'assets/img/places/658853083b205.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(660, 'assets/img/places/658853083b6dd.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(661, 'assets/img/places/658853083bc02.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(662, 'assets/img/places/658853083c158.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(663, 'assets/img/places/658853083c5fa.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(664, 'assets/img/places/658853083cb27.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(665, 'assets/img/places/658853083cfcd.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(666, 'assets/img/places/658853083d46e.jpg', '2023-12-24 14:49:28', '2023-12-24 14:49:28', 74),
(667, 'assets/img/places/6588573db1688.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(668, 'assets/img/places/6588573db1efb.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(669, 'assets/img/places/6588573db2458.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(670, 'assets/img/places/6588573db293e.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(671, 'assets/img/places/6588573db2ed6.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(672, 'assets/img/places/6588573db33b4.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(673, 'assets/img/places/6588573db38e4.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(674, 'assets/img/places/6588573db3db2.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(675, 'assets/img/places/6588573db423a.jpg', '2023-12-24 15:07:25', '2023-12-24 15:07:25', 75),
(676, 'assets/img/places/65898117b8272.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(677, 'assets/img/places/65898117b92e2.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(678, 'assets/img/places/65898117b98d0.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(679, 'assets/img/places/65898117b9ed2.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(680, 'assets/img/places/65898117ba46d.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(681, 'assets/img/places/65898117ba9ab.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(682, 'assets/img/places/65898117baf6a.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(683, 'assets/img/places/65898117bb4cf.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(684, 'assets/img/places/65898117bb9df.jpg', '2023-12-25 12:18:15', '2023-12-25 12:18:15', 76),
(685, 'assets/img/places/65898307c655c.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(686, 'assets/img/places/65898307c6ccc.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(687, 'assets/img/places/65898307c71fe.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(688, 'assets/img/places/65898307c76db.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(689, 'assets/img/places/65898307c7c06.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(690, 'assets/img/places/65898307c80a7.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(691, 'assets/img/places/65898307c8543.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(692, 'assets/img/places/65898307c89eb.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(693, 'assets/img/places/65898307c8e4e.jpg', '2023-12-25 12:26:31', '2023-12-25 12:26:31', 77),
(694, 'assets/img/places/6589881c5f700.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(695, 'assets/img/places/6589881c6001a.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(696, 'assets/img/places/6589881c60715.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(697, 'assets/img/places/6589881c60cb9.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(698, 'assets/img/places/6589881c61263.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(699, 'assets/img/places/6589881c617f2.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(700, 'assets/img/places/6589881c61d19.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(701, 'assets/img/places/6589881c6225e.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(702, 'assets/img/places/6589881c627ca.jpg', '2023-12-25 12:48:12', '2023-12-25 12:48:12', 78),
(703, 'assets/img/places/65898b2b163b3.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(704, 'assets/img/places/65898b2b16b09.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(705, 'assets/img/places/65898b2b17041.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(706, 'assets/img/places/65898b2b174ba.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(707, 'assets/img/places/65898b2b1795d.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(708, 'assets/img/places/65898b2b17e4d.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(709, 'assets/img/places/65898b2b18368.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(710, 'assets/img/places/65898b2b18864.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(711, 'assets/img/places/65898b2b18cb8.jpg', '2023-12-25 13:01:15', '2023-12-25 13:01:15', 79),
(712, 'assets/img/places/65898c97c118a.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(713, 'assets/img/places/65898c97c1d0e.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(714, 'assets/img/places/65898c97c242d.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(715, 'assets/img/places/65898c97c2a07.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(716, 'assets/img/places/65898c97c318c.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(717, 'assets/img/places/65898c97c3804.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(718, 'assets/img/places/65898c97c3d8d.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(719, 'assets/img/places/65898c97c444b.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(720, 'assets/img/places/65898c97c4ab7.jpg', '2023-12-25 13:07:19', '2023-12-25 13:07:19', 80),
(721, 'assets/img/places/65898de61706e.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(722, 'assets/img/places/65898de6179ab.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(723, 'assets/img/places/65898de618001.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(724, 'assets/img/places/65898de6185d7.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(725, 'assets/img/places/65898de618c15.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(726, 'assets/img/places/65898de6190a0.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(727, 'assets/img/places/65898de6194e5.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(728, 'assets/img/places/65898de619932.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(729, 'assets/img/places/65898de619d61.jpg', '2023-12-25 13:12:54', '2023-12-25 13:12:54', 81),
(730, 'assets/img/places/6589931075766.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(731, 'assets/img/places/6589931075f69.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(732, 'assets/img/places/65899310763dd.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(733, 'assets/img/places/6589931076972.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(734, 'assets/img/places/6589931076e9e.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(735, 'assets/img/places/65899310772d1.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(736, 'assets/img/places/658993107779c.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(737, 'assets/img/places/6589931077bfb.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(738, 'assets/img/places/6589931077fef.jpg', '2023-12-25 13:34:56', '2023-12-25 13:34:56', 82),
(739, 'assets/img/places/658993b180331.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(740, 'assets/img/places/658993b180bf0.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(741, 'assets/img/places/658993b1812b4.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(742, 'assets/img/places/658993b1818f0.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(743, 'assets/img/places/658993b181e6e.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(744, 'assets/img/places/658993b182431.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(745, 'assets/img/places/658993b182a82.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(746, 'assets/img/places/658993b183054.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(747, 'assets/img/places/658993b1836c2.jpg', '2023-12-25 13:37:37', '2023-12-25 13:37:37', 83),
(748, 'assets/img/places/65899452eefde.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(749, 'assets/img/places/65899452efec5.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(750, 'assets/img/places/65899452f15af.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(751, 'assets/img/places/65899452f1c42.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(752, 'assets/img/places/65899452f247d.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(753, 'assets/img/places/65899452f2a86.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(754, 'assets/img/places/65899452f2fbc.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(755, 'assets/img/places/65899452f349f.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(756, 'assets/img/places/65899452f394a.jpg', '2023-12-25 13:40:18', '2023-12-25 13:40:18', 84),
(757, 'assets/img/places/6589961127b9f.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(758, 'assets/img/places/658996112837b.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(759, 'assets/img/places/65899611287a1.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(760, 'assets/img/places/6589961128b6d.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(761, 'assets/img/places/6589961128efc.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(762, 'assets/img/places/65899611292e8.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(763, 'assets/img/places/65899611296d9.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(764, 'assets/img/places/6589961129aa1.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(765, 'assets/img/places/6589961129e37.jpg', '2023-12-25 13:47:45', '2023-12-25 13:47:45', 85),
(766, 'assets/img/places/658da90c511dc.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(767, 'assets/img/places/658da90c51b67.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(768, 'assets/img/places/658da90c520a2.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(769, 'assets/img/places/658da90c52500.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(770, 'assets/img/places/658da90c52a4a.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(771, 'assets/img/places/658da90c52e7d.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(772, 'assets/img/places/658da90c532b8.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(773, 'assets/img/places/658da90c5383f.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(774, 'assets/img/places/658da90c53cb9.jpg', '2023-12-28 15:57:48', '2023-12-28 15:57:48', 86),
(775, 'assets/img/places/658daad963782.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(776, 'assets/img/places/658daad963f41.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(777, 'assets/img/places/658daad964512.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(778, 'assets/img/places/658daad9649b7.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(779, 'assets/img/places/658daad964e4c.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(780, 'assets/img/places/658daad965380.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(781, 'assets/img/places/658daad965792.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(782, 'assets/img/places/658daad965bab.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(783, 'assets/img/places/658daad966074.jpg', '2023-12-28 16:05:29', '2023-12-28 16:05:29', 87),
(784, 'assets/img/places/658dae5d3ab36.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(785, 'assets/img/places/658dae5d3b54a.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(786, 'assets/img/places/658dae5d3bba1.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(787, 'assets/img/places/658dae5d3c0fa.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(788, 'assets/img/places/658dae5d3c639.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(789, 'assets/img/places/658dae5d3cd11.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(790, 'assets/img/places/658dae5d3d39e.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(791, 'assets/img/places/658dae5d3da7a.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(792, 'assets/img/places/658dae5d3dff8.jpg', '2023-12-28 16:20:29', '2023-12-28 16:20:29', 88),
(793, 'assets/img/places/658db17159973.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(794, 'assets/img/places/658db1715a361.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(795, 'assets/img/places/658db1715abee.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(796, 'assets/img/places/658db1715b0fd.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(797, 'assets/img/places/658db1715b5b3.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(798, 'assets/img/places/658db1715ba4f.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(799, 'assets/img/places/658db1715bf5a.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(800, 'assets/img/places/658db1715c427.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89),
(801, 'assets/img/places/658db1715c85d.jpg', '2023-12-28 16:33:37', '2023-12-28 16:33:37', 89);

-- --------------------------------------------------------

--
-- Table structure for table `information_identies`
--

DROP TABLE IF EXISTS `information_identies`;
CREATE TABLE IF NOT EXISTS `information_identies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lieu_naissance` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_naissance` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pays` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nationalite` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `domicile` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cni_recto` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cni_verso` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0',
  `encours` tinyint(1) NOT NULL DEFAULT '0',
  `resultat_validation` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `numero_cni` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `information_identies_phone1_unique` (`phone1`),
  KEY `information_identies_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `information_identies`
--

INSERT INTO `information_identies` (`id`, `name`, `lieu_naissance`, `date_naissance`, `genre`, `pays`, `nationalite`, `domicile`, `cni_recto`, `cni_verso`, `photo`, `phone1`, `phone2`, `is_validated`, `encours`, `resultat_validation`, `numero_cni`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'test test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4060972085670302.jpg', '0000000000', NULL, 1, 0, '0', NULL, '2023-12-14 20:54:01', '2023-12-16 16:35:52', 1),
(2, 'FAIZAN CHRIST', 'ras', '2023-12-15', 'M', NULL, 'ras', 'abidjan', '1702621750.jpg', '1702621750.jpg', 'assets/img/users/photo/6584c6d573ff3.jpg', '01 50 67 57 24', NULL, 0, 0, '0', 'ras', '2023-12-15 05:26:40', '2023-12-21 22:14:29', 2),
(3, 'Douho Franck', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702623224.jpg', '1702623224.jpg', '/tmp/phpHmK9Ou', '0142752949', NULL, 0, 0, '0', 'ras', '2023-12-15 05:52:16', '2023-12-15 05:53:44', 3),
(4, 'Cisse vakaramoko ismail', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702623958.png', '1702623958.png', 'assets/img/users/pieces/3781923038373931.jpg', '0767187983', 'ras', 0, 0, '0', 'ras', '2023-12-15 06:04:26', '2023-12-29 04:54:00', 4),
(5, 'KROU KASSI AIME', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702626401.jpg', '1702626401.jpg', '/tmp/phpb6MNNw', '0767710037', 'ras', 0, 0, '0', 'ras', '2023-12-15 06:45:36', '2023-12-15 06:46:41', 5),
(6, 'M’baye Mamadou', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702626812.jpg', '1702626812.jpg', '/tmp/php1JFcH6', '0704651768', 'ras', 0, 0, '0', 'ras', '2023-12-15 06:52:39', '2023-12-15 06:53:32', 6),
(7, 'Brou Ange Constant', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702628946.jpg', '1702628946.jpg', '/tmp/phpfCcccK', '0142259421', 'ras', 0, 0, '0', 'ras', '2023-12-15 07:28:13', '2023-12-15 07:29:06', 7),
(8, 'google test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4821333170192485.jpg', '0000000001', NULL, 1, 0, '0', NULL, '2023-12-15 09:39:22', '2023-12-16 16:34:56', 8),
(9, 'NANOU JEAN', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702638609.jpg', '1702638609.jpg', 'assets/img/users/pieces/8712385718612122.jpg', '0586468663', 'ras', 0, 0, '0', 'ras', '2023-12-15 10:06:21', '2023-12-29 02:12:46', 9),
(10, 'Goore Armand Trazie', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702639475.jpg', '1702639475.jpg', 'assets/img/users/pieces/4579292452620771.jpg', '0779411622', 'ras', 0, 0, '0', 'ras', '2023-12-15 10:23:16', '2023-12-29 02:15:02', 10),
(11, 'Noé Ephraïm Nougi', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702640537.jpg', '1702640537.jpg', 'assets/img/users/pieces/9876509051823949.jpg', '0757057448', 'ras', 0, 0, '0', 'ras', '2023-12-15 10:40:55', '2024-01-16 03:51:12', 11),
(12, 'Attemené Rodolpho', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702650019.jpg', '1702650019.jpg', 'assets/img/users/pieces/8789262087030910.jpg', '0779637426', 'ras', 0, 0, '0', 'ras', '2023-12-15 10:56:16', '2023-12-29 02:20:02', 12),
(13, 'Kouabenan Uriel Fienin', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702650800.jpg', '1702650800.jpg', 'assets/img/users/pieces/5197089265896931.jpg', '0789324267', 'ras', 0, 0, '0', 'ras', '2023-12-15 13:32:21', '2023-12-29 02:23:44', 13),
(14, 'Dassé Jonathan', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702654097.jpg', '1702654097.jpg', '/tmp/phpT5Bxeh', '0143834131', 'ras', 0, 0, '0', 'ras', '2023-12-15 14:24:49', '2023-12-15 14:28:17', 14),
(15, 'Annasse Dabré Ousmane', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702654712.jpg', '1702654712.jpg', 'assets/img/users/pieces/4321225667582992.jpg', '0143926508', 'ras', 0, 0, '0', 'ras', '2023-12-15 14:37:27', '2023-12-29 02:26:38', 15),
(16, 'Winle Éric', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702655401.jpg', '1702655401.jpg', 'assets/img/users/pieces/7003920862958301.jpg', '0140062887', '0769371361', 1, 0, '0', 'ras', '2023-12-15 14:49:03', '2023-12-29 02:28:11', 16),
(17, 'SANGARE SIAKA', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702656386.jpg', '1702656386.jpg', 'assets/img/users/pieces/4787504711601775.jpg', '0544295169', 'ras', 0, 0, '0', 'ras', '2023-12-15 15:05:46', '2023-12-29 02:29:56', 17),
(18, 'Kouame Axel', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702656844.jpg', '1702656844.jpg', 'assets/img/users/pieces/2009854900830032.jpg', '0769475516', 'ras', 0, 0, '0', 'ras', '2023-12-15 15:13:14', '2023-12-29 02:31:17', 18),
(19, 'TANO KOTCHI', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702657327.jpg', '1702657327.jpg', 'assets/img/users/pieces/6899386972319078.jpg', '0564954570', 'ras', 0, 0, '0', 'ras', '2023-12-15 15:21:25', '2023-12-29 02:36:54', 19),
(20, 'AHIKPA ROGER DAGOU', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702657759.jpg', '1702657759.jpg', 'assets/img/users/pieces/2812997535444608.jpg', '0152401971', '0705901872', 0, 0, '0', 'ras', '2023-12-15 15:28:42', '2023-12-29 02:39:45', 20),
(21, 'AKOUMIA DÉSIRÉ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/5041894677787629.jpg', '0758819584', NULL, 0, 0, '0', NULL, '2023-12-15 17:04:13', '2023-12-15 17:04:13', 21),
(22, 'ASSI Félicien', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702671976.jpg', '1702671976.jpg', 'assets/img/users/pieces/7504936091073182.jpg', '0141903451', '0704235491', 0, 0, '0', 'ras', '2023-12-15 19:25:05', '2023-12-29 02:45:42', 22),
(23, 'TAPA David', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702674433.jpg', '1702674433.jpg', 'assets/img/users/pieces/501845272285620.jpg', '0501295353', '0143723663', 0, 0, '0', 'ras', '2023-12-15 20:06:05', '2023-12-29 02:51:47', 23),
(24, 'Sehi Joëlle', 'ras', '2023-12-15', 'F', NULL, 'ras', 'ras', '1702675509.jpg', '1702675509.jpg', 'assets/img/users/pieces/4190772256749214.jpg', '0779366345', 'ras', 0, 0, '0', 'ras', '2023-12-15 20:24:25', '2023-12-29 02:53:21', 24),
(25, 'N’GUESSAN Léonce', 'ras', '2023-12-15', 'F', NULL, 'ras', 'ras', '1702681121.jpg', '1702681121.jpg', 'assets/img/users/pieces/1702681041.jpg', '0140885508', 'ras', 0, 0, '0', 'ras', '2023-12-15 21:57:21', '2023-12-15 21:58:41', 25),
(26, 'YAPO KEVIN AYMAR ROMUALD MINZAN', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702683320.png', '1702683320.png', 'assets/img/users/pieces/1702683151.png', '0757244602', 'ras', 0, 0, '0', 'ras', '2023-12-15 22:32:31', '2023-12-15 22:35:20', 26),
(27, 'Bosse Ange', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702683469.jpg', '1702683469.jpg', 'assets/img/users/pieces/1702683424.jpg', '0171137112', 'ras', 0, 0, '0', 'ras', '2023-12-15 22:37:04', '2023-12-15 22:37:49', 27),
(28, 'OKA Franc', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702684215.jpg', '1702684215.jpg', 'assets/img/users/pieces/3642966458381791.jpg', '0703819073', 'ras', 0, 0, '0', 'ras', '2023-12-15 22:49:24', '2023-12-29 03:08:55', 28),
(29, 'DJORO Adou Esaïe Jonathan', 'ras', '2023-12-15', 'M', NULL, 'ras', 'ras', '1702684749.jpg', '1702684749.jpg', 'assets/img/users/pieces/1702684653.jpg', '0788260424', 'ras', 0, 0, '0', 'ras', '2023-12-15 22:57:33', '2023-12-15 22:59:09', 29),
(30, 'OUALLO Nemlin Noël', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702685306.jpg', '1702685306.jpg', 'assets/img/users/pieces/1702685263.jpg', '0170901146', 'ras', 0, 0, '0', 'ras', '2023-12-15 23:07:43', '2023-12-15 23:08:26', 30),
(31, 'CARTES MARIO', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702685571.jpg', '1702685571.jpg', 'assets/img/users/pieces/1702685477.jpg', '0749589201', 'ras', 0, 0, '0', 'ras', '2023-12-15 23:11:17', '2023-12-15 23:12:51', 31),
(32, 'Banse Benjamin', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702685742.jpg', '1702685742.jpg', 'assets/img/users/pieces/881221917542929.jpg', '0797233146', 'ras', 0, 0, '0', 'ras', '2023-12-15 23:14:43', '2023-12-29 03:16:44', 32),
(33, 'KELI BORIS', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702686873.jpg', '1702686873.jpg', 'assets/img/users/pieces/1702686809.jpg', '0778438513', 'ras', 0, 0, '0', 'ras', '2023-12-15 23:33:29', '2023-12-15 23:34:33', 33),
(34, 'Lago Salomon Fabrice', 'ras', '2023-12-30', 'M', NULL, 'ras', 'ras', '1702687585.jpg', '1702687585.jpg', 'assets/img/users/pieces/1702687518.jpg', '0709815775', 'ras', 0, 0, '0', 'ras', '2023-12-15 23:45:18', '2023-12-15 23:46:25', 34),
(35, 'Dogbo Goffry Isaac Trésor', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702690835.jpg', '1702690835.jpg', 'assets/img/users/pieces/1702690779.jpg', '0586239318', 'ras', 0, 0, '0', 'ras', '2023-12-16 00:39:39', '2023-12-16 00:40:35', 35),
(36, 'N\'GUESSAN ADJOUA FLORENCE', 'ras', '2023-12-16', 'M', NULL, 'ras', 'ras', '1702711779.jpg', '1702711779.jpg', 'assets/img/users/pieces/1702711720.jpg', '0707993749', 'ras', 0, 0, '0', 'ras', '2023-12-16 06:28:40', '2023-12-16 06:29:39', 36),
(37, 'Sereme Habib', 'Ouaga', '2006-09-06T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Burkina Faso', 'Bassam', 'assets/img/users/pieces/83963967007710.jpg', 'assets/img/users/pieces/3336650771204681.jpg', 'assets/img/users/pieces/9896626766837350.jpg', '0151838383', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-16 11:25:00', '2023-12-20 10:32:36', 37),
(38, 'Coulibaly Soro Mohamed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/5511163993920931.jpg', '0749908783', NULL, 0, 0, '0', NULL, '2023-12-19 07:55:09', '2023-12-19 07:55:09', 38),
(39, 'Kone Cheick Mohamed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/443134355451237.jpg', '0758142125', NULL, 0, 0, '0', NULL, '2023-12-19 08:11:14', '2023-12-29 03:52:33', 39),
(40, 'Brou N\'guessan Ayo Herman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/157817777910200.jpg', '7068422589', NULL, 0, 0, '0', NULL, '2023-12-19 08:35:29', '2023-12-19 08:35:29', 40),
(41, 'Tano Ange Patrick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4483859066370389.jpg', '0141176752', NULL, 0, 0, '0', NULL, '2023-12-19 08:38:13', '2023-12-19 08:38:13', 41),
(42, 'Traore Mohamed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9704290363220758.jpg', '0709024783', NULL, 0, 0, '0', NULL, '2023-12-19 08:40:28', '2023-12-19 08:40:28', 42),
(43, 'Konan Evariste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6458234091242813.jpg', '0777094325', NULL, 0, 0, '0', NULL, '2023-12-19 08:42:20', '2023-12-29 04:05:21', 43),
(44, 'Djoman Junior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/3366978430285906.jpg', '0704218340', NULL, 0, 0, '0', NULL, '2023-12-19 08:43:51', '2023-12-29 04:09:06', 44),
(45, 'Bogui Roland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9100352565525234.jpg', '0101486119', NULL, 0, 0, '0', NULL, '2023-12-19 08:46:08', '2023-12-29 04:11:39', 45),
(46, 'Koffi Guy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4323569974843490.jpg', '0758381070', NULL, 0, 0, '0', NULL, '2023-12-19 08:48:30', '2023-12-29 04:14:02', 46),
(47, 'Bah Olivier', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/4412903585233736.jpg', 'assets/img/users/pieces/3281694414556120.jpg', 'assets/img/users/pieces/9699710927360750.jpg', '0505480231', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 08:51:40', '2023-12-29 04:16:15', 47),
(48, 'Houenou Tinoh', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/8852204177732313.jpg', 'assets/img/users/pieces/3914693971973619.jpg', 'assets/img/users/pieces/4887619366304688.jpg', '0707210937', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 08:53:42', '2023-12-29 04:18:07', 48),
(49, 'Gedeon Aimé', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/1591974996105206.jpg', 'assets/img/users/pieces/2329855170178817.jpg', 'assets/img/users/pieces/4341760097999608.jpg', '0748994287', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 08:56:05', '2023-12-29 04:19:49', 49),
(50, 'Tourey Celestin Everest', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/1774156170989626.jpg', 'assets/img/users/pieces/5028023131697041.jpg', 'assets/img/users/pieces/9687656490769333.jpg', '0777014352', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 08:57:44', '2023-12-29 04:21:44', 50),
(51, 'Kouassike Sosthene', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/2625202735072883.jpg', '0709443350', NULL, 0, 0, '0', NULL, '2023-12-19 09:00:18', '2023-12-29 04:24:39', 51),
(52, 'Bedy Emmanuel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/7394276562099205.jpg', '0769527317', NULL, 0, 0, '0', NULL, '2023-12-19 09:02:13', '2023-12-29 04:26:31', 52),
(53, 'Boga Samuel', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/7166443797923872.jpg', 'assets/img/users/pieces/5205135871200730.jpg', 'assets/img/users/pieces/1849118228068132.jpg', '0749500502', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 09:18:58', '2023-12-29 04:32:22', 53),
(54, 'Oulai Habib', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/6001644898576751.jpg', 'assets/img/users/pieces/9531651371751157.jpg', 'assets/img/users/pieces/1984438987820488.jpg', '0757697555', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 09:22:50', '2023-12-29 04:34:13', 54),
(55, 'Toe Désiré Abdoul Rasak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4295208484168105.jpg', '0769214535', NULL, 0, 0, '0', NULL, '2023-12-19 09:25:42', '2023-12-29 04:38:19', 55),
(56, 'Lawson Ange Michel', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/6214058655591062.jpg', 'assets/img/users/pieces/200026305605354.jpg', 'assets/img/users/pieces/5683091040079679.jpg', '0778341044', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 09:27:15', '2023-12-29 04:41:21', 56),
(57, 'Zambe Bi Boti David', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/9238292753927772.jpg', 'assets/img/users/pieces/6700535033713199.jpg', 'assets/img/users/pieces/6822825787173603.jpg', '0757678528', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 09:32:05', '2023-12-29 04:46:42', 57),
(58, 'Bogui Lobognon Bohue Patrick', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/9998668788520885.jpg', 'assets/img/users/pieces/4400820131108133.jpg', 'assets/img/users/pieces/405805635035665.jpg', '0500500194', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 09:34:20', '2023-12-29 04:49:12', 58),
(59, 'Brou Nguessan Ayo Herman', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/9133426741804800.jpg', 'assets/img/users/pieces/8361033531444701.jpg', 'assets/img/users/pieces/5452865637962780.jpg', '0768422589', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-19 10:10:02', '2023-12-25 13:18:34', 59),
(60, 'test test', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'ras', 'assets/img/users/pieces/5283782620727215.jpg', 'assets/img/users/pieces/9837356227612541.jpg', 'assets/img/users/pieces/1265806201182911.jpg', '0101004521', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-20 07:53:22', '2023-12-20 08:31:24', 60),
(61, 'dez cafe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9169524063911442.jpg', '0100000010', NULL, 0, 0, '0', NULL, '2023-12-20 10:41:26', '2023-12-20 10:41:26', 61),
(62, 'tetB ttyt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/2542221950443368.jpg', '4444444444', NULL, 0, 0, '0', NULL, '2023-12-20 11:27:54', '2023-12-20 11:27:54', 62),
(63, 'ttt ttyyy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/5428542160993701.jpg', '6666666666', NULL, 0, 0, '0', NULL, '2023-12-20 11:34:34', '2023-12-20 11:34:34', 63),
(64, 'Konan Emeric', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/3105643081632906.jpg', '0141207043', NULL, 0, 0, '0', NULL, '2023-12-20 11:37:32', '2023-12-20 11:37:32', 64),
(65, 'ttrre uusbd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/884556836770311.jpg', '3535353535', NULL, 0, 0, '0', NULL, '2023-12-20 11:56:11', '2023-12-20 11:56:11', 65),
(66, 'ttrre uusbd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4323343155507892.jpg', '3535353536', NULL, 0, 0, '0', NULL, '2023-12-20 11:59:07', '2023-12-20 11:59:07', 66),
(67, 'ppl hhduej', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/3816766015545931.jpg', '1113332225', NULL, 0, 0, '0', NULL, '2023-12-20 12:06:31', '2023-12-20 12:06:31', 67),
(68, 'ppl hhduej', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/8084159250699742.jpg', '1113332226', NULL, 0, 0, '0', NULL, '2023-12-20 12:08:41', '2023-12-20 12:08:41', 68),
(69, 'ppl hhduej', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/7637448131540058.jpg', '1113332229', NULL, 0, 0, '0', NULL, '2023-12-20 12:09:09', '2023-12-20 12:09:09', 69),
(70, 'bahonto simone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9072512218774408.jpg', '0778020759', NULL, 0, 0, '0', NULL, '2023-12-20 12:58:38', '2023-12-20 12:58:38', 70),
(71, 'test Habib epargn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/3259953788754913.jpg', '2233223322', NULL, 0, 0, '0', NULL, '2023-12-21 01:04:27', '2023-12-21 01:04:27', 71),
(72, 'test Habib epargn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6944956191486836.jpg', '2525252525', NULL, 0, 0, '0', NULL, '2023-12-21 01:05:07', '2023-12-21 01:05:07', 72),
(73, 'bon bout', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9619284994820434.jpg', '0787273597', NULL, 0, 0, '0', NULL, '2023-12-21 07:20:15', '2023-12-21 07:20:15', 73),
(74, 'bon bout', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/156471048139055.jpg', '0140011814', NULL, 0, 0, '0', NULL, '2023-12-21 07:20:55', '2023-12-21 07:20:55', 74),
(75, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/5203628854233570.jpg', '9988888888', NULL, 0, 0, '0', NULL, '2023-12-21 09:27:54', '2023-12-21 09:27:54', 75),
(76, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9540560777895292.jpg', '9988888877', NULL, 0, 0, '0', NULL, '2023-12-21 09:38:36', '2023-12-21 09:38:36', 76),
(77, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/955796022031759.jpg', '9988888866', NULL, 0, 0, '0', NULL, '2023-12-21 09:39:16', '2023-12-21 09:39:16', 77),
(78, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6579247458361615.jpg', '9988888855', NULL, 0, 0, '0', NULL, '2023-12-21 09:40:56', '2023-12-21 09:40:56', 78),
(79, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/2766000949307556.jpg', '9988888833', NULL, 0, 0, '0', NULL, '2023-12-21 09:44:33', '2023-12-21 09:44:33', 79),
(80, 'eeeee eeeee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/14434846291195.jpg', '9988888822', NULL, 0, 0, '0', NULL, '2023-12-21 09:48:45', '2023-12-21 09:48:45', 80),
(81, 'kkkkkk kkkkkkkkkkkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/1683146648451549.jpg', '4444444111', NULL, 0, 0, '0', NULL, '2023-12-21 09:52:56', '2023-12-21 09:52:56', 81),
(82, 'kkkkkk kkkkkkkkkkkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/2895903420879964.jpg', '4444444222', NULL, 0, 0, '0', NULL, '2023-12-21 09:55:13', '2023-12-21 09:55:13', 82),
(83, 'kkkkkk kkkkkkkkkkkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6663903241829935.jpg', '4444444333', NULL, 0, 0, '0', NULL, '2023-12-21 09:55:28', '2023-12-21 09:55:28', 83),
(84, 'kkkkkk kkkkkkkkkkkk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/1644868456102027.jpg', '4444444555', NULL, 1, 0, '0', NULL, '2023-12-21 09:59:56', '2023-12-26 11:11:27', 84),
(85, 'Douon Manou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/8242201470871817.jpg', '0708385267', NULL, 0, 0, '0', NULL, '2023-12-21 16:01:58', '2023-12-21 16:01:58', 85),
(86, 'GOETI BI IRIE MAXIME', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/3556351632964206.jpg', 'assets/img/users/pieces/2439191748567878.jpg', 'assets/img/users/pieces/4220048622707243.jpg', '0140902924', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-22 00:37:52', '2023-12-29 02:48:30', 86),
(87, 'KOUASSI KOUADIO EZECHIEL', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/5605244182531336.jpg', 'assets/img/users/pieces/2800978733036134.jpg', 'assets/img/users/pieces/794870104403069.jpg', '0585052456', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-22 01:13:15', '2023-12-29 03:18:49', 87),
(88, 'LOBOGNON JEAN CLAUDE', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/8957086897335129.jpg', 'assets/img/users/pieces/5286045902729758.jpg', 'assets/img/users/pieces/4937149051468101.jpg', '0172137201', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-22 01:21:40', '2023-12-29 03:13:26', 88),
(89, 'LOUKOU SERGES ISRAEL', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/9436520823842091.jpg', 'assets/img/users/pieces/1063656136978000.jpg', 'assets/img/users/pieces/6155157222185541.jpg', '0160703160', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-22 01:26:16', '2023-12-29 02:42:10', 89),
(90, 'Bessou Didier', 'ras', '2008-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/1644185281319938.jpg', 'assets/img/users/pieces/1735187613178604.jpg', 'assets/img/users/photo/658dad41b2993.jpg', '0778227032', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2023-12-28 16:13:54', '2023-12-28 16:15:45', 90),
(91, 'Dodo Hermann', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/1560427177969157.jpg', '0748717191', NULL, 0, 0, '0', NULL, '2024-01-06 08:32:04', '2024-01-06 08:32:04', 91),
(92, 'AZEMA YANN', 'ABENGOUROU', '1996-07-03T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'ABIDJAN', 'assets/img/users/pieces/3271105395005895.jpg', 'assets/img/users/pieces/6694483504099239.jpg', 'assets/img/users/pieces/580245889434733.jpg', '0748408743', '01', 0, 1, '0', NULL, '2024-01-09 11:55:55', '2024-01-09 12:00:37', 92),
(93, 'dez la koka', 'ras', '2009-01-01T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'babi', 'assets/img/users/pieces/6071251465335111.jpg', 'assets/img/users/pieces/3750230639998041.jpg', 'assets/img/users/pieces/2213224458264224.jpg', '0700000001', '+225 07 00 00 00 00', 0, 1, '0', NULL, '2024-01-10 09:56:42', '2024-01-10 09:57:37', 93),
(94, 'Konan Emeric', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9005355163340122.jpg', '0141204043', NULL, 0, 0, '0', NULL, '2024-01-10 19:01:37', '2024-01-10 19:01:37', 94),
(95, 'Zamble Yao Sanhou Elvis Privat', 'Yopougon', '1997-01-24T00:00:00.000', 'Homme', 'Côte d\'Ivoire', 'Côte d\'Ivoire', 'Abidjan', 'assets/img/users/pieces/9262392020428080.jpg', 'assets/img/users/pieces/7791572200772456.jpg', 'assets/img/users/pieces/9211112102340972.jpg', '0777062680', '0777062680', 0, 1, '0', NULL, '2024-01-21 22:21:39', '2024-01-21 22:29:29', 95),
(96, 'Ello Cedric', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6733227394961190.jpg', '0101060912', NULL, 0, 0, '0', NULL, '2024-01-22 08:07:02', '2024-01-22 08:07:02', 96),
(97, 'Malahoua kouakou yannick oscar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/6922204018272947.jpg', '0709213585', NULL, 0, 0, '0', NULL, '2024-01-22 10:14:10', '2024-01-22 10:14:10', 97),
(98, 'OKOU Jean Yves kouassi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4922274247520707.jpg', '0787382498', NULL, 0, 0, '0', NULL, '2024-01-22 12:11:07', '2024-01-22 12:11:07', 98),
(99, 'Ouattara Karim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9486294347685878.jpg', '0566837675', NULL, 0, 0, '0', NULL, '2024-01-22 12:31:15', '2024-01-22 12:31:15', 99),
(100, 'djoman salomon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/4381657464665540.jpg', '0103969427', NULL, 0, 0, '0', NULL, '2024-01-22 13:51:55', '2024-01-22 13:51:55', 100),
(101, 'MALAHOUA KOUAKOU DERRICK ELCAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/9455954979874907.jpg', '0749609888', NULL, 0, 0, '0', NULL, '2024-01-22 16:10:28', '2024-01-22 16:10:28', 101),
(102, 'malahoua eunice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/users/pieces/1596024403889875.jpg', '0788501107', NULL, 0, 0, '0', NULL, '2024-01-22 19:41:21', '2024-01-22 19:41:21', 102);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_11_16_183517_create_information_identies_table', 1),
(6, '2023_11_03_222440_create_categorie_programme_tvs_table', 1),
(7, '2023_11_04_141220_create_programme_tvs_table', 1),
(8, '2023_11_04_141756_create_ebank_profils_table', 1),
(9, '2023_11_04_142128_create_transactions_table', 1),
(10, '2023_11_04_142213_create_type_abonnements_table', 1),
(11, '2023_11_04_142841_create_abonnements_table', 1),
(12, '2023_11_04_143125_create_communes_table', 1),
(13, '2023_11_04_145019_create_places_table', 1),
(14, '2023_11_04_145708_create_images_table', 1),
(15, '2023_11_04_175313_create_abouts_table', 1),
(16, '2023_11_06_040625_create_payment_tokens_table', 1),
(17, '2023_11_10_062803_create_pass_types_table', 1),
(18, '2023_11_11_181122_create_pass_visites_table', 1),
(19, '2023_11_11_181155_create_pass_tvs_table', 1),
(20, '2023_11_18_181359_create_visite_effectues_table', 1),
(21, '2023_12_02_133725_create_jobs_table', 1),
(22, '2023_12_03_130210_create_epargne_account_table', 1),
(23, '2023_12_03_131508_create_epargne_transactions_table', 1),
(24, '2023_12_03_131533_create_ebank_transactions_table', 1),
(25, '2024_01_25_003029_create_questions_table', 2),
(26, '2024_01_25_003926_create_responses_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pass_tvs`
--

DROP TABLE IF EXISTS `pass_tvs`;
CREATE TABLE IF NOT EXISTS `pass_tvs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_actif` tinyint(1) DEFAULT '0',
  `programme_tv_id` bigint UNSIGNED NOT NULL,
  `pass_type_id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_expired` tinyint(1) DEFAULT '0',
  `is_confirmed` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pass_tvs_code_unique` (`code`),
  KEY `pass_tvs_programme_tv_id_foreign` (`programme_tv_id`),
  KEY `pass_tvs_pass_type_id_foreign` (`pass_type_id`),
  KEY `pass_tvs_transaction_id_foreign` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pass_types`
--

DROP TABLE IF EXISTS `pass_types`;
CREATE TABLE IF NOT EXISTS `pass_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_visite` tinyint(1) NOT NULL DEFAULT '0',
  `nb_visite` int DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pass_types`
--

INSERT INTO `pass_types` (`id`, `name`, `is_visite`, `nb_visite`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Pass 5 maisons', 1, 5, '2000', '2023-12-14 19:00:41', NULL),
(2, 'Pass 10 maisons', 1, 10, '3000', '2023-12-14 19:00:41', NULL),
(3, 'Pass 20 maisons', 1, 20, '5000', '2023-12-14 19:00:41', NULL),
(4, 'Pass Tv', 0, 0, '300', '2023-12-14 19:00:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pass_visites`
--

DROP TABLE IF EXISTS `pass_visites`;
CREATE TABLE IF NOT EXISTS `pass_visites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `nb_visite` int NOT NULL,
  `is_expired` tinyint(1) DEFAULT '0',
  `is_confirmed` tinyint(1) DEFAULT '0',
  `transaction_id` bigint UNSIGNED NOT NULL,
  `pass_type_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pass_visites_code_unique` (`code`),
  KEY `pass_visites_pass_type_id_foreign` (`pass_type_id`),
  KEY `pass_visites_transaction_id_foreign` (`transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pass_visites`
--

INSERT INTO `pass_visites` (`id`, `transaction_number`, `code`, `end_date`, `nb_visite`, `is_expired`, `is_confirmed`, `transaction_id`, `pass_type_id`, `created_at`, `updated_at`) VALUES
(1, 'Tela$2y$10$96UBhMNwdgeG9cBNWARMFeXrj2Rov3tibdKGJ4WX51vQ7MGSM7J/mVisite', '657ba28f', '2024-01-12 00:00:00', 34, 0, 1, 2, 2, '2023-12-14 23:49:19', '2023-12-20 11:41:11'),
(2, 'Tela$2y$10$pDfwsPQBQB3AXX6Apch0n.cTeYfGTONSHR.B4S4C8CuMnSU.Ft5hKVisite', '65825403', '2023-12-27 00:00:00', 2, 0, 1, 5, 1, '2023-12-20 01:40:03', '2023-12-20 07:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tokens`
--

DROP TABLE IF EXISTS `payment_tokens`;
CREATE TABLE IF NOT EXISTS `payment_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cinetpay_api_key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ctype` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `proprio_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `proprio_telephone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `image_id` bigint UNSIGNED DEFAULT NULL,
  `photo_couverture` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_Studio` tinyint(1) DEFAULT '0',
  `is_Chambre` tinyint(1) DEFAULT '0',
  `is_Residence` tinyint(1) DEFAULT '0',
  `is_Appartment` tinyint(1) DEFAULT '0',
  `is_Bureau` tinyint(1) DEFAULT '0',
  `is_MAISON_BASSE` tinyint(1) DEFAULT '0',
  `is_DUPLEX` tinyint(1) DEFAULT '0',
  `has_PISCINE` tinyint(1) DEFAULT '0',
  `is_HAUT_STANDING` tinyint(1) DEFAULT '0',
  `has_COUR_AVANT` tinyint(1) DEFAULT '0',
  `has_COUR_ARRIERE` tinyint(1) DEFAULT '0',
  `has_GARDIEN` tinyint(1) DEFAULT '0',
  `has_GARAGE` tinyint(1) DEFAULT '0',
  `has_balcon_avant` tinyint(1) DEFAULT '0',
  `has_balcon_arriere` tinyint(1) DEFAULT '0',
  `nombre_piece` int NOT NULL,
  `nombre_salle_eau` int NOT NULL,
  `is_validated` tinyint(1) DEFAULT '0',
  `is_occupe` tinyint(1) DEFAULT '0',
  `is_rejected` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commune_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `places_user_id_foreign` (`user_id`),
  KEY `places_commune_id_index` (`commune_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `latitude`, `longitude`, `price`, `proprio_name`, `proprio_telephone`, `user_id`, `image_id`, `photo_couverture`, `ref`, `description`, `is_Studio`, `is_Chambre`, `is_Residence`, `is_Appartment`, `is_Bureau`, `is_MAISON_BASSE`, `is_DUPLEX`, `has_PISCINE`, `is_HAUT_STANDING`, `has_COUR_AVANT`, `has_COUR_ARRIERE`, `has_GARDIEN`, `has_GARAGE`, `has_balcon_avant`, `has_balcon_arriere`, `nombre_piece`, `nombre_salle_eau`, `is_validated`, `is_occupe`, `is_rejected`, `created_at`, `updated_at`, `commune_id`) VALUES
(1, NULL, NULL, '150000', 'RAS', 'RAS', 2, 1, 'assets/img/places/1702622145.jpg', '657bf3c11171d', 'CHAUFFE EAU ET CLIMATISEUR INSTALLÉS DANS CHAQUE PIECES ( NOUVELLE CONSTRUCTION)', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 0, '2023-12-15 05:35:45', '2023-12-22 00:27:34', 1),
(2, NULL, NULL, '800000', 'ras', 'ras', 3, 2, 'assets/img/places/1702623555.jpg', '657bf943eb838', 'Riviera Faya, cité ATCI\r\n cité entièrement bitumée et sécurisée, Facilité d’accès . grand salon avec salle à manger , grande cuisine ,chambres autonomes avec placards.', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 6, 2, 1, 0, 0, '2023-12-15 05:59:15', '2023-12-19 18:14:37', 6),
(3, NULL, NULL, '130000', 'RAS', 'RAS', 3, 3, 'assets/img/places/1702626011.jpg', '657c02db4870e', 'nouvelle construction, accessible au 1er étage', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, '2023-12-15 06:40:11', '2023-12-15 06:40:11', 5),
(4, NULL, NULL, '600000', 'ras', 'ras', 4, 4, 'assets/img/places/1702627067.jpg', '657c06fbdde1e', 'jardin garage toutes les chambres autonomes dans une cité bitumé.(a supprimer)', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 5, 1, 0, 1, 0, '2023-12-15 06:57:47', '2023-12-25 12:39:05', 1),
(5, NULL, NULL, '600000', 'ras', 'ras', 4, 5, 'assets/img/places/1702627243.jpg', '657c07ab7ec9f', 'Maison située à la Riviera faya route de Bingerville après feh kessé dans une cité bitumée. la maison a un jardin et garage, toutes les chambres sont autonomes .(a supprimer)', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 5, 6, 0, 1, 0, '2023-12-15 07:00:43', '2023-12-25 12:38:53', 6),
(6, NULL, NULL, '1500000', 'ras', 'ras', 6, 6, 'assets/img/places/1702628418.jpg', '657c0c42f0605', 'Riviera faya. Route de Bingerville Feh késsé : Dans une cité fermée. Garage de 2 places. Grande cuisine. 1 jardin, Pièces spacieuses.', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 9, 1, 0, 0, 0, '2023-12-15 07:20:18', '2023-12-15 07:20:18', 6),
(7, NULL, NULL, '2000000', 'ras', 'ras', 6, 7, 'assets/img/places/1702629020.jpg', '657c0e9cdc4fd', 'Cocody Riviera 4. Cité verdoyante: les chambres sont toutes autonomes. La maison possède 1 garage de 2 places; 1 piscine, 1 bureau, 1 jardin', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 7, 6, 0, 0, 0, '2023-12-15 07:30:20', '2023-12-24 14:03:25', 6),
(8, NULL, NULL, '270000', 'ras', 'ras', 7, 8, 'assets/img/places/1702629749.jpg', '657c11753c171', '1er étage balcon  avec parking interne avec deux douches', 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, '2023-12-15 07:42:29', '2023-12-15 07:42:29', 6),
(9, NULL, NULL, '2000000', 'ras', 'ras', 6, 9, 'assets/img/places/1702630054.jpg', '657c12a69cb77', 'Cocody Riviera 4.Cité verdoyante: 5 chambres toutes autonomes.1 bureau.2 cuisines 1 jardin. 1 piscine. 1 garage de 2 places.', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 7, 5, 0, 0, 0, '2023-12-15 07:47:34', '2023-12-24 14:05:02', 6),
(10, NULL, NULL, '800000', 'ras', 'ras', 6, 10, 'assets/img/places/1702630748.jpg', '657c155c23ec5', 'Cocody Riviera 4 Synacass-Ci Au 1er étage, Baies vitrés. Balcons. Pièces spacieuses. Toutes commodités', 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1, 0, 0, 0, '2023-12-15 07:59:08', '2023-12-15 07:59:08', 6),
(11, NULL, NULL, '1200000', 'ras', 'ras', 6, 11, 'assets/img/places/1702631616.jpg', '657c18c022d84', 'Villa neuve de standing entièrement meublé et équipée. Pieces spacieuses.Toutes commodités.', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-15 08:13:36', '2023-12-15 08:13:36', 6),
(12, NULL, NULL, '1200000', 'ras', 'ras', 6, 12, 'assets/img/places/1702632591.jpg', '657c1c8f40f24', 'Cocody Riviera 4. M\'badon Residentiel: Un chic appartement de bon standing, Parking interne. Sécurité 24H. Pièces spacieuses. Toutes commodités, Un séjour. Toutes chambres autonomes. 1 balcon. Split &  Chauffe eau. Buanderie.', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 3, 3, 0, 0, 0, '2023-12-15 08:29:51', '2023-12-24 14:07:46', 6),
(13, NULL, NULL, '1200000', 'ras', 'ras', 6, 13, 'assets/img/places/1702632592.jpg', '657c1c905e781', 'Cocody Riviera 4. M\'badon Residentiel: Un chic appartement de bon standing, Parking interne. Sécurité H24. Pièces spacieuses. Toutes commodités, Un séjour. Toutes chambres autonomes. Toilette visiteurs. 1 balcon. Split &  Chauffe eau. Buanderie.', 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 3, 3, 0, 0, 0, '2023-12-15 08:29:52', '2023-12-15 08:29:52', 6),
(14, NULL, NULL, '5000000', 'ras', 'ras', 6, 14, 'assets/img/places/1702633159.jpg', '657c1ec72f2ad', 'Cocody Riviera Golf 1: Une grande et belle villa duplex de standing. Pièces spacieuses. Toutes commodités. 1  jardin. 1  piscine. 1 garage 8 places.\r\n. Superficie: 1200m2.', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 17, 10, 0, 0, 0, '2023-12-15 08:39:19', '2023-12-15 08:39:19', 6),
(15, NULL, NULL, '700000', 'ras', 'ras', 6, 15, 'assets/img/places/1702638087.jpg', '657c3207539d8', 'Cocody Angré 8eme tranche Derrière la pharmacie les allées au 1er étage avec Une buanderie et Une dépendance.', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 5, 3, 0, 0, 0, '2023-12-15 10:01:27', '2023-12-15 10:01:27', 6),
(16, NULL, NULL, '6000000', 'ras', 'ras', 9, 16, 'assets/img/places/1702639013.jpg', '657c35a600031', 'Riviera Abatta, carrefour BECEAO très accessible avec jardin et sous sol', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 20, 10, 0, 0, 0, '2023-12-15 10:16:54', '2023-12-15 10:16:54', 6),
(17, NULL, NULL, '250000', 'ras', 'RAS', 10, 17, 'assets/img/places/1702640056.jpg', '657c39b8a265a', 'ANGRÉ CHU, carrefour oribat Nouveau bâtiment fraîchement sortir de terre comprenant plusieurs appartements à l\'etage accès facile non bitumé - Chambres autonomes- Climatisation intégrale- Buanderie- Toilette visiteurs- Parking interne', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 3, 1, 0, 0, 0, '2023-12-15 10:34:16', '2023-12-24 14:15:59', 6),
(18, '0', '0', '4000000', 'ras', 'ras', 11, 18, 'assets/img/places/1702640880.jpg', '657c3cf0e8af3', 'cocody DERRIÈRE AMBASSADE DE CHINE NOUVELLE CONSTRUCTION SUPERFICIE 516m² , 10 CHAMBRES AUTONOMES,  2 SALONS ET 1 BUREAU 2 CUISINES AFRICAINE ET EUROPÉENNE UN GARAGE DE 10 VOITURES 3 CHAUFFE-EAUX  UN GRAND JARDIN', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 13, 10, 0, 0, 0, '2023-12-15 10:48:00', '2024-01-16 03:50:11', 6),
(19, NULL, NULL, '180000', 'ras', 'ras', 12, 19, 'assets/img/places/1702650501.jpg', '657c6285deb66', 'YOPOUGON MAROC HAUT STANDING NOUVELLE MAISON A L\'ETAGE', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 1, 0, 1, 0, '2023-12-15 13:28:21', '2023-12-16 13:31:14', 13),
(20, NULL, NULL, '80000', 'ras', 'ras', 13, 20, 'assets/img/places/1702651270.jpg', '657c65860c9a7', 'Située Avant Le Stade de Olympique Ndotre, CHAMBRE SALON BIEN GRANDE L\'eau et  courant Disponible 2 Douche Grande Cuisine Cour Avant, Cour Arrière , La maison est proche du goudron, portail individuel', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 2, 2, 1, 1, 0, '2023-12-15 13:41:10', '2023-12-22 10:38:28', 1),
(21, NULL, NULL, '60000', 'ras', 'ras', 14, 21, 'assets/img/places/1702654320.jpg', '657c717030b02', 'Maison située à l\'entrée de Bingerville', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '2023-12-15 14:32:00', '2023-12-15 14:32:00', 5),
(22, NULL, NULL, '130000', 'ras', 'ras', 15, 22, 'assets/img/places/1702655102.jpg', '657c747e764a5', 'yopougon quartier millionnaire', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 0, '2023-12-15 14:45:02', '2023-12-22 01:02:13', 13),
(23, '0', '0', '250000', 'ras', 'ras', 16, 23, 'assets/img/places/1702655628.jpg', '657c768c2dae8', 'RIVIERA M’BADON très spacieux, à la fois traditionnel et moderne - 1 salon équipé- 1 toilette visiteur- 2 chambres autonomes- 1 cuisine équipée. Parties communes :  (Piscine et salle de sport)', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 1, 0, 0, '2023-12-15 14:53:48', '2023-12-27 09:06:05', 6),
(24, NULL, NULL, '600000', 'ras', 'ras', 17, 24, 'assets/img/places/1702656606.jpg', '657c7a5e425b0', 'nouvelle construction dans la cité sir Garage 2 voitures , Chambre principale avec balcon , Chambre autonome, Jardin', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 5, 2, 1, 0, 0, '2023-12-15 15:10:06', '2023-12-22 00:52:36', 6),
(25, NULL, NULL, '800000', 'ras', 'ras', 18, 25, 'assets/img/places/1702657077.jpg', '657c7c35970c5', 'cocody Angré nouveau chu Situé à 100 mètres du goudron, nouvelles constructions haut standing avec Chauffe eau et climatiseur installés, parking interne  2 grandes chambres autonome. Un grand salon avec balcon et toilettes visiteurs. Une grande cuisine équipée', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 3, 3, 0, 0, 0, '2023-12-15 15:17:57', '2023-12-22 00:57:48', 6),
(26, NULL, NULL, '1000000', 'ras', 'ras', 19, 26, 'assets/img/places/1702657579.jpg', '657c7e2b7857c', 'Situé la riviera 3 cité arc-en-ciel GFCI non loin de l\'église saint viateur, Une grande terrasse sur le toit 2 cuisines  cour avant et arrière, 5 chambres 2 salons', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 7, 1, 0, 0, 0, '2023-12-15 15:26:19', '2023-12-15 15:26:19', 6),
(27, NULL, NULL, '2500000', 'ras', 'ras', 20, 27, 'assets/img/places/1702657953.jpg', '657c7fa1514a5', 'Riviera palmeraie Sacré Cœur Très grand préau couvert sur la dalle Garage de 5 véhicules un jardin une cour arrière.', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 15, 15, 0, 0, 0, '2023-12-15 15:32:33', '2023-12-22 01:39:34', 6),
(28, '0', '0', '180000', 'ras', 'ras', 22, 28, 'assets/img/places/1702672244.jpg', '657cb77481937', 'YOPOUGON AGBAYATTÉ VERS LA GRANDE MOSQUÉE ET NON LOIN DU BATEAU BUS AU 3em étage FACILE D’ACCÈS AVEC UNE GRANDE CUISINE, BUANDERIE GRAND SALON, BALCON VITRÉ CHAMBRE PRINCIPALE AUTONOME, CHAMBRE VISITEURS AUTONOME', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 1, 0, 0, '2023-12-15 19:30:44', '2023-12-29 02:43:43', 13),
(29, '0', '0', '250000', 'ras', 'ras', 23, 29, 'assets/img/places/1702674831.jpg', '657cc18f95bfd', 'RIVERA ATCI TRIANGLE très bien situer à l\'etage accès facile voie bitumée', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, '2023-12-15 20:13:51', '2024-01-03 12:24:00', 6),
(30, '0', '0', '210000', 'ras', 'ras', 23, 30, 'assets/img/places/1702675196.jpg', '657cc2fcdc47a', 'cité sir au deuxième étage , ACCÈS FACIL 2 balcons grande cuisine', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 2, 1, 0, 0, '2023-12-15 20:19:56', '2023-12-29 02:50:58', 6),
(31, NULL, NULL, '3500000', 'ras', 'ras', 24, 31, 'assets/img/places/1702676978.jpg', '657cc9f29d7a1', 'COCODY 2PLATEAUX AGHEIN : Sous-sol, -07 CHAMBRES AVEC PLACARDS-01 TOILETTE VISITEUR -01 CUISINE -03 SÉJOURS-01 BUANDERIE-01 GARAGE INTERNE-01 GRAND JARDIN-02 TERRASSES', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 10, 8, 0, 0, 0, '2023-12-15 20:49:38', '2023-12-24 14:53:31', 6),
(32, '0', '0', '600000', 'ras', 'ras', 24, 32, 'assets/img/places/1702678866.jpg', '657cd1522fd8a', 'COCODY 2 PLATEAUX 9ÈME TRANCHE NON LOIN DU CENTRE COMMERCIAL SUPER U. -03 CHAMBRES SPACIEUSES AUTONOMES AVEC PLACARDS-01 CHAMBRE POUR PERSONNEL DE MAISON-01 GRAND SÉJOUR AVEC BALCON ET COIN À MANGER-01 CUISINE MODERNE-01 TOILETTE VISITEUR-AIR DE JEUX POUR ENFANTS-SPLITS/CHAUFFE EAU INSTALLÉS-PARKING INTERNE-RÉSIDENCE SÉCURISÉE-ACCES BITUMÉ', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 4, 4, 0, 0, 0, '2023-12-15 21:21:06', '2024-01-03 12:31:09', 6),
(33, '0', '0', '2200000', 'ras', 'ras', 24, 33, 'assets/img/places/1702679439.jpg', '657cd38f19ea0', '2PLATEAUX Vallon précisément dans le périmètre de PACO, non loin de la rue des jardins .\r\nPiscine, grand jardin circulaire, Garage de 04 voitures. Toutes les chambres sont équipées et placardées et autonomes.02 grandes cuisines ultra modernes( 01 Européenne, et l\'autre Africaine.)\r\nLa villa est bâtie sur 1200m2, pour ,  Habitation comme bureau , Tout est bitumée, accès facile, quartier résidentiel, calme, paisible et sécurisé.', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 7, 6, 0, 0, 0, '2023-12-15 21:30:39', '2024-01-03 12:35:14', 6),
(34, NULL, NULL, '800000', 'ras', 'ras', 24, 34, 'assets/img/places/1702679798.jpg', '657cd4f6ef3f1', 'Cocody Cité Atci, à seulement 20 minutes du lycée français et américain. 4 chambres autonomes, 2 séjours, une dépendance avec un garage pour 2 voitures', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 6, 5, 0, 0, 0, '2023-12-15 21:36:38', '2023-12-24 14:55:53', 6),
(35, '0', '0', '400000', 'ras', 'ras', 24, 35, 'assets/img/places/1702680232.jpg', '657cd6a808f65', 'RIVIERA GOLF4, 2 chambres autonomes avec placard-1séjour avec coin à manger-1cuisine moderne-parking  -chauffe eau installé-1 toilette visiteur- splits installés appartement de standing au rez-de-chaussée', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 3, 3, 0, 0, 0, '2023-12-15 21:43:52', '2023-12-29 02:56:04', 6),
(36, '0', '0', '500000', 'ras', 'ras', 24, 36, 'assets/img/places/1702680628.jpg', '657cd834c9e4c', 'Riviera bonoumain dans la cité laurie 6, 4chambres autonomes jardin garage', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 5, 4, 0, 0, 0, '2023-12-15 21:50:28', '2024-01-03 12:51:20', 6),
(37, NULL, NULL, '1500000', 'ras', 'ras', 25, 37, 'assets/img/places/1702681340.jpg', '657cdafd013a8', 'Riviera palmeraie entre l\'école Maci Canada et l’espace triangle en bordure de voie avec  garage 4 véhicules, 5 chambres + 2 dépendantes + 2 salons( nb salle eau a preciser)', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 8, 1, 0, 0, 0, '2023-12-15 22:02:21', '2023-12-15 22:02:21', 6),
(38, '0', '0', '400000', 'ras', 'ras', 25, 38, 'assets/img/places/1702681708.jpg', '657cdc6c89105', 'route abatta Situé dans une citée (nb salle eau a preciser)', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-15 22:08:28', '2023-12-29 03:00:07', 6),
(39, '0', '0', '300000', 'ras', 'ras', 25, 39, 'assets/img/places/1702682047.jpg', '657cddbf76a52', 'riviera triangle ancien camp , en bordure de voie avec parking interne et sécurité, très facile d\'accès(salle eau a preciser)', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 3, 1, 0, 0, 0, '2023-12-15 22:14:07', '2024-01-03 13:16:51', 6),
(40, '0', '0', '300000', 'ras', 'ras', 25, 40, 'assets/img/places/1702682331.jpg', '657cdedbca8f0', 'rivera triangle ancien camp ( salle eau a preciser)', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, '2023-12-15 22:18:51', '2023-12-29 03:01:22', 6),
(41, '0', '0', '800000', 'ras', 'ras', 25, 41, 'assets/img/places/1702682833.jpg', '657ce0d13c699', 'Cocody Cité Atci, à seulement 20 minutes du lycée français et américain 4 chambres autonomes, 2 séjours, une dépendance avec un garage pour 2 voitures\r\n( salle eau a preciser)', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 6, 4, 0, 0, 0, '2023-12-15 22:27:13', '2024-01-03 13:19:36', 6),
(42, NULL, NULL, '2500000', 'ras', 'ras', 25, 42, 'assets/img/places/1702683123.jpg', '657ce1f38c6d5', 'plateau haut standing , non loin de Pullman. direct Edmonde (salle eau a preciser)', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-15 22:32:03', '2023-12-15 22:32:03', 9),
(43, '0', '0', '180000', 'ras', 'ras', 27, 43, 'assets/img/places/1702683651.jpg', '657ce403bd380', 'Riviera Palmeraie Pharmacie Enika chauffage déjà Installé. L\'appartement N\'est Pas Loin Du Bitume avec un accès Facile Et Rapide', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, '2023-12-15 22:40:51', '2023-12-29 03:06:02', 6),
(44, NULL, NULL, '800000', 'ras', 'ras', 27, 44, 'assets/img/places/1702683958.jpg', '657ce536b3041', 'Cocody ANGRÉ vers le chu dans la cité  arc-en-ciel, 5 chambres à coucher --2 salons une salle à manger -- une indépendante, terrasse avant et arrière --jardin plus garage de 2 voitures( salle eau a préciser)', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 8, 5, 0, 0, 0, '2023-12-15 22:45:58', '2023-12-15 22:45:58', 6),
(45, NULL, NULL, '200000', NULL, NULL, 26, 45, 'assets/img/places/1702683960.jpg', '657ce5382542a', 'Villa meublée. Disponible actuellement pour la CAN . Le nombre de salles d\'eau n\'est pas indiqué', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 5, 1, 0, 0, 0, '2023-12-15 22:46:00', '2023-12-15 22:46:00', 6),
(46, '0', '0', '90000', 'ras', 'ras', 28, 46, 'assets/img/places/1702684414.jpg', '657ce6fe27677', 'Bingerville après le jardin botanique 1 chambre autonome facile d’accès, en bordure de voie', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, '2023-12-15 22:53:34', '2023-12-29 03:07:52', 5),
(47, '0', '0', '600000', 'ras', 'ras', 29, 47, 'assets/img/places/1702684927.jpg', '657ce8ff9a3f2', 'Riviera palmeraie cité programme 4 (salle eau a preciser)', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-15 23:02:07', '2023-12-29 03:10:38', 6),
(48, NULL, NULL, '400000', 'ras', 'ras', 30, 48, 'assets/img/places/1702685453.jpg', '657ceb0da797d', 'Angré 8ème tranche vers sicomex en bordure de route', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 3, 1, 0, 0, '2023-12-15 23:10:53', '2023-12-19 18:38:10', 6),
(49, NULL, NULL, '600000', NULL, NULL, 31, 49, 'assets/img/places/1702685837.jpg', '657cec8d771da', 'Le nombre de salle d\'eau n\'as pas ete specifier . Autres commodités à préciser: 1 grand séjour avec une salle à manger 4 chambres autonomes 1 bureau Une chambre de servante  Splits déjà installés dans toutes les pièces de la maison Un grand jardin avec un garage de 4 voitures Chambres principale avec dressing baignoire et 1 bureau 2 cuisines dont une cuisine africaine et européenne  douches visiteurs Chauffe eau installée', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 7, 1, 0, 0, 0, '2023-12-15 23:17:17', '2023-12-15 23:17:17', 6),
(50, NULL, NULL, '1500000', 'ras', 'ras', 32, 50, 'assets/img/places/1702686071.jpg', '657ced779a34a', 'COCODY NOUVEAU CHU BASE CIE Au rez-de-chaussée  1 grand séjour lumineux Salle a manger 1chambres autonomes avec douche WC visiteur  une terrasse avant  un jardin 1 garage de  4 voitures 1 grande cuisine européenne 1cuisine africaine 1 buanderie1 indépendante Au 1er étage  3 chambres autonomes  une grande chambre principale autonome avec dressing et baignoire dans la douche 1 petit bureau 1 séjour privé 1 séjour pour enfants un grand balcon avec grande terrasse', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 8, 7, 0, 0, 0, '2023-12-15 23:21:11', '2023-12-24 15:01:46', 6),
(51, NULL, NULL, '280000', NULL, NULL, 33, 51, 'assets/img/places/1702687129.jpg', '657cf199808b4', 'Le nombre de salle d\'eau n\'est pas indique.  palmeraie saint viateur avec parking interne accès très facile 1 er étage', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, '2023-12-15 23:38:49', '2023-12-15 23:38:49', 6),
(52, NULL, NULL, '800000', NULL, NULL, 34, 52, 'assets/img/places/1702687811.jpg', '657cf443040dd', 'DANS UNE CITÉ SÉCURISÉE', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 7, 1, 0, 0, 0, '2023-12-15 23:50:11', '2023-12-15 23:50:11', 6),
(53, '0', '0', '450000', NULL, NULL, 35, 53, 'assets/img/places/1702691100.jpg', '657d011ca4664', 'Le nombre de salles d\'eau n\'est pas indiqué', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-16 00:45:00', '2023-12-29 04:29:23', 6),
(54, '0', '0', '120000', NULL, NULL, 35, 54, 'assets/img/places/1702691330.jpg', '657d02027c869', 'Le nombre de salles d\'eau n\'est pas indiqué, premier étage et troisième, bon standing, accessible', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, '2023-12-16 00:48:50', '2023-12-29 04:29:55', 5),
(55, '0', '0', '800000', NULL, NULL, 35, 55, 'assets/img/places/1702710289.jpg', '657d4c1195c48', 'Le nombre de salle d\'eau n\'est pas indiquer . à seulement 20 minutes du lycée français et américain.', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 6, 1, 0, 0, 0, '2023-12-16 06:04:49', '2023-12-29 04:30:22', 6),
(56, NULL, NULL, '230000', NULL, NULL, 36, 56, 'assets/img/places/1702712006.jpg', '657d52c6a9b66', '2éme étage . Autres commodités à préciser: 2 chambres ( la principale est autonome)  1 Salon avec baie vitrée   2 douches visiteur   1e grande cuisine   2  grands balcons', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 3, 1, 0, 0, 0, '2023-12-16 06:33:26', '2023-12-16 06:33:26', 6),
(57, '0', '0', '180000', 'ras', 'ras', 47, 57, 'assets/img/places/1703238285.jpg', '65855a8de6245', 'Maison au rez-de-chaussée située à Angré chu', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, '2023-12-22 08:44:45', '2023-12-29 04:16:31', 6),
(58, '0', '0', '200000', 'ras', 'ras', 57, 58, 'assets/img/places/1703238880.jpg', '65855ce09b227', 'Bingerville dans la cité marina après le feu de feh kessé. Maison avec buanderie du rez-de-chaussée au 4ème étage', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, '2023-12-22 08:54:40', '2023-12-29 04:45:31', 5),
(59, '0', '0', '230000', 'ras', 'ras', 48, 59, 'assets/img/places/1703374454.jpg', '65876e76c17fe', 'Nouvelle construction avec 2 balcons située  à Koumassi Soweto', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 3, 0, 0, 0, '2023-12-23 22:34:14', '2023-12-29 04:18:20', 7),
(60, '0', '0', '80000', 'ras', 'ras', 49, 60, 'assets/img/places/1703375057.jpg', '658770d113cff', 'Maison située à koumassi Soweto ayant un dressing et un balcon', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, '2023-12-23 22:44:17', '2023-12-29 04:20:02', 7),
(61, '0', '0', '200000', 'ras', 'ras', 50, 61, 'assets/img/places/1703376122.jpg', '658774fa54553', 'Maison située à la riviera 2 en bordure de la voie du golf ayant 1 parking externe', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 0, 0, 0, '2023-12-23 23:02:02', '2023-12-29 04:22:38', 6),
(62, NULL, NULL, '60000', 'ras', 'ras', 53, 62, 'assets/img/places/1703376737.jpg', '65877761c76b2', 'Maison située à N\'dotre stade olympique dans dans une cour', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, '2023-12-23 23:12:17', '2023-12-23 23:12:17', 1),
(63, NULL, NULL, '30000', 'ras', 'ras', 53, 63, 'assets/img/places/1703376959.jpg', '6587783fcfb58', 'Maison située à N\'dotre stade olympique', 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '2023-12-23 23:15:59', '2023-12-23 23:15:59', 1),
(64, NULL, NULL, '90000', 'ras', 'ras', 53, 64, 'assets/img/places/1703377295.jpg', '6587798fc26df', 'Maison située à N\'dotre stade olympique', 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 3, 2, 0, 0, 0, '2023-12-23 23:21:35', '2023-12-23 23:21:35', 1),
(65, NULL, NULL, '60000', 'ras', 'ras', 53, 65, 'assets/img/places/1703377565.jpg', '65877a9de8282', 'Maison située à N\'dotre stade olympique dans une cour', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, '2023-12-23 23:26:05', '2023-12-23 23:26:05', 1),
(66, '0', '0', '160000', 'ras', 'ras', 54, 66, 'assets/img/places/1703378216.jpg', '65877d2839b2f', 'Maison situé à angré au marché Valentin non loin de la gare de moto Saloni ayant une buanderie à l\'arrière et une cour avant', 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, '2023-12-23 23:36:56', '2023-12-29 04:35:36', 6),
(67, '0', '0', '210000', 'ras', 'ras', 57, 67, 'assets/img/places/1703379210.jpg', '6587810a3a646', 'Bingerville dans la cité marina après le feu de feh kessé. Maison avec buanderie disponible au 1er, 3 ème et 4 ème étage', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 3, 0, 0, 0, '2023-12-23 23:53:30', '2023-12-29 04:45:39', 1),
(68, '0', '0', '120000', 'ras', 'ras', 57, 68, 'assets/img/places/1703379538.jpg', '658782520b15f', 'Bingerville dans la cité marina après le feu de feh kessé au rez-de-chaussée', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, '2023-12-23 23:58:58', '2023-12-29 04:45:48', 5),
(69, '0', '0', '230000', 'ras', 'ras', 56, 69, 'assets/img/places/1703380246.jpg', '65878516c22e5', 'Maison située à Koumassi Soweto', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 2, 0, 0, 0, '2023-12-24 00:10:46', '2023-12-29 04:41:38', 7),
(70, '0', '0', '100000', 'ras', 'ras', 35, 70, 'assets/img/places/1703427402.jpg', '65883d4ab6e44', 'Maison basse située juste derrière la nouvelle gare palmeraie dans une cour chacun chez soi. la douche est centrée.', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, '2023-12-24 13:16:42', '2023-12-29 04:30:38', 5),
(71, '0', '0', '160000', 'ras', 'ras', 58, 71, 'assets/img/places/1703428400.jpg', '6588413047d0e', 'Maison située à Abobo Belle ville au 2ème étage à 3 min de route', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 2, 0, 0, 0, '2023-12-24 13:33:20', '2023-12-29 04:47:57', 1),
(72, '0', '0', '600000', 'ras', 'ras', 4, 72, 'assets/img/places/1703429322.jpg', '658844ca03151', 'Maison située à la Riviera faya route de Bingerville après feh kessé dans une cité bitumée. la maison a un jardin et garage, toutes les chambres sont autonomes .', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 6, 0, 0, 0, '2023-12-24 13:48:42', '2023-12-29 04:52:43', 6),
(73, '0', '0', '300000', 'ras', 'ras', 86, 73, 'assets/img/places/1703432695.jpg', '658851f791a8b', 'Abatta secteur station ola, nouvelle construction jamais habitée disponible du rez-de-chaussée jusqu\'au 3ème étage', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 1, 0, 0, 0, '2023-12-24 14:44:55', '2023-12-29 02:47:45', 6),
(74, '0', '0', '1700000', 'ras', 'ras', 86, 74, 'assets/img/places/1703432968.jpg', '658853083a1d8', 'Riviera 3 synacass-ci 2, 04 chambres autonomes 01 Salon Lumineux 01 Cuisine Moderne 01 Dépendance 01 Garage de 02 Voitures', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 5, 5, 0, 0, 0, '2023-12-24 14:49:28', '2024-01-03 12:21:19', 6),
(75, '0', '0', '150000', 'ras', 'ras', 87, 75, 'assets/img/places/1703434045.jpg', '6588573db0e51', 'haut standing ( nouvelle construction) avec chauffe eau et climatiseur installés dans chaque pièce, Balcon', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, '2023-12-24 15:07:25', '2023-12-29 03:19:25', 13),
(76, '0', '0', '160000', 'ras', 'ras', 56, 76, 'assets/img/places/1703510295.jpg', '65898117b7844', 'Maison située à KOUMASSI ZOÉ BRUNO (SOWETO)  avec terrasse avant. NB: bulletin de salaire et contrat de travail obligatoires', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, '2023-12-25 12:18:15', '2023-12-29 04:41:49', 7),
(77, '0', '0', '150000', 'ras', 'ras', 56, 77, 'assets/img/places/1703510791.jpg', '65898307c5d9d', 'Maison située à KOUMASSI ZOÉ BRUNO (SOWETO) situé au 3ème étage avec 2 balcons. NB: bulletin de salaire et contrat de travail obligatoires', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 2, 0, 0, 0, '2023-12-25 12:26:31', '2023-12-29 04:42:03', 7),
(78, NULL, NULL, '600000', 'ras', 'ras', 4, 78, 'assets/img/places/1703512092.jpg', '6589881c5ef3d', 'Angre nouveau chu nouvelle  construction avec un accès très facile. Un parking de 2 voitures, 1 balcon, une terrasse, une salle à manger, une cour arrière, une buanderie, une cuisine moderne', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 4, 4, 0, 0, 0, '2023-12-25 12:48:12', '2023-12-25 12:48:12', 6),
(79, NULL, NULL, '500000', 'ras', 'ras', 4, 79, 'assets/img/places/1703512875.jpg', '65898b2b15c04', 'Situé à la cité Ade Mensah, en face de la pharmacie Marina au carrefour syndicat. 2 séjours (au rez de chausée et au 2è etage)- 4 chambres autonomes- 1 Split dans chacune des 6 pièces - 1 cuisine aménagée intérieure- 1 cuisine extérieure- 1 dépendance autonome - 1 garage de 2 véhicules- 1 buanderie - 2 toilettes visiteurs (au rez de chausée et au 2è étage)- 1 système de vidéo surveillance- 1 clôture. NB: frais de syndic à 10.000 F / mois', 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 6, 7, 0, 0, 0, '2023-12-25 13:01:15', '2023-12-25 13:01:15', 5),
(80, '0', '0', '300000', 'ras', 'ras', 4, 80, 'assets/img/places/1703513239.jpg', '65898c97c05b8', 'Cocody angre nouveau chu -marche djorobité, toutes les chambres sont autonomes, parking interne et sécurité garantie', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 3, 3, 0, 0, 0, '2023-12-25 13:07:19', '2023-12-29 04:52:00', 6),
(81, '0', '0', '400000', 'ras', 'ras', 4, 81, 'assets/img/places/1703513574.jpg', '65898de615e32', 'Cocody rivera faya cité ATCI, toutes les commodités sont disponibles', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0, '2023-12-25 13:12:54', '2023-12-29 04:51:42', 6),
(82, '0', '0', '60000', 'ras', 'ras', 59, 82, 'assets/img/places/1703514896.jpg', '6589931075028', 'Koumassi cité Adoha 60 mille par jour', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, '2023-12-25 13:34:56', '2023-12-29 03:54:41', 7),
(83, '0', '0', '60000', 'ras', 'ras', 59, 83, 'assets/img/places/1703515057.jpg', '658993b17faeb', 'Koumassi cité Adoha 60 mille par jour', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 0, 0, 0, '2023-12-25 13:37:37', '2023-12-29 03:54:52', 7),
(84, '0', '0', '60000', 'ras', 'ras', 59, 84, 'assets/img/places/1703515218.jpg', '65899452ee850', 'Koumassi cité Adoha 60 mille par jour', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 0, 0, 0, '2023-12-25 13:40:18', '2023-12-29 03:55:06', 7),
(85, '0', '0', '400000', 'ras', 'ras', 24, 85, 'assets/img/places/1703515665.jpg', '65899611274b3', 'Rivera golf situé au rez-de-chaussée chambres autonomes avec placard-1 séjour avec coin à manger-1cuisine moderne- parking  -chauffe eau installé-1 toilette visiteur- splits installés', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 3, 3, 0, 0, 0, '2023-12-25 13:47:45', '2023-12-29 02:55:06', 6),
(86, NULL, NULL, '1000000', 'ras', 'ras', 4, 86, 'assets/img/places/1703782668.jpg', '658da90c509aa', 'Une nouvelle construction bâtie sur 330m² au 4ème étage, située précisément à la riviera bonoumin, avec une grande salle de réception.', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, '2023-12-28 15:57:48', '2023-12-28 15:57:48', 6),
(87, '0', '0', '500000', 'ras', 'ras', 4, 87, 'assets/img/places/1703783129.jpg', '658daad962ec6', 'Située  sur la route d\'abatta une villa basse ayant des chambres autonomes ,cour avant ,arrière et une dépendante', 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 4, 4, 0, 0, 0, '2023-12-28 16:05:29', '2023-12-29 04:50:53', 6),
(88, NULL, NULL, '140000', 'ras', 'ras', 90, 88, 'assets/img/places/1703784029.jpg', '658dae5d3a1b9', 'YOPOUGON  AZITO', 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, '2023-12-28 16:20:29', '2023-12-28 16:20:29', 13),
(89, '0', '0', '250000', 'ras', 'ras', 59, 89, 'assets/img/places/1703784817.jpg', '658db1715911f', 'Koumassi cité Adoha 250.000 F par jour', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 0, 0, 0, '2023-12-28 16:33:37', '2023-12-29 03:55:32', 7);

-- --------------------------------------------------------

--
-- Table structure for table `programme_tvs`
--

DROP TABLE IF EXISTS `programme_tvs`;
CREATE TABLE IF NOT EXISTS `programme_tvs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_tournage` date NOT NULL,
  `date_diffusion` date NOT NULL,
  `link` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `duree` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorie_programme_tv_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programme_tvs_categorie_programme_tv_id_index` (`categorie_programme_tv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `programme_tvs`
--

INSERT INTO `programme_tvs` (`id`, `nom`, `type`, `date_tournage`, `date_diffusion`, `link`, `description`, `duree`, `created_at`, `updated_at`, `categorie_programme_tv_id`) VALUES
(1, 'Publicité 1', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/achetez%20group.mp4', 'Publicité 1', NULL, '2023-12-14 19:00:41', NULL, 1),
(2, 'Publicité 2', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/bio%20int.mp4', 'Publicité 2', NULL, '2023-12-14 19:00:41', NULL, 1),
(3, 'Publicité 3', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/chez%20la%20mere.mp4', 'Publicité 3', NULL, '2023-12-14 19:00:41', NULL, 1),
(4, 'Publicité 4', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/ebeniste%20simon%20yop.mp4', 'Publicité 4', NULL, '2023-12-14 19:00:41', NULL, 1),
(5, 'Publicité 5', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/etiada.mp4', 'Publicité 5', NULL, '2023-12-14 19:00:41', NULL, 1),
(6, 'Publicité 6', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/Fulumena%20services.mp4', 'Publicité 6', NULL, '2023-12-14 19:00:41', NULL, 1),
(7, 'Publicité 7', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/gana%20shop.mp4', 'Publicité 7', NULL, '2023-12-14 19:00:41', NULL, 1),
(8, 'Publicité 8', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/kafando%20service.mp4', 'Publicité 8', NULL, '2023-12-14 19:00:41', NULL, 1),
(9, 'Publicité 9', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/king%20service.mp4', 'Publicité 9', NULL, '2023-12-14 19:00:41', NULL, 1),
(10, 'Publicité 10', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/menuseri%20confiance.mp4', 'Publicité 10', NULL, '2023-12-14 19:00:41', NULL, 1),
(11, 'Publicité 11', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/mesa.mp4', 'Publicité 11', NULL, '2023-12-14 19:00:41', NULL, 1),
(12, 'Publicité 12', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/poid%20de%20senteur.mp4', 'Publicité 12', NULL, '2023-12-14 19:00:41', NULL, 1),
(13, 'Publicité 13', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/rose%20coiffure.mp4', 'Publicité 13', NULL, '2023-12-14 19:00:41', NULL, 1),
(14, 'Publicité 14', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/sa%20teck.mp4', 'Publicité 14', NULL, '2023-12-14 19:00:41', NULL, 1),
(15, 'Publicité 15', NULL, '2023-12-08', '2023-12-08', 'https://www.telaci.com/assets/videos/12-2023/style%20yop%201.mp4', 'Publicité 15', NULL, '2023-12-14 19:00:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_1` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `question_2` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reponse_1` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reponse_2` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_1`, `question_2`, `reponse_1`, `reponse_2`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test', 'test', 'test', '2024-01-28 21:34:15', '2024-01-28 21:34:15');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
CREATE TABLE IF NOT EXISTS `responses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `question_id` bigint UNSIGNED DEFAULT NULL,
  `reponse_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reponse_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responses_user_id_foreign` (`user_id`),
  KEY `responses_question_id_foreign` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_number` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `operation_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_transaction` date DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_way` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_validated` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_number`, `operation_id`, `date_transaction`, `amount`, `transaction_way`, `transaction_type`, `is_validated`, `created_at`, `updated_at`) VALUES
(1, 'Tela_Internal_Expences', 'Tela_First_Demarcheurs_Expences', '2023-12-14', '0', 'OM', 'Promotions', 0, '2023-12-14 19:00:41', NULL),
(2, 'Tela$2y$10$96UBhMNwdgeG9cBNWARMFeXrj2Rov3tibdKGJ4WX51vQ7MGSM7J/mVisite', 'ggggg', '2023-12-15', '3000', 'Orange', 'PassVisite', 0, '2023-12-14 23:49:19', '2023-12-14 23:49:19'),
(3, 'Promo', 'Tela', '2023-12-16', '0', 'Tela', 'Tela Promo', 0, '2023-12-16 16:34:56', '2023-12-16 16:34:56'),
(4, 'Promo', 'Tela', '2023-12-16', '0', 'Tela', 'Tela Promo', 0, '2023-12-16 16:35:52', '2023-12-16 16:35:52'),
(5, 'Tela$2y$10$pDfwsPQBQB3AXX6Apch0n.cTeYfGTONSHR.B4S4C8CuMnSU.Ft5hKVisite', 'MP231220.0239.A11516', '2023-12-20', '2000', 'CinetPay', 'PassVisite', 0, '2023-12-20 01:40:03', '2023-12-20 01:40:03'),
(6, 'Tela$2y$10$96UBhMNwdgeG9cBNWARMFeXrj2Rov3tibdKGJ4WX51vQ7MGSM7J/mVisite', 'MP231220.0259.C10809', '2023-12-20', '100', 'Cinetpay', 'PassVisite', 0, '2023-12-20 01:59:17', '2023-12-20 01:59:17'),
(7, 'Tela$2y$10$96UBhMNwdgeG9cBNWARMFeXrj2Rov3tibdKGJ4WX51vQ7MGSM7J/mVisite', 'MP231220.0302.A12116', '2023-12-20', '100', 'Cinetpay', 'PassVisite', 0, '2023-12-20 02:02:51', '2023-12-20 02:02:51'),
(8, 'Tela$2y$10$96UBhMNwdgeG9cBNWARMFeXrj2Rov3tibdKGJ4WX51vQ7MGSM7J/mVisite', 'MP231220.0305.B10440', '2023-12-20', '100', 'Cinetpay', 'PassVisite', 0, '2023-12-20 02:05:13', '2023-12-20 02:05:13'),
(9, 'Promo', 'Tela', '2023-12-26', '0', 'Tela', 'Tela Promo', 0, '2023-12-26 11:11:27', '2023-12-26 11:11:27'),
(10, 'Promo', 'Tela', '2023-12-26', '0', 'Tela', 'Tela Promo', 0, '2023-12-26 15:52:10', '2023-12-26 15:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `type_abonnements`
--

DROP TABLE IF EXISTS `type_abonnements`;
CREATE TABLE IF NOT EXISTS `type_abonnements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tarif_stategique` int DEFAULT NULL,
  `pourcentage_demarcheur` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `type_abonnements`
--

INSERT INTO `type_abonnements` (`id`, `title`, `price`, `type`, `tarif_stategique`, `pourcentage_demarcheur`, `created_at`, `updated_at`) VALUES
(1, 'Basic', '5000', 'demarcheur', NULL, 10, '2023-12-14 19:00:41', NULL),
(2, 'Medium', '15000', 'demarcheur', NULL, 18, '2023-12-14 19:00:41', NULL),
(3, 'Premium', '30000', 'demarcheur', NULL, 25, '2023-12-14 19:00:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prenoms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photo_profil` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `is_demarcheur` tinyint(1) DEFAULT '0',
  `is_suspended` tinyint(1) DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_validated` tinyint(1) DEFAULT '0',
  `is_completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nom`, `prenoms`, `email`, `phone`, `photo_profil`, `is_staff`, `is_demarcheur`, `is_suspended`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `balance`, `is_validated`, `is_completed`) VALUES
(1, 'test test', 'test', 'test', NULL, '0000000000', 'assets/img/users/pieces/4060972085670302.jpg', 0, NULL, 0, NULL, '$2y$10$kG7vj7Rc9GEnq6XDXduwMO2cRNo1HlMg9eQ2lnVri9KZqYPvSqw0e', NULL, '2023-12-14 20:54:01', '2023-12-16 16:35:52', '0', 1, 0),
(2, 'FAIZAN CHRIST', 'FAIZAN CHRIST', ' ', NULL, '01 50 67 57 24', 'assets/img/users/photo/6584c6d573ff3.jpg', 0, NULL, 0, NULL, '$2y$10$3F1qNPHQoUK4xoWSwrHEcOIV6CM4y9V3svbBOQPqotWqgKuzoBDeW', NULL, '2023-12-15 05:26:40', '2023-12-21 22:14:29', '0', 0, 1),
(3, 'Douho Franck', 'Douho Franck', ' ', NULL, '0142752949', 'assets/img/users/pieces/dfrbnakoypun.jpg', 0, NULL, 0, NULL, '$2y$10$1atKK2SyYXaN0kIN61Kkku0D86iWbafC4cNm5UgvWeRZvvT/vG1yy', NULL, '2023-12-15 05:52:16', '2023-12-16 11:19:59', '0', 0, 1),
(4, 'Cisse vakaramoko ismail', 'Cisse vakaramoko ismail', ' ', NULL, '0767187983', 'assets/img/users/pieces/3781923038373931.jpg', 0, NULL, 0, NULL, '$2y$10$01GSQI1xDeT.ShgIlX8FLOP97OXrpihAq5Sh8f3zCTkoXup7hfewC', NULL, '2023-12-15 06:04:26', '2023-12-29 04:54:00', '0', 0, 1),
(5, 'KROU KASSI AIME', 'KROU KASSI AIME', ' ', NULL, '0767710037', 'assets/img/users/pieces/crjcwrakoacyicb8.jpg', 0, NULL, 0, NULL, '$2y$10$CCDwYDjjNHDHEP.tXlxoNu/NajEL9W9Mf4oGB5NnM8H7Tb86xriNa', NULL, '2023-12-15 06:45:36', '2023-12-16 11:20:50', '0', 0, 1),
(6, 'M’baye Mamadou', 'M’baye Mamadou', ' ', NULL, '0704651768', 'assets/img/users/pieces/mfhbagyijkd56mama.jpg', 0, NULL, 0, NULL, '$2y$10$PD6d3r5bLNdRfd45EOdgWexjD5NveGq0uRR5TjqHH9cYPfoSrcUeW', NULL, '2023-12-15 06:52:39', '2023-12-16 11:21:50', '0', 0, 1),
(7, 'Brou Ange Constant', 'Brou Ange Constant', ' ', NULL, '0142259421', 'assets/img/users/pieces/bsgtedtykhbnhth.jpg', 0, NULL, 0, NULL, '$2y$10$VP65OMBD/WNekWcnS9tgU.bd9EU5W055.ma.Qt2ayItYDxYh4Glxy', NULL, '2023-12-15 07:28:13', '2023-12-15 07:29:06', '0', 0, 1),
(8, 'google test', 'google', 'test', NULL, '0000000001', 'assets/img/users/pieces/4821333170192485.jpg', 0, NULL, 0, NULL, '$2y$10$Y5aH/NqEwZFWZyp.UmDcAOoHYEvaGubk2EUMyhlk9.Ybijo4qEc3W', NULL, '2023-12-15 09:39:22', '2023-12-16 16:34:56', '0', 1, 0),
(9, 'NANOU JEAN', 'NANOU JEAN', ' ', NULL, '0586468663', 'assets/img/users/pieces/8712385718612122.jpg', 0, NULL, 0, NULL, '$2y$10$1oHs2EZukS4nR0wcqGJEk.o.z7fWL9ggEHMIZr92ZJ9T0YzyETuBW', NULL, '2023-12-15 10:06:21', '2023-12-29 02:12:46', '0', 0, 1),
(10, 'Goore Armand Trazie', 'Goore Armand Trazie', ' ', NULL, '0779411622', 'assets/img/users/pieces/4579292452620771.jpg', 0, NULL, 0, NULL, '$2y$10$p.V40sPPvBo7tcJZzWlG4ORkM3ahjFVXF2gXNC7Wi.t75ZfC1DAy2', NULL, '2023-12-15 10:23:16', '2023-12-29 02:15:02', '0', 0, 1),
(11, 'Noé Ephraïm Nougi', 'Noé Ephraïm Nougi', ' ', NULL, '0757057448', 'assets/img/users/pieces/9876509051823949.jpg', 0, NULL, 0, NULL, '$2y$10$a/Lk4wVYg07nppjKkITFMe.lwMUAEYA3fYnTYOe/0Het7uL06mf2i', NULL, '2023-12-15 10:40:55', '2024-01-16 03:51:12', '0', 0, 1),
(12, 'Attemené Rodolpho', 'Attemené Rodolpho', ' ', NULL, '0779637426', 'assets/img/users/pieces/8789262087030910.jpg', 0, NULL, 0, NULL, '$2y$10$q27DPyL39hIrDc4TTS2vmue/kbE0UvzN2.dzP8JPG51nSrqyAcrrK', NULL, '2023-12-15 10:56:16', '2023-12-29 02:20:02', '0', 0, 1),
(13, 'Kouabenan Uriel Fienin', 'Kouabenan Uriel Fienin', ' ', NULL, '0789324267', 'assets/img/users/pieces/5197089265896931.jpg', 0, NULL, 0, NULL, '$2y$10$F2BC65pWzIgBdbjUbg8d6u.UeYsmI0IxHEPQTsrqIPGUHDOowZbvK', NULL, '2023-12-15 13:32:21', '2023-12-29 02:23:44', '0', 0, 1),
(14, 'Dasse Jonathan', 'Dasse', ' Jonathan', NULL, '0143834131', 'assets/img/users/pieces/lcidsdbdcjnjk.jpg', 0, NULL, 0, NULL, '$2y$10$AsnndlsDIg3bz349lofvN.oChuTNAHDG3rUdvmjNP/x8Mp9eli9aC', NULL, '2023-12-15 14:24:49', '2024-01-16 03:59:48', '0', 0, 1),
(15, 'Annasse Dabré Ousmane', 'Annasse Dabré Ousmane', ' ', NULL, '0143926508', 'assets/img/users/pieces/4321225667582992.jpg', 0, NULL, 0, NULL, '$2y$10$S8rEmPou2PXDNHh7DoirlulQ2B0ATD0E7n1LrFuu2sFqvzBy0IMX2', NULL, '2023-12-15 14:37:27', '2023-12-29 02:26:38', '0', 0, 1),
(16, 'Winle Éric', 'Winle Éric', ' ', NULL, '0140062887', 'assets/img/users/pieces/7003920862958301.jpg', 0, NULL, 0, NULL, '$2y$10$cfXHzbxrJHZt/BWLI4qhzufFjgFax1sQ0OckP3oW58OeMuvOSSOQu', NULL, '2023-12-15 14:49:03', '2023-12-29 02:28:11', '0', 1, 1),
(17, 'SANGARE SIAKA', 'SANGARE SIAKA', ' ', NULL, '0544295169', 'assets/img/users/pieces/4787504711601775.jpg', 0, NULL, 0, NULL, '$2y$10$urn2dFMNbQhBavX8YDoDAuGtFlTtLx/YPb3bpGulORnA3qRqBLiTG', NULL, '2023-12-15 15:05:46', '2023-12-29 02:29:56', '0', 0, 1),
(18, 'Kouame Axel', 'Kouame Axel', ' ', NULL, '0769475516', 'assets/img/users/pieces/2009854900830032.jpg', 0, NULL, 0, NULL, '$2y$10$YobaqWNZBtp4jEHghsyRmO8r8jiZTMSYVEziW6KHh280rsmMlBZCy', NULL, '2023-12-15 15:13:14', '2023-12-29 02:31:17', '0', 0, 1),
(19, 'TANO KOTCHI', 'TANO KOTCHI', ' ', NULL, '0564954570', 'assets/img/users/pieces/6899386972319078.jpg', 0, NULL, 0, NULL, '$2y$10$iLmqSGcjhc7BVQwGZ8rKI.P1mk/TEHLE7qrXk5d1.C9KrTGuBX/2e', NULL, '2023-12-15 15:21:25', '2023-12-29 02:36:54', '0', 0, 1),
(20, 'AHIKPA ROGER DAGOU', 'AHIKPA ROGER DAGOU', ' ', NULL, '0152401971', 'assets/img/users/pieces/2812997535444608.jpg', 0, NULL, 0, NULL, '$2y$10$qSBtLjsPVFVVNVRprl5LaeDKGUQZQ8OXrsgbQVCbbCSlU27/XxCZi', NULL, '2023-12-15 15:28:42', '2023-12-29 02:39:45', '0', 0, 1),
(21, 'AKOUMIA DÉSIRÉ', 'AKOUMIA', 'DÉSIRÉ', 'stevenakoumia2011@gmail.com', '0758819584', 'assets/img/users/pieces/5041894677787629.jpg', 1, NULL, 0, NULL, '$2y$10$a0YR7Qzg8oiU/tXp5/DgJ.qlzLmj0Lhb07gap0b5AgPPyv7lnXg.G', NULL, '2023-12-15 17:04:13', '2023-12-15 17:04:13', '0', 0, 0),
(22, 'ASSI Félicien', 'ASSI Félicien', ' ', NULL, '0141903451', 'assets/img/users/pieces/7504936091073182.jpg', 0, NULL, 0, NULL, '$2y$10$/vIwPqH74g2NozYLThrP1eyH7DmCtIoTAayJx94UWA54dZhVw2RxC', NULL, '2023-12-15 19:25:05', '2023-12-29 02:45:42', '0', 0, 1),
(23, 'TAPA David', 'TAPA David', ' ', NULL, '0501295353', 'assets/img/users/pieces/501845272285620.jpg', 0, NULL, 0, NULL, '$2y$10$6klAs9iTts/HwYuHJKrXtOhVUsCPq6DB7ohHhRd7kzHRzDoH2D3ri', NULL, '2023-12-15 20:06:05', '2023-12-29 02:51:47', '0', 0, 1),
(24, 'Sehi Joëlle', 'Sehi Joëlle', ' ', NULL, '0779366345', 'assets/img/users/pieces/4190772256749214.jpg', 0, NULL, 0, NULL, '$2y$10$HAqwWjKltBdDNEjubky3i.0g83LjJkdvnqWpMQXgJTi8wkdyTzPHi', NULL, '2023-12-15 20:24:25', '2023-12-29 02:53:21', '0', 0, 1),
(25, 'N’GUESSAN Léonce', 'N’GUESSAN Léonce', ' ', NULL, '0140885508', 'assets/img/users/pieces/1702681041.jpg', 0, NULL, 0, NULL, '$2y$10$RF1R.UdRw/8ZjrH3wXn.Se549H50krPk.RNTWoS0zkbPSGxDtpffq', NULL, '2023-12-15 21:57:21', '2023-12-16 11:39:40', '0', 0, 1),
(26, 'YAPO KEVIN AYMAR ROMUALD MINZAN', 'YAPO KEVIN AYMAR ROMUALD MINZAN', ' ', NULL, '0757244602', 'assets/img/users/pieces/1702683151.png', 0, NULL, 0, NULL, '$2y$10$2qXpV./g20glRNywFsED4esjeZptc2Oh9zxCp4l.UE6jZi2CuKbhe', NULL, '2023-12-15 22:32:31', '2023-12-15 22:35:20', '0', 0, 1),
(27, 'Bosse Ange', 'Bosse Ange', ' ', NULL, '0171137112', 'assets/img/users/pieces/1702683424.jpg', 0, NULL, 0, NULL, '$2y$10$B9PuAI.7LQq9xC3HKgxCN.CLjrtP.IvvF3o1jb/ZL3zS4aaH0VoCu', NULL, '2023-12-15 22:37:04', '2023-12-16 11:40:11', '0', 0, 1),
(28, 'OKA Franc', 'OKA Franc', ' ', NULL, '0703819073', 'assets/img/users/pieces/3642966458381791.jpg', 0, NULL, 0, NULL, '$2y$10$umfz0CI/qZWAwRG9Q3tCVel4JKvGMG4ofZpKZNY9hh96OBK6XzG7q', NULL, '2023-12-15 22:49:24', '2023-12-29 03:08:55', '0', 0, 1),
(29, 'DJORO Adou Esaïe Jonathan', 'DJORO Adou Esaïe Jonathan', ' ', NULL, '0788260424', 'assets/img/users/pieces/1702684653.jpg', 0, NULL, 0, NULL, '$2y$10$qU4p9qQ40BsyY3mkgkQgK.x2M8a3x7Vs5eZZ14VqvM8chpsFN85my', NULL, '2023-12-15 22:57:33', '2023-12-16 11:41:12', '0', 0, 1),
(30, 'OUALLO Nemlin Noël', 'OUALLO Nemlin Noël', ' ', NULL, '0170901146', 'assets/img/users/pieces/1702685263.jpg', 0, NULL, 0, NULL, '$2y$10$vYEbvW4WaZimuGJnaeGduuiQJiED2AHFcU9lOB56NYmDKf.T8jfV6', NULL, '2023-12-15 23:07:43', '2024-01-16 04:07:10', '0', 0, 1),
(31, 'CARTES MARIO', 'CARTES MARIO', ' ', NULL, '0749589201', 'assets/img/users/pieces/1702685477.jpg', 0, NULL, 0, NULL, '$2y$10$2J17N1vYrfrYv1u1tBoQGeg1U/4YcxqjBtKUqdwzg2kvigO95Tix6', NULL, '2023-12-15 23:11:17', '2023-12-15 23:12:51', '0', 0, 1),
(32, 'Banse Benjamin', 'Banse Benjamin', ' ', NULL, '0797233146', 'assets/img/users/pieces/881221917542929.jpg', 0, NULL, 0, NULL, '$2y$10$oYy54PB5FcuaGXcX.rQczeh9dPM62kelhdaNTwI4UnroxzRVnL2WW', NULL, '2023-12-15 23:14:43', '2023-12-29 03:16:44', '0', 0, 1),
(33, 'KELI BORIS', 'KELI BORIS', ' ', NULL, '0778438513', 'assets/img/users/pieces/1702686809.jpg', 0, NULL, 0, NULL, '$2y$10$hP86IbPKQaLd3KJIgHc85erxgSVturYQuehig9aldi9NWQ6/QLFFi', NULL, '2023-12-15 23:33:29', '2023-12-15 23:34:33', '0', 0, 1),
(34, 'Lago Salomon Fabrice', 'Lago Salomon Fabrice', ' ', NULL, '0709815775', 'assets/img/users/pieces/1702687518.jpg', 0, NULL, 0, NULL, '$2y$10$uyQ.zqIhWyyjHbra5aqYSOQw6X5du0JWO.yVDKlofauktc1lBYQa2', NULL, '2023-12-15 23:45:18', '2023-12-15 23:46:25', '0', 0, 1),
(35, 'Dogbo Goffry Isaac Trésor', 'Dogbo Goffry Isaac Trésor', ' ', NULL, '0586239318', 'assets/img/users/pieces/1702690779.jpg', 0, NULL, 0, NULL, '$2y$10$GpjF9TKZftony5tYC/OPu.guXQK1Rq3mkK9M/i7rZHIMjYufiK4V6', NULL, '2023-12-16 00:39:39', '2023-12-16 00:40:35', '0', 0, 1),
(36, 'N\'GUESSAN ADJOUA FLORENCE', 'N\'GUESSAN ADJOUA FLORENCE', ' ', NULL, '0707993749', 'assets/img/users/pieces/1702711720.jpg', 0, NULL, 0, NULL, '$2y$10$fF6G8nMGtk3hfisgN6D3fOcZP1DZnlmRJbriDQA0.o4uKt2UD1l2S', NULL, '2023-12-16 06:28:40', '2023-12-16 06:29:39', '0', 0, 1),
(37, 'Sereme Habib', 'Sereme', 'Habib', 'habib.sereme@telaci.com', '0151838383', 'assets/img/users/pieces/9896626766837350.jpg', 1, NULL, 0, NULL, '$2y$10$KrZXtATHYPIItdHlKVLJ9u3VRMW3C4f4v3zWwYKKr3jL8oAK1C2yu', NULL, '2023-12-16 11:25:00', '2023-12-20 10:32:36', '0', 0, 1),
(38, 'Coulibaly Soro Mohamed', 'Coulibaly', 'Soro Mohamed', NULL, '0749908783', 'assets/img/users/pieces/5511163993920931.jpg', 0, NULL, 0, NULL, '$2y$10$MxnvdzPJfVVHEy.dZfBvtOmwx4eErb/4qRNjLuIcHfcA/mxM4/yhe', NULL, '2023-12-19 07:55:09', '2023-12-19 07:55:09', '0', 0, 0),
(39, 'Kone Cheick Mohamed', 'Kone', 'Cheick Mohamed', NULL, '0758142125', 'assets/img/users/pieces/443134355451237.jpg', 0, NULL, 0, NULL, '$2y$10$kk18K3CrNLM.iZgEkWEhqeZzy5N0nTgtvyhYIJNLUi7sxyCP/dCQ.', NULL, '2023-12-19 08:11:14', '2023-12-29 03:52:33', '0', 0, 0),
(40, 'Brou N\'guessan Ayo Herman', 'Brou', 'N\'guessan Ayo Herman', NULL, '7068422589', 'assets/img/users/pieces/157817777910200.jpg', 0, NULL, 0, NULL, '$2y$10$nODjWr0nG712RG1tcdAqP.Sc.ouSLoE84ELdtrLqM5KChTysVQj7.', NULL, '2023-12-19 08:35:29', '2023-12-19 08:35:29', '0', 0, 0),
(41, 'Tano Ange Patrick', 'Tano', 'Ange Patrick', NULL, '0141176752', 'assets/img/users/pieces/4483859066370389.jpg', 0, NULL, 0, NULL, '$2y$10$AjWB8M8HGu0QcLVrOHVE3.NnOkEiakTdyL0CvaA8GlMBF3B/sXjsS', NULL, '2023-12-19 08:38:13', '2023-12-19 08:38:13', '0', 0, 0),
(42, 'Traore Mohamed', 'Traore', 'Mohamed', NULL, '0709024783', 'assets/img/users/pieces/9704290363220758.jpg', 0, NULL, 0, NULL, '$2y$10$unWKyNe7f6o4SXaq4I1KjO78CCtOdsRf/NErxkqT5wIvjy8SDU6gi', NULL, '2023-12-19 08:40:27', '2023-12-19 08:40:28', '0', 0, 0),
(43, 'Konan Evariste', 'Konan', 'Evariste', NULL, '0777094325', 'assets/img/users/pieces/6458234091242813.jpg', 0, NULL, 0, NULL, '$2y$10$1Jdj/eMuIBft2mkBodOKTOOu0nbvWH1GSJ7CKYu3JU516waJ9z9cG', NULL, '2023-12-19 08:42:20', '2023-12-29 04:05:21', '0', 0, 0),
(44, 'Djoman Junior', 'Djoman', 'Junior', NULL, '0704218340', 'assets/img/users/pieces/3366978430285906.jpg', 0, NULL, 0, NULL, '$2y$10$JXqQ.9YC5yHayrHToRbt1eTiJgeKYXJGKytgOomPufzYKjDFAadFy', NULL, '2023-12-19 08:43:51', '2023-12-29 04:09:06', '0', 0, 0),
(45, 'Bogui Roland', 'Bogui', 'Roland', NULL, '0101486119', 'assets/img/users/pieces/9100352565525234.jpg', 0, NULL, 0, NULL, '$2y$10$HnoZwRp89F9MUN83hRz0OOrDPZM0RU.OcSa.BngLLNyIm8WJfn0rC', NULL, '2023-12-19 08:46:08', '2023-12-29 04:11:39', '0', 0, 0),
(46, 'Koffi Guy', 'Koffi', 'Guy', NULL, '0758381070', 'assets/img/users/pieces/4323569974843490.jpg', 0, NULL, 0, NULL, '$2y$10$/rEJif8PCPQuAs/6n4GgAukQJ1oJ3sh8oh1I7rAaguHzdES5YpAyi', NULL, '2023-12-19 08:48:30', '2023-12-29 04:14:02', '0', 0, 0),
(47, 'Bah Olivier', 'Bah', 'Olivier', NULL, '0505480231', 'assets/img/users/pieces/9699710927360750.jpg', 0, NULL, 0, NULL, '$2y$10$Tjx47GCpbPBvdLYz361YreUiLlCTXN3JA/0DADrZ4.6kCrctV6sYy', NULL, '2023-12-19 08:51:40', '2023-12-29 04:16:15', '0', 0, 1),
(48, 'Houenou Tinoh', 'Houenou', 'Tinoh', NULL, '0707210937', 'assets/img/users/pieces/4887619366304688.jpg', 0, NULL, 0, NULL, '$2y$10$HcuEk.lAWV0Duvq0OvechOcfSeeNsGLqX.YG3gXO7zFQN7U.UoDYS', NULL, '2023-12-19 08:53:42', '2023-12-29 04:18:07', '0', 0, 1),
(49, 'Gedeon Aimé', 'Gedeon', 'Aimé', NULL, '0748994287', 'assets/img/users/pieces/4341760097999608.jpg', 0, NULL, 0, NULL, '$2y$10$2.1fSt7oUpO4Izn87oSkG.P/n1HbqgVa.anbLPtIqf8h5PHzZl6Lq', NULL, '2023-12-19 08:56:05', '2023-12-29 04:19:49', '0', 0, 1),
(50, 'Tourey Celestin Everest', 'Tourey', 'Celestin Everest', NULL, '0777014352', 'assets/img/users/pieces/9687656490769333.jpg', 0, NULL, 0, NULL, '$2y$10$CqloL/UjAC2PQuWeZI/w.uSf3MCi8Efa8RUoyrq5sZBfeJCzpcXuu', NULL, '2023-12-19 08:57:44', '2023-12-29 04:21:44', '0', 0, 1),
(51, 'Kouassike Sosthene', 'Kouassike', 'Sosthene', NULL, '0709443350', 'assets/img/users/pieces/2625202735072883.jpg', 0, NULL, 0, NULL, '$2y$10$J.wEsL.xaPDD/BcgYwaWbOHWTVIbuH0flSg6NNcdsZor5odQtSl1i', NULL, '2023-12-19 09:00:18', '2023-12-29 04:24:39', '0', 0, 0),
(52, 'Bedy Emmanuel', 'Bedy', 'Emmanuel', NULL, '0769527317', 'assets/img/users/pieces/7394276562099205.jpg', 0, NULL, 0, NULL, '$2y$10$SjUZ88Yd/ePtr.FOHjSn/OXcEMOKgxWiiWp4/ZBTlXOXJJOA..G9a', NULL, '2023-12-19 09:02:13', '2023-12-29 04:26:31', '0', 0, 0),
(53, 'Boga Samuel', 'Boga', 'Samuel', NULL, '0749500502', 'assets/img/users/pieces/1849118228068132.jpg', 0, NULL, 0, NULL, '$2y$10$Lygi/JskLwGum4UDQwP5rubEbgoTRADNkYJz3LpzEhXz6YA2ZEcCq', NULL, '2023-12-19 09:18:58', '2023-12-29 04:32:22', '0', 0, 1),
(54, 'Oulai Habib', 'Oulai', 'Habib', NULL, '0757697555', 'assets/img/users/pieces/1984438987820488.jpg', 0, NULL, 0, NULL, '$2y$10$cGdD5gJYYOxHxFfDyiP1iOk4nvw84kmwaIsCxYlM7Z47eMaCD/7Y.', NULL, '2023-12-19 09:22:50', '2023-12-29 04:34:12', '0', 0, 1),
(55, 'Toe Désiré Abdoul Rasak', 'Toe', 'Désiré Abdoul Rasak', NULL, '0769214535', 'assets/img/users/pieces/4295208484168105.jpg', 0, NULL, 0, NULL, '$2y$10$/bopWrlgYc/9Hq2WAO2o6.Lshwuf7vtZDfAwerMiX.9g1w2k8Fd.6', NULL, '2023-12-19 09:25:42', '2023-12-29 04:38:19', '0', 0, 0),
(56, 'Lawson Ange Michel', 'Lawson', 'Ange Michel', NULL, '0778341044', 'assets/img/users/pieces/5683091040079679.jpg', 0, NULL, 0, NULL, '$2y$10$DSBaniabCq4rVj9kJWDLm.DnIl10m7uzEScPWOTGSCt79wzka5dlS', NULL, '2023-12-19 09:27:15', '2023-12-29 04:41:21', '0', 0, 1),
(57, 'Zambe Bi Boti David', 'Zambe', 'Bi Boti David', NULL, '0757678528', 'assets/img/users/pieces/6822825787173603.jpg', 0, NULL, 0, NULL, '$2y$10$5NmkwMdcrJr2s7zR6IagdeTr/PpWqBRbcixw/ZGSMIYasoYiCa.dy', NULL, '2023-12-19 09:32:04', '2023-12-29 04:46:42', '0', 0, 1),
(58, 'Bogui Lobognon Bohue Patrick', 'Bogui', 'Lobognon Bohue Patrick', NULL, '0500500194', 'assets/img/users/pieces/405805635035665.jpg', 0, NULL, 0, NULL, '$2y$10$TeOD1gGUNCz8a/vfki4Jfu9lPdeEHtNsBHim8.yVHguTOpKV4YeIi', NULL, '2023-12-19 09:34:20', '2023-12-29 04:49:12', '0', 0, 1),
(59, 'Brou Nguessan Ayo Herman', 'Brou', 'Nguessan Ayo Herman', NULL, '0768422589', 'assets/img/users/pieces/5452865637962780.jpg', 0, NULL, 0, NULL, '$2y$10$hfiV1sdZiD1kSfZDKNXZNuLzh.sU2GI4iT29G5f/76CLcD2Z7kUOa', NULL, '2023-12-19 10:10:02', '2023-12-25 13:18:34', '0', 0, 1),
(60, 'test test', 'test', 'test', NULL, '0101004521', 'assets/img/users/pieces/1265806201182911.jpg', 0, NULL, 0, NULL, '$2y$10$cDEbaDvdE1IcbZmHw8UWpeFWdpPJqc4GpbRTKEivudSZcFecnOIki', NULL, '2023-12-20 07:53:22', '2023-12-20 08:31:24', '0', 0, 1),
(61, 'dez cafe', 'dez', 'cafe', NULL, '0100000010', 'assets/img/users/pieces/9169524063911442.jpg', 0, NULL, 0, NULL, '$2y$10$8F.Qy4DDwXJ7K5Bwwnzsq.3PMaF2egKN1cTe4UZF/EDOxIcSCGCQG', NULL, '2023-12-20 10:41:26', '2023-12-20 10:41:26', '0', 0, 0),
(62, 'tetB ttyt', 'tetB', 'ttyt', NULL, '4444444444', 'assets/img/users/pieces/2542221950443368.jpg', 0, NULL, 0, NULL, '$2y$10$823TZ2LZZTYUqICbsYGWUuwmjv.q.eABfj3RBKfyooRCQWXfOBtsi', NULL, '2023-12-20 11:27:54', '2023-12-20 11:27:54', '0', 0, 0),
(63, 'ttt ttyyy', 'ttt', 'ttyyy', NULL, '6666666666', 'assets/img/users/pieces/5428542160993701.jpg', 0, NULL, 0, NULL, '$2y$10$ACcWkPx..c.6.Ul4BHIS2.Npxa1h3E4x7gD28MSosTZyqkcdoFSY2', NULL, '2023-12-20 11:34:34', '2023-12-20 11:34:34', '0', 0, 0),
(64, 'Konan Emeric', 'Konan', 'Emeric', 'Emerickonan07@gmail.com', '0141207043', 'assets/img/users/pieces/3105643081632906.jpg', 1, NULL, 0, NULL, '$2y$10$g/WmNdS1Dur7GMTOZN4JfeQc2jRmIt0VQdJFxFJy2SPrPMVwULSRC', NULL, '2023-12-20 11:37:32', '2023-12-20 11:37:32', '0', 0, 1),
(65, 'ttrre uusbd', 'ttrre', 'uusbd', NULL, '3535353535', 'assets/img/users/pieces/884556836770311.jpg', 0, NULL, 0, NULL, '$2y$10$F.cvVwDh32AZTZvVw1.Ipe62r1qufEe7cyLoVVHR.fZ7mxjkuoIvu', NULL, '2023-12-20 11:56:11', '2023-12-20 11:56:11', '0', 0, 0),
(66, 'ttrre uusbd', 'ttrre', 'uusbd', NULL, '3535353536', 'assets/img/users/pieces/4323343155507892.jpg', 0, NULL, 0, NULL, '$2y$10$ckzETJ1cjHRQa936Qfji0e5kyuBgKWjO.2sZHeQUHKlHZukdG.00S', NULL, '2023-12-20 11:59:07', '2023-12-20 11:59:07', '0', 0, 0),
(67, 'ppl hhduej', 'ppl', 'hhduej', NULL, '1113332225', 'assets/img/users/pieces/3816766015545931.jpg', 0, NULL, 0, NULL, '$2y$10$C41oqVvpErHGwH/oiyZGm.ynvT1/daQhs9pIhdochQWrdcA3oqkHy', NULL, '2023-12-20 12:06:31', '2023-12-20 12:06:31', '0', 0, 0),
(68, 'ppl hhduej', 'ppl', 'hhduej', NULL, '1113332226', 'assets/img/users/pieces/8084159250699742.jpg', 0, NULL, 0, NULL, '$2y$10$1ME49h4FGdBRYwHI.0oSfeMB3iTwn8wNcBMpvWP6VzGNRppQOMGI2', NULL, '2023-12-20 12:08:41', '2023-12-20 12:08:41', '0', 0, 0),
(69, 'ppl hhduej', 'ppl', 'hhduej', NULL, '1113332229', 'assets/img/users/pieces/7637448131540058.jpg', 0, NULL, 0, NULL, '$2y$10$lLGNzpj.lseOWcuWkc027eBwE8Q7xdUc3YX.OYkDUNmFLO9MtHZ8.', NULL, '2023-12-20 12:09:08', '2023-12-20 12:09:09', '0', 0, 0),
(70, 'bahonto simone', 'bahonto', 'simone', 'bahontosimone80@gmail.com', '0778020759', 'assets/img/users/pieces/9072512218774408.jpg', 1, NULL, 0, NULL, '$2y$10$7Sor9iK5k3vAC8VH5AWR.edr4SFvrtobZRxOwLg07P04pZpgH23I.', NULL, '2023-12-20 12:58:38', '2023-12-20 12:58:38', '0', 0, 1),
(71, 'test Habib epargn', 'test', 'Habib epargn', NULL, '2233223322', 'assets/img/users/pieces/3259953788754913.jpg', 0, NULL, 0, NULL, '$2y$10$oNXn.nShd.WnczEqm4KR2urfQ8/a1YVwjuTIyl6DJEipB4n7qCn4S', NULL, '2023-12-21 01:04:26', '2023-12-21 01:04:27', '0', 0, 0),
(72, 'test Habib epargn', 'test', 'Habib epargn', NULL, '2525252525', 'assets/img/users/pieces/6944956191486836.jpg', 0, NULL, 0, NULL, '$2y$10$rjw5p00PoBJYg3vAfKd2NeaB9A3Abn8kuHJdP.7CVVRqkIaFC1oX2', NULL, '2023-12-21 01:05:07', '2023-12-21 01:05:07', '0', 0, 0),
(73, 'bon bout', 'bon', 'bout', NULL, '0787273597', 'assets/img/users/pieces/9619284994820434.jpg', 0, NULL, 0, NULL, '$2y$10$IofzlWnaNE2OefyHpK/JoejQlmwfybrMJhVLBiPDtXc4kIT78W8tG', NULL, '2023-12-21 07:20:15', '2023-12-21 07:20:15', '0', 0, 0),
(74, 'bon bout', 'bon', 'bout', NULL, '0140011814', 'assets/img/users/pieces/156471048139055.jpg', 0, NULL, 0, NULL, '$2y$10$.NkKGdy9d8qEQr44o8Qqy.hpe7qvCpaqv6Ki7UxEVkqv6orm68.dy', NULL, '2023-12-21 07:20:55', '2023-12-21 07:20:55', '0', 0, 0),
(75, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888888', 'assets/img/users/pieces/5203628854233570.jpg', 0, NULL, 0, NULL, '$2y$10$42M/67qSwM5JQ4rz//PYoeZd5lv49N1BdHm0ec2vfuO8A5o/GVWNi', NULL, '2023-12-21 09:27:54', '2023-12-21 09:27:54', '0', 0, 0),
(76, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888877', 'assets/img/users/pieces/9540560777895292.jpg', 0, NULL, 0, NULL, '$2y$10$dtB3Y0PFAo3sZCarkzbMY.aFQOnN7QUrwwKzNd4VhU2e9DuJfX/ga', NULL, '2023-12-21 09:38:36', '2023-12-21 09:38:36', '0', 0, 0),
(77, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888866', 'assets/img/users/pieces/955796022031759.jpg', 0, 1, 0, NULL, '$2y$10$DRiUHcRIU0fQEFTaivH5Ne1dGf4CROoNlY5k2L7IZRapV3zXHDwEu', NULL, '2023-12-21 09:39:16', '2023-12-21 09:39:16', '0', 0, 0),
(78, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888855', 'assets/img/users/pieces/6579247458361615.jpg', 0, 1, 0, NULL, '$2y$10$vK3TurSUWyEJ3iuZiIoGFOZQ2lLBfhyfbpSsZVLecGIxI8v.CRlke', NULL, '2023-12-21 09:40:56', '2023-12-21 09:40:56', '0', 0, 0),
(79, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888833', 'assets/img/users/pieces/2766000949307556.jpg', 0, 1, 0, NULL, '$2y$10$/TGAKtuBMVXBfVu6Y6bWMeMPC6yxvxwe5yks8PhG28jCv73udGYyO', NULL, '2023-12-21 09:44:33', '2023-12-21 09:44:33', '0', 0, 0),
(80, 'eeeee eeeee', 'eeeee', 'eeeee', NULL, '9988888822', 'assets/img/users/pieces/14434846291195.jpg', 0, 1, 0, NULL, '$2y$10$V23boQD5LaHiBs0hYPRx2eE1gSv./FgkYZ7TSscMDDiPMpKwr/5A.', NULL, '2023-12-21 09:48:44', '2023-12-21 09:48:45', '0', 0, 0),
(81, 'kkkkkk kkkkkkkkkkkk', 'kkkkkk', 'kkkkkkkkkkkk', NULL, '4444444111', 'assets/img/users/pieces/1683146648451549.jpg', 0, 1, 0, NULL, '$2y$10$6n3mSBwtMo16fbn4Nh7sXeJxORzwb/vyBYX8xrJpgBr4i55KAu1x2', NULL, '2023-12-21 09:52:56', '2023-12-21 09:52:56', '0', 0, 0),
(82, 'kkkkkk kkkkkkkkkkkk', 'kkkkkk', 'kkkkkkkkkkkk', NULL, '4444444222', 'assets/img/users/pieces/2895903420879964.jpg', 0, 1, 0, NULL, '$2y$10$KaXbxKqxYxRtN8uvhA3fC.SliTMIGltJ2AfQgMEkaMQ39zQRmB.GS', NULL, '2023-12-21 09:55:13', '2023-12-21 09:55:13', '0', 0, 0),
(83, 'kkkkkk kkkkkkkkkkkk', 'kkkkkk', 'kkkkkkkkkkkk', NULL, '4444444333', 'assets/img/users/pieces/6663903241829935.jpg', 0, 1, 0, NULL, '$2y$10$x7l2E7IUbF8qoLcjy5HcUum2Puw7VEBM/QA1Uylabeyx8evHJccdi', NULL, '2023-12-21 09:55:28', '2023-12-21 09:55:28', '0', 0, 0),
(84, 'kkkkkk kkkkkkkkkkkk', 'kkkkkk', 'kkkkkkkkkkkk', NULL, '4444444555', 'assets/img/users/pieces/1644868456102027.jpg', 0, 1, 0, NULL, '$2y$10$oZDxhmKZzTe8UcTKtvUJW.1QcylvzDEe42huNAq/h9CjE2zn5NRHG', NULL, '2023-12-21 09:59:56', '2023-12-26 11:11:27', '0', 1, 0),
(85, 'Douon Manou', 'Douon', 'Manou', NULL, '0708385267', 'assets/img/users/pieces/8242201470871817.jpg', 0, 1, 0, NULL, '$2y$10$JGByxwRK3BKI8F6R9N8gLu3VRexsH0nR3rjf.hnMdsNVUZFSaIAPy', NULL, '2023-12-21 16:01:58', '2023-12-21 16:01:58', '0', 0, 0),
(86, 'GOETI BI IRIE MAXIME', 'GOETI', 'BI IRIE MAXIME', NULL, '0140902924', 'assets/img/users/pieces/4220048622707243.jpg', 0, 1, 0, NULL, '$2y$10$SuXonDrUd0KS52J7x3NQPO3es7Zo863D56SkHKDSIiFrfjCuSnDxi', NULL, '2023-12-22 00:37:52', '2023-12-29 02:48:30', '0', 0, 1),
(87, 'KOUASSI KOUADIO EZECHIEL', 'KOUASSI', 'KOUADIO EZECHIEL', NULL, '0585052456', 'assets/img/users/pieces/794870104403069.jpg', 0, 1, 0, NULL, '$2y$10$rbaEDs5Knl5EwuZtmaUu/eCZFLKrvTZmA3Jhf84ztdllMU1yhS//6', NULL, '2023-12-22 01:13:15', '2023-12-29 03:18:49', '0', 0, 1),
(88, 'LOBOGNON JEAN CLAUDE', 'LOBOGNON', 'JEAN CLAUDE', NULL, '0172137201', 'assets/img/users/pieces/4937149051468101.jpg', 0, 1, 0, NULL, '$2y$10$JGueQ1tQERzRISBgW3qScuxo73rrNV4Y3ZRcJ1GN7y7hr0GTh5vCm', NULL, '2023-12-22 01:21:40', '2023-12-29 03:13:26', '0', 0, 1),
(89, 'LOUKOU SERGES ISRAEL', 'LOUKOU', 'SERGES ISRAEL', NULL, '0160703160', 'assets/img/users/pieces/6155157222185541.jpg', 0, 1, 0, NULL, '$2y$10$.XYf2QTRk/OHT3jTaaX3re27Aed.KImTIP1v5R48PC7hE3OsASome', NULL, '2023-12-22 01:26:16', '2023-12-29 02:42:10', '0', 0, 1),
(90, 'Bessou Didier', 'Bessou', 'Didier', NULL, '0778227032', 'assets/img/users/photo/658dad41b2993.jpg', 0, 1, 0, NULL, '$2y$10$3COSjhgoWO9GRitgd2iVquP679hppjWZ6IoWkXaAn/qNyvEG9ahD.', NULL, '2023-12-28 16:13:54', '2023-12-28 16:15:45', '0', 0, 1),
(91, 'Dodo Hermann', 'Dodo', 'Hermann', NULL, '0748717191', 'assets/img/users/pieces/1560427177969157.jpg', 0, 1, 0, NULL, '$2y$10$ke7IIBNlJFBxNjaJ7YSamOdTWkmAEOVwn7TDhe8Yx6o31ZImr3Ema', NULL, '2024-01-06 08:32:04', '2024-01-06 08:32:04', '0', 0, 0),
(92, 'AZEMA YANN', 'AZEMA', 'YANN', NULL, '0748408743', 'assets/img/users/pieces/580245889434733.jpg', 0, 1, 0, NULL, '$2y$10$QJpD.GDMr4Ifj0vXvs/Q/O599r9IEyY.J.9F.cwgvrXP06Z2.H.H.', NULL, '2024-01-09 11:55:54', '2024-01-09 11:59:23', '0', 0, 1),
(93, 'dez la koka', 'dez', 'la koka', NULL, '0700000001', 'assets/img/users/pieces/2213224458264224.jpg', 0, 1, 0, NULL, '$2y$10$kYZlOnExjwA7IkSS5ZPLSuLACaI9tgiz.DG2N.YMhICct03DThCEG', NULL, '2024-01-10 09:56:42', '2024-01-10 09:57:37', '0', 0, 1),
(94, 'Konan Emeric', 'Konan', 'Emeric', NULL, '0141204043', 'assets/img/users/pieces/9005355163340122.jpg', 0, 1, 0, NULL, '$2y$10$J7nv0QNQoiVwkWqtbm60IepqDAL9PpxP.1Tf9Ln1fV6AlLACzL8ny', NULL, '2024-01-10 19:01:37', '2024-01-10 19:01:37', '0', 0, 0),
(95, 'Zamble Yao Sanhou Elvis Privat', 'Zamble', 'Yao Sanhou Elvis Privat', NULL, '0777062680', 'assets/img/users/pieces/9211112102340972.jpg', 0, 1, 0, NULL, '$2y$10$tZgP4ohJqJSJ/gF6OUiFQ.Tr5h99JXKE1NeDNAp03UVAJ6.YRD132', NULL, '2024-01-21 22:21:39', '2024-01-21 22:29:29', '0', 0, 1),
(96, 'Ello Cedric', 'Ello', 'Cedric', NULL, '0101060912', 'assets/img/users/pieces/6733227394961190.jpg', 0, 1, 0, NULL, '$2y$10$cQKPJ2KDBEQGHXfZi52qNu6K72yfk1QgaTAZt9QuOktUkECgdSKvO', NULL, '2024-01-22 08:07:02', '2024-01-22 08:07:02', '0', 0, 0),
(97, 'Malahoua kouakou yannick oscar', 'Malahoua', 'kouakou yannick oscar', NULL, '0709213585', 'assets/img/users/pieces/6922204018272947.jpg', 0, 1, 0, NULL, '$2y$10$ZT5ZK0eGp/j1f/JE1ozy1ewDqhUx5fjU8a1JhazQxP89UYXGgMxfe', NULL, '2024-01-22 10:14:10', '2024-01-22 10:14:10', '0', 0, 0),
(98, 'OKOU Jean Yves kouassi', 'OKOU', 'Jean Yves kouassi', NULL, '0787382498', 'assets/img/users/pieces/4922274247520707.jpg', 0, 1, 0, NULL, '$2y$10$NAxUp/CsA6dvMsufVRFKJO2tQN5wHWo10DZ2XIBHeW2U4vZtJP82y', NULL, '2024-01-22 12:11:07', '2024-01-22 12:11:07', '0', 0, 0),
(99, 'Ouattara Karim', 'Ouattara', 'Karim', NULL, '0566837675', 'assets/img/users/pieces/9486294347685878.jpg', 1, 1, 0, NULL, '$2y$10$oLtDofW7EcFgJ9FGNPaXgOFFk7/F3Y6yWTqpIL44AdOhX0DyCY.Ae', NULL, '2024-01-22 12:31:15', '2024-01-22 12:31:15', '0', 0, 0),
(100, 'djoman salomon', 'djoman', 'salomon', NULL, '0103969427', 'assets/img/users/pieces/4381657464665540.jpg', 0, 1, 0, NULL, '$2y$10$w5ACNmHt312Nm0JenUatHOOHQYlpqJQfY6/IoBryci4apqESSgWeO', NULL, '2024-01-22 13:51:55', '2024-01-22 13:51:55', '0', 0, 0),
(101, 'MALAHOUA KOUAKOU DERRICK ELCAR', 'MALAHOUA', 'KOUAKOU DERRICK ELCAR', NULL, '0749609888', 'assets/img/users/pieces/9455954979874907.jpg', 0, 1, 0, NULL, '$2y$10$jdzzn.FP3XZCvBgjx0RV9OELtmZ4h43/9sCNPjJGcI6/r6ybXwHza', NULL, '2024-01-22 16:10:28', '2024-01-22 16:10:28', '0', 0, 0),
(102, 'malahoua eunice', 'malahoua', 'eunice', NULL, '0788501107', 'assets/img/users/pieces/1596024403889875.jpg', 0, 1, 0, NULL, '$2y$10$wGeATkYv4y.hguuuB47cmOifuH2LKB7w5ueKf6xmOasXBHxvJ7vWK', NULL, '2024-01-22 19:41:21', '2024-01-22 19:41:21', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visite_effectues`
--

DROP TABLE IF EXISTS `visite_effectues`;
CREATE TABLE IF NOT EXISTS `visite_effectues` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pass_visite_id` bigint UNSIGNED NOT NULL,
  `place_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visite_effectues_pass_visite_id_foreign` (`pass_visite_id`),
  KEY `visite_effectues_place_id_foreign` (`place_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `visite_effectues`
--

INSERT INTO `visite_effectues` (`id`, `pass_visite_id`, `place_id`, `created_at`, `updated_at`) VALUES
(1, 1, 20, '2023-12-19 18:48:53', '2023-12-19 18:48:53'),
(2, 1, 24, '2023-12-19 19:37:44', '2023-12-19 19:37:44'),
(3, 1, 2, '2023-12-19 19:53:54', '2023-12-19 19:53:54'),
(4, 1, 48, '2023-12-20 02:39:25', '2023-12-20 02:39:25'),
(5, 1, 28, '2023-12-20 05:55:07', '2023-12-20 05:55:07'),
(6, 2, 24, '2023-12-20 07:05:23', '2023-12-20 07:05:23'),
(7, 2, 30, '2023-12-20 07:05:57', '2023-12-20 07:05:57'),
(8, 2, 2, '2023-12-20 07:06:29', '2023-12-20 07:06:29'),
(9, 1, 30, '2023-12-20 11:41:11', '2023-12-20 11:41:11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
