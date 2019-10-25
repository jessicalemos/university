
-- ------------------------------------------------------
-- ------------------------------------------------------
-- Universidade do Minho
-- Mestrado Integrado em Engenharia Inform√°tica
-- Lincenciatura em Ci√™ncias da Computa√ß√£o
-- Unidade Curricular de Bases de Dados
-- 
-- Caso de Estudo: A Mercearia da D. Acácia
-- Criação do Esquema Físico
-- Outubro/2017
-- ------------------------------------------------------
-- ------------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Mercearia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mercearia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Mercearia` ;

-- -----------------------------------------------------
-- Table `Mercearia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`Cliente` (
  `Numero` INT NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `DataNascimento` DATETIME NULL,
  `Profissao` VARCHAR(75) NULL,
  `Rua` VARCHAR(75) NOT NULL,
  `Localidade` VARCHAR(50) NOT NULL,
  `CodPostal` VARCHAR(75) NOT NULL,
  `Contribuinte` INT NOT NULL,
  `eMail` VARCHAR(100) NULL,
  `Compras` VARCHAR(45) NULL,
  `RecomendadoPor` INT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Cliente_Cliente1_idx` (`RecomendadoPor` ASC),
  CONSTRAINT `fk_Cliente_Cliente1`
    FOREIGN KEY (`RecomendadoPor`)
    REFERENCES `Mercearia`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`Venda` (
  `Numero` INT NOT NULL,
  `Data` DATETIME NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  `Total` DECIMAL(8,2) NOT NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Venda_Cliente_idx` (`Cliente` ASC),
  CONSTRAINT `fk_Venda_Cliente`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Mercearia`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`Produto` (
  `Numero` INT NOT NULL,
  `Designacao` VARCHAR(75) NOT NULL,
  `Unidade` CHAR(3) NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Tipo` VARCHAR(50) NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`VendaProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`VendaProduto` (
  `Venda` INT NOT NULL,
  `Produto` INT NOT NULL,
  `Quantidade` DECIMAL(5,2) NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Valor` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`Venda`, `Produto`),
  INDEX `fk_VendaProduto_Produto1_idx` (`Produto` ASC),
  CONSTRAINT `fk_VendaProduto_Venda1`
    FOREIGN KEY (`Venda`)
    REFERENCES `Mercearia`.`Venda` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VendaProduto_Produto1`
    FOREIGN KEY (`Produto`)
    REFERENCES `Mercearia`.`Produto` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`ClienteTelefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`ClienteTelefones` (
  `Cliente` INT NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente`, `Telefone`),
  INDEX `fk_ClienteTelefones_Cliente1_idx` (`Cliente` ASC),
  CONSTRAINT `fk_ClienteTelefones_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Mercearia`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`Dourado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`Dourado` (
  `Cliente` INT NOT NULL,
  `Plafond` DECIMAL(8,2) NOT NULL,
  `Desconto` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`Cliente`),
  INDEX `fk_Dourado_Cliente1_idx` (`Cliente` ASC),
  CONSTRAINT `fk_Dourado_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Mercearia`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mercearia`.`ClienteCupões`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mercearia`.`ClienteCupoes` (
  `Cliente` INT NOT NULL,
  `NRCupao` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Desconto` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Cliente`, `NRCupao`),
  CONSTRAINT `fk_ClienteCupoes_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Mercearia`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- ------------------------------------------------------
-- <fim>
-- ------------------------------------------------------
