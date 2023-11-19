create database marketing;
use marketing;

select * from marketing_campaign;
describe marketing_campaign;

select Education,round(Avg(Income),0) as Average_Income, count(*) 
from marketing_campaign
-- where AcceptedCmp1=1
group by Education
order by 2;

select Education,count(AcceptedCmp1),count(AcceptedCmp2) 
from marketing_campaign
group by Education;

select Marital_Status,sum(NumCatalogPurchases),sum(NumStorePurchases),sum(NumWebVisitsMonth), sum(NumWebPurchases),sum(NumDealsPurchases)
from marketing_campaign
group by Marital_Status;

-- adding New Column-Age of customers
alter table marketing_campaign
add column Age int;

update marketing_campaign
set Age=year(now()) - Year_Birth;
 
select year(now()) - Year_Birth as Age 
from marketing_campaign;

select Age,Sum(NumWebVisitsMonth),sum(NumWebPurchases),sum(NumStorePurchases),sum(NumCatalogPurchases)
from marketing_campaign
group by Age;

select Age,Sum(MntWines)
from marketing_campaign
where Age<85
group by Age;

SELECT 
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 25 and 35 THEN '25 - 35'
        WHEN age BETWEEN 35 and 45 THEN '35 - 45'
        WHEN age BETWEEN 45 and 55 THEN '45 - 55'
        WHEN age BETWEEN 55 and 65 THEN '55 - 65'
        WHEN age BETWEEN 65 and 75 THEN '65 - 75'
        WHEN age BETWEEN 75 and 85 THEN '75 - 85'
        WHEN age >= 85 THEN 'Over 85'
        WHEN age IS NULL THEN 'Not Filled In (NULL)'
    END as age_range,
    count(*) AS count
    from(select Age from marketing_campaign) as derived
    group by Age;


-- select
-- 	sum(if(Age between 25 and 35,1,0)) as '25-35'
-- 	sum(if(Age between 25 and 35,1,0)) as '35-45'
-- 	sum(if(Age between 25 and 35,1,0)) as '45-55'
-- 	sum(if(Age between 25 and 35,1,0)) as '45-55'
-- from (select Age from marketing_campaign) as derived;

select count(*)
from marketing_campaign
where Age between 20 and 29;


-- Which Campaign performed best?
select sum(AcceptedCmp1) as campaign_1,sum(AcceptedCmp2) as campaign_2,sum(AcceptedCmp3) as campaign_3,sum(AcceptedCmp4) as campaign_4,sum(AcceptedCmp5) as campaign_5,sum(response) as campaign_Response
from marketing_campaign;

-- Which campaign performed better with respect to education 
select education,sum(AcceptedCmp1) as campaign_1,sum(AcceptedCmp2) as campaign_2,sum(AcceptedCmp3) as campaign_3,sum(AcceptedCmp4) as campaign_4,sum(AcceptedCmp5) as campaign_5, sum(response) as campaign_Response
from marketing_campaign
group by education;



-- overlapping campaign success with customers
select count(*) 
from marketing_campaign
where AcceptedCmp1=1 and AcceptedCmp2=1 and AcceptedCmp3=1;

select count(*) 
from marketing_campaign
where AcceptedCmp2=1 and AcceptedCmp3=1;

-- Average age of customer
select round(avg(age),0) from marketing_campaign;

-- For how many years the customers have been using this company?
select (year(Dt_Customer)-Year_Birth), Age, (Age-(year(Dt_Customer)-Year_Birth)) as Customers_in_years
from marketing_campaign;

-- Customers have been using for more than 5 years
select count(*)
from marketing_campaign
where (Age-(year(Dt_Customer)-Year_Birth)) > 5;

-- Average Amount spent on Products in last 2 years by Customers;
select round(avg(MntWines),0) as Wine,round(avg(MntFruits),0) as Fruits,round(avg(MntMeatProducts),0) as Meat, round(avg(MntFishProducts),0) as Fish,
	round(avg(MntSweetProducts),0) as Sweet,round(avg(MntGoldProds),0) as Gold
from marketing_campaign;

-- Average income of customer
select round(avg(Income),0) as `Average Income` from marketing_campaign;

-- Average Purchases made by customer through various Channels
select floor(avg(NumDealsPurchases)) as `Deal Purchase` ,
		floor(avg(NumWebPurchases)) as `Web Purchase`,
        floor(avg(NumCatalogPurchases)) as `Catalog Purchase`,
        floor(avg(NumStorePurchases)) as `Store Purchase`
from marketing_campaign;

-- Average customer visited website in last month
select floor(avg(NumWebVisitsMonth)) from marketing_campaign;


select count(*) from marketing_campaign;






