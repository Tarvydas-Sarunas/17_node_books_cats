-- create table books

CREATE TABLE `type19_db`.`books` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `title` VARCHAR(255) NOT NULL , 
  `author` VARCHAR(255) NOT NULL , 
  `year` YEAR NOT NULL , 
  `cat_id` INT UNSIGNED NOT NULL , 
  PRIMARY KEY (`book_id`)) ENGINE = InnoDB;

-- create table categories
CREATE TABLE `type19_db`.`categories` (
  `cat_id` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
  `category` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`cat_id`)) ENGINE = InnoDB;
-- su stulpeliais cat_id, category, book_id

-- -add categories
INSERT INTO `categories` (`categoty`)
VALUES
('Comedy'),
('THriller'),
('Fantasy'),
('Detective'),
('Spiritual');

-- sukurti 5 knygas
INSERT INTO `books` (`title`, `author`, `year`, `cat_id`) VALUES 
('Book about Crime', 'James Band', '2015', '4'),
('1983', 'James Carr', '1983', '2'), 
('Little Prince', 'Jane Dow', '1999', '3'), 
('War and Peace', 'James Band', '1965', '2'), 
('Time is Money', 'Fabien Olicard', '2015', '5'), 
('do less', 'Kate Northrup', '2018', '5');