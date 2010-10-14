SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `litepost` DEFAULT CHARACTER SET latin1 ;

-- -----------------------------------------------------
-- Table `litepost`.`bookmarks`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `litepost`.`bookmarks` (
  `bookmarkID` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(80) NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`bookmarkID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `litepost`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `litepost`.`users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT ,
  `fname` VARCHAR(30) NOT NULL ,
  `lname` VARCHAR(30) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `username` VARCHAR(20) NOT NULL ,
  `password` VARCHAR(20) NOT NULL ,
  `role` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`userID`) ,
  INDEX `users_login_IX` (`username` ASC, `password` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `litepost`.`entries`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `litepost`.`entries` (
  `entryID` INT(11) NOT NULL AUTO_INCREMENT ,
  `userID` INT(11) NOT NULL ,
  `categoryID` INT(11) NOT NULL ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `body` TEXT NOT NULL ,
  `createdat` DATETIME NOT NULL COMMENT '	' ,
  `updatedat` DATETIME NOT NULL ,
  PRIMARY KEY (`entryID`) ,
  INDEX `entries_userID_fk` (`userID` ASC) ,
  INDEX `entries_categoryID_ix` (`categoryID` ASC) ,
  CONSTRAINT `entries_userID_fk`
    FOREIGN KEY (`userID` )
    REFERENCES `litepost`.`users` (`userID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `litepost`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `litepost`.`categories` (
  `categoryID` INT(11) NOT NULL AUTO_INCREMENT ,
  `category` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`categoryID`) ,
  INDEX `categoryid` (`categoryID` ASC) ,
  CONSTRAINT `categoryid`
    FOREIGN KEY (`categoryID` )
    REFERENCES `litepost`.`entries` (`categoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `litepost`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `litepost`.`comments` (
  `commentID` INT(11) NOT NULL AUTO_INCREMENT ,
  `entryID` INT(11) NOT NULL ,
  `comment` TEXT NOT NULL ,
  `name` VARCHAR(80) NOT NULL ,
  `email` VARCHAR(100) NULL DEFAULT NULL ,
  `url` VARCHAR(150) NULL DEFAULT NULL ,
  `createdat` DATETIME NOT NULL ,
  PRIMARY KEY (`commentID`) ,
  INDEX `comments_entryID_ix` (`entryID` ASC) ,
  CONSTRAINT `comments_entryD_pk`
    FOREIGN KEY (`entryID` )
    REFERENCES `litepost`.`entries` (`entryID` ))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
