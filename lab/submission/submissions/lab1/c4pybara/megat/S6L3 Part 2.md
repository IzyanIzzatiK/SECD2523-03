### Part 2

## Modifying a column

<br />

## Question 1

### desc orders;

<br />

## Question 2

~~~
ALTER TABLE orders
MODIFY odr_date DATE DEFAULT CURRENT_DATE;
~~~

<br />

## Question 3

![Alt text](image.png)

<br />

## Adding a check constraint 

<br />

## Question 1

### desc customers;

<br />

## Question 2 

~~~
ALTER TABLE customers
ADD CONSTRAINT check_balance CHECK (current_balance >= 0);
~~~

<br />

## Question 3

~~~
desc orders
~~~

<br />


## Question 4

![Alt text](image2.png)

<br />

## Adding a column

<br />

## Question 1

### desc customers;

<br />

## Question 2

~~~
ALTER TABLE CUSTOMER
ADD mobile_phone VARCHAR(20);
~~~
<br />

## Question 3
### desc customers;

<br />

## Dropping a column

<br />

## Question 1

### desc customers;

<br />

## Question 2

~~~ 
ALTER TABLE customers
DROP COLUMN mobile_phone;
~~~

<br />

## Question 3

desc customers;



