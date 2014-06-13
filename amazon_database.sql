



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Books'
-- 
-- ---

DROP TABLE IF EXISTS `Books`;

CREATE TABLE `Books` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `author_id` INTEGER NULL DEFAULT NULL,
  `publisher_id` INTEGER NULL DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  `genre` VARCHAR NULL DEFAULT NULL,
  `released_on` DATE NULL DEFAULT NULL,
  `updated_at` DATE NULL DEFAULT NULL,
  `created_at` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Authors'
-- 
-- ---

DROP TABLE IF EXISTS `Authors`;

CREATE TABLE `Authors` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `publisher_id` INTEGER NULL DEFAULT NULL,
  `created_at` DATE NULL DEFAULT NULL,
  `updated_at` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Users'
-- 
-- ---

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `email` VARCHAR NULL DEFAULT NULL,
  `password` VARCHAR NULL DEFAULT NULL,
  `username` VARCHAR NULL DEFAULT NULL,
  `upated_at` DATE NULL DEFAULT NULL,
  `created_at` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Publishers'
-- 
-- ---

DROP TABLE IF EXISTS `Publishers`;

CREATE TABLE `Publishers` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `created_at` DATE NULL DEFAULT NULL,
  `updated_at` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Reviews'
-- 
-- ---

DROP TABLE IF EXISTS `Reviews`;

CREATE TABLE `Reviews` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `book_id` INTEGER NULL DEFAULT NULL,
  `user_id` INTEGER NULL DEFAULT NULL,
  `rating` INTEGER NULL DEFAULT NULL,
  `content` VARCHAR NULL DEFAULT NULL,
  `created_at` DATE NULL DEFAULT NULL,
  `updated_at` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Books` ADD FOREIGN KEY (author_id) REFERENCES `Authors` (`id`);
ALTER TABLE `Books` ADD FOREIGN KEY (publisher_id) REFERENCES `Publishers` (`id`);
ALTER TABLE `Authors` ADD FOREIGN KEY (publisher_id) REFERENCES `Publishers` (`id`);
ALTER TABLE `Reviews` ADD FOREIGN KEY (book_id) REFERENCES `Books` (`id`);
ALTER TABLE `Reviews` ADD FOREIGN KEY (user_id) REFERENCES `Users` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Books` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Authors` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Publishers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Books` (`id`,`author_id`,`publisher_id`,`title`,`genre`,`released_on`,`updated_at`,`created_at`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Authors` (`id`,`publisher_id`,`created_at`,`updated_at`) VALUES
-- ('','','','');
-- INSERT INTO `Users` (`id`,`name`,`email`,`password`,`username`,`upated_at`,`created_at`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Publishers` (`id`,`name`,`created_at`,`updated_at`) VALUES
-- ('','','','');
-- INSERT INTO `Reviews` (`id`,`book_id`,`user_id`,`rating`,`content`,`created_at`,`updated_at`) VALUES
-- ('','','','','','','');

