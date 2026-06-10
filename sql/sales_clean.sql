create database e_commerce;
use e_commerce;
show tables;
select * from sales_clean;
desc sales_clean;
select order_purchase_timestamp from sales_clean;
alter table sales_clean modify column order_purchase_timestamp datetime;
alter table sales_clean modify column order_approved_at datetime;
alter table sales_clean modify column order_delivered_carrier_date datetime;
alter table sales_clean modify column order_delivered_customer_date datetime;
alter table sales_clean modify column order_estimated_delivery_date datetime;
alter table sales_clean modify column shipping_limit_date datetime;
select count(*) from sales_clean;
drop table sales_clean;
-- 1.Total Revenue
select sum(revenue) from sales_clean;
-- 2. Total Orders
select count(order_id) from sales_clean;
-- 3. Monthly Revenue
select order_month, sum(revenue) from sales_clean group by order_month order by order_month;
-- 4. Revenue by Category
select product_category_name, sum(revenue) from sales_clean group by product_category_name;
-- 5. Revenue by State
select customer_state, sum(revenue) from sales_clean group by customer_state;
-- 6. Top 10 Customers
select customer_unique_id, sum(revenue) as total_revenue from sales_clean group by customer_unique_id order by total_revenue desc limit 10 ;
-- 7. Average Delivery Days
select avg(delivery_days) from sales_clean;
-- 8. Late Delivery Percentage
select count(case when is_late = 1 then 1 end)* 100 / count(*) as late_delivery_percentage from sales_clean; 
select * from sales_clean;
