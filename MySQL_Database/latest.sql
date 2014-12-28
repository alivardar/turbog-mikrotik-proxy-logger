-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.31-0+wheezy1 - (Debian)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for turbogmikrotikloggerservice
CREATE DATABASE IF NOT EXISTS `turbogmikrotikloggerservice` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `turbogmikrotikloggerservice`;


-- Dumping structure for table turbogmikrotikloggerservice.aliases
CREATE TABLE IF NOT EXISTS `aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table turbogmikrotikloggerservice.aliases: ~1 rows (approximately)
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
INSERT INTO `aliases` (`id`, `ip`, `description`) VALUES
	(1, '10.0.0.105', 'ali');
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;


-- Dumping structure for table turbogmikrotikloggerservice.dhcplogs
CREATE TABLE IF NOT EXISTS `dhcplogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `dhcpservername` varchar(32) DEFAULT NULL,
  `kind` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table turbogmikrotikloggerservice.dhcplogs: ~4 rows (approximately)
/*!40000 ALTER TABLE `dhcplogs` DISABLE KEYS */;
INSERT INTO `dhcplogs` (`id`, `time`, `ip`, `mac`, `dhcpservername`, `kind`) VALUES
	(34, '2013-10-31 12:31:17', '10.0.0.112', '40:B0:FA:BC:44:18', 'default', 'deassigned'),
	(35, '2013-10-31 12:31:27', '10.0.0.112', '40:B0:FA:BC:44:18', 'default', 'assigned'),
	(36, '2013-10-31 12:31:27', '10.0.0.112', '40:B0:FA:BC:44:18', 'default', 'deassigned'),
	(37, '2013-10-31 12:31:27', '10.0.0.112', '40:B0:FA:BC:44:18', 'default', 'assigned');
/*!40000 ALTER TABLE `dhcplogs` ENABLE KEYS */;


-- Dumping structure for table turbogmikrotikloggerservice.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `export_dhcp_log` varchar(5) DEFAULT NULL,
  `dhcp_log_dir` varchar(255) DEFAULT NULL,
  `license_key` varchar(255) DEFAULT 'key',
  `license_owner` varchar(255) DEFAULT 'owner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table turbogmikrotikloggerservice.settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`export_dhcp_log`, `dhcp_log_dir`, `license_key`, `license_owner`) VALUES
	('True', 'C:\\Dosyalar', 'key', 'owner');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


-- Dumping structure for table turbogmikrotikloggerservice.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table turbogmikrotikloggerservice.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`) VALUES
	(1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table turbogmikrotikloggerservice.weblogs
CREATE TABLE IF NOT EXISTS `weblogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url_full` varchar(1024) DEFAULT NULL,
  `ip` char(24) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `url_base` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4877 DEFAULT CHARSET=utf8;


