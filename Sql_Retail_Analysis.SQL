select * from dbo.['sales_orders (1)$'];
select * from dbo.sales_orders_items$;
select * from dbo.login_logsp$;




 select* from ['sales_orders (1)$'] S inner join sales_orders_items$ T on S.fk_buyer_id= T.fk_order_id
inner join login_logsp$ L on T.fk_order_id = L.user_id 


 


/* no_login on the par day  , qu 1*/

   select convert(date,login_time) as LOGIN_DATE ,
   count(distinct[login_log_id]) 
   as daily_logins from login_logsp$
   group by convert(date,login_time) 
   order by 1


select convert(date,login_time) as no_date , count(distinct[login_log_id]) as daily_logins from login_logsp$
where convert (date,login_time)between '2021-07-05' and '2022-07-30'
group by convert(date,login_time) 
order by 1

SELECT DAY(LOGIN_TIME) AS LOGIN_DATE , COUNT(login_log_id) AS LOGIN_COUNT FROM LOGIN_LOGSP$
GROUP BY DAY(LOGIN_TIME);

/* daily trend of login and trand conversion rate*/


   select dAY(login_time)as login_date,count(LOGIN_LOG_ID) as login_count from login_logsp$
   group by day(login_time)
   order by day(login_time)


-- daily conversion rate 
select count(login_log_id) 


-- data for july 2021
select  count(user_id)from login_logsp$
where login_time between '2021-07-05 11:30:06.000' and '2021-07-30 23:55:19.000'

select count(user_id) from login_logsp$

SELECT S.RATE,L.login_log_id ,L.login_time
FROM sales_orders_items$ S INNER JOIN login_logsp$ L ON S.fk_order_id=L.user_id 
 SELECT convert(date,login_time) as no_date , count(distinct[login_log_id]) as daily_logins from login_logsp$
where convert (date,login_time)between '2021-07-05' and '2022-07-30'
group by convert(date,login_time)
order by 1

SELECT AVG( DISTINCT RATE)as trade_rate  from sales_orders_items$ join login_logsp$ on sales_orders_items$
.fk_order_id=login_logsp$.user_id
SELECT AVG( DISTINCT login_log_id)as trade_login   from login_logsp$ join sales_orders_items$ on sales_orders_items$
.fk_order_id=login_logsp$.user_id

SELECT convert(date,login_time) as no_date , avg(distinct[login_log_id]) as daily_logins from login_logsp$
where convert (date,login_time)between '2021-07-05' and '2022-07-30'
group by convert(date,login_time)
order by 1
SELECT convert(date,login_time) as no_date , avg(distinct[login_log_id]) as daily_logins from login_logsp$  join sales_orders_items$ on login_logsp$.user_id=sales_orders_items$.fk_order_id
where convert (date,login_time)between '2021-07-05' and '2022-07-30'
group by convert(date,login_time)
order by 1

/*conversion rate*/
select rate from  sales_orders_items$
where order_quantity_accepted =
 
 select count(sales_order_status) as complete_user from ['sales_orders (1)$']
/* where sales_order_status='shipped'*/

 select count(login_log_id) as total_name_of_user from login_logsp$ 
 select( 13630/666357*100) as conversion_rate

 /* qu 3 kpl 8*/
 select (0/666357)*100
 /* qu 4*/
 



select  count(order_id) as no_order,count(creation_time) as no_year from ['sales_orders (1)$']
where creation_time between '2021-07-01' and '2021-07-30'
and creation_time between '2022-07-30 00:22:05.000 'and '2022-07-30 18:17:49.000' 

/* */

    select year(login_time)as year ,count(login_log_id) as total_login from login_logsp$
    group by year(login_time);
    
	select year(creation_time)as year ,count(order_id) as total_order from ['sales_orders (1)$']
    group by year(creation_time);
 
    select year(login_time) as year ,count(user_id) as new_user  from login_logsp$
    group by year(login_time)

 -- top selling product in each year 
 

select  sales_orders_items$ .fk_product_id,sales_orders_items$.fk_order_id,login_logsp$.login_time from  sales_orders_items$ join login_logsp$
on  sales_orders_items$.fk_order_id=login_logsp$.user_id 

group by fk_product_id
having login_time= '2022'
order by fk_order_id desc

select year(creation_time) from ['sales_orders (1)$'],sales_orders_items$.fk_product_id,count(order_item_id) as total_sales_item 
 where year in '2021' 
group by year,fk_product_id
order by year, total_sales_item desc 

