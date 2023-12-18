# DML Part 6

## Part 1
### Question 1

```
SELECT ROWNUM as "Customer Name", first_name, last_name FROM (SELECT first_name, last_name FROM customers ORDER BY ctr_number) WHERE ROWNUM <= 3;
```

## Part 2
### Question 1

```
SELECT first_name as "First Name", last_name as "Last Name" FROM sales_representatives ORDER BY last_name WHERE comission_rate = :comission_rate
```