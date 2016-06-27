/*
 Navicat Premium Data Transfer

 Source Server         : Oryon
 Source Server Type    : SQLite
 Source Server Version : 3008008
 Source Database       : main

 Target Server Type    : SQLite
 Target Server Version : 3008008
 File Encoding         : utf-8

 Date: 06/27/2016 22:52:06 PM
*/

PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS "comment";
CREATE TABLE "comment" (
	 "comment_id" INTEGER NOT NULL,
	 "comment_content" TEXT NOT NULL,
	 "comment_creation_date" date NOT NULL,
	PRIMARY KEY("comment_id")
);

-- ----------------------------
--  Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS "comment_like";
CREATE TABLE "comment_like" (
	 "comment_like_id" INTEGER NOT NULL,
	 "user_id" integer NOT NULL,
	 "comment_id" INTEGER NOT NULL,
	PRIMARY KEY("comment_like_id"),
	CONSTRAINT "comment" FOREIGN KEY ("comment_id") REFERENCES "comment" ("comment_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id")
);

-- ----------------------------
--  Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS "game";
CREATE TABLE "game" (
	 "game_id" INTEGER NOT NULL,
	 "game_name" TEXT NOT NULL,
	 "game_description" TEXT,
	PRIMARY KEY("game_id")
);

-- ----------------------------
--  Table structure for game_media
-- ----------------------------
DROP TABLE IF EXISTS "game_media";
CREATE TABLE "game_media" (
	 "game_media_id" INTEGER NOT NULL,
	 "game_id" INTEGER NOT NULL,
	 "media_id" INTEGER NOT NULL,
	PRIMARY KEY("game_media_id"),
	CONSTRAINT "media" FOREIGN KEY ("media_id") REFERENCES "media" ("media_id"),
	CONSTRAINT "game" FOREIGN KEY ("game_id") REFERENCES "game" ("game_id")
);

-- ----------------------------
--  Table structure for game_platform
-- ----------------------------
DROP TABLE IF EXISTS "game_platform";
CREATE TABLE "game_platform" (
	 "game_platform_id" INTEGER NOT NULL,
	 "game_id" INTEGER NOT NULL,
	 "platform_id" INTEGER NOT NULL,
	PRIMARY KEY("game_platform_id"),
	CONSTRAINT "platforms" FOREIGN KEY ("platform_id") REFERENCES "platform" ("platform_id"),
	CONSTRAINT "game" FOREIGN KEY ("game_id") REFERENCES "game" ("game_id")
);

