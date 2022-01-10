-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 22 Novembre 2019 à 15:47
-- Version du serveur :  10.1.43-MariaDB-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Contenu de la table `addresses`
--

INSERT INTO `addresses` (`address_id`, `Line1`, `Line2`, `City_id`, `Postcode`, `State`, `Country_id`, `Other_details`) VALUES
(183, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(184, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(185, '1', '1', NULL, NULL, 'NULL', 2, 'NULL'),
(186, '1', '1', NULL, NULL, 'NULL', 2, 'NULL'),
(187, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(188, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(189, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(190, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(191, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(192, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(193, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(194, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(195, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(196, '1', '1', NULL, NULL, 'NULL', 2, 'NULL'),
(197, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(198, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(199, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(200, '1', '1', NULL, NULL, 'NULL', 1, 'NULL'),
(201, '1', '1', NULL, NULL, 'NULL', 1, 'NULL');

-- --------------------------------------------------------

--
-- Structure de la table `buy`
--

CREATE TABLE `buy` (
  `transaction_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `receiveaddress` varchar(34) NOT NULL,
  `amount` float NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `statut` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Contenu de la table `country`
--

INSERT INTO `country` (`Country_id`, `Country_name`) VALUES
(1, 'cameroon'),
(2, 'france'),
(3, 'indonesia'),
(4, 'usa'),
(5, 'germany'),
(6, 'china'),
(7, 'india');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `crypto_pricing`
--

INSERT INTO `crypto_pricing` (`cryptocode`, `usdprice`, `cfaprice`, `usdcfasellprice`, `openingprice`, `dailyprice`, `eurprice`) VALUES
('BTC', 9432.3, 5561278, 660, NULL, NULL, 8490.5),
('XLM', 0.06578, 39, 660, NULL, NULL, 0.059107),
('XTZ', 0.8793, 521, 660, NULL, NULL, 0.7947);

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
  `login` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `receiveaddress` varchar(36) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `pincode` varchar(64) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `balance_cfa` int(11) NOT NULL,
  `balance_xtz` float NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `mobilephone` varchar(20) NOT NULL,
  `accountlock` int(1) DEFAULT NULL,
  `connectiontry` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `customers`
--

INSERT INTO `customers` (`customers_id`, `lastname`, `firstname`, `birthdaydate`, `login`, `email`, `receiveaddress`, `password`, `pincode`, `create_time`, `balance_cfa`, `balance_xtz`, `address_id`, `status_id`, `mobilephone`, `accountlock`, `connectiontry`) VALUES
(184, 'NULL', 'NULL', '2015-01-01', 'sultan', 'sokoudjousinclair@gmail.com', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '9baed8fceea6e36d36670d72429d909547165efc038c293a14a41ef2edf83141', '2019-11-18 22:21:20', 0, 0, 200, 1, ' 237697706983', 0, 0),
(185, 'NULL', 'NULL', '2015-01-01', 'Mick', 'mikhaelkamdem45@gmail.com', NULL, 'bbb59da3af939f7af5f360f2ceb80a496e3bae1cd87dde426db0ae40677e1c2c', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-11-20 14:39:44', 0, 0, 201, 1, ' 237691679994', 0, 0),
(183, 'NULL', 'NULL', '2015-01-01', 'lesoft', 'jephtejosoin@gmail.com', NULL, '6e846ed543c07d6d7183e018b2dc54b582f3db08897bd2c5c97996228f2c4ba9', 'a48622b535728587fd351763d1296c7ec9cb5bc6743d5f22b011d5b5c3ef688f', '2019-11-18 10:51:31', 0, 0, 199, 1, ' 237695498084', 0, 0),
(182, 'NULL', 'NULL', '2015-01-01', 'abcd', 'rxplus2018rxplus2018@gmail.com', NULL, 'fcb43e0536ea067a051a11d4a37135bd328d836bd5f416178bb970d356a0352a', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0', '2019-10-28 14:51:32', 0, 0, 198, 1, ' 16502530000', 0, 0),
(181, 'NULL', 'NULL', '2015-01-01', 'loba3001', 'ferdinandndame2017@gmail.com', NULL, 'be0941243161f85bf520c60009e07ff7d38ec42d7888a27c19cebc8984a6bbbe', NULL, '2019-10-04 18:37:23', 4700, 0, 197, 1, ' 237693652545', 0, 0),
(180, 'NULL', 'NULL', '2015-01-01', 'Loba3006', 'lobacm3006@gmail.com', NULL, '0080e59ae9dcf22d82caa563e6ee040eebb206cec06678916f3dab241a2843b0', NULL, '2019-10-04 18:33:21', 0, 0, 196, 1, ' 237699531279', 0, 0),
(179, 'NULL', 'NULL', '2015-01-01', 'Yetyet', 'mathieuyetnayetna@gmail.com', '1HXhbit4gtjyA5tY4KjfsaPEKc24XSARag', 'b2507f6a345081331f657d2d9190be57b52edc7b41c2b5da0260a04a3bf83653', NULL, '2019-10-04 17:46:10', 0, 0, 195, 1, ' 237694307912', 0, 0),
(178, 'NULL', 'NULL', '2015-01-01', 'ones64', 'onestcheuffa@gmail.com', '19T5HwCLANa66B2E88e2F9VDYnTiazY4M2', '40e4f742b97578f9b4a5114e1a1402a0a3223b66f97c14cc6655a9bd6e92155b', 'cdea47d1c69644ca19616c34e1e1387956fa6b987c24f5c094ac1ba5f998805f', '2019-09-23 08:06:09', 0, 0, 194, 1, ' 237694884311', 0, 0),
(177, 'NULL', 'NULL', '2015-01-01', 'Nguedia', 'nguedia.bernis@gmail.com', NULL, '972cff2ea4bf71006809d9fa846408e536bd07c1f278930b55584e96f4460495', '61f4a24677e07919033f02398ced57278bae7c0a475a54af9128d142577536cb', '2019-09-22 21:59:54', 0, 0, 193, 1, ' 237661000064', 0, 0),
(176, 'NULL', 'NULL', '2015-01-01', 'thierry237', 'th.bayombi@gmail.com', NULL, '26039296dd882ed2a433776260e9b70d1de7b6afe96f2907de85ec9c7cd610e6', '8e9b669109df89620b94f2387dc53206a82ddc71d658f8f7a2b3a9b417370d3e', '2019-09-22 17:08:09', 0, 0, 192, 1, ' 237653796421', 0, 0),
(175, 'NULL', 'NULL', '2015-01-01', 'IamNV', 'nguemnev@gmail.com', '18SX6qXtKEpvm1ss68Awu6jDe5BitCJEBN', '22652e77e046e42b997029bc8e0b923e418b5bcff5e0ad970ad3408d98ab228c', 'a6266efa66a73664d6f5c8d971863a81c72d1f2fd69497d56b34ae459ffac66c', '2019-09-22 16:43:22', 0, 0, 191, 1, ' 237691980189', 0, 0),
(174, 'NULL', 'NULL', '2015-01-01', 'Ghislain', 'nglanore@gmail.com', '19XFJx2BJheLmbLoDZ9e52dHGf2D7rgXup', 'a18e76656a025e6cafa7964ac19f09f981f503aa7499b5a23352e15243366a3f', '25a3779081c60340e544523e74fa3851b1838423bf83317282a87d9580fbacc2', '2019-09-22 16:00:20', 0, 0, 190, 1, ' 237697461971', 0, 0),
(161, 'NULL', 'NULL', '2015-01-01', 'greazzd', 'dcsq@dza.cd', '1P6nNt6TBXHkndbZXYMurrNVBvqaftuiAS', 'bbb59da3af939f7af5f360f2ceb80a496e3bae1cd87dde426db0ae40677e1c2c', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-09-15 03:53:27', 0, 0, 183, 1, ' 237677889999', 0, 0),
(173, 'NULL', 'NULL', '2015-01-01', 'ejara4', 'fradithjeune2@gmail.com', '1CZkwKYogSjhbPjqGbdVyfuCnejF4jRbbq', 'a23a708a77c540a62c270a554c5b4e64f25356592cd7734238c705982396aa12', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-09-17 21:47:11', 0, 0, 189, 1, ' 237653919163', 0, 0),
(172, 'NULL', 'NULL', '2015-01-01', 'baptiste8', 'batfromparis@gmail.com', '14U3BQToa8DDtfgYvH7BWELsdkWWd2Ejsj', '2efe91c57fd9ed5a68e236d7cf6b34b8a18d0459c4cbd1664044b212cc581989', '24075b270335ddb25b5f3f0fa8d9657f7a39df829ce9fa262f40a41a8758d21c', '2019-09-17 21:05:02', 0, 0, 188, 1, ' 33611080842', 0, 0),
(171, 'NULL', 'NULL', '2015-01-01', 'chakanel', 'nchatue@gmail.com', '1CrEdDTSvNYnFyn2Pszz9cnMnb7Urk6TC3', 'f11e89178ca88f44e5def8e8e3b9a14d9c2293350277aead066d8c538c38cfe4', 'abd3f2ed90f684b305ed7632ee24e58ed439de9158399ce9a5952281ef804b43', '2019-09-17 13:39:29', 0, 0, 187, 1, ' 33616976114', 0, 0),
(167, 'NULL', 'NULL', '2015-01-01', 'azdazdd', 'ccsq@azd.we', '1EN2v2KqRCSUJeRXnGP3mvrYb9WaAicxs8', 'bbb59da3af939f7af5f360f2ceb80a496e3bae1cd87dde426db0ae40677e1c2c', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2019-09-15 11:09:41', 0, 0, 184, 1, ' 237699998888', 0, 0),
(169, 'NULL', 'NULL', '2015-01-01', 'ejara3', 'fradithjeune@gmail.com', NULL, 'a23a708a77c540a62c270a554c5b4e64f25356592cd7734238c705982396aa12', NULL, '2019-09-16 12:45:21', 0, 0, 185, 1, ' 237678642424', 0, 0),
(170, 'NULL', 'NULL', '2015-01-01', 'abdel', 'abdel@nzinghaa.io', '1JVgtenfifsZocotu6wXnjB7vn9fhuRpeY', 'be0941243161f85bf520c60009e07ff7d38ec42d7888a27c19cebc8984a6bbbe', 'e8743787bbef7d5ffb65a3a13f7c51a90b3ce8b263b94b7bb3aeb7d35b7fa1ad', '2019-09-16 14:35:46', 0, 0, 186, 1, ' 237655867729', 0, 0);

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
  `B_orderid` int(11) NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `A_walletid` int(11) NOT NULL,
  `B_walletid` int(11) NOT NULL,
  `namereceiver` varchar(255) DEFAULT NULL,
  `receiveaddress` varchar(34) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `transaction_note` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `A_orderid`, `A_amount`, `A_commission`, `transaction_date`, `B_amount`, `B_commission`, `B_orderid`, `wallettype_id`, `A_walletid`, `B_walletid`, `namereceiver`, `receiveaddress`, `phonenumber`, `transaction_note`) VALUES
(90, 171, 200000, 0, '2019-11-16 18:56:10', 0, 0, 170, 3, 150, 151, NULL, NULL, NULL, 'Satoshi'),
(89, 172, 1000000, 0, '2019-11-06 01:23:44', 0, 0, 0, 3, 153, 0, 'External', 'tz1ZvZvALLkqkaxEN4KtrjiYzXDppYHo4r', 'null', 'Satoshi'),
(88, 170, 200000, 0, '2019-11-05 17:24:59', 0, 0, 0, 3, 150, 0, 'External', 'tz1VKS4zHZ1A4VxAC1xTVc1GqhZCLznkHQ', 'null', 'Satoshi'),
(85, 173, 1000000, 0, '2019-09-23 00:25:06', 0, 0, 0, 3, 155, 0, 'External', 'tz1ei9DQtjJNZZaGok4RZ9QQki1U3oBiop', 'null', 'Satoshi'),
(87, 170, 1000000, 0, '2019-10-04 18:51:30', 0, 0, 0, 3, 150, 0, 'External', 'tz1Q1E69U8paLUNCn25orXykrrYPsiDsAw', 'null', 'Satoshi'),
(84, 171, 1000000, 0, '2019-09-22 22:07:10', 0, 0, 0, 3, 151, 0, 'External', 'tz1V17QeZkpk9FcYfDuDNApZUMthZ5GFEP', 'null', 'Satoshi'),
(83, 171, 2800000, 0, '2019-09-22 21:01:05', 0, 0, 0, 3, 151, 0, 'External', 'tz1ZvZvALLkqkaxEN4KtrjiYzXDppYHo4r', 'null', 'Satoshi'),
(82, 171, 5000000, 0, '2019-09-22 20:57:50', 0, 0, 0, 3, 151, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(81, 170, 1000000, 0, '2019-09-22 18:45:14', 0, 0, 0, 3, 150, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(80, 170, 400000, 0, '2019-09-22 18:34:35', 0, 0, 0, 3, 150, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(79, 170, 500000, 0, '2019-09-22 18:25:27', 0, 0, 0, 3, 150, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(78, 171, 5000000, 0, '2019-09-22 18:10:27', 0, 0, 0, 3, 151, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(77, 170, 500000, 0, '2019-09-22 18:08:39', 0, 0, 0, 3, 150, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(76, 171, 1000000, 0, '2019-09-22 16:28:29', 0, 0, 0, 3, 151, 0, 'External', 'tz1ei9DQtjJNZZaGok4RZ9QQki1U3oBiop', 'null', 'Satoshi'),
(75, 171, 1000000, 0, '2019-09-22 14:13:28', 0, 0, 0, 3, 151, 0, 'External', 'tz1ZvZvALLkqkaxEN4KtrjiYzXDppYHo4r', 'null', 'Satoshi'),
(74, 170, 1470000, 0, '2019-09-22 13:26:01', 0, 0, 0, 3, 150, 0, 'External', 'tz1NWbumYbDtue5RYURYCX2VfXPgCxjzG4', 'null', 'Satoshi'),
(73, 171, 1000000, 0, '2019-09-22 13:12:12', 0, 0, 0, 3, 151, 0, 'External', 'tz1ZvZvALLkqkaxEN4KtrjiYzXDppYHo4r', 'null', 'Satoshi'),
(72, 170, 200000, 0, '2019-09-22 13:08:33', 0, 0, 0, 3, 150, 0, 'External', 'tz1NWbumYbDtue5RYURYCX2VfXPgCxjzG4', 'null', 'Satoshi'),
(71, 171, 5000000, 0, '2019-09-22 12:54:55', 0, 0, 0, 3, 151, 0, 'External', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4e', 'null', 'Satoshi'),
(70, 173, 5000000, 0, '2019-09-22 12:48:01', 0, 0, 171, 3, 155, 156, NULL, NULL, NULL, 'Satoshi'),
(69, 170, 200000, 0, '2019-09-22 12:05:18', 0, 0, 0, 3, 150, 0, 'External', 'tz1VKS4zHZ1A4VxAC1xTVc1GqhZCLznkHQ', 'null', 'Satoshi'),
(68, 161, 200, 0, '2019-09-22 11:59:24', 0, 0, 0, 3, 137, 0, 'External', 'tz1VKS4zHZ1A4VxAC1xTVc1GqhZCLznkHQ', 'null', 'Satoshi'),
(67, 161, 1000, 0, '2019-09-22 10:38:55', 0, 0, 170, 3, 137, 138, NULL, NULL, NULL, 'Satoshi'),
(66, 161, 1000, 0, '2019-09-22 10:31:03', 0, 0, 170, 3, 137, 138, NULL, NULL, NULL, 'Satoshi'),
(65, 161, 1000, 0, '2019-09-22 09:52:22', 0, 0, 0, 3, 137, 0, 'External', 'tz1VKS4zHZ1A4VxAC1xTVc1GqhZCLznkHQ', 'null', 'Satoshi'),
(64, 173, 480000, 0, '2019-09-19 21:13:39', 0, 0, 0, 1, 155, 0, 'External', '18SX6qXtKEpvm1ss68Awu6jDe5BitCJEBN', 'null', 'Satoshi'),
(86, 170, 1200000, 0, '2019-10-04 17:58:08', 0, 0, 0, 3, 150, 0, 'External', 'tz1VpabG3fhKw8aGDP6gXNTxmGjQQJtwRr', 'null', 'Satoshi');

-- --------------------------------------------------------

--
-- Structure de la table `transactions_type`
--

CREATE TABLE `transactions_type` (
  `transaction_type_id` int(11) NOT NULL,
  `transaction_type_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `transactions_type`
--

INSERT INTO `transactions_type` (`transaction_type_id`, `transaction_type_desc`) VALUES
(1, 'Send BTC');

-- --------------------------------------------------------

--
-- Structure de la table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(11) NOT NULL,
  `wallettype_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `wallet_date_creation` timestamp NULL DEFAULT NULL,
  `wallet_update_time` timestamp NULL DEFAULT NULL,
  `wallet_status_code` int(11) NOT NULL,
  `public_key_xtz` text NOT NULL,
  `private_key_xtz` text NOT NULL,
  `public_key_hash_xtz` text NOT NULL,
  `seed_xtz` text NOT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `frozenbalance` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wallet`
--

INSERT INTO `wallet` (`wallet_id`, `wallettype_id`, `customer_id`, `balance`, `wallet_date_creation`, `wallet_update_time`, `wallet_status_code`, `public_key_xtz`, `private_key_xtz`, `public_key_hash_xtz`, `seed_xtz`, `currency_code`, `frozenbalance`) VALUES
(182, 3, 185, '0', '2019-11-20 14:39:53', '2019-11-20 14:39:53', 1, 'edpkuu59CF8L3XozB7JD8CoKDGYn8ptF4XdAeacKcXsS4i9br9HbtD', 'edskRqU1QN3yCGxNVgNUFXdMW3MEKQHgsdMWMTauUHUXQaacYZ2BiwtJQwt5bEab4hSPFKDdSsekFT2ir8F2dFFHn8rMoEo276', 'tz1RQgpBs3naM6fVdXqfmejoNosZXJwUFyve', 'salad planet toilet demise depend impulse essay distance boy dwarf garment aspect friend miss crush voyage diesel crime weapon wasp exhaust ceiling vintage know', '1', '1'),
(181, 1, 185, '0', '2019-11-20 14:39:44', '2019-11-20 14:39:44', 1, '', '', '', '', '1', '1'),
(180, 3, 184, '0', '2019-11-18 22:21:27', '2019-11-18 22:21:27', 1, 'edpkv32vpzYSnjZHegLTThwZNEUPrUbzxjfkid4cgqNp3BMYZCJ1TC', 'edskS45orfJKcTzQz94kMEsZo3ps9wmEv7ds9kuUsG7W6VCpVLKpjAhDGykJRAcGKiUFaHZ6PTyh2Z6dLRRq7EL4iT9L2z9VuC', 'tz1LopYDWSKtvrdxxtmXHTMJ1rWUxAVZA5HM', 'gate degree topple come change audit speed priority index struggle unknown rapid stairs blur seat actress swear toddler face equip strong wrestle album decade', '1', '1'),
(179, 1, 184, '0', '2019-11-18 22:21:20', '2019-11-18 22:21:20', 1, '', '', '', '', '1', '1'),
(178, 3, 183, '0', '2019-11-18 10:51:35', '2019-11-18 10:51:35', 1, 'edpkuU1kkxrxiA2pqmingX5cWepm9NfhWLQqDPnTQPbn3Dg5uH5gJG', 'edskRkiC4NdCXQ8DfRFHwJrgBHpwUEtBQ59j3KSVx842Rw5LLhdDcBwPqvxi3A86vsAuc7Jgk4vUxSts3SnsaXRkvy84ZyzSeg', 'tz1f286HwmMbU1QurEk8u9TPaj2wrf8q2Mm1', 'few peasant dust ivory pelican miss success mosquito life image village project oil spoon exit lava topic volume novel betray weapon flash wine emotion', '1', '1'),
(177, 1, 183, '0', '2019-11-18 10:51:31', '2019-11-18 10:51:31', 1, '', '', '', '', '1', '1'),
(176, 3, 182, '0', '2019-10-28 14:51:55', '2019-10-28 14:51:55', 1, 'edpktgDu5GZq1d1JzXTk15uUo1n39qd29gQTvmeigDjKdDdKU8vefk', 'edskSASvaU1ZaEz5GmAA7j7eQEjw4KyuakJj1n59nZZSyP5YTETtsnhyCzgQcyAq5f582W4zeRnZvKuucyU5Jrg321QcDRZXgj', 'tz1ijvDrqJjue4622HD4iSd8saDyVhJ89fow', 'churn open rice parent panther dry scan lend minute saddle jaguar coffee fatal lumber fee tube vehicle admit female invite device staff message agree', '1', '1'),
(175, 3, 182, '0', '2019-10-28 14:51:41', '2019-10-28 14:51:41', 1, 'edpkuBrYrK9YCf9ZYqpuwnkLXTUpRj8WqN4Fkdf3zgUdXxvk9U5shC', 'edskRgbsMWGt2DtPFPHhT189PfDRRBEJGEPrUBM3qQekeaWrmvUyuEW7kc3e3FwRvnjq8tAvGW87bBq2Vb3myzNBLSvBi8vcmY', 'tz1UDiWNt2V4FeMWbuQKbpH5wEFJLNy4GYWG', 'gift panther kit series unique teach melody toy height viable planet balance arrest media evidence clown mountain response scan race gospel scout visa above', '1', '1'),
(174, 1, 182, '0', '2019-10-28 14:51:32', '2019-10-28 14:51:32', 1, '', '', '', '', '1', '1'),
(173, 3, 181, '0', '2019-10-04 18:37:26', '2019-10-04 18:37:26', 1, 'edpkv6VjfoyBtuoyjT1uyN2S1DLnzXEqyDQVX2GUcZ4UVuw5RFhDMH', 'edskSAmW6v6cFHMXjXmCr6MXcnjjGp4kHsCjNmMmPr4v2b3P5mdPDVoFXF8GHpmbGxRwpoQeqt2dPwsFxo3Bg1p767BEb86xev', 'tz1Q1E69U8paLUNCn25orXykrrYPsiDsAwDT', 'genius update mother problem satoshi degree like south toss roof hill pet electric emerge donate answer mobile sudden noise about blossom case pretty design', '1', '1'),
(172, 1, 181, '0', '2019-10-04 18:37:23', '2019-10-04 18:37:23', 1, '', '', '', '', '1', '1'),
(171, 3, 180, '0', '2019-10-04 18:33:51', '2019-10-04 18:33:51', 1, 'edpktzX7zXxQYqsz5gZCieavPz1STyWAgsDtLy2RGje6o9AN4EpzTJ', 'edskRtfJY1BwnjY54zKKGFK6izhPwGpAJ5njcA4FPfUyQbo3Vct7EaTM4byiYNCGJ2gJqNCa6psTnHPvzhw2SHh2p3VbwkpetY', 'tz1NHb3hg12bx4DXLrruURS2dh72j1b3Vt7M', 'club comfort bamboo vehicle indoor female follow romance endless impact nice truly vote that twin trim rail world expand modify palm duty twin hedgehog', '1', '1'),
(170, 1, 180, '0', '2019-10-04 18:33:21', '2019-10-04 18:33:21', 1, '', '', '', '', '1', '1'),
(169, 3, 179, '0', '2019-10-04 17:46:30', '2019-10-04 17:46:30', 1, 'edpku4K924NZsBdUKvqKtHWxEQcLw2uYpLr6iKDZndVZUbFVqEsq4x', 'edskRvT3hcr8CeypnXcrAVM278ny6X2PzAFN4Y2TDMUMAgr4dRjBpHpEP1JSnevgrAeZ3Brdv7kcbpBdNvoeAc9axKD9nw8QoN', 'tz1VpabG3fhKw8aGDP6gXNTxmGjQQJtwRrRX', 'blanket staff depend monitor cinnamon rural ecology narrow shell milk feel idle biology virus rice van bird dismiss height enact they enter fluid field', '1', '1'),
(168, 1, 179, '0', '2019-10-04 17:46:10', '2019-10-04 17:46:10', 1, '', '', '', '', '1', '1'),
(167, 3, 178, '0', '2019-09-23 08:07:27', '2019-09-23 08:07:27', 1, 'edpkuPYAS4oBzpikrNF9J44SoFamiSZ9CubBL5fRPsECqCG7g3gBc8', 'edskRukvZPEg7G5Uv72EwYNJ9sMRewbjDdutWqBnRkG4qsHdFQakzEAdYyULW4whkwUPhC6XsGghn735wruJu9kVimPwAsyzvw', 'tz1irAtytUkMzVU7Kuo6DtqD7ApKKpGkKUrR', 'bachelor lens cost search emotion suffer cave depend submit profit hamster enemy ritual crime crawl man fun thought ticket snow nation tree beauty erupt', '1', '1'),
(166, 1, 178, '0', '2019-09-23 08:06:09', '2019-09-23 08:06:09', 1, '', '', '', '', '1', '1'),
(164, 1, 177, '0', '2019-09-22 21:59:54', '2019-09-22 21:59:54', 1, '', '', '', '', '1', '1'),
(165, 3, 177, '0', '2019-09-22 22:00:22', '2019-09-22 22:00:22', 1, 'edpktkNhMnq5PrZ9ExQa7NVpxF98EF9TP8D3adiR2G3aBxamgiZr2S', 'edskS59Ujb4Wq9DufxM1DL49cxYp4ZXgro5nKFndjW2gvDxRhm9ww8mZrj2WSSVj4E3fQVqDjf1skcVzdnUogr3T31j4Ap3JhJ', 'tz1V17QeZkpk9FcYfDuDNApZUMthZ5GFEPb2', 'menu dawn earn alarm remove essence acid combine beyond sleep bridge story park explain stem stamp teach vague fatal border vanish cigar solar boost', '1', '1'),
(162, 1, 176, '0', '2019-09-22 17:08:09', '2019-09-22 17:08:09', 1, '', '', '', '', '1', '1'),
(163, 3, 176, '0', '2019-09-22 17:08:19', '2019-09-22 17:08:19', 1, 'edpkunYZbStyoWgB2NpZUWUtaqBkVSc8rvEvpT9WaZzCg4uvnzTbK2', 'edskS3hLgwoZYnYH29YfjmNLP7v1htd6ZHtXQx5yKudLBmg9ZGZ7ugEEZ7Zxd7tSiQ55NuFCPTh91P5nTytq3aJFZWETusmEkf', 'tz1d235t9SL69gjQnvaSRuxZCNcFUH3Z433C', 'tower bonus large daring suspect arrow middle party ritual resource allow attract relax wood jealous steel blade little title bus fever three tank giraffe', '1', '1'),
(160, 1, 175, '0', '2019-09-22 16:43:22', '2019-09-22 16:43:22', 1, '', '', '', '', '1', '1'),
(161, 3, 175, '0', '2019-09-22 16:43:41', '2019-09-22 16:43:41', 1, 'edpkvXmESgpJypxiPe2rFzdxt3RgC3nn6LMQUwN4GSftL5VPw3JZcc', 'edskRdr1qCfoyaxjt8cXANsbqCTRQswyX5wp9PvvNjnFY8mNCsfNsG9dSCVhm7BJwvECQVVddhuUi2T61SxzQw3b6JQuUSxLxb', 'tz1LtinC7yGs1o1dFwnqSUt33hq9AZDQMuHU', 'share soccer space omit crystal melt unable tragic exercise income tiger recycle typical camp capable exotic chair matrix sausage net twelve ghost wild spin', '1', '1'),
(159, 3, 174, '0', '2019-09-22 16:03:13', '2019-09-22 16:03:13', 1, 'edpktmoS15Nqn9u45ChSGzmYBdGbPoXdJMHk62i1ZwSVU3xbsHHuSr', 'edskRqRVU6qpMhdsPmsKLKNFdz9YAo3cQu9ZG5iWHAQj4Hnojq5GCJ855ZpA6zGW9utEPwAJSLcmRApfTyEzrtVSPECpd9J81t', 'tz1ei9DQtjJNZZaGok4RZ9QQki1U3oBiopUw', 'chase solve wine foot relax today sphere piece seek subject cattle episode alarm denial collect always zero supply tongue bracket melt force sting power', '1', '1'),
(157, 1, 174, '0', '2019-09-22 16:00:20', '2019-09-22 16:00:20', 1, '', '', '', '', '1', '1'),
(158, 3, 174, '0', '2019-09-22 16:00:36', '2019-09-22 16:00:36', 1, 'edpkv86t75uzehrAhm5MMQtMtqa1V3GAudyTFLxVvR2oLhuyhFM38Z', 'edskS7mLaL65d4PndmB4kbqbmooKJp7m5qWahFMGmPin5fau8uLZbPyKgAoh8Z25goiSZ831BYRBhuVHTV3gRsiyeJsnaXz1HX', 'tz1Socjc7yhnngxx96qT8LGZBg977eJPnHmJ', 'feel rail minor giggle model swamp car glide fashion twist key female kiwi rib false manage roast toddler stamp duty hint spawn forest fog', '1', '1'),
(155, 1, 173, '0', '2019-09-17 21:47:11', '2019-09-17 21:47:11', 1, '', '', '', '', '1', '1'),
(156, 3, 173, '0', '2019-09-17 21:47:26', '2019-09-17 21:47:26', 1, 'edpkvXeZRe4XADjcsdDcWZVDi3ZbUJ4STUQeWb1PrEwwKyt4KSBKGr', 'edskRmcaP9JYQMBhQ8HFLVd7iZsDty2BFgD8vBJNFco7FZ3rcH2u5J5tcpUDJ2n6ufYew4eXUHqAmvtNXwawzod9EA9B8bJVmq', 'tz1V3sUY3HcrLEfU75fBQgCjXJaPQMGv4ehT', 'enough zoo circle wood allow airport dirt choice universe spy volcano mind slush garment embark family edit midnight load blanket goddess electric balcony time', '1', '1'),
(137, 1, 161, '0', '2019-09-15 03:53:27', '2019-09-15 03:53:27', 1, '', '', '', '', '1', '1'),
(138, 3, 161, '0', '2019-09-15 03:53:33', '2019-09-15 03:53:33', 1, 'edpkuqkdDWBMhWyQHzn4hddWwFqQUtoSdfTtUxw4KzLRFFQfksqvuP', 'edskRpvJWJsCrgXK5yb7qi9NTp5P9KubwwoLKfYBmXiyCpAkfhpPRX5QHQYY2M5ejhZtnuZXL8YTh8z8FLdtpbK8MvFmWSNVfL', 'tz1Kfm12h5T2usDEyTq13fcgqvZLY4JujNF2', 'pass ticket harbor actor under patch scatter olympic maple fog clay empower trumpet finger solar arrow grape endorse oblige tattoo acoustic ancient happy private', '1', '1'),
(153, 1, 172, '0', '2019-09-17 21:05:02', '2019-09-17 21:05:02', 1, '', '', '', '', '1', '1'),
(154, 3, 172, '0', '2019-09-17 21:05:10', '2019-09-17 21:05:10', 1, 'edpkv5u44GoRvBuGPXPaC8VUgekADFQKy2a8sZM8RhtALL1hrnKhhK', 'edskRk9rgEsECMt49uG22PptZ36YudS6TbBiVZ66MbJWvGB9gurbfY5wzjQZh6DSdaLftG4Qh4ATkcDX3uuAp72ZYXeNiQZNhZ', 'tz1cQmNHf6fR2QUPkP3id7ZNaDLxJiyTyXod', 'fork novel accuse word judge width ranch badge coast general matter ankle raw lake cabin talk refuse evidence credit pet prize budget game pioneer', '1', '1'),
(145, 1, 167, '0', '2019-09-15 11:09:41', '2019-09-15 11:09:41', 1, '', '', '', '', '1', '1'),
(146, 3, 167, '0', '2019-09-15 11:09:47', '2019-09-15 11:09:47', 1, 'edpkuFSztKdu5Fc7xJMF9sExUSz6LWkdSzxPqcWik3FdiSPKdasroc', 'edskRkoSKjmyKX1GvLCZqx6hjDC5cXkR4ZJe3ghnSnwcuW4d143Nf7AXMxfkBMUy5iNJapD1mpJQ6txq7sh5CwnXgVBYY3Vk2r', 'tz1V5tWZaGkCkuBURLGE8UxfUh8sxWUwQMdJ', 'inspire soda skill decade gun anger pepper note purse cream unusual session drip hair grace home mixture depth duck wife explain aunt auction simple', '1', '1'),
(149, 1, 169, '0', '2019-09-16 12:45:21', '2019-09-16 12:45:21', 1, '', '', '', '', '1', '1'),
(150, 1, 170, '0', '2019-09-16 14:35:46', '2019-09-16 14:35:46', 1, 'edpkvPbcSA76uE31iCiVESZKAseZ4zYYAaTbpzvkvc6ZE1XS1UtPnK', 'edskRohD6piniQtpJf14Q6hW6hFeGYKpXmtkXo74rRmybhzDsfymw46XXiBjEZjghPoKByqNBnG4GYr8C4L5RUvd6k1L6HVZMq', 'tz1ZvZvALLkqkaxEN4KtrjiYzXDppYHo4r5Z', 'wonder gold shoot have soul recall upon goose wrestle minor elephant bonus pen salute cushion cement squirrel bronze convince order measure indicate route visa', '1', '1'),
(151, 1, 171, '0', '2019-09-17 13:39:29', '2019-09-17 13:39:29', 1, '', '', '', '', '1', '1'),
(152, 3, 171, '0', '2019-09-17 13:40:22', '2019-09-17 13:40:22', 1, 'edpkuGNfrPQ8s45uCZMgvKui1hmoKLHFsgo7sC7kNoPFupHoHHtJ9z', 'edskS5YweyXEKiJWg6hzY7RVHPrmRt4cPTk6rokieXioqqCGyLZz5uzfDSEFMky8QrH2z3acqSowoumRzab4m2cyJHKG83GQtS', 'tz1NWbumYbDtue5RYURYCX2VfXPgCxjzG4MM', 'wonder gold shoot have soul recall upon goose wrestle minor elephant bonus pen salute cushion cement squirrel bronze convince order measure indicate route visa', '1', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wallets_type`
--

CREATE TABLE `wallets_type` (
  `wallettype_id` int(11) NOT NULL,
  `wallet_desc` varchar(255) DEFAULT NULL,
  `Code` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wallets_type`
--

INSERT INTO `wallets_type` (`wallettype_id`, `wallet_desc`, `Code`) VALUES
(1, 'Bcoin', 'BTC'),
(2, 'Stellar', 'XLM'),
(3, 'Tezos', 'XTZ');

-- --------------------------------------------------------

--
-- Structure de la table `wallet_status`
--

CREATE TABLE `wallet_status` (
  `wallet_status_code` int(11) NOT NULL,
  `wallet_status_desc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Index pour la table `buy`
--
ALTER TABLE `buy`
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
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT pour la table `buy`
--
ALTER TABLE `buy`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `City_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `Country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_code` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `customers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;
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
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT pour la table `transactions_type`
--
ALTER TABLE `transactions_type`
  MODIFY `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;
--
-- AUTO_INCREMENT pour la table `wallets_type`
--
ALTER TABLE `wallets_type`
  MODIFY `wallettype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `wallet_status`
--
ALTER TABLE `wallet_status`
  MODIFY `wallet_status_code` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
