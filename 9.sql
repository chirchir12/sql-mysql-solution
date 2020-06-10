-- How many stops are in the database.
SELECT COUNT(id)
FROM stops

-- Find the id value for the stop 'Craiglockhart'

select id
from stops
where name='Craiglockhart'

-- Give the id and the name for the stops on the '4' 'LRT' service.

SELECT stops.id, stops.name
FROM stops
    INNER JOIN route ON stop = stops.id
WHERE num = 4 AND company = 'LRT'

-- The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num
FROM route a
    JOIN route b
    ON (a.company = b.company AND a.num = b.num)
    JOIN stops stopa ON (a.stop = stopa.id)
    JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Haymarket' AND stopb.name = 'Leith'
GROUP BY company, num

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a
    JOIN route b
    ON a.company = b.company AND a.num = b.num
    JOIN stops stopa ON a.stop = stopa.id
    JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
GROUP BY a.company, a.num

-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT stopb.name, a.company, a.num
FROM route a
    JOIN route b ON (a.company = b.company AND a.num = b.num)
    JOIN stops stopa ON stopa.id = a.stop
    JOIN stops stopb ON stopb.id = b.stop
WHERE a.company = 'LRT' AND stopa.name = 'Craiglockhart'
GROUP BY company, num, name
ORDER BY stopb.name ASC