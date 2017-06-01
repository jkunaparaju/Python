CREATE TABLE `activity` (
  `activit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(45) NOT NULL,
  `Instructor` varchar(45) NOT NULL,
  `time-slots` varchar(45) DEFAULT NULL,
  `activity_code` varchar(15) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`activit_id`),
  KEY `program_id_fk_idx` (`program_id`),
  CONSTRAINT `program_id_fk` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `client_family` (
  `client_family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `realtion` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_family_id`),
  KEY `client_id_fk_idx` (`client_id`),
  KEY `family_id_fk_idx` (`family_id`),
  CONSTRAINT `fam_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fam_client_id_fk2` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `client_program` (
  `client_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `programi_d` int(11) NOT NULL,
  PRIMARY KEY (`client_program_id`),
  UNIQUE KEY `client_program_id_UNIQUE` (`client_program_id`),
  KEY `client_fk_idx` (`client_id`),
  KEY `program_fk_idx` (`programi_d`),
  CONSTRAINT `client_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_fk` FOREIGN KEY (`programi_d`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_info` varchar(500) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `last_updated` datetime NOT NULL,
  `allow_mail` binary(1) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `client_fam_fk_idx` (`family_id`),
  CONSTRAINT `client_fam_fk` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `family` (
  `family_id` int(11) NOT NULL,
  `family_name` varchar(45) NOT NULL,
  `active_members` int(2) DEFAULT NULL,
  PRIMARY KEY (`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `mem_registration` (
  `mem_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_date` date NOT NULL,
  `receipt_number` int(11) NOT NULL,
  `fee_paid` varchar(45) NOT NULL,
  `family_id` int(11) DEFAULT NULL,
  `not_renew_desc` varchar(500) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `mem_type` tinyint(1) DEFAULT NULL,
  `family_members` int(11) DEFAULT NULL,
  PRIMARY KEY (`mem_reg_id`,`fee_paid`),
  KEY `client_id_fk_idx` (`client_id`),
  CONSTRAINT `client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `Program_name` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `time` time(4) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `class_size` int(11) DEFAULT NULL,
  `year` date DEFAULT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `program_registration` (
  `prog_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `program_name` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`prog_reg_id`),
  UNIQUE KEY `progregid_UNIQUE` (`prog_reg_id`),
  KEY `program_id_fk_idx` (`program_id`),
  KEY `prog_reg_client_fk_idx` (`client_id`),
  CONSTRAINT `prog_reg_client_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prog_reg_prog_fk` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `social_registration` (
  `social_reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL,
  `program_name` varchar(45) NOT NULL,
  `program_id` int(11) NOT NULL,
  `progress_notes` varchar(45) DEFAULT NULL,
  `demographic` varchar(45) DEFAULT NULL,
  `open_date` date NOT NULL,
  `close_date` date DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`social_reg_id`),
  KEY `sc_client_fk_idx` (`client_id`),
  KEY `sc_program_fk_idx` (`program_id`),
  CONSTRAINT `sc_client_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sc_program_fk` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


