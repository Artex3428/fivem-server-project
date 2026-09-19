-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               12.3.3-MariaDB - MariaDB Server
-- Server OS:                    Win64
-- HeidiSQL Version:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table fivem-server-project.admin_crafting_benches
CREATE TABLE IF NOT EXISTS `admin_crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bench_type` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `coords` text NOT NULL,
  `allowed_jobs` text DEFAULT NULL,
  `placed_by` varchar(50) NOT NULL,
  `custom_prop` varchar(100) DEFAULT NULL,
  `weapon_repair` tinyint(1) DEFAULT 0,
  `placed_at` timestamp NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`bench_type`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.admin_crafting_benches: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.bank_accounts_new: ~25 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('bcso', 0, '[]', '[]', 0, NULL),
	('bus', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('garbage', 0, '[]', '[]', 0, NULL),
	('hotdog', 0, '[]', '[]', 0, NULL),
	('judge', 0, '[]', '[]', 0, NULL),
	('lawyer', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('none', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('reporter', 0, '[]', '[]', 0, NULL),
	('sasp', 0, '[]', '[]', 0, NULL),
	('taxi', 0, '[]', '[]', 0, NULL),
	('tow', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('trucker', 0, '[]', '[]', 0, NULL),
	('unemployed', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('vineyard', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table fivem-server-project.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.bans: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.business_npcs
CREATE TABLE IF NOT EXISTS `business_npcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `npc_name` varchar(100) NOT NULL,
  `wage` int(11) NOT NULL,
  `happiness` int(11) NOT NULL DEFAULT 75,
  `hired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_npc_business` (`business_id`),
  CONSTRAINT `fk_npc_business` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='NPC staff roster per business';

-- Dumping data for table fivem-server-project.business_npcs: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.business_transactions
CREATE TABLE IF NOT EXISTS `business_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `type` enum('income_tick','customer_sale','wage_payment','withdrawal','deposit','tax','purchase','sale_received','robbery_loss') NOT NULL,
  `amount` int(11) NOT NULL COMMENT 'Positive = income, negative = expense',
  `actor_citizenid` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_txn_business` (`business_id`),
  KEY `idx_txn_type` (`type`),
  KEY `idx_txn_created` (`created_at`),
  CONSTRAINT `fk_txn_business` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Full audit ledger for all business financial events';

-- Dumping data for table fivem-server-project.business_transactions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `business_type` varchar(50) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `cash_balance` int(11) NOT NULL DEFAULT 0,
  `upgrade_tier` enum('basic','improved','premium') NOT NULL DEFAULT 'basic',
  `purchased_at` timestamp NULL DEFAULT NULL,
  `last_income_tick` timestamp NULL DEFAULT NULL,
  `last_wage_tick` timestamp NULL DEFAULT NULL,
  `for_sale_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_zone` (`zone_id`),
  KEY `idx_owner` (`owner_citizenid`),
  KEY `idx_type` (`business_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player-owned business zones';

-- Dumping data for table fivem-server-project.businesses: ~16 rows (approximately)
INSERT INTO `businesses` (`id`, `zone_id`, `owner_citizenid`, `business_type`, `business_name`, `cash_balance`, `upgrade_tier`, `purchased_at`, `last_income_tick`, `last_wage_tick`, `for_sale_price`) VALUES
	(1, 'bar_pillbox', NULL, 'bar', 'The Rusty Nail Bar', 0, 'basic', NULL, NULL, NULL, NULL),
	(2, 'bar_vinewood', NULL, 'bar', 'Vinewood Lounge', 0, 'basic', NULL, NULL, NULL, NULL),
	(3, 'carwash_strawberry', NULL, 'car_wash', 'Strawberry Auto Spa', 0, 'basic', NULL, NULL, NULL, NULL),
	(4, 'carwash_ls', NULL, 'car_wash', 'LS Quick Clean', 0, 'basic', NULL, NULL, NULL, NULL),
	(5, 'foodstand_mirror_park', NULL, 'food_stand', 'Mirror Park Bites', 0, 'basic', NULL, NULL, NULL, NULL),
	(6, 'foodstand_downtown', NULL, 'food_stand', 'Downtown Dogs', 0, 'basic', NULL, NULL, NULL, NULL),
	(7, 'laundromat_paleto', NULL, 'laundromat', 'Paleto Fresh Wash', 0, 'basic', NULL, NULL, NULL, NULL),
	(8, 'laundromat_strawberry', NULL, 'laundromat', 'Strawberry Suds', 0, 'basic', NULL, NULL, NULL, NULL),
	(9, 'tattoo_hawick', NULL, 'tattoo_parlor', 'Hawick Ink', 0, 'basic', NULL, NULL, NULL, NULL),
	(10, 'tattoo_vespucci', NULL, 'tattoo_parlor', 'Vespucci Body Art', 0, 'basic', NULL, NULL, NULL, NULL),
	(11, 'garage_benny', NULL, 'garage', 'Benny\'s Workshop', 0, 'basic', NULL, NULL, NULL, NULL),
	(12, 'garage_sandy', NULL, 'garage', 'Sandy Shores Auto Repair', 0, 'basic', NULL, NULL, NULL, NULL),
	(13, 'clothing_ponsonbys', NULL, 'clothing_store', 'Ponsonbys Boutique', 0, 'basic', NULL, NULL, NULL, NULL),
	(14, 'clothing_suburban', NULL, 'clothing_store', 'Suburban Threads', 0, 'basic', NULL, NULL, NULL, NULL),
	(15, 'convstore_strawberry', NULL, 'convenience_store', '24/7 Strawberry', 0, 'basic', NULL, NULL, NULL, NULL),
	(16, 'convstore_sandy', NULL, 'convenience_store', 'Sandy Shores Grab & Go', 0, 'basic', NULL, NULL, NULL, NULL);

-- Dumping structure for table fivem-server-project.darkchat_bans
CREATE TABLE IF NOT EXISTS `darkchat_bans` (
  `room_id` varchar(40) NOT NULL,
  `citizenid` varchar(60) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  PRIMARY KEY (`room_id`,`citizenid`),
  KEY `idx_fk_darkchat_bans_room` (`room_id`),
  CONSTRAINT `fk_darkchat_bans_room` FOREIGN KEY (`room_id`) REFERENCES `darkchat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_bans: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.darkchat_members
CREATE TABLE IF NOT EXISTS `darkchat_members` (
  `room_id` varchar(40) NOT NULL,
  `citizenid` varchar(60) NOT NULL,
  `joined_at` bigint(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`room_id`,`citizenid`),
  KEY `citizenid` (`citizenid`),
  KEY `idx_fk_darkchat_members_room` (`room_id`),
  CONSTRAINT `fk_darkchat_members_room` FOREIGN KEY (`room_id`) REFERENCES `darkchat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_members: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` varchar(40) NOT NULL,
  `citizenid` varchar(60) DEFAULT NULL,
  `author` varchar(40) NOT NULL,
  `body` text NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `meta` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`,`id`),
  KEY `idx_fk_darkchat_messages_room` (`room_id`),
  CONSTRAINT `fk_darkchat_messages_room` FOREIGN KEY (`room_id`) REFERENCES `darkchat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.darkchat_nicknames
CREATE TABLE IF NOT EXISTS `darkchat_nicknames` (
  `citizenid` varchar(60) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_nicknames: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.darkchat_reactions
CREATE TABLE IF NOT EXISTS `darkchat_reactions` (
  `message_id` int(11) NOT NULL,
  `citizenid` varchar(60) NOT NULL,
  `emoji` varchar(32) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`message_id`,`citizenid`,`emoji`),
  KEY `message_id` (`message_id`),
  KEY `idx_fk_darkchat_reactions_message` (`message_id`),
  CONSTRAINT `fk_darkchat_reactions_message` FOREIGN KEY (`message_id`) REFERENCES `darkchat_messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_reactions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.darkchat_rooms
CREATE TABLE IF NOT EXISTS `darkchat_rooms` (
  `id` varchar(40) NOT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `code_changed_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.darkchat_rooms: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.dealers: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.dev_fishing
CREATE TABLE IF NOT EXISTS `dev_fishing` (
  `citizenid` varchar(64) NOT NULL,
  `xp` int(10) unsigned NOT NULL DEFAULT 0,
  `discovered` longtext DEFAULT NULL,
  `stats` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.dev_fishing: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.management_groups
CREATE TABLE IF NOT EXISTS `management_groups` (
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `defaultDuty` tinyint(1) DEFAULT 1,
  `offDutyPay` tinyint(1) DEFAULT 0,
  `grades` longtext DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.management_groups: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.management_outfits: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.marketplace_listings
CREATE TABLE IF NOT EXISTS `marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(60) NOT NULL,
  `title` varchar(80) NOT NULL,
  `body` text NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `number` varchar(20) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.marketplace_listings: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.ox_doorlock: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.ox_inventory: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.ox_inventory_settings
CREATE TABLE IF NOT EXISTS `ox_inventory_settings` (
  `owner` varchar(60) NOT NULL,
  `settings` longtext DEFAULT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.ox_inventory_settings: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.pages_posts
CREATE TABLE IF NOT EXISTS `pages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(60) NOT NULL,
  `title` varchar(80) NOT NULL,
  `body` text NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `number` varchar(20) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.pages_posts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_admin_audit
CREATE TABLE IF NOT EXISTS `phone_admin_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_cid` varchar(64) NOT NULL,
  `admin_name` varchar(64) NOT NULL DEFAULT '',
  `action` varchar(48) NOT NULL,
  `target_cid` varchar(64) DEFAULT NULL,
  `detail` varchar(512) NOT NULL DEFAULT '',
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_admin_audit_target` (`target_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_admin_audit: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_admin_mutes
CREATE TABLE IF NOT EXISTS `phone_admin_mutes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `scope` varchar(24) NOT NULL,
  `reason` varchar(200) NOT NULL DEFAULT '',
  `admin_cid` varchar(64) NOT NULL,
  `admin_name` varchar(64) NOT NULL DEFAULT '',
  `expires_at` bigint(20) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_mute` (`citizenid`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_admin_mutes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_alarms
CREATE TABLE IF NOT EXISTS `phone_alarms` (
  `citizenid` varchar(60) NOT NULL,
  `id` varchar(40) NOT NULL,
  `hour` tinyint(3) unsigned NOT NULL,
  `minute` tinyint(3) unsigned NOT NULL,
  `label` varchar(60) NOT NULL DEFAULT '',
  `days` varchar(40) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sound` tinyint(1) NOT NULL DEFAULT 1,
  `snooze` tinyint(1) NOT NULL DEFAULT 0,
  `snooze_secs` int(11) NOT NULL DEFAULT 60,
  PRIMARY KEY (`citizenid`,`id`),
  KEY `bytime` (`citizenid`,`hour`,`minute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_alarms: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_app_accounts
CREATE TABLE IF NOT EXISTS `phone_app_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(24) NOT NULL,
  `username` varchar(64) NOT NULL,
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_app_username` (`app`,`username`),
  KEY `idx_app_accounts_creator` (`app`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_app_accounts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_app_sessions
CREATE TABLE IF NOT EXISTS `phone_app_sessions` (
  `app` varchar(24) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`app`,`citizenid`,`account_id`),
  KEY `idx_app_sessions_active` (`app`,`citizenid`,`last_used`),
  KEY `idx_fk_app_sessions_account` (`account_id`),
  CONSTRAINT `fk_app_sessions_account` FOREIGN KEY (`account_id`) REFERENCES `phone_app_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_app_sessions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_bank_transactions
CREATE TABLE IF NOT EXISTS `phone_bank_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `label` varchar(120) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `category` varchar(32) NOT NULL DEFAULT 'transfer',
  `counterparty` varchar(64) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `src_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_bank_tx_src` (`src_id`),
  KEY `citizenid` (`citizenid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_bank_transactions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_dms
CREATE TABLE IF NOT EXISTS `phone_birdy_dms` (
  `id` varchar(16) NOT NULL,
  `from_handle` varchar(32) NOT NULL,
  `to_handle` varchar(32) NOT NULL,
  `body` text NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `meta` text DEFAULT NULL,
  `reactions` text DEFAULT NULL,
  `read_flag` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_birdy_dms_from` (`from_handle`),
  KEY `idx_birdy_dms_to` (`to_handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_dms: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_follows
CREATE TABLE IF NOT EXISTS `phone_birdy_follows` (
  `follower` varchar(32) NOT NULL,
  `target` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`follower`,`target`),
  KEY `idx_birdy_follows_target` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_follows: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_likes
CREATE TABLE IF NOT EXISTS `phone_birdy_likes` (
  `post_id` varchar(16) NOT NULL,
  `handle` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`,`handle`),
  KEY `idx_birdy_likes_post` (`post_id`),
  KEY `idx_fk_birdy_likes_post` (`post_id`),
  CONSTRAINT `fk_birdy_likes_post` FOREIGN KEY (`post_id`) REFERENCES `phone_birdy_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_notifications
CREATE TABLE IF NOT EXISTS `phone_birdy_notifications` (
  `id` varchar(16) NOT NULL,
  `recipient` varchar(32) NOT NULL,
  `kind` varchar(16) NOT NULL,
  `actor` varchar(32) NOT NULL,
  `post_id` varchar(16) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_birdy_notifs_recipient` (`recipient`,`created_at`),
  KEY `idx_birdy_notifs_unseen` (`recipient`,`seen`),
  KEY `idx_birdy_notifs_dedupe` (`recipient`,`kind`,`actor`,`post_id`),
  KEY `idx_fk_birdy_notifications_post` (`post_id`),
  CONSTRAINT `fk_birdy_notifications_post` FOREIGN KEY (`post_id`) REFERENCES `phone_birdy_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_notifications: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_posts
CREATE TABLE IF NOT EXISTS `phone_birdy_posts` (
  `id` varchar(16) NOT NULL,
  `author` varchar(32) NOT NULL,
  `body` text NOT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_birdy_posts_author` (`author`),
  KEY `idx_birdy_posts_parent` (`parent_id`),
  KEY `idx_birdy_posts_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_posts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_profiles
CREATE TABLE IF NOT EXISTS `phone_birdy_profiles` (
  `handle` varchar(32) NOT NULL,
  `citizenid` varchar(64) NOT NULL DEFAULT '',
  `display_name` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  `bio` varchar(200) NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified_type` varchar(8) DEFAULT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `join_label` varchar(32) NOT NULL DEFAULT '',
  `protected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(512) DEFAULT NULL,
  `banner` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`handle`),
  KEY `idx_birdy_profiles_creator` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_birdy_reposts
CREATE TABLE IF NOT EXISTS `phone_birdy_reposts` (
  `post_id` varchar(16) NOT NULL,
  `handle` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`,`handle`),
  KEY `idx_birdy_reposts_post` (`post_id`),
  KEY `idx_fk_birdy_reposts_post` (`post_id`),
  CONSTRAINT `fk_birdy_reposts_post` FOREIGN KEY (`post_id`) REFERENCES `phone_birdy_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_birdy_reposts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_blocked
CREATE TABLE IF NOT EXISTS `phone_blocked` (
  `citizenid` varchar(64) NOT NULL,
  `number` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_blocked: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_bluetooth
CREATE TABLE IF NOT EXISTS `phone_bluetooth` (
  `citizenid` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `paired` longtext DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_bluetooth: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `number` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `direction` varchar(16) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `called_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_calls_cid` (`citizenid`),
  KEY `idx_phone_calls_cid_at` (`citizenid`,`called_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_calls: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_casino_chips
CREATE TABLE IF NOT EXISTS `phone_casino_chips` (
  `citizenid` varchar(64) NOT NULL,
  `chips` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_casino_chips: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cherry_blocks
CREATE TABLE IF NOT EXISTS `phone_cherry_blocks` (
  `blocker` varchar(64) NOT NULL,
  `blocked` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`blocker`,`blocked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cherry_blocks: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cherry_matches
CREATE TABLE IF NOT EXISTS `phone_cherry_matches` (
  `id` varchar(16) NOT NULL,
  `a` varchar(64) NOT NULL,
  `b` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cherry_pair` (`a`,`b`),
  KEY `idx_cherry_match_b` (`b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cherry_matches: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cherry_messages
CREATE TABLE IF NOT EXISTS `phone_cherry_messages` (
  `id` varchar(16) NOT NULL,
  `match_id` varchar(16) NOT NULL,
  `sender` varchar(64) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `body` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `reactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reactions`)),
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cherry_msgs_thread` (`match_id`,`created_at`),
  KEY `idx_fk_cherry_messages_match` (`match_id`),
  CONSTRAINT `fk_cherry_messages_match` FOREIGN KEY (`match_id`) REFERENCES `phone_cherry_matches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cherry_messages: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cherry_profiles
CREATE TABLE IF NOT EXISTS `phone_cherry_profiles` (
  `username` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL DEFAULT 21,
  `about` varchar(300) NOT NULL DEFAULT '',
  `gender` varchar(12) NOT NULL DEFAULT 'Man',
  `interested` varchar(12) NOT NULL DEFAULT 'Everyone',
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photos`)),
  `updated_at` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cherry_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cherry_swipes
CREATE TABLE IF NOT EXISTS `phone_cherry_swipes` (
  `swiper` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `liked` tinyint(1) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`swiper`,`target`),
  KEY `idx_cherry_swipes_target` (`target`,`liked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cherry_swipes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cloud_accounts
CREATE TABLE IF NOT EXISTS `phone_cloud_accounts` (
  `citizenid` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cloud_accounts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cloud_backups
CREATE TABLE IF NOT EXISTS `phone_cloud_backups` (
  `citizenid` varchar(64) NOT NULL,
  `identity` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(64) DEFAULT NULL,
  `device_identity` varchar(64) DEFAULT NULL,
  `auto_sync` tinyint(1) NOT NULL DEFAULT 1,
  `synced_at` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cloud_backups: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cloud_profiles
CREATE TABLE IF NOT EXISTS `phone_cloud_profiles` (
  `citizenid` varchar(64) NOT NULL,
  `device_identity` varchar(64) NOT NULL,
  `identity` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `auto_sync` tinyint(1) NOT NULL DEFAULT 1,
  `synced_at` bigint(20) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`device_identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cloud_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `color` varchar(16) NOT NULL,
  `avatar` varchar(512) DEFAULT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_phone_contacts_cid` (`citizenid`),
  KEY `idx_phone_contacts_cid_name` (`citizenid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_contacts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_cookie
CREATE TABLE IF NOT EXISTS `phone_cookie` (
  `citizenid` varchar(60) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `nickname` varchar(40) DEFAULT NULL,
  `cookies` double NOT NULL DEFAULT 0,
  `earned` double NOT NULL DEFAULT 0,
  `owned` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `rain_on` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `earned` (`earned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_cookie: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_custom_ringtones
CREATE TABLE IF NOT EXISTS `phone_custom_ringtones` (
  `citizenid` varchar(64) NOT NULL,
  `id` varchar(32) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'ringtone',
  `name` varchar(64) NOT NULL,
  `url` varchar(512) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_custom_ringtones: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_document_folders
CREATE TABLE IF NOT EXISTS `phone_document_folders` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(60) NOT NULL,
  `parent_id` varchar(16) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_document_folders_cid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_document_folders: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_document_signatures
CREATE TABLE IF NOT EXISTS `phone_document_signatures` (
  `id` varchar(16) NOT NULL,
  `doc_id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `signer` varchar(64) NOT NULL,
  `image` mediumtext DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_document_signatures_doc` (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_document_signatures: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_documents
CREATE TABLE IF NOT EXISTS `phone_documents` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `folder_id` varchar(16) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `content` mediumtext DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `signable` tinyint(1) NOT NULL DEFAULT 1,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `source` varchar(64) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_documents_folder` (`citizenid`,`folder_id`),
  KEY `idx_phone_documents_updated` (`citizenid`,`updated_at`),
  KEY `idx_fk_documents_folder` (`folder_id`),
  CONSTRAINT `fk_documents_folder` FOREIGN KEY (`folder_id`) REFERENCES `phone_document_folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_documents: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_friends
CREATE TABLE IF NOT EXISTS `phone_friends` (
  `owner` varchar(60) NOT NULL,
  `friend` varchar(60) NOT NULL,
  `share` tinyint(1) NOT NULL DEFAULT 1,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` varchar(40) NOT NULL,
  PRIMARY KEY (`owner`,`friend`),
  KEY `idx_phone_friends_friend` (`friend`,`share`,`pending`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_friends: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_game_stats
CREATE TABLE IF NOT EXISTS `phone_game_stats` (
  `citizenid` varchar(64) NOT NULL,
  `game` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `cpu_wins` int(11) NOT NULL DEFAULT 0,
  `cpu_losses` int(11) NOT NULL DEFAULT 0,
  `cpu_draws` int(11) NOT NULL DEFAULT 0,
  `online_wins` int(11) NOT NULL DEFAULT 0,
  `online_losses` int(11) NOT NULL DEFAULT 0,
  `online_draws` int(11) NOT NULL DEFAULT 0,
  `chips_won` bigint(20) NOT NULL DEFAULT 0,
  `chips_lost` bigint(20) NOT NULL DEFAULT 0,
  `high_score` bigint(20) NOT NULL DEFAULT 0,
  `plays` int(11) NOT NULL DEFAULT 0,
  `last_score` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`,`game`),
  KEY `idx_game_stats_game_high` (`game`,`high_score`),
  KEY `idx_game_stats_game_cpu` (`game`,`cpu_wins`),
  KEY `idx_game_stats_game_online` (`game`,`online_wins`),
  KEY `idx_game_stats_game_chips` (`game`,`chips_won`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_game_stats: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_group_invites
CREATE TABLE IF NOT EXISTS `phone_group_invites` (
  `id` varchar(16) NOT NULL,
  `group_id` varchar(16) NOT NULL,
  `target_cid` varchar(64) NOT NULL,
  `invited_by` varchar(64) NOT NULL,
  `invited_name` varchar(64) DEFAULT NULL,
  `sent_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group_invites_target` (`target_cid`),
  KEY `idx_group_invites_group` (`group_id`),
  KEY `idx_fk_group_invites_group` (`group_id`),
  CONSTRAINT `fk_group_invites_group` FOREIGN KEY (`group_id`) REFERENCES `phone_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_group_invites: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_groups
CREATE TABLE IF NOT EXISTS `phone_groups` (
  `id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `leader_cid` varchar(64) NOT NULL,
  `color` varchar(16) NOT NULL,
  `avatar` varchar(512) DEFAULT NULL,
  `members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`members`)),
  `invites` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`invites`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_phone_groups_leader` (`leader_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_groups: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_job_fires
CREATE TABLE IF NOT EXISTS `phone_job_fires` (
  `citizenid` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  PRIMARY KEY (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_job_fires: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_job_invites
CREATE TABLE IF NOT EXISTS `phone_job_invites` (
  `id` varchar(48) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT 0,
  `invited_by` varchar(128) DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_invite` (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_job_invites: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mail_accounts
CREATE TABLE IF NOT EXISTS `phone_mail_accounts` (
  `email` varchar(64) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `messages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`messages`)),
  `logged_in_citizens` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`logged_in_citizens`)),
  `created_by_cid` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`email`),
  KEY `idx_phone_mail_accounts_creator` (`created_by_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mail_accounts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mail_saved_emails
CREATE TABLE IF NOT EXISTS `phone_mail_saved_emails` (
  `citizenid` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `declined` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mail_saved_emails: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mail_sessions
CREATE TABLE IF NOT EXISTS `phone_mail_sessions` (
  `citizenid` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`citizenid`,`email`),
  KEY `idx_phone_mail_sessions_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mail_sessions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_map_markers
CREATE TABLE IF NOT EXISTS `phone_map_markers` (
  `citizenid` varchar(60) NOT NULL,
  `markers` mediumtext NOT NULL,
  `updated_at` varchar(40) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_map_markers: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_arrests
CREATE TABLE IF NOT EXISTS `phone_mdt_arrests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_ref` varchar(16) DEFAULT NULL,
  `citizenid` varchar(64) NOT NULL,
  `subject_name` varchar(96) NOT NULL DEFAULT '',
  `officer_cid` varchar(64) NOT NULL,
  `officer_name` varchar(96) NOT NULL DEFAULT '',
  `officer_callsign` varchar(16) DEFAULT NULL,
  `charges` text DEFAULT NULL,
  `months` int(10) unsigned NOT NULL DEFAULT 0,
  `fine` int(10) unsigned NOT NULL DEFAULT 0,
  `jailed` tinyint(1) NOT NULL DEFAULT 0,
  `fined` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_cid` (`citizenid`),
  KEY `idx_created` (`created_at`),
  KEY `idx_officer` (`officer_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_arrests: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_audit
CREATE TABLE IF NOT EXISTS `phone_mdt_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_cid` varchar(64) NOT NULL,
  `actor_name` varchar(96) NOT NULL DEFAULT '',
  `actor_callsign` varchar(16) DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `action` varchar(48) NOT NULL,
  `entity_type` varchar(32) DEFAULT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actor` (`actor_cid`),
  KEY `idx_entity` (`entity_type`,`entity_id`),
  KEY `idx_created` (`created_at`),
  KEY `idx_action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_audit: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_bulletins
CREATE TABLE IF NOT EXISTS `phone_mdt_bulletins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `body` text NOT NULL,
  `author_cid` varchar(64) NOT NULL,
  `author_name` varchar(96) NOT NULL DEFAULT '',
  `author_callsign` varchar(16) DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_bulletins: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_case_notes
CREATE TABLE IF NOT EXISTS `phone_mdt_case_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `author_cid` varchar(64) NOT NULL,
  `author_name` varchar(96) NOT NULL,
  `body` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_case` (`case_id`,`created_at`),
  KEY `idx_fk_mdt_case_notes_case` (`case_id`),
  CONSTRAINT `fk_mdt_case_notes_case` FOREIGN KEY (`case_id`) REFERENCES `phone_mdt_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_case_notes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_case_officers
CREATE TABLE IF NOT EXISTS `phone_mdt_case_officers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `role` varchar(16) NOT NULL DEFAULT 'assisting',
  `assigned_by` varchar(64) DEFAULT NULL,
  `assigned_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_officer` (`case_id`,`citizenid`),
  KEY `idx_cid` (`citizenid`),
  KEY `idx_fk_mdt_case_officers_case` (`case_id`),
  CONSTRAINT `fk_mdt_case_officers_case` FOREIGN KEY (`case_id`) REFERENCES `phone_mdt_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_case_officers: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_case_reports
CREATE TABLE IF NOT EXISTS `phone_mdt_case_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_link` (`case_id`,`report_id`),
  KEY `idx_report` (`report_id`),
  KEY `idx_fk_mdt_case_reports_case` (`case_id`),
  KEY `idx_fk_mdt_case_reports_report` (`report_id`),
  CONSTRAINT `fk_mdt_case_reports_case` FOREIGN KEY (`case_id`) REFERENCES `phone_mdt_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mdt_case_reports_report` FOREIGN KEY (`report_id`) REFERENCES `phone_mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_case_reports: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_cases
CREATE TABLE IF NOT EXISTS `phone_mdt_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `title` varchar(160) NOT NULL,
  `summary` text DEFAULT NULL,
  `evidence` mediumtext DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'open',
  `priority` varchar(16) NOT NULL DEFAULT 'medium',
  `department` varchar(64) NOT NULL DEFAULT '',
  `created_cid` varchar(64) NOT NULL,
  `created_name` varchar(96) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_status` (`status`),
  KEY `idx_updated` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_cases: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_court_cases
CREATE TABLE IF NOT EXISTS `phone_mdt_court_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `title` varchar(160) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `defendant_name` varchar(96) NOT NULL DEFAULT '',
  `report_ref` varchar(16) DEFAULT NULL,
  `charges` mediumtext DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `evidence` mediumtext DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'filed',
  `plea` varchar(16) DEFAULT NULL,
  `hearing_at` int(11) DEFAULT NULL,
  `judge_cid` varchar(64) DEFAULT NULL,
  `judge_name` varchar(96) DEFAULT NULL,
  `prosecutor_cid` varchar(64) DEFAULT NULL,
  `prosecutor_name` varchar(96) DEFAULT NULL,
  `defence_cid` varchar(64) DEFAULT NULL,
  `defence_name` varchar(96) DEFAULT NULL,
  `verdict` varchar(16) DEFAULT NULL,
  `sentence_months` int(10) unsigned NOT NULL DEFAULT 0,
  `sentence_fine` int(10) unsigned NOT NULL DEFAULT 0,
  `ruling` text DEFAULT NULL,
  `filed_cid` varchar(64) NOT NULL,
  `filed_name` varchar(96) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_defendant` (`citizenid`,`created_at`),
  KEY `idx_status` (`status`,`hearing_at`),
  KEY `idx_updated` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_court_cases: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_court_notes
CREATE TABLE IF NOT EXISTS `phone_mdt_court_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `court_id` int(11) NOT NULL,
  `author_cid` varchar(64) NOT NULL,
  `author_name` varchar(96) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'note',
  `body` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_case` (`court_id`,`created_at`),
  KEY `idx_fk_mdt_court_notes_case` (`court_id`),
  CONSTRAINT `fk_mdt_court_notes_case` FOREIGN KEY (`court_id`) REFERENCES `phone_mdt_court_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_court_notes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_enforcement
CREATE TABLE IF NOT EXISTS `phone_mdt_enforcement` (
  `report_ref` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `jailed` tinyint(1) NOT NULL DEFAULT 0,
  `fined` tinyint(1) NOT NULL DEFAULT 0,
  `arrest_ref` varchar(16) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`report_ref`,`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_enforcement: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_expungements
CREATE TABLE IF NOT EXISTS `phone_mdt_expungements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `subject_name` varchar(96) NOT NULL DEFAULT '',
  `scope` mediumtext DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'pending',
  `ruling` text DEFAULT NULL,
  `filed_cid` varchar(64) NOT NULL,
  `filed_name` varchar(96) NOT NULL,
  `ruled_cid` varchar(64) DEFAULT NULL,
  `ruled_name` varchar(96) DEFAULT NULL,
  `charges_cleared` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_subject` (`citizenid`,`created_at`),
  KEY `idx_status` (`status`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_expungements: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_ia_cases
CREATE TABLE IF NOT EXISTS `phone_mdt_ia_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `subject_cid` varchar(64) NOT NULL,
  `subject_name` varchar(96) NOT NULL DEFAULT '',
  `subject_rank` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(24) NOT NULL DEFAULT 'misconduct',
  `title` varchar(160) NOT NULL,
  `summary` text DEFAULT NULL,
  `evidence` mediumtext DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'open',
  `severity` varchar(16) NOT NULL DEFAULT 'medium',
  `disposition` varchar(24) DEFAULT NULL,
  `discipline` varchar(24) DEFAULT NULL,
  `finding` text DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `filed_cid` varchar(64) NOT NULL,
  `filed_name` varchar(96) NOT NULL,
  `assigned_cid` varchar(64) DEFAULT NULL,
  `assigned_name` varchar(96) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `closed_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_subject` (`subject_cid`,`created_at`),
  KEY `idx_status` (`status`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_ia_cases: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_ia_notes
CREATE TABLE IF NOT EXISTS `phone_mdt_ia_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ia_id` int(11) NOT NULL,
  `author_cid` varchar(64) NOT NULL,
  `author_name` varchar(96) NOT NULL,
  `body` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_case` (`ia_id`,`created_at`),
  KEY `idx_fk_mdt_ia_notes_case` (`ia_id`),
  CONSTRAINT `fk_mdt_ia_notes_case` FOREIGN KEY (`ia_id`) REFERENCES `phone_mdt_ia_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_ia_notes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_medical
CREATE TABLE IF NOT EXISTS `phone_mdt_medical` (
  `citizenid` varchar(64) NOT NULL,
  `blood_type` varchar(8) NOT NULL DEFAULT '',
  `allergies` varchar(512) NOT NULL DEFAULT '',
  `conditions` varchar(512) NOT NULL DEFAULT '',
  `medications` varchar(512) NOT NULL DEFAULT '',
  `notes` mediumtext DEFAULT NULL,
  `dnr` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` varchar(96) NOT NULL DEFAULT '',
  `updated_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`),
  KEY `idx_updated` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_medical: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_person_records
CREATE TABLE IF NOT EXISTS `phone_mdt_person_records` (
  `citizenid` varchar(64) NOT NULL,
  `notes` text DEFAULT NULL,
  `flags` text DEFAULT NULL,
  `mugshot` varchar(512) DEFAULT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_person_records: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_profile_sessions
CREATE TABLE IF NOT EXISTS `phone_mdt_profile_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `login_at` int(11) NOT NULL,
  `logout_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cid` (`citizenid`),
  KEY `idx_open` (`citizenid`,`logout_at`),
  KEY `idx_fk_mdt_sessions_profile` (`citizenid`),
  CONSTRAINT `fk_mdt_sessions_profile` FOREIGN KEY (`citizenid`) REFERENCES `phone_mdt_profiles` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_profile_sessions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_profiles
CREATE TABLE IF NOT EXISTS `phone_mdt_profiles` (
  `citizenid` varchar(64) NOT NULL,
  `fullname` varchar(96) NOT NULL,
  `callsign` varchar(16) DEFAULT NULL,
  `badge` varchar(16) DEFAULT NULL,
  `radio` varchar(16) DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `rank_label` varchar(64) NOT NULL DEFAULT '',
  `grade_level` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(512) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`citizenid`),
  UNIQUE KEY `uniq_callsign` (`callsign`),
  KEY `idx_department` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_protocols
CREATE TABLE IF NOT EXISTS `phone_mdt_protocols` (
  `code` varchar(16) NOT NULL,
  `label` varchar(120) NOT NULL,
  `category` varchar(24) NOT NULL,
  `priority` varchar(16) NOT NULL DEFAULT 'routine',
  `description` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_category` (`category`),
  KEY `idx_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_protocols: ~18 rows (approximately)
INSERT INTO `phone_mdt_protocols` (`code`, `label`, `category`, `priority`, `description`, `body`) VALUES
	('TP 101', 'Primary Survey', 'assessment', 'immediate', 'Airway, breathing, circulation, disability, exposure, in that order.', 'Establish scene safety before approach. Check responsiveness, then airway patency with cervical spine control where trauma is suspected. Assess breathing rate and effort, then circulation by central and peripheral pulse. Record a baseline set of observations before any intervention that is not immediately life saving.'),
	('TP 102', 'Catastrophic Haemorrhage', 'trauma', 'immediate', 'Control life threatening bleeding before anything else.', 'Direct pressure first. Escalate to a pressure dressing, then to a tourniquet placed high and tight on the affected limb. Record the time the tourniquet went on and hand that time over verbally; it decides what the receiving team can still save.'),
	('TP 103', 'Airway Obstruction', 'airway', 'immediate', 'Clear and maintain a patent airway.', 'Encourage coughing while the patient can. On a failing cough, alternate five back blows with five abdominal thrusts. On unresponsiveness, begin chest compressions and inspect the airway on each ventilation attempt.'),
	('TP 104', 'Cardiac Arrest', 'cardiac', 'immediate', 'Compressions, early defibrillation, minimal interruption.', 'Begin compressions at 100 to 120 per minute to a depth of 5 to 6cm. Apply the defibrillator as soon as it is to hand and follow its rhythm analysis. Rotate the compressor every two minutes. Do not stop to move the patient until there is return of circulation or the resuscitation is called.'),
	('TP 105', 'Chest Pain', 'cardiac', 'urgent', 'Treat as cardiac until it is ruled out.', 'Sit the patient upright and keep them still. Record observations at first contact and every five minutes. Any pain radiating to jaw or left arm, or accompanied by sweating, nausea or breathlessness, travels as an emergency regardless of how well the patient looks.'),
	('TP 106', 'Anaphylaxis', 'medical', 'immediate', 'Adrenaline first, and early.', 'Remove the trigger where it can be removed. Give adrenaline into the outer thigh without waiting for the airway to close. Lay the patient flat with legs raised unless breathing is compromised, in which case sit them up. Repeat after five minutes if there is no improvement.'),
	('TP 107', 'Opioid Overdose', 'medical', 'immediate', 'Support ventilation, then reverse.', 'Respiratory failure is what kills, so ventilate before anything else. Give naloxone once ventilation is supported and titrate to breathing rather than to consciousness. Expect the reversal to wear off before the opioid does, and never leave the patient unattended after it.'),
	('TP 108', 'Major Haemorrhage', 'trauma', 'immediate', 'Stop the bleeding, keep them warm, move early.', 'Pressure and packing for compressible sites, pelvic binder for a suspected pelvic fracture, splint for long bone fractures. Keep the patient warm; a cold patient stops clotting. This is a load and go, not a stay and play.'),
	('TP 109', 'Spinal Immobilisation', 'trauma', 'urgent', 'Immobilise on mechanism, not on symptoms.', 'Manual in line stabilisation from first contact. Apply a collar sized to the patient and move with a scoop or long board. A patient who is walking on arrival may still have an unstable spine; the mechanism of injury decides this, not how they present.'),
	('TP 110', 'Burns', 'trauma', 'urgent', 'Cool the burn, warm the patient.', 'Irrigate with cool running water for twenty minutes and no longer. Remove jewellery and constricting clothing early, before swelling sets in. Cover with a clean non adherent dressing. Estimate the surface area involved and pass that figure on; it decides the receiving unit.'),
	('TP 111', 'Seizure', 'medical', 'urgent', 'Protect from harm, time it, do not restrain.', 'Clear the space around the patient and cushion the head. Time the seizure from first movement. Never place anything in the mouth. A seizure past five minutes, or a second seizure without recovery in between, is an emergency in its own right.'),
	('TP 112', 'Hypoglycaemia', 'medical', 'urgent', 'Sugar by the safest available route.', 'Oral glucose for a patient who can protect their own airway. For a patient who cannot, use the parenteral route. Re-test after ten minutes and feed a longer acting carbohydrate once the patient is alert, or they will simply drop again.'),
	('TP 113', 'Drowning', 'medical', 'immediate', 'Ventilate first; this arrest is hypoxic.', 'Give five rescue breaths before compressions, because the cause is oxygen and not rhythm. Assume spinal injury on any dive or fall. Remove wet clothing and insulate the patient early; hypothermia follows immersion faster than it is expected to.'),
	('TP 114', 'Obstetric Emergency', 'medical', 'immediate', 'Two patients, one of whom cannot be assessed.', 'Position the mother on her left side to take the weight off the vena cava. If delivery is imminent, prepare for it where you stand rather than moving. Keep the newborn warm and dry and record the time of birth. Any bleeding in pregnancy travels as an emergency.'),
	('TP 115', 'Psychiatric Crisis', 'medical', 'routine', 'Scene safety, then rapport, then assessment.', 'Do not enter alone where there is a weapon or a threat of one. Keep an exit behind you. Speak plainly and do not argue with a delusion. Rule out the physical causes that mimic a crisis, low blood sugar and hypoxia among them, before recording it as psychiatric.'),
	('TP 116', 'Death on Scene', 'admin', 'routine', 'Recognition of life extinct and what follows it.', 'Resuscitation is not begun where injuries are incompatible with life or where rigor is established. Record the time of recognition, disturb the scene as little as possible, and hand the location over to police. The report for this carries the Death type.'),
	('TP 117', 'Refusal of Treatment', 'admin', 'routine', 'A competent adult may refuse, and that refusal is recorded.', 'Establish that the patient has capacity for this decision at this time. Explain the risks in plain language and record that you did. Advise them to call again if anything changes. Document the refusal in a Patient Care report; the report is the protection for both sides.'),
	('TP 118', 'Handover', 'admin', 'routine', 'The structured handover the receiving team expects.', 'Age and presenting complaint, mechanism or history, the observations recorded and the trend across them, treatment given and the response to it, and anything outstanding. Deliver it once, to the person taking over, and file the report before going back on the road.');

-- Dumping structure for table fivem-server-project.phone_mdt_refs
CREATE TABLE IF NOT EXISTS `phone_mdt_refs` (
  `kind` varchar(16) NOT NULL,
  `counter` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_refs: ~2 rows (approximately)
INSERT INTO `phone_mdt_refs` (`kind`, `counter`) VALUES
	('badge', 2),
	('cs:LS', 2);

-- Dumping structure for table fivem-server-project.phone_mdt_report_charges
CREATE TABLE IF NOT EXISTS `phone_mdt_report_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `code` varchar(16) NOT NULL,
  `label` varchar(120) NOT NULL,
  `class` varchar(16) NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 1,
  `months` int(10) unsigned NOT NULL DEFAULT 0,
  `fine` int(10) unsigned NOT NULL DEFAULT 0,
  `expunged` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_report` (`report_id`),
  KEY `idx_cid` (`citizenid`,`expunged`),
  KEY `idx_fk_mdt_charges_report` (`report_id`),
  CONSTRAINT `fk_mdt_charges_report` FOREIGN KEY (`report_id`) REFERENCES `phone_mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_report_charges: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_report_involved
CREATE TABLE IF NOT EXISTS `phone_mdt_report_involved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `role` varchar(16) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_party` (`report_id`,`citizenid`,`role`),
  KEY `idx_cid` (`citizenid`),
  KEY `idx_fk_mdt_involved_report` (`report_id`),
  CONSTRAINT `fk_mdt_involved_report` FOREIGN KEY (`report_id`) REFERENCES `phone_mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_report_involved: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_report_restrictions
CREATE TABLE IF NOT EXISTS `phone_mdt_report_restrictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `identifier` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_rule` (`report_id`,`type`,`identifier`),
  KEY `idx_ident` (`type`,`identifier`),
  KEY `idx_fk_mdt_restrictions_report` (`report_id`),
  CONSTRAINT `fk_mdt_restrictions_report` FOREIGN KEY (`report_id`) REFERENCES `phone_mdt_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_report_restrictions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_reports
CREATE TABLE IF NOT EXISTS `phone_mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `title` varchar(160) NOT NULL,
  `type` varchar(32) NOT NULL,
  `body` mediumtext DEFAULT NULL,
  `evidence` mediumtext DEFAULT NULL,
  `author_cid` varchar(64) NOT NULL,
  `author_name` varchar(96) NOT NULL,
  `author_callsign` varchar(16) DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(8) NOT NULL DEFAULT 'leo',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_created` (`created_at`),
  KEY `idx_type` (`type`),
  KEY `idx_domain` (`domain`),
  KEY `idx_author` (`author_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_reports: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_vehicles
CREATE TABLE IF NOT EXISTS `phone_mdt_vehicles` (
  `plate` varchar(16) NOT NULL,
  `notes` text DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `status` varchar(16) NOT NULL DEFAULT 'valid',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `bolo` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(512) DEFAULT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`plate`),
  KEY `idx_flags` (`stolen`,`bolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_vehicles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_warrants
CREATE TABLE IF NOT EXISTS `phone_mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `subject_name` varchar(96) NOT NULL DEFAULT '',
  `report_id` int(11) DEFAULT NULL,
  `report_ref` varchar(16) DEFAULT NULL,
  `charges` text DEFAULT NULL,
  `felonies` int(10) unsigned NOT NULL DEFAULT 0,
  `misdemeanors` int(10) unsigned NOT NULL DEFAULT 0,
  `infractions` int(10) unsigned NOT NULL DEFAULT 0,
  `bond` int(10) unsigned NOT NULL DEFAULT 0,
  `issued_cid` varchar(64) NOT NULL,
  `issued_name` varchar(96) NOT NULL DEFAULT '',
  `issued_callsign` varchar(16) DEFAULT NULL,
  `department` varchar(64) NOT NULL DEFAULT '',
  `issued_at` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_ref` (`ref`),
  KEY `idx_subject` (`citizenid`,`expiry`),
  KEY `idx_expiry` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_warrants: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_mdt_weapons
CREATE TABLE IF NOT EXISTS `phone_mdt_weapons` (
  `serial` varchar(32) NOT NULL,
  `name` varchar(96) NOT NULL,
  `class` varchar(16) NOT NULL DEFAULT 'other',
  `owner` varchar(64) DEFAULT NULL,
  `owner_name` varchar(96) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'registered',
  `bolo` tinyint(1) NOT NULL DEFAULT 0,
  `ballistics` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `registered_by` varchar(64) DEFAULT NULL,
  `registered_at` int(11) NOT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `idx_owner` (`owner`,`registered_at`),
  KEY `idx_status` (`status`,`registered_at`),
  KEY `idx_filed` (`registered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_mdt_weapons: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_message_group_members
CREATE TABLE IF NOT EXISTS `phone_message_group_members` (
  `group_id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `number` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`group_id`,`citizenid`),
  KEY `idx_pmgm_cid` (`citizenid`),
  KEY `idx_fk_message_group_members_group` (`group_id`),
  CONSTRAINT `fk_message_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `phone_message_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_message_group_members: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_message_groups
CREATE TABLE IF NOT EXISTS `phone_message_groups` (
  `id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `avatar` varchar(512) DEFAULT NULL,
  `owner_cid` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_message_groups_owner` (`owner_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_message_groups: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_message_reactions
CREATE TABLE IF NOT EXISTS `phone_message_reactions` (
  `mid` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `emoji` varchar(32) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`mid`,`citizenid`,`emoji`),
  KEY `idx_phone_message_reactions_mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_message_reactions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` varchar(16) NOT NULL,
  `mid` varchar(16) DEFAULT NULL,
  `citizenid` varchar(64) NOT NULL,
  `conversation` varchar(48) NOT NULL,
  `sender` varchar(32) NOT NULL DEFAULT '',
  `direction` varchar(16) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `body` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `withheld` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_messages_thread` (`citizenid`,`conversation`,`created_at`),
  KEY `idx_phone_messages_mid` (`mid`),
  KEY `idx_phone_messages_unread` (`citizenid`,`is_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_messages: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_migrations
CREATE TABLE IF NOT EXISTS `phone_migrations` (
  `name` varchar(64) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stats`)),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_migrations: ~3 rows (approximately)
INSERT INTO `phone_migrations` (`name`, `applied_at`, `stats`) VALUES
	('accounts_orphan_mail_cleanup', '2026-09-02 17:17:23', '{"removed":0}'),
	('birdy_handle_rekey', '2026-09-02 17:17:23', '{"fresh":true}'),
	('documents_unlock_player_rows', '2026-09-02 17:17:23', '{"repaired":0}'),
	('settings_phone_number_bare_digits', '2026-09-02 17:17:23', '{"normalized":0}');

-- Dumping structure for table fivem-server-project.phone_notes
CREATE TABLE IF NOT EXISTS `phone_notes` (
  `citizenid` varchar(60) NOT NULL,
  `id` varchar(40) NOT NULL,
  `body` mediumtext NOT NULL,
  `sketches` mediumtext NOT NULL,
  `images` mediumtext DEFAULT NULL,
  `created_at` varchar(40) NOT NULL,
  `updated_at` varchar(40) NOT NULL,
  PRIMARY KEY (`citizenid`,`id`),
  KEY `updated` (`citizenid`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_notes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_notif_prefs
CREATE TABLE IF NOT EXISTS `phone_notif_prefs` (
  `citizenid` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sounds` tinyint(1) NOT NULL DEFAULT 1,
  `tone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`citizenid`,`app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_notif_prefs: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_passwords
CREATE TABLE IF NOT EXISTS `phone_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `app` varchar(24) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_vault` (`citizenid`,`app`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_passwords: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_payphones
CREATE TABLE IF NOT EXISTS `phone_payphones` (
  `location` varchar(64) NOT NULL,
  `number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`location`),
  UNIQUE KEY `uq_phone_payphones_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_payphones: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_pending_messages
CREATE TABLE IF NOT EXISTS `phone_pending_messages` (
  `id` varchar(16) NOT NULL,
  `mid` varchar(16) NOT NULL,
  `number` varchar(48) NOT NULL,
  `sender` varchar(32) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `body` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_phone_pending_messages_number` (`number`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_pending_messages: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photo_album_items
CREATE TABLE IF NOT EXISTS `phone_photo_album_items` (
  `album_id` varchar(16) NOT NULL,
  `photo_id` varchar(16) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`album_id`,`photo_id`),
  KEY `idx_album_items_photo` (`photo_id`),
  KEY `idx_fk_photo_album_items_album` (`album_id`),
  KEY `idx_fk_photo_album_items_photo` (`photo_id`),
  CONSTRAINT `fk_photo_album_items_album` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_album_items_photo` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photo_album_items: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photo_albums
CREATE TABLE IF NOT EXISTS `phone_photo_albums` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_phone_albums_owner` (`citizenid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photo_albums: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_comment_likes
CREATE TABLE IF NOT EXISTS `phone_photogram_comment_likes` (
  `comment_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`,`username`),
  KEY `idx_photogram_comment_likes_c` (`comment_id`),
  KEY `idx_fk_photogram_comment_likes_comment` (`comment_id`),
  CONSTRAINT `fk_photogram_comment_likes_comment` FOREIGN KEY (`comment_id`) REFERENCES `phone_photogram_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_comment_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_comments
CREATE TABLE IF NOT EXISTS `phone_photogram_comments` (
  `id` varchar(16) NOT NULL,
  `post_id` varchar(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `gif_url` varchar(512) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photogram_comments_post` (`post_id`,`created_at`),
  KEY `idx_fk_photogram_comments_post` (`post_id`),
  CONSTRAINT `fk_photogram_comments_post` FOREIGN KEY (`post_id`) REFERENCES `phone_photogram_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_comments: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_dms
CREATE TABLE IF NOT EXISTS `phone_photogram_dms` (
  `id` varchar(16) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `body` text DEFAULT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `reactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reactions`)),
  `read_flag` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photogram_dms_from` (`from_user`,`created_at`),
  KEY `idx_photogram_dms_to` (`to_user`,`created_at`),
  KEY `idx_photogram_dms_unread` (`to_user`,`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_dms: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_follows
CREATE TABLE IF NOT EXISTS `phone_photogram_follows` (
  `follower` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'accepted',
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`follower`,`target`),
  KEY `idx_photogram_follows_target` (`target`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_follows: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_likes
CREATE TABLE IF NOT EXISTS `phone_photogram_likes` (
  `post_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`username`),
  KEY `idx_photogram_likes_post` (`post_id`),
  KEY `idx_fk_photogram_likes_post` (`post_id`),
  CONSTRAINT `fk_photogram_likes_post` FOREIGN KEY (`post_id`) REFERENCES `phone_photogram_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_notifications
CREATE TABLE IF NOT EXISTS `phone_photogram_notifications` (
  `id` varchar(16) NOT NULL,
  `recipient` varchar(64) NOT NULL,
  `kind` varchar(16) NOT NULL,
  `actor` varchar(64) NOT NULL,
  `post_id` varchar(16) DEFAULT NULL,
  `preview` varchar(200) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photogram_notifs_recipient` (`recipient`,`created_at`),
  KEY `idx_photogram_notifs_unseen` (`recipient`,`seen`),
  KEY `idx_photogram_notifs_dedupe` (`recipient`,`kind`,`actor`,`post_id`),
  KEY `idx_fk_photogram_notifications_post` (`post_id`),
  CONSTRAINT `fk_photogram_notifications_post` FOREIGN KEY (`post_id`) REFERENCES `phone_photogram_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_notifications: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_posts
CREATE TABLE IF NOT EXISTS `phone_photogram_posts` (
  `id` varchar(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `caption` varchar(2200) NOT NULL DEFAULT '',
  `location` varchar(120) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photogram_posts_author` (`author`,`created_at`),
  KEY `idx_photogram_posts_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_posts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_profiles
CREATE TABLE IF NOT EXISTS `phone_photogram_profiles` (
  `username` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL DEFAULT '',
  `bio` varchar(200) NOT NULL DEFAULT '',
  `avatar` varchar(512) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_saves
CREATE TABLE IF NOT EXISTS `phone_photogram_saves` (
  `post_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`username`,`post_id`),
  KEY `idx_photogram_saves_user` (`username`,`created_at`),
  KEY `idx_fk_photogram_saves_post` (`post_id`),
  CONSTRAINT `fk_photogram_saves_post` FOREIGN KEY (`post_id`) REFERENCES `phone_photogram_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_saves: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_stories
CREATE TABLE IF NOT EXISTS `phone_photogram_stories` (
  `id` varchar(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `image` varchar(512) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photogram_stories_author` (`author`,`created_at`),
  KEY `idx_photogram_stories_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_stories: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photogram_story_views
CREATE TABLE IF NOT EXISTS `phone_photogram_story_views` (
  `story_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`story_id`,`username`),
  KEY `idx_photogram_story_views_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photogram_story_views: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_photos
CREATE TABLE IF NOT EXISTS `phone_photos` (
  `id` varchar(16) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `url` varchar(512) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_phone_photos_owner` (`citizenid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_photos: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_racing_profiles
CREATE TABLE IF NOT EXISTS `phone_racing_profiles` (
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `alias` varchar(24) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `mmr` int(11) NOT NULL DEFAULT 1000,
  `hud` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `idx_racing_profiles_mmr` (`mmr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_racing_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_racing_results
CREATE TABLE IF NOT EXISTS `phone_racing_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_id` int(11) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `time_ms` int(11) NOT NULL DEFAULT 0,
  `vehicle` varchar(64) DEFAULT NULL,
  `class` varchar(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `racers` int(11) DEFAULT NULL,
  `mmr_delta` int(11) DEFAULT NULL,
  `mmr_after` int(11) DEFAULT NULL,
  `best_lap_ms` int(11) DEFAULT NULL,
  `sectors` varchar(64) DEFAULT NULL,
  `dnf` tinyint(1) NOT NULL DEFAULT 0,
  `ranked` tinyint(1) NOT NULL DEFAULT 0,
  `finished_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_racing_results_board` (`track_id`,`dnf`,`time_ms`),
  KEY `idx_racing_results_recent` (`track_id`,`dnf`,`finished_at`),
  KEY `idx_racing_results_racer` (`citizenid`,`finished_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_racing_results: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_racing_tracks
CREATE TABLE IF NOT EXISTS `phone_racing_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `citizenid` varchar(64) DEFAULT NULL,
  `author_name` varchar(64) NOT NULL DEFAULT '',
  `checkpoints` longtext NOT NULL,
  `gate_count` int(11) NOT NULL DEFAULT 0,
  `is_sprint` tinyint(1) NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_racing_tracks_live` (`deleted`,`published`,`featured`,`name`),
  KEY `idx_racing_tracks_creator` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_racing_tracks: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_radio
CREATE TABLE IF NOT EXISTS `phone_radio` (
  `citizenid` varchar(64) NOT NULL,
  `frequency` decimal(5,1) NOT NULL DEFAULT 1.0,
  `volume` int(11) NOT NULL DEFAULT 50,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_radio: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_radio_saved
CREATE TABLE IF NOT EXISTS `phone_radio_saved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `label` varchar(40) NOT NULL,
  `frequency` decimal(5,1) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_radio_saved: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_review_business_meta
CREATE TABLE IF NOT EXISTS `phone_review_business_meta` (
  `business_id` varchar(60) NOT NULL,
  `hours` varchar(64) DEFAULT NULL,
  `blurb` varchar(200) DEFAULT NULL,
  `logo` varchar(16) DEFAULT NULL,
  `updated_by` varchar(60) DEFAULT NULL,
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_review_business_meta: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_review_helpful
CREATE TABLE IF NOT EXISTS `phone_review_helpful` (
  `review_id` int(11) NOT NULL,
  `citizenid` varchar(60) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`review_id`,`citizenid`),
  KEY `idx_fk_review_helpful_review` (`review_id`),
  CONSTRAINT `fk_review_helpful_review` FOREIGN KEY (`review_id`) REFERENCES `phone_review_reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_review_helpful: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_review_reviews
CREATE TABLE IF NOT EXISTS `phone_review_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(60) NOT NULL,
  `citizenid` varchar(60) NOT NULL,
  `author` varchar(80) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_biz_cid` (`business_id`,`citizenid`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_review_reviews: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_ryde_drivers
CREATE TABLE IF NOT EXISTS `phone_ryde_drivers` (
  `username` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL DEFAULT '',
  `vehicle` varchar(64) NOT NULL DEFAULT '',
  `plate` varchar(16) NOT NULL DEFAULT '',
  `color` varchar(16) NOT NULL DEFAULT '#111111',
  `rating_sum` int(11) NOT NULL DEFAULT 0,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `trips` int(11) NOT NULL DEFAULT 0,
  `earnings_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_ryde_drivers: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_ryde_rides
CREATE TABLE IF NOT EXISTS `phone_ryde_rides` (
  `id` varchar(16) NOT NULL,
  `rider_username` varchar(64) NOT NULL,
  `rider_name` varchar(64) NOT NULL DEFAULT '',
  `driver_username` varchar(64) DEFAULT NULL,
  `driver_name` varchar(64) NOT NULL DEFAULT '',
  `pickup_label` varchar(96) NOT NULL DEFAULT '',
  `pickup_x` float NOT NULL DEFAULT 0,
  `pickup_y` float NOT NULL DEFAULT 0,
  `dropoff_label` varchar(96) NOT NULL DEFAULT '',
  `dropoff_x` float NOT NULL DEFAULT 0,
  `dropoff_y` float NOT NULL DEFAULT 0,
  `distance` float NOT NULL DEFAULT 0,
  `fare` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(8) NOT NULL DEFAULT 'cash',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(16) NOT NULL DEFAULT 'completed',
  `rating` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ryde_rides_rider` (`rider_username`),
  KEY `idx_ryde_rides_driver` (`driver_username`),
  KEY `idx_ryde_rides_rider_recent` (`rider_username`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_ryde_rides: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_saved_jobs
CREATE TABLE IF NOT EXISTS `phone_saved_jobs` (
  `citizenid` varchar(64) NOT NULL,
  `jobs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`jobs`)),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_saved_jobs: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_secret_apps
CREATE TABLE IF NOT EXISTS `phone_secret_apps` (
  `citizenid` varchar(64) NOT NULL,
  `app_id` varchar(64) NOT NULL,
  `unlocked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_secret_apps: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_service_invoices
CREATE TABLE IF NOT EXISTS `phone_service_invoices` (
  `id` varchar(48) NOT NULL,
  `job` varchar(64) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sender_cid` varchar(64) NOT NULL,
  `sender_name` varchar(128) DEFAULT NULL,
  `sender_number` varchar(32) DEFAULT NULL,
  `target_cid` varchar(64) NOT NULL,
  `target_name` varchar(128) DEFAULT NULL,
  `target_number` varchar(32) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'pending',
  `created_at` int(11) NOT NULL,
  `paid_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job` (`job`,`created_at`),
  KEY `idx_target` (`target_cid`,`status`,`created_at`),
  KEY `idx_sender` (`sender_cid`,`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_service_invoices: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_service_messages
CREATE TABLE IF NOT EXISTS `phone_service_messages` (
  `id` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `citizen_number` varchar(32) NOT NULL,
  `citizen_name` varchar(128) DEFAULT NULL,
  `sender` varchar(8) NOT NULL,
  `staff_cid` varchar(64) DEFAULT NULL,
  `staff_name` varchar(128) DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `kind` varchar(16) NOT NULL DEFAULT 'text',
  `meta` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_job` (`job`,`citizen_number`,`created_at`),
  KEY `idx_cit` (`citizen_number`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_service_messages: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_service_msg_reads
CREATE TABLE IF NOT EXISTS `phone_service_msg_reads` (
  `viewer` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `citizen_number` varchar(32) NOT NULL,
  `last_read` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`viewer`,`job`,`citizen_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_service_msg_reads: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_service_prefs
CREATE TABLE IF NOT EXISTS `phone_service_prefs` (
  `citizenid` varchar(64) NOT NULL,
  `job` varchar(64) NOT NULL,
  `duty` tinyint(1) NOT NULL DEFAULT 1,
  `job_calls` tinyint(1) NOT NULL DEFAULT 1,
  `job_messages` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_service_prefs: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_settings
CREATE TABLE IF NOT EXISTS `phone_settings` (
  `citizenid` varchar(64) NOT NULL,
  `device` varchar(16) NOT NULL DEFAULT 'phone',
  `phone_number` varchar(20) DEFAULT NULL,
  `active_group_id` varchar(16) DEFAULT NULL,
  `ringtone` varchar(64) DEFAULT NULL,
  `notification_tone` varchar(64) DEFAULT NULL,
  `airplane_mode` tinyint(1) NOT NULL DEFAULT 0,
  `card_name` varchar(64) DEFAULT NULL,
  `card_avatar` varchar(512) DEFAULT NULL,
  `card_email` varchar(128) DEFAULT NULL,
  `card_address` varchar(128) DEFAULT NULL,
  `installed_apps` text DEFAULT NULL,
  `home_layout` text DEFAULT NULL,
  `lock_clock` text DEFAULT NULL,
  `wallpaper` varchar(512) DEFAULT NULL,
  `wallpaper_home` varchar(512) DEFAULT NULL,
  `blur_lock` tinyint(1) DEFAULT NULL,
  `blur_home` tinyint(1) DEFAULT NULL,
  `island_pet` varchar(16) DEFAULT NULL,
  `custom_wallpapers` text DEFAULT NULL,
  `passcode` varchar(8) DEFAULT NULL,
  `face_id` tinyint(1) NOT NULL DEFAULT 0,
  `chat_text_scale` decimal(3,2) DEFAULT NULL,
  `reduce_motion` tinyint(4) DEFAULT NULL,
  `bold_text` tinyint(1) DEFAULT NULL,
  `text_scale` decimal(3,2) DEFAULT NULL,
  `app_labels` text DEFAULT NULL,
  `phone_scale` tinyint(3) unsigned DEFAULT NULL,
  `brightness` tinyint(3) unsigned DEFAULT NULL,
  `phone_align` varchar(16) DEFAULT NULL,
  `phone_tilt` varchar(48) DEFAULT NULL,
  `dock_style` varchar(12) DEFAULT NULL,
  `open_anim` varchar(12) DEFAULT NULL,
  `wallpaper_parallax` tinyint(1) DEFAULT NULL,
  `hour24` tinyint(1) DEFAULT NULL,
  `caller_id` tinyint(1) DEFAULT NULL,
  `streamer_mode` tinyint(1) DEFAULT NULL,
  `streamer_hide` varchar(255) DEFAULT NULL,
  `reopen_app` tinyint(1) DEFAULT NULL,
  `setup_done` tinyint(1) DEFAULT NULL,
  `theme` varchar(8) DEFAULT NULL,
  `dark_theme` varchar(16) DEFAULT NULL,
  `light_theme` varchar(16) DEFAULT NULL,
  `accent` varchar(16) DEFAULT NULL,
  `shell` varchar(16) DEFAULT NULL,
  `game_time` tinyint(1) DEFAULT NULL,
  `palette_custom` longtext DEFAULT NULL,
  `icon_theme` varchar(16) DEFAULT NULL,
  `icon_custom` longtext DEFAULT NULL,
  `show_app_names` tinyint(1) NOT NULL DEFAULT 1,
  `home_density` varchar(12) DEFAULT NULL,
  `ringtone_volume` tinyint(3) unsigned DEFAULT NULL,
  `call_volume` tinyint(3) unsigned DEFAULT NULL,
  `locale` varchar(8) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`device`),
  KEY `idx_phone_settings_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table fivem-server-project.phone_signatures
CREATE TABLE IF NOT EXISTS `phone_signatures` (
  `citizenid` varchar(64) NOT NULL,
  `image` mediumtext NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_signatures: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_sim_cards
CREATE TABLE IF NOT EXISTS `phone_sim_cards` (
  `number` varchar(20) NOT NULL,
  `identity` varchar(64) NOT NULL,
  `owner_cid` varchar(64) DEFAULT NULL,
  `adopted_by` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`number`),
  KEY `idx_phone_sim_identity` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping structure for table fivem-server-project.phone_stock_holdings
CREATE TABLE IF NOT EXISTS `phone_stock_holdings` (
  `citizenid` varchar(64) NOT NULL,
  `symbol` varchar(16) NOT NULL,
  `quantity` decimal(24,8) NOT NULL,
  `avg_cost` decimal(18,6) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`citizenid`,`symbol`),
  KEY `citizenid` (`citizenid`),
  KEY `idx_stock_holdings_symbol` (`symbol`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_stock_holdings: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_stock_prices
CREATE TABLE IF NOT EXISTS `phone_stock_prices` (
  `symbol` varchar(16) NOT NULL,
  `price` decimal(24,8) NOT NULL,
  `history` longtext DEFAULT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_stock_prices: ~30 rows (approximately)
INSERT INTO `phone_stock_prices` (`symbol`, `price`, `history`, `updated_at`) VALUES
	('AMU', 262.06405075, '[260.79778776755247,261.1558589414817,261.046450185329,261.10192333759115,261.1320111949371,260.77013879392168,260.61118773048437,260.7305233139716,260.2626480195114,260.3767951939258,260.2102422564164,260.2422815520011,260.31328053258286,260.0666033451291,260.3355070555876,260.64729748365587,260.53226453112065,260.34794499922728,260.3125002503704,260.80651400817427,261.15572250631205,261.2442226499588,261.3192130643938,261.4040620728202,261.46522259097767,261.4260255082836,261.4806060988225,261.59930262879836,261.8985267337998,261.842647587427,261.45092750866436,261.39013588886555,261.3879259939596,261.46201480110519,261.860831201611,261.56416303632667,261.35594492324057,261.7696586973605,261.95125937943706,262.03607270839509,261.76127726093548,261.6493089434452,261.7045650767179,261.9020997706624,261.90947293949037,262.087094464429,262.1776297594819,262.06405074742488]', 1789330064),
	('BIL', 277.85407432, '[279.8682260148802,279.78060860832906,279.5960073667256,280.2385146590472,280.3037986105255,279.787430493023,279.0106892839914,279.4375558514717,278.6081484489355,278.3488862147366,278.9549145774423,278.9793086251501,278.7020405416087,278.231036583928,277.7244982045606,277.42919590035418,277.561153852346,277.513245316789,277.67389252714278,277.624180845777,277.6704985998404,277.73484626092115,278.5311138540501,278.3478658993086,278.5606389347413,278.55980608760566,278.57130190787259,278.1954060571485,278.67331447662277,278.1270977074525,278.51958623783329,277.89509664632495,278.4291755092781,278.60497189763978,278.5118004593854,278.6612877632764,278.8978762019191,278.97404645528,279.19006623216139,278.9818797877433,278.7032606176261,278.71011241922067,278.6755030711003,277.9969371785988,278.7365036975916,278.6925123487999,278.44228029627166,277.85407431641587]', 1789330064),
	('BSH', 25.44925761, '[25.39964221679162,25.3933215774095,25.39168507603176,25.40905371714867,25.43830974705245,25.47573798061915,25.44602159337248,25.42315246657908,25.38496582448714,25.41829708948706,25.40513913763066,25.40871372361172,25.3777561962428,25.4179081070661,25.4366045392996,25.40709525543967,25.44576880844116,25.48512708674037,25.45982024067218,25.47787712731616,25.48385995377352,25.51561575386552,25.52565536550813,25.51501854365471,25.55512354722745,25.60081285360722,25.60786600070022,25.61041443163824,25.59269856246195,25.55975056178852,25.57119101195984,25.57790971783566,25.61747752865706,25.56651403177983,25.5420450464613,25.53619375658234,25.56430736097003,25.51379858897403,25.48971911281285,25.49076647807192,25.48686222919078,25.44379874986843,25.45838593126108,25.43339293189787,25.4295467236666,25.44873389856713,25.42838465882304,25.44925760854447]', 1789330064),
	('BTL', 56441.14070822, '[56112.94396152863,56220.655573558186,56235.79518076425,56182.42238935073,56247.586179912774,56329.01936116123,56479.01066523671,56369.45062239722,56444.49600237013,56477.705865289034,56359.44319916543,56387.157887034904,56331.892627285124,56262.84068065384,55949.85399113159,55866.09404491314,55813.928050336115,55828.50654764739,55878.379297281324,55843.411283159134,55752.06772584298,55718.04554061451,55852.596345371385,55786.57722979209,55770.861263180115,55607.9089291352,55752.734462572604,55926.637042667564,56000.51070258856,55910.189639571094,55791.15064535245,55794.54047530971,55926.391159686085,55979.59423934194,55978.91535392386,55762.04875539523,55885.67782378217,55853.49251832421,56009.07961162781,56164.57430013976,56198.206953788474,56145.19864175453,56205.00893968431,56319.8312264388,56267.9432697333,56338.41361424751,56425.85173491305,56441.14070821513]', 1789330064),
	('CLK', 16.49399898, '[16.52647474386896,16.5453618944713,16.53175814928088,16.54296767196662,16.51793453838182,16.52352605285795,16.49803279728929,16.50856782986303,16.52349534893287,16.53674236033556,16.52970017603791,16.55305146696497,16.53153540466909,16.5265334942889,16.51384866962269,16.54196445570878,16.51865550767588,16.51836477610983,16.51022927148616,16.51947425766265,16.49710019764782,16.49028064267531,16.48110235631181,16.46808179336991,16.48396356439764,16.48665326136953,16.48277585410469,16.48659291489078,16.4863963197674,16.4996580974503,16.48931790891539,16.49567951494857,16.49863393001868,16.50773018419703,16.50400705366098,16.50411301071328,16.51880404944277,16.51078490687128,16.50892215585041,16.48046378765912,16.49233659214508,16.47478988395973,16.49644182265187,16.47746639678556,16.50136857354408,16.50862577915661,16.50908629831058,16.49399897616864]', 1789330064),
	('DY8', 424.44237456, '[431.15746956701568,430.7357759462449,430.3221456117795,429.9745630512827,430.1975666628341,430.38911271093186,430.70279520342828,430.7893835930862,431.06762717734218,430.9713534944901,431.5032024076697,431.40665364277586,431.1957965322778,430.35420559943466,429.81951018564038,429.4754564719907,430.1511045857795,430.37418778569039,430.0286985989153,429.62819515409685,429.6582553259938,429.30978758224469,429.5433153106355,428.9370439292661,428.82145090146687,428.5826314509129,427.94014712493847,428.13590107429595,427.9853652930901,427.2565661399382,427.14379111193309,426.91265719358929,426.7321363747275,426.18760616900246,426.52466047161865,426.731595008616,425.89784635877455,425.3525266895669,424.3331493915929,424.1021225645859,423.7250952070103,423.43397895590837,423.27946202134577,423.87217567362969,424.1881130952665,424.43466047975059,424.58799046033888,424.442374563444]', 1789330064),
	('ECL', 53.50480426, '[53.87583628743025,53.9361408188351,53.83394863261071,53.82670801210961,53.86873784549523,53.78564594633665,53.84690859212524,53.92936337471589,53.94325930541478,53.96684424551933,53.99339009033787,53.92794621919376,53.93424783944645,53.87908903607079,53.8671879690855,53.89616027995156,53.93942427294829,53.92519046161636,53.91454592177164,53.92997943300143,53.94386997695569,53.97216886346184,53.97996297776942,53.97884843290612,53.93445370236898,53.95828243468589,53.90569053923467,53.93812577247448,54.02756248475444,53.93105444605331,53.88595217759089,53.86875462885143,53.80921530545242,53.73481483124752,53.69958739693979,53.71231995386851,53.70320677681941,53.67971018526958,53.65803623778132,53.59196555660663,53.60807377382748,53.61878701317355,53.59727931604987,53.57118025747972,53.57316051287631,53.59002117765714,53.56592047511124,53.50480425968251]', 1789330064),
	('ETD', 7425.81174903, '[7444.932521815843,7460.026492402735,7450.899493033122,7425.146821429045,7423.299846783206,7430.769239064008,7402.055635931513,7409.210687535314,7404.0141765960229,7393.681640996999,7405.91228716056,7414.20938616007,7402.7366268151449,7408.947179675972,7398.5818598368409,7402.246649516652,7383.998203190314,7375.3406902701,7377.0200917420429,7369.529083732843,7360.397313654033,7340.674401552906,7346.712243652529,7342.360256029649,7380.107332121367,7372.51108970881,7380.333879294989,7357.151974202074,7365.623533123383,7385.047413161221,7389.065420327198,7386.659075297795,7394.16640456079,7424.234206489289,7422.139462090508,7425.229487811061,7456.568173367056,7445.088738785778,7470.287423139561,7459.105783797377,7463.207565342092,7488.984500927108,7457.122996425363,7438.837311909925,7422.375295115578,7405.2569430803819,7429.736181285182,7425.811749034954]', 1789330064),
	('FLC', 10.91926657, '[11.02025054455431,11.03064721518095,11.01940776521315,10.98030447228702,11.02870303729004,10.97036175070206,10.98932638927032,11.04395457329389,11.03925473719131,11.01346259022806,10.94738608694825,10.94687424829492,10.97249206558225,10.98870657314135,11.01204364162985,11.02250364417306,11.04038197057279,11.03980962357195,11.04075103561706,11.03542907060447,11.01557744157009,10.99540868482546,11.0091723084032,10.9908181669519,10.99111926734177,11.00939226626872,11.00130111773253,11.01001806639743,11.03518358890341,11.01893586600008,10.99461546464412,11.00982349468926,11.05795699153807,10.99558977588168,10.9728760083519,10.96624725786384,10.96528667038006,11.01748164533566,11.03713976106668,11.02536428833594,11.03422180542322,11.00814083993988,10.9746035384961,10.94588950509454,10.97682773797153,10.97239478068396,10.94833295214612,10.91926656522932]', 1789330064),
	('FLY', 8.28138809, '[8.36392938168195,8.36397639825898,8.35211928891379,8.32001140785843,8.3311079918054,8.33069420981088,8.32135425489378,8.31912170512822,8.29635346634611,8.292540413021,8.30229429851808,8.30785450162608,8.30447082502799,8.29825753830274,8.29979884791711,8.30143570120975,8.29305910814084,8.29366569802114,8.29288867251627,8.28195347199885,8.2868896496498,8.29938300609998,8.30154698149811,8.29906372590208,8.3063909331148,8.29898130303867,8.30205778513003,8.29167319670107,8.28658937536119,8.28931490072568,8.27923915933077,8.28333364570126,8.28354480132572,8.26814860121616,8.25740517060376,8.24995990377152,8.26031047874803,8.26260714322523,8.25883352924314,8.26659272528986,8.26589832935819,8.28770769105905,8.28398425823558,8.28934208587832,8.29633344730816,8.29454659746155,8.29034447649328,8.28138808817146]', 1789330064),
	('FRT', 462.23741444, '[460.87639082330636,461.0028695120459,460.49017312953546,460.04831194406128,460.0670479412421,460.34082955824376,460.26632886842119,459.75276319332019,459.1737322295125,459.2625597621428,459.75553406637678,459.50091035648827,459.984773791674,459.75533668615398,460.5440258086345,461.00645434266246,460.680464032442,460.4682350550771,460.38895787118107,460.3640577837545,461.34393889747425,461.2565120887022,460.3999700109963,460.78208027178229,460.8213542647265,460.66449219012278,461.2736410403193,460.4268729142441,459.89169337044918,460.4564801353231,461.1790586766748,462.02372656422468,462.00056489687196,462.2432047276382,462.4096961534311,462.5976245398519,462.36222125124399,462.8492435519994,462.42455578328846,461.72569705462447,461.72332693130519,461.76108360466517,461.4368399242151,461.76456632275088,462.9631131736058,462.6678140737082,462.36083475553746,462.23741444101679]', 1789330064),
	('GPO', 55.97194219, '[56.12037523635558,56.16026205989161,56.12437095198409,56.1242622179653,56.1973980491444,56.11502973008488,56.10595629751191,56.15152858798441,56.18285355549321,56.28269491038253,56.22024024445735,56.23805490562429,56.17670677791803,56.278628409361,56.2753530949194,56.28749231433548,56.21188198876223,56.16897344456547,56.11726176048824,56.13502493021937,56.10769147684296,56.13966292873752,56.19763370731056,56.17997945387857,56.13929174516139,56.15285751481564,56.13019777797846,56.12876986896992,56.08131181015852,56.08161034559089,56.08664390988969,56.09958308866489,56.16319633490374,56.11803773158576,56.13227699640212,56.11853307147132,56.16427435519636,56.06903044065022,56.07546994008081,56.12608936836607,56.11021282805004,56.03813401560877,56.06203066167289,56.02943162520022,56.03670021534153,56.01583335146373,55.96859924051674,55.97194219348012]', 1789330064),
	('KIF', 58.82374762, '[58.55786598660757,58.70195233957247,58.53966531727563,58.71014656900641,58.75375941578274,58.84137028832853,58.97815155073274,58.63130586816336,58.5064657642307,58.26330824279986,58.01260282239808,58.07873327582331,57.87869392562604,57.93144486443977,57.82062374866585,57.72733000509891,57.7288439135789,58.19642062407376,58.38230142742334,58.41097053601027,58.27466308648763,58.13726012774077,58.12654438808336,58.18656967850927,58.00248461182219,57.99868407583405,58.0389607922748,57.88309282769337,58.1018617116047,58.28038279566674,58.55449378867601,58.45314411996936,58.29831667451871,58.29576357021946,58.31540420667071,58.03369377704884,57.99278127611652,57.72651918358376,57.63918775752366,57.89515787721058,57.98157768604989,58.29595502151908,58.37127647820166,58.2044844856939,58.38450575271687,58.45804871673317,58.79027716489828,58.82374761719918]', 1789330064),
	('LFI', 48.35704399, '[48.00423886823898,48.03997936732743,48.06665726464854,48.101793449998,48.12494996203313,48.13512118274663,48.06605593228766,48.1378506575037,48.16245332340769,48.18634548255272,48.22685057365165,48.27231306977175,48.26845198269908,48.32753876748506,48.24244236255216,48.17885843846281,48.23823353169109,48.28033887854205,48.19596791494149,48.13298840068226,48.20215375067818,48.15315900047109,48.29254275564186,48.23848709191687,48.397415072821,48.40479389323956,48.38271224372909,48.30308801315965,48.22046762169479,48.3484353440977,48.26472203063193,48.21614496199435,48.12634077440954,48.19597776526596,48.20396344130525,48.27117468161837,48.27163630237447,48.09720228389216,48.00344194039121,48.12620802293109,48.09948393972401,48.13078247612139,48.12622149582931,48.16263350640801,48.22834384015477,48.26440588664715,48.29310771759301,48.35704399084945]', 1789330064),
	('MAI', 83.00031386, '[82.53766985778944,82.56028315638703,82.4910612834538,82.37804339492796,82.39525600836832,82.40969414341154,82.37261412256426,82.3952102550614,82.33039604341994,82.345776433954,82.30403417276577,82.2834599207767,82.3200798135691,82.3599445894586,82.5004795953318,82.54146008722317,82.57362978514029,82.37922071584035,82.43299726866695,82.40657741152633,82.42345106780616,82.4116082977733,82.34641773320914,82.47180672750494,82.57525570599893,82.55374912559704,82.49737461752295,82.5981055406357,82.61478258211854,82.62672145582613,82.6682563645142,82.77100986169639,82.84460139280029,82.80258426996152,82.8613003913174,82.87079058326188,82.90218190790115,82.96479663368658,83.00492705033642,82.97541688359329,82.9475389474614,82.87027537122775,82.78755252146553,82.767323562061,82.77412309102769,82.95671081621576,82.9489469424777,83.00031385910713]', 1789330064),
	('MZB', 251.15739918, '[252.2075241261757,252.01300333337069,252.0019423636651,251.7067550399592,251.6238875980929,251.64064834029299,251.52651038398575,251.32962475306253,251.56876700829958,251.6496663494218,251.4829106272575,251.59381658912074,251.48477027624487,251.44069623455699,251.5255055915782,251.3579868259143,251.37685758133524,251.28556619339606,251.2977500591421,251.220648050351,250.85745407479488,250.8748346757968,250.97211869880128,251.01533598286353,251.26366099254455,251.13503618924256,251.10215425527887,250.76693430979405,250.78934871014955,250.90086392702529,251.01090673997755,250.88518573635975,250.81286155011626,250.82195961819827,250.76039245733396,250.9447176374832,250.91637528099182,250.96672486326504,250.83934542189676,250.92602119656653,251.06733620143982,251.2063340699943,250.91512339805719,250.92708342408896,251.036597635297,250.88357120985999,250.99998731187007,251.15739917995016]', 1789330064),
	('MZC', 34.96978107, '[34.3237987325742,34.4053789272828,34.35305946883757,34.53280906658808,34.29640571256859,34.59618994317054,34.43889758054938,34.46173953015967,34.30893659127944,34.39602274157504,34.54679665677531,34.64231520168482,34.52909652882646,34.57938626417952,34.55147497383634,34.71295762536364,34.81802912287376,34.79247210757995,34.7789629792895,34.88271472361385,34.82119836777711,34.7709307420222,34.81175968575744,34.855787509428,34.81503104308332,35.00465940340135,35.06828958678906,34.9988368006279,34.94814446914314,34.95365386536993,34.84978815873678,34.89361455238742,34.9804417345828,34.98262922598683,34.82181773592357,34.60697150211225,34.58109949671557,34.51298524655446,34.59892519005655,34.52498100649041,34.54917135156008,34.62153536252531,34.53127560421539,34.75859409645347,34.78179965022161,34.82186373759482,34.86615976552993,34.96978107200179]', 1789330064),
	('PIS', 24.97942665, '[25.04480003342874,25.06310620358388,25.03684109214337,24.99919087291386,25.03065153850741,25.03234116930975,25.07751140692806,25.08358646322377,25.06094434532271,25.06077137543498,25.02335896168307,24.95608327525424,24.9307378663024,24.96407435771221,24.96623792485648,24.99412710211575,24.95021709427114,24.93695534055716,24.90274813440491,24.90451050304197,24.87949793401922,24.84331944123949,24.86148310565775,24.838985906519,24.8733077902385,24.90544007172973,24.97197985244258,24.94198560730057,24.9629961340001,24.95976510687236,24.94740039026246,24.95622424496734,24.94573358847493,24.95826137762658,24.94443269872868,24.92798177397318,24.92075838457909,24.90333802569673,24.89117079477493,24.87503109100139,24.88332744967142,24.93012198378502,24.89927581969126,24.8913299516419,24.91158463717501,24.92036096962255,24.94967909926072,24.97942664670701]', 1789330064),
	('POG', 0.89169274, '[0.89189670751158,0.8929317141323,0.89117095406492,0.89231362455988,0.89073015843083,0.8906710307464,0.89239977574101,0.89248316631675,0.8935899377296,0.89336918912543,0.8922612518374,0.89149343208723,0.89327104024156,0.88921788282107,0.89054900855978,0.89232685136683,0.8942525838797,0.89754100471542,0.90198301607224,0.90289618102996,0.90357008117452,0.89942294364464,0.89526340068298,0.89405570887399,0.89691951637618,0.89126106551679,0.89302486710596,0.89237312064106,0.88662758106747,0.88232918920487,0.88423797781095,0.88221695334008,0.88959928424144,0.8893265681484,0.87495693662267,0.87962183149098,0.87763545297523,0.87431640450959,0.87597510321675,0.87487796201791,0.87528265820127,0.87345060008247,0.87254935875459,0.87425036104505,0.87341824973317,0.87280770484542,0.88594156852303,0.89169273988591]', 1789330064),
	('RON', 160.58802839, '[160.31069921908159,160.2161730940889,159.895159578374,160.09601831708867,160.24368368427904,160.32662352484156,160.38388949921464,160.29933895869227,160.2251222056185,160.34578006313758,160.3919233950818,160.55845563464878,160.5872242100205,160.34840226244209,160.3971393310142,160.38078715858047,160.09360320915179,160.22629837905394,160.21719621382338,160.14399338725768,159.84356608880655,159.9803495686314,159.98165152837633,160.12576553303718,159.85376443199184,160.0346112449388,160.04981186872645,159.975751497157,159.9772962069874,159.71114840314236,159.38688311547794,159.50946962530413,159.28801956369393,159.15814370313152,159.17469537969786,159.48682538972035,159.50680357480185,159.2592074350286,159.37292898574436,159.57279038964965,159.9094426163896,160.23424138678758,160.41660960146266,160.43217771103003,160.41374389808906,160.52364222293509,160.53046082908208,160.58802838921586]', 1789330064),
	('RWD', 24.89488465, '[25.12012414816919,25.13263831259787,25.1243717981897,25.07767400892869,25.06858173168228,25.06106941138798,25.03085209399896,25.0525988008601,25.03510643125205,24.99158361781129,24.97719315967594,25.00092225501277,25.00980873188744,24.99561575390501,24.98504137098924,24.9777670699555,24.96526682326016,24.95632683446712,24.91922024914695,24.90542220864472,24.90746529486912,24.9227708860942,24.92505509186095,24.93978965129213,24.92880160369864,24.90744512282503,24.91246930985798,24.89663684411275,24.93563470391627,24.9475512251297,24.94011354466528,24.9316659194375,24.90593691707517,24.91341534843768,24.92484481430826,24.93652979432141,24.93120562416903,24.93728539067667,24.90884326544755,24.92201807915806,24.92038005513362,24.93314469935406,24.91305356322649,24.91440442506509,24.88985927169531,24.90968875040814,24.89567884239708,24.89488464703951]', 1789330064),
	('SDC', 205.45396613, '[203.42835906664554,203.67306918260665,202.3674673195778,203.05192173904946,202.8451193529579,202.1770152950157,202.88955319890818,203.12901690933547,204.02861313873036,203.26866785976703,202.92620278079253,202.49576953000438,202.07508032377079,202.42467960558373,202.38394194806038,202.96000699230155,202.52775663229358,202.69141651608065,201.85863109136103,202.49215146467746,202.28857891486553,201.95706729010139,201.71873195382239,201.87365865497544,202.50105876395299,202.28548575497099,203.18440982723997,203.27093042400134,203.86875374798317,203.90518787671514,204.0769222782957,204.0993228692048,205.1322644417793,204.6342367794318,205.06572389957317,204.92212026596602,204.83425084288894,205.56277295521847,205.0251833007173,204.94491128055234,205.26800295947127,205.56586280436205,205.48964706492598,204.87531448109827,205.49440188054244,205.12638189177728,205.48804325458256,205.4539661311425]', 1789330064),
	('SPC', 9.49613276, '[9.09887162504515,9.14774100406082,9.14110190354002,9.1528559656913,9.15928533443769,9.15655412274127,9.14647090106034,9.16588808491645,9.15082563648827,9.17577065966471,9.18470513200703,9.10803175818455,9.1145018931746,9.08825458256501,9.07832418175866,9.0799037499081,9.11065423345325,9.06177644151947,9.06339183097803,9.11347132698555,9.11872050282865,9.16500192419655,9.16239153158023,9.11543390282666,9.18999957805336,9.1811317840958,9.20009482837704,9.27787003025186,9.29462577244084,9.31379596323491,9.32371280384029,9.32792308371284,9.36577839387095,9.40555117704309,9.43764047839034,9.50804700477539,9.55939940720027,9.52921062258982,9.54205969898664,9.48359452079736,9.54123486849519,9.57557827032694,9.56546474171337,9.54555427002892,9.58737476152896,9.55630999099471,9.55288760067618,9.49613276169005]', 1789330064),
	('SPK', 39.17060483, '[39.32944370455226,39.26053678635561,39.24776941686891,39.29548753663818,39.28241095965816,39.30245111566825,39.21738094305036,39.21255656619816,39.22492465856359,39.22518180364929,39.26812867507571,39.30623792108177,39.15029082373605,39.10693980126248,39.15418717071221,39.18294847605815,39.15166989330747,39.15276625487136,39.18025055836248,39.14192880784392,39.18352706947512,39.18951052356065,39.23575828113316,39.15774092762142,39.21098813366348,39.21520105407329,39.15607161906113,39.14068449172394,39.09789468048111,39.1056600211618,39.10617613623656,39.11485021125548,39.16618876716684,39.19725264794014,39.22259795787532,39.23843051779495,39.24164560801068,39.2682930328029,39.25382013608451,39.25824300752355,39.21148024006614,39.19126179433561,39.22410006097539,39.30219828987349,39.3077187643305,39.27514798133649,39.25198796903595,39.17060482710722]', 1789330064),
	('TNK', 111.95164157, '[111.80657337964395,111.73894556179862,111.90644258960893,111.98944902095697,111.94511566418004,112.03474502819694,111.96019075944584,111.90119260432535,111.94330226833107,111.94282707643655,112.07060373246864,112.27140298812927,112.52387488394783,112.43194374146367,112.31105509095737,112.31520799605171,112.27274956119158,112.12478897820322,112.34417290031831,112.36462890284369,112.23820561181677,112.28002476828196,112.43973922973925,112.58982398043956,112.44012806779436,112.45046786131566,112.43729007362717,112.16090665935649,112.17451323536321,111.9601325851654,111.96325829318822,111.8825140516669,111.84312441157366,111.94631399601431,112.12203162130044,112.0219770557506,111.8688572841728,112.13984592204135,112.1574736963069,112.17543054316599,112.07386518606103,111.94132840462005,112.06662552140837,111.94642739321896,111.981138937989,111.98149871337809,111.9915019872567,111.95164157023686]', 1789330064),
	('VAN', 110.19918699, '[110.88179061669149,110.76867990674484,110.83534585402487,110.84915706830025,110.66471126065075,110.62951727107958,110.65187037079926,110.39889925872122,110.30324389696665,110.29145708966796,110.15639009151707,110.26530591023406,110.26115949707868,110.357046113509,110.33823347985227,110.27168873732659,110.3506368858824,110.52808423174722,110.47301378660895,110.40960304901869,110.53510022694317,110.52358179980733,110.56154498744884,110.64550765596845,110.63565863475812,110.54715847561244,110.48669590561656,110.63793288620774,110.4074525358671,110.55415929021294,110.60404023255025,110.55367109435503,110.52236751901238,110.50185032217769,110.51604270224084,110.65695787728946,110.64011207788227,110.47804346299928,110.36796630670897,110.29531949125274,110.36249003331183,110.25672196679222,110.2548205712179,110.29057091599189,110.17680995831323,110.20288865292416,110.18176774238616,110.19918699109944]', 1789330064),
	('VAP', 152.20398321, '[151.74182049976859,151.88568545419722,151.85322483694856,151.94670191346035,152.0213689587835,151.90790219768275,151.84738976845447,151.96972731294529,151.97653859297319,152.02245292178263,151.84250375679086,151.77041140841133,151.59977965537576,151.4266081850526,151.50710745808866,151.552117634994,151.65091824494744,151.5187140335679,151.65168548346044,152.00328270767475,151.92321341659645,152.2129151257027,152.06610558653927,151.97179690424688,151.95189615075115,151.9659235548503,152.02495394567368,151.89532062867333,151.911479095281,152.09362848087756,152.1928843050555,152.28164429734708,152.38002667020627,152.45315013795006,152.82584006701024,152.73598066252394,152.64518415795056,152.62296498591358,152.62591554254747,152.60266753761537,152.4964384231225,152.4600263354683,152.63942272966947,152.76319113174197,152.80436001982899,152.491332989885,152.3933197718921,152.20398321093436]', 1789330064),
	('VWC', 1055.44560928, '[1051.9721177298005,1049.7061777900679,1050.367336385253,1051.212595724605,1050.657671215079,1048.4122557256356,1048.3573290568227,1050.8287532652474,1051.7651564668998,1050.602744833911,1051.3506102248855,1047.5633421883177,1047.4984282127123,1044.3815540362346,1048.3619498302924,1046.8951470944833,1045.6538723472848,1041.4659417529554,1039.113054841538,1034.702788118761,1034.8408902832733,1035.5704954330295,1038.5090378147905,1037.0702440633614,1037.1299835449393,1038.3788391477113,1038.7494969568075,1038.8044459070894,1040.401100141378,1041.8017474393917,1043.8005343473633,1044.0047843512605,1041.1176519421343,1038.3464923979016,1043.0123181359896,1048.0325588331819,1046.4265518177854,1047.8767498423839,1048.226979688851,1047.8887628545998,1049.897950400259,1048.3580863480723,1050.812471349936,1056.132317457719,1056.4808758591635,1056.387871215655,1056.4717625729805,1055.445609279083]', 1789330064),
	('WIZ', 84.72164447, '[83.57466890825708,83.57862976584997,83.49988493347408,83.60984766978993,83.62476496059824,83.5746633941408,83.65905537358899,83.80104034325334,83.75943224129392,83.6763451701627,83.8917959318088,83.83378807135023,83.74188819369469,83.69779888788416,83.85635799764775,83.77952688533985,83.85607321845153,83.83376149822871,83.7998636993742,83.8382190854106,83.98355190705621,84.01392683000022,83.99538902381966,83.99755383402742,84.01462272954969,84.2387043826849,84.26535350183521,84.03072763687917,83.94352516988525,84.15248568507498,84.25084516386672,84.21918501382003,84.08268849664113,84.20925358230005,84.16835592314136,84.26307502544668,84.36153258279339,84.38202055965229,84.511401185211,84.45247752502321,84.38928786489011,84.50331444839401,84.62014881747925,84.69946753984941,84.77319562459855,84.6004619493134,84.73503987427772,84.72164447368739]', 1789330064),
	('WZC', 1.15643095, '[1.20441314170608,1.20058442601973,1.19885712995292,1.19593431381256,1.18161438130656,1.180354812385,1.17912335059182,1.17149539831175,1.1776802401278,1.17406815755447,1.1740094357151,1.17250405038894,1.17258877631535,1.17956886227597,1.17888257669979,1.17829199717442,1.17452907836288,1.1727834906305,1.17824976853083,1.17840936804471,1.171486055502,1.17112220636815,1.16468132861907,1.16550360502097,1.16512815266413,1.16787668129894,1.16418738072135,1.16764390982943,1.16472470741451,1.16383010534373,1.16872263209792,1.1683652025168,1.15901528261566,1.15762184823867,1.15921218960528,1.14991204897866,1.14743915159599,1.14215599201511,1.14239704309396,1.14748092562432,1.15197985155806,1.15124110192314,1.15342283736604,1.15159851947826,1.15536077863457,1.15381851338904,1.14851445734424,1.15643095379297]', 1789330064);

-- Dumping structure for table fivem-server-project.phone_stock_wallet
CREATE TABLE IF NOT EXISTS `phone_stock_wallet` (
  `citizenid` varchar(64) NOT NULL,
  `cash` decimal(18,2) NOT NULL DEFAULT 0.00,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_stock_wallet: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_streak_likes
CREATE TABLE IF NOT EXISTS `phone_streak_likes` (
  `post_id` int(11) NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  UNIQUE KEY `uniq_like` (`post_id`,`citizenid`),
  KEY `idx_fk_streak_likes_post` (`post_id`),
  CONSTRAINT `fk_streak_likes_post` FOREIGN KEY (`post_id`) REFERENCES `phone_streak_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_streak_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_streak_posts
CREATE TABLE IF NOT EXISTS `phone_streak_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `author_name` varchar(80) NOT NULL,
  `image_url` varchar(512) NOT NULL,
  `caption` varchar(160) DEFAULT NULL,
  `day_streak` int(11) NOT NULL,
  `post_date` date NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_player_day` (`citizenid`,`post_date`),
  KEY `idx_created` (`created_at`),
  KEY `idx_cid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_streak_posts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_streaks
CREATE TABLE IF NOT EXISTS `phone_streaks` (
  `citizenid` varchar(64) NOT NULL,
  `current_streak` int(11) NOT NULL DEFAULT 0,
  `longest_streak` int(11) NOT NULL DEFAULT 0,
  `last_post_date` date DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_streaks: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_timer_recents
CREATE TABLE IF NOT EXISTS `phone_timer_recents` (
  `citizenid` varchar(60) NOT NULL,
  `seconds` int(10) unsigned NOT NULL,
  `used_at` bigint(20) NOT NULL,
  PRIMARY KEY (`citizenid`,`seconds`),
  KEY `recency` (`citizenid`,`used_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_timer_recents: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_comment_likes
CREATE TABLE IF NOT EXISTS `phone_vibez_comment_likes` (
  `comment_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`,`username`),
  KEY `idx_vibez_comment_likes_c` (`comment_id`),
  KEY `idx_fk_vibez_comment_likes_comment` (`comment_id`),
  CONSTRAINT `fk_vibez_comment_likes_comment` FOREIGN KEY (`comment_id`) REFERENCES `phone_vibez_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_comment_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_comments
CREATE TABLE IF NOT EXISTS `phone_vibez_comments` (
  `id` varchar(16) NOT NULL,
  `post_id` varchar(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `body` varchar(500) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vibez_comments_post` (`post_id`,`created_at`),
  KEY `idx_fk_vibez_comments_post` (`post_id`),
  CONSTRAINT `fk_vibez_comments_post` FOREIGN KEY (`post_id`) REFERENCES `phone_vibez_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_comments: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_follows
CREATE TABLE IF NOT EXISTS `phone_vibez_follows` (
  `follower` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`follower`,`target`),
  KEY `idx_vibez_follows_target` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_follows: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_likes
CREATE TABLE IF NOT EXISTS `phone_vibez_likes` (
  `post_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`username`),
  KEY `idx_vibez_likes_user` (`username`,`created_at`),
  KEY `idx_fk_vibez_likes_post` (`post_id`),
  CONSTRAINT `fk_vibez_likes_post` FOREIGN KEY (`post_id`) REFERENCES `phone_vibez_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_likes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_notifications
CREATE TABLE IF NOT EXISTS `phone_vibez_notifications` (
  `id` varchar(16) NOT NULL,
  `recipient` varchar(64) NOT NULL,
  `kind` varchar(16) NOT NULL,
  `actor` varchar(64) NOT NULL,
  `post_id` varchar(16) DEFAULT NULL,
  `preview` varchar(200) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vibez_notifs_recipient` (`recipient`,`created_at`),
  KEY `idx_vibez_notifs_unseen` (`recipient`,`seen`),
  KEY `idx_vibez_notifs_dedupe` (`recipient`,`kind`,`actor`,`post_id`),
  KEY `idx_fk_vibez_notifications_post` (`post_id`),
  CONSTRAINT `fk_vibez_notifications_post` FOREIGN KEY (`post_id`) REFERENCES `phone_vibez_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_notifications: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_posts
CREATE TABLE IF NOT EXISTS `phone_vibez_posts` (
  `id` varchar(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `video` varchar(512) NOT NULL,
  `thumb` varchar(512) DEFAULT NULL,
  `caption` varchar(300) NOT NULL DEFAULT '',
  `sound` varchar(120) NOT NULL DEFAULT '',
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vibez_posts_author` (`author`,`created_at`),
  KEY `idx_vibez_posts_created` (`created_at`),
  KEY `idx_vibez_posts_views` (`views`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_posts: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_profiles
CREATE TABLE IF NOT EXISTS `phone_vibez_profiles` (
  `username` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL DEFAULT '',
  `bio` varchar(160) NOT NULL DEFAULT '',
  `avatar` varchar(512) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_profiles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_vibez_saves
CREATE TABLE IF NOT EXISTS `phone_vibez_saves` (
  `post_id` varchar(16) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`username`,`post_id`),
  KEY `idx_vibez_saves_user` (`username`,`created_at`),
  KEY `idx_fk_vibez_saves_post` (`post_id`),
  CONSTRAINT `fk_vibez_saves_post` FOREIGN KEY (`post_id`) REFERENCES `phone_vibez_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_vibez_saves: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_voice_memos
CREATE TABLE IF NOT EXISTS `phone_voice_memos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(120) NOT NULL,
  `url` varchar(512) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  `src_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_voice_memos_src` (`src_id`),
  KEY `citizenid` (`citizenid`),
  KEY `created_at` (`created_at`),
  KEY `idx_voice_memos_cid_at` (`citizenid`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_voice_memos: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_weazel_articles
CREATE TABLE IF NOT EXISTS `phone_weazel_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(24) NOT NULL,
  `headline` varchar(160) NOT NULL,
  `dek` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(80) NOT NULL,
  `author_cid` varchar(60) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `featured` (`featured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_weazel_articles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_weazel_breaking
CREATE TABLE IF NOT EXISTS `phone_weazel_breaking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(220) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_weazel_breaking: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.phone_wifi
CREATE TABLE IF NOT EXISTS `phone_wifi` (
  `citizenid` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `known` longtext DEFAULT NULL,
  `declined` longtext DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.phone_wifi: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_crafting
CREATE TABLE IF NOT EXISTS `player_crafting` (
  `citizenid` varchar(50) NOT NULL,
  `level` int(11) DEFAULT 1,
  `xp` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.player_crafting: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_crafting_benches
CREATE TABLE IF NOT EXISTS `player_crafting_benches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bench_type` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `coords` text NOT NULL,
  `allowed_jobs` text DEFAULT NULL,
  `placed_by` varchar(50) NOT NULL,
  `placed_at` timestamp NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`bench_type`),
  KEY `idx_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.player_crafting_benches: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_groups
CREATE TABLE IF NOT EXISTS `player_groups` (
  `citizenid` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`citizenid`,`type`,`group`),
  CONSTRAINT `fk_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.player_groups: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_jobs_activity
CREATE TABLE IF NOT EXISTS `player_jobs_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(255) NOT NULL,
  `last_checkin` int(11) NOT NULL,
  `last_checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id` DESC) USING BTREE,
  KEY `last_checkout` (`last_checkout`) USING BTREE,
  KEY `citizenid_job` (`citizenid`,`job`) USING BTREE,
  CONSTRAINT `fk_player_jobs_activity_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.player_jobs_activity: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.player_outfits: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_pets
CREATE TABLE IF NOT EXISTS `player_pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `pet_name` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `health` int(11) DEFAULT 100,
  `hunger` int(11) DEFAULT 100,
  `thirst` int(11) DEFAULT 100,
  `is_k9` tinyint(1) DEFAULT 0,
  `is_dead` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.player_pets: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.player_transactions: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  CONSTRAINT `fk_player_vehicles_citizenid` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.player_vehicles: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned DEFAULT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_logged_out` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.players: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table fivem-server-project.playerskins: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  `zone_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`zone_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.properties: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.renzu_motels
CREATE TABLE IF NOT EXISTS `renzu_motels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motel` varchar(64) DEFAULT NULL,
  `hour_rate` int(11) DEFAULT 0,
  `revenue` int(11) DEFAULT 0,
  `employees` longtext DEFAULT NULL,
  `rooms` longtext DEFAULT NULL,
  `owned` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.renzu_motels: ~0 rows (approximately)
INSERT INTO `renzu_motels` (`id`, `motel`, `hour_rate`, `revenue`, `employees`, `rooms`, `owned`) VALUES
	(1, 'pinkcage', 0, 0, '[]', '[{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]}]', '0');

-- Dumping structure for table fivem-server-project.storage_rentals
CREATE TABLE IF NOT EXISTS `storage_rentals` (
  `lockerIdentifier` varchar(255) NOT NULL,
  `ownerIdentifier` varchar(255) NOT NULL,
  `unitId` int(11) NOT NULL,
  `rentedAt` timestamp NULL DEFAULT current_timestamp(),
  `lockerData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`lockerData`)),
  `bankAccount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lockerIdentifier`),
  KEY `idx_unit` (`unitId`),
  KEY `idx_owner` (`ownerIdentifier`),
  KEY `idx_unit_owner` (`unitId`,`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.storage_rentals: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `fivem` varchar(20) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_users_license` (`license`),
  KEY `idx_users_license2` (`license2`),
  KEY `idx_users_fivem` (`fivem`),
  KEY `idx_users_discord` (`discord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.users: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.v_sport_stats
CREATE TABLE IF NOT EXISTS `v_sport_stats` (
  `identifier` varchar(64) NOT NULL,
  `stats` longtext NOT NULL,
  `peak` longtext NOT NULL,
  `decay_anchor` longtext NOT NULL,
  `allowance` longtext NOT NULL,
  `last_session` bigint(20) NOT NULL DEFAULT 0,
  `total_sessions` int(11) NOT NULL DEFAULT 0,
  `recovery_until` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`identifier`),
  KEY `idx_last_session` (`last_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.v_sport_stats: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.vehicle_financing
CREATE TABLE IF NOT EXISTS `vehicle_financing` (
  `vehicleId` int(11) NOT NULL,
  `balance` int(11) DEFAULT NULL,
  `paymentamount` int(11) DEFAULT NULL,
  `paymentsleft` int(11) DEFAULT NULL,
  `financetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  CONSTRAINT `vehicleId` FOREIGN KEY (`vehicleId`) REFERENCES `player_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fivem-server-project.vehicle_financing: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.vehicle_trackers
CREATE TABLE IF NOT EXISTS `vehicle_trackers` (
  `serialNumber` varchar(11) NOT NULL,
  `vehiclePlate` varchar(11) NOT NULL,
  `startedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `serialNumber` (`serialNumber`),
  KEY `vehiclePlate` (`vehiclePlate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.vehicle_trackers: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.xt_prison
CREATE TABLE IF NOT EXISTS `xt_prison` (
  `identifier` varchar(100) NOT NULL,
  `jailtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.xt_prison: ~0 rows (approximately)

-- Dumping structure for table fivem-server-project.xt_prison_items
CREATE TABLE IF NOT EXISTS `xt_prison_items` (
  `owner` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  UNIQUE KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table fivem-server-project.xt_prison_items: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
