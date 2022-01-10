-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 15 avr. 2020 à 10:35
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nzinghaadata1`
--

-- --------------------------------------------------------

--
-- Structure de la table `addmoney`
--

CREATE TABLE `addmoney` (
  `transaction_id` int(11) NOT NULL,
  `transaction_uid` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL,
  `identification` varchar(20) NOT NULL COMMENT 'Numero de telephone pour les transaction momo ou numero de carte de credit',
  `amount` float NOT NULL,
  `add_source_type_id` int(11) NOT NULL,
  `statut` int(1) NOT NULL COMMENT '0 : Pending; 1 : Validate; 2 : Cancellation; 3 : not validated',
  `revenu` int(11) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `operator_fees` float NOT NULL DEFAULT '0',
  `transaction_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addmoney`
--

INSERT INTO `addmoney` (`transaction_id`, `transaction_uid`, `customers_id`, `identification`, `amount`, `add_source_type_id`, `statut`, `revenu`, `fees`, `operator_fees`, `transaction_date`) VALUES
(77, 0, 259, '651702809', 1030, 1, 1, 999, 31, 0, '2020-02-21 21:39:35'),
(78, 0, 257, '672809292', 5150, 1, 3, NULL, NULL, 0, '2020-02-22 02:36:21'),
(79, 0, 259, '651702809', 1030, 1, 1, 999, 31, 0, '2020-02-22 05:22:41'),
(80, 0, 260, '679495501', 4120, 1, 3, NULL, NULL, 0, '2020-02-22 11:30:10'),
(81, 0, 259, '651702809', 4120, 1, 1, 3996, 124, 0, '2020-02-22 11:39:19'),
(82, 0, 259, '653898618', 3090, 1, 1, 2997, 93, 0, '2020-02-22 11:42:03'),
(83, 0, 260, '653898618', 2575, 1, 1, 2498, 77, 0, '2020-02-22 11:43:53'),
(84, 0, 260, '679495501', 4120, 1, 1, 3996, 124, 0, '2020-02-22 11:46:50'),
(85, 0, 260, '679495501', 51500, 1, 1, 49903, 124, 0, '2020-02-22 12:18:21'),
(86, 0, 259, '651702809', 3090, 1, 1, 2997, 93, 0, '2020-02-22 12:58:19'),
(87, 0, 257, '672809292', 10300, 1, 3, NULL, NULL, 0, '2020-02-22 17:12:29'),
(88, 0, 257, '672809292', 41200, 1, 1, 9991, 309, 0, '2020-02-22 17:15:05'),
(89, 0, 265, '697818740', 1030, 1, 0, NULL, NULL, 0, '2020-02-23 16:19:21'),
(90, 0, 254, '675628989', 36050, 1, 1, 34930, 784, 0, '2020-02-23 16:20:29'),
(91, 0, 254, '675628989', 61800, 1, 1, 59887, 784, 0, '2020-02-24 08:06:49'),
(92, 0, 265, '697818740', 1030, 1, 3, NULL, NULL, 0, '2020-02-24 18:52:20'),
(93, 0, 257, '672809292', 10300, 1, 1, 9991, 309, 0, '2020-02-24 18:55:38'),
(94, 0, 257, '672809292', 10300, 1, 1, 9991, 309, 0, '2020-02-24 18:57:46'),
(95, 0, 275, '690603928', 515, 1, 0, NULL, NULL, 0, '2020-02-27 17:33:55'),
(96, 0, 278, '694748321', 1030, 1, 0, NULL, NULL, 0, '2020-02-27 18:24:10'),
(97, 0, 280, '652035569', 6180, 1, 1, 5995, 185, 0, '2020-02-27 21:25:04'),
(98, 0, 266, '651702809', 25600, 1, 1, 24829, 771, 0, '2020-02-27 21:47:34'),
(99, 0, 279, '671843554', 20600, 1, 1, 19982, 618, 0, '2020-02-27 22:38:28'),
(100, 0, 253, '653919163', 2575, 1, 1, 2498, 77, 0, '2020-02-27 22:47:47'),
(101, 0, 264, '696201988', 1030, 1, 0, NULL, NULL, 0, '2020-02-28 00:46:18'),
(102, 0, 286, '697380148', 103, 1, 0, NULL, NULL, 0, '2020-02-28 16:13:50'),
(103, 0, 287, '696057257', 5150, 1, 1, 4995, 155, 0, '2020-02-28 20:18:30'),
(104, 0, 287, '696057257', 2060, 1, 1, 1998, 62, 0, '2020-02-28 20:20:22'),
(105, 0, 293, '670050977', 1030, 1, 1, 999, 31, 0, '2020-02-29 12:40:32'),
(106, 0, 290, '653451508', 1030, 1, 1, 999, 31, 0, '2020-02-29 13:17:12'),
(107, 0, 293, '658621266', 1030, 1, 0, NULL, NULL, 0, '2020-02-29 13:18:06'),
(108, 0, 295, '677012678', 51500, 1, 3, 49950, 1550, 0, '2020-02-29 15:57:42'),
(109, 0, 302, '691675418', 1030, 1, 0, NULL, NULL, 0, '2020-02-29 17:09:09'),
(110, 0, 296, '651279347', 20600, 1, 1, 19980, 620, 0, '2020-03-01 17:15:11'),
(111, 0, 289, '680583420', 1030, 1, 3, NULL, NULL, 0, '2020-03-02 11:54:59'),
(112, 0, 289, '680583420', 1648, 1, 1, 1599, 49, 0, '2020-03-02 12:37:23'),
(113, 0, 301, '650498522', 4120, 1, 3, NULL, NULL, 0, '2020-03-02 16:52:00'),
(114, 0, 301, '650498522', 2060, 1, 3, NULL, NULL, 0, '2020-03-02 18:18:26'),
(115, 0, 301, '650498522', 2060, 1, 1, 1998, 62, 0, '2020-03-03 12:34:35'),
(116, 0, 277, '651374667', 30800, 1, 3, NULL, NULL, 0, '2020-03-04 17:21:57'),
(117, 0, 277, '651374667', 25000, 1, 1, 24248, 753, 0, '2020-03-04 17:22:09'),
(118, 0, 264, '680583420', 103000, 1, 1, 99900, 3100, 0, '2020-03-04 17:22:46'),
(119, 0, 261, '680583420', 27000, 1, 1, 26187, 813, 0, '2020-03-04 17:22:47'),
(120, 0, 270, '680583420', 27800, 1, 1, 26963, 837, 0, '2020-03-04 17:28:14'),
(121, 0, 266, '680583420', 55000, 1, 1, 53345, 1656, 0, '2020-03-04 17:28:17'),
(122, 0, 284, '680583420', 147000, 1, 1, 142575, 4425, 0, '2020-03-04 17:28:17'),
(123, 0, 294, '680583420', 178000, 1, 1, 172642, 5358, 0, '2020-03-04 17:28:19'),
(124, 0, 289, '680583420', 1030, 1, 1, 999, 31, 0, '2020-03-04 17:28:20'),
(125, 0, 267, '674374267', 1545, 1, 1, 1499, 46, 0, '2020-03-05 20:07:11'),
(126, 0, 253, '675326066', 5150, 1, 0, NULL, NULL, 0, '2020-03-05 20:07:30'),
(127, 0, 253, '675326066', 5150, 1, 0, NULL, NULL, 0, '2020-03-05 20:13:11'),
(128, 0, 304, '651702809', 4120, 1, 1, 3996, 124, 0, '2020-03-07 07:50:38'),
(129, 0, 305, '673754346', 18540, 1, 3, NULL, NULL, 0, '2020-03-07 17:08:26'),
(130, 0, 305, '673754376', 18540, 1, 3, NULL, NULL, 0, '2020-03-08 15:30:17'),
(131, 0, 305, '673754346', 18540, 1, 1, 17984, 556, 0, '2020-03-08 15:49:10'),
(132, 0, 304, '651702809', 2060, 1, 3, NULL, NULL, 0, '2020-03-11 12:13:10'),
(133, 0, 295, '677012678', 2060, 1, 1, 1998, 62, 0, '2020-03-11 15:22:24'),
(134, 0, 257, '672809292', 10300, 1, 3, NULL, NULL, 0, '2020-03-11 17:04:33'),
(135, 0, 253, '653919163', 1030, 1, 3, NULL, NULL, 0, '2020-03-13 17:53:07'),
(136, 0, 253, '653919163', 1030, 1, 3, NULL, NULL, 0, '2020-03-13 17:54:15'),
(137, 0, 253, '653919163', 3090, 1, 1, 2997, 93, 0, '2020-03-14 12:27:30'),
(138, 0, 253, '653919163', 1030, 1, 3, NULL, NULL, 0, '2020-03-14 13:03:50'),
(139, 0, 253, '653919163', 1030, 1, 1, 999, 31, 0, '2020-03-14 13:15:33'),
(140, 0, 301, '650498522', 5150, 1, 1, 4995, 155, 0, '2020-03-14 22:56:03'),
(141, 0, 267, '680685519', 4999.62, 1, 1, 4850, 150, 0, '2020-03-15 07:24:42'),
(142, 0, 289, '680583420', 4120, 1, 1, 3996, 124, 0, '2020-03-15 09:04:30'),
(143, 0, 257, '672809292', 5150, 1, 1, 4995, 155, 0, '2020-03-15 16:18:58'),
(144, 0, 257, '672889292', 10300, 1, 3, NULL, NULL, 0, '2020-03-16 08:19:51'),
(145, 0, 257, '672809292', 10300, 1, 1, 9991, 309, 0, '2020-03-16 08:21:52'),
(146, 0, 253, '678642421', 1030, 1, 3, NULL, NULL, 0, '2020-03-16 09:16:10'),
(147, 0, 260, '679495501', 6180, 1, 1, 5995, 185, 0, '2020-03-16 14:09:38'),
(148, 0, 327, '651999658', 3296, 1, 3, NULL, NULL, 0, '2020-03-17 16:30:36'),
(149, 0, 327, '651999658', 3296, 1, 3, NULL, NULL, 0, '2020-03-17 16:30:45'),
(150, 0, 289, '680583420', 2987, 1, 1, 2897, 90, 0, '2020-03-21 08:10:37'),
(151, 0, 334, '653919163', 2266, 1, 1, 2198, 68, 0, '2020-03-22 08:33:16'),
(152, 0, 329, '651702607', 51500, 1, 1, 49950, 1500, 0, '2020-03-23 15:33:16'),
(153, 0, 329, '651702607', 103000, 1, 1, 99900, 3000, 0, '2020-03-23 15:56:16'),
(154, 0, 306, '690547176', 309, 1, 0, NULL, NULL, 0, '2020-03-23 18:10:30'),
(155, 0, 336, '674282135', 72100, 1, 1, 69930, 2100, 0, '2020-03-24 07:46:18'),
(156, 0, 253, '678642421', 1030, 1, 3, NULL, NULL, 0, '2020-03-24 16:24:22'),
(157, 0, 253, '678642421', 1030, 1, 1, 999, 31, 0, '2020-03-24 16:36:45'),
(158, 0, 257, '672809292', 15450, 1, 1, 14986, 464, 0, '2020-03-25 06:48:22'),
(159, 0, 256, '670631135', 1545, 1, 3, NULL, NULL, 0, '2020-03-25 07:24:09'),
(160, 0, 257, '672809292', 5150, 1, 1, 4995, 155, 0, '2020-03-26 06:21:37'),
(161, 0, 301, '650498522', 6180, 1, 1, 5995, 185, 0, '2020-03-27 10:02:58'),
(162, 0, 295, '677012678', 515, 1, 1, 500, 15, 0, '2020-03-28 14:54:05'),
(163, 0, 336, '651702607', 82400, 1, 1, 80000, 2400, 0, '2020-03-28 15:56:16'),
(164, 0, 289, '680583420', 3450.5, 1, 3, NULL, NULL, 0, '2020-03-29 12:50:53'),
(165, 0, 289, '680583420', 3450.5, 1, 3, NULL, NULL, 0, '2020-03-29 12:50:54'),
(166, 0, 289, '680583420', 3450.5, 1, 3, NULL, NULL, 0, '2020-03-29 12:52:43'),
(167, 0, 289, '680583420', 3450.5, 1, 1, 3347, 104, 0, '2020-03-29 12:52:44'),
(168, 0, 338, '673754346', 18540, 1, 1, 17984, 556, 0, '2020-03-30 09:28:50'),
(169, 0, 338, '673754346', 10815, 1, 3, NULL, NULL, 0, '2020-03-30 13:55:36'),
(170, 0, 338, '673754346', 10815, 1, 1, 10491, 324, 0, '2020-03-30 13:55:39'),
(171, 0, 338, '673754346', 25750, 1, 1, 24977, 773, 0, '2020-03-31 08:17:27'),
(172, 0, 313, '691679994', 1030, 1, 0, NULL, 30, 0, '2020-04-02 23:35:18'),
(173, 0, 313, '691679994', 1030, 1, 0, NULL, 30, 0, '2020-04-02 23:35:32'),
(174, 0, 313, '691679994', 1131, 1, 0, NULL, 31, 100, '2020-04-02 23:39:10'),
(175, 0, 313, '691679994', 1030, 1, 0, NULL, 30, 0, '2020-04-03 00:28:54'),
(176, 0, 336, '653675627', 81000, 1, 1, 80919, 2430, 0, '2020-04-04 08:34:58'),
(177, 0, 313, '653898618', 2060, 1, 0, NULL, 60, 0, '2020-04-06 11:56:16'),
(178, 0, 313, '653898618', 2060, 1, 3, NULL, 60, 0, '2020-04-06 11:56:16'),
(179, 0, 336, '651702809', 2060, 1, 1, 1998, 62, 0, '2020-04-06 15:58:25'),
(180, 0, 253, '678642421', 2060, 1, 3, NULL, 2060, 0, '2020-04-06 15:59:30'),
(181, 0, 338, '673754346', 37080, 1, 1, 35968, 1112, 0, '2020-04-06 16:04:59'),
(182, 0, 329, '651702607', 66435, 1, 1, 64437, 1935, 0, '2020-04-06 15:23:23'),
(183, 0, 350, '694850018', 10300, 1, 0, NULL, 10300, 0, '2020-04-06 23:16:07'),
(184, 0, 330, '678642421', 2060, 1, 3, NULL, 2060, 0, '2020-04-07 12:47:59'),
(185, 0, 330, '678642421', 2060, 1, 3, NULL, 2060, 0, '2020-04-07 12:48:43'),
(186, 0, 330, '653919163', 2060, 1, 3, NULL, 2060, 0, '2020-04-07 12:52:22'),
(187, 0, 330, '653919163', 2266, 1, 3, NULL, 2266, 0, '2020-04-07 13:00:44'),
(188, 0, 330, '653919163', 2266, 1, 1, 2198, 68, 0, '2020-04-07 13:20:48'),
(189, 0, 313, '691679994', 1030, 1, 0, NULL, 30, 0, '2020-04-07 16:35:14'),
(190, 0, 313, '691679994', 1030, 1, 0, NULL, 30, 0, '2020-04-07 16:49:07'),
(191, 0, 284, '677182675', 5150, 1, 1, 4995, 155, 0, '2020-04-09 14:29:50'),
(192, 0, 336, '653675627', 110000, 1, 1, 109890, 3300, 0, '2020-04-12 11:29:50'),
(193, 0, 353, '651974510', 1030, 1, 3, NULL, 1030, 0, '2020-04-12 18:11:50'),
(194, 0, 353, '651974510', 1030, 1, 0, NULL, 1030, 0, '2020-04-12 18:12:12'),
(195, 0, 353, '651974510', 1030, 1, 3, NULL, 1030, 0, '2020-04-12 18:12:12'),
(196, 0, 353, '651974510', 1030, 1, 3, NULL, 1030, 0, '2020-04-12 18:12:18'),
(197, 0, 274, '674099619', 51500, 1, 1, 49955, 1545, 0, '2020-04-13 09:02:06'),
(198, 0, 355, '654478290', 10300, 1, 3, NULL, 10300, 0, '2020-04-14 11:46:16'),
(199, 0, 257, '672809292', 10300, 1, 1, 9991, 309, 0, '2020-04-14 18:35:07');

-- --------------------------------------------------------

--
-- Structure de la table `addrescue`
--

CREATE TABLE `addrescue` (
  `transaction_id` int(11) NOT NULL,
  `transaction_uid` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL,
  `identification` varchar(20) NOT NULL COMMENT 'Numero de telephone pour les transaction momo ou numero de carte de credit',
  `amount` float NOT NULL,
  `add_source_type_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `statut` int(1) NOT NULL COMMENT '0 : Pending; 1 : Validate; 2 : Cancellation; 3 : not validated',
  `revenu` int(11) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addrescue`
--

INSERT INTO `addrescue` (`transaction_id`, `transaction_uid`, `customers_id`, `identification`, `amount`, `add_source_type_id`, `transaction_date`, `statut`, `revenu`, `fees`) VALUES
(77, 0, 259, '651702809', 1030, 1, '2020-02-21 21:39:35', 1, 999, 31),
(78, 0, 257, '672809292', 5150, 1, '2020-02-22 02:36:21', 3, NULL, NULL),
(79, 0, 259, '651702809', 1030, 1, '2020-02-22 05:22:41', 1, 999, 31),
(80, 0, 260, '679495501', 4120, 1, '2020-02-22 11:30:10', 3, NULL, NULL),
(81, 0, 259, '651702809', 4120, 1, '2020-02-22 11:39:19', 1, 3996, 124),
(82, 0, 259, '653898618', 3090, 1, '2020-02-22 11:42:03', 1, 2997, 93),
(83, 0, 260, '653898618', 2575, 1, '2020-02-22 11:43:53', 1, 2498, 77),
(84, 0, 260, '679495501', 4120, 1, '2020-02-22 11:46:50', 1, 3996, 124),
(85, 0, 260, '679495501', 4120, 1, '2020-02-22 12:18:21', 1, 3996, 124),
(86, 0, 259, '651702809', 3090, 1, '2020-02-22 12:58:19', 1, 2997, 93),
(87, 0, 257, '672809292', 10300, 1, '2020-02-22 17:12:29', 3, NULL, NULL),
(88, 0, 257, '672809292', 10300, 1, '2020-02-22 17:15:05', 1, 9991, 309),
(89, 0, 265, '697818740', 1030, 1, '2020-02-23 16:19:21', 0, NULL, NULL),
(90, 0, 265, '697818740', 1030, 1, '2020-02-23 16:20:29', 0, NULL, NULL),
(91, 0, 257, '672809292', 10300, 1, '2020-02-24 08:06:49', 1, 9991, 309),
(92, 0, 257, '672809292', 9270, 1, '2020-02-24 18:52:20', 3, NULL, NULL),
(93, 0, 257, '672809292', 9270, 1, '2020-02-24 18:55:38', 3, NULL, NULL),
(94, 0, 257, '672809292', 8240, 1, '2020-02-24 18:57:46', 1, 7993, 247),
(95, 0, 275, '690603928', 515, 1, '2020-02-27 17:33:55', 0, NULL, NULL),
(96, 0, 278, '694748321', 1030, 1, '2020-02-27 18:24:10', 0, NULL, NULL),
(97, 0, 280, '652035569', 6180, 1, '2020-02-27 21:25:04', 1, 5995, 185),
(98, 0, 266, '651702809', 2060, 1, '2020-02-27 21:47:34', 1, 1998, 62),
(99, 0, 279, '671843554', 20600, 1, '2020-02-27 22:38:28', 1, 19982, 618),
(100, 0, 253, '653919163', 2575, 1, '2020-02-27 22:47:47', 1, 2498, 77),
(101, 0, 264, '696201988', 1030, 1, '2020-02-28 00:46:18', 0, NULL, NULL),
(102, 0, 286, '697380148', 103, 1, '2020-02-28 16:13:50', 0, NULL, NULL),
(103, 0, 287, '696057257', 5150, 1, '2020-02-28 20:18:30', 0, NULL, NULL),
(104, 0, 287, '696057257', 2060, 1, '2020-02-28 20:20:22', 0, NULL, NULL),
(105, 0, 293, '670050977', 1030, 1, '2020-02-29 12:40:32', 3, NULL, NULL),
(106, 0, 290, '653451508', 1030, 1, '2020-02-29 13:17:12', 3, NULL, NULL),
(107, 0, 293, '658621266', 1030, 1, '2020-02-29 13:18:06', 0, NULL, NULL),
(108, 0, 295, '677012678', 515, 1, '2020-02-29 15:57:42', 3, NULL, NULL),
(109, 0, 302, '691675418', 1030, 1, '2020-02-29 17:09:09', 0, NULL, NULL),
(110, 0, 296, '651279347', 206, 1, '2020-03-01 17:15:11', 3, NULL, NULL),
(111, 0, 289, '680583420', 1030, 1, '2020-03-02 11:54:59', 3, NULL, NULL),
(112, 0, 289, '680583420', 1648, 1, '2020-03-02 12:37:23', 1, 1599, 49),
(113, 0, 301, '650498522', 4120, 1, '2020-03-02 16:52:00', 3, NULL, NULL),
(114, 0, 301, '650498522', 2060, 1, '2020-03-02 18:18:26', 3, NULL, NULL),
(115, 0, 301, '650498522', 2060, 1, '2020-03-03 12:34:35', 1, 1998, 62),
(116, 0, 289, '680583420', 1030, 1, '2020-03-04 17:21:57', 3, NULL, NULL),
(117, 0, 289, '680583420', 1030, 1, '2020-03-04 17:22:09', 3, NULL, NULL),
(118, 0, 289, '680583420', 1030, 1, '2020-03-04 17:22:46', 0, NULL, NULL),
(119, 0, 289, '680583420', 1030, 1, '2020-03-04 17:22:47', 3, NULL, NULL),
(120, 0, 289, '680583420', 1030, 1, '2020-03-04 17:28:14', 3, NULL, NULL),
(121, 0, 289, '680583420', 1030, 1, '2020-03-04 17:28:17', 3, NULL, NULL),
(122, 0, 289, '680583420', 1030, 1, '2020-03-04 17:28:17', 3, NULL, NULL),
(123, 0, 289, '680583420', 1030, 1, '2020-03-04 17:28:19', 0, NULL, NULL),
(124, 0, 289, '680583420', 1030, 1, '2020-03-04 17:28:20', 3, NULL, NULL),
(125, 0, 267, '674374267', 1545, 1, '2020-03-05 20:07:11', 1, 1499, 46),
(126, 0, 253, '697326066', 5150, 1, '2020-03-05 20:07:30', 0, NULL, NULL),
(127, 0, 253, '697326066', 5150, 1, '2020-03-05 20:13:11', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `Line1` varchar(100) NOT NULL,
  `Line2` varchar(100) DEFAULT NULL,
  `City_id` int(11) DEFAULT NULL,
  `Postcode` int(11) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country_id` int(11) DEFAULT NULL,
  `Other_details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`address_id`, `Line1`, `Line2`, `City_id`, `Postcode`, `State`, `Country_id`, `Other_details`) VALUES
(319, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(320, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(321, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(322, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(323, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(324, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(325, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(326, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(327, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(328, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(329, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(330, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(331, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(332, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(333, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(334, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(335, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(336, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(337, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(338, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(339, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(340, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(341, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(342, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(343, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(344, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(345, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(346, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(347, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(348, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(349, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(350, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(351, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(352, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(353, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(354, '1', '1', NULL, NULL, 'NULL', 23, 'NULL'),
(355, '1', '1', NULL, NULL, 'NULL', 23, 'NULL'),
(356, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(357, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(358, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(359, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(360, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(361, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(362, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(363, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(364, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(365, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(366, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(367, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(368, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(369, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(370, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(371, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(372, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(373, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(374, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(375, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(376, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(377, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(378, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(379, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(380, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(381, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(382, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(383, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(384, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(385, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(386, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(387, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(388, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(389, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(390, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(391, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(392, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(393, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(394, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(395, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(396, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(397, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(398, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(399, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(400, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(401, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(402, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(403, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(404, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(405, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(406, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(407, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(408, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(409, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(410, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(411, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(412, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(413, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(414, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(415, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(416, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(417, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(418, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(419, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(420, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(421, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(422, '1', '1', NULL, NULL, 'NULL', 23, 'NULL'),
(423, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(424, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(425, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(426, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(427, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(428, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(429, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(430, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(431, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(432, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(433, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(434, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(435, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(436, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(437, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(438, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(439, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(440, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(441, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(442, '1', '1', NULL, NULL, 'NULL', 23, 'NULL'),
(443, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(444, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(445, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(446, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(447, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(448, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(449, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(450, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(451, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(452, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(453, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(454, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(455, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(456, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(457, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(458, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(459, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(460, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(461, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(462, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(463, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(464, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(465, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(466, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(467, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(468, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(469, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(470, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(471, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(472, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(473, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(474, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(475, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(476, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(477, '1', '1', NULL, NULL, 'NULL', 35, 'NULL'),
(478, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(479, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(480, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(481, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(482, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(483, '1', '1', NULL, NULL, 'NULL', NULL, 'NULL'),
(484, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(485, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(486, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(487, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(488, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(489, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(490, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(491, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(492, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(493, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(494, '1', '1', NULL, NULL, 'NULL', 11, 'NULL'),
(495, '1', '1', NULL, NULL, 'NULL', 11, 'NULL');

-- --------------------------------------------------------

--
-- Structure de la table `add_source_type`
--

CREATE TABLE `add_source_type` (
  `add_source_type_id` int(11) NOT NULL,
  `add_source_type_desc` varchar(255) DEFAULT NULL,
  `Code` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `appfees`
--

CREATE TABLE `appfees` (
  `appfees_id` int(11) NOT NULL,
  `ejarafees` float DEFAULT '0',
  `networkfees` float NOT NULL DEFAULT '0' COMMENT 'Add : Operator fees',
  `otherfees` float NOT NULL DEFAULT '0' COMMENT 'BuyCrypto : Kraken fees, Add : Monetbil',
  `wallettype_id` int(11) NOT NULL,
  `appservices_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appfees`
--

INSERT INTO `appfees` (`appfees_id`, `ejarafees`, `networkfees`, `otherfees`, `wallettype_id`, `appservices_id`) VALUES
(1, 0, 0, 0.03, 4, 1),
(2, 0.03, 0.2, 0.1, 3, 2),
(3, 0.03, 0.0005, 0.1, 1, 2),
(4, 0, 0.02, 0, 3, 4),
(5, 0, 0.0005, 0, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `appservices`
--

CREATE TABLE `appservices` (
  `appservices_id` int(11) NOT NULL,
  `service_port` int(11) NOT NULL DEFAULT '0',
  `service_name` varchar(20) NOT NULL,
  `service_code` varchar(3) NOT NULL,
  `service_url` varchar(30) DEFAULT NULL,
  `service_active` int(11) NOT NULL DEFAULT '0' COMMENT '0: Inactif, 1: actif;'

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `appservices`
--

INSERT INTO `appservices` (`appservices_id`, `service_port`, `service_name`, `service_code`, `service_url`, `service_active`) VALUES
(1, 3410, 'AddMoney', 'ADD', NULL, 1),
(2, 3420, 'BuyCrypto', 'BUY', NULL, 1),
(3, 3430, 'Withdraw', 'WIT', NULL, 0),
(4, 0, 'Send', 'SND', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `bilresponse`
--

CREATE TABLE `bilresponse` (
  `transactionId` int(11) NOT NULL,
  `message` text NOT NULL,
  `paymentId` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `channel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bilresponse`
--

INSERT INTO `bilresponse` (`transactionId`, `message`, `paymentId`, `status`, `channel`) VALUES
(77, 'Successfully processed transaction.', '20022122393586254781', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(78, 'Waiting time expired.', '20022203362167178431', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(79, 'Successfully processed transaction.', '20022206224127771635', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(80, 'Waiting time expired.', '20022212301138196488', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(81, 'Successfully processed transaction.', '20022212392091118286', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(82, 'Successfully processed transaction.', '20022212420463766929', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(83, 'Successfully processed transaction.', '20022212435331255374', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(84, 'Successfully processed transaction.', '20022212465084134265', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(85, 'Successfully processed transaction.', '20022213182182326185', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(86, 'Successfully processed transaction.', '20022213582035239373', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(87, 'Waiting time expired.', '20022218122911719128', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(88, 'Successfully processed transaction.', '20022218150659446215', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(91, 'Successfully processed transaction.', '20022409064978613366', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(92, 'TARGET_AUTHORIZATION_ERROR', '20022419522089863651', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(93, 'TARGET_AUTHORIZATION_ERROR', '20022419553843787911', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(94, 'Successfully processed transaction.', '20022419574735513861', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(97, 'Successfully processed transaction.', '20022722250461715756', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(98, 'Successfully processed transaction.', '20022722473687551143', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(99, 'Successfully processed transaction.', '20022723382934464438', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(100, 'Successfully processed transaction.', '20022723474869494745', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(105, 'TARGET_AUTHORIZATION_ERROR', '20022913403351471841', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(106, 'TARGET_AUTHORIZATION_ERROR', '20022914171252927242', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(108, 'Waiting time expired.', '20022916574213522219', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(110, 'TARGET_AUTHORIZATION_ERROR', '20030118151219336983', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(111, 'Waiting time expired.', '20030212545977782293', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(112, 'Successfully processed transaction.', '20030213372423262295', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(113, 'Waiting time expired.', '20030217520011313181', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(114, 'Waiting time expired.', '20030219182688825526', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(115, 'Successfully processed transaction.', '20030313343651495841', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(116, 'Waiting time expired.', '20030418215891699731', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(117, 'Waiting time expired.', '20030418220968242947', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(119, 'Waiting time expired.', '20030418224728642535', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(120, 'TARGET_AUTHORIZATION_ERROR', '20030418281487623563', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(121, 'TARGET_AUTHORIZATION_ERROR', '20030418281767732858', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(122, 'TARGET_AUTHORIZATION_ERROR', '20030418281881587727', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(124, 'TARGET_AUTHORIZATION_ERROR', '20030418281924714811', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(125, 'Successfully processed transaction.', '20030521071182122693', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(128, 'Successfully processed transaction.', '20030708503829771633', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(129, 'Waiting time expired.', '20030718082616149182', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(130, 'TARGET_AUTHORIZATION_ERROR', '20030816301822328996', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(131, 'Successfully processed transaction.', '20030816491085443763', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(132, 'TARGET_AUTHORIZATION_ERROR', '20031113131177654731', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(133, 'Successfully processed transaction.', '20031116222459531915', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(134, 'Waiting time expired.', '20031118043447972658', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(135, 'Waiting time expired.', '20031318530838239163', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(136, 'Waiting time expired.', '20031318541528147978', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(137, 'Successfully processed transaction.', '20031413273187724553', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(138, 'Waiting time expired.', '20031414035097942827', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(139, 'Successfully processed transaction.', '20031414153367742229', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(140, 'Successfully processed transaction.', '20031423560434377458', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(141, 'Successfully processed transaction.', '20031508244365941597', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(142, 'Successfully processed transaction.', '20031510043183215993', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(143, 'Successfully processed transaction.', '20031517185989164195', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(144, 'TARGET_AUTHORIZATION_ERROR', '20031609195188277373', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(145, 'Successfully processed transaction.', '20031609215224817255', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(146, 'Waiting time expired.', '20031610161187137376', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(147, 'Successfully processed transaction.', '20031615093871489734', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(148, 'Waiting time expired.', '20031717303684275883', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(149, 'Waiting time expired.', '20031717304535228449', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(150, 'Successfully processed transaction.', '20032109103881455382', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(151, 'Successfully processed transaction.', '20032209331772275842', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(156, 'Waiting time expired.', '20032417242315654391', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(157, 'Successfully processed transaction.', '20032417364599158564', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(158, 'Successfully processed transaction.', '20032507482394273428', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(159, 'Waiting time expired.', '20032508240989191464', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(160, 'Successfully processed transaction.', '20032607213831192947', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(161, 'Successfully processed transaction.', '20032711025993677537', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(162, 'Successfully processed transaction.', '20032815540521141912', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(164, 'payment pending', '20032913505362726355', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(165, 'payment pending', '20032913505429685679', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(166, 'Waiting time expired.', '20032913524377833581', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(167, 'Successfully processed transaction.', '20032913524486977448', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(168, 'Successfully processed transaction.', '20033010285079632256', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(169, 'Waiting time expired.', '20033014553757956461', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(170, 'Successfully processed transaction.', '20033014554045563714', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(171, 'Successfully processed transaction.', '20033109172798427229', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(178, 'Waiting time expired.', '20040612561686158143', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(179, 'Successfully processed transaction.', '20040616582597899738', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(180, 'Waiting time expired.', '20040616593121386883', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(181, 'Successfully processed transaction.', '20040617045926424917', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(184, 'TARGET_AUTHORIZATION_ERROR', '20040713480018385322', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(185, 'TARGET_AUTHORIZATION_ERROR', '20040713484345478135', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(186, 'Waiting time expired.', '20040713522332617664', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(187, 'Waiting time expired.', '20040714004556671731', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(188, 'Successfully processed transaction.', '20040714204987863618', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(191, 'Successfully processed transaction.', '20040915295061937251', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(193, 'TARGET_AUTHORIZATION_ERROR', '20041219115164311989', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(195, 'TARGET_AUTHORIZATION_ERROR', '20041219121217826559', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(196, 'TARGET_AUTHORIZATION_ERROR', '20041219121857533344', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(197, 'Successfully processed transaction.', '20041310020677926588', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(198, 'TARGET_AUTHORIZATION_ERROR', '20041412461695441488', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY'),
(199, 'Successfully processed transaction.', '20041419350752744347', 'REQUEST_ACCEPTED', 'CM_MTNMOBILEMONEY');

-- --------------------------------------------------------

--
-- Structure de la table `blockeduser`
--

CREATE TABLE `blockeduser` (
  `blockeduser_id` int(11) NOT NULL,
  `appservices_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `blockeddate` datetime NOT NULL,
  `raison` varchar(30) DEFAULT NULL,
  `statut` int(11) NOT NULL DEFAULT '1' COMMENT '0: Débloqué, 1: Bloqué',
  `unblockeddate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `buy`
--

CREATE TABLE `buy` (
  `transaction_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `receiveaddress` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `cryptoamount` decimal(10,8) NOT NULL DEFAULT '0.00000000',
  `cryptoamountkraken` decimal(10,8) NOT NULL DEFAULT '0.00000000',
  `cryptoprice` int(11) NOT NULL DEFAULT '0',
  `cryptosellingprice` int(11) NOT NULL DEFAULT '0',
  `globalfees` decimal(7,2) NOT NULL DEFAULT '0.00',
  `ejarafees` decimal(7,2) NOT NULL DEFAULT '0.00',
  `krakenfees` decimal(7,2) NOT NULL DEFAULT '0.00',
  `blockchainfees` float NOT NULL DEFAULT '0',
  `wallettypefiat_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `statut` int(1) NOT NULL,
  `date_traitement` datetime DEFAULT NULL,
  `transactionhash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `raison` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type_livraison` int(1) DEFAULT NULL,
  `stateorderbuy` int(1) DEFAULT NULL,
  `livreur` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `buy`
--

INSERT INTO `buy` (`transaction_id`, `customers_id`, `receiveaddress`, `amount`, `wallettype_id`, `cryptoamount`, `cryptoamountkraken`, `cryptoprice`, `cryptosellingprice`, `globalfees`, `ejarafees`, `krakenfees`, `blockchainfees`, `wallettypefiat_id`, `transaction_date`, `statut`, `date_traitement`, `transactionhash`, `raison`, `type_livraison`, `stateorderbuy`, `livreur`) VALUES
(17, 260, NULL, 2200, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:13:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 259, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:13:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 260, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:15:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 260, NULL, 2200, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:19:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 260, NULL, 55000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:24:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 257, NULL, 4950, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:36:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 259, NULL, 2200, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 12:59:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 259, NULL, 1100, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 13:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 257, NULL, 2200, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 16:23:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 257, NULL, 9900, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 16:26:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 260, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 17:14:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 257, NULL, 44900, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 17:32:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 257, NULL, 9900, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-22 19:38:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 254, NULL, 33000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-23 16:30:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 254, NULL, 58000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-24 08:10:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 257, NULL, 9900, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-24 08:47:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 257, NULL, 22000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-24 19:03:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 257, NULL, 7700, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-25 20:26:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 260, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-26 07:04:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 278, NULL, 5500, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-27 18:24:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 280, NULL, 2060, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-27 21:25:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 280, NULL, 5995, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-27 21:42:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 253, NULL, 2200, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-27 22:49:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 287, NULL, 4995, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-28 20:18:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 287, NULL, 1500, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-28 20:20:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 295, NULL, 43000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-02-29 15:57:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 296, NULL, 15000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-01 17:15:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 289, NULL, 1000, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-02 12:37:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 279, NULL, 18700, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-02 15:50:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 279, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-02 16:04:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 289, NULL, 1584, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-02 17:17:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 301, NULL, 1676, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-03 12:34:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 301, NULL, 1980, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-03 12:38:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 277, NULL, 22000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:22:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 264, NULL, 99000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:22:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 261, NULL, 22000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:22:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 270, NULL, 23500, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:28:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 266, NULL, 52125, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:28:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 284, NULL, 115000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:28:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 294, NULL, 145000, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-04 17:28:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 303, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-05 11:15:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 303, NULL, 1100, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-05 11:20:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 304, '1CVsz8WZGZZqvbEPuaju4wyTm8rGr8RjQm', 1100, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-05 17:17:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 267, NULL, 1000, 3, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-05 20:07:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 267, NULL, 1100, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-06 10:29:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 304, NULL, 3400, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-07 07:50:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 305, NULL, 16500, 1, '0.00000000', '0.00000000', 0, 0, '0.00', '0.00', '0.00', 0, 4, '2020-03-08 15:49:00', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, '1.35960000', '0.00000000', 1401, 1471, '64.80', '0.00', '0.00', 0, 4, '2020-03-11 15:50:00', 1, '2020-03-11 18:40:45', NULL, NULL, 1, 0, NULL),
(65, 303, 'tz1TXg8H9HV6occvNdVVEUUHAZ3eagQKihjD', 2160, 3, '1.34710000', '0.00000000', 1414, 1484, '64.80', '0.00', '0.00', 0, 4, '2020-03-11 18:53:00', 1, '2020-03-12 12:18:58', NULL, NULL, 1, 0, NULL),
(66, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, '2.03280000', '0.00000000', 937, 983, '64.80', '0.00', '0.00', 0, 4, '2020-03-13 17:18:00', 1, '2020-03-13 17:53:58', NULL, NULL, 1, 0, NULL),
(67, 253, 'tz1RZqdJxusQTeqq72e6RanS3LicUiSDJG5i', 2160, 3, '1.94760000', '0.00000000', 978, 1026, '64.80', '0.00', '0.00', 0, 4, '2020-03-14 12:16:00', 1, '2020-03-14 12:53:58', NULL, NULL, 1, 0, NULL),
(68, 253, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', 10800, 1, '0.00296254', '0.00000000', 3214740, 3375480, '324.00', '0.00', '0.00', 0, 4, '2020-03-14 13:18:00', 2, '2020-03-20 19:24:50', NULL, NULL, 0, 0, NULL),
(70, 289, 'tz1VgeM9Vbm8ywCA5rsHjtY2xCcBH8eWQghh', 3888, 3, '3.66300000', '0.00000000', 936, 982, '116.64', '0.00', '0.00', 0, 4, '2020-03-15 09:08:00', 1, '2020-03-15 16:53:58', NULL, NULL, 1, 0, NULL),
(71, 267, 'tz1LGCe2mFGJKqwnWV3BsMQTKMGYSWm8LPdQ', 3240, 3, '2.96080000', '0.00000000', 965, 1013, '97.20', '0.00', '0.00', 0, 4, '2020-03-15 11:23:00', 1, '2020-03-15 16:58:58', NULL, NULL, 1, 0, NULL),
(72, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 5150, 3, '5.96730000', '0.00000000', 798, 837, '5400.00', '0.00', '0.00', 0, 4, '2020-03-16 07:20:00', 1, '2020-03-16 07:58:58', NULL, NULL, 1, 0, NULL),
(73, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 9682, 3, '11.65670000', '0.00000000', 768, 806, '10152.00', '0.00', '0.00', 0, 4, '2020-03-16 08:36:00', 1, '2020-03-16 09:13:58', NULL, NULL, 1, 0, NULL),
(74, 260, 'tz1UasU7YCX9P42wDskmwMp9bEet3jgzTSJ1', 5665, 3, '6.95630000', '0.00000000', 753, 790, '5940.00', '0.00', '0.00', 0, 4, '2020-03-16 14:12:00', 1, '2020-03-16 14:53:58', NULL, NULL, 1, 0, NULL),
(76, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.62630000', '0.00000000', 1118, 1229, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 18:32:09', 2, '2020-03-20 19:13:53', NULL, NULL, NULL, NULL, NULL),
(77, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.70560000', '0.00000000', 1066, 1172, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 19:03:50', 2, '2020-03-20 19:18:31', NULL, NULL, NULL, NULL, NULL),
(78, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.78080000', '1.58080000', 1021, 1123, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 19:24:24', 2, '2020-03-20 19:30:18', NULL, NULL, NULL, NULL, NULL),
(79, 304, 'tz1it1Txm5V62x7xDpjXYiChet2WXs5jLjij', 2060, 3, '1.77380000', '1.57380000', 1025, 1127, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 19:51:19', 2, '2020-03-20 20:03:14', NULL, NULL, NULL, NULL, NULL),
(80, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.81640000', '1.61640000', 1001, 1101, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 20:04:21', 2, '2020-03-20 20:11:24', NULL, NULL, NULL, NULL, NULL),
(81, 304, 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 2060, 3, '1.82180000', '1.62180000', 998, 1097, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 20:04:52', 2, '2020-03-20 20:27:07', NULL, NULL, NULL, NULL, NULL),
(82, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.63650000', '1.83650000', 990, 1089, '260.00', '0.00', '0.00', 0.2, 4, '2020-03-20 20:18:44', 2, '2020-03-20 20:30:50', NULL, NULL, NULL, NULL, NULL),
(83, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.69790000', '1.89790000', 958, 1053, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-20 20:28:36', 2, '2020-03-20 20:31:28', NULL, NULL, NULL, NULL, NULL),
(84, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.75920000', '1.95920000', 928, 1020, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-20 20:31:54', 1, '2020-03-20 20:35:18', '\"oorwiUUrzHxmii1rgETTJHkhEMVWCy2qpEhBhjVDfoy4jupTwHC\"\n', NULL, NULL, NULL, NULL),
(85, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.61640000', '1.81640000', 1001, 1101, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-21 09:53:44', 2, '2020-03-21 10:01:21', NULL, NULL, NULL, NULL, NULL),
(86, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.63100000', '1.83100000', 993, 1092, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-21 10:11:43', 2, '2020-03-21 12:48:00', NULL, NULL, NULL, NULL, NULL),
(87, 304, 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 3090, 3, '2.52180000', '2.72180000', 1002, 1102, '390.00', '90.00', '300.00', 0.2, 4, '2020-03-21 10:31:51', 2, '2020-03-21 11:07:42', NULL, NULL, NULL, NULL, NULL),
(88, 253, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', 10300, 1, '0.00190867', '0.00240867', 3774241, 4151665, '1300.00', '300.00', '1000.00', 0.0005, 4, '2020-03-21 12:59:42', 2, '2020-03-21 13:24:00', NULL, NULL, NULL, NULL, NULL),
(89, 253, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', 10300, 1, '0.00186734', '0.00236734', 3840134, 4224147, '1300.00', '300.00', '1000.00', 0.0005, 4, '2020-03-21 13:34:38', 1, '2020-03-21 16:03:29', '98a3df94d1f891d999546e471d0aa1863ec50983d602b5a8ec3015ab40554852', NULL, NULL, NULL, NULL),
(90, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.62920000', '1.82920000', 994, 1093, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-21 18:00:41', 1, '2020-03-21 18:07:12', '\"opF7JtKR51yMi9NbkHYBXPSTjp9Twc9BopaY4ocj4ZfxkPRUEhK\"\n', NULL, NULL, NULL, NULL),
(91, 334, 'tz1N3H18aEentBEgGAuDUkJG51i1jhqdqEvQ', 2060, 3, '1.77200000', '1.97200000', 922, 1014, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-23 06:49:32', 1, '2020-03-23 07:42:07', '\"opNopoqURsT5czozQ3PhAGY5PXviT4WGNQHzC2rgRoMH64oikkS\"\n', NULL, NULL, NULL, NULL),
(92, 329, 'tz1cGBwD75FfvZ44dy1GKaJjSbKEd9UzZ9pD', 49955, 3, '44.56230000', '44.76230000', 985, 1083, '6305.00', '1455.00', '4850.00', 0.2, 4, '2020-03-23 16:33:20', 1, '2020-03-23 19:02:51', '\"ooMbKN5u65jw7P2NiPVtf7xNUXJWru8fpxXMQFh8BUvSN8hREXc\"\n', NULL, NULL, NULL, NULL),
(93, 329, '13yFGWNn629RxSuD9TmsmPV4Lzgr5dNaJS', 99807, 1, '0.02220601', '0.02270601', 3879630, 4267593, '12597.00', '2907.00', '9690.00', 0.0005, 4, '2020-03-23 17:15:07', 1, '2020-03-23 19:40:26', 'dac32ef7ed3f8577aeba0aac4ac851ff042f9aa4a58cbf484ac9d4046a45fc08', NULL, NULL, NULL, NULL),
(94, 336, '13Cf1YxcZGsnkdUsZrXJyHqre13B2oa8Fq', 69010, 1, '0.01426047', '0.01476047', 4126500, 4539150, '8710.00', '2010.00', '6700.00', 0.0005, 4, '2020-03-24 08:27:32', 1, '2020-03-24 12:14:50', '62dd66802b1957e353fbeb3aabfcf1b55bbc3ad2fc811f3d931ed8cc8cb1d8bc', NULL, NULL, NULL, NULL),
(95, 253, 'tz1RZqdJxusQTeqq72e6RanS3LicUiSDJG5i', 2060, 3, '1.50880000', '1.70880000', 1064, 1170, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-24 16:39:38', 1, '2020-03-24 16:49:29', '\"oomYFo7Mbv84E1dpGaecyV9nboLHjibYzzNjeXqSwGXydmL8YRd\"\n', NULL, NULL, NULL, NULL),
(96, 257, '1BgHSTtu44KyxFNYFM8mu2bzU9E8Qz16wg', 10300, 1, '0.00173039', '0.00223039', 4075934, 4483527, '1300.00', '300.00', '1000.00', 0.0005, 4, '2020-03-25 06:51:24', 1, '2020-03-25 12:18:05', 'ff6c2553862a94335705307a229328744397f8ac420ff94b6522a114f3922390', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(97, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 5150, 3, '4.13730000', '4.33730000', 1048, 1152, '650.00', '150.00', '500.00', 0.2, 4, '2020-03-25 06:52:09', 1, '2020-03-25 13:21:52', '\"oo8x7QgZ6EFCFW6JkrEEdpeuA1nrYXDuXj12kVfJv54QmFH7Y42\"\n', NULL, NULL, NULL, 'jamal@nzinghaa.io'),
(99, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 5150, 3, '4.26510000', '4.46510000', 1018, 1119, '650.00', '150.00', '500.00', 0.2, 4, '2020-03-26 18:37:14', 1, '2020-03-27 07:41:47', '\"ooCuMmXomo59iH3aa5xUHSZ9J9txoan8gFSVyJG3JcRcDTHbR63\"\n', NULL, NULL, NULL, 'jamal@nzinghaa.io'),
(100, 301, 'tz1YihgVcpQPim5QvQHRxBcH1t9X8qpHchTU', 5150, 3, '4.22600000', '4.42600000', 1027, 1129, '650.00', '150.00', '500.00', 0.2, 4, '2020-03-27 10:05:30', 1, '2020-03-27 11:40:11', '\"oneSSeG4NDiRN5ZU7fZGGKciriRNwuga6zz5KaVatGr8mMY3mCM\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(101, 295, 'tz1WNphwgQY7bnWVu1WwjCzCKCSjDzX8kHyi', 2060, 3, '1.74870000', '1.94870000', 933, 1026, '260.00', '60.00', '200.00', 0.2, 4, '2020-03-28 14:56:30', 1, '2020-03-28 15:04:40', '\"ong53BXpJzmoP56VFGSStupPXhB9hG7W7uAP2q1rgUsEp1PPovs\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(102, 336, '13Cf1YxcZGsnkdUsZrXJyHqre13B2oa8Fq', 80340, 1, '0.01920910', '0.01970910', 3597784, 3957562, '10140.00', '2340.00', '7800.00', 0.0005, 4, '2020-03-29 18:16:29', 1, '2020-03-30 13:35:13', '3bc140f5ae45683f2f4699863d16437b45ce1d6ae49e0209c63573c19ca0e824', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(103, 338, '16NtSz4rzsEcbucdMCSg7UhJhh8PrLRbxw', 25750, 1, '0.00553183', '0.00603183', 3767887, 4144675, '3250.00', '750.00', '2500.00', 0.0005, 4, '2020-03-30 13:59:14', 1, '2020-03-30 14:37:51', '59a91e3d0a72ecc17a38cec055d9361cbe1733512f6961f1d3ba12b881d31fd8', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(104, 338, '16NtSz4rzsEcbucdMCSg7UhJhh8PrLRbxw', 25750, 1, '0.00553183', '0.00603183', 3767887, 4144675, '3250.00', '750.00', '2500.00', 0.0005, 4, '2020-03-30 13:59:18', 2, '2020-03-30 14:19:52', NULL, NULL, NULL, NULL, NULL),
(105, 338, '16NtSz4rzsEcbucdMCSg7UhJhh8PrLRbxw', 25750, 1, '0.00538882', '0.00588882', 3859391, 4245330, '3250.00', '750.00', '2500.00', 0.0005, 4, '2020-03-31 08:19:28', 1, '2020-04-01 12:12:43', '129d78b302e0b863d56a13bbe368210b56e820141d3c34c3da1e2fcb40681a85', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(106, 336, 'tz1LFvUnTWGNmWLc9v1NPDiNYS8ivGLmGfQ3', 2575, 3, '2.01730000', '2.21730000', 1025, 1127, '325.00', '75.00', '250.00', 0.2, 4, '2020-04-04 08:37:00', 1, '2020-04-04 16:55:31', '\"oonaskBiHqgBYc9uiGP7DSJFParMqUS8r8be4x5hae6zxv8gWUA\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(107, 336, 'tz1LFvUnTWGNmWLc9v1NPDiNYS8ivGLmGfQ3', 3090, 3, '2.45040000', '2.65040000', 1029, 1131, '390.00', '90.00', '300.00', 0.2, 4, '2020-04-04 09:07:23', 1, '2020-04-04 16:01:06', '\"op696mL33EJo1ikEjbsB6MUJua3DNB6yDQiDLb2SvPcnUD4JgDf\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(108, 336, '13Cf1YxcZGsnkdUsZrXJyHqre13B2oa8Fq', 74160, 1, '0.01520989', '0.01570989', 4166455, 4583100, '9360.00', '2160.00', '7200.00', 0.0005, 4, '2020-04-04 10:04:33', 1, '2020-04-04 16:41:06', '76a50a42ce2f1afacd203ac75dd6ee878a4c132ea464691be9c773e362f18266', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(109, 289, 'tz1VgeM9Vbm8ywCA5rsHjtY2xCcBH8eWQghh', 5923, 3, '4.90970000', '5.10970000', 1023, 1125, '747.50', '172.50', '575.00', 0.2, 4, '2020-04-05 10:26:49', 1, '2020-04-05 10:56:36', '\"onqGWyWteQg45U51HV8aEvDKFZHnaKZQDo5nT1B5DhAbqtpFhC1\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(110, 338, '16NtSz4rzsEcbucdMCSg7UhJhh8PrLRbxw', 38110, 1, '0.00723380', '0.00773380', 4349265, 4784191, '4810.00', '1110.00', '3700.00', 0.0005, 4, '2020-04-06 16:09:52', 1, '2020-04-06 17:15:53', '8d631b1537f8a3cda3b8a423c4c2fd325a70e0f982202cfc2cda19bf3365b9ff', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(111, 336, 'tz1LFvUnTWGNmWLc9v1NPDiNYS8ivGLmGfQ3', 3090, 3, '2.25480000', '2.45480000', 1111, 1222, '390.00', '90.00', '300.00', 0.2, 4, '2020-04-06 16:51:20', 1, '2020-04-06 17:16:09', '\"onpXdJNDD2bgRgb1WBosx2PvbdFgW744BvUwMDLEr7K2sfsTp48\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(112, 329, 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', 64519, 3, '50.01640000', '50.21640000', 1134, 1247, '8143.20', '1879.20', '6264.00', 0.2, 4, '2020-04-06 19:00:18', 1, '2020-04-06 20:48:19', '\"ooRttJjkZuVMvsGRzAGy5dZZHhCNJdLw4cvguscVrmi6Ph1spN3\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(113, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.40760000', '1.60760000', 1131, 1244, '260.00', '60.00', '200.00', 0.2, 4, '2020-04-06 20:08:26', 2, '2020-04-06 20:38:24', NULL, NULL, NULL, NULL, NULL),
(114, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2060, 3, '1.26510000', '1.46510000', 1241, 1365, '260.00', '60.00', '200.00', 0.2, 4, '2020-04-07 16:52:27', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 330, 'tz1SpUQdTZ5guFWSdt1hduzJP9XA6bS4yTMm', 2060, 3, '1.29640000', '1.49640000', 1215, 1336, '260.00', '60.00', '200.00', 0.2, 4, '2020-04-07 19:15:10', 1, '2020-04-07 20:46:32', '\"ooCYAVwKPfMA7TzmvaNFhAA4BGCUVMThXw4RqFXHgxrncZxbemT\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(116, 336, '13Cf1YxcZGsnkdUsZrXJyHqre13B2oa8Fq', 108150, 1, '0.02264789', '0.02314788', 4123683, 4536051, '13650.00', '3150.00', '10500.00', 0.0005, 4, '2020-04-12 11:45:16', 1, '2020-04-12 13:52:41', '0a73ec2eb8121484e115fefc1b8b4d886ad00648b5ff4f666c654e5f84ee77bd', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(117, 274, 'tz1Z3njZL71xc6VCVFN8PR3T4ftuQXGg99HT', 49440, 3, '37.54770000', '37.74770000', 1156, 1271, '6240.00', '1440.00', '4800.00', 0.2, 4, '2020-04-13 09:04:54', 1, '2020-04-13 09:41:01', '\"ooqHxnLEY7t62Pa3ickdk4bGoWHf3XJPiZgRevsJNQKpK2S88Dw\"\n', NULL, NULL, NULL, 'nelly@nzinghaa.io'),
(118, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 9785, 3, '7.03310000', '7.23310000', 1194, 1313, '1235.00', '285.00', '950.00', 0.2, 4, '2020-04-14 18:38:11', 1, '2020-04-15 10:08:33', '\"opKHiNfAoY6uj2qvHr2RVsS5TPFbzcdspVFWh3f3fbhpc86LnS4\"\n', NULL, NULL, NULL, 'jamal');

-- --------------------------------------------------------

--
-- Structure de la table `buyorder`
--

CREATE TABLE `buyorder` (
  `transaction_id` int(11) NOT NULL,
  `txid` text NOT NULL,
  `state` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date_transaction` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refid` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `delivrairy_state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `buyorder`
