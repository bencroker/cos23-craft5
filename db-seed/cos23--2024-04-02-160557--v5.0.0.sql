-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.11.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_umbdsayfktrqyntolakptukdlwcswpohtvtm` (`primaryOwnerId`),
  CONSTRAINT `fk_elkzevsciuemzglmunlylbekhzwrbodouwvd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umbdsayfktrqyntolakptukdlwcswpohtvtm` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xrxpqxvgtmtrxzvjigvlihlbrwzmrdcgnujk` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_lyhyamrrsxopctgayhxnlirannsrsfovagcl` (`dateRead`),
  KEY `fk_twyxexhpkdfucdbqdkwmeubhyfjcnigbmhgd` (`pluginId`),
  CONSTRAINT `fk_cottratvsnfqednjbkmdykisbzjzxnfkxzwt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_twyxexhpkdfucdbqdkwmeubhyfjcnigbmhgd` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mmewsoqyfkxtsnjijispavuzgsreqdvcwdpj` (`sessionId`,`volumeId`),
  KEY `idx_ywellrndfmmfdchdlfhweqdkppzulmiitubg` (`volumeId`),
  CONSTRAINT `fk_kbfndyxqerwonxdvxnftbmlydtjwssdaqeql` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pypjzcjiamlukyuogaihuiepqxbyptqvvunb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ipmomwbupnczajakigpmucghhebkuctvqkcp` (`filename`,`folderId`),
  KEY `idx_hnqsnbooejxrzflytugxectvfzfvfhenlchr` (`folderId`),
  KEY `idx_dqixundinhkvicoujcrtdcpqesopqmlsghxh` (`volumeId`),
  KEY `fk_gjoggbortarhvpuepousszojsexufdilpstl` (`uploaderId`),
  CONSTRAINT `fk_egfcsqyliiwnywiwmewcdaxpvjmhjgshgxhw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gjoggbortarhvpuepousszojsexufdilpstl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_svaarplczszjizyyymyoreqijiirymetmssi` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_whrmjsfjztvwivvkaslbmemzyajivzjidqaa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text DEFAULT NULL,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_paiikeultgbflcthhwiblqmgjzzzysmivovn` (`siteId`),
  CONSTRAINT `fk_cgheekqsrwmrzwzyzthyhzroqxypotvfurqa` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_paiikeultgbflcthhwiblqmgjzzzysmivovn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aepkoevdemcfpvnkpariimqugtgxdweoscfn` (`userId`),
  CONSTRAINT `fk_aepkoevdemcfpvnkpariimqugtgxdweoscfn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wlktjvvlaikkowxcpwlvtmebfccbdnykfxdg` (`groupId`),
  KEY `fk_evjljyerayadgsoejsxncygemjcjpycvpopa` (`parentId`),
  CONSTRAINT `fk_evjljyerayadgsoejsxncygemjcjpycvpopa` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mqoeeyxkvsuikjrdidkwiekxasxnodezcrjd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uxyciluejpwbkuhfszvxqzlffvhsxbbkknho` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dxphpkvomkieowkklbyfesgcmxbpdazkwliw` (`name`),
  KEY `idx_draqagqskymuagzbdmiqmpbkvlqhpicnyiyf` (`handle`),
  KEY `idx_hwwzeentgokgnynvzhjphlqmeloloqsbrfcc` (`structureId`),
  KEY `idx_iqovsrnyvymxvdtazwlmmafotuwafjdvmqyr` (`fieldLayoutId`),
  KEY `idx_hoetechsmokupkestinxrljhkiweulomikla` (`dateDeleted`),
  CONSTRAINT `fk_amozjfyaknjzdcjsdrqrzsabysfbpjqafbop` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lshlynlgodpyqednfzgbzcjfeqjhflzoqtzm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iazypnlsxqynykbkylxomgsnmgevxpeqjnsc` (`groupId`,`siteId`),
  KEY `idx_aaypgweclvxazcztkakaeuzarmkajlhmzfdb` (`siteId`),
  CONSTRAINT `fk_ggjykbfhblsiyfdcokrckzmvosskhvxtdrfk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lribjhuwzhsasjaonzetcvgnsodpmznsalqr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_rtnrygholrnjykdsuzjkxdlubwjphwmkwzka` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_exfkwfwenwalgnjzibevcthyrjdupgbkajqz` (`siteId`),
  KEY `fk_epxlorwtitaxtepdahheahakheaihsfqiwlp` (`userId`),
  CONSTRAINT `fk_eivaaxttodhwchsjvhikgtciojnedgzziays` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_epxlorwtitaxtepdahheahakheaihsfqiwlp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_exfkwfwenwalgnjzibevcthyrjdupgbkajqz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_obokeuwkdcamziydwwhyohujpmklidrajdel` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_yptdlyaqwpkbuwwrhdbzcjqcequuxdxmbdsj` (`siteId`),
  KEY `fk_csbsnbdfyrpoaoktswgqqvatiyingjbatfse` (`fieldId`),
  KEY `fk_yzicbdkzmrvyktmqufkxkwnogrnssjtwlgos` (`userId`),
  CONSTRAINT `fk_csbsnbdfyrpoaoktswgqqvatiyingjbatfse` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cvvapqzyfqjxwfadtrlchvckbplathjwpyxm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yptdlyaqwpkbuwwrhdbzcjqcequuxdxmbdsj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yzicbdkzmrvyktmqufkxkwnogrnssjtwlgos` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_languageToLearn_zawcgefj` text DEFAULT NULL,
  `field_summary_qsbpsoen` text DEFAULT NULL,
  `field_preparationTime_brpygnsi` int(10) DEFAULT NULL,
  `field_preparationTimeUnits_pjurfwul` varchar(7) DEFAULT NULL,
  `field_levelOfDifficulty_yxrtmvkq` varchar(9) DEFAULT NULL,
  `field_numberOfServings_pjqnujfz` int(10) DEFAULT NULL,
  `field_suitableForChildren_wbpwyepw` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bvicxmjrvzzakihllawnosegxuxyjdwtkwdc` (`elementId`,`siteId`),
  KEY `idx_esnnaqwqrclsxvvrmotukllrulssreouxhfi` (`siteId`),
  KEY `idx_zcswimqexkxplxfmwwptoybisejnqtisinwm` (`title`),
  CONSTRAINT `fk_gghizfzsoxziqippngywbpjzcoidfdstifmj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqahkjbprcozilxjartzcjubqpdfzzgztwkc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dddsczhkiqnqjklkqgwllsfisuywpsqaqkog` (`userId`),
  CONSTRAINT `fk_dddsczhkiqnqjklkqgwllsfisuywpsqaqkog` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`traces`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqqjswidafjpmjywdtrzdkrrmoqowfzisngo` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_loepooyaedgwzxtlurseofsxzovoexpahtsh` (`creatorId`,`provisional`),
  KEY `idx_ekdbgugjcwgcnumcjqijqglhqnupschkgyas` (`saved`),
  KEY `fk_wcarvhnzfmdyrtsleecimajafwzvemjiwxpp` (`canonicalId`),
  CONSTRAINT `fk_aruodxeaxmkyzdaezdodsfavhllnxzdjlctv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wcarvhnzfmdyrtsleecimajafwzvemjiwxpp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_hrsvspsiozyydyvnqgbzonbeowidrwkojcwn` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ogrwfkqbzrlwyluggnstxcxoqdvemcfxycjb` (`userId`),
  KEY `fk_pqqzaqeszzbugolzpoqleceygnmnjtjagusm` (`siteId`),
  KEY `fk_fbfjzjjhfuesruohwtenzjmirvltikvhtjqk` (`draftId`),
  CONSTRAINT `fk_fbfjzjjhfuesruohwtenzjmirvltikvhtjqk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ogrwfkqbzrlwyluggnstxcxoqdvemcfxycjb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pqqzaqeszzbugolzpoqleceygnmnjtjagusm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sjibgxzculqpjfdddzffegeysohuzbflvban` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_atlbkymyltyygpcervxksewiexcmeklliphx` (`dateDeleted`),
  KEY `idx_tcbkujmrdiqbrzetdoajumvmwzfnbvirzepk` (`fieldLayoutId`),
  KEY `idx_xjekhbfvbcswlxnkijoiawcemhslqthbtbjm` (`type`),
  KEY `idx_dukowdiijhotopyhhecfenhmgfoatxwwekiu` (`enabled`),
  KEY `idx_ornhiprijdudwtqhwhwokgnzwuktbsymrfis` (`archived`,`dateCreated`),
  KEY `idx_nuqmgnpkytofjyxodwlxllhywdxwhaggottp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_uqmgqexxjprqdzliqjpqchyfxsqzymmjlswi` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_xmcowszxsrjnhdavrlxowxanucepylxbcvbr` (`canonicalId`),
  KEY `fk_cllfzpwuxnuwlfprzlcyvftbbaiuodatfamc` (`draftId`),
  KEY `fk_xffrslvttetvzncfujzefvagobjmsfmkwtgl` (`revisionId`),
  CONSTRAINT `fk_anpwkwxpleokxhqtodrjejwyzulrgkqdjrpb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cllfzpwuxnuwlfprzlcyvftbbaiuodatfamc` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xffrslvttetvzncfujzefvagobjmsfmkwtgl` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xmcowszxsrjnhdavrlxowxanucepylxbcvbr` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_inbnxqsiqzhgwxxpamxigixbhvtnqvzhpjxg` (`timestamp`),
  CONSTRAINT `fk_ufluuwzjbolczmmakkkurvdydmhkiejghcvi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_bqbzilrmgdzjuznamfqvehutnpboqvotwubd` (`ownerId`),
  CONSTRAINT `fk_bqbzilrmgdzjuznamfqvehutnpboqvotwubd` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tlrlkzlrpvdqvstfgcamrhziznuvymimlgim` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fybvuqmhhjrhcaiagiteiphhnurnwdircaxo` (`elementId`,`siteId`),
  KEY `idx_wpchgfvesjiclsseoffezmzckpgrrajtgzka` (`siteId`),
  KEY `idx_dynryziqmkdlwkzgbkmxhnxwfhoxnpoqkdhp` (`slug`,`siteId`),
  KEY `idx_stkcagrrzbnvjwgccddjdqsfhfrtlvgnbhcd` (`enabled`),
  KEY `idx_nlruavqbntjavagukanorzahkqomqtnqqfzg` (`uri`,`siteId`),
  KEY `idx_hmmjifwgdqunswnqxxheizqflrcrknxnqycj` (`title`,`siteId`),
  CONSTRAINT `fk_pljrbrkyyqftlcvdfysvbrdqhoskpebdflhr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzzwatpkzituqgtwvxratmdtdopfwvthusxg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cuvkapgqndixlqodydgmqnxbwtyqunflrlsv` (`postDate`),
  KEY `idx_pkvzhaxlsmcormqpuplulcostzhxncmsmcao` (`expiryDate`),
  KEY `idx_itmlgcfsbzmeykhcxkcjwokzoumfsasgdvoy` (`sectionId`),
  KEY `idx_qpkijhlwwbldgltrgmoodegqfzljkbkxclmo` (`typeId`),
  KEY `fk_wkphfrochwjsbhurpfielxggbtkosoymfyuj` (`parentId`),
  KEY `idx_dwtnjmqacdsyxustyutnldjeyojqycowovzl` (`primaryOwnerId`),
  KEY `idx_flkreiqujcbgawgirbjqbcshpwzqxrvfaayt` (`fieldId`),
  CONSTRAINT `fk_kczhwfwsdnareifuosmjqggxvnrxozzzygbo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqqosucfiumjvzwsaghgvgtmtydikrxzllcl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qekiqorjoiqztxaurgepyiilkpqxxzpfnyax` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wbbszwoubuhllvnzvwgfyxzhhxqojejmlqkk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wkphfrochwjsbhurpfielxggbtkosoymfyuj` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wozojkfdklnxicycemzktgvjndybfgfueqiv` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_hgqoyohwcwxrxxsfopkhyhqkaalytguzngiy` (`authorId`),
  KEY `idx_tyrywnrieeqjwtqwtlugcjvazrztxccgqczr` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_qvexzralaitqoiwyufvjsdkszbemxbewqazp` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_talmkwvdooyaktjkrhmttfzjpjwzwygjqsgm` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT 1,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnipgmmukijjqhzxuecznukfwyjfjsncwqna` (`fieldLayoutId`),
  KEY `idx_xoupcqjiudrnhvmuxwipmphlmdeuwficnypk` (`dateDeleted`),
  CONSTRAINT `fk_nkdlmckgwpspyfmdwbthrttnpxfnhqveyfcn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eosmfdguokhwlwtiuqsjeubwrgyjobjpyydi` (`dateDeleted`),
  KEY `idx_fqemtcsznmqloonujosswjunrqxfrgrjnpjl` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ydhhuyrusyhdomouefoxymnjiarzwkosbvjv` (`handle`,`context`),
  KEY `idx_oztpyihmfkznxszdbgzpmkjhzjcqilmhjedf` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wsacjxwsekewxolhyykkqofesyikifzxdgwt` (`name`),
  KEY `idx_xchwvtttszgetytsybgekxrazacrqjrpfvod` (`handle`),
  KEY `idx_pdjztcqrnfdwtyldrujmndhaalrdjojcoiag` (`fieldLayoutId`),
  KEY `idx_igigszppizmqdybkqvmqqayrxytmbnrasznx` (`sortOrder`),
  CONSTRAINT `fk_bdihyqaoewkrnfjcccsperaurqktxhpiisiv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hhdyfvcgaywpffwecijprvwzrzxjkrcfdhip` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scope`)),
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aycnjqjphwvcqmklmktbcuxezcckcgvesfpm` (`accessToken`),
  UNIQUE KEY `idx_qlxorhxpalqzitaftivpojznupstddbcdgbq` (`name`),
  KEY `fk_yontuxdogencitsiprsxwppirnmrdqlynsyj` (`schemaId`),
  CONSTRAINT `fk_yontuxdogencitsiprsxwppirnmrdqlynsyj` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cbbtvywyywkgxmnnzwqfajiocldlhxcjwkpl` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tbgiefsdsdnfglscetexphudjrqadoustyhu` (`name`),
  KEY `idx_mibpdtixhuczehjzwgahnkxmehquzvricwue` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fambewafyaknlbcmgprcuryhnkotzzlauadz` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lvrvpshllxfpszbxqydvgidfbjjpksahacmb` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cxxymmmcjzuspvdzcjuuvxqrrufjdkntlnit` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_nufqafrngtnkgzndlwehesbmvkyzasfdjeyd` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cnzhicmiokagevpcljwmvgynctppxjacepvm` (`userId`),
  CONSTRAINT `fk_cnzhicmiokagevpcljwmvgynctppxjacepvm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qnifvvnnaaixmimsxrqbbfonehdnaeaoygst` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_chsbvyhkvdiucubrvuoczzwrfdyuiimbamvc` (`sourceId`),
  KEY `idx_mbxvvhmuzzrcmynzlyagrwpzurnzvoujpwxt` (`targetId`),
  KEY `idx_dyilvfpiqyxyrmkbnoybpublqotqzdumexje` (`sourceSiteId`),
  CONSTRAINT `fk_flmlhmfahrlzyhxjadzobvpbnbzbvwncrykf` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onljqsroisirxckzjnlkdeweevjvddctjyxw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qqgignglekhsbsmrrncqxglzzjntgoykkhpo` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ppsliggojebaekixqhbycvhzqfylrucjsoxu` (`canonicalId`,`num`),
  KEY `fk_kbxcghhzepcgyztpnlmcgygmzufqpuzqlxqz` (`creatorId`),
  CONSTRAINT `fk_cpfxpkjdmryvaaldkcxaadndezokuhussuea` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kbxcghhzepcgyztpnlmcgygmzufqpuzqlxqz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_bymezwprvmnlwnvbepuzfbzgwxcgxtmcopij` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `maxAuthors` smallint(6) unsigned NOT NULL DEFAULT 1,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previewTargets`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hqklbuxcyxykhmvwaxzxpcvwmymypxjonylv` (`handle`),
  KEY `idx_jrtrphjrwkozrkahmmzfljhfdmofhfqfejue` (`name`),
  KEY `idx_iboaceaamdklxngoizufxsdzzrwuhkpwfagx` (`structureId`),
  KEY `idx_znjracxiobdviuthemvnzdvkqrfxyjzgxwxy` (`dateDeleted`),
  CONSTRAINT `fk_kldjgjwmnkbedumyphbtdoihvcaberpjojpc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_yjatactgaakklhzrctgukeigzvtfejcnpwnj` (`typeId`),
  CONSTRAINT `fk_vvsudwemqszvjrbgzmguciorgumgibwqyrhl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjatactgaakklhzrctgukeigzvtfejcnpwnj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nujlgjpufotjtwpkrylyolsdazwyzlmdbtju` (`sectionId`,`siteId`),
  KEY `idx_xbohtztjzsyxfghxcfkrozbrhwboyaxzrkoe` (`siteId`),
  CONSTRAINT `fk_hvebltfihlfvwatlbyhdyvkmdzmlpclakjrl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qefmmyhpcrishxanqxaswjdojcljcxxhqipx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mjubjedusezlbpwlprijeuttubetkfqnhjsp` (`uid`),
  KEY `idx_vcfylkdovkpmqajrqyanbnphmelbjrwkthwf` (`token`),
  KEY `idx_clhatitlvvpextvkjudrmwfgftmysmwydtnv` (`dateUpdated`),
  KEY `idx_eqkxkjxvqxbqnhsxncrwiqalvueqfcvodtzg` (`userId`),
  CONSTRAINT `fk_dqwdfphskuuilcffvjewtkgegbgelpmzbmlq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wtfqbwpaskdbvxugdoruwhmvltzuveequshm` (`userId`,`message`),
  CONSTRAINT `fk_bhfkkbbywayphmfgootclbpiacipjskoqqna` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_awuvhjewbvgcyvqncnkmqcsluqfpekjxfugv` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ycmovsdxwbxttetmlsnnxfvlzzqrcdlwaczf` (`dateDeleted`),
  KEY `idx_yhyrgpnbhivdxqaspqzsrpujoonmjgkofzam` (`handle`),
  KEY `idx_ubhgsuvwdyzpfaknsxmkdkjjhunsewhzriyg` (`sortOrder`),
  KEY `fk_cpqulgyqfvaewkyvdjsnwqvytqrensdptazx` (`groupId`),
  CONSTRAINT `fk_cpqulgyqfvaewkyvdjsnwqvytqrensdptazx` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ibusddzufxnxwjqmfrdjehwvreoscaodgvqs` (`structureId`,`elementId`),
  KEY `idx_yfyfmunbpmjlhwaaerdcbmjujxxvqqnjrxfn` (`root`),
  KEY `idx_lwqgfugngsvzcluywpmguygfsdmcsjmixnto` (`lft`),
  KEY `idx_dierqobkrvhsnijijrxzzntlmruozhoxxtrf` (`rgt`),
  KEY `idx_auuddnixpgapcmaxqrltmszmkbqdgobgfmbh` (`level`),
  KEY `idx_lpkumnknivoqvbnvahanknaybfzhgdzudmyw` (`elementId`),
  CONSTRAINT `fk_hemynsbksfojdizjhbgjavcrbuigzefjppsk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gnqcipexplftpjhypeaoninknqquwpsrdolb` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lqbjgveendhkanufynnhfrjohzeydytiqpln` (`key`,`language`),
  KEY `idx_gbuldpjnxqmbqatmrbuacrykfsvivmxhirig` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_haiygqwrgupcopahaxjodcmlvjmogzoxxspm` (`name`),
  KEY `idx_eafibbepnltjermcvxafsrrqoitllgrwzljv` (`handle`),
  KEY `idx_tqmbprffbiydxprojnzrlcubgqfirqizsuhd` (`dateDeleted`),
  KEY `fk_irgwelnlgirtubzdcgzebsnqnwmohzxpmsas` (`fieldLayoutId`),
  CONSTRAINT `fk_irgwelnlgirtubzdcgzebsnqnwmohzxpmsas` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sndkugpvctjerixphujqmcxqthseppvrhkxq` (`groupId`),
  CONSTRAINT `fk_jducdjxxvfgpcmylzixknyvolkfdsgpquamk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qxnmursirsrypjafyygecxdvhbrwxewzawub` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vghasvnsafcxmpyhcqetcwhsqulgkmoxlztl` (`token`),
  KEY `idx_abwzhxpokwipkcesaseykhpmirqvngtqxhex` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rvutvydctxqmhoeqcapgczkmavktgewcajlk` (`handle`),
  KEY `idx_rooghexqgkkntzgcwzbqhbesyzcpaltqqdnn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ypsogronkvlzlkataegalggzectwgyveeapk` (`groupId`,`userId`),
  KEY `idx_ejuvisoneixalwvrbstoqqbgykwanktvfbxz` (`userId`),
  CONSTRAINT `fk_mhpgaupwumijqjeriuvhmqobkanychowbcgo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_npzlrypyowjfwhcksvwbumgjolpdajmqfelz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wmfmbhfamdhpgvtuglthxmqueiflpukraoov` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nlyhzslslhrntftgmlaiksbirtynbxqxwjxr` (`permissionId`,`groupId`),
  KEY `idx_gybwlwuitsyafqzjzimrhfnjvryforptutea` (`groupId`),
  CONSTRAINT `fk_gppireaqvrierlaawkarffatwqktznecgnhg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxieqqkawkhcjpazyrwfwqzznsxqvudlckxi` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_urogjiecvvqunblkxsewntsrxqmfkknluier` (`permissionId`,`userId`),
  KEY `idx_exuvkvukegamshephialozklacfnyvzshceg` (`userId`),
  CONSTRAINT `fk_huqjmnrgvsdgketmnhwutwmvuwqymfkwvpuf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wllwghsxjzroksfkkmdxrsdgfeoiwccksvzq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_nrshzlygwjunmdxkwgocgzjxgbeyucgmvpwf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_raugajcpuyunegttitnstpwrppejndkwybdn` (`active`),
  KEY `idx_nrakbfrgsfchdrsqyygtieoniuyppxbqgafw` (`locked`),
  KEY `idx_qinmgkqsqwirkdckydaluxkwbnnhispydxlz` (`pending`),
  KEY `idx_bnubclbussxujuwuqnbyfbkldmnrxbhryozd` (`suspended`),
  KEY `idx_zyabittzhnlwkjuzcnwzyotzvkedalwkctux` (`verificationCode`),
  KEY `idx_wwiacjyyvwofibgsebkijpwzqqywtqdqmpbn` (`email`),
  KEY `idx_hwwvmcqjjqfbfvkzesgqzdokvlomcgmjidhr` (`username`),
  KEY `fk_kuihcbuegkyfgopjmumftpsrgyarorliekuh` (`photoId`),
  CONSTRAINT `fk_fwgdyjxdxczvbkqeyjnycolfbufymxqmftpz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kuihcbuegkyfgopjmumftpsrgyarorliekuh` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auykbsdohupyyquklyajvhfypseilaroeiyw` (`name`,`parentId`,`volumeId`),
  KEY `idx_mvnxavlooyzzbfogfidrvkuxezkilgkljxma` (`parentId`),
  KEY `idx_dhavaenkpnpmepchmsfyxnuvwbqbanianghy` (`volumeId`),
  CONSTRAINT `fk_lblsxeriekgfqxfbjgpiycfmeijjgfudklcm` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oigutlqjeklollhpfkjgtnvpdjphixwmjyeb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rnidnvaucntcqctbfszokcpvoxabptuytgrk` (`name`),
  KEY `idx_mvcwzkssrdqngwfkwpnvzvmblbvtvjpwvnge` (`handle`),
  KEY `idx_ntszghydxhlbeczrbdeiuvwmjjyugprzmkvs` (`fieldLayoutId`),
  KEY `idx_ypoklgajstuyrqjjztfhbutufnwrgwehejns` (`dateDeleted`),
  CONSTRAINT `fk_kaofgpeoqeuifhvxurbaxovyjwaltbrxixnk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text DEFAULT NULL,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qpysqdiwcunshonnyavzujadndhpsmxsmhfz` (`userId`),
  CONSTRAINT `fk_qpysqdiwcunshonnyavzujadndhpsmxsmhfz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_thfkoqfrbdcjmetsnhbycgscyjdvlwdobmpl` (`userId`),
  CONSTRAINT `fk_aesoyodlwozrhghzvxcbbafrikjxywazehqa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 16:05:57
