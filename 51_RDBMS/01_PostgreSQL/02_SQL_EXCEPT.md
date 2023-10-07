# SQL: Except Example
```sql
create table customers (
id bigserial primary key,
fullname text,
age numeric,
address text,
salesamount numeric)

insert into customers values(1, 'John Smith', 32, 'America', 34000);
insert into customers values(2, 'Nick Nolte', 72, 'Texas', 74000);
insert into customers values(3, 'Mary Fontaine', 42, 'Virginia', 20000);
insert into customers values(4, 'Amber Head', 61, 'California', 69000);
insert into customers values(5, 'Tom Cruise', 58, 'California', 84000);

CREATE TABLE sales (id bigserial primary key, customer_id numeric, order_date text, amount numeric);

insert into sales values(1, 1,  '2018-01-22', 20000);
insert into sales values(2, 1,  '2018-01-23', 14000);
insert into sales values(3, 5,  '2018-02-22', 50000);
insert into sales values(4, 5,  '2018-02-23', 34000);

select * from customers c
left join sales s on c.id = s.customer_id
```

```html
http://www.tutorialspoint.com/sql/sql-except-clause.htm
```
