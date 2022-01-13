-- Check the data is all there
--Select *
--From Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$

-- Selecting Relevant Columns For My Analysis
Select Branch, City,[Customer type], [Product line], [Unit price], Quantity, Total, Date, Payment, cogs,[gross income], [gross margin percentage]
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
order by 1,8

-- Looking at Total Revenue and Total Profit by City/Branch
Select Branch, SUM ([gross income]) as Net_Profit, SUM (total) as Total_revenues
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by Branch

-- Looking at the branch with the Highest Revenue
Select Branch, sum (Total) as Revenue
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by Branch
order by Revenue desc

-- Looking at the branch with the Highest Profit
Select Branch, sum ([gross income]) as Profit
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by Branch
order by Profit desc

-- Looking at the Product Line That Generates more Revenue
Select [Product line], sum (total) as Product_Line_Revenue
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by [Product line]
Order by Product_Line_Revenue desc

-- Looking at the Product Line That Generates more Profit
Select [Product line], sum ([gross income]) as Product_Line_Profit
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by [Product line]
Order by Product_Line_Profit desc

-- Looking at the Type of Customer Who Spends More Money
Select [Customer type], sum ([Total]) as Customer_Total_Spending
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by [Customer type]
Order by Customer_Total_Spending desc

-- Looking at how many times we sold more than 10 units
Select COUNT (Branch) as Ten_Plus_Items_Bought
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
where Quantity >= 10

-- Looking at how many sales were greater than 500USD
Select COUNT (branch) as Purchases_Greater_Than_FiveHundred
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
where total >= 500


-- Creating Views to store for later Data Visualizations
Create View TotalRevenueBranch as 
Select Branch, SUM ([gross income]) as Net_Profit, SUM (total) as Total_revenues
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by Branch

Create View BranchProfit as
Select Branch, sum ([gross income]) as Profit
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by Branch


Create view ProductProfitability as
Select [Product line], sum (total) as Product_Line_Revenue
from Portfolio_Project_Supermarket_Sales..Supermarket_Sales_Data$
Group by [Product line]
