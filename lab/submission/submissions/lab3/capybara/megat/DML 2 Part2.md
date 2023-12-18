# DML Part 2

## Part 1
### Question 1

```  
SELECT first_name, last_name, current_balance, current_balance/12 as monthly_payment  FROM customers  
```

### Question 2

```
SELECT first_name, last_name, ctr_number, current_balance, current_balance - 5 as minusGiftCard FROM customers
```

### Question 3
One of them has -5 value :(


![Alt text](image-1.png)

## Part 2

```
SELECT first_name as "First Name", last_name as "Last Name", current_balance as "Current Balance", current_balance/12 as "Monthly Repayments" FROM customers
```

### Part 3

### Question 1

```
SELECT 'The ' || name || ' team has '|| number_of_players || ' players and receive a discount of ' || discount || ' percent.'  as  "Team Information" FROM teams
```

### Question 2

Because that its discount value is NULL



