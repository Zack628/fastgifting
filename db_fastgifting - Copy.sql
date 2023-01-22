CREATE TABLE `clients_fastgifting` (
   `usernamecl` varchar(45) NOT NULL,
   `firstnamecl` varchar(45) NOT NULL,
   `lastnamecl` varchar(45) NOT NULL,
   `emailcl` varchar(45) NOT NULL,
   `passwordcl` varchar(45) NOT NULL,
   `citycl` varchar(45) NOT NULL,
   `addresscl` varchar(45) NOT NULL,
   `postalcodecl` varchar(45) NOT NULL,
   `phonecl` varchar(45) NOT NULL,
    PRIMARY KEY (`usernamecl`),
    UNIQUE KEY `email_UNIQUE` (`emailcl`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 CREATE TABLE `couriers_fastgifting` (
   `usernameco` varchar(45) NOT NULL,
   `firstnameco` varchar(45) NOT NULL,
   `lastnameco` varchar(45) NOT NULL,
   `emailco` varchar(45) NOT NULL,
   `passwordco` varchar(45) NOT NULL,
   `cityco` varchar(45) NOT NULL,
   `phoneco` varchar(45) NOT NULL,
   `maxWeightco` float NOT NULL,
   `maxVolumeco` float NOT NULL,
   `availability` int(10) NOT NULL,
    PRIMARY KEY (`usernameco`),
    UNIQUE KEY `email_UNIQUE` (`emailco`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
  CREATE TABLE `shipments_fastgifting` (
     `shipid` varchar(45) NOT NULL,
     `startingpoint` varchar(45) NOT NULL,
     `destination` varchar(45) NOT NULL,
     `postalcodesh` varchar(45) NOT NULL,
     `shipDate` varchar(45) NOT NULL,
     `weight` float NOT NULL,
     `volume` float NOT NULL,
     `statusOfCompletion` int(10) NOT NULL,
     `usernamecl_fk` varchar(45) NOT NULL,
     `usernameco_fk` varchar(45) NOT NULL,
     PRIMARY KEY (`shipid`),
     CONSTRAINT `FK_shipments_fastgifting1` FOREIGN KEY (`usernamecl_fk`) REFERENCES `clients_fastgifting` (`usernamecl`),
     CONSTRAINT `FK_shipments_fastgifting2` FOREIGN KEY (`usernameco_fk`) REFERENCES `couriers_fastgifting` (`usernameco`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  CREATE TABLE `reviews_fastgifting` (
     `usernamecl_fk` varchar(45) NOT NULL,
     `usernameco_fk` varchar(45) NOT NULL,
     `comment` varchar(800) NOT NULL,
     `speed` varchar(45) NOT NULL,
     `professionalism` varchar(45) NOT NULL,
     `friendliness` varchar(45) NOT NULL,
     `reviewDate` varchar(45) NOT NULL,
     CONSTRAINT `FK_reviews_fastgifting1` FOREIGN KEY (`usernamecl_fk`) REFERENCES `clients_fastgifting` (`usernamecl`),
     CONSTRAINT `FK_reviews_fastgifting2` FOREIGN KEY (`usernameco_fk`) REFERENCES `couriers_fastgifting` (`usernameco`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  
  
  
  
  
