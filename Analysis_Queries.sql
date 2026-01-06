create database E_commerce_Orders_Customer_Analytics;


create table customers (
customer_id int primary key,
customer_name varchar(100),
email varchar(100),
city varchar(50),
signup_date date
);

create table products (
product_id int primary key,
product_name varchar(100),
category varchar(50),
price decimal(10,2)
);

create table orders (
order_id int primary key,
customer_id int,
order_date date,
order_status varchar(30),
foreign key (customer_id) references customers(customer_id)
);

create table order_items (
order_item_id int primary key,
order_id int,
product_id int,
quanitity int,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

create table payments (
payment_id int primary key,
order_id int,
payment_method varchar(30),
payment_status varchar(30),
amount decimal(10,2),
foreign key (order_id) references orders(order_id)
);

INSERT INTO customers VALUES
(1,'Amit Sharma','amit@gmail.com','Delhi','2023-01-10'),
(2,'Riya Verma','riya@gmail.com','Mumbai','2023-01-15'),
(3,'Rahul Mehta','rahul@gmail.com','Bangalore','2023-02-01'),
(4,'Sneha Iyer','sneha@gmail.com','Chennai','2023-02-10'),
(5,'Arjun Singh','arjun@gmail.com','Pune','2023-03-05'),
(6,'Neha Gupta','neha@gmail.com','Delhi','2023-03-18'),
(7,'Vikas Rao','vikas@gmail.com','Hyderabad','2023-04-02'),
(8,'Priya Nair','priya@gmail.com','Kochi','2023-04-15'),
(9,'Karan Malhotra','karan@gmail.com','Delhi','2023-05-01'),
(10,'Anjali Patel','anjali@gmail.com','Ahmedabad','2023-05-10');


select * from customers;

INSERT INTO products VALUES
(101,'iPhone 14','Electronics',70000),
(102,'Samsung TV','Electronics',45000),
(103,'Laptop Bag','Accessories',2500),
(104,'Running Shoes','Footwear',5000),
(105,'Bluetooth Headphones','Electronics',3000),
(106,'Office Chair','Furniture',12000),
(107,'Smart Watch','Electronics',15000),
(108,'Backpack','Accessories',1800);

select * from product;

INSERT INTO orders VALUES
(1001,1,'2023-01-15','Delivered'),
(1002,2,'2023-01-20','Delivered'),
(1003,1,'2023-02-05','Cancelled'),
(1004,3,'2023-02-18','Delivered'),
(1005,4,'2023-03-01','Delivered'),
(1006,5,'2023-03-10','Returned'),
(1007,6,'2023-03-25','Delivered'),
(1008,7,'2023-04-05','Delivered'),
(1009,8,'2023-04-20','Delivered'),
(1010,1,'2023-05-01','Delivered'),
(1011,9,'2023-05-12','Cancelled'),
(1012,10,'2023-05-18','Delivered');

select *from orders;

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,104,1),
(4,1003,105,1),
(5,1004,102,1),
(6,1005,106,1),
(7,1006,108,2),
(8,1007,107,1),
(9,1007,103,1),
(10,1008,105,2),
(11,1009,104,1),
(12,1010,101,1),
(13,1010,105,1),
(14,1012,106,1);


INSERT INTO payments VALUES
(1,1001,'UPI','Success',75000),
(2,1002,'Credit Card','Success',5000),
(3,1003,'UPI','Failed',3000),
(4,1004,'Net Banking','Success',45000),
(5,1005,'Credit Card','Success',12000),
(6,1006,'COD','Refunded',3600),
(7,1007,'UPI','Success',16500),
(8,1008,'Debit Card','Success',6000),
(9,1009,'UPI','Success',5000),
(10,1010,'Credit Card','Success',73000),
(11,1011,'COD','Failed',0),
(12,1012,'UPI','Success',12000);

-- E-Commerce Order & Customer Analytics
-- CUSTOMER ANALYSIS

-- 1. How many total customers are registered on the platform?

select count(*) as total_customers
from customers;

-- 2. How many new customers joined each month?

select month(signup_date) as month, count(*) as new_customers
from customers
group by 1;

-- 3. Which customers have placed more than one order (returning customers)?

select customer_id,count(order_id) as total_orders
from orders
group by customer_id
having count(order_id)>1;

-- 4. What percentage of customers are repeat buyers?

select (count(distinct customer_id) * 100.0)/
(select count(*) from customers) as repeat_customer_percentage
from orders
group by customer_id
having count(order_id)>1;

-- 5. Which customers have never placed an order?

