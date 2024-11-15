SELECT * FROM cd.facilities; 
SELECT * FROM cd.facilities WHERE membercost > 0;
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost > 0 
AND (membercost < monthlymaintenance/50.0);

SELECT * FROM cd.facilities 
WHERE name LIKE '%Tennis%';

SELECT * FROM cd.facilities WHERE facid IN (1,5);

SELECT memid, surname, firstname, joindate FROM cd.facilities
WHERE joindate >= '2012-09-01';

SELECT DISTINCT surname FROM cd.members
ORDER BY surname LIMIT 10;

SELECT joindate FROM cd.facilities
ORDER BY joindate LIMIT 1;
-- alternative: 
SELECT MAX(joindate) AS latest_signup FROM cd.members;

SELECT COUNT(*) FROM cd.facilities WHERE guestcost >= 10;

SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings 
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' 
GROUP BY facid ORDER BY SUM(slots);

SELECT facid, sum(slots) AS total_slots FROM cd.bookings 
GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid;

SELECT cd.bookings.starttime AS start, cd.facilities.name AS name 
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21' 
AND cd.bookings.starttime < '2012-09-22' 
ORDER BY cd.bookings.starttime;

SELECT cd.bookings.starttime FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname='David' 
AND cd.members.surname='Farrell';

SELECT * FROM world.city;
SELECT * FROM world.countrylanguage;

USE world; -- switch to different schema in mysql
SELECT Name, countrylanguage.Language, countrylanguage.CountryCode FROM city
INNER JOIN countrylanguage 
ON city.CountryCode = countrylanguage.CountryCode
WHERE countrylanguage.CountryCode = 'POL';



