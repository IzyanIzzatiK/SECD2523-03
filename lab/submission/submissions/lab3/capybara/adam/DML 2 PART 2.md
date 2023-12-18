#Part 1
## Q1

<br>select first_name, last_name, current_balance, current_balance/12 from customers;<br>

## Q2
<br>select first_name, last_name, current_balance, current_balance-5 from customers;<br>

## Q3
Because some people's balance is actually RM0 hence there is no benefit in giving RM5  gift card

# Part 2
## Q1

<br>SELECT FIRST_NAME "First Name", LAST_NAME "Last Name", CURRENT_BALANCE "Balance", current_balance/12 "Monthly Payment" FROM customers;<br>

# Part 3
## Q1
<br>SELECT name ||' team has '|| number_of_players || ' players and receives a discount of ' || discount || ' percent' AS "Team Information" FROM teams;<br>

## Q2
Because it's null