--

INSERT INTO `buyorder` (`transaction_id`, `txid`, `state`, `amount`, `date_transaction`, `refid`, `delivrairy_state`) VALUES
(40, 'O5XZGP-V5CTU-H45JFC', 0, 1, '2020-03-11 18:02:30', 'BMB6XBR-VGWD4W-FQDENI', 1),
(41, 'ON2AH6-27ZEU-2ENSKD', 0, 1, '2020-03-12 11:42:40', 'BMBEMOA-TTQI3M-PK2QGQ', 1),
(42, 'O2JVZR-LIUJY-F74TDT', 0, 2, '2020-03-13 17:18:51', 'BMBVDPC-WSEGEB-OYFLST', 1),
(43, 'OEKXLM-WPNSD-4SLQ5X', 0, 2, '2020-03-14 12:16:23', 'BMBW32X-G7B6XG-4JQ3C3', 1),
(45, 'OHK2FF-FQYDL-TX53YX', 0, 44, '2020-03-15 07:50:54', NULL, NULL),
(46, 'OFUQPM-EWLHP-DCUFI3', 0, 7, '2020-03-15 16:17:55', 'BMBQAIM-WHEMVW-N2KGIH', 1),
(47, 'OFUQPM-EWLHP-DCUFI3', 0, 7, '2020-03-15 16:17:55', 'BMBQAIM-WHEMVW-N2KGIH', 1),
(48, 'OLT552-IZJ6B-L6QF3Y', 0, 6, '2020-03-16 07:20:56', 'BMBXGK2-VDPGPZ-F3COVT', 1),
(49, 'OLOTL4-MLTZW-DSMOG3', 0, 12, '2020-03-16 08:36:56', 'BMB4RRT-Z3WG3K-HTCS4O', 1),
(50, 'O57Y2N-YGUSD-YMAN5L', 0, 7, '2020-03-16 14:12:57', 'BMBWRH6-N566AL-O2U7WG', 1);

