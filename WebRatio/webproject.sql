-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2011 at 03:46 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `num_habitantes` varchar(255) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `id_lingua` int(11) DEFAULT NULL,
  `id_continente` int(11) DEFAULT NULL,
  `bandeira` varchar(255) DEFAULT NULL,
  `id_coordenadas` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `estado_id_estado` int(11) DEFAULT NULL,
  `moeda_id_moeda` int(11) DEFAULT NULL,
  `pais_id_pais` int(11) DEFAULT NULL,
  `lingua_id_lingua` int(11) DEFAULT NULL,
  `continente_id_continente` int(11) DEFAULT NULL,
  `coordenadas_id_coordenadas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `fk_cidade_estado` (`estado_id_estado`),
  KEY `fk_cidade_moeda` (`moeda_id_moeda`),
  KEY `fk_cidade_pais` (`pais_id_pais`),
  KEY `fk_cidade_lingua` (`lingua_id_lingua`),
  KEY `fk_cidade_continente` (`continente_id_continente`),
  KEY `fk_cidade_coordenadas` (`coordenadas_id_coordenadas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome`, `descricao`, `area`, `num_habitantes`, `id_pais`, `id_moeda`, `id_lingua`, `id_continente`, `bandeira`, `id_coordenadas`, `id_estado`, `estado_id_estado`, `moeda_id_moeda`, `pais_id_pais`, `lingua_id_lingua`, `continente_id_continente`, `coordenadas_id_coordenadas`) VALUES
(1, 'PORTO', 'CIDADE DO PORTO', '200KM', '100', 1, 1, 1, 1, 'URL BANDEIRA PORTO', 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'LISBOA', 'CIDADE DE LISBOA', '300KM', '200', 1, 1, 1, 1, 'URL BANDEIRA LISBOA', 2, 1, 1, 1, 1, 1, 1, 2),
(3, 'MADRID', 'CIDADE DE MADRID', '600KM', '10000', 2, 1, 2, 1, 'URL BANDEIRA MADRIRD', 3, 1, 1, 1, 2, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario` int(11) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_utilizador` int(11) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  `cidade_id_cidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_comentario_user` (`user_oid`),
  KEY `fk_comentario_cidade` (`cidade_id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `comentario`, `data`, `id_utilizador`, `id_cidade`, `user_oid`, `cidade_id_cidade`) VALUES
