drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- 2) load the data from CSV
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:\Users\kyila\OneDrive\Documents\Ironhack training\may2024\week 3\day_3_3\films_2020.csv'
INTO TABLE films_2020
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, description, release_year, language_id, original_language_id, length, rating);

-- it didnt workout 

-- Check if local_infile is enabled
SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;
-- Load data from the local file
LOAD DATA LOCAL INFILE '"C:\Users\kyila\OneDrive\Documents\Ironhack training\may2024\week 3\day_3_3\films_2020.csv"'
INTO TABLE films_2020
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, description, release_year, language_id, original_language_id, length, rating);

-- got error message 02:19:32	LOAD DATA LOCAL INFILE '"C:\Users\kyila\OneDrive\Documents\Ironhack training\may2024\week 3\day_3_3\films_2020.csv"' INTO TABLE films_2020 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (title, description, release_year, language_id, original_language_id, length, rating)	Error Code: 2068. LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.	0.000 sec
