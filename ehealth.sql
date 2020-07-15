-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ehealthcare
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ehealthcare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ehealthcare` DEFAULT CHARACTER SET utf8 ;
USE `ehealthcare` ;

-- -----------------------------------------------------
-- Table `ehealthcare`.`appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`appointments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `cancelation` TINYINT NULL DEFAULT NULL,
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
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
AUTO_INCREMENT = 126
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
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
  `zip_code` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `deptId` INT NULL DEFAULT NULL,
  `roleId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `Users_deptId_foreign_idx` (`deptId` ASC) VISIBLE,
  INDEX `Users_roleId_foreign_idx` (`roleId` ASC) VISIBLE,
  CONSTRAINT `Users_deptId_foreign_idx`
    FOREIGN KEY (`deptId`)
    REFERENCES `ehealthcare`.`departments` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Users_roleId_foreign_idx`
    FOREIGN KEY (`roleId`)
    REFERENCES `ehealthcare`.`roles` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`doctors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speciality` VARCHAR(45) NULL DEFAULT NULL,
  `start_work` DATETIME NULL DEFAULT NULL,
  `TeamId` INT NULL DEFAULT NULL,
  `UserId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `Doctors_TeamId_foreign_idx` (`TeamId` ASC) VISIBLE,
  INDEX `Doctors_UserId_foreign_idx` (`UserId` ASC) VISIBLE,
  CONSTRAINT `Doctors_TeamId_foreign_idx`
    FOREIGN KEY (`TeamId`)
    REFERENCES `ehealthcare`.`teams` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Doctors_UserId_foreign_idx`
    FOREIGN KEY (`UserId`)
    REFERENCES `ehealthcare`.`users` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`medicines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`medicines` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`prescriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`prescriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `generated_datetime` DATETIME NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ehealthcare`.`sequelizemeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`sequelizemeta` (
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


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
-- Table `ehealthcare`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ehealthcare`.`vendors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `tel_num` VARCHAR(11) NULL DEFAULT NULL,
  `address` VARCHAR(50) NULL DEFAULT NULL,
  `DeptId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `Vendors_DeptId_foreign_idx` (`DeptId` ASC) VISIBLE,
  CONSTRAINT `Vendors_DeptId_foreign_idx`
    FOREIGN KEY (`DeptId`)
    REFERENCES `ehealthcare`.`departments` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