-- ----------------------------
--  Table structure for game_test
-- ----------------------------
DROP TABLE IF EXISTS "game_test";
CREATE TABLE "game_test" (
	 "game_test_id" INTEGER NOT NULL,
	 "game_id" INTEGER NOT NULL,
	 "test_id" INTEGER NOT NULL,
	PRIMARY KEY("game_test_id"),
	CONSTRAINT "game" FOREIGN KEY ("game_id") REFERENCES "game" ("game_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "test" FOREIGN KEY ("test_id") REFERENCES "test" ("test_id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
--  Table structure for lineup
-- ----------------------------
DROP TABLE IF EXISTS "lineup";
CREATE TABLE "lineup" (
	 "lineup_id" INTEGER NOT NULL,
	 "lineup_name" TEXT NOT NULL,
	 "lineup_description" TEXT NOT NULL,
	PRIMARY KEY("lineup_id")
);

-- ----------------------------
--  Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS "media";
CREATE TABLE "media" (
	 "media_id" integer NOT NULL,
	 "media_name" TEXT NOT NULL,
	 "media_url" TEXT NOT NULL,
	PRIMARY KEY("media_id")
);

-- ----------------------------
--  Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS "platform";
CREATE TABLE "platform" (
	 "platform_id" INTEGER NOT NULL,
	 "platform_name_long" TEXT NOT NULL,
	 "platform_name_short" TEXT NOT NULL,
	 "platform_image_logo" TEXT NOT NULL,
	PRIMARY KEY("platform_id")
);

-- ----------------------------
--  Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS "post";
CREATE TABLE "post" (
	 "post_id" INTEGER NOT NULL,
	 "post_content" TEXT NOT NULL,
	 "post_creation_date" date NOT NULL,
	PRIMARY KEY("post_id")
);

-- ----------------------------
--  Table structure for post_comment
-- ----------------------------
DROP TABLE IF EXISTS "post_comment";
CREATE TABLE "post_comment" (
	 "post_comment_id" INTEGER NOT NULL,
	 "post_id" integer NOT NULL,
	 "comment_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	PRIMARY KEY("post_comment_id"),
	CONSTRAINT "comment" FOREIGN KEY ("comment_id") REFERENCES "comment" ("comment_id"),
	CONSTRAINT "post" FOREIGN KEY ("post_id") REFERENCES "post" ("post_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id")
);

-- ----------------------------
--  Table structure for post_like
-- ----------------------------
DROP TABLE IF EXISTS "post_like";
CREATE TABLE "post_like" (
	 "post_like_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	 "post_id" INTEGER NOT NULL,
	PRIMARY KEY("post_like_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id"),
	CONSTRAINT "post" FOREIGN KEY ("post_id") REFERENCES "post" ("post_id")
);

-- ----------------------------
--  Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS "setting";
CREATE TABLE "setting" (
	 "setting_id" integer NOT NULL,
	 "setting_name" TEXT NOT NULL,
	 "setting_content" TEXT NOT NULL,
	PRIMARY KEY("setting_id")
);

-- ----------------------------
--  Records of setting
-- ----------------------------
BEGIN;
INSERT INTO "setting" VALUES (1, 'twitch_url', 'http://...');
INSERT INTO "setting" VALUES (2, 'shop_url', 'http://...');
COMMIT;

-- ----------------------------
--  Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS "team";
CREATE TABLE "team" (
	 "team_id" INTEGER NOT NULL,
	 "team_name" TEXT NOT NULL,
	 "team_description" TEXT NOT NULL,
	 "team_image_logo" TEXT,
	 "team_image_background" TEXT,
	 "team_is_guild" integer(1,0) NOT NULL DEFAULT 0,
	 "team_creation_date" date NOT NULL,
	PRIMARY KEY("team_id")
);

-- ----------------------------
--  Table structure for team_user
-- ----------------------------
DROP TABLE IF EXISTS "team_user";
CREATE TABLE "team_user" (
	 "team_user_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	 "team_id" INTEGER NOT NULL,
	 "lineup_id" INTEGER,
	PRIMARY KEY("team_user_id"),
	CONSTRAINT "team" FOREIGN KEY ("team_id") REFERENCES "team" ("team_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "lineup" FOREIGN KEY ("lineup_id") REFERENCES "lineup" ("lineup_id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
--  Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS "test";
CREATE TABLE "test" (
	 "test_id" INTEGER NOT NULL,
	 "test_content" TEXT NOT NULL,
	 "test_note" integer NOT NULL,
	 "test_user_id" INTEGER NOT NULL,
	 "test_creation_date" date NOT NULL
);

-- ----------------------------
--  Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
	 "user_id" integer NOT NULL,
	 "user_firstname" TEXT NOT NULL,
	 "user_lastname" TEXT NOT NULL,
	 "user_pseudo" TEXT,
	 "user_mail" TEXT NOT NULL,
	 "user_password" TEXT NOT NULL,
	 "user_image_profil" TEXT,
	 "user_image_background" TEXT,
	 "user_birthdate" date,
	 "user_is_streamer" boolean(1,0) NOT NULL DEFAULT 0,
	 "user_facebook" TEXT,
	 "user_google" TEXT,
	 "user_linkedin" TEXT,
	 "user_twitch" TEXT,
	 "user_twitter" TEXT,
	 "user_youtube" TEXT,
	 "user_creation_date" date NOT NULL,
	PRIMARY KEY("user_id")
);

-- ----------------------------
--  Table structure for user_media
-- ----------------------------
DROP TABLE IF EXISTS "user_media";
CREATE TABLE "user_media" (
	 "user_media_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	 "media_id" INTEGER NOT NULL,
	PRIMARY KEY("user_media_id"),
	CONSTRAINT "media" FOREIGN KEY ("media_id") REFERENCES "media" ("media_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id")
);

-- ----------------------------
--  Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS "user_post";
CREATE TABLE "user_post" (
	 "user_post_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	 "post_id" INTEGER NOT NULL,
	PRIMARY KEY("user_post_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id"),
	CONSTRAINT "post" FOREIGN KEY ("post_id") REFERENCES "post" ("post_id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
--  Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS "user_test";
CREATE TABLE "user_test" (
	 "user_test_id" INTEGER NOT NULL,
	 "user_id" INTEGER NOT NULL,
	 "test_id" INTEGER NOT NULL,
	PRIMARY KEY("user_test_id"),
	CONSTRAINT "test" FOREIGN KEY ("test_id") REFERENCES "test" ("test_id"),
	CONSTRAINT "user" FOREIGN KEY ("user_id") REFERENCES "user" ("user_id")
);

-- ----------------------------
--  View structure for game_all
-- ----------------------------
DROP VIEW IF EXISTS "game_all";
CREATE VIEW "game_all" AS SELECT
"game".*,
"media".*,
"platform".*,
"test".*
FROM
"game"
JOIN "game_media"
ON "game"."game_id" = "game_media"."game_id" 
JOIN "media"
ON "game_media"."media_id" = "media"."media_id" 
JOIN "game_platform"
ON "game"."game_id" = "game_platform"."game_id" 
JOIN "platform"
ON "game_platform"."platform_id" = "platform"."platform_id" 
JOIN "game_test"
ON "game"."game_id" = "game_test"."game_id" 
JOIN "test"
ON "game_test"."test_id" = "test"."test_id";

PRAGMA foreign_keys = true;
