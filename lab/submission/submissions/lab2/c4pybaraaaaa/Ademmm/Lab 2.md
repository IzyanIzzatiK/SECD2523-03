# PART1

## 1. Add a new team to the system

~~~
insert into teams values('t004', 'Jets',10,5);
~~~

## 2.The information violate the check constraint

## 3.Change the current balance to 50

~~~
INSERT INTO CUSTOMERS(CTR_NUMBER,EMAIL,FIRST_NAME,LAST_NAME,PHONE_NUMBER,CURRENT_BALANCE,LOYALTY_CARD_NUMBER) VALUES ('c02001', 'brianrog@hootech.com', 'Brian', 'Rogers', '01654564898', 50, 'lc4587')
~~~





# PART2

## Q1

![Alt text](image.png)

##  Q2

~~~
UPDATE price_history
SET end_date=current_date, end_time = current_TIME
WHERE itm_number = 'im01101048' AND end_date IS NULL;
~~~

## Q3

![Alt text](image-1.png)

## Q4

~~~
insert into price_history (START_DATE,START_TIME,PRICE,END_DATE,END_TIME,ITM_NUMBER)
values (sysdate, systimestamp, 99.99, NULL, NULL,'im01101048')
~~~

## Q5

![Alt text](image-2.png)

# PART3

## Q1
~~~
DELETE FROM CUSTOMERS_ADDRESSES WHERE address_line_1='83 Barrhill Drive';
~~~

## Q2

![Alt text](image-3.png)

