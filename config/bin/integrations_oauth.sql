# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.25)
# Database: magento
# Generation Time: 2019-04-18 10:24:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authorization_role
# ------------------------------------------------------------

LOCK TABLES `authorization_role` WRITE;
/*!40000 ALTER TABLE `authorization_role` DISABLE KEYS */;

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`)
VALUES
	(3,0,1,0,'U',1,'1','11');

/*!40000 ALTER TABLE `authorization_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table authorization_rule
# ------------------------------------------------------------

LOCK TABLES `authorization_rule` WRITE;
/*!40000 ALTER TABLE `authorization_rule` DISABLE KEYS */;

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`)
VALUES
	(2,3,'Magento_Backend::all',NULL,'allow');

/*!40000 ALTER TABLE `authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table integration
# ------------------------------------------------------------

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;

INSERT INTO `integration` (`integration_id`, `name`, `email`, `endpoint`, `status`, `consumer_id`, `created_at`, `updated_at`, `setup_type`, `identity_link_url`)
VALUES
	(1,'local-development','',NULL,1,1,'2019-04-18 10:21:00','2019-04-18 10:21:04',0,NULL);

/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_consumer
# ------------------------------------------------------------

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;

INSERT INTO `oauth_consumer` (`entity_id`, `created_at`, `updated_at`, `name`, `key`, `secret`, `callback_url`, `rejected_callback_url`)
VALUES
	(1,'2019-04-18 10:21:00','0000-00-00 00:00:00','Integration1','05wv0e9m576lox5brsqy7qp380gfrvsr','pv7tcmjydtef7w9qweh5i145tlxhrz55',NULL,'');

/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_token
# ------------------------------------------------------------

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;

INSERT INTO `oauth_token` (`entity_id`, `consumer_id`, `admin_id`, `customer_id`, `type`, `token`, `secret`, `verifier`, `callback_url`, `revoked`, `authorized`, `user_type`, `created_at`)
VALUES
	(1,1,NULL,NULL,'access','90cft6s87jw0n68lkkwqaipajdy7c0m9','hzkp3gxfgi56zlqd3yz82bed8baxi6ww','6jcc8v2q3s19fg1fte9ns7th337wxajg','oob',0,0,1,'2019-04-18 10:21:04');

/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
