--Database named SUPERMARKET were first created
--smSales table were imported as flat file

use Supermarket

--sales by month
 Select MonthPurchase, Sum(Total) as SalesByMonth from smSales 
 group by MonthPurchase
 order by Sum(Total) desc

 --using subquery--
 select * from smSales where InvoiceID in
 (Select InvoiceId from smSales where Total > 800)

 --sales by branch
select Branch , sum(Total) as salesbyBranch 
from smSales group by Branch 

--sales by City
select City , sum(Total) as salesbyCity 
from smSales group by City 

select sum(Total) from smSales where Branch='A' and MonthPurchase='Jan'

--sales by productline
select distinct(ProductLine)
,sum(Total) as totalsale 
from smSales group by ProductLine 

--Total sales per ProductLINE-
select Productline, max(Total) as TotalSales from smSales
Where MonthPurchase='Jan'
group by ProductLine  
order  by max(total) desc

--total sold quantity per productline
select ProductLine,Sum(Quantity) as totalQtybyprdctline 
from smSales group by ProductLine
order by Sum(Quantity) Desc

--total amount purchase by gender--
select Gender, count(Gender) countofgender,sum(Total)
as totalsales from 
smSales group by Gender order by sum(Total) desc

select*from smSales
select COUNT(InvoiceID) from smSales  --total customer--
select InvoiceID,(Unitprice*Quantity) + Taxby5
as totalpurchase from smSales


select * from smSales
--total purchased quantity by month--
select MonthPurchase, sum(Quantity) from smSales 
group by MonthPurchase 

--total sales by city--
select distinct(City),sum(Total)
as TotalSales from smSales group  by City

-- updating records--
update smSales
set City='Nay Pyi Taw' where City = 'Naypyitaw'

--quantity and total sales per month--
select MonthPurchase,Sum(Quantity) as quantitysold,Sum(Total)
as totalsales from smSales 
group by MonthPurchase order by Sum(Total) desc

-- sales per country--
 select City, Sum(Total)as Totalsales
 from smSales group by City
 order by sum(Total) desc
  
 --sales per productLine
 select ProductLine, Sum(Total)as salesperProductline
 from smSales 
 group by ProductLine order by Sum(Total) desc

 --using where clause--
 select Branch,City, MonthPurchase, sum(Total) 
as SalesperMonth from smSales
where City ='Nay Pyi Taw'
group by Branch, City, MonthPurchase
having sum(Total) > 36000 order by Sum(Total) desc
--HAVING is always after GROUP BY--

 --total quantity sold per productLine
 select ProductLine, Sum(Quantity) as TotalQuantity 
 from smSales group by ProductLine
 order by Sum(Quantity) desc

 --validating the total price--
 select Total,(Unitprice * Quantity ) + Taxby5  as totalprice from smSales

-- correcting total price
 alter table smSales
 drop column Totalprice 

 update smSales
Set Total = (Unitprice * Quantity) + Taxby5


