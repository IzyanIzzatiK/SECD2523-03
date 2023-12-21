# Part 1

## Question 1

```
SELECT worker.first_name || worker.last_name , supervisor.first_name || supervisor.last_name FROM sales_representatives worker JOIN sales_representatives supervisor on (supervisor.supervisor_id = worker.id);
``` 

# Part 2

## Question 1

```
SELECT * FROM teams t LEFT OUTER JOIN customers c ON(t.id = c.tem_id)
```

# Part 3

## Question 1

```
SELECT * FROM customers, sales_representatives
```