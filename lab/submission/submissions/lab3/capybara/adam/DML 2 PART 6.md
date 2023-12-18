# Part 1
## Q1

<br>SELECT ROWNUM as "Customer Name", first_name, last_name FROM (SELECT first_name, last_name FROM customers ORDER BY ctr_number) WHERE ROWNUM <= 3;
<br>

# Part 2
## Q2
<br>SELECT first_name as "First Name", last_name as "Last Name" FROM sales_representatives ORDER BY last_name WHERE comission_rate = :comission_rate
<br>