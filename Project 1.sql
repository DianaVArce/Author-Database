Use darcehe_cs355sp20;
SET FOREIGN_KEY_CHECKS=0;
drop table if exists `Authors`;
drop table if exists `Book`;
drop table if exists `Series`;
drop table if exists `Genre`;
drop table if exists `Publisher`;
SET FOREIGN_KEY_CHECKS=1;


CREATE TABLE `Authors`
(
	`name` VARCHAR(30) PRIMARY KEY,
    `description` VARCHAR(50),
    `uniqueID` BIGINT unique
);
CREATE TABLE `Book`
(
	`Title` VARCHAR(30) PRIMARY KEY,
    `datePublished` DATE,
    `totalPageCount` BIGINT,
	publisher VARCHAR(30) unique,
	`author` VARCHAR(30) unique,
    `SeriesName` VARCHAR(30) unique,
    foreign key(`author`) references `Authors`(`name`)
);
CREATE TABLE `Series`
(
	`Series_name` VARCHAR(30) PRIMARY KEY,
    `first_Book` VARCHAR(30) unique,
    uniqueSeriesID BIGINT unique,
    genre VARCHAR(60) unique,
    foreign key (`first_Book`) references `Book` (`Title`),
    foreign key (uniqueSeriesID) references `Authors`(`uniqueID`)
);

Create TABLE `Genre`
(
	genreType VARCHAR(90) ,
    uniqueGenreID BIGINT PRIMARY KEY
);

Create TABLE `Publisher`
(
	publisherName VARCHAR(80) PRIMARY KEY,
    uniquePubID BIGINT unique,
    foreign key (publisherName) references `Book`(publisher)
);

INSERT INTO `Authors` (`name`, `description`, `uniqueID`)
	VALUES
    ("Erin Hunter", "Author of Warriors", "3488");
INSERT INTO `Authors`(`name`, `description`, `uniqueID`)
	VALUES
    ("PC and Kristen Cast", "Co-authors of HoN", "8045");
INSERT INTO `Authors`(`name`, `description`, `uniqueID`)
	VALUES
    ("Melissa Dela Cruz", "Author of Descendants", "2099");
INSERT INTO `Authors`(`name`, `description`, `uniqueID`)
	VALUES
    ("Brian Jacques", "Author of Redwall", "8722");

INSERT INTO `Authors`(`name`, `description`, `uniqueID`)
	VALUES
    ("Takaya Kagami", "Author of Visual Novel", "5939");

INSERT INTO `Book`(`Title`, `datePublished`, `totalPageCount`, publisher, `author`, `SeriesName`)
	VALUES
    ("Into The Wild", "2003-01-21", "272", "HarperCollins", "Erin Hunter", "Warriors");

INSERT INTO `Book`(`Title`, `datePublished`, `totalPageCount`, publisher, `author`, `SeriesName`)
	VALUES
    ("Isle of The Lost", "2015-04-15", "310", "Scholastic Australia", "Melissa Dela Cruz", "Descendants");

INSERT INTO `Book`(`Title`, `datePublished`, `totalPageCount`, publisher, `author`, `SeriesName`)
	VALUES
    ("Marked", "2007-10-28", "306", "St. Martin's", "PC and Kristen Cast", "House of Night");

INSERT INTO `Book`(`Title`, `datePublished`, `totalPageCount`, publisher, `author`, `SeriesName`)
	VALUES
    ("Catasrophe at Sixteen", "2018-11-28", "338", "Vertical Inc", "Takaya Kagami", "Seraph of the End");

INSERT INTO `Book`(`Title`, `datePublished`, `totalPageCount`, publisher, `author`, `SeriesName`)
	VALUES
    ("Mossflower", "1988-03-23", "376", "Philomel Publisher", "Brian Jacques", "Redwall");
    

INSERT INTO `Series`(`Series_name`, `first_Book`, uniqueSeriesID, genre)
	VALUES
    ("Warriors", (select `Title` from `Book` where `author` = "Erin Hunter"), 3488, "Fantasy cats, young adult");

INSERT INTO `Series`(`Series_name`, `first_Book`, uniqueSeriesID, genre)
	VALUES
    ("Redwall", (select `Title` from `Book` where `author` = "Brian Jacques"), 8722, "Fantasy animals, young adult");

INSERT INTO `Series`(`Series_name`, `first_Book`, uniqueSeriesID, genre)
	VALUES
    ("House of Night", (select `Title` from `Book` where `author` = "PC and Kristen Cast"), 8045, "Fantasy - vampires, young adult");
    
INSERT INTO `Series`(`Series_name`, `first_Book`, uniqueSeriesID, genre)
	VALUES
    ("Descendants", (select `Title` from `Book` where `author` = "Melissa Dela Cruz"), 2099, "Fantasy, Coming of Age");

INSERT INTO `Series`(`Series_name`, `first_Book`, uniqueSeriesID, genre)
	VALUES
    ("Seraph of the End", (select `Title` from `Book` where `author` = "Takaya Kagami"), 5939, "Visual novel");

INSERT INTO `Genre`(genreType, uniqueGenreID)
	VALUES
    ((select genre from `Series` where `Series_name` = "Warriors"), 3488);
INSERT INTO `Genre`(genreType, uniqueGenreID)
	VALUES
    ((select genre from `Series` where `Series_name` = "Redwall"), 8722);
INSERT INTO `Genre`(genreType, uniqueGenreID)
	VALUES
    ((select genre from `Series` where `Series_name` = "Seraph of the End"), 5939);
INSERT INTO `Genre`(genreType, uniqueGenreID)
	VALUES
    ((select genre from `Series` where `Series_name` = "House of Night"), 8045);
INSERT INTO `Genre`(genreType, uniqueGenreID)
	VALUES
    ((select genre from `Series` where `Series_name` = "Descendants"), 2099);

INSERT INTO `Publisher`(publisherName, uniquePubID)
	VALUES
    ((select publisher from `Book` where `SeriesName` = "Redwall"), 8722);
INSERT INTO `Publisher`(publisherName, uniquePubID)
	VALUES
    ((select publisher from `Book` where `SeriesName` = "Descendants"), 2099);
INSERT INTO `Publisher`(publisherName, uniquePubID)
	VALUES
    ((select publisher from `Book` where `SeriesName` = "House of Night"), 8045);
INSERT INTO `Publisher`(publisherName, uniquePubID)
	VALUES
    ((select publisher from `Book` where `SeriesName` = "Warriors"), 3488);
INSERT INTO `Publisher`(publisherName, uniquePubID)
	VALUES
    ((select publisher from `Book` where `SeriesName` = "Seraph of the End"), 5939);