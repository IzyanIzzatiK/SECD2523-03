# Part 1
## Question 1
### 10 Tables

<br /> 

## Question 2
### 8 Columns

<br /> 

## Question 3
~~~ 
CONSTRAINT item_pk PRIMARY KEY ( itm_number ) 
~~~

<br /> 

## Question 4
~~~ 
ALTER TABLE customers_addresses ADD CONSTRAINT customer_address_customer_fk FOREIGN KEY ( ctr_number )
REFERENCES customers ( ctr_number );
~~~

<br /> 

## Question 5
### Highest
~~~ 
address_line_1   VARCHAR2(30) NOT NULL,
address_line_2   VARCHAR2(30),
~~~

<br /> 

## Lowest
~~~
id               VARCHAR2(4) NOT NULL,
~~~

<br /> 

## Question 6
### Highest
~~~
   itm_number   VARCHAR2(10) NOT NULL,
~~~

<br /> 

### Lowest
~~~
   price        NUMBER(7,2) NOT NULL,
~~~

<br /> 

## Question 7
### itm_number, start_date, start_time
~~~
CONSTRAINT price_history_pk PRIMARY KEY ( itm_number, start_date, start_time ),
~~~
<br /> 
