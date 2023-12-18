# Part 1
## Q1

<br>SELECT * from customers WHERE ctr_number = 'c01986'
<br>

## Q2
<br>SELECT first_name, last_name, ctr_number, current_balance FROM customers WHERE current_balance > 100;<br>

## Q3
<br>SELECT id, odr_date, odr_time FROM orders WHERE odr_date < TO_DATE('2019-05-28', 'YYYY-MM-DD');<br>

# Part 2
## Q1 

<br>SELECT id, cost, units  FROM inventory_list WHERE cost between 3.00 and 15.00;<br>

# Part 3
## Q1 

<br>SELECT id, cost, units  FROM inventory_list WHERE units IN (50,100,150,200) ;<br>

# Part 4
## Q1

<br>SELECT id, cost, units  FROM inventory_list WHERE units NOT IN (50,100,150,200) ;<br>

# Part 5
## Q1

<br>SELECT itm_number, name
FROM items
WHERE name LIKE 'G%' ;
<br>

# Part 6
## Q1

<br>SELECT itm_number, name
FROM items
WHERE name LIKE '_o%' ;<br>