-- write your queries here


 SELECT * FROM owners FULL OUTER JOIN vehicles ON owners.last_name = vehicles.make;
 id | first_name | last_name | id |  make  |  model  | year |  price   | owner_id
----+------------+-----------+----+--------+---------+------+----------+----------
  1 | Bob        | Hope      |    |        |         |      |          |
  2 | Jane       | Smith     |    |        |         |      |          |
  3 | Melody     | Jones     |    |        |         |      |          |
  4 | Sarah      | Palmer    |    |        |         |      |          |
  5 | Alex       | Miller    |    |        |         |      |          |
  6 | Shana      | Smith     |    |        |         |      |          |
  7 | Maya       | Malarkin  |    |        |         |      |          |
    |            |           | 10 | Honda  | Civic   | 2001 |  7999.99 |        5
    |            |           |  2 | Honda  | Civic   | 2012 | 12999.99 |        1
    |            |           | 14 | BMW    | 700     | 2015 | 52999.99 |        6
    |            |           | 13 | BMW    | 300     | 2012 | 22999.99 |        6
    |            |           | 12 | Lexus  | ES350   | 1998 |  1599.99 |        6
    |            |           |  7 | GMC    | Yukon   | 2014 | 22999.99 |        4
    |            |           |  6 | GMC    | Yukon   | 2016 | 12999.99 |        3
    |            |           | 11 | Nissan | Altima  | 1999 |  1899.99 |        6
    |            |           |  3 | Nissan | Altima  | 2016 | 23999.99 |        2


SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) AS vehicle_count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY owners.first_name ASC;
 first_name | last_name | vehicle_count
------------+-----------+---------------
 Alex       | Miller    |             1
 Bob        | Hope      |             2
 Jane       | Smith     |             2
 Maya       | Malarkin  |             0
 Melody     | Jones     |             2
 Sarah      | Palmer    |             3
 Shana      | Smith     |             4
(7 rows)

SELECT owners.first_name, owners.last_name, AVG(vehicles.price) AS average_price, COUNT(vehicles.id) AS vehicle_count
FROM owners
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY owners.first_name DESC;
 first_name | last_name |   average_price    | vehicle_count
------------+-----------+--------------------+---------------
 Shana      | Smith     | 19874.989624023438 |             4
 Sarah      | Palmer    | 16333.323567708334 |             3
 Melody     | Jones     | 7799.9901123046875 |             2
 Jane       | Smith     |    14999.990234375 |             2
 Bob        | Hope      | 7999.9901123046875 |             2
 Alex       | Miller    |     7999.990234375 |             1
(6 rows)