(1, 'asd', '2011-12-20', 1, 1, 1, 1),
(2, 'qwerty', '2011-12-20', 2, 2, 2, 2),
(3, 'asd1', '2011-12-20', 2, 1, 2, 1),
(4, 'asd2', '2011-12-05', 2, 1, 2, 1),
(5, 'asd', '2011-12-12', 2, 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `continente`
--

CREATE TABLE IF NOT EXISTS `continente` (
  `id_continente` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_continente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `continente`
--

INSERT INTO `continente` (`id_continente`, `descricao`) VALUES
(1, 'EUROPA'),
(2, 'AMERICA');

-- --------------------------------------------------------

--
-- Table structure for table `coordenadas`
--

CREATE TABLE IF NOT EXISTS `coordenadas` (
  `id_coordenadas` int(11) NOT NULL,
  `latitute` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_coordenadas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coordenadas`
--

INSERT INTO `coordenadas` (`id_coordenadas`, `latitute`, `longitude`, `altitude`) VALUES
(1, '1', '1', '1'),
(2, '2', '2', '2'),
(3, '3', '3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id_estado`, `descricao`) VALUES
(1, 'OK'),
(2, 'KO');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id_foto` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_utilizador` int(11) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL,
  `cidade_id_cidade` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_foto_cidade` (`cidade_id_cidade`),
  KEY `fk_foto_user` (`user_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id_foto`, `url`, `descricao`, `data`, `id_utilizador`, `id_cidade`, `cidade_id_cidade`, `user_oid`) VALUES
(1, 'url', 'url', '2011-12-14', 1, 1, 1, 1),
(2, 'URL4', 'url', '2011-12-21', 2, 2, 2, 2),
(3, 'f', 'f', '2011-12-20', 2, 1, 1, 2),
(4, 'x', 'x', '2011-12-12', 2, 1, 1, 2),
(5, 'y', 'y', '2011-12-20', 2, 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_group_module` (`module_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`oid`, `groupname`, `module_oid`) VALUES
(1, 'Normal', 1),
(2, 'Administracao', 2);

-- --------------------------------------------------------

--
-- Table structure for table `group_module`
--

CREATE TABLE IF NOT EXISTS `group_module` (
  `group_oid` int(11) NOT NULL,
  `module_oid` int(11) NOT NULL,
  PRIMARY KEY (`group_oid`,`module_oid`),
  KEY `fk_group_module_group` (`group_oid`),
  KEY `fk_group_module_module` (`module_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_module`
--

INSERT INTO `group_module` (`group_oid`, `module_oid`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lingua`
--

CREATE TABLE IF NOT EXISTS `lingua` (
  `id_lingua` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lingua`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lingua`
--

INSERT INTO `lingua` (`id_lingua`, `nome`) VALUES
(1, 'PORTUGUES'),
(2, 'ESPANHOL'),
(3, 'INGLES');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `oid` int(11) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`oid`, `moduleid`, `modulename`) VALUES
(1, 'sv2', 'Utilizador Registado'),
(2, 'sv1', 'Administração');

-- --------------------------------------------------------

--
-- Table structure for table `moeda`
--

CREATE TABLE IF NOT EXISTS `moeda` (
  `id_moeda` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moeda`
--

INSERT INTO `moeda` (`id_moeda`, `nome`) VALUES
(1, 'EURO'),
(2, 'LIBRA'),
(3, 'DOLAR');

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `bandeira` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`id_pais`, `nome`, `bandeira`) VALUES
(1, 'Portugal', 'URL BANDEIRA PT'),
(2, 'ESPANHA', 'URL BANDEIRA ESPANHA'),
(3, 'INGLATERRA', 'URL BANDEIRA INGLATERRA');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id_utilizador` int(11) NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `classificacao` int(11) DEFAULT NULL,
  `user_oid` int(11) DEFAULT NULL,
  `cidade_id_cidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_utilizador`,`id_cidade`),
  KEY `fk_rating_user` (`user_oid`),
  KEY `fk_rating_cidade` (`cidade_id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id_utilizador`, `id_cidade`, `classificacao`, `user_oid`, `cidade_id_cidade`) VALUES
(1, 1, 4, 1, 1),
(2, 1, 5, 2, 1),
(3, 1, 4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `oid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `group_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_user_group` (`group_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`oid`, `username`, `password`, `email`, `group_oid`) VALUES
(1, 'bruno', 'bruno', 'bruno@bruno.pt', 1),
(2, 'fabio', 'fabio', 'fabio@fabio.pt', 1),
(3, 'samuel', 'samuel', 'samuel@samuel.pt', 1),
(4, 'admin', 'admin', 'admin@admin.pt', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_oid` int(11) NOT NULL,
  `group_oid` int(11) NOT NULL,
  PRIMARY KEY (`user_oid`,`group_oid`),
  KEY `fk_user_group_user` (`user_oid`),
  KEY `fk_user_group_group` (`group_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_oid`, `group_oid`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_coordenadas` FOREIGN KEY (`coordenadas_id_coordenadas`) REFERENCES `coordenadas` (`id_coordenadas`),
  ADD CONSTRAINT `fk_cidade_continente` FOREIGN KEY (`continente_id_continente`) REFERENCES `continente` (`id_continente`),
  ADD CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`estado_id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_cidade_lingua` FOREIGN KEY (`lingua_id_lingua`) REFERENCES `lingua` (`id_lingua`),
  ADD CONSTRAINT `fk_cidade_moeda` FOREIGN KEY (`moeda_id_moeda`) REFERENCES `moeda` (`id_moeda`),
  ADD CONSTRAINT `fk_cidade_pais` FOREIGN KEY (`pais_id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_cidade` FOREIGN KEY (`cidade_id_cidade`) REFERENCES `cidade` (`id_cidade`),
  ADD CONSTRAINT `fk_comentario_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`);

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_foto_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`),
  ADD CONSTRAINT `fk_foto_cidade` FOREIGN KEY (`cidade_id_cidade`) REFERENCES `cidade` (`id_cidade`);

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `fk_group_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`);

--
-- Constraints for table `group_module`
--
ALTER TABLE `group_module`
  ADD CONSTRAINT `fk_group_module_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`),
  ADD CONSTRAINT `fk_group_module_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_cidade` FOREIGN KEY (`cidade_id_cidade`) REFERENCES `cidade` (`id_cidade`),
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`);

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `fk_user_group_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  ADD CONSTRAINT `fk_user_group_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
