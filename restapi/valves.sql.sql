-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 mars 2023 à 23:16
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `valves`
--

-- --------------------------------------------------------

--
-- Structure de la table `area`
--

CREATE TABLE `area` (
  `Id` int(11) NOT NULL,
  `AreaName` varchar(20) NOT NULL,
  `AreaCode` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stand`
--

CREATE TABLE `stand` (
  `Id` int(11) NOT NULL,
  `StandName` varchar(20) NOT NULL,
  `StandCode` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tier`
--

CREATE TABLE `tier` (
  `Id` int(11) NOT NULL,
  `TierNum` varchar(4) NOT NULL,
  `ZoneNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `valve`
--

CREATE TABLE `valve` (
  `Id` int(11) NOT NULL,
  `ValveNum` int(11) NOT NULL,
  `TierId` int(11) NOT NULL,
  `AreaCode` varchar(11) NOT NULL,
  `StandCode` varchar(11) NOT NULL,
  `Location` text NOT NULL,
  `DrainTierNum` varchar(11) NOT NULL,
  `BleedTierNum` varchar(11) NOT NULL,
  `ValveType` varchar(20) NOT NULL,
  `TierCode` varchar(11) NOT NULL,
  `FullDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `valve`
--

INSERT INTO `valve` (`Id`, `ValveNum`, `TierId`, `AreaCode`, `StandCode`, `Location`, `DrainTierNum`, `BleedTierNum`, `ValveType`, `TierCode`, `FullDescription`) VALUES
(1, 121, 0, 'Bath9', 'Lavs', 'Unit 1802 MBR above shower', '2703', '2705', 'HWR', '2704', '2704 Bath9 Lavs'),
(2, 121, 0, 'Bath1', 'Lavs', 'Unit 1802 MBR above shower', '', '', 'CWR', '2704', '2704 Bath1 Lavs'),
(3, 113, 0, 'Bath3', 'Lavs', 'Est corridor @ Unit 1803 entrance', '0', '0', 'HWR', '2703', '2703 Bath3 Lavs'),
(4, 121, 0, 'Bath1', 'Lavs', 'Unit 1802 MBR above Lavs', '2704', '2705', 'WR', '2704', '2704 Bath1 Lavs'),
(5, 122, 0, 'Bath2', 'Lavs', 'Unit 1802 MBR above shower', '', '', 'CW', '2703', ''),
(6, 125, 0, 'kitchen', 'lavs', 'under lavs', '', '', 'cw', '2300', '2300 kitchen lavs'),
(8, 123, 0, '0123', 'kitchen', 'under lab', '', '', 'cv', '0123', '0123 0123 kitchen'),
(9, 789, 0, '0456', 'lav', 'under laundrey', '', '', 'CV', '1235', '1235 0456 lav'),
(10, 456, 0, 'fag', 'lavs', 'under lavs', '', '', 'CW', '4566', '4566 fag lavs');

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `Id` int(11) NOT NULL,
  `ZoneNum` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `valve`
--
ALTER TABLE `valve`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `valve`
--
ALTER TABLE `valve`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
