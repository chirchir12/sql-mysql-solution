-- SQL command to show the name, continent and population of all countries.
SELECT name, continent, population
FROM world
-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name
FROM world
WHERE population >= 200000000
-- ive the name and the per capita GDP for those countries with a population of at least 200 million
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
select name, population/1000000
from world
where continent='South America'

-- Show the name and population for France, Germany, Italy
select name, population
from world
where name in ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
select name
from world
where name like '%United%'

-- Show the countries that are big by area or big by population. Show name, population and area.
select name, population, area
from world
where area>3000000 or population >250000000;

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
select name, population, area
from world
where area>3000000 and not  population >250000000 or population >250000000 and not area>3000000

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
select name, round(population/1000000, 2), round(gdp/1000000000, 2)
from world
where continent='South America';
-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp >= 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
from world
where length(name)=length(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
from world
where left(name,1)=left(capital,1) and capital<>name

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name  LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';