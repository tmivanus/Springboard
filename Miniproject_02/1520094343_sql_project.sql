/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


Booking: memid, facid, starttime, bookid, slots
Facilities: facid, guestcost, name, membercost, initialoutlay, monthlymaintenance
Members: memid, surname, firtname, address, zipcode, telephone, recommendedby, joindate



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT facid,
       name,
       MAX(membercost) AS 'max_membercost',
       MIN(membercost) AS 'min_membercost'
       -- Checking just in case if same facid has different prices. 
FROM Facilities
WHERE membercost IS NOT NULL AND membercost > 0
GROUP BY 1 ORDER BY 3, 4



/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT(DISTINCT facid)
FROM Facilities
WHERE membercost IS NULL OR membercost = 0



/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid,
       name,
       membercost,
       monthlymaintenance,
       membercost/monthlymaintenance AS costpermaintenance
FROM Facilities
WHERE membercost/monthlymaintenance < 0.2
ORDER BY 5



/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT *
FROM Facilities
WHERE facid NOT BETWEEN 2 AND 4
      AND facid >=1 AND facid <= 5



/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT facid,
       name,
       monthlymaintenance,
       CASE WHEN monthlymaintenance > 100 THEN 'expensive'
            ELSE 'cheap' END AS typemaintenance
FROM Facilities
ORDER BY 3



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT surname,
       firstname
FROM Members
WHERE joindate = (select MAX(joindate) FROM Members)



/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT CONCAT(m.firstname, ' ', m.surname) AS membername,
       COUNT(CASE WHEN f.name = 'Tennis Court 1' THEN f.name ELSE NULL END) AS tennis_court_1,
       COUNT(CASE WHEN f.name = 'Tennis Court 2' THEN f.name ELSE NULL END) AS tennis_court_2
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE f.name LIKE 'Tennis%' AND m.firstname != 'GUEST'
GROUP BY 1
ORDER BY 1



/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT b.starttime,
       b.bookid,
       f.name, 
       CONCAT(m.firstname, ' ', m.surname) AS membername,
       CASE WHEN b.memid = 0 THEN 2*b.slots*f.guestcost 
            ELSE 2*b.slots*f.membercost END AS bookcost
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE b.starttime LIKE '2012-09-14%'
      AND CASE WHEN b.memid = 0 THEN 2*b.slots*f.guestcost
               ELSE 2*b.slots*f.membercost END > 30
ORDER BY 5



/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT t.starttime,
       t.bookid,
       t.name, 
       CONCAT(m.firstname, ' ', m.surname) AS membername,
       t.bookcost
FROM (SELECT b.starttime,
             b.bookid,
             f.name,
             b.memid,    
             CASE WHEN b.memid = 0 THEN 2*b.slots*f.guestcost
                  ELSE 2*b.slots*f.membercost END AS bookcost
      FROM Bookings b
      JOIN Facilities f ON b.facid = f.facid
      WHERE b.starttime LIKE '2012-09-14%'
            AND CASE WHEN b.memid = 0 THEN 2*b.slots*f.guestcost
                ELSE 2*b.slots*f.membercost END > 30) t
JOIN Members m ON t.memid = m.memid  
ORDER BY 5



/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT name, 
       bookcost
FROM (SELECT f.name, 
             SUM(CASE WHEN b.memid = 0 THEN 2*b.slots*f.guestcost 
                      ELSE 2*b.slots*f.membercost END) AS bookcost
      FROM Bookings b
      JOIN Facilities f ON b.facid = f.facid
      GROUP BY 1) t
WHERE bookcost < 1000
ORDER BY 2 DESC
