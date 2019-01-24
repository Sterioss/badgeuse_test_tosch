-- MySQL Script generated by MySQL Workbench
-- Thu Jan 24 12:08:33 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema badgeuse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema badgeuse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `badgeuse` DEFAULT CHARACTER SET utf8 ;
USE `badgeuse` ;

-- -----------------------------------------------------
-- Table `badgeuse`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`roles` (
  `id` SMALLINT(6) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_role_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`users` (
  `id` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `prenom_user` VARCHAR(255) NOT NULL,
  `nom_user` VARCHAR(255) NOT NULL,
  `pseudo_user` VARCHAR(255) NOT NULL DEFAULT 'pseudo de l\utilisateur',
  `mail_user` VARCHAR(255) NOT NULL,
  `mdp_user` VARCHAR(255) NULL DEFAULT NULL,
  `mdp_temp_user` VARCHAR(255) NULL DEFAULT '914ad87dce80aa7c9858f26619746013da575f97',
  `id_role` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `pseudo_user_UNIQUE` (`pseudo_user` ASC),
  UNIQUE INDEX `mail_user_UNIQUE` (`mail_user` ASC),
  INDEX `fk_users_roles1_idx` (`id_role` ASC),
  CONSTRAINT `fk_users_roles1`
    FOREIGN KEY (`id_role`)
    REFERENCES `badgeuse`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`badge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`badge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_in` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_out` DATETIME NULL DEFAULT NULL,
  `duration` TIME NULL,
  `id_user` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_badge_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_badge_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `badgeuse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`users_extend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`users_extend` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` SMALLINT(6) NOT NULL,
  `id_group` INT NOT NULL,
  `card` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_users_extend_users_idx` (`id_user` ASC),
  INDEX `fk_users_extend_groups1_idx` (`id_group` ASC),
  CONSTRAINT `fk_users_extend_users`
    FOREIGN KEY (`id_user`)
    REFERENCES `badgeuse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_extend_groups1`
    FOREIGN KEY (`id_group`)
    REFERENCES `badgeuse`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badgeuse`.`absences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badgeuse`.`absences` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `half_day` TINYINT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `comment` VARCHAR(255) NULL,
  `id_event` INT NOT NULL,
  `certificate` VARCHAR(255) NULL,
  `id_user` SMALLINT(6) NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_absences_events1_idx` (`id_event` ASC),
  INDEX `fk_absences_users1_idx` (`id_user` ASC),
  CONSTRAINT `fk_absences_events1`
    FOREIGN KEY (`id_event`)
    REFERENCES `badgeuse`.`events` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_absences_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `badgeuse`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;