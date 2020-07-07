-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ehealthcare
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ehealthcare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ehealthcare` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `ehealthcare` ;

-- -----------------------------------------------------
-- Table `ehealthcare`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`tasks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `shift` VARCHAR(45) NULL DEFAULT NULL,
  `start_time` TIME NULL DEFAULT NULL,
  `end_time` TIME NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`vendors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `tel_num` VARCHAR(11) NULL DEFAULT NULL,
  `address` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `building` VARCHAR(50) NULL DEFAULT NULL,
  `vendors_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departments_vendors1_idx` (`vendors_id` ASC) VISIBLE,
  CONSTRAINT `fk_departments_vendors1`
    FOREIGN KEY (`vendors_id`)
    REFERENCES `ehealthcare`.`vendors` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `gender` ENUM('M', 'F') NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `contact_num` VARCHAR(11) NULL DEFAULT NULL,
  `zip_code` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `departments_id` INT NULL DEFAULT NULL,
  `categories_id` INT NULL DEFAULT NULL,
  `tasks_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_departments1_idx` (`departments_id` ASC) VISIBLE,
  INDEX `fk_users_categories1_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_users_tasks1_idx` (`tasks_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_tasks1`
    FOREIGN KEY (`tasks_id`)
    REFERENCES `ehealthcare`.`tasks` (`id`),
  CONSTRAINT `fk_users_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `ehealthcare`.`roles` (`id`),
  CONSTRAINT `fk_users_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `ehealthcare`.`departments` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `procedure_info` VARCHAR(255) NULL DEFAULT NULL,
  `due_date` DATE NULL DEFAULT NULL,
  `start_at` TIME NULL DEFAULT NULL,
  `end_at` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`doctors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speciality` VARCHAR(45) NULL DEFAULT NULL,
  `start_work` DATETIME NULL DEFAULT NULL,
  `teams_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_doctors_teams1_idx` (`teams_id` ASC) VISIBLE,
  INDEX `fk_doctors_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctors_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ehealthcare`.`users` (`id`),
  CONSTRAINT `fk_doctors_teams1`
    FOREIGN KEY (`teams_id`)
    REFERENCES `ehealthcare`.`teams` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`appointments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `cancelation` TINYINT NULL DEFAULT NULL,
  `doctors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_appointments_doctors1_idx` (`doctors_id` ASC) VISIBLE,
  CONSTRAINT `fk_appointments_doctors1`
    FOREIGN KEY (`doctors_id`)
    REFERENCES `ehealthcare`.`doctors` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`patients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weight` DECIMAL(10,0) NULL DEFAULT NULL,
  `arrived_at` DATETIME NULL DEFAULT NULL,
  `left_at` DATETIME NULL DEFAULT NULL,
  `appointments_id` INT NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_patients_appointments1_idx` (`appointments_id` ASC) VISIBLE,
  INDEX `fk_patients_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_patients_appointments1`
    FOREIGN KEY (`appointments_id`)
    REFERENCES `ehealthcare`.`appointments` (`id`),
  CONSTRAINT `fk_patients_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ehealthcare`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`prescriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`prescriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `generated_datetime` DATETIME NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `patients_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prescriptions_patients1_idx` (`patients_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescriptions_patients1`
    FOREIGN KEY (`patients_id`)
    REFERENCES `ehealthcare`.`patients` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`medicines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`medicines` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `prescriptions_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicines_prescriptions1_idx` (`prescriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_medicines_prescriptions1`
    FOREIGN KEY (`prescriptions_id`)
    REFERENCES `ehealthcare`.`prescriptions` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
