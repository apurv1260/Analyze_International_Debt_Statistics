use bank

select * from international_debt

--1. The World Bank's international debt data

--It's not that we humans only take debts to manage our necessities. A country may also take debt to manage its economy. For example, 
--infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives. The World Bank is the 
--organization that provides debt to countries.


--In this notebook, we are going to analyze international debt data collected by The World Bank. The dataset contains information 
--about the amount of debt (in USD) owed by developing countries across several categories.
--We are going to find the answers to questions like:

--1.)  Finding the number of distinct countries

select distinct country_name from international_debt

--2.) Finding out the distinct debt indicators

select distinct indicator_name,indicator_code from international_debt


--3.)  What is the total amount of debt that is owed by the countries listed in the dataset?

select country_name ,sum(debt) as Total_debt 
from international_debt
group by country_name

--4.) Which country owns the maximum amount of debt and what does that amount look like?

select top 1 country_name ,sum(debt) as Total_debt 
from international_debt
group by country_name
order by sum(debt) desc

--5.) What is the average amount of debt owed by countries across different debt indicators?

select indicator_name , avg(debt) as Avg_debt
from international_debt
group by indicator_name
order by avg(debt) desc

--6.) The highest amount of principal repayments

select top 1 country_name , indicator_name 
from international_debt
where indicator_code = 'DT.AMT.DLXF.CD' or indicator_name = 'DT.AMT.DPNG.CD'
order by debt desc

--7.) The most common debt indicator

select indicator_name , count(indicator_name) as common_indicator
from international_debt
group by indicator_name
order by count(indicator_name) desc

--8.) Other viable debt issues and conclusion

select country_name , max(debt) as Maximum_debt
from international_debt
group by country_name
order by max(debt) desc