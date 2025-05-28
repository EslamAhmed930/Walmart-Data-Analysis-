--task1
--1

--eslam
with tmp as(
select category_name, product_name, sum(sales_amount) t_sales, 
dense_rank() over(partition by category_name order by sum(sales_amount) desc) rn
from sales_fact s inner join product_dim p on s.product_id_bk = p.product_id_bk 
inner join category_dim c on s.category_sub_id_bk = c.category_sub_id_bk
group by category_name, product_name)
select category_name, product_name, t_sales
from tmp
where rn = 1;

--otifi
with tmp as(
select sum(sales_amount) over (partition by p.product_id_bk) total_sales_amount, product_name, category_name
from sales_fact s inner join product_dim p on s.product_id_bk = p.product_id_bk 
inner join category_dim c on s.category_sub_id_bk = c.category_sub_id_bk)
select distinct total_sales_amount, product_name, category_name,
dense_rank() over(partition by category_name order by total_sales_amount desc) 
from tmp order by category_name, total_sales_amount desc

--2
--Mariam
Select sf.sales_amount , cd.customer_id_bk, sf.transaction_id ,sf.time , cd.customer_name ,cd.age ,
 cd.gender , cd.marital_status , cd.has_children,
 sum(sf.sales_amount) over (partition by sf.customer_id_bk order by sf.sales_amount desc) as total_per_cust,
 sum(sf.sales_amount) over (partition by sf.time) as time_sales,
 avg(sf.sales_amount) over (partition by cd.gender) as avg_buys_per_gender , 
 avg(sf.sales_amount) over (partition by cd.age) as avg_buy_per_age
from customer_dim cd , sales_fact sf
where cd.customer_id_bk = sf.customer_id_bk

--Hassan
SELECT D.DATE, SUM(S.SALES_AMOUNT) AS SALES_PER_DAY
FROM date_dim D INNER JOIN sales_fact S ON D.date_id = S.date_id
GROUP BY D.date;



--3 Seif
select promotion_name , 
sum(quantity) total_item_sold, 
sum(sales_amount) total_sales
from sales_fact s inner join promotion_dim p 
on s.promotion_id_bk = p.promotion_id_bk
group by promotion_name
order by total_sales desc;



--task2
with ip as (
select t1.product_id_bk as item_1, t2.product_id_bk as item_2,
count(1) as pair_count
from sales_fact t1
join sales_fact t2 on t1.transaction_id = t2.transaction_id and t1.product_id_bk < t2.product_id_bk
group by 1,2)

select item_1, item_2, p1.product_name, p2.product_name,  pair_count,
dense_rank() over(order by pair_count desc)
from ip 
inner join product_dim p1 on item_1 = p1.product_id_bk
inner join product_dim p2 on item_2 = p2.product_id_bk;











