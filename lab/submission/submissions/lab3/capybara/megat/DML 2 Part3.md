# DML Part 3

## Part 1
### Question 1

```  
SELECT * from customers WHERE ctr_number = 'c01986'
```

### Question 2

```
SELECT  first_name, last_name, ctr_number FROM customers WHERE current_balance > 100
```

### Question 3

```
SELECT id as "Order Id", odr_date as "Order Date", odr_time as "Order Time" FROM orders WHERE odr_date < TO_DATE('2019-05-28', 'YYYY-MM-DD')
```


## Part 2

```
SELECT id as "Inventory ID", cost as "Inventory Cost", units  as "Inventory Units" FROM inventory_list WHERE cost BETWEEN 3 and 15
```

## Part 3
```
SELECT id as "Inventory ID", cost as "Inventory Cost", units  as "Inventory Units" FROM inventory_list WHERE units IN(50,100,150,200)
```

## Part 4
```
SELECT id as "Inventory ID", cost as "Inventory Cost", units  as "Inventory Units" FROM inventory_list WHERE units NOT IN(50,100,150,200)
```

## Part 5
```
SELECT itm_number as "Item Number", name as "Item Name" FROM items WHERE name LIKE 'g%'
```

## Part 6
```
SELECT itm_number as "Item Number", name as "Item Name" FROM items WHERE name LIKE '%o%'
```



