-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Schema ssafyschema

-- Schema ssafyschema

CREATE SCHEMA IF NOT EXISTS ssafyschema DEFAULT CHARACTER SET utf8 ;
USE ssafyschema ;

-- Table ssafyschema.members

CREATE TABLE IF NOT EXISTS ssafyschema.members (
  user_id VARCHAR(16) NOT NULL,
  user_name VARCHAR(20) NOT NULL,
  user_password VARCHAR(16) NOT NULL,
  PRIMARY KEY (user_id))
ENGINE = InnoDB;

drop table board;
-- Table ssafyschema.board
CREATE TABLE IF NOT EXISTS ssafyschema.board (
  article_no INT NOT NULL auto_increment,
  user_id VARCHAR(16) NULL DEFAULT NULL,
  title VARCHAR(100) NULL DEFAULT NULL,
  content VARCHAR(2000) NULL DEFAULT NULL,
  hit INT NULL DEFAULT '0',
  register_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (article_no),
  CONSTRAINT fk_board_members
    FOREIGN KEY (user_id)
    REFERENCES ssafyschema.members (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from board;
-- insert into members values('ssafy', 'name', '1234'); 