-- --------------------------------------------------------

--
-- Structure de la table `buyrescue`
--

CREATE TABLE `buyrescue` (
  `transaction_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `receiveaddress` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` float NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `cryptoamount` float NOT NULL DEFAULT '0',
  `cryptoprice` float DEFAULT '0',
  `cryptosellingprice` float NOT NULL DEFAULT '0',
  `fees` float NOT NULL DEFAULT '0',
  `wallettypefiat_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `statut` text NOT NULL COMMENT '0 : Pending; 1 : Validate; 2 : Cancellation',
  `date_traitement` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `transactionhash` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `raison` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type_livraison` int(11) DEFAULT '0' COMMENT '0 : Pending; 1 : Validate; 2 : Cancellation; 3 : not validated',
  `stateorderbuy` int(11) DEFAULT '0' COMMENT '0 : commande envoyer chez kraken; 1 : livré; 2 : Cancellation; 3 : not validated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `buyrescue`
--

INSERT INTO `buyrescue` (`transaction_id`, `customers_id`, `receiveaddress`, `amount`, `wallettype_id`, `cryptoamount`, `cryptoprice`, `cryptosellingprice`, `fees`, `wallettypefiat_id`, `transaction_date`, `statut`, `date_traitement`, `transactionhash`, `raison`, `type_livraison`, `stateorderbuy`) VALUES
(17, 260, 'null', 2200, 3, 0, 0, 0, 0, 4, '2020-02-22 12:13:59', '1', NULL, NULL, NULL, 0, NULL),
(18, 260, 'null', 1100, 3, 0, 0, 0, 0, 4, '2020-02-22 12:15:12', '1', NULL, NULL, NULL, 0, NULL),
(19, 260, 'null', 2200, 3, 0, 0, 0, 0, 4, '2020-02-22 12:19:51', '1', NULL, NULL, NULL, 0, NULL),
(20, 259, 'null', 2200, 3, 0, 0, 0, 0, 4, '2020-02-22 12:59:36', '1', NULL, NULL, NULL, 0, NULL),
(21, 259, 'null', 1100, 1, 0, 0, 0, 0, 4, '2020-02-22 13:00:12', '1', NULL, NULL, NULL, 0, NULL),
(22, 257, 'null', 2200, 3, 0, 0, 0, 0, 4, '2020-02-22 16:23:55', '1', NULL, NULL, NULL, 0, NULL),
(23, 257, 'null', 2750, 3, 0, 0, 0, 0, 4, '2020-02-22 16:26:07', '1', NULL, NULL, NULL, 0, NULL),
(24, 260, 'null', 1100, 3, 0, 0, 0, 0, 4, '2020-02-22 17:14:07', '1', NULL, NULL, NULL, 0, NULL),
(25, 257, 'null', 9900, 3, 0, 0, 0, 0, 4, '2020-02-22 19:38:27', '1', NULL, NULL, NULL, 0, NULL),
(26, 257, 'null', 9900, 3, 0, 0, 0, 0, 4, '2020-02-24 08:47:16', '1', NULL, NULL, NULL, 0, NULL),
(27, 257, 'null', 7700, 3, 0, 0, 0, 0, 4, '2020-02-25 20:26:27', '1', NULL, NULL, NULL, 0, NULL),
(28, 260, 'null', 1100, 3, 0, 0, 0, 0, 4, '2020-02-26 07:04:18', '1', NULL, NULL, NULL, 0, NULL),
(29, 280, 'null', 5995, 1, 0, 0, 0, 0, 4, '2020-02-27 21:42:46', '1', NULL, NULL, NULL, 0, NULL),
(30, 253, 'null', 2200, 3, 0, 0, 0, 0, 4, '2020-02-27 22:49:14', '1', NULL, NULL, NULL, 0, NULL),
(31, 279, 'null', 18700, 3, 0, 0, 0, 0, 4, '2020-03-02 15:50:17', '1', NULL, NULL, NULL, 0, NULL),
(32, 279, 'null', 1100, 3, 0, 0, 0, 0, 4, '2020-03-02 16:04:44', '1', NULL, NULL, NULL, 0, NULL),
(33, 289, 'null', 1584, 3, 0, 0, 0, 0, 4, '2020-03-02 17:17:08', '1', NULL, NULL, NULL, 0, NULL),
(34, 301, 'null', 1980, 3, 0, 0, 0, 0, 4, '2020-03-03 12:38:29', '1', NULL, NULL, NULL, 0, NULL),
(37, 304, '1CVsz8WZGZZqvbEPuaju4wyTm8rGr8RjQm', 1100, 1, 0, 0, 0, 0, 4, '2020-03-05 17:17:19', '1', NULL, NULL, NULL, 1, NULL),
(38, 267, 'null', 1100, 1, 0, 0, 0, 0, 4, '2020-03-06 10:29:29', '1', NULL, NULL, NULL, 1, NULL),
(39, 305, 'null', 17600, 1, 0, 0, 0, 0, 4, '2020-03-08 15:54:51', '1', NULL, NULL, NULL, 1, NULL),
(40, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, 1.3596, 1401, 1471, 64.8, 4, '2020-03-11 15:50:15', '1', '2020:03:11:18:40:45', NULL, NULL, 1, 0),
(41, 303, 'tz1TXg8H9HV6occvNdVVEUUHAZ3eagQKihjD', 2160, 3, 1.3471, 1414, 1484, 64.8, 4, '2020-03-11 18:53:40', '1', '2020:03:20:10:47:21', NULL, NULL, 1, 0),
(42, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, 2.0328, 937, 983, 64.8, 4, '2020-03-13 17:18:44', '1', '2020:03:13:17:53:58', NULL, NULL, 1, 0),
(43, 253, 'tz1RZqdJxusQTeqq72e6RanS3LicUiSDJG5i', 2160, 3, 1.9476, 978, 1026, 64.8, 4, '2020-03-14 12:16:17', '1', '2020:03:14:12:53:58', NULL, NULL, 1, 0),
(44, 253, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', 10800, 1, 0.00296254, 3214740, 3375480, 324, 4, '2020-03-14 13:18:12', '0', NULL, NULL, NULL, 0, 0),
(45, 301, 'tz1YihgVcpQPim5QvQHRxBcH1t9X8qpHchTU', 4320, 3, 4.0143, 949, 996, 129.6, 4, '2020-03-15 07:50:50', '2', NULL, NULL, NULL, 1, 0),
(46, 289, 'tz1VgeM9Vbm8ywCA5rsHjtY2xCcBH8eWQghh', 3888, 3, 3.663, 936, 982, 116.64, 4, '2020-03-15 09:08:41', '1', '2020:03:15:16:53:58', NULL, NULL, 1, 0),
(47, 267, 'tz1LGCe2mFGJKqwnWV3BsMQTKMGYSWm8LPdQ', 3240, 3, 2.9608, 965, 1013, 97.2, 4, '2020-03-15 11:23:03', '1', '2020:03:15:16:58:58', NULL, NULL, 1, 0),
(48, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 5150, 3, 5.9673, 798, 837, 5400, 4, '2020-03-16 07:20:29', '1', '2020:03:16:07:58:58', NULL, NULL, 1, 0),
(49, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 9682, 3, 11.6567, 768, 806, 10152, 4, '2020-03-16 08:36:46', '1', '2020:03:16:09:13:58', NULL, NULL, 1, 0),
(50, 260, 'tz1UasU7YCX9P42wDskmwMp9bEet3jgzTSJ1', 5665, 3, 6.9563, 753, 790, 5940, 4, '2020-03-16 14:12:51', '1', '2020:03:16:14:53:58', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `buyrescue1`
--

CREATE TABLE `buyrescue1` (
  `transaction_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `receiveaddress` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `cryptoamount` decimal(10,8) NOT NULL,
  `cryptoprice` int(11) NOT NULL,
  `cryptosellingprice` int(11) NOT NULL,
  `fees` decimal(7,2) NOT NULL,
  `wallettypefiat_id` int(11) NOT NULL,
  `transaction_date` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `statut` int(1) NOT NULL,
  `date_traitement` varchar(19) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transactionhash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `raison` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type_livraison` bit(1) DEFAULT NULL,
  `stateorderbuy` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `buyrescue1`
--

INSERT INTO `buyrescue1` (`transaction_id`, `customers_id`, `receiveaddress`, `amount`, `wallettype_id`, `cryptoamount`, `cryptoprice`, `cryptosellingprice`, `fees`, `wallettypefiat_id`, `transaction_date`, `statut`, `date_traitement`, `transactionhash`, `raison`, `type_livraison`, `stateorderbuy`) VALUES
(17, 260, NULL, 2200, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:13', 1, NULL, NULL, NULL, NULL, NULL),
(18, 259, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:13', 1, NULL, NULL, NULL, NULL, NULL),
(19, 260, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:15', 1, NULL, NULL, NULL, NULL, NULL),
(20, 260, NULL, 2200, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:19', 1, NULL, NULL, NULL, NULL, NULL),
(21, 260, NULL, 55000, 1, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:24', 1, NULL, NULL, NULL, NULL, NULL),
(22, 257, NULL, 4950, 1, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:36', 1, NULL, NULL, NULL, NULL, NULL),
(23, 259, NULL, 2200, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 12:59', 1, NULL, NULL, NULL, NULL, NULL),
(24, 259, NULL, 1100, 1, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 13:00', 1, NULL, NULL, NULL, NULL, NULL),
(25, 257, NULL, 2200, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 16:23', 1, NULL, NULL, NULL, NULL, NULL),
(26, 257, NULL, 9900, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 16:26', 1, NULL, NULL, NULL, NULL, NULL),
(27, 260, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 17:14', 1, NULL, NULL, NULL, NULL, NULL),
(28, 257, NULL, 44900, 1, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 17:32', 1, NULL, NULL, NULL, NULL, NULL),
(29, 257, NULL, 9900, 3, '0.00000000', 0, 0, '0.00', 4, '22/02/2020 19:38', 1, NULL, NULL, NULL, NULL, NULL),
(30, 254, NULL, 33000, 1, '0.00000000', 0, 0, '0.00', 4, '23/02/2020 16:30', 1, NULL, NULL, NULL, NULL, NULL),
(31, 254, NULL, 58000, 1, '0.00000000', 0, 0, '0.00', 4, '24/02/2020 08:10', 1, NULL, NULL, NULL, NULL, NULL),
(32, 257, NULL, 9900, 3, '0.00000000', 0, 0, '0.00', 4, '24/02/2020 08:47', 1, NULL, NULL, NULL, NULL, NULL),
(33, 257, NULL, 22000, 1, '0.00000000', 0, 0, '0.00', 4, '24/02/2020 19:03', 1, NULL, NULL, NULL, NULL, NULL),
(34, 257, NULL, 7700, 3, '0.00000000', 0, 0, '0.00', 4, '25/02/2020 20:26', 1, NULL, NULL, NULL, NULL, NULL),
(35, 260, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '26/02/2020 07:04', 1, NULL, NULL, NULL, NULL, NULL),
(36, 278, NULL, 5500, 3, '0.00000000', 0, 0, '0.00', 4, '27/02/2020 18:24', 1, NULL, NULL, NULL, NULL, NULL),
(37, 280, NULL, 2060, 3, '0.00000000', 0, 0, '0.00', 4, '27/02/2020 21:25', 1, NULL, NULL, NULL, NULL, NULL),
(38, 280, NULL, 5995, 1, '0.00000000', 0, 0, '0.00', 4, '27/02/2020 21:42', 1, NULL, NULL, NULL, NULL, NULL),
(39, 253, NULL, 2200, 3, '0.00000000', 0, 0, '0.00', 4, '27/02/2020 22:49', 1, NULL, NULL, NULL, NULL, NULL),
(40, 287, NULL, 4995, 3, '0.00000000', 0, 0, '0.00', 4, '28/02/2020 20:18', 1, NULL, NULL, NULL, NULL, NULL),
(41, 287, NULL, 1500, 3, '0.00000000', 0, 0, '0.00', 4, '28/02/2020 20:20', 1, NULL, NULL, NULL, NULL, NULL),
(42, 295, NULL, 43000, 1, '0.00000000', 0, 0, '0.00', 4, '29/02/2020 15:57', 1, NULL, NULL, NULL, NULL, NULL),
(43, 296, NULL, 15000, 1, '0.00000000', 0, 0, '0.00', 4, '01/03/2020 17:15', 1, NULL, NULL, NULL, NULL, NULL),
(44, 289, NULL, 1000, 3, '0.00000000', 0, 0, '0.00', 4, '02/03/2020 12:37', 1, NULL, NULL, NULL, NULL, NULL),
(45, 279, NULL, 18700, 3, '0.00000000', 0, 0, '0.00', 4, '02/03/2020 15:50', 1, NULL, NULL, NULL, NULL, NULL),
(46, 279, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '02/03/2020 16:04', 1, NULL, NULL, NULL, NULL, NULL),
(47, 289, NULL, 1584, 3, '0.00000000', 0, 0, '0.00', 4, '02/03/2020 17:17', 1, NULL, NULL, NULL, NULL, NULL),
(48, 301, NULL, 1676, 3, '0.00000000', 0, 0, '0.00', 4, '03/03/2020 12:34', 1, NULL, NULL, NULL, NULL, NULL),
(49, 301, NULL, 1980, 3, '0.00000000', 0, 0, '0.00', 4, '03/03/2020 12:38', 1, NULL, NULL, NULL, NULL, NULL),
(50, 277, NULL, 22000, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:22', 1, NULL, NULL, NULL, NULL, NULL),
(51, 264, NULL, 99000, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:22', 1, NULL, NULL, NULL, NULL, NULL),
(52, 261, NULL, 22000, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:22', 1, NULL, NULL, NULL, NULL, NULL),
(53, 270, NULL, 23500, 3, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:28', 1, NULL, NULL, NULL, NULL, NULL),
(54, 266, NULL, 52125, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:28', 1, NULL, NULL, NULL, NULL, NULL),
(55, 284, NULL, 115000, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:28', 1, NULL, NULL, NULL, NULL, NULL),
(56, 294, NULL, 145000, 1, '0.00000000', 0, 0, '0.00', 4, '04/03/2020 17:28', 1, NULL, NULL, NULL, NULL, NULL),
(57, 303, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '05/03/2020 11:15', 1, NULL, NULL, NULL, NULL, NULL),
(58, 303, NULL, 1100, 3, '0.00000000', 0, 0, '0.00', 4, '05/03/2020 11:20', 1, NULL, NULL, NULL, NULL, NULL),
(59, 304, '1CVsz8WZGZZqvbEPuaju4wyTm8rGr8RjQm', 1100, 1, '0.00000000', 0, 0, '0.00', 4, '05/03/2020 17:17', 1, NULL, NULL, NULL, NULL, NULL),
(60, 267, NULL, 1000, 3, '0.00000000', 0, 0, '0.00', 4, '05/03/2020 20:07', 1, NULL, NULL, NULL, NULL, NULL),
(61, 267, NULL, 1100, 1, '0.00000000', 0, 0, '0.00', 4, '06/03/2020 10:29', 1, NULL, NULL, NULL, NULL, NULL),
(62, 304, NULL, 3400, 1, '0.00000000', 0, 0, '0.00', 4, '07/03/2020 07:50', 1, NULL, NULL, NULL, NULL, NULL),
(63, 305, NULL, 16500, 1, '0.00000000', 0, 0, '0.00', 4, '08/03/2020 15:49', 1, NULL, NULL, NULL, NULL, NULL),
(64, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, '1.35960000', 1401, 1471, '64.80', 4, '11/03/2020 15:50', 1, '2020:03:11:18:40:45', NULL, NULL, b'1', b'0'),
(65, 303, 'tz1TXg8H9HV6occvNdVVEUUHAZ3eagQKihjD', 2160, 3, '1.34710000', 1414, 1484, '64.80', 4, '11/03/2020 18:53', 1, '2020:03:20:15:43:38', '\"oocB9nChnkcXEfH3nbWSRvMNYqXSEuDaeWB5XF4N618y2kxrVvN\"\n', NULL, b'1', b'0'),
(66, 313, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', 2160, 3, '2.03280000', 937, 983, '64.80', 4, '13/03/2020 17:18', 1, '2020:03:13:17:53:58', NULL, NULL, b'1', b'0'),
(67, 253, 'tz1RZqdJxusQTeqq72e6RanS3LicUiSDJG5i', 2160, 3, '1.94760000', 978, 1026, '64.80', 4, '14/03/2020 12:16', 1, '2020:03:14:12:53:58', NULL, NULL, b'1', b'0'),
(68, 253, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', 10800, 1, '0.00296254', 3214740, 3375480, '324.00', 4, '14/03/2020 13:18', 0, NULL, NULL, NULL, b'0', b'0'),
(69, 301, 'tz1YihgVcpQPim5QvQHRxBcH1t9X8qpHchTU', 4320, 3, '4.01430000', 949, 996, '129.60', 4, '15/03/2020 07:50', 0, '2020:03:15:16:53:58', '', NULL, b'1', b'0'),
(70, 289, 'tz1VgeM9Vbm8ywCA5rsHjtY2xCcBH8eWQghh', 3888, 3, '3.66300000', 936, 982, '116.64', 4, '15/03/2020 09:08', 1, '2020:03:15:16:53:58', NULL, NULL, b'1', b'0'),
(71, 267, 'tz1LGCe2mFGJKqwnWV3BsMQTKMGYSWm8LPdQ', 3240, 3, '2.96080000', 965, 1013, '97.20', 4, '15/03/2020 11:23', 1, '2020:03:15:16:58:58', NULL, NULL, b'1', b'0'),
(72, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 5150, 3, '5.96730000', 798, 837, '5400.00', 4, '16/03/2020 07:20', 1, '2020:03:16:07:58:58', NULL, NULL, b'1', b'0'),
(73, 257, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', 9682, 3, '11.65670000', 768, 806, '10152.00', 4, '16/03/2020 08:36', 1, '2020:03:16:09:13:58', NULL, NULL, b'1', b'0'),
(74, 260, 'tz1UasU7YCX9P42wDskmwMp9bEet3jgzTSJ1', 5665, 3, '6.95630000', 753, 790, '5940.00', 4, '16/03/2020 14:12', 1, '2020:03:16:14:53:58', NULL, NULL, b'1', b'0');

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `City_id` int(11) NOT NULL,
  `City_name` varchar(45) DEFAULT NULL,
  `Country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

CREATE TABLE `country` (
  `Country_id` int(11) NOT NULL,
  `Country_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `country`
--

INSERT INTO `country` (`Country_id`, `Country_name`) VALUES
(1, 'Albania'),
(2, 'Algeria'),
(3, 'Angola'),
(4, 'Austria'),
(5, 'Belgium'),
(6, 'Benin'),
(7, 'Botswana'),
(8, 'Bulgaria'),
(9, 'Burkina Faso'),
(10, 'Burundi'),
(11, 'Cameroon'),
(12, 'Canada'),
(13, 'Cape Verde'),
(14, 'Central African Republic'),
(15, 'Chad'),
(16, 'Comoros'),
(17, 'Democratic Republic Of The Congo'),
(18, 'Djibouti'),
(19, 'Egypt'),
(20, 'Equatorial Guinea'),
(21, 'Eritrea'),
(22, 'Ethiopia'),
(23, 'France'),
(24, 'Gabon'),
(25, 'Gambia'),
(26, 'Georgia'),
(27, 'Germany'),
(28, 'Ghana'),
(29, 'Greece'),
(30, 'Guinea'),
(31, 'Guinea-Bissau'),
(32, 'Hungary'),
(33, 'Iceland'),
(34, 'Ireland'),
(35, 'Italy'),
(36, 'Kenya'),
(37, 'Lesotho'),
(38, 'Liberia'),
(39, 'Libya'),
(40, 'Luxembourg'),
(41, 'Madagascar'),
(42, 'Malawi'),
(43, 'Mali'),
(44, 'Malta'),
(45, 'Mauritania'),
(46, 'Mauritius'),
(47, 'Monaco'),
(48, 'Montenegro'),
(49, 'Morocco'),
(50, 'Mozambique'),
(51, 'Namibia'),
(52, 'Netherlands'),
(53, 'Niger'),
(54, 'Nigeria'),
(55, 'Portugal'),
(56, 'Republic Of The Congo'),
(57, 'Russia'),
(58, 'Rwanda'),
(59, 'San Marino'),
(60, 'Sao Tome and Principe'),
(61, 'Senegal'),
(62, 'Seychelles'),
(63, 'Sierra Leone'),
(64, 'Somalia'),
(65, 'South Africa'),
(66, 'South Sudan'),
(67, 'Spain'),
(68, 'Sudan'),
(69, 'Swaziland'),
(70, 'Tanzania'),
(71, 'Togo'),
(72, 'Tunisia'),
(73, 'Uganda'),
(74, 'Ukraine'),
(75, 'United Kingdom'),
(76, 'Western Sahara'),
(77, 'Zambia'),
(78, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `crypto_pricing`
--

CREATE TABLE `crypto_pricing` (
  `cryptocode` varchar(255) NOT NULL,
  `usdprice` float DEFAULT NULL,
  `cfaprice` int(255) DEFAULT NULL,
  `usdcfasellprice` int(255) DEFAULT NULL,
  `openingprice` float DEFAULT NULL,
  `dailyprice` float DEFAULT NULL,
  `eurprice` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `crypto_pricing`
--

INSERT INTO `crypto_pricing` (`cryptocode`, `usdprice`, `cfaprice`, `usdcfasellprice`, `openingprice`, `dailyprice`, `eurprice`) VALUES
('BTC', 6859.9, 4125779, 660, NULL, NULL, 6298.9),
('XLM', 0.047963, 28, 660, NULL, NULL, 0.044008),
('XTZ', 1.9498, 1172, 660, NULL, NULL, 1.7902);

-- --------------------------------------------------------

--
-- Structure de la table `currency`
--

CREATE TABLE `currency` (
  `currency_code` int(11) NOT NULL,
  `currency_label` varchar(255) NOT NULL,
  `currency_symbol` varchar(3) NOT NULL,
  `current_exchange_rate` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `birthdaydate` date DEFAULT NULL,
  `login` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `receiveaddress` varchar(36) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `pincode` varchar(64) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `balance_cfa` int(11) DEFAULT '0',
  `balance_xtz` float DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL COMMENT '0: Inactif, 1: actif;',
  `mobilephone` varchar(20) NOT NULL,
  `accountlock` int(1) DEFAULT NULL,
  `connectiontry` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`customers_id`, `lastname`, `firstname`, `birthdaydate`, `login`, `email`, `receiveaddress`, `password`, `pincode`, `create_time`, `balance_cfa`, `balance_xtz`, `address_id`, `status_id`, `mobilephone`, `accountlock`, `connectiontry`) VALUES
(257, 'NULL', 'NULL', '2015-01-01', 'Loba3006', 'loba3006@yahoo.fr', NULL, '0080e59ae9dcf22d82caa563e6ee040eebb206cec06678916f3dab241a2843b0', 'd6bd65a0a892f18f082d389b8979b1506b312bc8648c912d957d65cab1b2538c', '2020-02-21 19:43:06', 266, 0, 336, 1, ' 237672809292', 0, 0),
(256, 'NULL', 'NULL', '2015-01-01', 'Bernis', 'bernis.bangelin@gmail.com', NULL, '972cff2ea4bf71006809d9fa846408e536bd07c1f278930b55584e96f4460495', NULL, '2020-02-21 17:49:18', 0, 0, 335, 1, ' 237661000064', 0, 0),
(255, 'NULL', 'NULL', '2015-01-01', 'Loba', 'lobacm3006@gmail.cm', NULL, '0080e59ae9dcf22d82caa563e6ee040eebb206cec06678916f3dab241a2843b0', 'd6bd65a0a892f18f082d389b8979b1506b312bc8648c912d957d65cab1b2538c', '2020-02-21 17:44:15', 0, 0, 334, 1, ' 237699531279', 0, 0),
(254, 'NULL', 'NULL', '2015-01-01', 'kssolution', 'kamersolution@gmail.com', NULL, 'fa2647097fd881b1202859e1379b82402cbb963e85710c285ae95b610ca07abd', 'e74fe919ab365b1e87fac0138625f52fb78a357e3e239b695928c869f3b8e4d4', '2020-02-21 17:32:57', 0, 0, 333, 1, ' 237697666600', 0, 0),
(253, 'Tsafack', 'Fradith', '2015-01-01', 'fradith', 'fradithjeune3@gmail.com', NULL, '95b64c095d7fd3e9d37fe2ba7cd433026d235ae145ac537e776195d0b806f663', 'eb950303def8d784fae0ca161779b7cdd1e3920cb028957579b489ff33ebffee', '2020-02-21 16:06:06', 475, 0, 332, 1, ' 237697326066', 0, 0),
(259, 'Njoya Pokam', 'Abdelaziz ', '1996-02-25', 'hares', 'njoyaabdelazizthierry@gmail.com', NULL, 'be0941243161f85bf520c60009e07ff7d38ec42d7888a27c19cebc8984a6bbbe', '0d0247d2284d972de8eb32e12f4fdd3bc4550ffaac3724636ecbf7f81d736aa9', '2020-02-21 21:32:20', 8688, 0, 338, 1, ' 237651702809', 0, 0),
(260, 'NULL', 'NULL', '2015-01-01', 'Yetyet', 'mathieuyetnayetna@gmail.com', NULL, '6166921f9dda3ad8da0fe277b647e177a35160d045ed2ffa0520c6b6ef0ebeb6', '6224c5a42fa59a6451a786f2e2e664b957553781ffd40aae6c9e768835883cc3', '2020-02-22 11:14:31', 626, 0, 339, 1, ' 237679495501', 0, 0),
(261, 'NULL', 'NULL', '2015-01-01', 'Ghislain lanore', 'nsangou.lanore@yahoo.com', NULL, 'eeba4b4ee084cabf6d5768d011c866d7d0c32a8fad915d39d78cbead926cd699', NULL, '2020-02-22 11:40:32', 0, 0, 340, 1, ' 237677210314', 0, 0),
(262, 'NULL', 'NULL', '2015-01-01', 'Lanore', 'nghislainlanore@yahoo.com', NULL, '9915ee1be4bc6df81f74d6fc3f0b6bd249058a759c2fca191281c4718244b4f9', '74d7e08e006f84e3e644daca712a234be9598b1b27fa6fa8e7f22040eaedce6b', '2020-02-22 12:47:59', 0, 0, 341, 1, ' 237697461971', 0, 0),
(263, 'NULL', 'NULL', '2015-01-01', 'Ejama', 'paulnken@hotmail.com', NULL, '1c7d6d462930de4c55728a339394186ce9254664f8a1f518049e3fe08a0ea081', 'f1e316093276cf722f179154b6ef7aa5c0b4e1d2c527b6c7678606be97d765c5', '2020-02-22 17:26:36', 0, 0, 342, 1, ' 237677675940', 0, 0),
(264, 'NULL', 'NULL', '2015-01-01', 'DJANGO', 'ifouedaniel@gmail.com', NULL, 'c5d8a4cefc9fb1a41c64a1c1fd1f4eeb98886428c5eeb6af5d79b909a91a0ef5', '1a187daba7055b7e225a2258645c9b9a6698f254693d17a503ef48e32bc0b3a0', '2020-02-23 12:01:28', 0, 0, 343, 1, ' 237696201988', 0, 0),
(265, 'NULL', 'NULL', '2015-01-01', 'Cryptofab', 'fabricewoukeng1@gmail.com', NULL, 'a19f00f07e1c3ca5abebf8463b1f7c8024988db3d548d26bdbc1cc92687ce2c7', '87574f4eea6fafc4b31db16a06907aac3c11fcac3342f4af1bd1b9686dcdea9e', '2020-02-23 16:06:04', 0, 0, 344, 1, ' 237697818740', 0, 0),
(266, 'NULL', 'NULL', '2015-01-01', 'sultan', 'sokoudjousinclair@gmail.com', NULL, '18fe4c75a0f65e9ca5f9f30d38eded7f60da107487f8dd62f6ab3499f2ef0d2a', '4e52047d9858902a04b293fc4379450862472d4c73f5b4189c977da9a2591084', '2020-02-23 18:41:04', 1998, 0, 345, 1, ' 237697706983', 0, 0),
(267, 'NULL', 'NULL', '2015-01-01', 'MAS', 'mekontsoanderson@gmail.com', NULL, '365acbe60c1b9fbedcd5842a1e2657b824c170c3d922883ad93f526a7ad9e396', '930d5c7e1eef69e0da1ed6292e4038ab706e7003b5202f18ea7c936ac85e8aa2', '2020-02-24 09:09:29', 2009, 0, 346, 1, ' 237694888878', 0, 0),
(268, 'NULL', 'NULL', '2015-01-01', '100pages', 'lionelj3@gmail.com', NULL, '598cbada0015a20c3874238f26bd040acd695c676d4a14a455e989957b602111', '23cb4b4e3ccd6a584e05f386aeb052a34074f8983d5fd60d5496cb6fa398d223', '2020-02-24 11:41:19', 0, 0, 348, 1, ' 237670936485', 0, 0),
(269, 'NULL', 'NULL', '2015-01-01', 'fradith2', 'fradithjeune4@gmail.com', NULL, '95b64c095d7fd3e9d37fe2ba7cd433026d235ae145ac537e776195d0b806f663', 'eb950303def8d784fae0ca161779b7cdd1e3920cb028957579b489ff33ebffee', '2020-02-25 14:46:01', 0, 0, 349, 1, ' 237678642421', 0, 0),
(270, 'NULL', 'NULL', '2015-01-01', 'kss', 'hack3.0man@gmail.com', NULL, 'c31fc2abc56c5e77b7cfbae7f3db68cca576185f508d98361acbe1bf3f4e6a0b', '3ec74c986de7e9113286abb4a15ed8246c33f99eac7c755ab0ce795217755a75', '2020-02-25 15:50:55', 0, 0, 350, 1, ' 237690804919', 0, 0),
(271, 'NULL', 'NULL', '2015-01-01', 'FortuneBITCOIN', 'testadressebitcoin@gmail.com', NULL, 'c06f17af911a91c03075bfe2360aa0a86dd7dec75c759e3cf051f9eafe2835df', 'fe52e9bc61899656f20e3405226b4926b45d50777883e7140a70fafbe4fc32da', '2020-02-25 17:49:08', 0, 0, 351, 1, ' 237662616613', 0, 0),
(336, 'Abdoul-Karim', 'Mbot Mfondi', '1994-02-10', 'mbotabdoul', 'abdoulkarimmfondi@gmail.com', NULL, 'be0941243161f85bf520c60009e07ff7d38ec42d7888a27c19cebc8984a6bbbe', '0a9d5cc0570d7d9289ad9fbb93deaf4753242d02914a0453f70dc646d5b9aa21', '2020-03-24 08:16:49', 2322, 0, 462, 1, ' 237694947105', 0, 0),
(273, 'NULL', 'NULL', '2015-01-01', 'chakaneld', 'nchatue+jara@gmail.com', NULL, '007aea9f4a19e503eb51b49cccde3347b2b11f4c6badbb1ce418989c9840d596', 'e9605e4c34926819bc7e91a4ae86453c914be0326a247fe2884c160c2d7c9378', '2020-02-26 07:28:10', 0, 0, 355, 1, ' 33616976114', 0, 0),
(274, 'NULL', 'NULL', '2015-01-01', 'fouomene', 'fouomenedaniel@gmail.com', NULL, '5418d53971e26a2ca394d70f72c01b996c3171f31588e90cc57d552f3eecd3c5', '0d6b08bdf31075bc86a9b55647e4fcc55b4e265e77385d1d720192d5fc7f90ef', '2020-02-27 16:06:40', 515, 0, 356, 1, ' 237674099619', 0, 0),
(275, 'NULL', 'NULL', '2015-01-01', 'Prost', 'prostyonga06@gmail.com', NULL, '680adc50315a0bbe74f0e89dda181206a911c0c4c83a33d20aae43931ddd091d', '257bf33de110efc0a50e6bf368f3016982867e489738323f05c2ff623e1e30a8', '2020-02-27 17:32:29', 0, 0, 357, 1, ' 237690603925', 0, 0),
(276, 'NULL', 'NULL', '2015-01-01', 'Aubinho85', 'njuimbin@gmail.com', NULL, '9d682b1f1ab12118dd836ef4d63b5481cc5e883458443c66c7d5476ffea110e1', 'e256cdd91eb41ede43aefceadd1f0359d3021cff8732a20c770d53a41d08d02c', '2020-02-27 17:57:23', 0, 0, 358, 1, ' 237695926751', 0, 0),
(277, 'NULL', 'NULL', '2015-01-01', 'marouf', 'elmaroufa@gmail.com', NULL, '36b213635116c2a726cf7db2b5bc29d5acbb01da4f25e16c289eff5b16ef45e0', '839491dcfcd0f39ea440851e44c9ecb3dafda57c63bbaa0a14b3e65b81ebe565', '2020-02-27 18:08:29', 0, 0, 359, 1, ' 237669734148', 0, 0),
(278, 'NULL', 'NULL', '2015-01-01', 'herman', 'herman@mailinator.com', NULL, '3bf39bf3fe465c0600105b3451f274fa9f05b3c706f022608c0fb28285fe5cbf', 'dd88f9ee980ae9af889fdec7f3e78f249430a97b87931fc5679c7319f6118e00', '2020-02-27 18:23:05', 0, 0, 360, 1, ' 237674512384', 0, 0),
(279, 'NULL', 'NULL', '2015-01-01', 'StephKohpé ', 'skohpe@yahoo.com', NULL, 'c4adfbc540b51bdc60292047651c2c893fea29b69aedcf67a63ac8d89a773822', NULL, '2020-02-27 18:29:29', 182, 0, 361, 1, ' 237695888065', 0, 0),
(280, 'NULL', 'NULL', '2015-01-01', 'LeParrain', 'tecyfra@gmail.com', NULL, 'eabcec865462f373b67d0fe55fc2a70e3d113907846a91465741350e7a2aa391', '6668bd83728894f22fab75d0c6a42d9222e607ee673dea4856a6381db71603f1', '2020-02-27 19:53:55', 0, 0, 363, 1, ' 237652035569', 0, 0),
(281, 'NULL', 'NULL', '2015-01-01', 'junior Muna', 'juniormuna1@gmail.com', NULL, '37c302c47ac805ba47fe640e20b7f2b0355ed6fe39c49fe853b678f6c1127bc4', NULL, '2020-02-27 21:03:25', 0, 0, 364, 1, ' 237655099757', 0, 0),
(282, 'NULL', 'NULL', '2015-01-01', 'eko2020', 'elvis.konjoh@yahoo.com', NULL, '4775b53423c2d559258094064e936a227000a3912f3ba0c08afa2ebacca179a9', 'eafa4c56dc8078ed824e9bf74e0b6ab94673460a54b124d602eb9f7aeb9b0617', '2020-02-28 09:01:32', 0, 0, 365, 1, ' 237696078824', 0, 0),
(283, 'NULL', 'NULL', '2015-01-01', 'Dolly', 'nlemdolly@gmail.com', NULL, 'c66ecfd8d0bb32d5629eb3f2470a0a8fb1141f1da7247feb0bd644d878a9d2f4', '87ad0bcb2da2520b267b58d763b7cf6aaec385f3eeb0656511544f720410af5c', '2020-02-28 10:16:07', 0, 0, 366, 1, ' 237656857571', 0, 0),
(284, 'NULL', 'NULL', '2015-01-01', 'joel4mlm', 'joel4mlm@gmail.com', NULL, 'f13cf6bf6c8a07527f8c63fdb3a24f399b33ffe35a39746641cfdeba1588f3e3', 'dd7caac1b29301f7a6fbb3593aa24b59d1c3e51d1d74713c14593f02344627c6', '2020-02-28 10:51:10', 4995, 0, 367, 1, ' 237677182675', 0, 0),
(285, 'NULL', 'NULL', '2015-01-01', 'Jovial', 'douanlajovial@gmail.com', NULL, '1d4c5844ff1b43e52ff9f1b6bca7d99586acdeea82e93d92afacbc39c0cf1479', '23470a4237b9476c05a305e7c2e93a21810ce51884ae0dd37d1026920c0a71b8', '2020-02-28 15:19:02', 0, 0, 368, 1, ' 33769650914', 0, 0),
(286, 'NULL', 'NULL', '2015-01-01', 'smith237', 'tellanelson8@gmail.com', NULL, '1a6c433dcc2939f6e26976a3784dc128e6121b8c1e9b4d0ff09710341f58e6d4', '904672d5b04e4a240c38d29468786f585a2863a293147f09bf0f8bc6b2d6a556', '2020-02-28 16:12:24', 0, 0, 369, 1, ' 237697380148', 0, 0),
(287, 'Illona', 'Moumié', '1996-03-14', 'illona1996', 'illona_moumi@yahoo.fr', NULL, 'c8582e1ecb8fda2f2ff081081ac3f4392048725ce2a4de6ab02230768f80fe13', '3a8abbc8411cbe419e8ddd7645f4ec669991c26a90e79727d0ba45708b34ec01', '2020-02-28 19:35:41', 0, 0, 370, 1, ' 237696057257', 0, 0),
(288, 'NULL', 'NULL', '2015-01-01', 'Yunik7', 'chatue.sonia@gmail.com', NULL, 'b0f5d6a90a8af9831e31c09055bae111d8846535cdd2009e0adef9f073b690c9', NULL, '2020-02-28 20:19:37', 0, 0, 371, 1, ' 237683519485', 0, 0),
(289, 'Justin', 'Onomo', '2001-03-03', 'NamNori', 'justinonomo@gmail.com', NULL, '04513cbacd49dd25836045b0d6fae58e7c7642f41704c88b14b1d150c0598126', 'd77561bb056c2feca21ddbc665e43563956a041ed86e2c588bbb4e5db8485495', '2020-02-29 10:41:33', 444, 0, 373, 1, ' 237680583420', 0, 0),
(290, 'NULL', 'NULL', '2015-01-01', 'Kira', 'mvemvearnoldjunior@gmail.com', NULL, '49d07f2733750928264eb96101ccac4805c0d629bd4f5593dfc270aa4071e928', 'ee9e5acf09074057cd24c184c07ac05b017dd73b40b4f606ad28cdbef01e3133', '2020-02-29 10:50:28', 0, 0, 374, 1, ' 237653451508', 0, 0),
(291, 'NULL', 'NULL', '2015-01-01', 'Stephen2wise', 'stephen.foka@gmail.com', NULL, '11355e7557afaf0b075b0c72b8a001955f55a4a21bd8f3ba3d41d30aff4ab2a3', '2c05c12df715c373e8102308ec45bcc361569fd76617100ec8e143972ae9e255', '2020-02-29 10:58:26', 0, 0, 375, 1, ' 237695613861', 0, 0),
(292, 'NULL', 'NULL', '2015-01-01', 'sandy', 'sandytsoyem@gmail.com', NULL, '71366efd80e5333d9d23c0cac5047be3e658f89a646d44e9cc172f840635defd', '281807052e59b26caed24948b6ffaaf2824d22a99b51dda23b1e90330a986b54', '2020-02-29 12:32:58', 0, 0, 376, 1, ' 237691795592', 0, 0),
(293, 'NULL', 'NULL', '2015-01-01', 'Joel', 'sonnajoel39@gmail.com', NULL, '365bb097ac5eb4751c28924263a349e0208076a56d2dacfc8b16f0a60ed2f67d', '2c30893ab7e8f9e709aa8152f5d9ef7528154d84c675a45cdf4eff40e9e279e0', '2020-02-29 12:34:43', 0, 0, 377, 1, ' 237670050977', 0, 0),
(294, 'NULL', 'NULL', '2015-01-01', 'ngouloure', 'ngouloureali@gmail.com', NULL, 'f47090747dc84a2f213fef28696619a8b5665376b718e9110c925cda8e6a4063', 'ebfdb33907b755721a97de8ae87ac1a1a6e70dc9ad5f81e8c2064697ba57f3c3', '2020-02-29 12:36:33', 0, 0, 378, 1, ' 237699581517', 0, 0),
(295, 'NULL', 'NULL', '2015-01-01', 'wadjith', 'wadjith@gmail.com', NULL, 'a1087187db1fe05dc130f8bb17cca826dd2aa2c84a7978f7236726b052ccb75c', 'cbc6599361334cd6f16850114ef09dbe59f8711a22235886059ea25d6e83ec2f', '2020-02-29 13:03:38', 438, 0, 379, 1, ' 237677012678', 0, 0),
(296, 'NULL', 'NULL', '2015-01-01', 'goldengatesbuea', 'goldengatesbuea@gmail.com', NULL, '87acd2540f21ade41e977d060fa914441892992896941f21f05e35db33ac281a', 'afa18a33ad0d9eb1a30dfe9d704affcc8692273630f9a705a2e60887cc8356b3', '2020-02-29 13:08:20', 0, 0, 380, 1, ' 237651279347', 0, 0),
(297, 'NULL', 'NULL', '2015-01-01', 'obeshor ', 'yannicksergeobam@gmail.com', NULL, '6d0833d152457a870e18498f904c555ad64e1c3827422c11b5fa9c19ce645fe1', NULL, '2020-02-29 13:11:23', 0, 0, 381, 1, ' 237652611727', 0, 0),
(298, 'NULL', 'NULL', '2015-01-01', 'Dolorès', 'enyeguem1@gmail.com', NULL, '0ad36afa3ed6644243c461292841d40dea94cf4ced3d4172a3593c001b063131', NULL, '2020-02-29 13:32:12', 0, 0, 382, 1, ' 237650555060', 0, 0),
(299, 'NULL', 'NULL', '2015-01-01', 'brandolkuete', 'brandolkuete95@gmail.com', NULL, 'de18751cbf74f6a0084acbb387057f24d754c0de3239e4b96f86575095cf0374', 'b38cb593e4adbe6b6c47776966611de91843aff78f24bebaa0c12a4e4d5df841', '2020-02-29 14:51:04', 0, 0, 383, 1, ' 237691469475', 0, 0),
(300, 'Fabrice', 'Yonkeu', '1998-03-15', 'FabYk', 'fabyonkeu@gmail.com', NULL, '7b86af1a1f4155c768cd1ec860f2266557bffb36e6deec413a9fa5ba3abf3c22', '5e3cefce6e598fe15121b54031083d834b9abfefd6f09becec5bdae8100d7d3e', '2020-02-29 15:14:07', 0, 0, 384, 1, ' 237693329710', 0, 0),
(301, 'BILOA', 'Roméo ', '2015-01-01', 'bkrs ', 'bikoroser@gmail.com', NULL, 'cfa09cbcd4af96dea4bb496e534b131c0fb4597f0d1b796cce6d450de3017084', NULL, '2020-02-29 15:18:36', 845, 0, 385, 1, ' 237696957469', 0, 0),
(302, 'NULL', 'NULL', '2015-01-01', 'zedicus', 'zedicus27@gmail.com', NULL, '2d57a656ae1162c1558c07f08da27f991b34397c146dd21ed79d618bb852cff7', '1249b4ad600c6ea25aa9532a10853a99d7e6a5fb74a795cae66730d577996268', '2020-02-29 17:02:08', 0, 0, 387, 1, ' 237697222555', 0, 0),
(303, 'NULL', 'NULL', '2015-01-01', 'kevin', 'ekonokevin@gmail.com', NULL, '6615901b5d5d29b434b2a55a7eb1c6afe2493ba85d759502eae82e0226ec10cc', 'bc5187917ef21af04a5ec011fdf32ce5b2283794328a8573011f2b67001be012', '2020-03-02 15:05:49', 580, 0, 389, 1, ' 237691100128', 0, 0),
(304, 'NULL', 'NULL', '2015-01-01', 'Ejara', 'ejara@nzinghaa.io', NULL, 'be0941243161f85bf520c60009e07ff7d38ec42d7888a27c19cebc8984a6bbbe', '53d7596c53afa167830c1eb26f39571213fc1ccb1c091d1bb76da9ccfa434277', '2020-03-03 07:16:59', 2198, 0, 390, 1, ' 237655867729', 0, 0),
(305, 'NULL', 'NULL', '2015-01-01', 'Illonaold', 'oldcmoumie@univ-catho-sjd.com', NULL, 'e8db721e0c146e27626e45d913eb6e77e322546f5452e46941f589dc00b9d5e8', '5430b9085ed0d9e9aa3df33026f061594f9beb2016667983cf1f231adc714240', '2020-03-03 12:40:23', 0, 0, 392, 1, ' 237673754346500', NULL, 0),
(306, 'ngankou', 'Michel', '1996-09-17', 'MKILLER81', 'michelkiller81@gmail.com', NULL, '1919dae6364941e939cb3d7396ec8738789077e69e98347152c78db3bc9b6448', '798211d5d6ca5b3af058652d0050cd83b44f2ce6d2f4e12b73f5b23a74f3dfe8', '2020-03-04 09:59:20', 0, 0, 394, 1, ' 237690547176', 0, 0),
(307, 'NULL', 'NULL', '2015-01-01', 'Sonilyn', 'sonialynda@gmail.com', NULL, '72c70b017f4ff0dcd8850121551c02653c86f3c7c950281bfc22887c49103668', '280b8267a1f3d2c1786a50bd30ab2417841c2db4d21712deb2a7a301ce18bb85', '2020-03-04 12:38:08', 0, 0, 395, 1, ' 237673922002', 0, 0),
(308, 'NULL', 'NULL', '2015-01-01', 'Onlycorine', 'onlycorine@gmail.com', NULL, 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', '44a8a8fcac3ded6dcac366922a488b9c19785f78cc151f93828abb8c982db3d8', '2020-03-05 08:35:06', 0, 0, 398, 1, ' 237679456148', 0, 0),
(309, 'NULL', 'NULL', '2015-01-01', 'thekingken', 'boungoufayad@gmail.com', NULL, '0891bcf117b7697eb630466530a2642919a635d0ae1f607a163284f5bb34b44e', NULL, '2020-03-05 11:15:50', 0, 0, 401, 1, ' 237659142442', 0, 0),
(313, 'NULL', 'NULL', '2015-01-01', 'Mick', 'mikhaelkamdem45@gmail.com', NULL, 'af7ca349167b1df0331f89d6196e7c6d7d1b9a971d30081dbed69ae9614e83a9', '2c0fd2a2b916b30790155ef5058f118e4c6d393920d98fa8cbe0dd2cfd50bb0d', '2020-03-05 18:19:28', 13820, 0, 405, 1, ' 237691679994', 0, 0),
(314, 'NULL', 'NULL', '2015-01-01', 'Test', 'test@gmail.com', NULL, 'd6604f4af741707aaeb81a9e06f4c3fd4cc9bfecbeca20de6123a7b980d4aad2', 'fad3f3edace7df44d06d7933b4e8bbca614654a51db5707356e7c5c5aa2d5cc5', '2020-03-06 09:26:15', 0, 0, 408, 1, ' 237692934212', 0, 0),
(315, 'NULL', 'NULL', '2015-01-01', 'baba', 'ctangham@gmail.com', NULL, '0f32862e7ddde09dc75de6632e6862e19c99485f1597afe3dc4c02b3a42df269', '3f8a92a74eb0f46e382ad9d43c91276da87fdffb3363b949de3c36d1651dc9bd', '2020-03-06 18:22:08', 0, 0, 409, 1, ' 237673635706', 0, 0),
(316, 'NULL', 'NULL', '2015-01-01', 'René', 'owonarene8@gmail.com', NULL, 'd37e881736e22186ba673deeb185a7acb30947b0429c29e35dfdcdfb4edf6ece', NULL, '2020-03-07 10:58:55', 0, 0, 412, 1, ' 237695612624', 0, 0),
(317, 'NULL', 'NULL', '2015-01-01', 'linho97', 'linseynjeimejang@gmail.com', NULL, '916d52f0b7941afda2c56e8ef7b7b624aca9f624c26291d6f3188f3df7a519de', '0166bcb9f2ff80db6a4c02f2c46455d55c56844aa46b4686d185bab119527402', '2020-03-07 14:27:58', 0, 0, 413, 1, ' 237679274012', 0, 0),
(318, 'NULL', 'NULL', '2015-01-01', 'romeo97', 'sangongromeo@gmail.com', NULL, '99b0e5404dc6754fa1bcda49116475f423af3756e67cbaffb6937dd7399f7b6e', 'b29b571762a080e119bbc5b55467801dc866e7b0d1a17f6f055a4c376181d6a1', '2020-03-07 14:33:48', 0, 0, 414, 1, ' 237670365096', 0, 0),
(319, 'NULL', 'NULL', '2015-01-01', 'mendosa', 'leadermendosa@gmail.com', NULL, 'ca3c8bd2ae109f0036bc73db0b1d3ae40e60e6fe601be74a17f34eea2fa78e92', NULL, '2020-03-07 21:57:40', 0, 0, 415, 1, ' 237694627828', 0, 0),
(320, 'NULL', 'NULL', '2015-01-01', 'JohnDoe', 'elgoogclass3@gmail.com', NULL, 'bf474c2300f6450ea12a60fce0670ab7aab01f26545231580b3e6fe10e38b2bf', '7915e94cdc4b44f6c179af436601edbce79fb1e92bdcae799a95f4862eb2d4ad', '2020-03-10 19:31:28', 0, 0, 422, 1, ' 33600000000', 0, 0),
(321, 'NULL', 'NULL', '2015-01-01', 'Deco', 'comptemail4net@gmail.com', NULL, '786eda9fc975d1567206f1e6e971ab8df71ee2d14a91209535491b12806d1210', '1aa34c768dc007b4374d3b8ad33ab9c753f79f1549bdc0ab03e3ec8ca2602c62', '2020-03-15 19:33:02', 0, 0, 434, 1, ' 237698768298', 0, 0),
(322, 'NULL', 'NULL', '2015-01-01', 'justin', 'justinumble11@gmail.com', NULL, '96e1f83170c8866dd18db61f3fa693d7905a497739892e09f97ea8d958a6fa7b', '4af116be73a90547db2beb7e68e096a251b5018b8b1ef21ed83df172ec58fab8', '2020-03-16 12:02:08', 0, 0, 436, 1, ' 237653877017', 0, 0),
(323, 'NULL', 'NULL', '2015-01-01', 'Sedricksani ', 'Sedricksani@gmail.com', NULL, '76ea3d5ac9f8034ff7abaad3edb131920798b9748914e53a74782b9281818e22', NULL, '2020-03-16 13:40:32', 0, 0, 437, 1, ' 237698608545', 0, 0),
(324, 'NULL', 'NULL', '2015-01-01', 'abdou', 'electleba@gmail.com', NULL, 'fc95599b32f59b4eff4ae64aeb993d817e7e3a0f4a9f6075a47c48836a956486', NULL, '2020-03-16 22:55:46', 0, 0, 440, 1, ' 237698532692', 0, 0),
(325, 'NULL', 'NULL', '2015-01-01', 'scenario', 'fradithtest@gmail.com', NULL, '317d625760f8fb03832576890b8ef30fedc0538a06cf7ab9aa2d01851da570c7', 'efd0c32db7d98c1e1b27c79b110f83f7c4b799143f60a5bdcef0b40273e493d7', '2020-03-17 12:26:00', 0, 0, 441, 1, ' 237677126994', 0, 0),
(326, 'NULL', 'NULL', '2015-01-01', 'bat20', 'batfromparis@gmail.com', NULL, '6c51c5b3fa27d4e9c53ddfd6e752c7a202d6a123b555eb162fc36bd36b3a0347', '4860b9237af6b587faab072523efdbacc42dd24ca9ba7457e22f4e546a06877d', '2020-03-17 14:16:04', 0, 0, 442, 1, ' 33611080842', 0, 0),
(327, 'NULL', 'NULL', '2015-01-01', 'wilfred26', 'wilfredfoncha07@gmail.com', NULL, 'c468f3091165a1a3f066acd4421d36c605aacb0bd00d5ab38c78d0b04fdfaadb', '8603aaad48f6f8cd17c703d55b7cede30c482e591859b0cb991c8ac3bbda71ac', '2020-03-17 16:27:52', 0, 0, 443, 1, ' 237691257240', 0, 0),
(329, 'NULL', 'NULL', '2015-01-01', 'plumeria', 'kmaffock@gmail.com', NULL, 'f80c531daf469bf516ee5050a529690312d6c59df3c66a7a5b0bef66d058d120', '2272f1ba2a77712411929a4285c1f06db72d3965d5a347b98fea0f43a6fe3bcc', '2020-03-18 09:41:35', 6, 0, 447, 1, ' 237653232640', 0, 0),
(330, 'NULL', 'NULL', '2015-01-01', 'iAmNV', 'nguemnev@gmail.com', NULL, '22652e77e046e42b997029bc8e0b923e418b5bcff5e0ad970ad3408d98ab228c', 'ff77388ffb4b50b10cdf76d8ce82d75d89b24c72758447bd4e3689bc112daa37', '2020-03-19 09:02:34', 138, 0, 450, 1, ' 237691980189', 0, 0),
(331, 'NULL', 'NULL', '2015-01-01', 'Imperial', 'kotarocurry@gmail.com', NULL, 'd53ee95268f6b94a1c215c5e31cf256657de9c9262f946054aee7848b44f638f', '09bf69cc59e26b14a819074d86ca35fd6a775f35cb99c509124e9a58ec4da6f5', '2020-03-21 15:59:36', 0, 0, 455, 1, ' 237681935649', 0, 0),
(332, 'NULL', 'NULL', '2015-01-01', 'ej_onboard_test', 'ejaraonboardtest@gmail.com', NULL, '42ba493ac5767e8d835b60cd48e3def7147187e4faa306015b691f566a89c949', '39c9f7cac3cedc5992f74d7e69461333113f9f8ba37e68da29caaea96626e8a3', '2020-03-22 07:34:14', 0, 0, 456, 1, ' 237669113543', 0, 0),
(333, 'NULL', 'NULL', '2015-01-01', 'fabriceyopa ', 'fabrice_yopa@yahoo.fr', NULL, '97992e62717b75ad00baa8190e1927743f99950cae170135975f211f8d910a58', NULL, '2020-03-22 07:40:04', 0, 0, 457, 1, ' 237698319729', 0, 0),
(334, 'NULL', 'NULL', '2015-01-01', 'ej_trans_test', 'ejaratransacttest@gmail.com', NULL, '4bc2f2b3a444cd4d8d73c792b5c9c8ce16eeca3e922a246e3fec9a8d84e85c3f', '39c9f7cac3cedc5992f74d7e69461333113f9f8ba37e68da29caaea96626e8a3', '2020-03-22 07:46:40', 138, 0, 458, 1, ' 237678740858', 0, 0),
(335, 'NULL', 'NULL', '2015-01-01', 'ndohvich', 'ndohmoise@gmail.com', NULL, 'edf5c3e55f979801abb6ff650d056a9de99f59fd59fb1a6269a0184d46a0d070', '918408fdb68bf3f8e80ff55076a16858e2a1717872f37e92f9592233bf9b0f6d', '2020-03-23 13:48:40', 0, 0, 461, 1, ' 237695994053', 0, 0),
(337, 'NULL', 'NULL', '2015-01-01', 'junger', 'juniorchend@gmail.com', NULL, 'a4f85274c5b6448e23675f7ee035583cea64fd46e0fe8a83a27400246ea690f8', '0dd1e7520eb9ccbb6206218e45cf78ca776e36de53c1fd325f9f33605e12c8ca', '2020-03-28 11:18:28', 0, 0, 466, 1, ' 237694325555', 0, 0),
(338, 'NULL', 'NULL', '2015-01-01', 'illona', 'moumieillona@gmail.com', NULL, 'fbe08ac2b092974b3df44ff3a712c2ce0c5e04b95994f30e20aafb2743eca5ef', '3a8abbc8411cbe419e8ddd7645f4ec669991c26a90e79727d0ba45708b34ec01', '2020-03-29 11:20:36', 192, 0, 469, 1, ' 237675734346', 0, 0),
(339, 'NULL', 'NULL', '2015-01-01', 'Mrzamalol', 'nicolas.sharpin@outlook.fr', NULL, '1db33632fad59303b057c3faeab93ea64115f3cb430063a12128a1b26f290f55', '9e2b2df3b386cb2301f34662c490f30dd0c79d97ed847aa765d13fb63aa72b10', '2020-04-01 13:26:21', 0, 0, 475, 1, ' 237653796665', 0, 0),
(340, 'NULL', 'NULL', '2015-01-01', 'Thezamalol', 'sharpin8christine@outlook.fr', NULL, '1db33632fad59303b057c3faeab93ea64115f3cb430063a12128a1b26f290f55', '9d7cd58c41568304c7c12604fb05e5ae021b1c9f1bb99dd0d6c5aa3ea8bc31f8', '2020-04-02 09:16:32', 0, 0, 477, 1, ' 22577382230', 0, 0),
(341, 'NULL', 'NULL', '2015-01-01', 'claro81', 'talla_carine@hotmail.com', NULL, 'cf272d2f1ac4d3c088519f7f8158d45c0791096b01e0a07865a6ca30d032ffb6', 'a4da75d2970f32a0c5f23c0cbd66ac80f3fbf284a66b2a85a01927ce81e3517a', '2020-04-03 18:35:07', 0, 0, 479, 1, ' 237677355587', 0, 0),
(342, 'Pierre ', 'Ayomo ', '1991-03-23', 'YaPima', 'pierreayomo@gmail.com', NULL, 'c2999eaae36d16b242d37bccff8deec1ec1da135916254afe063157c6088695d', '81d315bb2c7fee72d8b0b28d4f22f2788393a5a9b6abaa781dcd9896005c159f', '2020-04-03 23:11:07', 0, 0, 480, 1, ' 237694670515', 0, 0),
(343, 'NULL', 'NULL', '2015-01-01', 'roos', 'roouseveltedelano@gmail.com', NULL, 'f065db4fc62ab7feb099e8fba67aac5f7906439c4c9256c70fe1cb1454d97c22', '18ec130a78facb219cae707656dfa877a6b70b5c90785ed44ec0b65dece2cb8c', '2020-04-03 23:29:05', 0, 0, 481, 1, ' 237698127373', 0, 0),
(344, 'NULL', 'NULL', '2015-01-01', 'abbudy 1', 'abdel9133@gmail.com', NULL, '0a968982428c5df2ba0647ca4b2c6eb5d8b5553eb4be6390ad5dbd4336bb9400', NULL, '2020-04-04 05:41:24', 0, 0, 482, 1, ' 237650676091', 0, 0),
(345, 'NULL', 'NULL', '2015-01-01', 'Mika', 'akonoevy@gmail.com', NULL, 'd59f56fb0f4e616af7708df84da9767c0b0a7f5704f3460e490df1af636e2bb1', '77d621368680a992c2ef0e870ba75142b503b774f13a95bd7728036a720766f6', '2020-04-04 08:18:23', 0, 0, 484, 1, ' 237680532248', 0, 0),
(346, 'NULL', 'NULL', '2015-01-01', 'Faucheur', 'faucheurb@gmail.com', NULL, 'a40a514971bf9483b82d524cfe169b2f34e9523a62034afe452047f19f58db79', '696629b664e258de4e09e934dd8afdf49549221b7ef8594bcc6a67dd7231ea9b', '2020-04-04 10:05:57', 0, 0, 485, 1, ' 237696370260', 0, 0),
(347, 'NULL', 'NULL', '2015-01-01', 'frankky', 'franksoumou12@gmail.com', NULL, 'cb7ea40557e312337c8f8db1ab6e8ed131b030a139c72490f4f1fd44c4b60949', 'd12648de6aac4d0b746090696fd58cf851d3a1fd61a429e40959cdb488f1268c', '2020-04-04 10:17:26', 0, 0, 486, 1, ' 237655002170', 0, 0),
(348, 'NULL', 'NULL', '2015-01-01', 'moussasso', 'mathieumoussa23@gmail.com', NULL, '6c41ed3ca141ab62ca01cfdf45e991fa1b06bddf848766b34b70a2daff4541eb', '5a37607a1e39ce0e0f3c9f1000c44b1ebdef5a6e589423326470a5ac17cbe845', '2020-04-04 12:28:17', 0, 0, 487, 1, ' 237655522039', 0, 0),
(349, 'NULL', 'NULL', '2015-01-01', 'chi', 'mikeboychi@gmail.com', NULL, 'c6985dbd9e0fdf3da51196da38b281065845823adf6a5d89f89cf4ff3d01a97c', 'f169b2a08eddf73727ac5888d5d58b495bb5ab5835ab01ad8990d35c3915f987', '2020-04-06 06:37:21', 0, 0, 488, 1, ' 237651890022', 0, 0),
(350, 'NULL', 'NULL', '2015-01-01', 'unike', 'unike237@gmail.com', NULL, '77c6d3272252a93d89ba0c25a038ebbedd39f6544688e48f4b2dfbfb27963180', NULL, '2020-04-06 22:23:05', 0, 0, 489, 1, ' 237694850018', 0, 0),
(351, 'NULL', 'NULL', '2015-01-01', 'plasticperson26', 'edgarvaas@gmail.com', NULL, 'fad36eb54215ce1ebbc44f76ec05e8aa0dc8f40175ff2528c7e3fd1a302f3541', 'ee8350ae11fa83bf7946a0a5e42989aa8a808adb4440b5b6a3da493c19ccc12f', '2020-04-07 09:19:21', 0, 0, 490, 1, ' 237671689694', 0, 0),
(352, 'NULL', 'NULL', '2015-01-01', 'Borel', 'landreau20@yahoo.fr', NULL, '65954a20fd6a9259ef594e93fd32719325e6b6fef22ab992ae33b641e2db4df1', '405d86596d86f5c79d8ad732591271285284ea43e04b0cd384bf37ba9c3cf896', '2020-04-08 18:48:59', 0, 0, 491, 1, ' 237678729649', 0, 0),
(353, 'NULL', 'NULL', '2015-01-01', 'Yann Mbouche ', 'mboucheyann@gmail.com', NULL, '21393cf8d955bf8e7bd64e2fbcb39f86620eb4c63c3107d77b3a35008f589f55', NULL, '2020-04-10 12:58:40', 0, 0, 492, 1, ' 237694947108', 0, 0),
(354, 'NULL', 'NULL', '2015-01-01', 'christianxavier', 'christiancity90@gmail.com', NULL, '80c01aa24e2ac60cfd4f4724fc9ed7b36811ae8dff38d75cf461f526860989a5', '5ff64ccccde714c3e939f005e1716530a132d399e657a93fcb3827e0ce160fba', '2020-04-10 21:00:10', 0, 0, 493, 1, ' 237696546198', 0, 0),
(355, 'NULL', 'NULL', '2015-01-01', 'toothypuma', 'normantchandja@gmail.com', NULL, '6680783f18e5c90248f903bf25cbfa3c9eed5cf9d880fd349f3f72c70f2f599c', '8df6228d1f83db95929a4c61ce347fb6c65875c57a87d5fb02efa33d114ed913', '2020-04-14 11:41:53', 0, 0, 494, 1, ' 237696528881', 0, 0),
(356, 'NULL', 'NULL', '2015-01-01', 'lamaf ', 'mafelmarabiyocho@gmail.com', NULL, '42ce365a51947448c82387e99d7f3c9a5d27b3bd00a188138ec567b624d01ea1', NULL, '2020-04-15 07:59:52', 0, 0, 495, 1, ' 237655875898', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `orderbook`
--

CREATE TABLE `orderbook` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ordertype_id` int(11) DEFAULT NULL,
  `offerassettypeid` int(11) DEFAULT NULL,
  `wantassettypeid` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `orderstatus_id` int(11) DEFAULT NULL,
  `expirationdate` datetime DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `orderstatus_id` int(11) NOT NULL,
  `orderstatus_name` varchar(255) NOT NULL,
  `Isactive` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orderstatushistory`
--

CREATE TABLE `orderstatushistory` (
  `orderstatushistory_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `orderstatus_id` int(11) NOT NULL,
  `statusupdatedby` varchar(45) DEFAULT NULL,
  `updatedate` datetime NOT NULL,
  `creationdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ordertype`
--

CREATE TABLE `ordertype` (
  `ordertype_id` int(11) NOT NULL,
  `ordertype_name` varchar(45) NOT NULL,
  `ordertype_desc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `partners`
--

CREATE TABLE `partners` (
  `partners_id` int(11) NOT NULL,
  `partnerstype_id` int(11) NOT NULL,
  `partners_name` varchar(45) NOT NULL,
  `partners_details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `partnerstype`
--

CREATE TABLE `partnerstype` (
  `partnerstype_id` int(11) NOT NULL,
  `partnerstype_lib` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `partners_branches`
--

CREATE TABLE `partners_branches` (
  `branch_id` int(11) NOT NULL,
  `partners_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `branch_type_code` int(11) DEFAULT NULL,
  `branch_details` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ref_branch_types`
--

CREATE TABLE `ref_branch_types` (
  `branch_type_code` int(11) NOT NULL,
  `branch_type_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `session_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `sessionduration` datetime DEFAULT NULL,
  `accessallowed` int(1) NOT NULL,
  `accountlock` int(1) DEFAULT NULL,
  `connectiontry` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `A_orderid` int(11) NOT NULL,
  `A_amount` float NOT NULL,
  `A_commission` float NOT NULL,
  `transaction_date` datetime NOT NULL,
  `B_amount` float NOT NULL,
  `B_commission` float NOT NULL,
  `B_orderid` int(11) DEFAULT NULL,
  `wallettype_id` int(11) DEFAULT NULL,
  `A_walletid` int(11) NOT NULL,
  `B_walletid` int(11) DEFAULT NULL,
  `namereceiver` varchar(255) DEFAULT NULL,
  `receiveaddress` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `fees` float NOT NULL,
  `transaction_note` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `A_orderid`, `A_amount`, `A_commission`, `transaction_date`, `B_amount`, `B_commission`, `B_orderid`, `wallettype_id`, `A_walletid`, `B_walletid`, `namereceiver`, `receiveaddress`, `phonenumber`, `fees`, `transaction_note`) VALUES
(126, 259, 1000000, 0, '2020-02-23 15:39:56', 0, 0, 264, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(127, 259, 2000000, 0, '2020-02-23 21:05:26', 0, 0, 260, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(128, 259, 1500000, 0, '2020-02-23 21:07:17', 0, 0, 260, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(129, 257, 7000000, 0, '2020-02-23 21:15:30', 0, 0, 259, 3, 300, 301, NULL, NULL, NULL, 0, 'mXTZ'),
(130, 257, 1000000, 0, '2020-02-23 21:16:53', 0, 0, 259, 3, 300, 301, NULL, NULL, NULL, 0, 'mXTZ'),
(131, 257, 4000000, 0, '2020-02-24 11:27:27', 0, 0, 259, 3, 300, 301, NULL, NULL, NULL, 0, 'mXTZ'),
(132, 257, 4806490, 0, '2020-02-26 07:15:05', 0, 0, 259, 3, 300, 301, NULL, NULL, NULL, 0, 'mXTZ'),
(133, 259, 686213, 0, '2020-02-26 07:17:42', 0, 0, 260, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(134, 259, 100000, 0, '2020-03-02 16:02:58', 0, 0, 303, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(135, 259, 121580, 0, '2020-03-02 16:25:46', 0, 0, 303, 3, 304, 305, NULL, NULL, NULL, 0, 'mXTZ'),
(136, 253, 1221750, 0, '2020-03-03 11:09:52', 0, 0, 304, 3, 292, 293, NULL, NULL, NULL, 0, 'mXTZ'),
(137, 253, 1218770, 0, '2020-03-03 12:46:19', 0, 0, 304, 3, 292, 293, NULL, NULL, NULL, 0, 'mXTZ'),
(138, 279, 12087900, 0, '2020-03-03 13:34:56', 0, 0, 304, 3, 344, 345, NULL, NULL, NULL, 0, 'mXTZ'),
(139, 289, 869432, 0, '2020-03-03 13:37:20', 0, 0, 304, 3, 367, 368, NULL, NULL, NULL, 0, 'mXTZ'),
(140, 301, 1083380, 0, '2020-03-03 13:38:42', 0, 0, 304, 3, 393, 394, NULL, NULL, NULL, 0, 'mXTZ'),
(141, 303, 200000, 0, '2020-03-03 13:51:21', 0, 0, 304, 3, 404, 405, NULL, NULL, NULL, 0, 'mXTZ'),
(142, 279, 10470000, 0, '2020-03-03 19:38:28', 0, 0, 304, 3, 344, 347, NULL, NULL, NULL, 0, 'mXTZ'),
(143, 279, 1120000, 0, '2020-03-03 21:28:26', 0, 0, 304, 3, 344, 347, NULL, NULL, NULL, 0, 'mXTZ'),
(144, 313, 1000, 0, '2020-03-10 23:15:33', 0, 0, NULL, 1, 427, NULL, 'External', '1DXSPZiRttQtZWjEvBcbxP2SPNgDhGo8Xv', 'null', 0, 'Satoshi'),
(145, 313, 1000, 0, '2020-03-10 23:15:45', 0, 0, NULL, 1, 427, NULL, 'External', '1DXSPZiRttQtZWjEvBcbxP2SPNgDhGo8Xv', 'null', 0, 'Satoshi'),
(146, 313, 1000, 0, '2020-03-10 23:50:30', 0, 0, NULL, 1, 427, NULL, 'External', '1DXSPZiRttQtZWjEvBcbxP2SPNgDhGo8Xv', 'null', 0, 'Satoshi'),
(147, 313, 10000, 0, '2020-03-11 00:05:52', 0, 0, NULL, 3, 427, NULL, 'External', 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 'null', 0, 'mXTZ'),
(148, 280, 104897, 0, '2020-03-14 10:06:41', 0, 0, NULL, 1, 348, NULL, 'External', '1BXNAth3Lg1b2noGW79BME2qqRKZP6uLYV', 'null', 0, 'Satoshi'),
(149, 253, 1200000, 0, '2020-03-14 17:14:24', 0, 0, NULL, 3, 292, NULL, 'External', 'tz1Rgj2vLYa4siBoTTMxCDQsqZ8WF1cakmkb', 'null', 0, 'mXTZ'),
(150, 260, 22500000, 0, '2020-03-15 13:53:30', 0, 0, 304, 3, 306, 307, NULL, NULL, NULL, 0, 'mXTZ'),
(151, 257, 22500000, 0, '2020-03-15 16:18:53', 0, 0, 304, 3, 300, 301, NULL, NULL, NULL, 0, 'mXTZ'),
(152, 304, 20000000, 0, '2020-03-19 18:15:16', 0, 0, NULL, 3, 409, NULL, 'External', 'tz1Rgj2vLYa4siBoTTMxCDQsqZ8WF1cakmkb', 'null', 0, 'mXTZ'),
(153, 303, 6000000, 0, '2020-03-20 20:15:12', 0, 0, NULL, 3, 404, NULL, 'External', 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 'null', 0, 'mXTZ'),
(154, 304, 3000000, 0, '2020-03-20 21:01:33', 0, 0, 313, 3, 409, 410, NULL, NULL, NULL, 0, 'mXTZ'),
(155, 304, 2000000, 0, '2020-03-20 21:02:28', 0, 0, 313, 3, 409, 410, NULL, NULL, NULL, 0, 'mXTZ'),
(156, 304, 500000, 0, '2020-03-23 09:21:26', 0, 0, 334, 3, 479, 480, NULL, NULL, NULL, 0, 'mXTZ'),
(157, 334, 1202000, 0, '2020-03-23 09:25:32', 0, 0, NULL, 3, 479, NULL, 'External', 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 'null', 0, 'mXTZ'),
(158, 304, 1000000, 0, '2020-03-23 09:27:30', 0, 0, 334, 3, 479, 480, NULL, NULL, NULL, 0, 'mXTZ'),
(159, 334, 50000, 0, '2020-03-23 09:34:09', 0, 0, NULL, 3, 479, NULL, 'External', 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', 'null', 0, 'mXTZ'),
(160, 329, 44562300, 0, '2020-03-24 10:33:02', 0, 0, NULL, 3, 469, NULL, 'External', 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', 'null', 0, 'mXTZ'),
(161, 329, 44512200, 0, '2020-03-24 11:07:33', 0, 0, NULL, 3, 469, NULL, 'External', 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', 'null', 0, 'mXTZ'),
(162, 329, 44461900, 0, '2020-03-24 11:32:19', 0, 0, NULL, 3, 469, NULL, 'External', 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', 'null', 0, 'mXTZ'),
(163, 329, 44020000, 0, '2020-03-24 11:41:31', 0, 0, NULL, 3, 469, NULL, 'External', 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', 'null', 0, 'mXTZ'),
(164, 336, 700000, 0, '2020-03-24 17:13:13', 0, 0, NULL, 1, 483, NULL, 'External', '1AxwLeXuyikogo1yt9T2N3oDNMc2tfHAuR', 'null', 0, 'Satoshi'),
(165, 336, 720000, 0, '2020-03-25 16:08:54', 0, 0, NULL, 1, 483, NULL, 'External', '1ArA4SEdMB6dHwLxCku4cHg6U6AAgAoVDG', 'null', 0, 'Satoshi'),
(166, 336, 1916000, 0, '2020-03-30 18:48:25', 0, 0, NULL, 1, 483, NULL, 'External', '1PhSekCzKWh7pHScbiy8Wke2c42hJgDMZa', 'null', 0, 'Satoshi'),
(167, 336, 1916000, 0, '2020-03-30 18:48:28', 0, 0, NULL, 1, 483, NULL, 'External', '1PhSekCzKWh7pHScbiy8Wke2c42hJgDMZa', 'null', 0, 'Satoshi'),
(168, 338, 479999, 0, '2020-03-30 20:37:56', 0, 0, NULL, 1, 487, NULL, 'External', '1PZ7eZb41AoHYANPRF2ABT2DfkaXzFk5PG', 'null', 0, 'Satoshi'),
(169, 338, 497030, 0, '2020-04-01 13:39:06', 0, 0, NULL, 1, 487, NULL, 'External', '13TK7tALmJtFuFbCKcCZL48ReYvh5bsSx8', 'null', 0, 'Satoshi'),
(173, 313, 1000000, 0, '2020-04-06 12:26:50', 0, 0, NULL, 3, 427, NULL, 'External', 'tz1PhpWz6HMhuNNqc22PEyuue44LfTYkpN8H', 'null', 20000, 'test'),
(174, 313, 6780000, 0, '2020-04-06 12:53:58', 0, 0, NULL, 3, 427, NULL, 'External', 'tz1PhpWz6HMhuNNqc22PEyuue44LfTYkpN8H', 'null', 20000, 'test'),
(175, 313, 6700000, 0, '2020-04-06 12:55:15', 0, 0, NULL, 3, 427, NULL, 'External', 'tz1PhpWz6HMhuNNqc22PEyuue44LfTYkpN8H', 'null', 20000, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `transactions_type`
--

CREATE TABLE `transactions_type` (
  `transaction_type_id` int(11) NOT NULL,
  `transaction_type_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(11) NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance` decimal(10,0) DEFAULT '0',
  `wallet_date_creation` timestamp NULL DEFAULT NULL,
  `wallet_update_time` timestamp NULL DEFAULT NULL,
  `wallet_status_code` int(11) NOT NULL,
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `public_key_hash` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'public_key_hash : Tezos; ReceiveAddress : Bitcoin',
  `seed` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'Seed : Tezos ; Mnemonic : Bitcoin',
  `currency_code` varchar(3) DEFAULT NULL,
  `frozenbalance` decimal(10,0) DEFAULT NULL,
  `StateKey` int(11) NOT NULL DEFAULT '0' COMMENT '0 : Not generated; 1 : Generated and not backup; 2 : Generated and backup'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wallet`
--

INSERT INTO `wallet` (`wallet_id`, `wallettype_id`, `customer_id`, `balance`, `wallet_date_creation`, `wallet_update_time`, `wallet_status_code`, `public_key`, `private_key`, `public_key_hash`, `seed`, `currency_code`, `frozenbalance`, `StateKey`) VALUES
(297, 3, 255, '0', '2020-02-21 17:44:36', '2020-02-21 17:44:36', 1, 'edpkvYrPhjNP1AqjbWDa5s3tFW2RqmsGjoj1XHkRX6s8zWgC5FECrR', NULL, 'tz1dbv1pXd263hUhjzn2oMRLQRTxn5FYjYns', NULL, '1', '1', 0),
(296, 1, 255, '0', '2020-02-21 17:44:15', '2020-02-21 17:44:15', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(295, 3, 254, '0', '2020-02-21 17:33:02', '2020-02-21 17:33:02', 1, 'edpku6UuudHiUyoPFp3Ws8bQTwLRdd7Y2BMUCXY5e1wxwj1v13o9Ta', NULL, 'tz1ZxECmVNoZuzmLUgCwsaGk7uV5aNvaJon2', NULL, '1', '1', 0),
(294, 1, 254, '0', '2020-02-21 17:32:57', '2020-02-21 17:32:57', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(292, 1, 253, '0', '2020-02-21 16:06:06', '2020-02-21 16:06:06', 1, NULL, NULL, '1EDodFHxxjrgLVLjTicKLywPGxPauLciqR', NULL, '1', '1', 0),
(293, 3, 253, '0', '2020-02-21 16:06:11', '2020-02-21 16:06:11', 1, 'edpkuVX8HHcod9CUCEbzY1nXS4Fcdo12PCRhH67A1nU3fYkKLTdPif', NULL, 'tz1RZqdJxusQTeqq72e6RanS3LicUiSDJG5i', NULL, '1', '1', 0),
(298, 1, 256, '0', '2020-02-21 17:49:18', '2020-02-21 17:49:18', 1, NULL, NULL, '1DVXX1yfKxRTYUDr1oGZqaEwNXpmhxiQ9s', NULL, '1', '1', 0),
(299, 3, 256, '0', '2020-02-21 17:49:31', '2020-02-21 17:49:31', 1, 'edpkvSD91ydRRpmX3ZVcySbmPYjdwTiJJfXfnXEXk3xG67k4j91RVR', NULL, 'tz1UeXwjFeioS6dFoT8MvEBP5X9Fsjdxam3K', NULL, '1', '1', 0),
(300, 1, 257, '0', '2020-02-21 19:43:06', '2020-02-21 19:43:06', 1, NULL, NULL, '1BgHSTtu44KyxFNYFM8mu2bzU9E8Qz16wg', NULL, '1', '1', 0),
(301, 3, 257, '0', '2020-02-21 19:43:22', '2020-02-21 19:43:22', 1, 'edpkuqvEPQF5L5j37qSMH4gycTP3QggB4bkYM2v1iZQPEaLiMHhpQt', NULL, 'tz1hhva1aim2hZFsQzQDX3TVzSqZep7QcwqQ', NULL, '1', '1', 0),
(304, 1, 259, '0', '2020-02-21 21:32:20', '2020-02-21 21:32:20', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(305, 3, 259, '0', '2020-02-21 21:32:24', '2020-02-21 21:32:24', 1, 'edpktix1cCm1HAAgnTyxSpxzhuHhq4MiDuDbJET9w1Dmk7KWcrVJuv', NULL, NULL, NULL, '1', '1', 0),
(415, 1, 307, '0', '2020-03-04 12:38:08', '2020-03-04 12:38:08', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(306, 1, 260, '0', '2020-02-22 11:14:31', '2020-02-22 11:14:31', 1, NULL, NULL, '19N4gGCVek5SRjmtqWiGb6g31osRJuCwEd', NULL, '1', '1', 0),
(307, 3, 260, '0', '2020-02-22 11:14:45', '2020-02-22 11:14:45', 1, 'edpkuh36Fi54HLTdhtab574gB84nRuspThLKUaKHuhdkH6EJVwikgV', NULL, 'tz1UasU7YCX9P42wDskmwMp9bEet3jgzTSJ1', NULL, '1', '1', 0),
(308, 1, 261, '0', '2020-02-22 11:40:32', '2020-02-22 11:40:32', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(309, 3, 261, '0', '2020-02-22 11:40:42', '2020-02-22 11:40:42', 1, 'edpktoxAU8vb53LmwZvedbJbiweTLWDuawW4GTzLR6pyAhe8J2mnYf', NULL, 'tz1WUmzoiCxS8HTW5iPj4155StRGEuvbQ9w3', NULL, '1', '1', 0),
(310, 3, 261, '0', '2020-02-22 11:47:58', '2020-02-22 11:47:58', 1, 'edpkv97oMEzZgC7FS1HLoaZnL24pV4wN9LbXNHtRiMZekxSX33tcEn', NULL, 'tz1XGvPrsBYm8tZw54mS9LEyqWBjCXTyg5QJ', NULL, '1', '1', 0),
(311, 1, 262, '0', '2020-02-22 12:47:59', '2020-02-22 12:47:59', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(312, 3, 262, '0', '2020-02-22 12:48:07', '2020-02-22 12:48:07', 1, 'edpkvHHspaQpyT7xRwigkFP2boMDbYjRQ9Amd4xp4TVkvKp3T3b7K7', NULL, 'tz1LuejkKekRa6RMEpr96pLYi9AscB9eLY5d', NULL, '1', '1', 0),
(313, 1, 263, '0', '2020-02-22 17:26:36', '2020-02-22 17:26:36', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(314, 3, 263, '0', '2020-02-22 17:26:51', '2020-02-22 17:26:51', 1, 'edpkvEk3iwXDzFFjvMK1NNdaC2FN7qT79ttzNg9H9EqnoJ9Rh1YZYJ', NULL, 'tz1V1Btf79VzWignrHU5F5YoFM8g5BqEDqSP', NULL, '1', '1', 0),
(315, 1, 264, '0', '2020-02-23 12:01:28', '2020-02-23 12:01:28', 1, NULL, NULL, '17q5vzcmErVns4shoxayn2QpQMgcR1CLii', NULL, '1', '1', 0),
(316, 3, 264, '0', '2020-02-23 12:01:38', '2020-02-23 12:01:38', 1, 'edpkutHGjkiHsKTmUt8Wvtyb2Xsjg7c7bPntTXgMa5Lq9XmyAi3izR', NULL, 'tz1TKUkj6LGPo2rDxVUy41MXPiV1trshLDCi', NULL, '1', '1', 0),
(317, 1, 265, '0', '2020-02-23 16:06:04', '2020-02-23 16:06:04', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(318, 3, 265, '0', '2020-02-23 16:06:24', '2020-02-23 16:06:24', 1, 'edpkvAVaFSR7C8rbJWG6yinbpsiyJFHbvxKfBuKJdYdWomqDEBjQ26', NULL, 'tz1aN22aa3hHLzLLYF6qBUtvLkxvKEVZWQ8T', NULL, '1', '1', 0),
(319, 1, 266, '0', '2020-02-23 18:41:04', '2020-02-23 18:41:04', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(320, 3, 266, '0', '2020-02-23 18:41:11', '2020-02-23 18:41:11', 1, 'edpkurJK252P5DeZvtcViWgrQMnDgSmuKUK5bh4k46PSHWnk4YA6c7', NULL, 'tz1fyh8REmSnaSQ626mi7akcoxUX6JRY21vE', NULL, '1', '1', 0),
(321, 1, 267, '0', '2020-02-24 09:09:29', '2020-02-24 09:09:29', 1, NULL, NULL, '15aJHsYPiPTMxgD6vSF356YHi5Gp2YXva4', NULL, '1', '1', 0),
(322, 3, 267, '0', '2020-02-24 09:09:41', '2020-02-24 09:09:41', 1, 'edpkvVF57kG9rYtV7g7sXKsEFy5xUgPZwKbBGkz5zTAfk6dnVsdr39', NULL, 'tz1LGCe2mFGJKqwnWV3BsMQTKMGYSWm8LPdQ', NULL, '1', '1', 0),
(323, 1, 268, '0', '2020-02-24 11:41:19', '2020-02-24 11:41:19', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(324, 3, 268, '0', '2020-02-24 11:41:28', '2020-02-24 11:41:28', 1, 'edpkttUM5KfKAeMB1VAZaTTAWLwS1zKHy9cfp2hGkcAyh5XXy41PJu', NULL, 'tz1hXyUvdiyoqh9jd258vSCgvEqXEyv4hP5s', NULL, '1', '1', 0),
(325, 1, 269, '0', '2020-02-25 14:46:01', '2020-02-25 14:46:01', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(326, 3, 269, '0', '2020-02-25 14:46:09', '2020-02-25 14:46:09', 1, 'edpkujJ67N3gaNapUa3Ms3bbruvzoTV8SaUn2B8hcFS3Q3y95N63r1', NULL, 'tz1bwAbT6SSH3qxPPuJmgYjVTyUx97eVoczk', NULL, '1', '1', 0),
(327, 1, 270, '0', '2020-02-25 15:50:55', '2020-02-25 15:50:55', 1, NULL, NULL, '16iyLXSKYzuxRsgLwv5GhMDShUCi7oh3b1', NULL, '1', '1', 0),
(328, 3, 270, '0', '2020-02-25 15:51:04', '2020-02-25 15:51:04', 1, 'edpkvQ2vJitzLrxLaPRpmXUbuoopTm2zRnxpeL8KeYGQD1og8LhgEm', NULL, 'tz1Q4M5dW4otdn5QCNhr6usucuK1Xpv3Kh3b', NULL, '1', '1', 0),
(329, 1, 271, '0', '2020-02-25 17:49:08', '2020-02-25 17:49:08', 1, NULL, NULL, '1PfRcqLUAXBRqWqf2oYpZbTaNqnSawEeEH', NULL, '1', '1', 0),
(330, 3, 271, '0', '2020-02-25 17:49:24', '2020-02-25 17:49:24', 1, 'edpkuhb8MZUoXwtz6E1A2avnmv8TVKrS88AQcM8zxszihNn6VzkecV', NULL, 'tz1SJNDgRPt8Etr1rzyj6fzrYay7WwbZMmjW', NULL, '1', '1', 0),
(332, 1, 273, '0', '2020-02-26 07:28:10', '2020-02-26 07:28:10', 1, NULL, NULL, '1E17VXtbg4ecFpvhMfggNVuCD1yo7wjMTd', NULL, '1', '1', 0),
(333, 3, 273, '0', '2020-02-26 07:28:16', '2020-02-26 07:28:16', 1, 'edpkuSWvHeU6vgTSRv3DXBfu56et3edJkEEubA6hfzXoVHC8QKv7eT', NULL, 'tz1MastU2G5scXAFs4RS6Mi56sgJnGyWAFhV', NULL, '1', '1', 0),
(334, 1, 274, '0', '2020-02-27 16:06:40', '2020-02-27 16:06:40', 1, NULL, NULL, '1DAFJJPAgjsz5EsGeKAtAd28bXdPSvBwV4', NULL, '1', '1', 0),
(335, 3, 274, '0', '2020-02-27 16:06:57', '2020-02-27 16:06:57', 1, 'edpkuei1z31ME67xJ5hJvUgJqYtmd9Kj4FV8xmGGANTyNq5utNyfnJ', NULL, 'tz1Z3njZL71xc6VCVFN8PR3T4ftuQXGg99HT', NULL, '1', '1', 0),
(336, 1, 275, '0', '2020-02-27 17:32:29', '2020-02-27 17:32:29', 1, NULL, NULL, '1FcxJvu1GmRdf8cV9ChjePy41W4cPpdu4D', NULL, '1', '1', 0),
(337, 3, 275, '0', '2020-02-27 17:32:38', '2020-02-27 17:32:38', 1, 'edpku6GYtgKNGf8eSw95QWMaVcqx1XuHHn3X5uK4BdJRGNjtfiSxmA', NULL, 'tz1WtuDna8BsNskAs4Qy87uEdknNCrvGfaNo', NULL, '1', '1', 0),
(338, 1, 276, '0', '2020-02-27 17:57:23', '2020-02-27 17:57:23', 1, NULL, NULL, '1PzAP5ChwbkzvqtJnHbU4vXc56Gz7H4H2X', NULL, '1', '1', 0),
(339, 3, 276, '0', '2020-02-27 17:57:29', '2020-02-27 17:57:29', 1, 'edpkuKAz8GBSgE2SW7WwFQhi6fscQEkhQ9EnJ6W6p5espb4a7rp1uU', NULL, 'tz1XWK35ft4tpoQV9iCmQAVWucQJqNG2Yqhf', NULL, '1', '1', 0),
(340, 1, 277, '0', '2020-02-27 18:08:29', '2020-02-27 18:08:29', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(341, 3, 277, '0', '2020-02-27 18:08:48', '2020-02-27 18:08:48', 1, 'edpkunnfvzANcVvgGnsrcXAw5kcgr4zFCYp3mVSCau5m6JdSEnxHAX', NULL, 'tz1WftrRGfM2AKK6G29AsRpigB4LqwcL4ZWw', NULL, '1', '1', 0),
(342, 1, 278, '0', '2020-02-27 18:23:05', '2020-02-27 18:23:05', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(343, 3, 278, '0', '2020-02-27 18:23:17', '2020-02-27 18:23:17', 1, 'edpkvPksqeXf9hWX31Fb4kfJkSyJxPSn5YM959eSZ3U4nqYDGHCaTN', NULL, 'tz1KsS1RAA8qzYMqyhCCeNAowVN2CHehjCpg', NULL, '1', '1', 0),
(344, 1, 279, '0', '2020-02-27 18:29:29', '2020-02-27 18:29:29', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(414, 3, 306, '0', '2020-03-04 09:59:36', '2020-03-04 09:59:36', 1, 'edpkvLhBoYFibiYDAUB7aaWKfm2bgX2Quy2HGbSCzbPRhBvXf9ChwB', NULL, 'tz1UqKvuoysjcy3psqnotzryVHsiHbKEo4T4', NULL, '1', '1', 0),
(413, 1, 306, '0', '2020-03-04 09:59:20', '2020-03-04 09:59:20', 1, NULL, NULL, '18Vps2frYx1DMRT7sDFnAjAYkcjNESNTi8', NULL, '1', '1', 0),
(347, 3, 279, '0', '2020-02-27 18:32:16', '2020-02-27 18:32:16', 1, 'edpkukrGKk87doeqdcTpL4gvpkkCy2QiYjLh3RTTf9EHrP84MaAGW2', NULL, 'tz1RPBJ8F62QcmRuhJB4nnmZAHhUdkCU2Fr5', NULL, '1', '1', 0),
(348, 1, 280, '0', '2020-02-27 19:53:55', '2020-02-27 19:53:55', 1, NULL, NULL, '171PaV281AUsUNuoUVZGgcj8nMpS9wuA58', NULL, '1', '1', 0),
(349, 3, 280, '0', '2020-02-27 19:54:02', '2020-02-27 19:54:02', 1, 'edpkuikTCpCTPy1VdzSNnnoo9fAhbm5t9dd6L8wHEVaX7FHaCrqztY', NULL, 'tz1V9XTT54XNkjU8L5HCNYgQRoYXjJUN8XBQ', NULL, '1', '1', 0),
(350, 1, 281, '0', '2020-02-27 21:03:25', '2020-02-27 21:03:25', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(351, 3, 281, '0', '2020-02-27 21:03:41', '2020-02-27 21:03:41', 1, 'edpkthqPBhhGUvM4hY1Wv45LYdb4jRyduV1LLkviBGbH9bco8T9VMS', NULL, 'tz1MXHGvPx7rauK4juSjTzoxuMj97q2ukR9p', NULL, '1', '1', 0),
(352, 1, 282, '0', '2020-02-28 09:01:32', '2020-02-28 09:01:32', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(353, 3, 282, '0', '2020-02-28 09:01:42', '2020-02-28 09:01:42', 1, 'edpktt8p8JqKrPWVQgTmEMndrk4U9Grz31RMyWhfjME4eEA4gCSSRA', NULL, 'tz1ZapzgMou2r5NoRcvdf4QrRMffyCWmWYwT', NULL, '1', '1', 0),
(354, 1, 283, '0', '2020-02-28 10:16:07', '2020-02-28 10:16:07', 1, NULL, NULL, '1KXndFgHj8DbpgcudrxJxTfqddFXvyaX7', NULL, '1', '1', 0),
(355, 3, 283, '0', '2020-02-28 10:16:35', '2020-02-28 10:16:35', 1, 'edpkvN4JeYaDyV8wQz1dsywRdcToCqAsAfTgaiV2FBtYSP5hqnPhei', NULL, 'tz1fMwDsUJKe7wfCrRdidQppiDsh6GWBbSwE', NULL, '1', '1', 0),
(356, 1, 284, '0', '2020-02-28 10:51:10', '2020-02-28 10:51:10', 1, NULL, NULL, '13qrmRzrYQum22znZAWSeHGZwLR5XXcxco', NULL, '1', '1', 0),
(357, 3, 284, '0', '2020-02-28 10:51:20', '2020-02-28 10:51:20', 1, 'edpkv79m4b4Nt4ydcGh96LLNKorJTJLMwJe5jzYYFzDaMGkMQDfbWg', NULL, 'tz1foPorCrVzLGqvYrU2Px2bji2nKVUQTSDj', NULL, '1', '1', 0),
(358, 1, 285, '0', '2020-02-28 15:19:02', '2020-02-28 15:19:02', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(359, 3, 285, '0', '2020-02-28 15:19:11', '2020-02-28 15:19:11', 1, 'edpkv3ocMZqZnC4Gr3o722KGNGXgcKCPTSu4durYJSAam5HZDVMJ6X', NULL, 'tz1VVYYGrxJ14WiN3Xne8uhuDKfDetxbnX4i', NULL, '1', '1', 0),
(360, 1, 286, '0', '2020-02-28 16:12:24', '2020-02-28 16:12:24', 1, NULL, NULL, '1BCkh4qhcE6S6yvppfeEAvXCw83dxL25oN', NULL, '1', '1', 0),
(361, 3, 286, '0', '2020-02-28 16:12:33', '2020-02-28 16:12:33', 1, 'edpktmJk1o9LRSB6VFy1s1Y6qK1rS27WwEA7XWdw76KKo1YUXJkdaf', NULL, 'tz1W4ASDyRRt7gXv2mkbdDCCbfntsSeZ1dcz', NULL, '1', '1', 0),
(362, 1, 287, '0', '2020-02-28 19:35:41', '2020-02-28 19:35:41', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(363, 3, 287, '0', '2020-02-28 19:35:50', '2020-02-28 19:35:50', 1, 'edpkvMDkzM6fF7LV8WtbvX3Z6QhpWNTcNmRWusj1MUN1SRmEEEgEST', NULL, 'tz1V4Wxd5pv51FC51GyKTZgku8BSqDGL8iuk', NULL, '1', '1', 0),
(364, 1, 288, '0', '2020-02-28 20:19:37', '2020-02-28 20:19:37', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(365, 3, 288, '0', '2020-02-28 20:20:57', '2020-02-28 20:20:57', 1, 'edpkvLS5xZ8qqzPtKdTvnndYNQkK4ZqbUkRYD3eFfwECrNkwT2wNjM', NULL, 'tz1hPtsPgVuYmJfN38FihnU3AGaZUCWy6WzB', NULL, '1', '1', 0),
(366, 3, 288, '0', '2020-02-28 20:21:16', '2020-02-28 20:21:16', 1, 'edpkv3TSVyUeQ58gDvRTaseVmXtdfgeGHesGgmyuRA4sJaG5Fs1yLM', NULL, 'tz1fosX6FdtqzkTf7qqsuaQgZ1mSVzBuULV3', NULL, '1', '1', 0),
(367, 1, 289, '0', '2020-02-29 10:41:33', '2020-02-29 10:41:33', 1, NULL, NULL, '1GUxujjGJFh41iZntYWJxxYuCTJLULsyhh', NULL, '1', '1', 0),
(368, 3, 289, '0', '2020-02-29 10:42:00', '2020-02-29 10:42:00', 1, 'edpkufs2dmVhHkydznrUxZA1jabs9JcZUByFG95rJAtBNf5Jhe4Dbj', NULL, 'tz1VgeM9Vbm8ywCA5rsHjtY2xCcBH8eWQghh', NULL, '1', '1', 0),
(369, 1, 290, '0', '2020-02-29 10:50:28', '2020-02-29 10:50:28', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(370, 3, 290, '0', '2020-02-29 10:50:42', '2020-02-29 10:50:42', 1, 'edpkuE1VaQZHQb9sVQChLkXPCjSTd7QzVYat8LwRZEFFXmFH2WDezL', NULL, 'tz1fVzx5CWpkFxqE8xXhF2mKGDKSHruMmYXq', NULL, '1', '1', 0),
(371, 1, 291, '0', '2020-02-29 10:58:26', '2020-02-29 10:58:26', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(372, 3, 291, '0', '2020-02-29 10:58:44', '2020-02-29 10:58:44', 1, 'edpkvNzurrXSaUmVJDncv9e6eixoMXjkD7PDkB4SARN6e9MrzVDm7e', NULL, 'tz1Wan8LqHyxVPzzc3yzC1G7wvkLGXVQRMvv', NULL, '1', '1', 0),
(373, 1, 292, '0', '2020-02-29 12:32:58', '2020-02-29 12:32:58', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(374, 3, 292, '0', '2020-02-29 12:33:40', '2020-02-29 12:33:40', 1, 'edpkvSJ6WGziJK2T4r4nXtjEKu1xzAtWcAFrKAjeDqwFYaivgE9Hmp', NULL, 'tz1PDkvBYob249fxDMEerxN1TYVxFJsrPyRn', NULL, '1', '1', 0),
(375, 1, 293, '0', '2020-02-29 12:34:43', '2020-02-29 12:34:43', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(376, 3, 293, '0', '2020-02-29 12:34:53', '2020-02-29 12:34:53', 1, 'edpkuFhpfdYHvdm4zn4zJJX4qkq7hjfZWmdoxpf8btkSuc1kccpDTa', NULL, 'tz1QfDLcBQpyazquRC2HVfiHogvQ13CUAyXX', NULL, '1', '1', 0),
(377, 1, 294, '0', '2020-02-29 12:36:33', '2020-02-29 12:36:33', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(378, 3, 294, '0', '2020-02-29 12:37:02', '2020-02-29 12:37:02', 1, 'edpku6nSznEZmS9Gq6df8Xeiuz2qYzFFqvNXrsWiU8GTWh73nikAtr', NULL, 'tz1RbJw7y3deptB9UtgPxCk2C26eNwUN8GjH', NULL, '1', '1', 0),
(379, 1, 295, '0', '2020-02-29 13:03:38', '2020-02-29 13:03:38', 1, NULL, NULL, '18uuDWkhPcwbB9inbSGi9Ua9nvhg7zsAH4', NULL, '1', '1', 0),
(380, 3, 295, '0', '2020-02-29 13:04:06', '2020-02-29 13:04:06', 1, 'edpkvCKub7tD4LNDQ1PSKh2CTyYyaFf9rQ2yj4PUhTSYZXM69rSf3e', NULL, 'tz1WNphwgQY7bnWVu1WwjCzCKCSjDzX8kHyi', NULL, '1', '1', 0),
(381, 1, 296, '0', '2020-02-29 13:08:20', '2020-02-29 13:08:20', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(382, 3, 296, '0', '2020-02-29 13:08:40', '2020-02-29 13:08:40', 1, 'edpkuoY85Tt9iwPYZdvja8EPRrXRBj5qgfE8NXDomL5rGKgT2GZ6Gw', NULL, 'tz1REuq44m9aKDHf7Jd5harK5RbhkjayzCuk', NULL, '1', '1', 0),
(383, 1, 297, '0', '2020-02-29 13:11:23', '2020-02-29 13:11:23', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(384, 3, 297, '0', '2020-02-29 13:11:40', '2020-02-29 13:11:40', 1, 'edpkvLiteTEvmPaJ6nyRYuEoWHrxxWMYQhUAdPFrz7341bGUYCqTVv', NULL, 'tz1a7LuL8oKfY8Wn7UxvfMLZYwYSsTnSFyX2', NULL, '1', '1', 0),
(385, 3, 297, '0', '2020-02-29 13:11:54', '2020-02-29 13:11:54', 1, 'edpkuZeh938yA2wC1GF15GVbQxDumzQCLhcPZCZywYTvqeHwjpH9gg', NULL, 'tz1ZfpeksdeqLzJgGxspRizVBXS6dzzMzofc', NULL, '1', '1', 0),
(386, 3, 297, '0', '2020-02-29 13:12:53', '2020-02-29 13:12:53', 1, 'edpktsHgTJykYbPuHSohuFTLTqJfm3mGVQt2CnD43bRnGiVy8kavij', NULL, 'tz1NVVDw3RBnbJVCwZhrcR9ZqcCkysiUeVmi', NULL, '1', '1', 0),
(387, 1, 298, '0', '2020-02-29 13:32:12', '2020-02-29 13:32:12', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(388, 3, 298, '0', '2020-02-29 13:34:29', '2020-02-29 13:34:29', 1, 'edpkvQtFpq27rQURpfnZAmQDMvyrX8MJYZhFkSWdBGyH4fZvPM7J9n', NULL, 'tz1hCbNNjhLFJR66BkfiwSGxg6JZLmz3rVoj', NULL, '1', '1', 0),
(389, 1, 299, '0', '2020-02-29 14:51:04', '2020-02-29 14:51:04', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(390, 3, 299, '0', '2020-02-29 14:51:27', '2020-02-29 14:51:27', 1, 'edpku4iJ8CEsPsEpZR2JstBG9LcYuqtt7ywJcaZpJu1TjNb6GwpaBZ', NULL, 'tz1VRM527FkDBECz768Ew2waXndrnRsgQaFn', NULL, '1', '1', 0),
(391, 1, 300, '0', '2020-02-29 15:14:07', '2020-02-29 15:14:07', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(392, 3, 300, '0', '2020-02-29 15:14:16', '2020-02-29 15:14:16', 1, 'edpktqZ8anEpso2va46zaMgEH9ipkiKxVzjjTKhXQMnNqi3eqMTZJU', NULL, 'tz1RWxdsRKg1eJ2yL3waTnG7To1puz2JDWqG', NULL, '1', '1', 0),
(393, 1, 301, '0', '2020-02-29 15:18:36', '2020-02-29 15:18:36', 1, NULL, NULL, '18kPEcq3vUR35jBMhdXeeVgebaYfcu5kLT', NULL, '1', '1', 0),
(482, 3, 335, '0', '2020-03-23 13:48:48', '2020-03-23 13:48:48', 1, 'edpkvDJ77YMGLTAoYDoU1y4brtr4SUbMeJwBx2QR9zGqAkyte2zxWy', NULL, 'tz1WugALv1Eokgm3QuYBeP5VYkhchFkCr5df', NULL, '1', '1', 0),
(481, 1, 335, '0', '2020-03-23 13:48:40', '2020-03-23 13:48:40', 1, NULL, NULL, '1HVXP1oCHpNFA2UG81uLuRg7BhFXyczSPK', NULL, '1', '1', 0),
(479, 1, 334, '0', '2020-03-22 07:46:40', '2020-03-22 07:46:40', 1, NULL, NULL, '1Df5ZgqGLfMUzyGwU9B9mfdH9YHE3EQKVZ', NULL, '1', '1', 0),
(480, 3, 334, '0', '2020-03-22 07:46:55', '2020-03-22 07:46:55', 1, 'edpkuFMcj8mNpDrPYKzeXFZBFRgxSczEGX9UV3LfiEDNC6naN3h4tG', NULL, 'tz1N3H18aEentBEgGAuDUkJG51i1jhqdqEvQ', NULL, '1', '1', 0),
(477, 1, 333, '0', '2020-03-22 07:40:04', '2020-03-22 07:40:04', 1, NULL, NULL, '18ZU1s4YpVwThYDwBF5y2Xu4YFiuPmaSrM', NULL, '1', '1', 0),
(478, 3, 333, '0', '2020-03-22 07:40:10', '2020-03-22 07:40:10', 1, 'edpkuqUzvH72BzMNxpXSBJ5x1fLdN9QQ8CcsGztRBjDUbZwS6XXfWu', NULL, 'tz1U4YyLN1YY7mMj2oVGV2c2jAqDLPHnNgir', NULL, '1', '1', 0),
(475, 1, 332, '0', '2020-03-22 07:34:14', '2020-03-22 07:34:14', 1, NULL, NULL, '1EWsNajNVwWaZwL95XLDHo954ENmnMxQGU', NULL, '1', '1', 0),
(476, 3, 332, '0', '2020-03-22 07:34:21', '2020-03-22 07:34:21', 1, 'edpktgVoPphWxDW6JYMSxVnb2saoudMk1kwXdcAy7XSpyABLabwB6S', NULL, 'tz1aT9jFuHQZgew1jKrKCGYdDHT7LK6KKPXU', NULL, '1', '1', 0),
(402, 1, 302, '0', '2020-02-29 17:02:08', '2020-02-29 17:02:08', 1, NULL, NULL, '1BG3DLUtwDFcUj27j1biZc7UxnqBTSuV64', NULL, '1', '1', 0),
(403, 3, 302, '0', '2020-02-29 17:02:19', '2020-02-29 17:02:19', 1, 'edpkvKHnCq8GoYjrC5VcZ9WmUtn5TGsp6XtfS7kpXWyeA1t6XNVzGi', NULL, 'tz1MZLseAWnpxFih4amUR944ugQoiTZA2PLP', NULL, '1', '1', 0),
(404, 1, 303, '0', '2020-03-02 15:05:49', '2020-03-02 15:05:49', 1, NULL, NULL, '1E1Ss5oCe53tximYccnEHZ1pmtejAUw7q', NULL, '1', '1', 0),
(405, 3, 303, '0', '2020-03-02 15:05:55', '2020-03-02 15:05:55', 1, 'edpkvUeXLCTBAGULuUh7JtaBTFC3K5snh71EA2tGx8me1Fb4UPzRS6', NULL, 'tz1TXg8H9HV6occvNdVVEUUHAZ3eagQKihjD', NULL, '1', '1', 0),
(473, 1, 331, '0', '2020-03-21 15:59:36', '2020-03-21 15:59:36', 1, NULL, NULL, '1L6SmsHFcAH9qvLVvdozqG1CnQdd43tXg6', NULL, '1', '1', 0),
(474, 3, 331, '0', '2020-03-21 15:59:48', '2020-03-21 15:59:48', 1, 'edpktjyVe7YuaE19nTs8nhHcc8Dh6owcKpKcA8uvszvvRhD7DQGoip', NULL, 'tz1UHZ2VY2vEaXSvwjxD3hkHLpYqN1dRfBn2', NULL, '1', '1', 0),
(408, 3, 301, '0', '2020-03-02 19:14:34', '2020-03-02 19:14:34', 1, 'edpkupuKjGmnk8525ZoGTZ99f9pH3mVhNPHixvx5eX6Aa6EirNDtf1', NULL, 'tz1YihgVcpQPim5QvQHRxBcH1t9X8qpHchTU', NULL, '1', '1', 0),
(409, 1, 304, '0', '2020-03-03 07:16:59', '2020-03-03 07:16:59', 1, NULL, NULL, '1CVsz8WZGZZqvbEPuaju4wyTm8rGr8RjQm', NULL, '1', '1', 0),
(410, 3, 304, '0', '2020-03-03 07:17:04', '2020-03-03 07:17:04', 1, 'edpktix1cCm1HAAgnTyxSpxzhuHhq4MiDuDbJET9w1Dmk7KWcrVJuv', NULL, 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg', NULL, '1', '1', 0),
(411, 1, 305, '0', '2020-03-03 12:40:23', '2020-03-03 12:40:23', 1, NULL, NULL, '1MoUhbUVeaJ9apFZGseDhavCpovAwjbuB8', NULL, '1', '1', 0),
(412, 3, 305, '0', '2020-03-03 12:40:31', '2020-03-03 12:40:31', 1, 'edpkuEQkLNd5y7hPiw6ogouhjU8Q2c4cPNHbV1PvmyhuZGafqwksAy', NULL, 'tz1d9XTysw6zDMyPjZi5tzAhwazJ4VRVyMaE', NULL, '1', '1', 0),
(416, 3, 307, '0', '2020-03-04 12:39:07', '2020-03-04 12:39:07', 1, 'edpktmAi3Lua3HwgBHTWpTGU5ecLsvs1PUnifh8uJCGManYbcF5n3w', NULL, 'tz1ZpR3kVUF7csmrqxQm7sVoSLqMLmvVTTVv', NULL, '1', '1', 0),
(417, 1, 308, '0', '2020-03-05 08:35:06', '2020-03-05 08:35:06', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(418, 3, 308, '0', '2020-03-05 08:35:22', '2020-03-05 08:35:22', 1, 'edpkuitSYCqL96iU9R3ChBb18H1fahC8wUnTcxouHTyzxvp3NvcqKe', NULL, 'tz1fLqsTHhj9utDhuLrQLQfRei2xggLE6DKa', NULL, '1', '1', 0),
(419, 1, 309, '0', '2020-03-05 11:15:50', '2020-03-05 11:15:50', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(420, 3, 309, '0', '2020-03-05 11:16:00', '2020-03-05 11:16:00', 1, 'edpku4C4bhbiKboD65w5A1BYmL2Kjx2QswVQLLGtAigDeW6B3qTzA4', NULL, 'tz1UcPMBMHa24EBepkp74X9NaSKq4xL6jDf4', NULL, '1', '1', 0),
(431, 1, 315, '0', '2020-03-06 18:22:08', '2020-03-06 18:22:08', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(427, 1, 313, '0', '2020-03-05 18:19:28', '2020-03-05 18:19:28', 1, NULL, NULL, '1Jw5rPwMEoGEyyBGynCZXo5LaNcMmECQXg', NULL, '1', '1', 0),
(428, 3, 313, '0', '2020-03-05 18:19:34', '2020-03-05 18:19:34', 1, 'edpkvAJBhDSdBHyPmgrkbSEZuQ6qrobw3ZeeTfVyf3L2gESx2trdew', NULL, 'tz1anZ5MQJs4ZfyyX4Uixrx6SgD1RJsdz44J', NULL, '1', '1', 0),
(429, 1, 314, '0', '2020-03-06 09:26:15', '2020-03-06 09:26:15', 1, NULL, NULL, '1LE8tCr1WdkeKHdpryRxxVHvS8E7rDBSv5', NULL, '1', '1', 0),
(430, 3, 314, '0', '2020-03-06 09:26:26', '2020-03-06 09:26:26', 1, 'edpkuBNs4q54opoVsDEwgVXXKMt86msAMBWV7gbgxNiiQD7BzNdmYj', NULL, 'tz1QbpVuz3QKyQE96ANDqk1F8T6FeRVsV2Mj', NULL, '1', '1', 0),
(432, 3, 315, '0', '2020-03-06 18:22:15', '2020-03-06 18:22:15', 1, 'edpkvDg4hbCqcQ218ZjDGZii45KCDrmfRXMPipk9X6ZQKPJYwGc8ot', NULL, 'tz1UScGihNa5SSztu8r58Gj6wy9Q65fCxXbt', NULL, '1', '1', 0),
(433, 1, 316, '0', '2020-03-07 10:58:55', '2020-03-07 10:58:55', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(434, 3, 316, '0', '2020-03-07 10:59:15', '2020-03-07 10:59:15', 1, 'edpkvQK4jWm6PiuABJZzx91y7m5jrSrq8GqSUZAL3SUirXdp9wCbVX', NULL, 'tz1cDqnBuL83G3rFYiEfuXFK9QDhJfxjq6mk', NULL, '1', '1', 0),
(435, 3, 316, '0', '2020-03-07 11:02:02', '2020-03-07 11:02:02', 1, 'edpkusR9b12ptcJA9osQ2fgwmbx7bivFosBraA7ZeG5HWbawpnTY8h', NULL, 'tz1Z8mJK2z2tonSGKf84bSKaWwoR6TBMseK8', NULL, '1', '1', 0),
(436, 1, 317, '0', '2020-03-07 14:27:58', '2020-03-07 14:27:58', 1, NULL, NULL, '157Yj135wvZdkAnkUopDZxyscNR9vP36bk', NULL, '1', '1', 0),
(437, 3, 317, '0', '2020-03-07 14:28:16', '2020-03-07 14:28:16', 1, 'edpkvTAAQu6YW5pGmF9kpWeBdWS1PzcC2X8T1WutFSy4GtQfc1QGi5', NULL, 'tz1cS41XjzW6BQ6JX3g2q2xq4TNrQjnnLNxu', NULL, '1', '1', 0),
(438, 1, 318, '0', '2020-03-07 14:33:48', '2020-03-07 14:33:48', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(439, 3, 318, '0', '2020-03-07 14:33:53', '2020-03-07 14:33:53', 1, 'edpkuuV8N9fTgeEWfgCNxfdDdedZphSnTDXpzAgRwWyKvwqhAeZqsd', NULL, 'tz1fGK8UvLHfNoxkgTvkbAXPj6LqrTGbzd9f', NULL, '1', '1', 0),
(440, 1, 319, '0', '2020-03-07 21:57:40', '2020-03-07 21:57:40', 1, NULL, NULL, '1JtUz7E8sdUYq715CUecBR23p2THATXtLv', NULL, '1', '1', 0),
(441, 3, 319, '0', '2020-03-07 21:58:13', '2020-03-07 21:58:13', 1, 'edpkux3gXm6Zg53j9V7YrZ4RLNzMUrL2HKy8dr3Bs8xTFSKkiW1U5k', NULL, 'tz1egrTtyaiyz9upNSRdh9GwMRCAtivDYE7k', NULL, '1', '1', 0),
(442, 3, 319, '0', '2020-03-07 21:59:08', '2020-03-07 21:59:08', 1, 'edpkux3gXm6Zg53j9V7YrZ4RLNzMUrL2HKy8dr3Bs8xTFSKkiW1U5k', NULL, 'tz1egrTtyaiyz9upNSRdh9GwMRCAtivDYE7k', NULL, '1', '1', 0),
(443, 3, 319, '0', '2020-03-07 22:11:31', '2020-03-07 22:11:31', 1, 'edpkvEeQQcPu2g1VZJWvdhrsDpodyjqW4iNYrHeqptsQZqqkSbAMVo', NULL, 'tz1RiWU1EUaFWdKtokaBf6mkF62WN19a6UU2', NULL, '1', '1', 0),
(444, 3, 319, '0', '2020-03-07 22:12:21', '2020-03-07 22:12:21', 1, 'edpkvEeQQcPu2g1VZJWvdhrsDpodyjqW4iNYrHeqptsQZqqkSbAMVo', NULL, 'tz1RiWU1EUaFWdKtokaBf6mkF62WN19a6UU2', NULL, '1', '1', 0),
(445, 3, 319, '0', '2020-03-07 22:24:21', '2020-03-07 22:24:21', 1, 'edpkuzi6y3BUqxdC6X6MvjiUbimffag2ZKFK5vWn2UAr7DyMmEkQM9', NULL, 'tz1MpeXxUAWw6aAqHtz3BaYaPzC4ph9yTbp5', NULL, '1', '1', 0),
(446, 3, 319, '0', '2020-03-07 22:29:16', '2020-03-07 22:29:16', 1, 'edpktx1BrmK6QXN5oeSz8tn7vKM38Yjf8T4g3EFR9DWZMuZ78WcwzP', NULL, 'tz1SdJpw4rst6RrtrDB7D3qexudhrPXgHXUJ', NULL, '1', '1', 0),
(447, 3, 319, '0', '2020-03-07 22:52:38', '2020-03-07 22:52:38', 1, 'edpkvTLG8SdfHcbCw7nFYQnqfxH6Dq4oFen6frEAVMQyM1NBDn8R69', NULL, 'tz1Wjwb9s4cLTXD1HxZAuWd2LpCd33BH4Ewj', NULL, '1', '1', 0),
(448, 3, 319, '0', '2020-03-08 05:56:48', '2020-03-08 05:56:48', 1, 'edpkuLze69bX3gPfr2NpsdT5mepphFHRg3xvsyemWa5P74kJfzNHZQ', NULL, 'tz1d4ppmYCJfd7eiz8KsR1SoTbrMWU4G9yZ3', NULL, '1', '1', 0),
(449, 3, 319, '0', '2020-03-08 05:56:55', '2020-03-08 05:56:55', 1, 'edpku3AdJ1GV4vAoEyLBCbgdboh6GrscoTSpwaaiRJjA3kRYkqyNAb', NULL, 'tz1heHaaM6pFTwWzud66qYhXpzHjCgLeAum3', NULL, '1', '1', 0),
(450, 3, 319, '0', '2020-03-08 09:16:25', '2020-03-08 09:16:25', 1, 'edpku454gJ6zQKiFgvJ52zoPV53uhR5YQYPN7sCUXiAGLEf9FK22vS', NULL, 'tz1MNCHLshXTaVHM76kPYrPJT2udgcerLjFy', NULL, '1', '1', 0),
(451, 3, 319, '0', '2020-03-08 09:18:03', '2020-03-08 09:18:03', 1, 'edpkueVL8RvWhiYyV5XcR5gnoMNhFqadHCcr7zB9feSFQycQxGzcND', NULL, 'tz1ckoPU9jzTWpURrQuu1X8prbQxwKCwtmJJ', NULL, '1', '1', 0),
(452, 3, 319, '0', '2020-03-08 14:08:56', '2020-03-08 14:08:56', 1, 'edpkupAvDB1x1dA9mv8ErZcgHk8tWTSJJbpjwQzNJTsynisAFhyHGL', NULL, 'tz1LEfnLAkbj7fpr9sCydAj7uEjkMMjuipDg', NULL, '1', '1', 0),
(453, 1, 320, '0', '2020-03-10 19:31:28', '2020-03-10 19:31:28', 1, NULL, NULL, '195bjfeKMvtwwTRWvp5EDvxbvY5gMX5Wa8', NULL, '1', '1', 0),
(454, 3, 320, '0', '2020-03-10 19:31:52', '2020-03-10 19:31:52', 1, 'edpkuGjUFZdUBHA1KYo4WsRRHA5dDm86ZHTrMEqSkEArzzE2XafDdB', NULL, 'tz1bc1JSP6mtQkFP7aZUTtg6AFTsUrzxMcdN', NULL, '1', '1', 0),
(455, 1, 321, '0', '2020-03-15 19:33:02', '2020-03-15 19:33:02', 1, NULL, NULL, '1P3iMHd4LmxAKk7dUzxZohsKP2oWbVEcEn', NULL, '1', '1', 0),
(456, 3, 321, '0', '2020-03-15 19:33:18', '2020-03-15 19:33:18', 1, 'edpkueBrVQPRa7sPBDw3J8S3WazsYmwDW3hZx6Dqd26MKCaEV3XrXY', NULL, 'tz1eeaaquRNTN5WuDVbSouWotFjjEa82de3p', NULL, '1', '1', 0),
(457, 1, 322, '0', '2020-03-16 12:02:08', '2020-03-16 12:02:08', 1, NULL, NULL, '1LaLBVuAFAZdHcuhrdvmS128aQtZuLL9sX', NULL, '1', '1', 0),
(458, 3, 322, '0', '2020-03-16 12:02:23', '2020-03-16 12:02:23', 1, 'edpku2xawQ2ptS6DtkR3HYjs9rrRaH6nmY38UaJkGKSZbKo2YnVhQM', NULL, 'tz1TH5YJ6KWRs5u3ZaChTyESr1KFwveB9BBZ', NULL, '1', '1', 0),
(459, 1, 323, '0', '2020-03-16 13:40:32', '2020-03-16 13:40:32', 1, NULL, NULL, '1NkCGaiF9XdkYb7Uxw5n5MPc5x8SG1VuJf', NULL, '1', '1', 0),
(460, 3, 323, '0', '2020-03-16 13:40:44', '2020-03-16 13:40:44', 1, 'edpktzspQgUFx19z5LyZjZHUevbaaSVx6GtY5ELKVKVVPL2jaWh3RY', NULL, 'tz1QcPS3bFiCk5MVQnmqHsp2USUuLzNgSWwv', NULL, '1', '1', 0),
(461, 1, 324, '0', '2020-03-16 22:55:46', '2020-03-16 22:55:46', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(462, 1, 325, '0', '2020-03-17 12:26:00', '2020-03-17 12:26:00', 1, NULL, NULL, '17vZSHpnJobU7WY5GWoBUGFFmyb6RWiA96', NULL, '1', '1', 0),
(463, 3, 325, '0', '2020-03-17 12:27:50', '2020-03-17 12:27:50', 1, 'edpkuT4QcdwovV5dJXnit8iuuJcV5gU2ccJmRASzCqpy1rUQ6rpapp', NULL, 'tz1YxCUCfGJ283x1UQm1MGD5N8Z3Gfi9gPGM', NULL, '1', '1', 0),
(464, 1, 326, '0', '2020-03-17 14:16:04', '2020-03-17 14:16:04', 1, NULL, NULL, '1qHQfBH48N9UKsJccoVQXF2E6wuB1jxmW', NULL, '1', '1', 0),
(465, 3, 326, '0', '2020-03-17 14:16:11', '2020-03-17 14:16:11', 1, 'edpkv7R49Us3PX55fJqBZKD4pQPSkFJ5VM2DV57YnbH4ZwKkbLX6xp', NULL, 'tz1L2h7YuugrkmmHTG3Y6aeovTGWekYKxEhq', NULL, '1', '1', 0),
(466, 1, 327, '0', '2020-03-17 16:27:52', '2020-03-17 16:27:52', 1, NULL, NULL, '1GgcgCDKFBaxyRNuUdBvzcYrE7NEgtJkex', NULL, '1', '1', 0),
(467, 3, 327, '0', '2020-03-17 16:27:59', '2020-03-17 16:27:59', 1, 'edpku7N3CCJo6zJfNNbcfpN3j7y2vyKuLSbWBtT7pGnPWejMY2mnsN', NULL, 'tz1NFGrffxjPpMgAujKsQjfFbJ4F1rpk6U1N', NULL, '1', '1', 0),
(468, 1, 328, '0', '2020-03-18 09:40:47', '2020-03-18 09:40:47', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(469, 1, 329, '0', '2020-03-18 09:41:35', '2020-03-18 09:41:35', 1, NULL, NULL, '13yFGWNn629RxSuD9TmsmPV4Lzgr5dNaJS', NULL, '1', '1', 0),
(470, 3, 329, '0', '2020-03-18 09:42:06', '2020-03-18 09:42:06', 1, 'edpkvDX8SSoNQYKmZgn4fQ11bQqRJZWgnmtmtXKB9hXtVEWXsLaKFy', NULL, 'tz1Rhb8EYpxWDYFp8mrYFr5QoxQDe2eH7Bvp', NULL, '1', '1', 0),
(471, 1, 330, '0', '2020-03-19 09:02:34', '2020-03-19 09:02:34', 1, NULL, NULL, '16rsZmSRfz64T9uzP6vCxdUTWgMc6p5wX3', NULL, '1', '1', 0),
(472, 3, 330, '0', '2020-03-19 09:02:57', '2020-03-19 09:02:57', 1, 'edpktmJFjFs8xXw2cd6o5bvHtsdVzqhQfoqJqAYd5ASqacvigUnSd5', NULL, 'tz1SpUQdTZ5guFWSdt1hduzJP9XA6bS4yTMm', NULL, '1', '1', 0),
(483, 1, 336, '0', '2020-03-24 08:16:49', '2020-03-24 08:16:49', 1, NULL, NULL, '13Cf1YxcZGsnkdUsZrXJyHqre13B2oa8Fq', NULL, '1', '1', 0),
(484, 3, 336, '0', '2020-03-24 08:16:54', '2020-03-24 08:16:54', 1, 'edpktgQWVJ6HJPdW69hfwkZwTYY2r4yahnzcwCFFsgS52cwkcN7Qt8', NULL, 'tz1LFvUnTWGNmWLc9v1NPDiNYS8ivGLmGfQ3', NULL, '1', '1', 0),
(485, 1, 337, '0', '2020-03-28 11:18:28', '2020-03-28 11:18:28', 1, NULL, NULL, '1MzuhyiXi99o4d8DDUZybvZa1FLQVcWD63', NULL, '1', '1', 0),
(486, 3, 337, '0', '2020-03-28 11:19:33', '2020-03-28 11:19:33', 1, 'edpkugj2SNVDa5sW29E6V9xpBjSqSp2vKgvnQ38mHQ39thjYPdfyoB', NULL, 'tz1bumkXC3St7W7nCMkYtkcLSWnuZMGb2NJD', NULL, '1', '1', 0),
(487, 1, 338, '0', '2020-03-29 11:20:36', '2020-03-29 11:20:36', 1, NULL, NULL, '16NtSz4rzsEcbucdMCSg7UhJhh8PrLRbxw', NULL, '1', '1', 0),
(488, 3, 338, '0', '2020-03-29 11:20:42', '2020-03-29 11:20:42', 1, 'edpktmm2g43YFnbYP5ZQSQ3rF2js4DSFogfjvyo7uGXtjAon5WAsrJ', NULL, 'tz1dGcruUD7noB3pmjrEpWVfJVDbtcBEixXL', NULL, '1', '1', 0),
(489, 1, 339, '0', '2020-04-01 13:26:21', '2020-04-01 13:26:21', 1, NULL, NULL, '1822a6wV89BDGFTKq9Q1HAn7DvGvsYLDTm', NULL, '1', '1', 0),
(490, 3, 339, '0', '2020-04-01 13:26:26', '2020-04-01 13:26:26', 1, 'edpktfJpBJF8KxN38KYVmH6S3KF4RiJSs6YkUoymcXUtyP5bdm6mXn', NULL, 'tz1Q8PticHY6j29UVgQSw5QkomZGDzasJqCY', NULL, '1', '1', 0),
(491, 1, 340, '0', '2020-04-02 09:16:32', '2020-04-02 09:16:32', 1, NULL, NULL, '17ripgVrQo9VzTPTzMe4zHgwKb4xRSDcid', NULL, '1', '1', 0),
(492, 3, 340, '0', '2020-04-02 09:16:36', '2020-04-02 09:16:36', 1, 'edpkuYaTjPMCAvNnNuiAhc1gYboo3oManQXkqrVr1kEh7sFVw2PWjV', NULL, 'tz1gCXfXMFPeE5gxotGdBtQx8koQBJ9e4CEB', NULL, '1', '1', 0),
(493, 1, 341, '0', '2020-04-03 18:35:07', '2020-04-03 18:35:07', 1, NULL, NULL, '1AkheVjsMk2kSvw3saRFCvjrMhc93VLvWv', NULL, '1', '1', 0),
(494, 3, 341, '0', '2020-04-03 18:35:20', '2020-04-03 18:35:20', 1, 'edpkupySkn3dexfG78VgsAGDGfMqLCzky3739dqB9s9gY3Ti7VrAZs', NULL, 'tz1MUrVxBbjBDb4udZyZys9sxEnNqK2FoMx5', NULL, '1', '1', 0),
(495, 1, 342, '0', '2020-04-03 23:11:07', '2020-04-03 23:11:07', 1, NULL, NULL, '1Ejoc2yvcTB9GeJ7vc24wKJ2ijhgx16f9g', NULL, '1', '1', 0),
(496, 3, 342, '0', '2020-04-03 23:11:20', '2020-04-03 23:11:20', 1, 'edpkv4aromqbvRAjpDmZNjwYpXLBxxcaMQJLjqPxc8hSq7Z8FV6yGt', NULL, 'tz1U53ZqvVw9u56ghbZmrHoCvH6bWT5xDes8', NULL, '1', '1', 0),
(497, 1, 343, '0', '2020-04-03 23:29:05', '2020-04-03 23:29:05', 1, NULL, NULL, '15mkmdeARZDU98xpsKdxsAzK24EVypBE3v', NULL, '1', '1', 0),
(498, 3, 343, '0', '2020-04-03 23:29:12', '2020-04-03 23:29:12', 1, 'edpkvWyYmZjz9sfxoj78fwJxqocn52YkgMhFMwCtafQiuSugh1byTU', NULL, 'tz1ZbWt1NkW9rgYpwks92v7DYBnzSSrreYzg', NULL, '1', '1', 0),
(499, 1, 344, '0', '2020-04-04 05:41:24', '2020-04-04 05:41:24', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(500, 3, 344, '0', '2020-04-04 05:44:04', '2020-04-04 05:44:04', 1, 'edpktzCe8F36vTPDhaZBtJ1uuTsndqLdpXACGkDxNR9XrchvzNZaVz', NULL, 'tz1PHhd6Ghz3XN1uFWTFyYicTUxDrC29ood7', NULL, '1', '1', 0),
(501, 1, 345, '0', '2020-04-04 08:18:23', '2020-04-04 08:18:23', 1, NULL, NULL, '19s1zf57Bb7M5o92vX5dNto6J6y2j3tniB', NULL, '1', '1', 0),
(502, 3, 345, '0', '2020-04-04 08:18:30', '2020-04-04 08:18:30', 1, 'edpku8xfTffe5vLZsh3aayumBcPjcKmKzFmF1dhza5P12PQcFpbzLC', NULL, 'tz1UJc1Dipv6L2mKoLuAY5hd12oqYp6DDPyh', NULL, '1', '1', 0),
(503, 1, 346, '0', '2020-04-04 10:05:57', '2020-04-04 10:05:57', 1, NULL, NULL, '1MDmAU31VCBov2tV8fQxJa2X9TnraZyurP', NULL, '1', '1', 0),
(504, 3, 346, '0', '2020-04-04 10:06:14', '2020-04-04 10:06:14', 1, 'edpkuPg1X9cuLZmixeuTV88uKYXD91mQ3ZE14NWnQieSngmeDpynVM', NULL, 'tz1RAiBV2bNkMzDuh2otK9LbVkpQX5RnjokP', NULL, '1', '1', 0),
(505, 1, 347, '0', '2020-04-04 10:17:26', '2020-04-04 10:17:26', 1, NULL, NULL, '13gPMxX5txre68SE7GFg17BHzSnwbedED7', NULL, '1', '1', 0),
(506, 3, 347, '0', '2020-04-04 10:17:37', '2020-04-04 10:17:37', 1, 'edpkuy3R3zS5MY4CMV7MJysKe3rEFjAagozSKYWCncYXixF72KRf2W', NULL, 'tz1hTwVQR485u5n6Wtu7VRjLLAwACchTSf91', NULL, '1', '1', 0),
(507, 1, 348, '0', '2020-04-04 12:28:17', '2020-04-04 12:28:17', 1, NULL, NULL, '1CzbKpVrYJJvf5EghJ7SjJHGYCms2k7pXQ', NULL, '1', '1', 0),
(508, 3, 348, '0', '2020-04-04 12:28:26', '2020-04-04 12:28:26', 1, 'edpkv8Zut6FSYx57apucatyEMa6zjnrb1ciPCx5MbVEKPBAwSWPYZf', NULL, 'tz1eV22QiiV5wsX2boyut1tZCzFKtAYSJ29d', NULL, '1', '1', 0),
(509, 1, 349, '0', '2020-04-06 06:37:21', '2020-04-06 06:37:21', 1, NULL, NULL, '1EjJhzA9eNLeyxJ9YYTnReyfpVtL1LqvHZ', NULL, '1', '1', 0),
(510, 3, 349, '0', '2020-04-06 06:37:28', '2020-04-06 06:37:28', 1, 'edpktygPr6q1qpuYXoV3jVkF5d2xMUeDvTZBsA7iJ1necbZQoRLsna', NULL, 'tz1N35j3FjQN1QB9zA3Mf2H5VdP7RpFXB95i', NULL, '1', '1', 0),
(511, 1, 350, '0', '2020-04-06 22:23:05', '2020-04-06 22:23:05', 1, NULL, NULL, '1MxPoEzz93yovmug8GZ1gQax8nch3JjjXd', NULL, '1', '1', 0),
(512, 3, 350, '0', '2020-04-06 22:23:21', '2020-04-06 22:23:21', 1, 'edpku1a9Au88fhoFHjcJtjdRpuEGxzZYdet8pud4SrVy62RAohBExg', NULL, 'tz1Ystn5Wjm4UY6Hy7R6Mrprr5Xex57acHQ3', NULL, '1', '1', 0),
(513, 1, 351, '0', '2020-04-07 09:19:21', '2020-04-07 09:19:21', 1, NULL, NULL, '1DEp8FLFYnzAx3cEDr8MLwPd3oJ9uUFSZL', NULL, '1', '1', 0),
(514, 3, 351, '0', '2020-04-07 09:19:30', '2020-04-07 09:19:30', 1, 'edpkuPycZVYHg5DMSvZ76ffrDHqXF5Y7utpdLKuAGK4kUNWiQMLTGp', NULL, 'tz1i64t2DQePrGtgH2TmUzE4t4sH4KpT93VV', NULL, '1', '1', 0),
(515, 1, 352, '0', '2020-04-08 18:48:59', '2020-04-08 18:48:59', 1, NULL, NULL, '133gnVSePYydTWo3KVjiPZe94AFEvegowZ', NULL, '1', '1', 0),
(516, 3, 352, '0', '2020-04-08 18:49:11', '2020-04-08 18:49:11', 1, 'edpkuGc2FEKpBHxWZrU46nM56jvEH9g7Jo8QRLgudSf1QiybE7JdHo', NULL, 'tz1MxRaDPReYDdjzDSyPf8pH2Lq1UYuLdGec', NULL, '1', '1', 0),
(517, 1, 353, '0', '2020-04-10 12:58:40', '2020-04-10 12:58:40', 1, NULL, NULL, NULL, NULL, '1', '1', 0),
(518, 3, 353, '0', '2020-04-10 12:58:52', '2020-04-10 12:58:52', 1, 'edpkuVCHFdzL1b5BRgTU3MqzBPeK6Piy7zcDFyg9QGJifDuh31dKXt', NULL, 'tz1R9K53M5B4dXPSFKCx8zjaCE6VRSqu7tQW', NULL, '1', '1', 0),
(519, 1, 354, '0', '2020-04-10 21:00:10', '2020-04-10 21:00:10', 1, NULL, NULL, '1C5m5M42SWQz1y7dTbPRQKefw3zqhLCh4j', NULL, '1', '1', 0),
(520, 3, 354, '0', '2020-04-10 21:00:23', '2020-04-10 21:00:23', 1, 'edpkuTJFrouqxKhW4TRK7XGn38FUXQ66uR31ghSUoLeWmPj3ejjbrD', NULL, 'tz1a24Wo5S1yG5EjGT96hVYPHsgm2gwyfd2K', NULL, '1', '1', 0),
(521, 1, 355, '0', '2020-04-14 11:41:53', '2020-04-14 11:41:53', 1, NULL, NULL, '14xPeKbfvRCBEWt6qdTXcZCZqGt1ZHSyRu', NULL, '1', '1', 0),
(522, 3, 355, '0', '2020-04-14 11:41:59', '2020-04-14 11:41:59', 1, 'edpkuDbZQ9dfcYCQETN2zc2kZYRtUWhY7kQdWYeiNvrkfeLx3RdTpm', NULL, 'tz1XhfyUnNv1oREMGWHTpsyggyKqXCwfC6wu', NULL, '1', '1', 0),
(523, 1, 356, '0', '2020-04-15 07:59:52', '2020-04-15 07:59:52', 1, NULL, NULL, '13G6NxGyhJmf7mTuq7Xk1gdoBSodqu2VuC', NULL, '1', '1', 0),
(524, 3, 356, '0', '2020-04-15 08:00:02', '2020-04-15 08:00:02', 1, 'edpkufobAhh2DmwtoHfQuRgEuD6EMpsgQtdkkdgbCypa2YJqj7CL6p', NULL, 'tz1ihXAb1Y4mGZXb9nTUCpdarAVSSE5v9xst', NULL, '1', '1', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wallets_type`
--

CREATE TABLE `wallets_type` (
  `wallettype_id` int(11) NOT NULL,
  `wallet_desc` varchar(255) DEFAULT NULL,
  `Code` varchar(3) NOT NULL,
  `Fiat` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wallets_type`
--

INSERT INTO `wallets_type` (`wallettype_id`, `wallet_desc`, `Code`, `Fiat`) VALUES
(1, 'Bcoin', 'BTC', 0),
(2, 'Stellar', 'XLM', 0),
(3, 'Tezos', 'XTZ', 0),
(4, 'FCFA', 'XFA', 1);

-- --------------------------------------------------------

--
-- Structure de la table `wallet_status`
--

CREATE TABLE `wallet_status` (
  `wallet_status_code` int(11) NOT NULL,
  `wallet_status_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addmoney`
--
ALTER TABLE `addmoney`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Index pour la table `add_source_type`
--
ALTER TABLE `add_source_type`
  ADD PRIMARY KEY (`add_source_type_id`);

--
-- Index pour la table `appfees`
--
ALTER TABLE `appfees`
  ADD PRIMARY KEY (`appfees_id`);

--
-- Index pour la table `appservices`
--
ALTER TABLE `appservices`
  ADD PRIMARY KEY (`appservices_id`);

--
-- Index pour la table `bilresponse`
--
ALTER TABLE `bilresponse`
  ADD PRIMARY KEY (`transactionId`);

--
-- Index pour la table `blockeduser`
--
ALTER TABLE `blockeduser`
  ADD PRIMARY KEY (`blockeduser_id`);

--
-- Index pour la table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `buyorder`
--
ALTER TABLE `buyorder`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `buyrescue`
--
ALTER TABLE `buyrescue`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `buyrescue1`
--
ALTER TABLE `buyrescue1`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`City_id`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Country_id`);

--
-- Index pour la table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_code`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customers_id`);

--
-- Index pour la table `orderbook`
--
ALTER TABLE `orderbook`
  ADD PRIMARY KEY (`order_id`);

--
-- Index pour la table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`orderstatus_id`);

--
-- Index pour la table `orderstatushistory`
--
ALTER TABLE `orderstatushistory`
  ADD PRIMARY KEY (`orderstatushistory_id`);

--
-- Index pour la table `ordertype`
--
ALTER TABLE `ordertype`
  ADD PRIMARY KEY (`ordertype_id`);

--
-- Index pour la table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`partners_id`);

--
-- Index pour la table `partnerstype`
--
ALTER TABLE `partnerstype`
  ADD PRIMARY KEY (`partnerstype_id`);

--
-- Index pour la table `partners_branches`
--
ALTER TABLE `partners_branches`
  ADD PRIMARY KEY (`branch_id`);

--
-- Index pour la table `ref_branch_types`
--
ALTER TABLE `ref_branch_types`
  ADD PRIMARY KEY (`branch_type_code`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Index pour la table `transactions_type`
--
ALTER TABLE `transactions_type`
  ADD PRIMARY KEY (`transaction_type_id`);

--
-- Index pour la table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Index pour la table `wallets_type`
--
ALTER TABLE `wallets_type`
  ADD PRIMARY KEY (`wallettype_id`);

--
-- Index pour la table `wallet_status`
--
ALTER TABLE `wallet_status`
  ADD PRIMARY KEY (`wallet_status_code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addmoney`
--
ALTER TABLE `addmoney`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT pour la table `add_source_type`
--
ALTER TABLE `add_source_type`
  MODIFY `add_source_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `appfees`
--
ALTER TABLE `appfees`
  MODIFY `appfees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `appservices`
--
ALTER TABLE `appservices`
  MODIFY `appservices_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `blockeduser`
--
ALTER TABLE `blockeduser`
  MODIFY `blockeduser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `buy`
--
ALTER TABLE `buy`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT pour la table `buyrescue`
--
ALTER TABLE `buyrescue`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `City_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `Country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `customers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT pour la table `orderbook`
--
ALTER TABLE `orderbook`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `orderstatus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orderstatushistory`
--
ALTER TABLE `orderstatushistory`
  MODIFY `orderstatushistory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordertype`
--
ALTER TABLE `ordertype`
  MODIFY `ordertype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partners`
--
ALTER TABLE `partners`
  MODIFY `partners_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partnerstype`
--
ALTER TABLE `partnerstype`
  MODIFY `partnerstype_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partners_branches`
--
ALTER TABLE `partners_branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ref_branch_types`
--
ALTER TABLE `ref_branch_types`
  MODIFY `branch_type_code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT pour la table `transactions_type`
--
ALTER TABLE `transactions_type`
  MODIFY `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- AUTO_INCREMENT pour la table `wallets_type`
--
ALTER TABLE `wallets_type`
  MODIFY `wallettype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wallet_status`
--
ALTER TABLE `wallet_status`
  MODIFY `wallet_status_code` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
