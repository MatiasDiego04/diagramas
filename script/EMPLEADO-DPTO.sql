-- MySQL Script generated by MySQL Workbench
-- Tue Feb 27 22:09:50 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `nif` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `cod_dpto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `localidad` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMP-DPTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMP-DPTO` (
  `nif` INT NOT NULL,
  `cod_dpto` VARCHAR(45) NULL,
  `Departamento_cod_dpto` INT NOT NULL,
  `Empleado_nif` INT NOT NULL,
  PRIMARY KEY (`nif`),
  CONSTRAINT `fk_EMP-DPTO_Departamento`
    FOREIGN KEY (`Departamento_cod_dpto`)
    REFERENCES `mydb`.`Departamento` (`cod_dpto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMP-DPTO_Empleado1`
    FOREIGN KEY (`Empleado_nif`)
    REFERENCES `mydb`.`Empleado` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EMP-DPTO_Departamento_idx` ON `mydb`.`EMP-DPTO` (`Departamento_cod_dpto` ASC) VISIBLE;

CREATE INDEX `fk_EMP-DPTO_Empleado1_idx` ON `mydb`.`EMP-DPTO` (`Empleado_nif` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
