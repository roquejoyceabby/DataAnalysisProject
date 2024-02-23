use greenstore
select * from greenstoredata

-- total order --
select count(OrderID) as totalorder from greenstoredata

-- total sales--
select  sum(Amount) as Total_Sales from greenstoredata

-- total sales and order by month --
select Monthordered, sum(Amount) as TotalSales, count(OrderId) as TotalOrder 
from greenstoredata group by MonthOrdered
order by sum(Amount) desc

-- Top 5 category --
select Category, sum(Amount) as TotalSales from greenstoredata
group by Category order by sum(Amount) desc limit 5

-- percentage of most contributing channel --
select PartnerChannel, sum(Amount) as Totalsales, 
sum(Amount) * 100 / sum(sum(Amount)) over() as Sales_Percentage 
from greenstoredata group by PartnerChannel
order by sum(Amount) desc  


--  calculating percentage of total amount purchased by gender --
-- men or women?  --
select Gender, sum(Amount) as Totalsales, 
sum(Amount) * 100 / sum(sum(Amount)) over() as Sales_Percentage
from greenstoredata group by Gender 

-- min and max customer age--
select max(Age) from greenstoredata
select min(Age) from greenstoredata

-- count of customers by Gender--
select Distinct(Gender),Count(OrderId)
as numberofcustomer from greenstoredata group by Gender

-- using subquery in calculating total order and its percentage by Status  --
select Status, count(OrderId) as countofOrders, 
Round(count(OrderId) * 100.0 /
(select count(OrderId) from greenstoredata),2)
 as percentageofOrders from greenstoredata group by Status 
 
 -- Age Discretization using case statement--
 -- total sales by age_bin --
 SELECT 
 sum(Amount) as TotalSales,
    CASE
        WHEN Age >= 18 AND age <= 39 THEN 'Young Adult'
        WHEN Age >= 40 AND age <= 59 THEN 'Middle-aged Adult'
        WHEN Age >= 60 AND age <= 78 THEN 'Old Adult'
        ELSE 'Unknown'
    END AS age_bin, 
    COUNT(Age) AS count
FROM greenstoredata
GROUP BY age_bin

select * from greenstoredata
 