-- MariaDB dump 10.19  Distrib 10.6.14-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	10.11.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (12,1,1,1,'the-burren.jpg','image',NULL,1280,768,301516,NULL,NULL,NULL,'2022-11-09 02:08:45','2022-11-09 02:08:45','2022-11-09 02:08:45'),(125,1,1,1,'gluten-free.jpg','image',NULL,2048,2048,88412,NULL,NULL,NULL,'2023-12-21 16:55:00','2023-12-21 16:55:00','2023-12-21 16:55:05'),(128,1,1,1,'spanish-tortilla.jpg','image',NULL,440,400,83889,NULL,NULL,NULL,'2023-12-21 17:02:30','2023-12-21 17:02:30','2023-12-21 17:02:37'),(141,1,1,1,'scrambled-eggs-1-1712564176.jpg','image',NULL,1160,1702,183751,NULL,NULL,NULL,'2024-01-16 19:23:59','2024-01-16 19:23:59','2024-01-16 19:23:59');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'email','2022-11-09 15:42:51',0,1),(1,1,'fullName','2022-11-09 15:42:51',0,1),(1,1,'invalidLoginCount','2023-11-09 18:11:57',0,1),(1,1,'invalidLoginWindowStart','2023-11-09 18:11:57',0,1),(1,1,'lastPasswordChangeDate','2023-11-09 18:11:57',0,1),(1,1,'password','2023-11-09 18:11:57',0,1),(1,1,'username','2023-11-09 18:09:27',0,1),(2,1,'postDate','2022-11-09 02:01:54',0,1),(2,1,'slug','2022-11-09 02:01:45',0,1),(2,1,'title','2022-11-09 02:01:50',0,1),(2,1,'uri','2022-11-09 02:01:45',0,1),(4,1,'postDate','2022-11-09 02:02:08',0,1),(4,1,'slug','2022-11-09 02:02:01',0,1),(4,1,'title','2022-11-09 02:02:01',0,1),(4,1,'uri','2022-11-09 02:02:01',0,1),(6,1,'postDate','2022-11-09 02:02:19',0,1),(6,1,'slug','2022-11-09 02:02:13',0,1),(6,1,'title','2022-11-09 02:02:13',0,1),(6,1,'uri','2022-11-09 02:02:13',0,1),(8,1,'postDate','2022-11-09 02:02:28',0,1),(8,1,'slug','2022-11-09 02:02:24',0,1),(8,1,'title','2022-11-09 02:02:24',0,1),(8,1,'uri','2022-11-09 02:02:24',0,1),(10,1,'postDate','2023-11-08 12:14:09',0,1),(10,1,'slug','2022-11-09 02:02:46',0,1),(10,1,'title','2022-11-09 02:02:46',0,1),(10,1,'uri','2022-11-09 02:02:46',0,1),(23,1,'postDate','2023-11-08 18:33:42',0,1),(23,1,'slug','2023-11-08 18:33:42',0,1),(23,1,'title','2023-11-08 18:33:37',0,1),(31,1,'postDate','2023-11-08 19:09:22',0,1),(31,1,'slug','2023-11-08 19:09:19',0,1),(31,1,'title','2023-11-09 18:11:12',0,1),(40,1,'postDate','2023-12-21 16:45:29',0,1),(40,1,'slug','2023-12-21 16:45:29',0,1),(40,1,'title','2024-04-02 16:02:37',0,1),(42,1,'postDate','2023-12-21 16:45:38',0,1),(42,1,'slug','2023-12-21 16:45:38',0,1),(42,1,'title','2024-04-02 16:02:10',0,1),(44,1,'postDate','2023-12-21 16:45:43',0,1),(44,1,'slug','2023-12-21 16:45:43',0,1),(44,1,'title','2024-04-02 16:03:29',0,1),(51,1,'postDate','2023-12-21 16:46:04',0,1),(51,1,'slug','2023-12-21 16:46:04',0,1),(51,1,'title','2024-04-02 16:01:30',0,1),(65,1,'postDate','2023-12-21 16:48:23',0,1),(65,1,'slug','2023-12-21 16:48:23',0,1),(65,1,'title','2024-04-02 16:01:39',0,1),(76,1,'postDate','2023-12-21 16:49:02',0,1),(76,1,'slug','2023-12-21 16:49:02',0,1),(76,1,'title','2024-04-02 16:01:44',0,1),(81,1,'postDate','2023-12-21 16:49:51',0,1),(81,1,'slug','2023-12-21 16:49:51',0,1),(81,1,'title','2024-04-02 16:01:52',0,1),(140,1,'postDate','2024-01-16 19:24:02',0,1),(140,1,'slug','2024-01-16 19:23:38',0,1),(140,1,'title','2024-01-16 19:23:38',0,1),(140,1,'uri','2024-01-16 19:23:38',0,1),(162,1,'postDate','2024-04-02 16:03:05',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,2,'61d0e030-454e-45da-b305-c47d1d8acbc0','2022-11-09 02:01:47',0,1),(4,1,2,'61d0e030-454e-45da-b305-c47d1d8acbc0','2022-11-09 02:02:04',0,1),(6,1,2,'61d0e030-454e-45da-b305-c47d1d8acbc0','2022-11-09 02:02:16',0,1),(8,1,2,'61d0e030-454e-45da-b305-c47d1d8acbc0','2022-11-09 02:02:26',0,1),(10,1,1,'0','2023-11-08 18:39:48',0,1),(10,1,3,'0','2022-11-09 02:09:00',0,1),(10,1,4,'5256708c-b416-44ef-9370-6e0979e4e43f','2023-11-08 18:41:51',0,1),(23,1,2,'61d0e030-454e-45da-b305-c47d1d8acbc0','2023-11-08 18:33:41',0,1),(31,1,3,'0','2023-12-21 17:02:40',0,1),(31,1,4,'95896741-273b-4938-be6c-b8ba02b1019b','2023-12-21 16:47:55',0,1),(31,1,5,'d78b6f84-552d-4a19-a76e-a8de4c90ef82','2023-11-08 19:21:32',0,1),(31,1,6,'064ef110-5cb9-4a5a-95d6-9feeff624d33','2023-11-08 19:21:32',0,1),(31,1,7,'6a59d4ac-5225-4a8f-a600-3f33f9a736b7','2023-11-08 19:23:24',0,1),(31,1,8,'0','2023-12-21 16:46:09',0,1),(31,1,9,'0','2023-12-21 16:49:56',0,1),(31,1,13,'aa401446-0d96-4226-8bce-2cea143af5c6','2023-12-21 16:47:55',0,1),(31,1,15,'0','2023-12-21 16:53:27',0,1),(40,1,3,'0','2023-12-21 16:55:07',0,1),(54,1,10,'b711e58d-36da-42b1-95e0-f378fc9f3c15','2023-12-21 16:47:55',0,1),(68,1,10,'b711e58d-36da-42b1-95e0-f378fc9f3c15','2023-12-21 16:49:56',0,1),(98,1,16,'b7c9a73b-103c-4809-9bf3-e07255f9cb01','2023-12-21 16:53:27',0,1),(140,1,3,'0','2024-01-16 19:24:01',0,1),(162,1,16,'b7c9a73b-103c-4809-9bf3-e07255f9cb01','2024-04-02 16:03:05',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (40,40,1,'Gluten-free','2023-12-21 16:45:23','2023-12-21 16:55:07','76a8607c-b69a-458d-8f30-cae204ddfa67',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,41,1,'Gluten-free','2023-12-21 16:45:29','2023-12-21 16:45:29','314158d2-a91d-4772-86f8-3133b20265e3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,42,1,'Vegetarian','2023-12-21 16:45:32','2023-12-21 16:45:38','65ec6208-45cf-47ab-bf37-fe8671e3b873',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,43,1,'Vegetarian','2023-12-21 16:45:38','2023-12-21 16:45:38','fa7722f7-a175-40c4-a081-e5ab984c2adb',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,44,1,'Vegan','2023-12-21 16:45:40','2023-12-21 16:45:43','ad826ece-9b3f-49e8-85a8-9ceab02f97b9',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,45,1,'Vegan','2023-12-21 16:45:43','2023-12-21 16:45:43','1903f6dd-5af6-4c6b-ab12-0fa3a783e4fd',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,51,1,'Onion','2023-12-21 16:45:59','2023-12-21 16:50:40','4250ae6e-9778-4216-9683-b995f1a3ae08',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,52,1,'Onion','2023-12-21 16:46:04','2023-12-21 16:50:40','886957d4-b31f-4a4f-9e51-3249e1ebca3c',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,65,1,'Olive oil','2023-12-21 16:48:18','2023-12-21 16:50:40','d2120949-71fe-46c2-9ad6-e34ba70e1bf2',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,66,1,'Olive oil','2023-12-21 16:48:23','2023-12-21 16:50:40','01918d60-e4c4-42f3-bd64-c112010051a4',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,76,1,'Butter','2023-12-21 16:48:58','2023-12-21 16:50:40','f879a882-770c-4b11-9520-525b3596c542',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,77,1,'Butter','2023-12-21 16:49:02','2023-12-21 16:50:40','44c3b995-25f8-4fc5-9d08-c75d1b3f4cdd',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,81,1,'Baguette','2023-12-21 16:49:42','2023-12-21 16:50:40','cefb65d8-d8af-4050-990f-a733794e95ee',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,82,1,'Baguette','2023-12-21 16:49:51','2023-12-21 16:50:40','eb274581-e58e-4cd7-afdd-0a4a118c3268',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,127,1,'Gluten-free','2023-12-21 16:55:07','2023-12-21 16:55:07','3535f3a0-38b2-4df5-8b49-7c28a9e77f54',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (39,51,1,1,'Draft 1','',1,NULL,1),(40,65,1,1,'Draft 1','',1,NULL,1),(41,76,1,1,'Draft 1','',1,NULL,1),(44,42,1,1,'Draft 1','',1,NULL,1),(45,40,1,1,'Draft 1','',1,NULL,1),(51,44,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (4,1,1,NULL,'save','2023-11-08 18:33:03'),(10,1,1,NULL,'edit','2023-11-08 18:41:48'),(10,1,1,NULL,'save','2023-11-08 18:41:51'),(23,1,1,NULL,'save','2023-11-08 18:33:42'),(31,1,1,NULL,'edit','2024-04-02 16:03:09'),(31,1,1,NULL,'save','2023-12-21 17:02:40'),(40,1,1,NULL,'edit','2024-04-02 16:02:38'),(40,1,1,NULL,'save','2024-04-02 16:02:37'),(42,1,1,NULL,'edit','2024-04-02 16:02:11'),(42,1,1,NULL,'save','2024-04-02 16:02:10'),(44,1,1,NULL,'edit','2024-04-02 16:03:30'),(44,1,1,NULL,'save','2024-04-02 16:03:29'),(51,1,1,NULL,'edit','2024-04-02 16:01:31'),(51,1,1,NULL,'save','2024-04-02 16:01:30'),(65,1,1,NULL,'edit','2024-04-02 16:01:40'),(65,1,1,NULL,'save','2024-04-02 16:01:39'),(76,1,1,NULL,'edit','2024-04-02 16:01:45'),(76,1,1,NULL,'save','2024-04-02 16:01:44'),(81,1,1,NULL,'edit','2024-04-02 16:01:50'),(81,1,1,NULL,'save','2024-04-02 16:01:52'),(128,1,1,NULL,'save','2023-12-21 17:02:37'),(140,1,1,NULL,'save','2024-01-16 19:24:02');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-11-09 01:55:10','2023-11-09 18:11:56',NULL,NULL,NULL,'2ea35248-6016-431a-bce3-69568cad4b6b'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:01:37','2022-11-09 02:01:54',NULL,NULL,NULL,'e197260c-f783-4b71-8e7a-8753b456b31e'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:01:54','2022-11-09 02:01:54',NULL,NULL,NULL,'20c86f4c-399c-4a43-b9ab-ce9e233a3869'),(4,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:01:54','2023-11-08 18:33:03',NULL,NULL,NULL,'6e2ba391-06a9-407d-aeb5-2b3e7264b3b0'),(5,4,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:08','2022-11-09 02:02:08',NULL,NULL,NULL,'eb028cc5-a684-4164-acb0-20eee0b4dbd0'),(6,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:08','2022-11-09 02:02:19',NULL,NULL,NULL,'3c495514-4ec5-4db8-91c5-1d5c8b6ff46d'),(7,6,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:19','2022-11-09 02:02:19',NULL,NULL,NULL,'7f90b3b1-f1cb-4b99-a697-9c70622139ca'),(8,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:19','2022-11-09 02:02:28',NULL,NULL,NULL,'49b45290-80d7-49fe-95e1-7ddd9a0e15dc'),(9,8,NULL,4,1,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:28','2022-11-09 02:02:28',NULL,NULL,NULL,'debc9e10-1be9-46fe-98c3-0e8223c6f612'),(10,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2022-11-09 02:02:32','2023-11-08 18:41:51',NULL,NULL,NULL,'25e944a1-b566-4ba5-bbaa-0e06db8c6629'),(11,10,NULL,5,2,'craft\\elements\\Entry',1,0,'2022-11-09 02:03:05','2022-11-09 02:03:05',NULL,NULL,NULL,'c333c8b8-4771-444c-ab39-35e019e2f923'),(12,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-11-09 02:08:45','2022-11-09 03:36:19',NULL,NULL,NULL,'388b1477-f0e6-451b-8c6d-b72c9f4294d4'),(14,10,NULL,6,2,'craft\\elements\\Entry',1,0,'2022-11-09 02:09:00','2022-11-09 02:09:00',NULL,NULL,NULL,'a6b5d7d4-fc90-4d90-ac5b-850a0023a994'),(16,10,NULL,7,2,'craft\\elements\\Entry',1,0,'2022-11-09 15:44:25','2022-11-09 15:44:25',NULL,NULL,NULL,'a57a501e-1cf2-45aa-a652-dd48f88cf8f5'),(18,10,NULL,8,2,'craft\\elements\\Entry',1,0,'2022-11-09 15:44:51','2022-11-09 15:44:51',NULL,NULL,NULL,'91b2c592-3dee-46c6-bc39-0f45bda8beca'),(20,10,NULL,9,2,'craft\\elements\\Entry',1,0,'2023-11-08 12:14:09','2023-11-08 12:14:09',NULL,NULL,NULL,'aed56872-84b7-4518-8142-ac27f1cadd85'),(21,4,NULL,10,1,'craft\\elements\\Entry',1,0,'2023-11-08 18:33:03','2023-11-08 18:33:03',NULL,NULL,NULL,'bf1d9a2f-049a-4fbc-8f89-c8620ebd4369'),(23,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-11-08 18:33:21','2023-11-08 18:33:42',NULL,NULL,NULL,'41f0d014-2b1d-4a38-ba11-65c0aed30711'),(24,23,NULL,11,1,'craft\\elements\\Entry',1,0,'2023-11-08 18:33:42','2023-11-08 18:33:42',NULL,NULL,NULL,'78ef7cb3-e33a-47d1-a8a6-8eda9808ea66'),(25,10,NULL,12,2,'craft\\elements\\Entry',1,0,'2023-11-08 18:39:48','2023-11-08 18:39:48',NULL,NULL,NULL,'ad188960-df3e-4270-9088-de75adb3b8cb'),(26,10,NULL,13,2,'craft\\elements\\Entry',1,0,'2023-11-08 18:39:56','2023-11-08 18:39:56',NULL,NULL,NULL,'20597a64-085f-49ea-8147-2013877737b5'),(28,10,NULL,14,2,'craft\\elements\\Entry',1,0,'2023-11-08 18:41:24','2023-11-08 18:41:24',NULL,NULL,NULL,'bf160cfe-6b4f-4751-b68d-011759bd7232'),(30,10,NULL,15,2,'craft\\elements\\Entry',1,0,'2023-11-08 18:41:51','2023-11-08 18:41:51',NULL,NULL,NULL,'335de828-02ee-48f8-8dfd-7e416a5eca66'),(31,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-11-08 19:09:05','2023-12-21 17:02:40',NULL,NULL,NULL,'e7af17e6-259f-4769-a1c6-34e5a058a5a0'),(32,31,NULL,16,4,'craft\\elements\\Entry',1,0,'2023-11-08 19:09:22','2023-11-08 19:09:22',NULL,NULL,NULL,'a4a89d7a-4f55-4d72-8ae4-42bb36de6543'),(34,31,NULL,17,4,'craft\\elements\\Entry',1,0,'2023-11-08 19:21:32','2023-11-08 19:21:32',NULL,NULL,NULL,'fe6f3acc-bf1f-4fac-adf4-9baf8ab0fb5a'),(36,31,NULL,18,4,'craft\\elements\\Entry',1,0,'2023-11-08 19:23:24','2023-11-08 19:23:24',NULL,NULL,NULL,'c1a9b510-ecf1-48fe-9c06-338e0a9bcfd1'),(39,31,NULL,19,4,'craft\\elements\\Entry',1,0,'2023-11-09 18:11:12','2023-11-09 18:11:12',NULL,NULL,NULL,'cda26fc7-6fd9-42d0-a50b-dc6a0a78786e'),(40,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:23','2024-04-02 16:02:37',NULL,NULL,NULL,'408fe8fc-0d64-419d-bca5-1cf6a27b12b1'),(41,40,NULL,20,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:29','2023-12-21 16:45:29',NULL,NULL,NULL,'85dea05e-936a-4661-abdc-990a982485c4'),(42,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:32','2024-04-02 16:02:10',NULL,NULL,NULL,'3048e021-dc1b-4b3e-a4e0-e887497ae83b'),(43,42,NULL,21,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:38','2023-12-21 16:45:38',NULL,NULL,NULL,'6212e579-ccc3-44c0-9c02-6f11988248e8'),(44,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:40','2024-04-02 16:03:29',NULL,NULL,NULL,'8413adc1-ed64-40cb-aa9b-3098bf273705'),(45,44,NULL,22,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:43','2023-12-21 16:45:43',NULL,NULL,NULL,'86580ea0-b0a3-4dd8-9733-5c09055c07cd'),(47,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:54','2023-12-21 16:45:54',NULL,'2023-12-21 16:45:56',NULL,'87b56898-33d3-4881-9671-e4ab6a52bc1a'),(48,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:56','2023-12-21 16:45:56',NULL,'2023-12-21 16:45:57',NULL,'c3a947cd-c775-43c3-b143-c356833af595'),(49,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:57','2023-12-21 16:45:57',NULL,'2023-12-21 16:45:57',NULL,'2ec5a99d-54cf-4a17-bc7e-5358462eac71'),(50,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:57','2023-12-21 16:45:57',NULL,'2023-12-21 16:46:07',NULL,'f2f65223-ec4e-4f8e-92ac-93d3e96fd714'),(51,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:45:59','2024-04-02 16:01:30',NULL,NULL,NULL,'366d64af-1805-4021-94cc-10f602e36eb3'),(52,51,NULL,23,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:46:04','2023-12-21 16:46:04',NULL,NULL,NULL,'dac7a77a-acbf-427b-b6da-79dfd145aad2'),(54,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:46:09','2024-04-02 16:00:11',NULL,NULL,NULL,'5f49b6d8-11df-4706-8657-6a6aadd0d812'),(55,31,NULL,24,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:46:09','2023-12-21 16:46:09',NULL,NULL,NULL,'6e64524a-c75f-4f32-a657-c6d43c9022d2'),(56,54,NULL,25,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:46:09','2023-12-21 17:00:04',NULL,NULL,NULL,'928099d3-f958-4765-9101-7792917d55f8'),(59,31,NULL,26,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 16:47:55',NULL,NULL,NULL,'11f56e9e-dad8-403a-b462-a01fab79df7e'),(60,54,NULL,27,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 17:00:04',NULL,NULL,NULL,'6bd83e00-e0b3-4d8e-b64a-a6e6234189ed'),(62,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:57','2023-12-21 16:47:57',NULL,'2023-12-21 16:48:13',NULL,'70a9b14a-2e83-4f45-9985-36801eca540e'),(63,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:13','2023-12-21 16:48:13',NULL,'2023-12-21 16:48:15',NULL,'64377f1e-f90d-4ead-87ad-571ae6ea9840'),(64,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:15','2023-12-21 16:48:15',NULL,'2023-12-21 16:48:25',NULL,'5e6feaea-78ff-49ae-b2ac-eac4307254af'),(65,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:18','2024-04-02 16:01:39',NULL,NULL,NULL,'8fdb77e3-41fa-4f12-be5e-4efafa7416cb'),(66,65,NULL,28,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:23','2023-12-21 16:48:23',NULL,NULL,NULL,'b10816a8-55be-4a06-9b1c-d5d4671d574b'),(68,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:26','2024-04-02 16:00:11',NULL,NULL,NULL,'b7f2bf9b-d5af-4460-ba2c-52c991c27113'),(69,31,NULL,29,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:26','2023-12-21 16:48:26',NULL,NULL,NULL,'4c4793a5-e2a6-43d9-bf76-a3d87452ae8a'),(70,54,NULL,30,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 17:00:04',NULL,NULL,NULL,'d549f002-890c-4a73-8963-edb13dd5d446'),(71,68,NULL,31,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:26','2023-12-21 17:00:04',NULL,NULL,NULL,'bcfaad7b-dd29-45cb-aed8-c2f9785aeea0'),(74,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:52','2023-12-21 16:48:52',NULL,'2023-12-21 16:48:56',NULL,'c09101ac-6b6d-404b-83a6-741127ea7a4c'),(75,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:56','2023-12-21 16:48:56',NULL,'2023-12-21 16:49:03',NULL,'bd2bf8d0-638e-4641-add1-498063cd8b07'),(76,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:48:58','2024-04-02 16:01:44',NULL,NULL,NULL,'55c43e1c-9fcb-470e-933f-a4a7e5271cb6'),(77,76,NULL,32,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:02','2023-12-21 16:49:02',NULL,NULL,NULL,'4ec79cac-e070-4d64-8694-2f718559d014'),(79,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:35','2023-12-21 16:49:35',NULL,'2023-12-21 16:49:40',NULL,'5e5ac69a-ddb0-4699-add8-8b677158a75a'),(80,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:40','2023-12-21 16:49:40',NULL,'2023-12-21 16:49:54',NULL,'fcb0c0a8-a9bf-406b-be2a-eb7b8a5dedf7'),(81,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:42','2024-04-02 16:01:52',NULL,NULL,NULL,'404f6f9b-841d-444f-aa28-8b5a379a97e5'),(82,81,NULL,33,7,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:51','2023-12-21 16:49:51',NULL,NULL,NULL,'0aee7b43-019f-4f6d-ac9a-8873a2261bae'),(83,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:54','2023-12-21 16:49:54',NULL,'2023-12-21 16:49:55',NULL,'96420cd4-fba9-4c15-8869-ad51d67f2b93'),(85,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2024-04-02 16:00:11',NULL,NULL,NULL,'f9502fc6-32d6-4ff5-a6d2-452f599628b6'),(86,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2024-04-02 16:00:11',NULL,NULL,NULL,'e89fdf8b-ebdd-4a22-8e89-31d446f8ad3b'),(87,31,NULL,34,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 16:49:56',NULL,NULL,NULL,'40d7ce65-03d2-4ae1-9675-dc9626e8bdb4'),(88,54,NULL,35,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 17:00:04',NULL,NULL,NULL,'58c3bbf1-c09a-4301-a0f0-5b270cff54bb'),(89,68,NULL,36,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'f33ba820-5b28-4e16-9a54-d2ee64d5a752'),(90,85,NULL,37,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'e68b9f75-e800-409d-a44d-b68837a819a9'),(91,86,NULL,38,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'dc736ca9-53c6-4162-8d56-c5a9d5674463'),(93,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:49','2023-12-21 16:52:49',NULL,'2023-12-21 16:52:50',NULL,'3ade8b07-e887-4f0b-9bf3-756c3a53a767'),(94,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:50','2023-12-21 16:52:50',NULL,'2023-12-21 16:52:52',NULL,'270e67a9-2587-4460-a62c-9274253b6887'),(97,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2024-04-02 16:00:11',NULL,NULL,NULL,'7f26bb7c-b689-4dcc-a57f-f8155e09e3d0'),(98,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2024-04-02 16:00:11',NULL,NULL,NULL,'b85e3bb3-5656-4d69-b739-7b9b260c6d2f'),(99,31,NULL,39,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2023-12-21 16:52:55',NULL,NULL,NULL,'743c1fc0-4520-45e4-97da-e38526ed1f47'),(100,54,NULL,40,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 17:00:04',NULL,NULL,NULL,'28048fa3-5c92-4fbb-b74e-a211b8d140a8'),(101,68,NULL,41,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'d3857543-485c-4e05-baff-ccfa72971e65'),(102,85,NULL,42,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'5b1c5f83-575b-4790-86b3-a58cf82c1355'),(103,86,NULL,43,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'8956d2d2-85db-4de4-b27d-fe766471f4eb'),(104,97,NULL,44,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2023-12-21 17:00:04',NULL,NULL,NULL,'5321004d-8ab6-4b74-bb18-14054f526b29'),(105,98,NULL,45,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2023-12-21 17:00:04',NULL,NULL,NULL,'0a1f9775-2d04-44e1-bcdc-b4d9f522e105'),(108,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:11','2023-12-21 16:53:11',NULL,'2023-12-21 16:53:17',NULL,'bcc77bfa-ef24-42d5-b6e2-9f2ed9cd8981'),(109,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:17','2023-12-21 16:53:17',NULL,'2023-12-21 16:53:18',NULL,'e791b9f1-567e-471d-8049-5ae1cbfd782e'),(110,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:18','2023-12-21 16:53:18',NULL,'2023-12-21 16:53:27',NULL,'bd08c2c7-e202-4406-b3eb-57341f5e8711'),(111,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:18','2023-12-21 16:53:18',NULL,'2023-12-21 16:53:27',NULL,'47ff4921-89fb-42dc-9cae-1eb9707760b4'),(114,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2024-04-02 16:00:11',NULL,NULL,NULL,'0a58fbc1-752b-4dcf-8e49-2f85b9a34355'),(115,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2024-04-02 16:00:11',NULL,NULL,NULL,'07983d19-092a-4bb5-8fd3-69150f226424'),(116,31,NULL,46,4,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2023-12-21 16:53:27',NULL,NULL,NULL,'ab070200-6662-4f98-b9e4-8f918addd765'),(117,54,NULL,47,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:47:55','2023-12-21 17:00:04',NULL,NULL,NULL,'20d91a66-43e4-4e1b-98ae-65a9d5ade61d'),(118,68,NULL,48,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'3f1b5c66-a693-43c0-8e0b-d7caca770624'),(119,85,NULL,49,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'de9340f9-da96-42af-a306-a885460b0bf0'),(120,86,NULL,50,6,'craft\\elements\\Entry',1,0,'2023-12-21 16:49:56','2023-12-21 17:00:04',NULL,NULL,NULL,'1b6205a0-4b55-4bfc-82ce-d1a8caf162dc'),(121,97,NULL,51,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:52:55','2023-12-21 17:00:04',NULL,NULL,NULL,'d1140ad7-604f-4d4d-bb66-9520bcd76c79'),(122,98,NULL,52,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2023-12-21 17:00:04',NULL,NULL,NULL,'ead489ae-5d36-4f13-96d3-2e4d4a87c2ae'),(123,114,NULL,53,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2023-12-21 17:00:04',NULL,NULL,NULL,'533a5bb2-4498-46ce-88d1-3196fad12834'),(124,115,NULL,54,8,'craft\\elements\\Entry',1,0,'2023-12-21 16:53:27','2023-12-21 17:00:04',NULL,NULL,NULL,'93ab6d7c-3839-465a-b572-3cd54e7bbbd8'),(125,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-12-21 16:55:00','2023-12-21 16:55:05',NULL,NULL,NULL,'5fb73b17-5e02-4bd7-9166-284a91821592'),(127,40,NULL,55,5,'craft\\elements\\Entry',1,0,'2023-12-21 16:55:07','2023-12-21 16:55:07',NULL,NULL,NULL,'33bb7a21-e794-404d-bd5f-7fd47e538944'),(128,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-12-21 17:02:30','2023-12-21 17:02:37',NULL,NULL,NULL,'a2d6c69d-63b6-4852-b75d-dbce833327d3'),(130,31,NULL,56,4,'craft\\elements\\Entry',1,0,'2023-12-21 17:02:40','2023-12-21 17:02:40',NULL,NULL,NULL,'d130f673-aabc-477f-960b-dfc32903510c'),(131,54,NULL,57,6,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'673394b9-a0bf-4db1-b01c-650cf2b3faac'),(132,68,NULL,58,6,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'e015e3d0-bfbe-4120-8474-e86ea1a92feb'),(133,85,NULL,59,6,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'3fa20caf-f3a9-4ebf-bf9f-ce4bb7f3ad5a'),(134,86,NULL,60,6,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'c3d0b0d5-0018-4367-9d56-efddbceacd17'),(135,97,NULL,61,8,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'766ca833-dc02-4a71-9086-df256b6640b8'),(136,98,NULL,62,8,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'7b3b6fa5-3c3d-4ed1-b083-0762e93a602a'),(137,114,NULL,63,8,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'cd082e63-f63f-4297-946f-8a9f90886750'),(138,115,NULL,64,8,'craft\\elements\\Entry',1,0,'2023-12-21 17:00:04','2023-12-21 17:02:40',NULL,NULL,NULL,'7c0b00d7-0af5-4520-9fd5-01dda7b02d86'),(140,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-01-16 19:23:31','2024-01-16 19:24:02',NULL,NULL,NULL,'0059f8fc-c9ab-4d4c-ab34-4eedab927d61'),(141,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-01-16 19:23:59','2024-01-16 19:23:59',NULL,NULL,NULL,'48a8e53e-d4bb-48aa-a03c-da03ea288939'),(142,140,NULL,65,4,'craft\\elements\\Entry',1,0,'2024-01-16 19:24:02','2024-01-16 19:24:02',NULL,NULL,NULL,'5a3d775d-501c-4ce3-b772-389eb3fdbf60'),(143,51,NULL,66,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:30','2024-04-02 16:01:30',NULL,NULL,NULL,'65c6eb15-e588-4d1e-8c2d-9f45740ee3bf'),(144,51,39,NULL,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:31','2024-04-02 16:01:31',NULL,NULL,NULL,'d8b6e0c0-0490-4495-9fb8-2cde5912e81a'),(145,65,NULL,67,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:39','2024-04-02 16:01:39',NULL,NULL,NULL,'860c96e7-359c-48f6-8847-e324e648f5f4'),(146,65,40,NULL,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:40','2024-04-02 16:01:40',NULL,NULL,NULL,'25c89af7-c99d-4d7e-b16c-9aec10a54110'),(147,76,NULL,68,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:44','2024-04-02 16:01:44',NULL,NULL,NULL,'137f76af-0b59-4013-9265-3dfbcea3c263'),(148,76,41,NULL,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:45','2024-04-02 16:01:45',NULL,NULL,NULL,'872fd4b2-e433-43c7-8bbe-48ede13b5cc4'),(150,81,NULL,69,7,'craft\\elements\\Entry',1,0,'2024-04-02 16:01:52','2024-04-02 16:01:52',NULL,NULL,NULL,'84344890-833f-4ded-afa8-3246d5878e3c'),(152,40,NULL,70,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:02:02','2024-04-02 16:02:02',NULL,NULL,NULL,'0e2e15d9-09b2-4a2e-897f-c9a2fcb43ea6'),(153,42,NULL,71,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:02:10','2024-04-02 16:02:10',NULL,NULL,NULL,'649995e3-68fc-4cec-81ce-4dd185fdf558'),(154,42,44,NULL,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:02:11','2024-04-02 16:02:11',NULL,NULL,NULL,'739c06f7-64d3-4288-82f2-c8e54c6b9cdd'),(155,40,NULL,72,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:02:37','2024-04-02 16:02:37',NULL,NULL,NULL,'c2743187-7a26-4592-a5c7-ae9f75bdf088'),(156,40,45,NULL,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:02:38','2024-04-02 16:02:38',NULL,NULL,NULL,'0f8d3d4e-8fe6-452d-85ad-1532fae399ae'),(162,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2024-04-02 16:03:04','2024-04-02 16:03:09',NULL,'2024-04-02 16:03:09',NULL,'5f957a96-d492-49db-8ff8-848f6c36194a'),(163,44,NULL,73,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:03:29','2024-04-02 16:03:29',NULL,NULL,NULL,'dba3032c-4cf1-47fe-aa92-c29c8a7e622a'),(164,44,51,NULL,5,'craft\\elements\\Entry',1,0,'2024-04-02 16:03:30','2024-04-02 16:03:30',NULL,NULL,NULL,'613ccd88-81a0-4617-be0a-910bb4f5b33b');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (54,31,1),(56,55,1),(60,59,1),(68,31,2),(70,69,1),(71,69,2),(85,31,3),(86,31,4),(88,87,1),(89,87,2),(90,87,3),(91,87,4),(97,31,1),(98,31,2),(100,99,1),(101,99,2),(102,99,3),(103,99,4),(104,99,1),(105,99,2),(114,31,3),(115,31,4),(117,116,1),(118,116,2),(119,116,3),(120,116,4),(121,116,1),(122,116,2),(123,116,3),(124,116,4),(131,130,1),(132,130,2),(133,130,3),(134,130,4),(135,130,1),(136,130,2),(137,130,3),(138,130,4);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2022-11-09 01:55:10','2022-11-09 01:55:10','6c13b69f-6482-4f40-862f-e60c641a675c'),(2,2,1,'Wales','wales',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Welsh\"}',1,'2022-11-09 02:01:37','2023-11-08 12:11:01','303028fb-3e9c-482d-b862-fefafb2dde81'),(3,3,1,'Wales','wales','countries/wales','{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Welsh\"}',1,'2022-11-09 02:01:54','2022-11-09 02:01:54','79cb7ea5-84a6-45e0-aa15-3f83815d5bda'),(4,4,1,'France','france',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"French\"}',1,'2022-11-09 02:01:54','2023-11-08 12:11:01','221ce955-eb6c-4434-9b59-b9380cfcf821'),(5,5,1,'France','france','countries/france','{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"French\"}',1,'2022-11-09 02:02:08','2022-11-09 02:02:08','cbd008c7-daa0-41dd-897c-dadc6413cb29'),(6,6,1,'Ireland','ireland',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Irish\"}',1,'2022-11-09 02:02:08','2023-11-08 12:11:01','021b73fc-9fb8-4e76-a93d-7b5e5c6ddf63'),(7,7,1,'Ireland','ireland','countries/ireland','{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Irish\"}',1,'2022-11-09 02:02:19','2022-11-09 02:02:19','a5ed5206-c23c-4b99-9df5-ef5c2e7c3168'),(8,8,1,'Denmark','denmark',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Danish\"}',1,'2022-11-09 02:02:19','2023-11-08 12:11:01','babe5235-30f8-44e1-ab82-a54d01cad6c5'),(9,9,1,'Denmark','denmark','countries/denmark','{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Danish\"}',1,'2022-11-09 02:02:28','2022-11-09 02:02:28','ecdb382e-3f88-4800-ac7c-d1b8d1a5807d'),(10,10,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <i>dreaming<\\/i> of.<\\/p>\"}',1,'2022-11-09 02:02:32','2023-11-09 17:09:27','18beb594-df32-49b2-9ef5-102ce932fee8'),(11,11,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back',NULL,1,'2022-11-09 02:03:05','2022-11-09 02:03:05','2e3af2fa-06c6-4d5f-9677-b7ea0919a998'),(12,12,1,'The Burren',NULL,NULL,NULL,1,'2022-11-09 02:08:45','2022-11-09 02:08:45','248b8a5e-a20b-4040-813e-dc0c684711dd'),(14,14,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back',NULL,1,'2022-11-09 02:09:00','2022-11-09 02:09:00','c5d3eecd-5553-4507-8883-bd09ea7f3122'),(16,16,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been dreaming of.<\\/p>\"}',1,'2022-11-09 15:44:25','2022-11-09 15:44:25','528c70ee-cffc-4641-ab0f-cee099ffae9d'),(18,18,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <em>dreaming<\\/em> of.<\\/p>\"}',1,'2022-11-09 15:44:51','2022-11-09 15:44:51','e6d3b469-fc12-4ce5-9881-182e3eae9728'),(20,20,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <em>dreaming<\\/em> of.<\\/p>\"}',1,'2023-11-08 12:14:09','2023-11-09 17:09:27','9bc4231c-6b12-4753-86fe-9effe95b86b4'),(21,21,1,'France','france',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"French\"}',1,'2023-11-08 18:33:03','2023-11-08 18:33:03','819dede9-4452-4945-bd5b-50f869de0fd0'),(23,23,1,'Croatia','croatia',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Croatian\"}',1,'2023-11-08 18:33:21','2023-11-08 18:33:42','54cc1ff6-201a-46cb-bb6b-e1fe5a5c9aae'),(24,24,1,'Croatia','croatia',NULL,'{\"61d0e030-454e-45da-b305-c47d1d8acbc0\":\"Croatian\"}',1,'2023-11-08 18:33:42','2023-11-08 18:33:42','d505b034-fef2-4015-b9b7-102b9faa46c0'),(25,25,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <em>dreaming<\\/em> of.<\\/p>\"}',1,'2023-11-08 18:39:48','2023-11-09 17:09:27','a6d07b25-c997-4ba2-bca8-a891126b41f5'),(26,26,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <em>dreaming<\\/em> of.<\\/p>\"}',1,'2023-11-08 18:39:56','2023-11-09 17:09:27','264afe2e-e4e2-43f7-a144-1ebf722090ae'),(28,28,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <i>dreaming<\\/i> of. lkjadkljdas asdasd<\\/p>\"}',1,'2023-11-08 18:41:24','2023-11-09 17:09:27','6f2daa4c-5e68-454a-8de8-27d383e9417b'),(30,30,1,'The Burren and Back','the-burren-and-back','trips/the-burren-and-back','{\"5256708c-b416-44ef-9370-6e0979e4e43f\":\"<p>The trip I\'ve been <i>dreaming<\\/i> of.<\\/p>\"}',1,'2023-11-08 18:41:51','2023-11-09 17:09:27','566d1fac-a746-4f81-9c84-8b261d1a30be'),(31,31,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-11-08 19:09:05','2023-12-21 17:00:04','d830bcc3-3c87-492c-9719-36d7466de90b'),(32,32,1,'Spanish tortilla','spanish-tortilla','recipes/spanish-tortilla',NULL,1,'2023-11-08 19:09:22','2023-12-21 17:00:04','e19d1528-3ca6-480c-aa47-b14cc0622b1b'),(34,34,1,'Spanish tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"medium\"}',1,'2023-11-08 19:21:32','2023-12-21 17:00:04','2dd31e6f-bc45-4773-aeef-85703efc0775'),(36,36,1,'Spanish tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\"}',1,'2023-11-08 19:23:24','2023-12-21 17:00:04','72b5c808-f8fe-46bb-b52d-2a8aa2fae70e'),(39,39,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\"}',1,'2023-11-09 18:11:12','2023-12-21 17:00:04','763b3554-5ec0-47c1-94cf-3dfac6aa9647'),(40,40,1,'Gluten-free','gluten-free',NULL,NULL,1,'2023-12-21 16:45:23','2024-04-02 16:02:37','983b26a4-c9ff-4fd7-9600-5fa390294a3c'),(41,41,1,NULL,'gluten-free',NULL,NULL,1,'2023-12-21 16:45:29','2023-12-21 16:45:29','bf592793-dfa6-4c0b-bbad-456d7636a9d0'),(42,42,1,'Vegetarian','vegetarian',NULL,NULL,1,'2023-12-21 16:45:32','2024-04-02 16:02:10','25b59942-3b48-4bc3-a9a4-44af552e7fc3'),(43,43,1,NULL,'vegetarian',NULL,NULL,1,'2023-12-21 16:45:38','2023-12-21 16:45:38','4007c619-43d1-455b-aea8-a54e5bbcd6a9'),(44,44,1,'Vegan','vegan',NULL,NULL,1,'2023-12-21 16:45:40','2024-04-02 16:03:29','c18d1bfd-9b13-4aa9-bf19-b34abded0f46'),(45,45,1,NULL,'vegan',NULL,NULL,1,'2023-12-21 16:45:43','2023-12-21 16:45:43','755dc037-d60f-48b6-8e7c-7daee16ca12b'),(47,47,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:45:54','2023-12-21 16:45:54','7f1cdc04-011a-4365-ae6c-090b48573bdb'),(48,48,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:45:56','2023-12-21 16:45:56','6ecf52f8-64a6-4519-bf7b-594677cb0736'),(49,49,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:45:57','2023-12-21 16:45:57','b9b456ce-c826-4208-a627-674a8449caa4'),(50,50,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:45:57','2023-12-21 16:45:57','dfde24f7-d534-4439-aff7-135589f26268'),(51,51,1,'Onion','onion',NULL,NULL,1,'2023-12-21 16:45:59','2024-04-02 16:01:30','add2f127-1443-4127-a3ce-bb11656ca4a3'),(52,52,1,NULL,'onion',NULL,NULL,1,'2023-12-21 16:46:04','2023-12-21 16:46:04','8bce3a7e-4315-4b59-9efb-6804f46b7955'),(54,54,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:46:09','2024-04-02 16:00:11','5624c157-523d-4d83-8ae5-9c0ca2f3e6c6'),(55,55,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\"}',1,'2023-12-21 16:46:09','2023-12-21 17:00:04','f0345afd-3388-48c7-97f3-f8dc2f92d243'),(56,56,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1}',1,'2023-12-21 16:46:09','2023-12-21 16:46:09','7e94872d-20bf-446c-b61a-0010119f2e9d'),(59,59,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 16:47:55','2023-12-21 17:00:04','1fe3062e-5171-4340-8cb2-6ddb9cae9a22'),(60,60,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\"}',1,'2023-12-21 16:47:55','2023-12-21 16:47:55','df6f9908-2b4a-41e2-bb36-ee00a95609a6'),(62,62,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:47:57','2023-12-21 16:47:57','6c28a0d3-8631-4d29-9ebf-513ee352eb74'),(63,63,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:48:13','2023-12-21 16:48:13','e19e7964-5c44-447a-921a-3984f0888e23'),(64,64,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:48:15','2023-12-21 16:48:15','2f91a60f-bd23-495d-8a60-96d521115865'),(65,65,1,'Olive Oil','olive-oil',NULL,NULL,1,'2023-12-21 16:48:18','2024-04-02 16:01:39','a028a88e-4c3a-4421-a02c-16e4be6d42fc'),(66,66,1,NULL,'olive-oil',NULL,NULL,1,'2023-12-21 16:48:23','2023-12-21 16:48:23','004f472f-537d-4cf9-a6e5-f309be92b2bb'),(68,68,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoons\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:48:26','2023-12-21 16:48:26','65f2221a-be8b-4e02-b617-60839fbc734f'),(69,69,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 16:48:26','2023-12-21 17:00:04','5013c3b4-bcb6-4150-93b1-a41eee67c5d7'),(70,70,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\"}',1,'2023-12-21 16:48:26','2023-12-21 16:48:26','131fe94c-bab4-439d-8fdd-2e62cb83e8b6'),(71,71,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoon\"}',1,'2023-12-21 16:48:26','2023-12-21 16:48:26','cdca8188-ce88-40b0-868d-6225e6e8a4b6'),(74,74,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:48:52','2023-12-21 16:48:52','e18140d5-427a-417d-8b0d-71a8f645c148'),(75,75,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:48:56','2023-12-21 16:48:56','71646e02-fa53-4e3e-baf8-afb2c8970673'),(76,76,1,'Butter','butter',NULL,NULL,1,'2023-12-21 16:48:58','2024-04-02 16:01:44','7d9587cd-a35f-4b8c-916d-c0d0bb64b11f'),(77,77,1,NULL,'butter',NULL,NULL,1,'2023-12-21 16:49:02','2023-12-21 16:49:02','f1d4c3fc-f054-4b29-bba1-6cd5d78e512e'),(79,79,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:49:35','2023-12-21 16:49:35','8df766a8-50b5-4359-890a-0cddb2e0cf83'),(80,80,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:49:40','2023-12-21 16:49:40','f5e8c64c-bc4f-4063-a703-c327772eb89f'),(81,81,1,'Baguette','baguette',NULL,NULL,1,'2023-12-21 16:49:42','2024-04-02 16:01:52','459798a5-75e9-423e-8851-11beffe156bd'),(82,82,1,NULL,'baguette',NULL,NULL,1,'2023-12-21 16:49:51','2023-12-21 16:49:51','10ebaf53-b6f2-4e04-8f1d-c4276ef289e7'),(83,83,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:49:54','2023-12-21 16:49:54','4d9e44cb-5a42-4f82-8ae9-f3b034b2df9c'),(85,85,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":25,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"grams\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','13891bc8-1744-4a35-b2e8-f9b160f20a3b'),(86,86,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":true}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','44b6d0d8-d259-492c-8f2e-ca3c4cf45069'),(87,87,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 16:49:56','2023-12-21 17:00:04','77fd345a-8fba-4849-a95a-70a51aabcadb'),(88,88,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','946a5fba-a943-42bf-92fe-7a564af2bcbd'),(89,89,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoons\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','5ce7ba18-2514-4911-aac5-b64f5795f105'),(90,90,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":25,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"grams\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','47ca4f5c-141e-41c0-a817-6be640626fe2'),(91,91,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":true}',1,'2023-12-21 16:49:56','2023-12-21 16:49:56','4f75a57d-2be9-44af-bebe-3112eedbb477'),(93,93,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:52:49','2023-12-21 16:52:49','ec7a9b9e-b75f-482f-a2ac-6974351c8563'),(94,94,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:52:50','2023-12-21 16:52:50','0ffc59bc-2467-4541-b470-c197c2877e1f'),(97,97,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put a large non-stick frying pan on a low heat. Cook the onion slowly in the oil and butter until soft but not brown – this should take about 15 mins. Meanwhile, peel the tomatoes (if using) by scoring the skins with a cross, putting them in a bowl and pouring over just-boiled water. Drain the water after 2-3 mins and the skins will peel away easily. You can then coarsely grate them.<\\/p>\"}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','4f8a5e6b-7c90-484c-b7cf-a9fe2fbac982'),(98,98,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Add the potatoes to the pan, then cover and cook for a further 15-20 mins, stirring occasionally to make sure they fry evenly. When the potatoes are soft and the onion is shiny, crush 2 garlic cloves and stir in, followed by the beaten eggs.<\\/p>\"}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','efddad01-82b2-4d38-882f-c261b4dfd5e0'),(99,99,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 16:52:55','2023-12-21 17:00:04','3e523047-73fa-470e-9bf0-752886058cc3'),(100,100,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','36d47cd0-c126-4389-9723-724f8da6618f'),(101,101,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoons\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','415ae78f-e484-43d3-9422-6571e98170db'),(102,102,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":25,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"grams\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','ae37fe1f-f756-4008-a1b6-27022a96369d'),(103,103,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":true}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','55351ce0-fe65-4de8-a4d1-dcf687364a20'),(104,104,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put a large non-stick frying pan on a low heat. Cook the onion slowly in the oil and butter until soft but not brown – this should take about 15 mins. Meanwhile, peel the tomatoes (if using) by scoring the skins with a cross, putting them in a bowl and pouring over just-boiled water. Drain the water after 2-3 mins and the skins will peel away easily. You can then coarsely grate them.<\\/p>\"}',1,'2023-12-21 16:52:55','2023-12-21 16:52:55','26efc712-e53e-4c4b-afc0-cab2fd13dae9'),(105,105,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','ac276f80-e7c5-4f28-9cfc-caf1598a507d'),(108,108,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:53:11','2023-12-21 16:53:11','23bbe161-e51d-42bf-9a5d-a9e0572ec9e5'),(109,109,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:53:17','2023-12-21 16:53:17','0f750ea1-db31-4b97-9a3b-dcf9734abf37'),(110,110,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:53:18','2023-12-21 16:53:18','d34a12ef-e92e-4857-8eea-706cc06fd7e6'),(111,111,1,NULL,NULL,NULL,NULL,1,'2023-12-21 16:53:18','2023-12-21 16:53:18','80dcee9f-11d4-495d-a31e-d3c7d3df321c'),(114,114,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put the lid back on the pan and leave the tortilla to cook gently. After 20 mins, the edges and base should be golden, the top set but the middle still a little wobbly. To turn it over, slide it onto a plate and put another plate on top, turn the whole thing over and slide it back into the pan to finish cooking.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','2e373a8b-8bdd-4cce-b01d-ef6aeefdc0a8'),(115,115,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Once cooked, transfer to a plate and serve the tortilla warm or cold, scattered with the chopped parsley. To accompany the tortilla, take slices of warmed baguette, stab all over with a fork and rub with the remaining garlic, pile on the grated tomatoes and season with sea salt and a drizzle of olive oil.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','03985166-42ba-4f4e-8ac0-fabdb325b9ce'),(116,116,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 17:00:04','4ed6d2cd-73f9-4f5a-bd4c-51523226b86a'),(117,117,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','bfb31010-b2e7-4671-8211-b4ac8c17b225'),(118,118,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoons\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','7d1c1b21-c9b5-4415-b8c6-254ba3cd5a1b'),(119,119,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":25,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"grams\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','ca1b3958-c6ef-4e76-b491-0ff01461cdb4'),(120,120,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":true}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','37602184-ef00-4fc0-9ff2-be29a5ce9c9e'),(121,121,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put a large non-stick frying pan on a low heat. Cook the onion slowly in the oil and butter until soft but not brown – this should take about 15 mins. Meanwhile, peel the tomatoes (if using) by scoring the skins with a cross, putting them in a bowl and pouring over just-boiled water. Drain the water after 2-3 mins and the skins will peel away easily. You can then coarsely grate them.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','2ced9fd4-5cc0-427b-a122-4b67244319c6'),(122,122,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Add the potatoes to the pan, then cover and cook for a further 15-20 mins, stirring occasionally to make sure they fry evenly. When the potatoes are soft and the onion is shiny, crush 2 garlic cloves and stir in, followed by the beaten eggs.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','32916ee5-be8a-49fd-bb72-5696ce58b4e1'),(123,123,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put the lid back on the pan and leave the tortilla to cook gently. After 20 mins, the edges and base should be golden, the top set but the middle still a little wobbly. To turn it over, slide it onto a plate and put another plate on top, turn the whole thing over and slide it back into the pan to finish cooking.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','4aecb83d-daf6-4734-b9d7-105f30ee5160'),(124,124,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Once cooked, transfer to a plate and serve the tortilla warm or cold, scattered with the chopped parsley. To accompany the tortilla, take slices of warmed baguette, stab all over with a fork and rub with the remaining garlic, pile on the grated tomatoes and season with sea salt and a drizzle of olive oil.<\\/p>\"}',1,'2023-12-21 16:53:27','2023-12-21 16:53:27','a8449cb1-1232-49f8-aedd-fbef702a27a8'),(125,125,1,'Gluten free',NULL,NULL,NULL,1,'2023-12-21 16:55:00','2023-12-21 16:55:00','1d825c29-8263-4d8d-8778-d591e6a264bf'),(127,127,1,NULL,'gluten-free',NULL,NULL,1,'2023-12-21 16:55:07','2023-12-21 16:55:07','1fd993b4-636a-4eb5-b530-4d8612af5197'),(128,128,1,'Spanish tortilla',NULL,NULL,NULL,1,'2023-12-21 17:02:30','2023-12-21 17:02:30','21ca0a22-f7a7-400f-a51a-15c09579497e'),(130,130,1,'Spanish Tortilla','spanish-tortilla','recipes/spanish-tortilla','{\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\":30,\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"aa401446-0d96-4226-8bce-2cea143af5c6\":4,\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"easy\",\"95896741-273b-4938-be6c-b8ba02b1019b\":\"<p>Make a <i>classic<\\/i> <strong>Spanish omelette<\\/strong> filled with pan-fried potatoes and onion. It makes a delicious light vegetarian meal or an easy tapas dish.<\\/p>\"}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','c19c83ca-a88f-4233-b57e-dcf87c5cb92e'),(131,131,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','594f2e94-e02d-422e-ac89-08d9e985aceb'),(132,132,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":4,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"tablespoons\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','a6b67b00-5bbb-48e0-89d8-ace13195071a'),(133,133,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":25,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"grams\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":false}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','817a819b-c698-46a9-8b58-2c821f15e685'),(134,134,1,NULL,NULL,NULL,'{\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\":1,\"b711e58d-36da-42b1-95e0-f378fc9f3c15\":\"single\",\"c42c4455-0726-4f91-a9dd-57883ac41781\":true}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','5d2a5cab-e778-4dd2-bb42-997e0074ada7'),(135,135,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put a large non-stick frying pan on a low heat. Cook the onion slowly in the oil and butter until soft but not brown – this should take about 15 mins. Meanwhile, peel the tomatoes (if using) by scoring the skins with a cross, putting them in a bowl and pouring over just-boiled water. Drain the water after 2-3 mins and the skins will peel away easily. You can then coarsely grate them.<\\/p>\"}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','b6e33801-9f0c-432e-9f69-2a28c5f94c52'),(136,136,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Add the potatoes to the pan, then cover and cook for a further 15-20 mins, stirring occasionally to make sure they fry evenly. When the potatoes are soft and the onion is shiny, crush 2 garlic cloves and stir in, followed by the beaten eggs.<\\/p>\"}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','d17055af-0cc6-4954-bc35-e8d0025c964e'),(137,137,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Put the lid back on the pan and leave the tortilla to cook gently. After 20 mins, the edges and base should be golden, the top set but the middle still a little wobbly. To turn it over, slide it onto a plate and put another plate on top, turn the whole thing over and slide it back into the pan to finish cooking.<\\/p>\"}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','bc4c682e-8d76-4f94-a309-8f7705ee9058'),(138,138,1,NULL,NULL,NULL,'{\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\":\"<p>Once cooked, transfer to a plate and serve the tortilla warm or cold, scattered with the chopped parsley. To accompany the tortilla, take slices of warmed baguette, stab all over with a fork and rub with the remaining garlic, pile on the grated tomatoes and season with sea salt and a drizzle of olive oil.<\\/p>\"}',1,'2023-12-21 17:02:40','2023-12-21 17:02:40','f2a8a409-b775-4005-b3ad-2bc7417e46ee'),(140,140,1,'Scrambled Eggs','scrambled-eggs','recipes/scrambled-eggs','{\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"medium\"}',1,'2024-01-16 19:23:31','2024-01-16 19:23:38','70165fa6-7427-4e45-b141-682fe520bea8'),(141,141,1,'Scrambled eggs 1 1712564176',NULL,NULL,NULL,1,'2024-01-16 19:23:59','2024-01-16 19:23:59','fdbcc154-22e5-43d3-be62-592b9126e968'),(142,142,1,'Scrambled Eggs','scrambled-eggs','recipes/scrambled-eggs','{\"064ef110-5cb9-4a5a-95d6-9feeff624d33\":\"minutes\",\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\":\"medium\"}',1,'2024-01-16 19:24:02','2024-01-16 19:24:02','261b90bb-6a6c-462f-be0c-225e89a9c576'),(143,143,1,'Onion','onion',NULL,NULL,1,'2024-04-02 16:01:30','2024-04-02 16:01:30','99c1d4c3-b485-4f25-8a93-bfd89a7c0cc4'),(144,144,1,'Onion','onion',NULL,NULL,1,'2024-04-02 16:01:31','2024-04-02 16:01:31','a6b22b00-5026-4716-a163-92b780392821'),(145,145,1,'Olive Oil','olive-oil',NULL,NULL,1,'2024-04-02 16:01:39','2024-04-02 16:01:39','c28bed05-217d-4b01-a47e-5d0eb5bb2675'),(146,146,1,'Olive Oil','olive-oil',NULL,NULL,1,'2024-04-02 16:01:40','2024-04-02 16:01:40','70b3949f-2548-4820-9f32-d1b738a1d3c8'),(147,147,1,'Butter','butter',NULL,NULL,1,'2024-04-02 16:01:44','2024-04-02 16:01:44','d9f4958f-0057-4bcc-858a-bf45ccc030d4'),(148,148,1,'Butter','butter',NULL,NULL,1,'2024-04-02 16:01:45','2024-04-02 16:01:45','1c424040-4338-45ba-aed1-de2ec02cba7b'),(150,150,1,'Baguette','baguette',NULL,NULL,1,'2024-04-02 16:01:52','2024-04-02 16:01:52','8cc89bce-c8f5-444d-b363-3d4c29649236'),(152,152,1,'Gluten free','gluten-free',NULL,NULL,1,'2024-04-02 16:02:02','2024-04-02 16:02:02','6a89f5ae-04cb-4a49-b754-596a662e1033'),(153,153,1,'Vegetarian','vegetarian',NULL,NULL,1,'2024-04-02 16:02:10','2024-04-02 16:02:10','c3e9f352-d10b-42aa-98ce-d8d4be285d29'),(154,154,1,'Vegetarian','vegetarian',NULL,NULL,1,'2024-04-02 16:02:11','2024-04-02 16:02:11','e7337329-e172-4f2b-897f-0aa2b4c5aa01'),(155,155,1,'Gluten-free','gluten-free',NULL,NULL,1,'2024-04-02 16:02:37','2024-04-02 16:02:37','0ef92bfc-1447-44ae-8e2f-ce67e91dc300'),(156,156,1,'Gluten-free','gluten-free',NULL,NULL,1,'2024-04-02 16:02:38','2024-04-02 16:02:38','1d889a1a-aaa0-44c9-8018-cf370d74da5c'),(162,162,1,NULL,'__temp_ojupnojxnodeiiuvkikzsyaafdfkufpbdjkb',NULL,NULL,1,'2024-04-02 16:03:04','2024-04-02 16:03:04','e30bc109-0284-4917-9328-1f30f0c6893f'),(163,163,1,'Vegan','vegan',NULL,NULL,1,'2024-04-02 16:03:29','2024-04-02 16:03:29','24a7f5c3-ae8c-4b31-8aca-970b8a5c25d8'),(164,164,1,'Vegan','vegan',NULL,NULL,1,'2024-04-02 16:03:30','2024-04-02 16:03:30','e44be242-6024-4032-b90b-0afb07a3fc43');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2022-11-09 02:01:00',NULL,NULL,'2022-11-09 02:01:37','2022-11-09 02:01:54'),(3,1,NULL,NULL,NULL,1,'2022-11-09 02:01:00',NULL,NULL,'2022-11-09 02:01:54','2022-11-09 02:01:54'),(4,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:01:54','2022-11-09 02:02:08'),(5,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:02:08','2022-11-09 02:02:08'),(6,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:02:08','2022-11-09 02:02:19'),(7,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:02:19','2022-11-09 02:02:19'),(8,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:02:19','2022-11-09 02:02:28'),(9,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2022-11-09 02:02:28','2022-11-09 02:02:28'),(10,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2022-11-09 02:02:32','2023-11-08 12:14:09'),(11,2,NULL,NULL,NULL,2,'2022-11-09 02:03:00',NULL,NULL,'2022-11-09 02:03:05','2022-11-09 02:03:05'),(14,2,NULL,NULL,NULL,2,'2022-11-09 02:03:00',NULL,NULL,'2022-11-09 02:09:00','2022-11-09 02:09:00'),(16,2,NULL,NULL,NULL,2,'2022-11-09 02:03:00',NULL,NULL,'2022-11-09 15:44:25','2022-11-09 15:44:25'),(18,2,NULL,NULL,NULL,2,'2022-11-09 02:03:00',NULL,NULL,'2022-11-09 15:44:51','2022-11-09 15:44:51'),(20,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2023-11-08 12:14:09','2023-11-08 12:14:09'),(21,1,NULL,NULL,NULL,1,'2022-11-09 02:02:00',NULL,NULL,'2023-11-08 18:33:03','2023-11-08 18:33:03'),(23,1,NULL,NULL,NULL,1,'2023-11-08 18:33:00',NULL,NULL,'2023-11-08 18:33:21','2023-11-08 18:33:42'),(24,1,NULL,NULL,NULL,1,'2023-11-08 18:33:00',NULL,NULL,'2023-11-08 18:33:42','2023-11-08 18:33:42'),(25,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2023-11-08 18:39:48','2023-11-08 18:39:48'),(26,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2023-11-08 18:39:56','2023-11-08 18:39:56'),(28,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2023-11-08 18:41:24','2023-11-08 18:41:24'),(30,2,NULL,NULL,NULL,2,'2023-11-08 12:14:00',NULL,NULL,'2023-11-08 18:41:51','2023-11-08 18:41:51'),(31,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-11-08 19:09:05','2023-11-08 19:09:22'),(32,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-11-08 19:09:22','2023-11-08 19:09:22'),(34,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-11-08 19:21:32','2023-11-08 19:21:32'),(36,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-11-08 19:23:24','2023-11-08 19:23:24'),(39,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-11-09 18:11:12','2023-11-09 18:11:12'),(40,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:23','2023-12-21 16:45:29'),(41,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:29','2023-12-21 16:45:29'),(42,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:32','2023-12-21 16:45:38'),(43,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:38','2023-12-21 16:45:38'),(44,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:40','2023-12-21 16:45:43'),(45,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:45:43','2023-12-21 16:45:43'),(51,5,NULL,NULL,NULL,5,'2023-12-21 16:46:00',NULL,NULL,'2023-12-21 16:45:59','2023-12-21 16:46:04'),(52,5,NULL,NULL,NULL,5,'2023-12-21 16:46:00',NULL,NULL,'2023-12-21 16:46:04','2023-12-21 16:46:04'),(54,NULL,NULL,31,9,7,'2023-12-21 16:46:09',NULL,NULL,'2023-12-21 16:46:09','2023-12-21 16:46:09'),(55,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:46:09','2023-12-21 16:46:09'),(56,NULL,NULL,55,9,7,'2023-12-21 16:46:09',NULL,NULL,'2023-12-21 16:46:09','2023-12-21 16:46:09'),(59,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:47:55','2023-12-21 16:47:55'),(60,NULL,NULL,59,9,7,'2023-12-21 16:47:55',NULL,NULL,'2023-12-21 16:47:55','2023-12-21 16:47:55'),(65,5,NULL,NULL,NULL,5,'2023-12-21 16:48:00',NULL,NULL,'2023-12-21 16:48:18','2023-12-21 16:48:23'),(66,5,NULL,NULL,NULL,5,'2023-12-21 16:48:00',NULL,NULL,'2023-12-21 16:48:23','2023-12-21 16:48:23'),(68,NULL,NULL,31,9,7,'2023-12-21 16:48:26',NULL,NULL,'2023-12-21 16:48:26','2023-12-21 16:48:26'),(69,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:48:26','2023-12-21 16:48:26'),(70,NULL,NULL,69,9,7,'2023-12-21 16:48:26',NULL,NULL,'2023-12-21 16:48:26','2023-12-21 16:48:26'),(71,NULL,NULL,69,9,7,'2023-12-21 16:48:26',NULL,NULL,'2023-12-21 16:48:26','2023-12-21 16:48:26'),(76,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2023-12-21 16:48:58','2023-12-21 16:49:02'),(77,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2023-12-21 16:49:02','2023-12-21 16:49:02'),(81,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2023-12-21 16:49:42','2023-12-21 16:49:51'),(82,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2023-12-21 16:49:51','2023-12-21 16:49:51'),(85,NULL,NULL,31,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(86,NULL,NULL,31,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(87,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(88,NULL,NULL,87,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(89,NULL,NULL,87,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(90,NULL,NULL,87,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(91,NULL,NULL,87,9,7,'2023-12-21 16:49:56',NULL,NULL,'2023-12-21 16:49:56','2023-12-21 16:49:56'),(97,NULL,NULL,31,15,6,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(98,NULL,NULL,31,15,6,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(99,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(100,NULL,NULL,99,9,7,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(101,NULL,NULL,99,9,7,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(102,NULL,NULL,99,9,7,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(103,NULL,NULL,99,9,7,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(104,NULL,NULL,99,15,6,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(105,NULL,NULL,99,15,6,'2023-12-21 16:52:55',NULL,NULL,'2023-12-21 16:52:55','2023-12-21 16:52:55'),(114,NULL,NULL,31,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(115,NULL,NULL,31,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(116,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(117,NULL,NULL,116,9,7,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(118,NULL,NULL,116,9,7,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(119,NULL,NULL,116,9,7,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(120,NULL,NULL,116,9,7,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(121,NULL,NULL,116,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(122,NULL,NULL,116,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(123,NULL,NULL,116,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(124,NULL,NULL,116,15,6,'2023-12-21 16:53:27',NULL,NULL,'2023-12-21 16:53:27','2023-12-21 16:53:27'),(127,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2023-12-21 16:55:07','2023-12-21 16:55:07'),(130,3,NULL,NULL,NULL,3,'2023-11-08 19:09:00',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(131,NULL,NULL,130,9,7,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(132,NULL,NULL,130,9,7,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(133,NULL,NULL,130,9,7,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(134,NULL,NULL,130,9,7,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(135,NULL,NULL,130,15,6,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(136,NULL,NULL,130,15,6,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(137,NULL,NULL,130,15,6,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(138,NULL,NULL,130,15,6,'2023-12-21 17:02:40',NULL,NULL,'2023-12-21 17:02:40','2023-12-21 17:02:40'),(140,3,NULL,NULL,NULL,3,'2024-01-16 19:24:00',NULL,NULL,'2024-01-16 19:23:31','2024-01-16 19:24:02'),(142,3,NULL,NULL,NULL,3,'2024-01-16 19:24:00',NULL,NULL,'2024-01-16 19:24:02','2024-01-16 19:24:02'),(143,5,NULL,NULL,NULL,5,'2023-12-21 16:46:00',NULL,NULL,'2024-04-02 16:01:30','2024-04-02 16:01:30'),(144,5,NULL,NULL,NULL,5,'2023-12-21 16:46:00',NULL,NULL,'2024-04-02 16:01:31','2024-04-02 16:01:31'),(145,5,NULL,NULL,NULL,5,'2023-12-21 16:48:00',NULL,NULL,'2024-04-02 16:01:39','2024-04-02 16:01:39'),(146,5,NULL,NULL,NULL,5,'2023-12-21 16:48:00',NULL,NULL,'2024-04-02 16:01:40','2024-04-02 16:01:40'),(147,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2024-04-02 16:01:44','2024-04-02 16:01:44'),(148,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2024-04-02 16:01:45','2024-04-02 16:01:45'),(150,5,NULL,NULL,NULL,5,'2023-12-21 16:49:00',NULL,NULL,'2024-04-02 16:01:52','2024-04-02 16:01:52'),(152,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:02:02','2024-04-02 16:02:02'),(153,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:02:10','2024-04-02 16:02:10'),(154,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:02:11','2024-04-02 16:02:11'),(155,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:02:37','2024-04-02 16:02:37'),(156,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:02:38','2024-04-02 16:02:38'),(163,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:03:29','2024-04-02 16:03:29'),(164,4,NULL,NULL,NULL,4,'2023-12-21 16:45:00',NULL,NULL,'2024-04-02 16:03:30','2024-04-02 16:03:30');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(14,1,1),(16,1,1),(18,1,1),(20,1,1),(21,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(28,1,1),(30,1,1),(31,1,1),(32,1,1),(34,1,1),(36,1,1),(39,1,1),(40,1,1),(41,1,1),(42,1,1),(43,1,1),(44,1,1),(45,1,1),(51,1,1),(52,1,1),(55,1,1),(59,1,1),(65,1,1),(66,1,1),(69,1,1),(76,1,1),(77,1,1),(81,1,1),(82,1,1),(87,1,1),(99,1,1),(116,1,1),(127,1,1),(130,1,1),(140,1,1),(142,1,1),(143,1,1),(144,1,1),(145,1,1),(146,1,1),(147,1,1),(148,1,1),(150,1,1),(152,1,1),(153,1,1),(154,1,1),(155,1,1),(156,1,1),(163,1,1),(164,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Countries - Default','countries_default',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2022-11-09 01:58:36','2024-04-02 16:00:03',NULL,'65a39f0b-19b3-4457-b8da-8bd66251a3b9'),(2,2,'Trips - Default','trips_default',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2022-11-09 01:58:47','2024-04-02 16:00:03',NULL,'87d4c11a-4922-4878-a4fc-b45e075a4066'),(3,4,'Recipes - Default','recipes_default',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2023-11-08 19:08:29','2024-04-02 16:00:03',NULL,'8343f4ab-c5bd-42a0-a37e-3c58121f759a'),(4,5,'Dietary Preferences - Default','dietaryPreferences_default',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2023-12-21 16:38:42','2024-04-02 16:00:03',NULL,'7d0487ea-cc61-4615-bbec-1d35fb6e0129'),(5,7,'Default','default',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2023-12-21 16:41:50','2023-12-21 16:41:50',NULL,'0ad8c9e9-84c2-4582-91e3-f726d2a16faf'),(6,8,'Step','step',NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2024-04-02 16:00:03','2024-04-02 16:00:03',NULL,'2ff70388-58ff-42cc-b63c-8b6a921ff80a'),(7,6,'Ingredient','ingredient',NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2024-04-02 16:00:03','2024-04-02 16:00:03',NULL,'350d3b36-f9ac-4a5c-9324-598b3fc4d31f');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"0b87a8ec-712a-4125-b497-e0f93b7c3cb9\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"15ce498b-c14b-4a26-9df2-84f0fb959c81\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"61d0e030-454e-45da-b305-c47d1d8acbc0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"055364d9-1405-4285-b2ea-2c1258fb8586\"}]}]}','2022-11-09 01:58:36','2024-04-02 16:00:03',NULL,'2d1c6228-938f-4073-a68f-ab5bde31672a'),(2,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ce6cc63b-457e-4196-b301-26402494461e\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\Tip\",\"tip\":\"A trip represents series of countries I’d like to visit.\",\"dismissible\":false,\"style\":\"tip\",\"uid\":\"17de7a93-8504-4afa-8323-5093ecf70040\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"6481d120-bd0c-4523-a83f-601ff7a43623\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"883ad9a4-3e2e-4da4-bdb0-cb03bba64c66\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"f41b0741-e8cd-41f7-ad1e-06bdd43db253\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d603abda-1959-4187-a2c1-1b5057ab327b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5256708c-b416-44ef-9370-6e0979e4e43f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4455e8f9-3d20-4764-a87b-5177d121b07e\"}]}]}','2022-11-09 01:58:47','2024-04-02 16:00:03',NULL,'013a6d5b-cb96-457b-9e36-985e7a0dad34'),(3,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"8c6ee6fa-fe76-4c10-bcf6-4477ad012ed4\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"06beb3f4-8078-45bc-82ad-4d953c50a945\",\"userCondition\":null,\"elementCondition\":null}]}]}','2022-11-09 02:05:48','2024-04-02 16:00:03',NULL,'69097259-d1e1-46f0-a143-b642d3254ca6'),(4,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ca0537d2-feee-4813-a7b3-c8a7b9a94db9\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"32b7d732-cf22-4430-961f-248e20858c93\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"cf0d203a-e81d-4653-8832-1de07656a22c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"15b6744c-b46d-4988-91ba-602d720d8ff4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"064ef110-5cb9-4a5a-95d6-9feeff624d33\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ce104f24-5b45-4226-be21-a252a37927e2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"aa401446-0d96-4226-8bce-2cea143af5c6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0993baf9-ae54-4148-9bd7-d1e26ab888fc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"94fcec23-115a-4bf5-8d3f-e54597736f24\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"95896741-273b-4938-be6c-b8ba02b1019b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4455e8f9-3d20-4764-a87b-5177d121b07e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"70938fcf-f748-4ef1-a17e-219e7ea9e026\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ca33dcf3-3d91-40de-bf74-8143afdea7f8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"353f9550-2f13-4d3d-a7d1-b41d27546a1a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f387678b-4bf0-44d0-9c69-1d60c3f3f47f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"a0e21654-a20e-4cf6-9303-630c99a1244b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d727ec15-9e7c-41dd-b0fd-d03c85fb0716\"}]}]}','2023-11-08 19:08:29','2024-04-02 16:00:03',NULL,'57b61060-1836-4296-81e7-9c1ec8126312'),(5,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"3fc59463-95a7-4791-9a31-a49c404793cf\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"0dea6460-8e88-4f92-bfcd-c47dbded964e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Icon\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"7ed4b740-164d-438a-a1dc-3943ce2a3161\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Description\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"efa13d8e-1daa-4762-9330-fb054c554447\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4455e8f9-3d20-4764-a87b-5177d121b07e\"}]}]}','2023-12-21 16:38:42','2024-04-02 16:00:03',NULL,'85693f11-7ff0-4592-af59-550353e07dc5'),(6,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"8b1e2702-abce-4b2c-b692-58a2812a05fa\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Amount\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":true,\"width\":100,\"uid\":\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c468e7d7-2de4-4f6e-9a17-a3f6b7db6201\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Unit\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"b711e58d-36da-42b1-95e0-f378fc9f3c15\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"85a72c78-c803-474c-84f0-fdc1af1facd0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Ingredient\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"50d40cc6-b13d-4e77-909f-a030c360f6af\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Optional\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"c42c4455-0726-4f91-a9dd-57883ac41781\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61\"}]}]}','2023-12-21 16:41:20','2024-04-02 16:00:03',NULL,'4ff942a1-a358-4d9f-b7ea-953cbbfcd796'),(7,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"224accbf-3cca-418d-aa29-0c687d64c134\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"b5fde786-34ca-42d1-ba97-f38842ff1c7b\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"68ac6485-8fd6-43a4-95ab-856db69f7302\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"b354eb90-cb33-4cac-bb97-3d36e37ad629\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4455e8f9-3d20-4764-a87b-5177d121b07e\"}]}]}','2023-12-21 16:41:50','2024-04-02 16:00:03',NULL,'c2f2eebe-5898-4db6-bc94-7f830f92797a'),(8,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"d1d47324-0ecc-48a3-bb71-aa3d4660b937\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Instruction Text\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":true,\"width\":100,\"uid\":\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cdaa4293-0023-43e6-8f68-4f42d5f502b3\"}]}]}','2023-12-21 16:52:14','2024-04-02 16:00:03',NULL,'4872b36a-47a3-49b0-b73f-444d2adb799a');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Countries','countries','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":\"Add a country\",\"showSiteMenu\":false,\"source\":null,\"sources\":[\"section:65e19c67-6869-4b02-8f73-1faddec1820b\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2022-11-09 01:59:54','2022-11-09 01:59:54','d603abda-1959-4187-a2c1-1b5057ab327b'),(2,'Language To Learn','languageToLearn','global','zawcgefj','Speaking a few words in the local language is part of the experience!',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-11-09 02:00:26','2022-11-09 02:00:26','055364d9-1405-4285-b2ea-2c1258fb8586'),(3,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:5e23629a-bc17-41b0-b9b7-8afe3687d8d4\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:5e23629a-bc17-41b0-b9b7-8afe3687d8d4\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add an image\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-11-09 02:04:09','2022-11-09 02:08:36','9607b25c-41e6-49ee-92f6-4f598d9bb638'),(4,'Summary','summary','global','qsbpsoen',NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"7210974a-b52d-4727-9ff5-3bb9053bd3a5\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2022-11-09 15:43:39','2023-11-08 12:03:42','4455e8f9-3d20-4764-a87b-5177d121b07e'),(5,'Preparation Time','preparationTime','global','brpygnsi',NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2023-11-08 19:13:37','2023-11-08 19:18:20','15b6744c-b46d-4988-91ba-602d720d8ff4'),(6,'Preparation Time Units','preparationTimeUnits','global','pjurfwul',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"columnType\":null,\"options\":[{\"label\":\"Minutes\",\"value\":\"minutes\",\"default\":\"1\"},{\"label\":\"Hours\",\"value\":\"hours\",\"default\":\"\"},{\"label\":\"Days\",\"value\":\"days\",\"default\":\"\"}]}','2023-11-08 19:18:56','2023-11-09 18:10:58','ce104f24-5b45-4226-be21-a252a37927e2'),(7,'Level of Difficulty','levelOfDifficulty','global','yxrtmvkq',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"columnType\":null,\"options\":[{\"label\":\"Easy\",\"value\":\"easy\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"1\"},{\"label\":\"Difficult\",\"value\":\"difficult\",\"default\":\"\"}]}','2023-11-08 19:21:16','2023-11-08 19:21:16','94fcec23-115a-4bf5-8d3f-e54597736f24'),(8,'Dietary Preferences','dietaryPreferences','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":\"Add a dietary preference\",\"showSiteMenu\":true,\"sources\":[\"section:4f4c5e55-bdb6-4b11-a80c-a707a67c93c8\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-12-21 16:39:51','2023-12-21 17:01:20','ca33dcf3-3d91-40de-bf74-8143afdea7f8'),(9,'Recipe Ingredients','recipeIngredients','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"maxEntries\":null,\"minEntries\":null,\"entryTypes\":[\"350d3b36-f9ac-4a5c-9324-598b3fc4d31f\"],\"viewMode\":\"blocks\"}','2023-12-21 16:41:20','2023-12-21 17:01:32','f387678b-4bf0-44d0-9c69-1d60c3f3f47f'),(10,'Recipe Ingredients - Ingredient - Unit','unit','global','avvrcadt',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"columnType\":null,\"options\":[{\"label\":\"Single\",\"value\":\"single\",\"default\":\"\"},{\"label\":\"Grams\",\"value\":\"grams\",\"default\":\"\"},{\"label\":\"Tablespoons\",\"value\":\"tablespoons\",\"default\":\"\"},{\"label\":\"Teaspoons\",\"value\":\"teaspoons\",\"default\":\"\"}]}','2023-12-21 16:41:20','2023-12-21 16:48:38','85a72c78-c803-474c-84f0-fdc1af1facd0'),(11,'Recipe Ingredients - Ingredient - Ingredient','ingredient','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"sources\":[\"section:842cdeba-cd27-4e0b-9de5-60ed051ee6bd\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-12-21 16:41:20','2023-12-21 16:46:20','3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3'),(12,'Recipe Ingredients - Ingredient - Amount','amount','global','agrmetjb',NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2023-12-21 16:41:20','2023-12-21 16:41:20','c468e7d7-2de4-4f6e-9a17-a3f6b7db6201'),(13,'Number of Servings','numberOfServings','global','pjqnujfz','The number of people this recipe serves.',0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":\"servings\"}','2023-12-21 16:44:25','2023-12-21 16:44:25','0993baf9-ae54-4148-9bd7-d1e26ab888fc'),(14,'Recipe Ingredients - Ingredient - Optional','optional','global','apfpjfko','Whether this is an optional ingredient in the recipe.',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2023-12-21 16:49:25','2023-12-21 16:49:25','d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61'),(15,'Instruction Steps','instructionSteps','global',NULL,'Add one instructions step per block.',0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"2ff70388-58ff-42cc-b63c-8b6a921ff80a\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2023-12-21 16:52:14','2024-04-02 16:05:42','d727ec15-9e7c-41dd-b0fd-d03c85fb0716'),(16,'Instruction Steps - Step - Instruction Text','instructionText','global','utyfynxo',NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"7210974a-b52d-4727-9ff5-3bb9053bd3a5\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2023-12-21 16:52:14','2023-12-21 16:52:14','cdaa4293-0023-43e6-8f68-4f42d5f502b3'),(17,'Suitable for Children','suitableForChildren','global','wbpwyepw','Whether this recipe is suitable for preparing with children.',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2024-01-16 17:33:52','2024-01-16 17:35:35','1c18b349-157b-4305-9f43-5809f4ebb583');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.0.0','5.0.0.20',0,'eofgebmfdssi','3@yeuoqzcrai','2022-11-09 01:55:10','2024-04-02 16:05:42','b0a90193-b57d-4e13-87e0-b79179b6c2ed');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','722f1abb-4826-4301-b99a-fe7c6510138c'),(2,'craft','m210121_145800_asset_indexing_changes','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','7275dce1-63dd-4f43-8e0a-342a7393bf66'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','f7094017-1dc0-493c-8182-5fb9c3ac95c2'),(4,'craft','m210724_180756_rename_source_cols','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','81a9b7e2-9255-4588-9ca5-64a802046eb4'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','975d3cf0-e499-47bf-a971-91c37c002309'),(6,'craft','m210817_014201_universal_users','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','37741ae8-a5b4-41c2-9f94-e3535e431cfd'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','fa44622a-6920-436f-b2f7-54435754c0e4'),(8,'craft','m211115_135500_image_transformers','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','60007fe0-4de2-4088-b4cf-5541d468f9c0'),(9,'craft','m211201_131000_filesystems','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','2e378d3c-7580-4665-aa55-1d0eaae4fccd'),(10,'craft','m220103_043103_tab_conditions','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','1e47372b-25f4-40bd-8da0-abb875073451'),(11,'craft','m220104_003433_asset_alt_text','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','d9e8c712-2460-4970-a659-ac806b644e71'),(12,'craft','m220123_213619_update_permissions','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','3ee30b5c-3e3b-4baa-b1c4-baa50bb73c6b'),(13,'craft','m220126_003432_addresses','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','295da07c-2aff-4f2e-ae3e-31f258a346dc'),(14,'craft','m220209_095604_add_indexes','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','84ca4a1a-307e-49fe-8925-131e3c3888bf'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','0f402d5d-d4cd-42d0-b20d-cf7e5bfeedbf'),(16,'craft','m220214_000000_truncate_sessions','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','01a9aafc-ecc5-44eb-80b9-75564c43a2be'),(17,'craft','m220222_122159_full_names','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','5e3f7922-980a-4f80-9891-e19b23a6b942'),(18,'craft','m220223_180559_nullable_address_owner','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','1356a3c8-e2ae-4e6d-b16f-257adead3699'),(19,'craft','m220225_165000_transform_filesystems','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','e139a042-106c-4518-9acc-1b4ed4252e88'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','e6e243dc-5360-4cbe-be1d-7a6176919b6e'),(21,'craft','m220314_211928_field_layout_element_uids','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','03110645-0946-4709-84d8-5b37905e7407'),(22,'craft','m220316_123800_transform_fs_subpath','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','017a5705-3dbb-4629-bd8c-2bc79ca372ed'),(23,'craft','m220317_174250_release_all_jobs','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','2b9439d1-c481-47ee-9b96-abd88bd6fcf5'),(24,'craft','m220330_150000_add_site_gql_schema_components','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','9a139dca-54f3-4e11-b498-35c1cded264b'),(25,'craft','m220413_024536_site_enabled_string','2022-11-09 01:55:11','2022-11-09 01:55:11','2022-11-09 01:55:11','d89ebfc0-7e2f-4403-b1f9-db44d8e36d02'),(26,'plugin:redactor','m180430_204710_remove_old_plugins','2022-11-09 01:57:07','2022-11-09 01:57:07','2022-11-09 01:57:07','4d41e1b4-e282-4ae2-804b-9cd547e479b7'),(27,'plugin:redactor','Install','2022-11-09 01:57:07','2022-11-09 01:57:07','2022-11-09 01:57:07','4034a26b-a095-450d-8708-55f6fd0821c2'),(28,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-11-09 01:57:07','2022-11-09 01:57:07','2022-11-09 01:57:07','f7732c8a-1812-4db0-85b0-afdbdd0f5244'),(31,'content','m221109_000001_create_sites','2022-11-09 03:59:10','2022-11-09 03:59:10','2022-11-09 03:59:10','78d09974-d21f-4ead-a002-1a4d6e92b143'),(32,'content','m221109_000002_copy_files','2022-11-09 04:04:02','2022-11-09 04:04:02','2022-11-09 04:04:02','faca6b23-7b6a-488b-a458-1ad9578634c9'),(33,'craft','m221027_160703_add_image_transform_fill','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','6d921350-74cb-42a7-9e8f-f16e8a99a750'),(34,'craft','m221028_130548_add_canonical_id_index','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','7fc96697-f109-4668-9907-f85cfd0302b8'),(35,'craft','m221118_003031_drop_element_fks','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','16bbb01a-965d-4270-b90e-8d1cd5a1579e'),(36,'craft','m230131_120713_asset_indexing_session_new_options','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','1b077a49-1548-4d36-b085-bca53878882a'),(37,'craft','m230226_013114_drop_plugin_license_columns','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','22cc700b-b262-4f35-9bc5-28a6d722ebc4'),(38,'craft','m230531_123004_add_entry_type_show_status_field','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','98c393fe-734d-4b6c-b292-ca4a6dabdf76'),(39,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','1aff0754-3400-4b07-b793-8c943357b6d0'),(40,'craft','m230710_162700_element_activity','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','5875ba05-ceb4-49f7-bd8c-b7ea0fc8492f'),(41,'craft','m230820_162023_fix_cache_id_type','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','1b9ff90e-ffc3-4419-8a91-11f4ae8dea9e'),(42,'craft','m230826_094050_fix_session_id_type','2023-11-08 12:02:24','2023-11-08 12:02:24','2023-11-08 12:02:24','d9810cd7-882b-4ee5-8c99-f9d7b369208a'),(43,'plugin:ckeditor','Install','2023-11-08 12:03:12','2023-11-08 12:03:12','2023-11-08 12:03:12','7f086271-5ad9-4376-927c-56535e0c2dbb'),(44,'plugin:ckeditor','m230408_163704_v3_upgrade','2023-11-08 12:03:12','2023-11-08 12:03:12','2023-11-08 12:03:12','3add311e-e6d1-41a0-a3c8-da96c07d57e7'),(45,'craft','m221101_115859_create_entries_authors_table','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','158cc997-b572-409c-9cc9-6e2a12905e92'),(46,'craft','m221107_112121_add_max_authors_to_sections','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','f6ba253c-01a3-4b95-ad37-f3136ef1613a'),(47,'craft','m221205_082005_translatable_asset_alt_text','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','d561b589-b66f-46bb-b377-3acadcc79216'),(48,'craft','m230314_110309_add_authenticator_table','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','46e70ded-6b29-4041-8a85-90c5132c0853'),(49,'craft','m230314_111234_add_webauthn_table','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','13519134-ecb7-4560-8e66-9f1fb2add758'),(50,'craft','m230503_120303_add_recoverycodes_table','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','36d3b24f-4103-4eb5-bfa2-8d4095cde67d'),(51,'craft','m230511_000000_field_layout_configs','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','f4fa87af-2363-406e-ae57-7e45f6a2de91'),(52,'craft','m230511_215903_content_refactor','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','e191efae-1924-4c7e-95c0-a33045cd6d84'),(53,'craft','m230524_000000_add_entry_type_show_slug_field','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','3403f4ec-a346-4519-b228-37c88ae4e9db'),(54,'craft','m230524_000001_entry_type_icons','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','d724c98d-30fe-44ff-b9e4-0c6183a36367'),(55,'craft','m230524_000002_entry_type_colors','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','737bc742-31d0-4159-a9ad-7de96eadbe04'),(56,'craft','m230524_220029_global_entry_types','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','711e20aa-a90f-4678-afee-5f36455c382c'),(57,'craft','m230616_173810_kill_field_groups','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','9ff1166b-b378-4d4d-a9d4-6233a19b1f82'),(58,'craft','m230616_183820_remove_field_name_limit','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','0552fab4-506c-4a23-a2a7-1a287c110af7'),(59,'craft','m230617_070415_entrify_matrix_blocks','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','039100b6-0834-44c0-837f-cfd98dbb371c'),(60,'craft','m230904_190356_address_fields','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','7c22d7c3-ac67-40c6-883c-2c31055d7828'),(61,'craft','m230928_144045_add_subpath_to_volumes','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','06d528d1-cc22-4f1b-aa36-e8acc5e9bb53'),(62,'craft','m231013_185640_changedfields_amend_primary_key','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','379a5fcf-9bb5-4dac-89c3-aa8288185c88'),(63,'craft','m231213_030600_element_bulk_ops','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','743d3b7a-dac6-49bd-9842-6009ba4f375a'),(64,'craft','m240129_150719_sites_language_amend_length','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','d8883bea-b76d-463a-af76-8141fc30800c'),(65,'craft','m240206_035135_convert_json_columns','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','b51e8f73-16d6-4ba3-92ff-6cc7b9133405'),(66,'craft','m240207_182452_address_line_3','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','0f0ce5b7-4697-4201-bc46-f481a8ebd103'),(67,'craft','m240302_212719_solo_preview_targets','2024-04-02 16:00:03','2024-04-02 16:00:03','2024-04-02 16:00:03','9e5a9a0c-19ef-44b6-af0d-3217af6885a0');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'dashboard-begone','3.0.0','1.0.0','2022-11-09 01:56:33','2022-11-09 01:56:33','2024-04-02 15:56:36','065535cc-a195-4a59-9584-acd0afbfd8a4'),(2,'redactor','3.0.4','2.3.0','2022-11-09 01:57:07','2022-11-09 01:57:07','2023-11-08 12:02:22','392c4d0c-c60f-45bd-815b-d617d8da4253'),(3,'mailgun','3.1.0','1.0.0','2022-11-09 01:57:24','2022-11-09 01:57:24','2024-04-02 15:54:31','d5b95be2-9213-4223-becc-2ddbf89dddca'),(4,'ckeditor','4.0.3','3.0.0.0','2023-11-08 12:03:12','2023-11-08 12:03:12','2024-04-02 15:56:36','97eb5f53-78fc-4c7b-a18b-db332c1224f1');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.0','1'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.1','2'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.2','3'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.3','4'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.4','5'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.headingLevels.5','6'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.listPlugin','\"List\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.name','\"Simple\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.toolbar.0','\"bold\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.toolbar.1','\"italic\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.toolbar.2','\"link\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.toolbar.3','\"|\"'),('ckeditor.configs.7210974a-b52d-4727-9ff5-3bb9053bd3a5.toolbar.4','\"sourceEditing\"'),('dateModified','1712073942'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.heading','\"Travel\"'),('elementSources.craft\\elements\\Entry.1.type','\"heading\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"section:d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.3.disabled','false'),('elementSources.craft\\elements\\Entry.3.key','\"section:65e19c67-6869-4b02-8f73-1faddec1820b\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.2','\"link\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('elementSources.craft\\elements\\Entry.4.heading','\"Food\"'),('elementSources.craft\\elements\\Entry.4.type','\"heading\"'),('elementSources.craft\\elements\\Entry.5.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.5.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.5.disabled','false'),('elementSources.craft\\elements\\Entry.5.key','\"section:2f9cfd47-380e-451a-8887-8e59dfed3d23\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.0','\"field:9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.1','\"field:ca33dcf3-3d91-40de-bf74-8143afdea7f8\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.2','\"field:94fcec23-115a-4bf5-8d3f-e54597736f24\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.5.type','\"native\"'),('elementSources.craft\\elements\\Entry.6.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.6.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.6.disabled','false'),('elementSources.craft\\elements\\Entry.6.key','\"section:4f4c5e55-bdb6-4b11-a80c-a707a67c93c8\"'),('elementSources.craft\\elements\\Entry.6.tableAttributes.0','\"field:9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('elementSources.craft\\elements\\Entry.6.tableAttributes.1','\"field:4455e8f9-3d20-4764-a87b-5177d121b07e\"'),('elementSources.craft\\elements\\Entry.6.type','\"native\"'),('elementSources.craft\\elements\\Entry.7.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.7.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.7.disabled','false'),('elementSources.craft\\elements\\Entry.7.key','\"section:842cdeba-cd27-4e0b-9de5-60ed051ee6bd\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.0','\"field:9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('elementSources.craft\\elements\\Entry.7.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.7.type','\"native\"'),('elementSources.craft\\elements\\Entry.8.condition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.0.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\SectionConditionRule\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.0.operator','\"in\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.0.uid','\"123480ac-e337-45d0-896a-d414b7cb93a2\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.0.values.0','\"2f9cfd47-380e-451a-8887-8e59dfed3d23\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.1.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.1.fieldUid','\"94fcec23-115a-4bf5-8d3f-e54597736f24\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.1.operator','\"in\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.1.uid','\"b0b6e39c-0ed5-4d03-8957-862b5f5ccd81\"'),('elementSources.craft\\elements\\Entry.8.condition.conditionRules.1.values.0','\"easy\"'),('elementSources.craft\\elements\\Entry.8.condition.elementType','\"craft\\\\elements\\\\Entry\"'),('elementSources.craft\\elements\\Entry.8.condition.fieldContext','\"global\"'),('elementSources.craft\\elements\\Entry.8.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.8.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.8.key','\"custom:71ca4f5a-a833-413b-accb-d03fe23c5d4f\"'),('elementSources.craft\\elements\\Entry.8.label','\"Easy Recipes\"'),('elementSources.craft\\elements\\Entry.8.tableAttributes.0','\"field:9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('elementSources.craft\\elements\\Entry.8.tableAttributes.1','\"field:94fcec23-115a-4bf5-8d3f-e54597736f24\"'),('elementSources.craft\\elements\\Entry.8.type','\"custom\"'),('email.fromEmail','\"info@putyourlightson.com\"'),('email.fromName','\"COS22\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.apiKey','\"$MAILGUN_API_KEY\"'),('email.transportSettings.domain','\"$MAILGUN_DOMAIN\"'),('email.transportSettings.endpoint','\"$MAILGUN_ENDPOINT\"'),('email.transportType','\"craft\\\\mailgun\\\\MailgunAdapter\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elementCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.autocomplete','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.autocorrect','true'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.class','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.disabled','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.elementCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.id','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.inputType','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.instructions','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.label','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.max','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.min','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.name','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.orientation','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.placeholder','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.readonly','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.requirable','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.size','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.step','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.tip','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.title','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.uid','\"b5fde786-34ca-42d1-ba97-f38842ff1c7b\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.userCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.warning','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.0.width','100'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.elementCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.fieldUid','\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.instructions','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.label','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.required','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.tip','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.uid','\"68ac6485-8fd6-43a4-95ab-856db69f7302\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.userCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.warning','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.1.width','100'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.elementCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.fieldUid','\"4455e8f9-3d20-4764-a87b-5177d121b07e\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.instructions','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.label','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.required','false'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.tip','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.uid','\"b354eb90-cb33-4cac-bb97-3d36e37ad629\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.userCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.warning','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.elements.2.width','100'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.name','\"Content\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.uid','\"224accbf-3cca-418d-aa29-0c687d64c134\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.fieldLayouts.c2f2eebe-5898-4db6-bc94-7f830f92797a.tabs.0.userCondition','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.handle','\"default\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.hasTitleField','true'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.name','\"Default\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.showStatusField','true'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.slugTranslationKeyFormat','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.slugTranslationMethod','\"site\"'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.sortOrder','1'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.titleFormat','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.titleTranslationKeyFormat','null'),('entryTypes.0ad8c9e9-84c2-4582-91e3-f726d2a16faf.titleTranslationMethod','\"site\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.color','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elementCondition','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.elementCondition','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.fieldUid','\"cdaa4293-0023-43e6-8f68-4f42d5f502b3\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.handle','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.includeInCards','true'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.instructions','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.label','\"Instruction Text\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.providesThumbs','false'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.required','false'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.tip','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.uid','\"b7c9a73b-103c-4809-9bf3-e07255f9cb01\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.userCondition','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.warning','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.elements.0.width','100'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.name','\"Content\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.uid','\"d1d47324-0ecc-48a3-bb71-aa3d4660b937\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.fieldLayouts.4872b36a-47a3-49b0-b73f-444d2adb799a.tabs.0.userCondition','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.handle','\"step\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.hasTitleField','false'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.icon','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.name','\"Step\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.showSlugField','true'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.showStatusField','true'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.slugTranslationKeyFormat','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.slugTranslationMethod','\"site\"'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.titleFormat','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.titleTranslationKeyFormat','null'),('entryTypes.2ff70388-58ff-42cc-b63c-8b6a921ff80a.titleTranslationMethod','\"site\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.color','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elementCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.elementCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.fieldUid','\"c468e7d7-2de4-4f6e-9a17-a3f6b7db6201\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.handle','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.includeInCards','true'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.instructions','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.label','\"Amount\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.providesThumbs','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.required','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.tip','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.uid','\"32fd2e9a-00c0-4af0-9375-1f7c17d98e7a\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.userCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.warning','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.0.width','100'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.elementCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.fieldUid','\"85a72c78-c803-474c-84f0-fdc1af1facd0\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.handle','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.includeInCards','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.instructions','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.label','\"Unit\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.providesThumbs','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.required','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.tip','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.uid','\"b711e58d-36da-42b1-95e0-f378fc9f3c15\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.userCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.warning','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.1.width','100'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.elementCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.fieldUid','\"3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.handle','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.includeInCards','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.instructions','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.label','\"Ingredient\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.providesThumbs','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.required','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.tip','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.uid','\"50d40cc6-b13d-4e77-909f-a030c360f6af\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.userCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.warning','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.2.width','100'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.elementCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.fieldUid','\"d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.handle','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.includeInCards','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.instructions','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.label','\"Optional\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.providesThumbs','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.required','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.tip','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.uid','\"c42c4455-0726-4f91-a9dd-57883ac41781\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.userCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.warning','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.elements.3.width','100'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.name','\"Content\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.uid','\"8b1e2702-abce-4b2c-b692-58a2812a05fa\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.fieldLayouts.4ff942a1-a358-4d9f-b7ea-953cbbfcd796.tabs.0.userCondition','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.handle','\"ingredient\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.hasTitleField','false'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.icon','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.name','\"Ingredient\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.showSlugField','true'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.showStatusField','true'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.slugTranslationKeyFormat','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.slugTranslationMethod','\"site\"'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.titleFormat','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.titleTranslationKeyFormat','null'),('entryTypes.350d3b36-f9ac-4a5c-9324-598b3fc4d31f.titleTranslationMethod','\"site\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elementCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.autocomplete','false'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.autocorrect','true'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.class','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.disabled','false'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.elementCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.id','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.inputType','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.instructions','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.label','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.max','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.min','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.name','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.orientation','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.placeholder','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.readonly','false'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.requirable','false'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.size','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.step','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.tip','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.title','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.uid','\"15ce498b-c14b-4a26-9df2-84f0fb959c81\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.userCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.warning','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.0.width','100'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.elementCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.fieldUid','\"055364d9-1405-4285-b2ea-2c1258fb8586\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.instructions','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.label','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.required','false'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.tip','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.uid','\"61d0e030-454e-45da-b305-c47d1d8acbc0\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.userCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.warning','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.elements.1.width','100'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.name','\"Content\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.uid','\"0b87a8ec-712a-4125-b497-e0f93b7c3cb9\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.fieldLayouts.2d1c6228-938f-4073-a68f-ab5bde31672a.tabs.0.userCondition','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.handle','\"countries_default\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.hasTitleField','true'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.name','\"Countries - Default\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.showStatusField','true'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.slugTranslationKeyFormat','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.slugTranslationMethod','\"site\"'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.sortOrder','1'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.titleFormat','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.titleTranslationKeyFormat','null'),('entryTypes.65a39f0b-19b3-4457-b8da-8bd66251a3b9.titleTranslationMethod','\"site\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elementCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.autocomplete','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.autocorrect','true'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.class','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.disabled','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.elementCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.id','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.inputType','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.instructions','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.label','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.max','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.min','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.name','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.orientation','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.placeholder','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.readonly','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.requirable','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.size','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.step','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.tip','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.title','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.uid','\"0dea6460-8e88-4f92-bfcd-c47dbded964e\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.userCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.warning','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.0.width','100'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.elementCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.fieldUid','\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.instructions','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.label','\"Icon\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.required','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.tip','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.uid','\"7ed4b740-164d-438a-a1dc-3943ce2a3161\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.userCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.warning','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.1.width','100'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.elementCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.fieldUid','\"4455e8f9-3d20-4764-a87b-5177d121b07e\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.instructions','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.label','\"Description\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.required','false'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.tip','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.uid','\"efa13d8e-1daa-4762-9330-fb054c554447\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.userCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.warning','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.elements.2.width','100'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.name','\"Content\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.uid','\"3fc59463-95a7-4791-9a31-a49c404793cf\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.fieldLayouts.85693f11-7ff0-4592-af59-550353e07dc5.tabs.0.userCondition','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.handle','\"dietaryPreferences_default\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.hasTitleField','true'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.name','\"Dietary Preferences - Default\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.showStatusField','true'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.slugTranslationKeyFormat','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.slugTranslationMethod','\"site\"'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.sortOrder','1'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.titleFormat','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.titleTranslationKeyFormat','null'),('entryTypes.7d0487ea-cc61-4615-bbec-1d35fb6e0129.titleTranslationMethod','\"site\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.autocapitalize','true'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.autocomplete','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.autocorrect','true'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.class','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.disabled','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.id','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.inputType','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.max','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.min','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.name','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.orientation','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.placeholder','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.readonly','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.requirable','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.size','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.step','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.title','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.uid','\"32b7d732-cf22-4430-961f-248e20858c93\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.0.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.fieldUid','\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.uid','\"cf0d203a-e81d-4653-8832-1de07656a22c\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.1.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.fieldUid','\"15b6744c-b46d-4988-91ba-602d720d8ff4\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.uid','\"d78b6f84-552d-4a19-a76e-a8de4c90ef82\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.2.width','50'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.fieldUid','\"ce104f24-5b45-4226-be21-a252a37927e2\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.uid','\"064ef110-5cb9-4a5a-95d6-9feeff624d33\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.3.width','50'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.fieldUid','\"0993baf9-ae54-4148-9bd7-d1e26ab888fc\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.uid','\"aa401446-0d96-4226-8bce-2cea143af5c6\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.4.width','50'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.fieldUid','\"94fcec23-115a-4bf5-8d3f-e54597736f24\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.uid','\"6a59d4ac-5225-4a8f-a600-3f33f9a736b7\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.5.width','50'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.fieldUid','\"4455e8f9-3d20-4764-a87b-5177d121b07e\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.uid','\"95896741-273b-4938-be6c-b8ba02b1019b\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.6.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.fieldUid','\"ca33dcf3-3d91-40de-bf74-8143afdea7f8\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.uid','\"70938fcf-f748-4ef1-a17e-219e7ea9e026\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.7.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.fieldUid','\"f387678b-4bf0-44d0-9c69-1d60c3f3f47f\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.uid','\"353f9550-2f13-4d3d-a7d1-b41d27546a1a\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.8.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.elementCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.fieldUid','\"d727ec15-9e7c-41dd-b0fd-d03c85fb0716\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.instructions','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.label','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.required','false'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.tip','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.uid','\"a0e21654-a20e-4cf6-9303-630c99a1244b\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.warning','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.elements.9.width','100'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.name','\"Content\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.uid','\"ca0537d2-feee-4813-a7b3-c8a7b9a94db9\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.fieldLayouts.57b61060-1836-4296-81e7-9c1ec8126312.tabs.0.userCondition','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.handle','\"recipes_default\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.hasTitleField','true'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.name','\"Recipes - Default\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.showStatusField','true'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.slugTranslationKeyFormat','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.slugTranslationMethod','\"site\"'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.sortOrder','1'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.titleFormat','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.titleTranslationKeyFormat','null'),('entryTypes.8343f4ab-c5bd-42a0-a37e-3c58121f759a.titleTranslationMethod','\"site\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.dismissible','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.style','\"tip\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.tip','\"A trip represents series of countries I’d like to visit.\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\Tip\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.uid','\"17de7a93-8504-4afa-8323-5093ecf70040\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.0.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.autocapitalize','true'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.autocomplete','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.autocorrect','true'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.class','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.disabled','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.id','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.inputType','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.instructions','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.label','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.max','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.min','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.name','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.orientation','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.placeholder','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.readonly','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.requirable','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.size','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.step','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.tip','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.title','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.uid','\"6481d120-bd0c-4523-a83f-601ff7a43623\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.warning','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.1.width','100'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.fieldUid','\"9607b25c-41e6-49ee-92f6-4f598d9bb638\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.instructions','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.label','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.required','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.tip','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.uid','\"883ad9a4-3e2e-4da4-bdb0-cb03bba64c66\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.warning','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.2.width','100'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.fieldUid','\"d603abda-1959-4187-a2c1-1b5057ab327b\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.instructions','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.label','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.required','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.tip','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.uid','\"f41b0741-e8cd-41f7-ad1e-06bdd43db253\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.warning','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.3.width','100'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.elementCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.fieldUid','\"4455e8f9-3d20-4764-a87b-5177d121b07e\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.instructions','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.label','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.required','false'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.tip','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.uid','\"5256708c-b416-44ef-9370-6e0979e4e43f\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.warning','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.elements.4.width','100'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.name','\"Content\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.uid','\"ce6cc63b-457e-4196-b301-26402494461e\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.fieldLayouts.013a6d5b-cb96-457b-9e36-985e7a0dad34.tabs.0.userCondition','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.handle','\"trips_default\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.hasTitleField','true'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.name','\"Trips - Default\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.showStatusField','true'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.slugTranslationKeyFormat','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.slugTranslationMethod','\"site\"'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.sortOrder','1'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.titleFormat','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.titleTranslationKeyFormat','null'),('entryTypes.87d4c11a-4922-4878-a4fc-b45e075a4066.titleTranslationMethod','\"site\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.columnSuffix','\"zawcgefj\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.contentColumnType','\"text\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.handle','\"languageToLearn\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.instructions','\"Speaking a few words in the local language is part of the experience!\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.name','\"Language To Learn\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.searchable','false'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.byteLimit','null'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.charLimit','null'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.code','false'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.columnType','null'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.initialRows','4'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.multiline','false'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.placeholder','null'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.settings.uiMode','\"normal\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.translationKeyFormat','null'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.translationMethod','\"none\"'),('fields.055364d9-1405-4285-b2ea-2c1258fb8586.type','\"craft\\\\fields\\\\PlainText\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.columnSuffix','\"pjqnujfz\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.contentColumnType','\"integer(10)\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.handle','\"numberOfServings\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.instructions','\"The number of people this recipe serves.\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.name','\"Number of Servings\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.searchable','false'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.decimals','0'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.defaultValue','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.max','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.min','0'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.prefix','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.previewCurrency','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.previewFormat','\"decimal\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.size','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.settings.suffix','\"servings\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.translationKeyFormat','null'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.translationMethod','\"none\"'),('fields.0993baf9-ae54-4148-9bd7-d1e26ab888fc.type','\"craft\\\\fields\\\\Number\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.columnSuffix','\"brpygnsi\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.contentColumnType','\"integer(10)\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.handle','\"preparationTime\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.instructions','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.name','\"Preparation Time\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.searchable','false'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.decimals','0'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.defaultValue','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.max','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.min','0'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.prefix','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.previewCurrency','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.previewFormat','\"decimal\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.size','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.settings.suffix','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.translationKeyFormat','null'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.translationMethod','\"none\"'),('fields.15b6744c-b46d-4988-91ba-602d720d8ff4.type','\"craft\\\\fields\\\\Number\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.columnSuffix','\"wbpwyepw\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.contentColumnType','\"boolean\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.handle','\"suitableForChildren\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.instructions','\"Whether this recipe is suitable for preparing with children.\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.name','\"Suitable for Children\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.searchable','false'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.settings.default','false'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.settings.offLabel','null'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.settings.onLabel','null'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.translationKeyFormat','null'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.translationMethod','\"none\"'),('fields.1c18b349-157b-4305-9f43-5809f4ebb583.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.columnSuffix','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.handle','\"ingredient\"'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.instructions','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.name','\"Recipe Ingredients - Ingredient - Ingredient\"'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.searchable','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.allowSelfRelations','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.branchLimit','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.localizeRelations','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.maintainHierarchy','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.maxRelations','1'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.minRelations','1'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.selectionLabel','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.showCardsInGrid','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.showSiteMenu','true'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.sources.0','\"section:842cdeba-cd27-4e0b-9de5-60ed051ee6bd\"'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.targetSiteId','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.validateRelatedElements','false'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.settings.viewMode','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.translationKeyFormat','null'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.translationMethod','\"site\"'),('fields.3831c4c6-1e3f-42ff-99f7-5e4eed6b7ae3.type','\"craft\\\\fields\\\\Entries\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.columnSuffix','\"qsbpsoen\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.contentColumnType','\"text\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.handle','\"summary\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.instructions','null'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.name','\"Summary\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.searchable','false'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.availableTransforms','\"\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.availableVolumes','\"*\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.ckeConfig','\"7210974a-b52d-4727-9ff5-3bb9053bd3a5\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.columnType','\"text\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.defaultTransform','null'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.enableSourceEditingForNonAdmins','false'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.purifierConfig','null'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.purifyHtml','true'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.showUnpermittedFiles','false'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.showUnpermittedVolumes','false'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.showWordCount','false'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.settings.wordLimit','null'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.translationKeyFormat','null'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.translationMethod','\"none\"'),('fields.4455e8f9-3d20-4764-a87b-5177d121b07e.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.columnSuffix','\"avvrcadt\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.handle','\"unit\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.instructions','null'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.name','\"Recipe Ingredients - Ingredient - Unit\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.searchable','false'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.0.0','\"label\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.0.1','\"Single\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.1.0','\"value\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.1.1','\"single\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.2.0','\"default\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.0.__assoc__.2.1','\"\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.0.0','\"label\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.0.1','\"Grams\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.1.0','\"value\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.1.1','\"grams\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.2.0','\"default\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.1.__assoc__.2.1','\"\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.0.0','\"label\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.0.1','\"Tablespoons\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.1.0','\"value\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.1.1','\"tablespoons\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.2.0','\"default\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.2.__assoc__.2.1','\"\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.0.0','\"label\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.0.1','\"Teaspoons\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.1.0','\"value\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.1.1','\"teaspoons\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.2.0','\"default\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.settings.options.3.__assoc__.2.1','\"\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.translationKeyFormat','null'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.translationMethod','\"none\"'),('fields.85a72c78-c803-474c-84f0-fdc1af1facd0.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.columnSuffix','\"yxrtmvkq\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.contentColumnType','\"string(9)\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.handle','\"levelOfDifficulty\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.instructions','null'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.name','\"Level of Difficulty\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.searchable','false'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.columnType','null'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.0.0','\"label\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.0.1','\"Easy\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.1.0','\"value\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.1.1','\"easy\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.2.0','\"default\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.0.__assoc__.2.1','\"\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.0.0','\"label\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.0.1','\"Medium\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.1.0','\"value\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.1.1','\"medium\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.2.0','\"default\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.1.__assoc__.2.1','\"1\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.0.0','\"label\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.0.1','\"Difficult\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.1.0','\"value\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.1.1','\"difficult\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.2.0','\"default\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.settings.options.2.__assoc__.2.1','\"\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.translationKeyFormat','null'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.translationMethod','\"none\"'),('fields.94fcec23-115a-4bf5-8d3f-e54597736f24.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.columnSuffix','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.contentColumnType','\"string\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.handle','\"image\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.instructions','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.name','\"Image\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.searchable','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.allowedKinds.0','\"image\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.allowSelfRelations','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.allowSubfolders','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.allowUploads','true'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.branchLimit','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.defaultUploadLocationSource','\"volume:5e23629a-bc17-41b0-b9b7-8afe3687d8d4\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.defaultUploadLocationSubpath','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.localizeRelations','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.maintainHierarchy','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.maxRelations','1'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.minRelations','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.previewMode','\"full\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.restrictedDefaultUploadSubpath','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.restrictedLocationSource','\"volume:5e23629a-bc17-41b0-b9b7-8afe3687d8d4\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.restrictedLocationSubpath','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.restrictFiles','true'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.restrictLocation','true'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.selectionLabel','\"Add an image\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.showSiteMenu','true'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.showUnpermittedFiles','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.showUnpermittedVolumes','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.sources','\"*\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.targetSiteId','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.validateRelatedElements','false'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.settings.viewMode','\"list\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.translationKeyFormat','null'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.translationMethod','\"site\"'),('fields.9607b25c-41e6-49ee-92f6-4f598d9bb638.type','\"craft\\\\fields\\\\Assets\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.columnSuffix','\"agrmetjb\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.handle','\"amount\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.instructions','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.name','\"Recipe Ingredients - Ingredient - Amount\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.searchable','false'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.decimals','0'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.defaultValue','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.max','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.min','0'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.prefix','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.previewCurrency','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.previewFormat','\"decimal\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.size','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.settings.suffix','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.translationKeyFormat','null'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.translationMethod','\"none\"'),('fields.c468e7d7-2de4-4f6e-9a17-a3f6b7db6201.type','\"craft\\\\fields\\\\Number\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.columnSuffix','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.contentColumnType','\"string\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.handle','\"dietaryPreferences\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.instructions','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.name','\"Dietary Preferences\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.searchable','false'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.allowSelfRelations','false'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.branchLimit','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.localizeRelations','false'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.maintainHierarchy','false'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.maxRelations','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.minRelations','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.selectionLabel','\"Add a dietary preference\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.showSiteMenu','true'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.sources.0','\"section:4f4c5e55-bdb6-4b11-a80c-a707a67c93c8\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.targetSiteId','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.validateRelatedElements','false'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.settings.viewMode','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.translationKeyFormat','null'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.translationMethod','\"site\"'),('fields.ca33dcf3-3d91-40de-bf74-8143afdea7f8.type','\"craft\\\\fields\\\\Entries\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.columnSuffix','\"utyfynxo\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.handle','\"instructionText\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.instructions','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.name','\"Instruction Steps - Step - Instruction Text\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.searchable','false'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.availableTransforms','\"\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.availableVolumes','\"*\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.ckeConfig','\"7210974a-b52d-4727-9ff5-3bb9053bd3a5\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.createButtonLabel','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.defaultTransform','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.enableSourceEditingForNonAdmins','false'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.purifierConfig','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.purifyHtml','true'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.showUnpermittedFiles','false'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.showUnpermittedVolumes','false'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.showWordCount','false'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.settings.wordLimit','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.translationKeyFormat','null'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.translationMethod','\"none\"'),('fields.cdaa4293-0023-43e6-8f68-4f42d5f502b3.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.columnSuffix','\"pjurfwul\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.contentColumnType','\"string(7)\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.handle','\"preparationTimeUnits\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.instructions','null'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.name','\"Preparation Time Units\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.searchable','false'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.columnType','null'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.0.0','\"label\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.0.1','\"Minutes\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.1.0','\"value\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.1.1','\"minutes\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.2.0','\"default\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.0.__assoc__.2.1','\"1\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.0.0','\"label\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.0.1','\"Hours\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.1.0','\"value\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.1.1','\"hours\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.2.0','\"default\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.1.__assoc__.2.1','\"\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.0.0','\"label\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.0.1','\"Days\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.1.0','\"value\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.1.1','\"days\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.2.0','\"default\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.settings.options.2.__assoc__.2.1','\"\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.translationKeyFormat','null'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.translationMethod','\"none\"'),('fields.ce104f24-5b45-4226-be21-a252a37927e2.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.columnSuffix','\"apfpjfko\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.handle','\"optional\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.instructions','\"Whether this is an optional ingredient in the recipe.\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.name','\"Recipe Ingredients - Ingredient - Optional\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.searchable','false'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.settings.default','false'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.settings.offLabel','null'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.settings.onLabel','null'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.translationKeyFormat','null'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.translationMethod','\"none\"'),('fields.d2718b8a-1bf7-4c78-8ed1-bd2d973a6e61.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.columnSuffix','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.contentColumnType','\"string\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.handle','\"countries\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.instructions','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.name','\"Countries\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.searchable','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.allowSelfRelations','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.branchLimit','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.localizeRelations','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.maintainHierarchy','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.maxRelations','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.minRelations','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.selectionLabel','\"Add a country\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.showSiteMenu','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.sources.0','\"section:65e19c67-6869-4b02-8f73-1faddec1820b\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.targetSiteId','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.validateRelatedElements','false'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.settings.viewMode','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.translationKeyFormat','null'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.translationMethod','\"site\"'),('fields.d603abda-1959-4187-a2c1-1b5057ab327b.type','\"craft\\\\fields\\\\Entries\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.columnSuffix','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.handle','\"instructionSteps\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.instructions','\"Add one instructions step per block.\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.name','\"Instruction Steps\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.searchable','false'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.createButtonLabel','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.entryTypes.0','\"2ff70388-58ff-42cc-b63c-8b6a921ff80a\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.includeTableView','false'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.maxEntries','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.minEntries','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.pageSize','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.propagationKeyFormat','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.propagationMethod','\"all\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.showCardsInGrid','false'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.settings.viewMode','\"blocks\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.translationKeyFormat','null'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.translationMethod','\"site\"'),('fields.d727ec15-9e7c-41dd-b0fd-d03c85fb0716.type','\"craft\\\\fields\\\\Matrix\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.columnSuffix','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.contentColumnType','\"string\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.handle','\"recipeIngredients\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.instructions','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.name','\"Recipe Ingredients\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.searchable','false'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.entryTypes.0','\"350d3b36-f9ac-4a5c-9324-598b3fc4d31f\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.maxEntries','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.minEntries','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.propagationKeyFormat','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.propagationMethod','\"all\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.settings.viewMode','\"blocks\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.translationKeyFormat','null'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.translationMethod','\"site\"'),('fields.f387678b-4bf0-44d0-9c69-1d60c3f3f47f.type','\"craft\\\\fields\\\\Matrix\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/assets/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"@web/assets/images\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.055364d9-1405-4285-b2ea-2c1258fb8586','\"Language To Learn\"'),('meta.__names__.0993baf9-ae54-4148-9bd7-d1e26ab888fc','\"Number of Servings\"'),('meta.__names__.0ad8c9e9-84c2-4582-91e3-f726d2a16faf','\"Default\"'),('meta.__names__.15b6744c-b46d-4988-91ba-602d720d8ff4','\"Preparation Time\"'),('meta.__names__.1c18b349-157b-4305-9f43-5809f4ebb583','\"Suitable for Children\"'),('meta.__names__.2f9cfd47-380e-451a-8887-8e59dfed3d23','\"Recipes\"'),('meta.__names__.4455e8f9-3d20-4764-a87b-5177d121b07e','\"Summary\"'),('meta.__names__.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8','\"Dietary Preferences\"'),('meta.__names__.5e23629a-bc17-41b0-b9b7-8afe3687d8d4','\"Images\"'),('meta.__names__.658815bf-b62b-4167-b965-8343a311b9f3','\"COS\"'),('meta.__names__.65a39f0b-19b3-4457-b8da-8bd66251a3b9','\"Countries - Default\"'),('meta.__names__.65e19c67-6869-4b02-8f73-1faddec1820b','\"Countries\"'),('meta.__names__.6e92a5b7-6be7-4569-b58a-4e3691f067f8','\"COS\"'),('meta.__names__.7210974a-b52d-4727-9ff5-3bb9053bd3a5','\"Simple\"'),('meta.__names__.7d0487ea-cc61-4615-bbec-1d35fb6e0129','\"Dietary Preferences - Default\"'),('meta.__names__.8343f4ab-c5bd-42a0-a37e-3c58121f759a','\"Recipes - Default\"'),('meta.__names__.842cdeba-cd27-4e0b-9de5-60ed051ee6bd','\"Ingredients\"'),('meta.__names__.87d4c11a-4922-4878-a4fc-b45e075a4066','\"Trips - Default\"'),('meta.__names__.94fcec23-115a-4bf5-8d3f-e54597736f24','\"Level of Difficulty\"'),('meta.__names__.9607b25c-41e6-49ee-92f6-4f598d9bb638','\"Image\"'),('meta.__names__.ca33dcf3-3d91-40de-bf74-8143afdea7f8','\"Dietary Preferences\"'),('meta.__names__.ce104f24-5b45-4226-be21-a252a37927e2','\"Preparation Time Units\"'),('meta.__names__.d603abda-1959-4187-a2c1-1b5057ab327b','\"Countries\"'),('meta.__names__.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b','\"Trips\"'),('meta.__names__.d727ec15-9e7c-41dd-b0fd-d03c85fb0716','\"Instruction Steps\"'),('meta.__names__.f387678b-4bf0-44d0-9c69-1d60c3f3f47f','\"Recipe Ingredients\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.dashboard-begone.edition','\"standard\"'),('plugins.dashboard-begone.enabled','true'),('plugins.dashboard-begone.schemaVersion','\"1.0.0\"'),('plugins.mailgun.edition','\"standard\"'),('plugins.mailgun.enabled','true'),('plugins.mailgun.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.defaultPlacement','\"end\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.enableVersioning','true'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.entryTypes.0','\"8343f4ab-c5bd-42a0-a37e-3c58121f759a\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.handle','\"recipes\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.maxAuthors','1'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.name','\"Recipes\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.propagationMethod','\"all\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.enabledByDefault','true'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','true'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.template','\"recipe.twig\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.uriFormat','\"recipes/{slug}\"'),('sections.2f9cfd47-380e-451a-8887-8e59dfed3d23.type','\"channel\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.defaultPlacement','\"end\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.enableVersioning','true'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.entryTypes.0','\"7d0487ea-cc61-4615-bbec-1d35fb6e0129\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.handle','\"dietaryPreferences\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.name','\"Dietary Preferences\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.propagationMethod','\"all\"'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.enabledByDefault','true'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','false'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.template','null'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.uriFormat','null'),('sections.4f4c5e55-bdb6-4b11-a80c-a707a67c93c8.type','\"channel\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.defaultPlacement','\"end\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.enableVersioning','true'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.entryTypes.0','\"65a39f0b-19b3-4457-b8da-8bd66251a3b9\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.handle','\"countries\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.name','\"Countries\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.propagationMethod','\"all\"'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.enabledByDefault','true'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','false'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.template','null'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.uriFormat','null'),('sections.65e19c67-6869-4b02-8f73-1faddec1820b.type','\"channel\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.defaultPlacement','\"end\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.enableVersioning','true'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.entryTypes.0','\"0ad8c9e9-84c2-4582-91e3-f726d2a16faf\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.handle','\"ingredients\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.name','\"Ingredients\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.propagationMethod','\"all\"'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.enabledByDefault','true'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','false'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.template','null'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.uriFormat','null'),('sections.842cdeba-cd27-4e0b-9de5-60ed051ee6bd.type','\"channel\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.defaultPlacement','\"end\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.enableVersioning','true'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.entryTypes.0','\"87d4c11a-4922-4878-a4fc-b45e075a4066\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.handle','\"trips\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.maxAuthors','1'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.name','\"Trips\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.propagationMethod','\"all\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.enabledByDefault','true'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','true'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.template','\"trip.twig\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.siteSettings.658815bf-b62b-4167-b965-8343a311b9f3.uriFormat','\"trips/{slug}\"'),('sections.d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b.type','\"channel\"'),('siteGroups.6e92a5b7-6be7-4569-b58a-4e3691f067f8.name','\"COS\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.enabled','true'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.handle','\"cos\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.hasUrls','true'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.language','\"en-GB\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.name','\"COS\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.primary','true'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.siteGroup','\"6e92a5b7-6be7-4569-b58a-4e3691f067f8\"'),('sites.658815bf-b62b-4167-b965-8343a311b9f3.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"COS23\"'),('system.retryDuration','null'),('system.schemaVersion','\"5.0.0.20\"'),('system.timeZone','\"Europe/Vienna\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elementCondition','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.autocapitalize','true'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.autocomplete','false'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.autocorrect','true'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.class','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.disabled','false'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.elementCondition','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.id','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.inputType','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.instructions','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.label','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.max','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.min','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.name','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.orientation','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.placeholder','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.readonly','false'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.requirable','false'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.size','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.step','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.tip','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.title','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.uid','\"06beb3f4-8078-45bc-82ad-4d953c50a945\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.userCondition','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.warning','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.elements.0.width','100'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.name','\"Content\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.uid','\"8c6ee6fa-fe76-4c10-bcf6-4477ad012ed4\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fieldLayouts.69097259-d1e1-46f0-a143-b642d3254ca6.tabs.0.userCondition','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.fs','\"images\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.handle','\"images\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.name','\"Images\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.sortOrder','1'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.titleTranslationKeyFormat','null'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.titleTranslationMethod','\"site\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.transformFs','\"\"'),('volumes.5e23629a-bc17-41b0-b9b7-8afe3687d8d4.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,1,10,NULL,6,2,'2022-11-09 02:02:52','2023-11-08 18:39:48','6badcb1a-be1c-4834-bf85-3bb2d723380b'),(3,1,10,NULL,2,1,'2022-11-09 02:02:52','2023-11-08 18:39:48','a47b2393-8236-4cc8-b419-4979e9c0c4db'),(4,1,11,NULL,4,1,'2022-11-09 02:03:05','2022-11-09 02:03:05','8745a85c-b996-42fa-ad9a-d5eae75e1e5c'),(5,1,11,NULL,2,2,'2022-11-09 02:03:05','2022-11-09 02:03:05','c59c97a2-4950-4c79-85e8-1b14e9a2fa18'),(6,1,11,NULL,6,3,'2022-11-09 02:03:05','2022-11-09 02:03:05','c9444b8b-35cf-4bdb-8dfe-53596e95040b'),(11,3,10,NULL,12,1,'2022-11-09 02:09:00','2022-11-09 02:09:00','c003bd31-3519-4f7f-ba98-256ffd27cf0c'),(12,3,14,NULL,12,1,'2022-11-09 02:09:00','2022-11-09 02:09:00','9860671c-bef1-4fdb-b872-09a99d79bbcd'),(13,1,14,NULL,4,1,'2022-11-09 02:09:00','2022-11-09 02:09:00','e4b739f2-cf1a-4983-9eef-d38d1f46b837'),(14,1,14,NULL,2,2,'2022-11-09 02:09:00','2022-11-09 02:09:00','e48d763f-5dfb-458f-a6e8-c1671768336a'),(15,1,14,NULL,6,3,'2022-11-09 02:09:00','2022-11-09 02:09:00','9f9a205d-17ce-4e44-8fea-d95feae5a899'),(20,3,16,NULL,12,1,'2022-11-09 15:44:25','2022-11-09 15:44:25','9f86ef7f-2791-4446-abfb-5344697e46b1'),(21,1,16,NULL,4,1,'2022-11-09 15:44:25','2022-11-09 15:44:25','7f57e495-179e-4453-835f-6c54de65bb7e'),(22,1,16,NULL,2,2,'2022-11-09 15:44:25','2022-11-09 15:44:25','faedeb49-a626-4f50-bde4-6cabcd16e97f'),(23,1,16,NULL,6,3,'2022-11-09 15:44:25','2022-11-09 15:44:25','cd1927a9-3432-4e97-a8a1-f3415a559183'),(28,3,18,NULL,12,1,'2022-11-09 15:44:51','2022-11-09 15:44:51','4588d87a-b390-4b4a-becf-b97de6c2cfeb'),(29,1,18,NULL,4,1,'2022-11-09 15:44:51','2022-11-09 15:44:51','7419f7d6-5d9e-43c6-a3b7-aa03f9cdae7f'),(30,1,18,NULL,2,2,'2022-11-09 15:44:51','2022-11-09 15:44:51','cda505e6-d31b-483b-b6a7-7539013c2bc7'),(31,1,18,NULL,6,3,'2022-11-09 15:44:51','2022-11-09 15:44:51','c34c7913-369b-45d6-ba2b-dab7b5b4a438'),(36,3,20,NULL,12,1,'2023-11-08 12:14:09','2023-11-08 12:14:09','df0f5a6a-342f-4913-ae1c-fd08c06d92fd'),(37,1,20,NULL,4,1,'2023-11-08 12:14:09','2023-11-08 12:14:09','41fb9e1d-c039-41e6-badd-b07cd90e20e3'),(38,1,20,NULL,2,2,'2023-11-08 12:14:09','2023-11-08 12:14:09','7847072c-0396-4a99-ab2e-0328807544f8'),(39,1,20,NULL,6,3,'2023-11-08 12:14:09','2023-11-08 12:14:09','18967e33-fabb-432e-baf7-9525eccfcdef'),(45,3,25,NULL,12,1,'2023-11-08 18:39:48','2023-11-08 18:39:48','72ecfd7a-edb6-4f75-8b0c-64ba9092d2c1'),(46,1,25,NULL,2,1,'2023-11-08 18:39:48','2023-11-08 18:39:48','7f5aeb19-50c8-4409-898a-ff684f6040db'),(47,1,25,NULL,6,2,'2023-11-08 18:39:48','2023-11-08 18:39:48','ab5e109d-4714-4994-93c3-16665fb5389b'),(48,3,26,NULL,12,1,'2023-11-08 18:39:56','2023-11-08 18:39:56','707a201b-2b51-4f69-aa0a-5c110c6e71d6'),(49,1,26,NULL,2,1,'2023-11-08 18:39:56','2023-11-08 18:39:56','17110075-d9eb-43fa-90e3-e8b2f428a245'),(50,1,26,NULL,6,2,'2023-11-08 18:39:56','2023-11-08 18:39:56','7e73b45d-c922-473a-9c8a-781f746774a6'),(54,3,28,NULL,12,1,'2023-11-08 18:41:24','2023-11-08 18:41:24','f5533368-6105-4787-9515-d15cbca187b2'),(55,1,28,NULL,2,1,'2023-11-08 18:41:24','2023-11-08 18:41:24','4c86781c-14c9-4737-bf84-0d529f54f732'),(56,1,28,NULL,6,2,'2023-11-08 18:41:24','2023-11-08 18:41:24','9a39e16a-6444-492c-ad8a-b8d4b9dc843d'),(60,3,30,NULL,12,1,'2023-11-08 18:41:51','2023-11-08 18:41:51','97cfb1bf-8ce9-4319-80bf-008a63e0ca7d'),(61,1,30,NULL,2,1,'2023-11-08 18:41:51','2023-11-08 18:41:51','a9f18a3b-6f13-47da-9134-02ae3549f2ef'),(62,1,30,NULL,6,2,'2023-11-08 18:41:51','2023-11-08 18:41:51','c133ece4-64c8-4ac9-978c-c8ab0173df35'),(67,8,31,NULL,40,1,'2023-12-21 16:46:09','2023-12-21 16:46:09','15b35ddb-012f-4460-b8d1-e1de871ec561'),(68,8,31,NULL,42,2,'2023-12-21 16:46:09','2023-12-21 16:46:09','238309e4-551e-4ba1-99ff-4d63bef64543'),(69,11,54,NULL,51,1,'2023-12-21 16:46:09','2023-12-21 16:46:09','56530b65-7684-4f91-8803-e652cebf5f90'),(70,8,55,NULL,40,1,'2023-12-21 16:46:09','2023-12-21 16:46:09','196f8606-66cf-4705-aa38-7ef809554d0a'),(71,8,55,NULL,42,2,'2023-12-21 16:46:09','2023-12-21 16:46:09','bf3890e6-0353-4271-8ce9-380ecf90ca19'),(72,11,56,NULL,51,1,'2023-12-21 16:46:09','2023-12-21 16:46:09','0c0b29dc-f058-4951-a056-80be630188e4'),(76,8,59,NULL,40,1,'2023-12-21 16:47:55','2023-12-21 16:47:55','361ff9c7-4b5e-4120-a05e-0a944066e000'),(77,8,59,NULL,42,2,'2023-12-21 16:47:55','2023-12-21 16:47:55','ee4abbe9-64fe-4d3c-b00b-0a15b46ac61f'),(78,11,60,NULL,51,1,'2023-12-21 16:47:55','2023-12-21 16:47:55','f57d9cab-0c3c-43c8-a598-0a994b161fc4'),(82,11,68,NULL,65,1,'2023-12-21 16:48:26','2023-12-21 16:48:26','b5f95c0b-b3ca-4154-9fbc-cff71fe33898'),(83,8,69,NULL,40,1,'2023-12-21 16:48:26','2023-12-21 16:48:26','8a1ad1d7-ae98-4856-8a3f-c5957525477e'),(84,8,69,NULL,42,2,'2023-12-21 16:48:26','2023-12-21 16:48:26','79396aca-71c4-4db6-999c-98cf2adf64b7'),(85,11,70,NULL,51,1,'2023-12-21 16:48:26','2023-12-21 16:48:26','71d81af1-76db-4d70-8fe0-4696e70a20c3'),(86,11,71,NULL,65,1,'2023-12-21 16:48:26','2023-12-21 16:48:26','cf200ad5-fbb2-4428-b9f8-8ca62724245a'),(91,11,83,NULL,81,1,'2023-12-21 16:49:54','2023-12-21 16:49:54','7ee83ddc-ea95-42e3-a5d8-9fb1c08e1d46'),(93,11,85,NULL,76,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','77158f24-af47-4d43-bd72-fa0e6b237f26'),(94,11,86,NULL,81,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','779dd168-338a-4bfc-8574-33ff279c2d68'),(95,8,87,NULL,40,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','2cade606-4c46-4a99-9e8a-9ac11d3c0394'),(96,8,87,NULL,42,2,'2023-12-21 16:49:56','2023-12-21 16:49:56','3c28c6e3-4082-4636-be8e-58a8c963b890'),(97,11,88,NULL,51,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','3ec6e119-a9c3-4a72-8893-56c9e5f65b75'),(98,11,89,NULL,65,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','f8aa1360-8c6d-479a-805f-0d3f18bc5f92'),(99,11,90,NULL,76,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','57e63d08-6946-4241-84d7-f23f4f0b5195'),(100,11,91,NULL,81,1,'2023-12-21 16:49:56','2023-12-21 16:49:56','ccb39ade-adfc-476b-bbf2-f597711548b7'),(103,8,99,NULL,40,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','9e95c400-f739-4a5a-8561-20016aaeb733'),(104,8,99,NULL,42,2,'2023-12-21 16:52:55','2023-12-21 16:52:55','d62e021d-b488-45d7-9d19-cc7e068ea582'),(105,11,100,NULL,51,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','77125b77-274b-448c-96d2-ec64ba574278'),(106,11,101,NULL,65,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','69f2ecc9-b066-4b2e-9d19-52fa6d6530f0'),(107,11,102,NULL,76,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','383df833-1317-46dd-afba-f10acd7ce939'),(108,11,103,NULL,81,1,'2023-12-21 16:52:55','2023-12-21 16:52:55','b16bd238-d76c-4841-a0d6-e9771abd7659'),(111,8,116,NULL,40,1,'2023-12-21 16:53:27','2023-12-21 16:53:27','80023878-b55b-4267-bccc-9a50e6eedb8e'),(112,8,116,NULL,42,2,'2023-12-21 16:53:27','2023-12-21 16:53:27','ab394716-3621-4eea-a924-187cddb60199'),(113,11,117,NULL,51,1,'2023-12-21 16:53:27','2023-12-21 16:53:27','ea89a28b-342d-4b5d-a7d3-fea579b42165'),(114,11,118,NULL,65,1,'2023-12-21 16:53:27','2023-12-21 16:53:27','9a2c8378-25e0-4a29-af03-5c5a5711de61'),(115,11,119,NULL,76,1,'2023-12-21 16:53:27','2023-12-21 16:53:27','ee3b023a-0295-45d8-9249-e8d6b40060b6'),(116,11,120,NULL,81,1,'2023-12-21 16:53:27','2023-12-21 16:53:27','5cba2a1f-3d9e-485a-85a1-77347d1a932b'),(118,3,40,NULL,125,1,'2023-12-21 16:55:07','2023-12-21 16:55:07','3f3cb4eb-bb33-4e97-a1c5-256c270076bf'),(119,3,127,NULL,125,1,'2023-12-21 16:55:07','2023-12-21 16:55:07','bc68d3fb-5b37-4429-b555-c45471580226'),(123,3,31,NULL,128,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','7baa37cd-087f-4ea0-8cca-5e2076ebc4ce'),(124,3,130,NULL,128,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','f3258076-a5bf-4c42-9024-2261d32596f2'),(125,8,130,NULL,40,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','972d9b3c-9b36-448e-83f7-b4d57b99c7f0'),(126,8,130,NULL,42,2,'2023-12-21 17:02:40','2023-12-21 17:02:40','5b175352-90e2-4ceb-8ba7-d8f853813769'),(127,11,131,NULL,51,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','d7d1be73-b2bf-4e4e-aef7-32902ee13f68'),(128,11,132,NULL,65,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','512f1d27-8367-49ce-a3c5-67a5a7f66fd3'),(129,11,133,NULL,76,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','26708fa6-8013-4d25-93b9-917477fa528c'),(130,11,134,NULL,81,1,'2023-12-21 17:02:40','2023-12-21 17:02:40','a85c6cb0-e6d4-45a5-8698-2f037c7ad3e2'),(134,3,140,NULL,141,1,'2024-01-16 19:24:01','2024-01-16 19:24:01','185296be-f206-4484-9fd2-ff653d45e39e'),(135,3,142,NULL,141,1,'2024-01-16 19:24:02','2024-01-16 19:24:02','02ffd1b7-4989-41f0-9cba-7587c0217a8a'),(137,3,152,NULL,125,1,'2024-04-02 16:02:02','2024-04-02 16:02:02','a8e17d9a-1cf3-48e4-a2b8-5d2ea04f2d4f'),(138,3,155,NULL,125,1,'2024-04-02 16:02:37','2024-04-02 16:02:37','23541b72-f0fa-4db4-8904-d7443f1c61c4'),(139,3,156,NULL,125,1,'2024-04-02 16:02:38','2024-04-02 16:02:38','5ea405d1-d28a-4b22-9dfa-5fedb2c8e411');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,4,1,1,''),(3,6,1,1,''),(4,8,1,1,''),(5,10,1,1,''),(6,10,1,2,'Applied “Draft 1”'),(7,10,1,3,'Applied “Draft 1”'),(8,10,1,4,'Applied “Draft 1”'),(9,10,1,5,'Applied “Draft 1”'),(10,4,1,2,''),(11,23,1,1,''),(12,10,1,6,'Applied “Draft 1”'),(13,10,1,7,''),(14,10,1,8,'Applied “Draft 1”'),(15,10,1,9,'Applied “Draft 1”'),(16,31,1,1,''),(17,31,1,2,'Applied “Draft 1”'),(18,31,1,3,'Applied “Draft 1”'),(19,31,1,4,'Applied “Draft 1”'),(20,40,1,1,''),(21,42,1,1,''),(22,44,1,1,''),(23,51,1,1,''),(24,31,1,5,'Applied “Draft 1”'),(25,54,1,1,NULL),(26,31,1,6,'Applied “Draft 1”'),(27,54,1,2,NULL),(28,65,1,1,''),(29,31,1,7,'Applied “Draft 1”'),(30,54,1,3,NULL),(31,68,1,1,NULL),(32,76,1,1,''),(33,81,1,1,''),(34,31,1,8,'Applied “Draft 1”'),(35,54,1,4,NULL),(36,68,1,2,NULL),(37,85,1,1,NULL),(38,86,1,1,NULL),(39,31,1,9,'Applied “Draft 1”'),(40,54,1,5,NULL),(41,68,1,3,NULL),(42,85,1,2,NULL),(43,86,1,2,NULL),(44,97,1,1,NULL),(45,98,1,1,NULL),(46,31,1,10,'Applied “Draft 1”'),(47,54,1,6,NULL),(48,68,1,4,NULL),(49,85,1,3,NULL),(50,86,1,3,NULL),(51,97,1,2,NULL),(52,98,1,2,NULL),(53,114,1,1,NULL),(54,115,1,1,NULL),(55,40,1,2,'Applied “Draft 1”'),(56,31,1,11,'Applied “Draft 1”'),(57,54,1,7,NULL),(58,68,1,5,NULL),(59,85,1,4,NULL),(60,86,1,4,NULL),(61,97,1,3,NULL),(62,98,1,3,NULL),(63,114,1,2,NULL),(64,115,1,2,NULL),(65,140,1,1,''),(66,51,1,2,''),(67,65,1,2,''),(68,76,1,2,''),(69,81,1,2,'Applied “Draft 1”'),(70,40,1,3,'Applied “Draft 1”'),(71,42,1,2,''),(72,40,1,4,''),(73,44,1,2,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info putyourlightson com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' wales '),(2,'title',0,1,' wales '),(4,'slug',0,1,' france '),(4,'title',0,1,' france '),(6,'slug',0,1,' ireland '),(6,'title',0,1,' ireland '),(8,'slug',0,1,' denmark '),(8,'title',0,1,' denmark '),(10,'slug',0,1,' the burren and back '),(10,'title',0,1,' the burren and back '),(12,'extension',0,1,' jpg '),(12,'filename',0,1,' the burren jpg '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' the burren '),(23,'slug',0,1,' croatia '),(23,'title',0,1,' croatia '),(31,'slug',0,1,' spanish tortilla '),(31,'title',0,1,' spanish tortilla '),(40,'slug',0,1,' gluten free '),(40,'title',0,1,' gluten free '),(42,'slug',0,1,' vegetarian '),(42,'title',0,1,' vegetarian '),(44,'slug',0,1,' vegan '),(44,'title',0,1,' vegan '),(51,'slug',0,1,' onion '),(51,'title',0,1,' onion '),(54,'slug',0,1,''),(65,'slug',0,1,' olive oil '),(65,'title',0,1,' olive oil '),(68,'slug',0,1,''),(76,'slug',0,1,' butter '),(76,'title',0,1,' butter '),(81,'slug',0,1,' baguette '),(81,'title',0,1,' baguette '),(85,'slug',0,1,''),(86,'slug',0,1,''),(97,'slug',0,1,''),(98,'slug',0,1,''),(114,'slug',0,1,''),(115,'slug',0,1,''),(125,'alt',0,1,''),(125,'extension',0,1,' jpg '),(125,'filename',0,1,' gluten free jpg '),(125,'kind',0,1,' image '),(125,'slug',0,1,''),(125,'title',0,1,' gluten free '),(128,'alt',0,1,''),(128,'extension',0,1,' jpg '),(128,'filename',0,1,' spanish tortilla jpg '),(128,'kind',0,1,' image '),(128,'slug',0,1,''),(128,'title',0,1,' spanish tortilla '),(140,'slug',0,1,' scrambled eggs '),(140,'title',0,1,' scrambled eggs '),(141,'alt',0,1,''),(141,'extension',0,1,' jpg '),(141,'filename',0,1,' scrambled eggs 1 1712564176 jpg '),(141,'kind',0,1,' image '),(141,'slug',0,1,''),(141,'title',0,1,' scrambled eggs 1 1712564176 '),(144,'slug',0,1,' onion '),(144,'title',0,1,' onion '),(146,'slug',0,1,' olive oil '),(146,'title',0,1,' olive oil '),(148,'slug',0,1,' butter '),(148,'title',0,1,' butter '),(154,'slug',0,1,' vegetarian '),(154,'title',0,1,' vegetarian '),(156,'slug',0,1,' gluten free '),(156,'title',0,1,' gluten free '),(164,'slug',0,1,' vegan '),(164,'title',0,1,' vegan ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Countries','countries','channel',1,1,'all','end',NULL,'2022-11-09 01:58:36','2022-11-09 01:58:36',NULL,'65e19c67-6869-4b02-8f73-1faddec1820b'),(2,NULL,'Trips','trips','channel',1,1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\"}]','2022-11-09 01:58:47','2024-04-02 16:00:03',NULL,'d6ade80e-232c-4c7e-8d7c-8c8ca98bd05b'),(3,NULL,'Recipes','recipes','channel',1,1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\"}]','2023-11-08 19:08:29','2024-04-02 16:00:03',NULL,'2f9cfd47-380e-451a-8887-8e59dfed3d23'),(4,NULL,'Dietary Preferences','dietaryPreferences','channel',1,1,'all','end',NULL,'2023-12-21 16:38:42','2023-12-21 16:38:42',NULL,'4f4c5e55-bdb6-4b11-a80c-a707a67c93c8'),(5,NULL,'Ingredients','ingredients','channel',1,1,'all','end',NULL,'2023-12-21 16:41:50','2023-12-21 16:41:50',NULL,'842cdeba-cd27-4e0b-9de5-60ed051ee6bd');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2022-11-09 01:58:36','2023-11-08 12:11:01','9761dbfe-9ecb-46c1-8e07-7f888aed7010'),(2,2,1,1,'trips/{slug}','trip.twig',1,'2022-11-09 01:58:47','2023-11-09 17:09:27','d92f9753-f69e-4312-b4f0-5d017d260fb5'),(3,3,1,1,'recipes/{slug}','recipe.twig',1,'2023-11-08 19:08:29','2023-12-21 17:00:04','696dbfe4-5b66-43b2-890c-f07e5ba762c2'),(4,4,1,0,NULL,NULL,1,'2023-12-21 16:38:42','2023-12-21 16:38:42','df9aea80-a34c-49ce-bcec-1542cd323d9a'),(5,5,1,0,NULL,NULL,1,'2023-12-21 16:41:50','2023-12-21 16:41:58','5c634ddb-ab63-4258-8b24-08e225a02c7f');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'COS','2022-11-09 01:55:10','2023-11-08 12:13:33',NULL,'6e92a5b7-6be7-4569-b58a-4e3691f067f8');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','COS','cos','en-GB',1,'$PRIMARY_SITE_URL',1,'2022-11-09 01:55:10','2023-11-08 12:13:47',NULL,'658815bf-b62b-4167-b965-8343a311b9f3');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'info@putyourlightson.com','$2y$13$xOsg1jPHua8xRFpmyoWsReP0clcOlLK/KRdDboj2i1gpvVjHJM6Vi','2024-04-02 16:00:14',NULL,NULL,NULL,'2023-11-09 18:11:42',NULL,1,NULL,NULL,NULL,0,'2023-11-09 18:11:57','2022-11-09 01:55:11','2024-04-02 16:00:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images',NULL,'2022-11-09 02:05:48','2022-11-09 03:35:34','441efd9c-3cb2-425e-9ff3-af4e4ebb6259'),(2,NULL,NULL,'Temporary filesystem',NULL,'2022-11-09 02:08:41','2022-11-09 02:08:41','5125e611-5f2d-4793-bb62-44a36efa84c8'),(4,2,NULL,'user_1','user_1/','2022-11-09 03:33:56','2022-11-09 03:33:56','46bc1462-2e49-4ec7-ac2f-1f7f5e16c5db');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Images','images','images',NULL,'','','site',NULL,'site',NULL,1,'2022-11-09 02:05:48','2022-11-09 03:35:46',NULL,'5e23629a-bc17-41b0-b9b7-8afe3687d8d4');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-11-09 01:55:12','2022-11-09 01:55:12','38cb0dba-028a-4f99-ae53-857807f574de'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-11-09 01:55:12','2022-11-09 01:55:12','337c0aa5-66e4-4150-874a-881ff5f2f75c'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-11-09 01:55:12','2022-11-09 01:55:12','2f6c3046-0fe4-44f8-b6ed-51f8ec2f777d'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-11-09 01:55:12','2022-11-09 01:55:12','04b4da40-b478-4ee2-8ebf-e2a688656206');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 16:05:57
