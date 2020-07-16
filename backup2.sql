-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para nodejs_login1
CREATE DATABASE IF NOT EXISTS `nodejs_login1` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `nodejs_login1`;

-- Volcando estructura para tabla nodejs_login1.tbl_tasks
CREATE TABLE IF NOT EXISTS `tbl_tasks` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` text COLLATE latin1_spanish_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_task`),
  KEY `FK_tbl_tasks_users` (`id_user`),
  CONSTRAINT `FK_tbl_tasks_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla nodejs_login1.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE latin1_spanish_ci,
  `last_name` text COLLATE latin1_spanish_ci,
  `email` text COLLATE latin1_spanish_ci,
  `password` text COLLATE latin1_spanish_ci,
  `created` text COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