with as (select fk_product_id, count(order_item_id), row_number() over(partition by fk_product_id order by order_item_id desc)
as row_number from sales_orders_items$ 

--
Select COUNT(order_id) from ['sales_orders (1)$']
where creation_time between '2021-07-01 'and '2021-07-30';
select COUNT(order_id) from ['sales_orders (1)$']
where creation_time between '2022-07-01 'and '2022-07-30';

-- 
select count(login_log_id) as no_login from login_logsp$
select count(fk_order_id*ordered_quantity)as no_order from sales_orders_items$
select count(sales_order_status) as no_sales from ['sales_orders (1)$']
where sales_order_status='shipped'
 select count(fk_order_id)from  (
select  sales_orders_items$ .fk_product_id,sales_orders_items$.fk_order_id,login_logsp$.login_time,login_logsp$.login_log_id from  sales_orders_items$ join login_logsp$
on  sales_orders_items$.fk_order_id=login_logsp$.user_id );

--kpi

  --dau(daily active user)

  select 
  day(login_time) as login_date,
  count(distinct USER_ID) as user_num from login_logsp$
  group by day(login_time) 
  order by login_date

-- 
   --monthly active user

   select year(login_time)as year,month(login_time) as months,
   count(distinct user_id) as mau from login_logsp$ 
   group by month(login_time),year(login_time)
   order by months



--conversion rate
select CREATION_TIME ,count(order_id) as total_order,
count(distinct user_id) as unique_order_user
from ['sales_orders (1)$'],login_logsp$
GROUP BY creation_time

-- CONVERSION RATE 
SELECT DAY(CREATION_TIME) AS ORDER_DATE, COUNT(*) AS TOTAL_ORDER, COUNT(DISTINCT USER_ID) AS UNIQUE_USER FROM ['sales_orders (1)$'],
login_logsp$ GROUP BY DAY(CREATION_TIME)
ORDER BY ORDER_DATE


--aov average order value


    select day(creation_time)as order_date,avg(order_ID) as aov from ['sales_orders (1)$']
    group by day(creation_time)
    order by order_date

-- CUSTOMER RETENTION RATE
WITH USER_ORDER AS(SELECT USER_ID,MIN(CREATION_TIME) AS FIRST_ORDER,MAX(CREATION_TIME) AS LAST_ORDER,COUNT(ORDER_ID) AS TOTAL_ORDER
FROM login_logsp$,['sales_orders (1)$']
GROUP BY USER_ID ) 
SELECT COUNT(USER_ID) TOTAL_USER,COUNT(IF(TOTAL_ORDER > 1,1,NULL)) AS RETAINED_CUSTOMER,(COUNT(IF
(TOTAL_ORDER >1,1,NULL)) / COUNT(*))*100 AS RETENTION_RATE FROM LOGIN_LOGSP$,['sales_orders (1)$'];


-- top selling product 2021


    select top 10 YEAR(CREATION_TIME)AS DTE ,fk_product_id , COUNT(SALES_ORDER_STATUS)AS TOTAL_SALES 
	from ['sales_orders (1)$'],sales_orders_items$
    where year(creation_time)=2021 AND sales_order_status='SHIPPED'
    GROUP BY fk_product_id,YEAR(CREATION_TIME)
    select top 10 fk_product_id , COUNT(SALES_ORDER_STATUS)AS TOTAL_SALES 
	from ['sales_orders (1)$'],sales_orders_items$
    where year(creation_time)=2022 AND sales_order_status='SHIPPED'
    GROUP BY fk_product_id;


--login frequency vs order 
with user_login_frequency as (select user_id,count(login_log_id) as login_count from login_logsp$
group by user_id),
user_order_count as (select user_id,count(order_id) as ORDER_COUNT from login_logsp$,['sales_orders (1)$']
group by user_id)
 select u.login_count as order_count from user_login_frequency u left join user_order_count o
on u.user_id=o.user_id;

-- JULY 2021 ANALYSIS 

SELECT  count(order_id) as total_order,count(USER_ID) as total_user  from 
['sales_orders (1)$'],login_logsp$
where creation_time between '2021-07-01' and '2021-07-30'
and login_time between '2021-07-05' and '2021-07-30'

SELECT  count(USER_ID) as total_user from 
login_logsp$
where login_time between '2021-07-05' and '2021-07-30'
--group by creation_time



select * from login_logsp$
where year(login_time) ='2021'

select  count(order_id) as total_order,count(distinct user_id) as unique_users 
from ['sales_orders (1)$'],login_logsp$
where creation_time between '2021-07-05' and '2021-07-30'  and login_time between '2021-07-05 ' and '2021-07-30'
