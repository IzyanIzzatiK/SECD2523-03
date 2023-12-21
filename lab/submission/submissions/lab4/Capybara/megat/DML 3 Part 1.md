# Part 1

## Question 1

```
SELECT * FROM sales_representatives NATURAL JOIN sales_rep_addresses;
``` 

## Question 2

```
SELECT id, first_name, last_name, address_line_1, address_line_2, city, email, phone_number FROM sales_representatives NATURAL JOIN sales_rep_addresses;
```

# Part 2

## Question 1

```
SELECT id, first_name, last_name, address_line_1, address_line_2, city, email, phone_number FROM sales_representatives JOIN sales_rep_addresses USING (id);
```

## Question 2

```
SELECT * FROM items JOIN price_history USING (itm_number);
```

# Part 3

## Question 1

```
SELECT c.ctr_number, c.first_name, c.last_name, c.phone_number, c.email, s.id, s.first_name, s.last_name, s.email FROM customers c JOIN sales_representatives s ON (c.sre_id = s.id);
```

# Part 4

## Question 1
```
SELECT c.ctr_number, c.first_name, c.last_name, c.phone_number, c.email, s.id, s.first_name, s.last_name, s.email FROM customers c JOIN sales_representatives s ON (c.sre_id = s.id) JOIN teams t ON (t.id = c.tem_id);
```

# Part 5

## Question 1
```
SELECT c.ctr_number, c.first_name, c.last_name, c.phone_number, c.email, s.id, s.first_name, s.last_name, s.email FROM customers c JOIN sales_representatives s ON (c.sre_id = s.id) JOIN teams t ON (t.id = c.tem_id) WHERE c.ctr_number = 'c00001';
```

# Part 6

## Question 1

```
SELECT 'The cost of the ' || i.name || ' on this day was ' || ph.price FROM items i JOIN price_history ph ON i.itm_number = ph.itm_number JOIN inventory_list il ON i.ilt_id = il.id WHERE i.itm_number = 'im01101045' AND TO_DATE('2016-12-12', 'YYYY-MM-DD') BETWEEN ph.start_date AND ph.end_date;

```