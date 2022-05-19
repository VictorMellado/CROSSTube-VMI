-- MySQL Script generated by MySQL Workbench
-- jue 19 may 2022 15:08:13
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CROSSTube-VMI
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `CROSSTube-VMI` ;

-- -----------------------------------------------------
-- Schema CROSSTube-VMI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CROSSTube-VMI` ;
USE `CROSSTube-VMI` ;

-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NULL,
  `contraseña` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Nivel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Ejercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Ejercicio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `autoCarga` TINYINT NULL,
  `url` VARCHAR(45) NULL,
  `imgPoster` BLOB NULL,
  `repeticiones` INT NULL,
  `tipo` ENUM('MUSCULAR', 'CARDIO') NULL,
  `Nivel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ejercicio_Nivel1_idx` (`Nivel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ejercicio_Nivel1`
    FOREIGN KEY (`Nivel_id`)
    REFERENCES `CROSSTube-VMI`.`Nivel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`GrupoMuscular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`GrupoMuscular` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Muscular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Muscular` (
  `id` INT NOT NULL,
  `GrupoMuscular_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Muscular_GrupoMuscular1_idx` (`GrupoMuscular_id` ASC) VISIBLE,
  CONSTRAINT `fk_Muscular_Ejercicio1`
    FOREIGN KEY (`id`)
    REFERENCES `CROSSTube-VMI`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Muscular_GrupoMuscular1`
    FOREIGN KEY (`GrupoMuscular_id`)
    REFERENCES `CROSSTube-VMI`.`GrupoMuscular` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Cardio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Cardio` (
  `calorias` INT NULL,
  `tiempo` INT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Cardio_Ejercicio1`
    FOREIGN KEY (`id`)
    REFERENCES `CROSSTube-VMI`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Valorar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Valorar` (
  `Ejercicio_id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  `comentario` VARCHAR(45) NULL,
  `valoracion` VARCHAR(45) NULL,
  PRIMARY KEY (`Ejercicio_id`, `Usuario_id`),
  INDEX `fk_Ejercicio_has_Usuario_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Ejercicio_has_Usuario_Ejercicio1_idx` (`Ejercicio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ejercicio_has_Usuario_Ejercicio1`
    FOREIGN KEY (`Ejercicio_id`)
    REFERENCES `CROSSTube-VMI`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejercicio_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `CROSSTube-VMI`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Favorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Favorito` (
  `Usuario_id` INT NOT NULL,
  `Ejercicio_id` INT NOT NULL,
  PRIMARY KEY (`Usuario_id`, `Ejercicio_id`),
  INDEX `fk_Usuario_has_Ejercicio_Ejercicio1_idx` (`Ejercicio_id` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Ejercicio_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Ejercicio_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `CROSSTube-VMI`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Ejercicio_Ejercicio1`
    FOREIGN KEY (`Ejercicio_id`)
    REFERENCES `CROSSTube-VMI`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Rutina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Rutina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CROSSTube-VMI`.`Tiene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CROSSTube-VMI`.`Tiene` (
  `id_rutina` INT NOT NULL,
  `id_ejercicio` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  PRIMARY KEY (`id_rutina`, `id_ejercicio`),
  INDEX `fk_Rutina_has_Ejercicio_Ejercicio1_idx` (`id_ejercicio` ASC) VISIBLE,
  INDEX `fk_Rutina_has_Ejercicio_Rutina1_idx` (`id_rutina` ASC) VISIBLE,
  INDEX `fk_Tiene_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rutina_has_Ejercicio_Rutina1`
    FOREIGN KEY (`id_rutina`)
    REFERENCES `CROSSTube-VMI`.`Rutina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rutina_has_Ejercicio_Ejercicio1`
    FOREIGN KEY (`id_ejercicio`)
    REFERENCES `CROSSTube-VMI`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tiene_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `CROSSTube-VMI`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
