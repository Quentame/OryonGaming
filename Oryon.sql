/*
 Navicat Premium Data Transfer

 Source Server         : Oryon
 Source Server Type    : SQLite
 Source Server Version : 3008008
 Source Database       : main

 Target Server Type    : MySQL
 Target Server Version : 40100
 File Encoding         : utf-8

 Date: 07/06/2016 22:47:49 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
	`comment_id` int NOT NULL,
	`comment_content` longtext NOT NULL,
	`comment_creation_date` longblob NOT NULL,
	PRIMARY KEY (`comment_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `game`
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
	`game_id` int NOT NULL,
	`game_name` longtext NOT NULL,
	`game_description` longtext,
	PRIMARY KEY (`game_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `gametype`
-- ----------------------------
DROP TABLE IF EXISTS `gametype`;
CREATE TABLE `gametype` (
	`gametype_id` int NOT NULL,
	`gametype_label` longtext NOT NULL,
	PRIMARY KEY (`gametype_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `lineup`
-- ----------------------------
DROP TABLE IF EXISTS `lineup`;
CREATE TABLE `lineup` (
	`lineup_id` int NOT NULL,
	`lineup_name` longtext NOT NULL,
	`lineup_description` longtext NOT NULL,
	PRIMARY KEY (`lineup_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
	`media_id` int NOT NULL,
	`media_name` longtext NOT NULL,
	`media_url` longtext NOT NULL,
	PRIMARY KEY (`media_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `platform`
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
	`platform_id` int NOT NULL,
	`platform_name_long` longtext NOT NULL,
	`platform_name_short` longtext NOT NULL,
	`platform_image_logo` longtext NOT NULL,
	PRIMARY KEY (`platform_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
	`post_id` int NOT NULL,
	`post_content` longtext NOT NULL,
	`post_creation_date` longblob NOT NULL,
	PRIMARY KEY (`post_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
	`setting_id` int NOT NULL,
	`setting_name` longtext NOT NULL,
	`setting_content` longtext NOT NULL,
	PRIMARY KEY (`setting_id`)
) COMMENT='';

-- ----------------------------
--  Records of `setting`
-- ----------------------------
BEGIN;
INSERT INTO `setting` VALUES ('1', 'twitch_url', 'http://...'), ('2', 'shop_url', 'http://...');
COMMIT;

-- ----------------------------
--  Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
	`team_id` int NOT NULL,
	`team_name` longtext NOT NULL,
	`team_description` longtext NOT NULL,
	`team_image_logo` longtext,
	`team_image_background` longtext,
	`team_is_guild` int NOT NULL,
	`team_creation_date` longblob NOT NULL,
	PRIMARY KEY (`team_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
	`test_id` int NOT NULL,
	`test_content` longtext NOT NULL,
	`test_note` int NOT NULL,
	`test_user_id` int NOT NULL,
	`test_creation_date` longblob NOT NULL
) COMMENT='';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`user_id` int NOT NULL,
	`user_firstname` longtext NOT NULL,
	`user_lastname` longtext NOT NULL,
	`user_pseudo` longtext,
	`user_mail` longtext NOT NULL,
	`user_password` longtext NOT NULL,
	`user_image_profil` longtext,
	`user_image_background` longtext,
	`user_birthdate` longblob,
	`user_is_streamer` longblob NOT NULL,
	`user_facebook` longtext,
	`user_google` longtext,
	`user_linkedin` longtext,
	`user_twitch` longtext,
	`user_twitter` longtext,
	`user_youtube` longtext,
	`user_creation_date` longblob NOT NULL,
	PRIMARY KEY (`user_id`)
) COMMENT='';

-- -----------------------------------------
-- -----------------------------------------

-- ----------------------------
--  Table structure for `comment_like`
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like` (
	`comment_like_id` int NOT NULL,
	`user_id` int NOT NULL,
	`comment_id` int NOT NULL,
	PRIMARY KEY (`comment_like_id`),
	CONSTRAINT `comments` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
	CONSTRAINT `user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `game_media`
-- ----------------------------
DROP TABLE IF EXISTS `game_media`;
CREATE TABLE `game_media` (
	`game_media_id` int NOT NULL,
	`game_id` int NOT NULL,
	`media_id` int NOT NULL,
	PRIMARY KEY (`game_media_id`),
	CONSTRAINT `medias_for_game` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`),
	CONSTRAINT `game_media` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `game_platform`
-- ----------------------------
DROP TABLE IF EXISTS `game_platform`;
CREATE TABLE `game_platform` (
	`game_platform_id` int NOT NULL,
	`game_id` int NOT NULL,
	`platform_id` int NOT NULL,
	PRIMARY KEY (`game_platform_id`),
	CONSTRAINT `platforms` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`),
	CONSTRAINT `game_platform` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `game_test`
-- ----------------------------
DROP TABLE IF EXISTS `game_test`;
CREATE TABLE `game_test` (
	`game_test_id` int NOT NULL,
	`game_id` int NOT NULL,
	`test_id` int NOT NULL,
	PRIMARY KEY (`game_test_id`),
	CONSTRAINT `game_test` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
	CONSTRAINT `tests` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `game_type`
-- ----------------------------
DROP TABLE IF EXISTS `game_type`;
CREATE TABLE `game_type` (
	`game_type_id` int NOT NULL,
	`game_id` int NOT NULL,
	`type_id` int NOT NULL,
	PRIMARY KEY (`game_type_id`),
	CONSTRAINT `types` FOREIGN KEY (`type_id`) REFERENCES `gametype` (`gametype_id`),
	CONSTRAINT `game_type` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `team_user`
-- ----------------------------
DROP TABLE IF EXISTS `team_user`;
CREATE TABLE `team_user` (
	`team_user_id` int NOT NULL,
	`user_id` int NOT NULL,
	`team_id` int NOT NULL,
	`lineup_id` int,
	PRIMARY KEY (`team_user_id`),
	CONSTRAINT `teams` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
	CONSTRAINT `user_team` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
	CONSTRAINT `lineups` FOREIGN KEY (`lineup_id`) REFERENCES `lineup` (`lineup_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `post_comment`
-- ----------------------------
DROP TABLE IF EXISTS `post_comment`;
CREATE TABLE `post_comment` (
	`post_comment_id` int NOT NULL,
	`post_id` int NOT NULL,
	`comment_id` int NOT NULL,
	`user_id` int NOT NULL,
	PRIMARY KEY (`post_comment_id`),
	CONSTRAINT `comments` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
	CONSTRAINT `posts` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
	CONSTRAINT `user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `post_like`
-- ----------------------------
DROP TABLE IF EXISTS `post_like`;
CREATE TABLE `post_like` (
	`post_like_id` int NOT NULL,
	`user_id` int NOT NULL,
	`post_id` int NOT NULL,
	PRIMARY KEY (`post_like_id`),
	CONSTRAINT `user_like` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
	CONSTRAINT `posts` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `user_media`
-- ----------------------------
DROP TABLE IF EXISTS `user_media`;
CREATE TABLE `user_media` (
	`user_media_id` int NOT NULL,
	`user_id` int NOT NULL,
	`media_id` int NOT NULL,
	PRIMARY KEY (`user_media_id`),
	CONSTRAINT `medias_for_user` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`),
	CONSTRAINT `user_media` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `user_post`
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post` (
	`user_post_id` int NOT NULL,
	`user_id` int NOT NULL,
	`post_id` int NOT NULL,
	PRIMARY KEY (`user_post_id`),
	CONSTRAINT `user_post` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
	CONSTRAINT `post_by_user` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) COMMENT='';

-- ----------------------------
--  Table structure for `user_test`
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
	`user_test_id` int NOT NULL,
	`user_id` int NOT NULL,
	`test_id` int NOT NULL,
	PRIMARY KEY (`user_test_id`),
	CONSTRAINT `test_by_user` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`),
	CONSTRAINT `user_test` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) COMMENT='';

SET FOREIGN_KEY_CHECKS = 1;
