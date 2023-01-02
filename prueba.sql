-- MySQL Script generated by MySQL Workbench
-- Mon Jan  2 20:27:43 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `ID` INT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  `imagen` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `mydb`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudio` (
  `ID` INT NULL AUTO_INCREMENT,
  `escuela` VARCHAR(30) NOT NULL,
  `fecha_inicio` VARCHAR(255) NULL,
  `fecha_fin` VARCHAR(32) NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `usuarios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `usuarios_ID`),
  INDEX `fk_estudio_usuarios_idx` (`usuarios_ID` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_usuarios`
    FOREIGN KEY (`usuarios_ID`)
    REFERENCES `mydb`.`usuarios` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia_laboral` (
  `ID` INT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(30) NOT NULL,
  `fecha_inicio` VARCHAR(255) NULL,
  `fecha_fin` VARCHAR(32) NOT NULL,
  `trabajo` VARCHAR(45) NULL,
  `usuarios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `usuarios_ID`),
  INDEX `fk_estudio_usuarios_idx` (`usuarios_ID` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_usuarios0`
    FOREIGN KEY (`usuarios_ID`)
    REFERENCES `mydb`.`usuarios` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidades` (
  `ID` INT NULL AUTO_INCREMENT,
  `area` VARCHAR(30) NOT NULL,
  `porcentaje` INT NULL,
  `usuarios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `usuarios_ID`),
  INDEX `fk_estudio_usuarios_idx` (`usuarios_ID` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_usuarios1`
    FOREIGN KEY (`usuarios_ID`)
    REFERENCES `mydb`.`usuarios` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyectos` (
  `ID` INT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(30) NOT NULL,
  `sector` VARCHAR(30) NOT NULL,
  `tiempoEjecucion` VARCHAR(45) NULL,
  `usuarios_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `usuarios_ID`),
  INDEX `fk_estudio_usuarios_idx` (`usuarios_ID` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_usuarios10`
    FOREIGN KEY (`usuarios_ID`)
    REFERENCES `mydb`.`usuarios` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
