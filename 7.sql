-- List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr=1962

-- Give year of 'Citizen Kane'.
select yr
from movie
where title='Citizen Kane'

-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr
-- What id number does the actor 'Glenn Close' have?
select id
from actor
where name='Glenn Close'

-- What is the id of the film 'Casablanca'
select id
from movie
where title='Casablanca'

-- Obtain the cast list for 'Casablanca'.
SELECT actor.name
FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
WHERE title = 'Casablanca'

-- Obtain the cast list for the film 'Alien'
SELECT actor.name
FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON movie.id = casting.movieid
WHERE title = 'Alien'

-- List the films in which 'Harrison Ford' has appeared

SELECT movie.title
FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford'


-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT movie.title
FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford' and casting.ord!=1

-- List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
where movie.yr=1962 and casting.ord=1

-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr, COUNT(title)
FROM
    movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-- --List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT movie.title, actor.name
FROM movie
    JOIN casting ON casting.movieid = movie.id
    JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1 AND movie.id IN (
SELECT movieid
    FROM casting
    WHERE actorid = 179)

-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name
FROM actor
    INNER JOIN casting
    ON casting.actorid = actor.id
    INNER JOIN movie
    ON casting.movieid = movie.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.movieid) >= 15


-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT movie.title, COUNT(casting.actorid) as actors
FROM movie
    JOIN casting
    ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY movie.title
ORDER BY actors DESC, movie.title ASC

