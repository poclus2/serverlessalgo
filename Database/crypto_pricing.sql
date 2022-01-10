-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 17 juin 2020 à 17:59
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
-- Structure de la table `crypto_pricing`
--

CREATE TABLE `crypto_pricing` (
  `cryptocode` varchar(255) NOT NULL,
  `usdprice` float DEFAULT NULL,
  `cfaprice` int(255) DEFAULT NULL,
  `usdcfasellprice` int(255) DEFAULT NULL,
  `openingprice` float DEFAULT NULL,
  `dailyprice` float DEFAULT NULL,
  `eurprice` float DEFAULT NULL,
  `Var24h` text,
  `Var7d` text,
  `Var30d` text,
  `Var1y` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `crypto_pricing`
--

INSERT INTO `crypto_pricing` (`cryptocode`, `usdprice`, `cfaprice`, `usdcfasellprice`, `openingprice`, `dailyprice`, `eurprice`, `Var24h`, `Var7d`, `Var30d`, `Var1y`) VALUES
('BTC', 9395, 5486542, 660, NULL, NULL, 8376.4, '-0.0039', '-0.0158', '-0.0653', '-0.1272'),
('XLM', 0.071823, 41, 660, NULL, NULL, 0.06404, '0.0208', '-0.0252', '-0.0092', '-0.4364'),
('XTZ', 2.6042, 1519, 660, NULL, NULL, 2.3205, '0.0072', '-0.0504', '-0.0847', '1.2050');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
