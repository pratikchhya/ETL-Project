-- Create table 1
create table parking_cars(
ticket_id float primary key,
entity float not null,
car_make varchar not null,
total_tickets int not null)
;

-- Create table 2
create table parking_fines (
ticket_id float primary key,
    fine float not NULL,
    amount_paid FLOAT not NULL,
    date_issued DATE not NULL,
    issue_time TIME not NULL
);

-- Create table 3
create table parking_location (
ticket_id float primary key,
latitude FLOAT NOT null,
longitude FLOAT NOT null
);

select * from parking_location;
select * from parking_cars;
select * from parking_fines;

-- Join Tables
SELECT r.ticket_id, r.entity, r.car_make, r.total_tickets, f.fine, f.amount_paid, f.date_issued, f.issue_time, l.latitude, l.longitude
FROM parking_cars as r
JOIN parking_fines as f
ON r.ticket_id = f.ticket_id
JOIN parking_location as l
ON r.ticket_id = l.ticket_id;

-- How many tickets were issued in 2017?
SELECT COUNT(ticket_id) FROM parking_fines
WHERE date_issued >= '2017-01-01'
AND date_issued < '2018-01-01';
    
-- How many tickets were issued in 2018?
SELECT COUNT(ticket_id) FROM parking_fines
WHERE date_issued >= '2018-01-01'
AND date_issued < '2019-01-01';

-- Average ticket fine amount?
SELECT AVG(fine) FROM parking_fines;

-- Most popular car?
SELECT car_make, COUNT(car_make) from parking_cars
    GROUP BY car_make
    ORDER BY count(car_make) desc;
    
-- When are tickets most likely to be issued?
SELECT COUNT(issue_time) from parking_fines
    WHERE issue_time >= '12:00 AM'
    AND issue_time < '06:00 AM';

SELECT COUNT(issue_time) from parking_fines
    WHERE issue_time >= '06:00 AM'
    AND issue_time < '12:00 PM';

SELECT COUNT(issue_time) from parking_fines
    WHERE issue_time >= '12:00 PM'
    AND issue_time < '06:00 PM';
    
SELECT COUNT(issue_time) from parking_fines
    WHERE issue_time >= '06:00 PM'
    AND issue_time < '12:00 AM';

-- Which number plate got the most ticket violations from 2017-2018?
SELECT entity, COUNT(entity) AS "frequency"
FROM parking_cars
GROUP BY entity
ORDER BY frequency DESC;
