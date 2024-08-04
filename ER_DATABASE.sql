-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tweet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tweet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tweet` DEFAULT CHARACTER SET utf8 ;
USE `tweet` ;

-- -----------------------------------------------------
-- Table `tweet`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`topic` (
  `topic_id` INT NOT NULL AUTO_INCREMENT,
  `topic_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`topic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`trained_tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`trained_tweets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `tweet` VARCHAR(300) NOT NULL,
  `sentiment_label` VARCHAR(45) NOT NULL,
  `sentiment_score` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`tweets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`tweets` (
  `tweet_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NOT NULL,
  `sentiment_la'bel` VARCHAR(45) NULL,
  `sentiment_score` VARCHAR(45) NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`tweet_id`),
  INDEX `fk_tweets_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_tweets_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `tweet`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`positive_negitive_precentage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`positive_negitive_precentage` (
  `topic_id` INT NOT NULL,
  `positive_pct` FLOAT NULL,
  `negitive_pct` FLOAT NULL,
  INDEX `fk_positive_negitive_precentage_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_positive_negitive_precentage_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `tweet`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`word_cloud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`word_cloud` (
  `topic_id` INT NOT NULL,
  `positive_path` VARCHAR(300) NULL,
  `negative_path` VARCHAR(300) NULL,
  INDEX `fk_word_cloud_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_word_cloud_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `tweet`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`users_has_topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`users_has_topic` (
  `user_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `topic_id`),
  INDEX `fk_users_has_topic_topic1_idx` (`topic_id` ASC),
  INDEX `fk_users_has_topic_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_users_has_topic_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `tweet`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_topic_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `tweet`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tweet`.`tweet_sample`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`tweet_sample` (
  `tweet_sample_id` INT NOT NULL AUTO_INCREMENT,
  `positive_tweet` VARCHAR(300) NULL,
  `negative_tweet` VARCHAR(300) NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`tweet_sample_id`),
  INDEX `fk_tweet_sample_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_tweet_sample_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `tweet`.`topic` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tweet` ;

-- -----------------------------------------------------
-- Placeholder table for view `tweet`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tweet`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `tweet`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tweet`.`view1`;
USE `tweet`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
