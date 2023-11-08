# Part 1

## Question 1
INSERT INTO teams (id, name, number_of_players, discount)
VALUES('t004', 'Jets', 10, 5);
## Question 2 
INSERT INTO customers (ctr_number, email, first_name, last_name, phone_number, current_balance,loyalty_card_number, sre_id, tem_id)
VALUES('c02001', 'brianrog@hooterch.com', 'Brian', 'Roger', '016545647898', -5,'Ic4587',null,null);
## Question 3
ALTER TABLE customers
ADD CONSTRAINT current_balance CHECK(current_balance>=0);
#### Constraint violated
Error report -
ORA-02293: cannot validate (SYSTEM.CURRENT_BALANCE) - check constraint violated
02293. 00000 - "cannot validate (%s.%s) - check constraint violated"
*Cause:    an alter table operation tried to validate a check constraint to
           populated table that had nocomplying values.
*Action:   Obvious
#### Change current balacne to 50
Update customers
SET current_balance=50
WHERE current_balance=-5;
#### Return Query
ALTER TABLE customers
ADD CONSTRAINT current_balance CHECK(current_balance>=0);