select c.customer_id, c.customer_name
from customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null;

-- 6. What is the first order date for each customer?
select customer_id, min(order_date) as first_order
from orders
group by customer_id;

-- 7. What is the most recent order date for each customer?

select customer_id, max(order_date) as last_order_date
from orders
group by 1;

-- 8. What is the average number of orders placed per customer?

select count(order_id) / count(distinct customer_id) as avg_order_per_customer
from orders;

-- 9. Which customers have placed the highest number of orders?

select customer_id, count(order_id) as total_orders
from orders
group by 1
order by 2 desc;

-- 10.Which cities have the highest number of customers?

select city, count(*) as customer_count
from customers
group by 1
order by 2 desc;

-- ORDER ANALYSIS

-- How many total orders have been placed on the platform?

select count(*) as total_orders
from orders;

-- How many orders were placed each month?

select monthname(order_date) as month,
count(*) as order_count
from orders
group by 1
order by 2 desc;

-- What is the distribution of orders by order status (Delivered, Cancelled, Returned, etc.)?
select order_status, count(*) as total_orders
from orders
group by order_status;


-- What percentage of orders were cancelled?

select (count(
case 
when order_status = 'Cancelled' then 1
end) * 100.0)/
count(*) as cancelled_percentage
from orders;

-- Which days had the highest number of orders?

select order_date,count(*) as orders_count
from orders
group by 1
order by 2 desc;

-- How many orders contain more than three items?
select order_id
from order_items
group by order_id
having sum(quanitity) > 3;

-- What is the average number of items per order?
select avg(total_items) as avg_items_per_order
from (
select order_id, sum(quanitity) as total_items
from order_items
group by order_id
) t;

-- Which orders do not have a successful payment?
select o.order_id 
from orders o
left join payments p
on o.order_id = p.order_id
where p.payment_status <> 'Success'
or p.payment_status is null;

-- What is the total revenue generated from successful payments?
select sum(amount)
from payments
where payment_status = 'Success';

-- What is the average order value (AOV)?
select sum(amount) / count(distinct order_id) as AOV
from payments
where payment_status = 'Success';

-- How does revenue vary month by month?

select month(order_date) as month,
sum(p.amount) as monthly_revenue
from orders o
join payments p on o.order_id = p.order_id
where payment_status = 'Success'
group by 1
order by 1;

-- Which customers contribute the highest total revenue?
select c.customer_name, sum(p.amount) as total_amount
from customers c
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
where p.payment_status = 'Success'
group by c.customer_name
order by total_amount desc; 

-- What is the revenue contribution of repeat customers compared to new customers?
select 
case
when o.customer_id in (
select customer_id from orders
group by customer_id
having count(order_id) > 1
) then 'Repeat customers'
else 'New Customers'
end as customer_type,
sum(p.amount) as revenue
from orders o
join payments p on o.order_id = p.order_id
where payment_status = 'Success'
group by 1;



-- Which products are the top-selling by quantity?
select p.product_name, sum(oi.quanitity) as total_quantity
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_name
order by 2 desc;

-- Which product categories generate the highest revenue?

select p.category, sum(pa.amount) as revenue
from products p
join order_items oi on p.product_id = oi.product_id
join payments pa on oi.order_id = pa.order_id
where pa.payment_status = 'Success'
group by p.category
order by revenue desc;

-- Which products have never been sold?
select p.product_id, p.product_name
from products p
left join order_items oi on p.product_id = oi.product_id
where oi.order_id is null;

-- Which product contributes the highest revenue overall?
select p.product_name, sum(pay.amount) as revenue
from products p
join order_items oi on p.product_id = oi.product_id
join payments pay on oi.order_id = pay.order_id
where pay.payment_status = 'Success'
group by p.product_name
order by revenue desc
limit 1;


-- PAYMENT ANALYSIS

-- Which payment methods are most frequently used by customers?
select payment_method, count(*) as usage_count
from payments
group by payment_method
order by 2 desc;

-- What is the average payment amount for each payment method?
select payment_method, avg(amount) as avg_amount
from payments
where payment_status = 'Success'
group by 1;

-- What percentage of total revenue comes from each payment method?
select payment_method, sum(amount) * 100/(select sum(amount) 
from payments 
where payment_status = 'Success')
as revenue_percentage
from payments
where payment_status = 'Success'
group by payment_method;

-ADVANCED (OPTIONAL BUT IMPRESSIVE)

What is the customer lifetime value (CLV) for each customer?

Who are the top 5 high-value customers based on total spend?

What is the repeat purchase rate of customers?