-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 24 mai 2020 à 15:44
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shoppsy`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `idConsultation` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Prix` int(11) DEFAULT NULL,
  `Consultation-anxiété_idConsultation-anxiété` int(11) NOT NULL,
  `Moyen_de_reglement_idMoyen_de_reglement` int(11) NOT NULL,
  `Psys_Id_psys` int(11) NOT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `consultation-anxiété`
--

CREATE TABLE `consultation-anxiété` (
  `idConsultation-anxiété` int(11) NOT NULL,
  `Note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `historique-des-consultations`
--

CREATE TABLE `historique-des-consultations` (
  `idHistorique-des-consultations` int(11) NOT NULL,
  `Historique-des-consultations` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `moyen_de_reglement`
--

CREATE TABLE `moyen_de_reglement` (
  `idMoyen_de_reglement` int(11) NOT NULL,
  `Moyen_de_reglement` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `moyen_trouver`
--

CREATE TABLE `moyen_trouver` (
  `idMoyen_trouver` int(11) NOT NULL,
  `Moyen_trouver` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `note-du-psy`
--

CREATE TABLE `note-du-psy` (
  `idNote-du-psy` int(11) NOT NULL,
  `Note-du-psy` varchar(45) DEFAULT NULL,
  `Psys_Id_psys` int(11) NOT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Prénom` varchar(45) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Sexe` varchar(45) DEFAULT NULL,
  `user_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `professions`
--

CREATE TABLE `professions` (
  `idProfessions` int(11) NOT NULL,
  `Professions` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `psys`
--

CREATE TABLE `psys` (
  `Id_psys` int(11) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Prénom` varchar(45) DEFAULT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `user_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `situation_familiale`
--

CREATE TABLE `situation_familiale` (
  `idSituation_familiale` int(11) NOT NULL,
  `Situation_familiale` varchar(45) DEFAULT NULL,
  `Patient_idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `pseudo` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idUser` int(11) NOT NULL,
  `verifier` tinyint(4) NOT NULL,
  `clé_de_sécurité` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`pseudo`, `email`, `password`, `idUser`, `verifier`, `clé_de_sécurité`) VALUES
('aze', 'jeanpierre.tran.fr@gmail.com', '$2y$10$36bwwIZa.vZ5tDSMzx9/aeJRW64kX.l6G9yhioKRTbuFSttTIREJm', 24, 0, '3c4e2c7c892054d81c28209e08709584269a1de4'),
('pokk', 'jeanpierrer.tran.fr@gmail.com', '$2y$10$zNEw2wWsMEpssaLnLD2AOeyrrQ5JkGdi/CqIlVz6nxp6gkaQd3MQa', 25, 0, 'a8b2db073c18644d3fb0690bfb6e8dcabb8b3213'),
('pokk', 'jeanpierfdfrer.tran.fr@gmail.com', '$2y$10$bDKQKvGxtfKlFNCpjzXmz.UrY35gHGhSMpDXXOpbiZvjhAbSQkUZm', 26, 0, '7584c27f3b8a0df68bdd2914592624314c07ea81'),
('dgd', 'danpzzierre.tran.fr@gmail.com', '$2y$10$macs2NbnidHXGFIf61J88umWvpl1uo4Rm36paux1fSEkycFsL6vOy', 27, 0, '5294328d1dda83292cc8a71f085a0a63773a26f9');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsultation`,`Consultation-anxiété_idConsultation-anxiété`,`Moyen_de_reglement_idMoyen_de_reglement`,`Psys_Id_psys`,`Patient_idPatient`),
  ADD KEY `fk_Consultation_Consultation-anxiété1_idx` (`Consultation-anxiété_idConsultation-anxiété`),
  ADD KEY `fk_Consultation_Moyen_de_reglement1_idx` (`Moyen_de_reglement_idMoyen_de_reglement`),
  ADD KEY `fk_Consultation_Psys1_idx` (`Psys_Id_psys`),
  ADD KEY `fk_Consultation_Patient1_idx` (`Patient_idPatient`);

--
-- Index pour la table `consultation-anxiété`
--
ALTER TABLE `consultation-anxiété`
  ADD PRIMARY KEY (`idConsultation-anxiété`);

--
-- Index pour la table `historique-des-consultations`
--
ALTER TABLE `historique-des-consultations`
  ADD PRIMARY KEY (`idHistorique-des-consultations`,`Patient_idPatient`),
  ADD KEY `fk_Historique-des-consultations_Patient1_idx` (`Patient_idPatient`);

--
-- Index pour la table `moyen_de_reglement`
--
ALTER TABLE `moyen_de_reglement`
  ADD PRIMARY KEY (`idMoyen_de_reglement`);

--
-- Index pour la table `moyen_trouver`
--
ALTER TABLE `moyen_trouver`
  ADD PRIMARY KEY (`idMoyen_trouver`,`Patient_idPatient`),
  ADD KEY `fk_Moyen_trouver_Patient1_idx` (`Patient_idPatient`);

--
-- Index pour la table `note-du-psy`
--
ALTER TABLE `note-du-psy`
  ADD PRIMARY KEY (`idNote-du-psy`,`Psys_Id_psys`,`Patient_idPatient`),
  ADD KEY `fk_Note-du-psy_Psys1_idx` (`Psys_Id_psys`),
  ADD KEY `fk_Note-du-psy_Patient1_idx` (`Patient_idPatient`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`,`user_idUser`),
  ADD KEY `fk_Patient_user1_idx` (`user_idUser`);

--
-- Index pour la table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`idProfessions`,`Patient_idPatient`),
  ADD KEY `fk_Professions_Patient_idx` (`Patient_idPatient`);

--
-- Index pour la table `psys`
--
ALTER TABLE `psys`
  ADD PRIMARY KEY (`Id_psys`,`user_idUser`),
  ADD KEY `fk_Psys_user1_idx` (`user_idUser`);

--
-- Index pour la table `situation_familiale`
--
ALTER TABLE `situation_familiale`
  ADD PRIMARY KEY (`idSituation_familiale`,`Patient_idPatient`),
  ADD KEY `fk_Situation_familiale_Patient1_idx` (`Patient_idPatient`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `idConsultation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `consultation-anxiété`
--
ALTER TABLE `consultation-anxiété`
  MODIFY `idConsultation-anxiété` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `historique-des-consultations`
--
ALTER TABLE `historique-des-consultations`
  MODIFY `idHistorique-des-consultations` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `moyen_de_reglement`
--
ALTER TABLE `moyen_de_reglement`
  MODIFY `idMoyen_de_reglement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `moyen_trouver`
--
ALTER TABLE `moyen_trouver`
  MODIFY `idMoyen_trouver` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professions`
--
ALTER TABLE `professions`
  MODIFY `idProfessions` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `psys`
--
ALTER TABLE `psys`
  MODIFY `Id_psys` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `situation_familiale`
--
ALTER TABLE `situation_familiale`
  MODIFY `idSituation_familiale` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
