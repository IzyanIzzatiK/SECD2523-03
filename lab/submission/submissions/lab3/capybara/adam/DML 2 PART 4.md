# Part 1
## Q1
<br>SELECT 'The ' || name || ' team has '|| number_of_players || ' players and does not receive a discount.' as  "Team Information" FROM teams WHERE discount IS NULL<br

## Q2
<br>SELECT 'The ' || name || ' team has '|| number_of_players || ' players and receives a discount of ' || discount || ' percent' as  "Team Information" FROM teams WHERE discount IS NOT NULL
<br>

# Part 2
## Q1
<br>SELECT ctr_number as "Customer Number" ,address_line_1 as "Street Address", zip_code as "Postal Code"
FROM CUSTOMERS_ADDRESSES
WHERE address_line_2 = 'Starford'
AND city = 'Liverpool' ;<br>

# Part 3
## Q1
<br>SELECT ctr_number as "Customer Number" ,address_line_1 as "Street Address", zip_code as "Postal Code"
FROM CUSTOMERS_ADDRESSES
WHERE address_line_2 = 'Starford'
OR city = 'Liverpool' ;<br>

# Part 4
## Q1
<br>SELECT ctr_number as "Customer Number" ,address_line_1 as "Street Address", zip_code as "Postal Code"
FROM CUSTOMERS_ADDRESSES
WHERE city NOT IN 'Liverpool' ;<br>

