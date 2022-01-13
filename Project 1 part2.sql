select * from `Genre`;

select Title, author, SeriesName as Series from `Book`;

select distinct `first_Book` from `Series` where exists (select uniqueSeriesID from `Series` where uniqueSeriesID = 3745);

select `SeriesName` from `Book` UNION select `Series_name` from `Series` ORDER by `SeriesName`;

select `Series_name`, `first_Book` from `Series` GROUP BY `first_Book` HAVING COUNT(uniqueSeriesID) >= 0;

-- PROCEDURE --
drop procedure if exists updateGenre;
DELIMITER $$

CREATE PROCEDURE updateGenre ()
BEGIN
UPDATE `Genre` set genreType="Fantasy juvenile"
where uniqueGenreID < 8000;

UPDATE `Genre` set genreType="Fantasy Young Adult"
where uniqueGenreID > 8000;

END $$
DELIMITER ;
call updateGenre ();
-- END --


-- VIEW --
drop view if exists Book_View;

CREATE VIEW Book_View AS
select `Book`.`author` as 'Author Name',
	`Book`.`Title` as 'Book Title',
    `Book`.`SeriesName` as 'Series',
    `Book`.publisher as 'Publisher'
FROM `Book`
	INNER JOIN Publisher Publisher on Publisher.publisherName = `Book`.publisher;

-- END --

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `Publisher`;
SET FOREIGN_KEY_CHECKS=1;
