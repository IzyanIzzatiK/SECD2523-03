# DML Part 4

## Part 1
### Question 1

```
SELECT 'The ' || name || ' team has '|| number_of_players || ' players and does not receive a discount.' as  "Team Information" FROM teams WHERE discount IS NULL
```


### Question 2

```
SELECT 'The ' || name || ' team has '|| number_of_players || ' players and receives a discount of ' || discount || ' percent' as  "Team Information" FROM teams WHERE discount IS NOT NULL
```

## Part 2

```
SELECT ctr_number as "Customer Number", address_line_1 as "Street Address", zip_code as "Postal Code" FROM customers_addresses WHERE city = 'Liverpool' AND address_line_2 = 'Starford'
```

## Part 3
```
SELECT ctr_number as "Customer Number", address_line_1 as "Street Address", zip_code as "Postal Code" FROM customers_addresses WHERE city = 'Liverpool' OR address_line_2 = 'Starford'
```

## Part 4
```
SELECT ctr_number as "Customer Number", address_line_1 as "Street Address", zip_code as "Postal Code" FROM customers_addresses WHERE city != 'Liverpool' 
```



