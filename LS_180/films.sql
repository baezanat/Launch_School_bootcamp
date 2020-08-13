DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');  
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');  
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');  

/* Reutrn all rows in the films table */
SELECT * FROM films;

/* Return all rows in the films table with a title < 12 letters */
SELECT * FROM films WHERE length(title) < 12;

/* Add two columns, one for 'director' and another for 'duration' */
ALTER TABLE films ADD COLUMN director varchar(255);
ALTER TABLE films ADD COLUMN duration integer;

/* update data */
UPDATE films
  SET director = 'John McTiernan',
      duration = 132
  WHERE title = 'Die Hard';
UPDATE films
  SET director = 'Michael Curtiz',
      duration = 102
  WHERE title = 'Casablanca';
UPDATE films
  SET director = 'Francis Ford Coppola',
      duration = 113
  WHERE title = 'The Conversation';

/* insert new records */
INSERT INTO films (title, year, genre, director, duration)
  VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
         ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Thomas Alfredson', 127),
         ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

/* Return the title and age in years of each movie, with newest movies listed first */
SELECT title, 
      date_part('year', current_date) - "year" AS "age"
  FROM films
  ORDER BY "age" ASC;

/* Return the title and duration of each movie longer than 2 hours, longest first  */
SELECT title, duration
  FROM films
  WHERE duration > 120
  ORDER BY duration DESC;

/* Return the title of the longest film */
SELECT title
  FROM films
  ORDER BY duration DESC
  LIMIT 1;
