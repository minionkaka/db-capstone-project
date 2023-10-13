-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema litlemdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema litlemdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `litlemdb` DEFAULT CHARACTER SET utf8 ;
USE `litlemdb` ;

-- -----------------------------------------------------
-- Table `litlemdb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NULL,
  `CustomerLastName` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  `ContactNumber` INT(10) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Staff` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Staff` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  `ContactNumber` INT(10) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Address` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Address` (
  `AddressID` INT NOT NULL,
  `StreetAddress` VARCHAR(255) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Booking` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Booking` (
  `BookingID` INT NOT NULL,
  `BookingSlot` DATETIME NULL,
  `CustomerID` INT NULL,
  `StaffID` INT NULL,
  `AddressID` INT NULL,
  `Total Price` VARCHAR(45) NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `litlemdb`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `litlemdb`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `litlemdb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `DeliveryStatus` VARCHAR(20) NULL,
  `AddressID` INT NULL,
  `BookingID` INT NULL,
  `TotalPrice` DECIMAL NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `litlemdb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `litlemdb`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Menu` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemName` VARCHAR(45) NULL,
  `MenuItemDescription` VARCHAR(255) NULL,
  `MenuPriceItem` DECIMAL NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litlemdb`.`Order Menu Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `litlemdb`.`Order Menu Items` ;

CREATE TABLE IF NOT EXISTS `litlemdb`.`Order Menu Items` (
  `OrderMenuItemsID` INT NOT NULL,
  `OrderID` INT NULL,
  `MenuID` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderMenuItemsID`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `litlemdb`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `litlemdb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
