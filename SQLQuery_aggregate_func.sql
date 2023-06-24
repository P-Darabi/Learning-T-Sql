SELECT 
  [CustomerId],
  c.[FirstName]+ ' ' + c.[LastName] fullname,
  count(*) TotalOrders, 
  sum(prices) TotalPrice,
  min(prices) MinPrice,
  max(prices) MaxPrice,
  avg(prices) AvgPrice
from Orders
inner join customers c on c.id= orders.customerid
group by CustomerId, c.[FirstName],c.[LastName]

SELECT 
  [CustomerId],
  month(orderdate) OrderMonth,
  sum(prices) TotalPrice
from Orders
group by CustomerId,month(orderdate)
order by CustomerId,month(orderdate)

SELECT 
  [CustomerId],
  month(orderdate) OrderMonth,
  sum(prices) TotalPrice
from Orders
group by grouping sets(CustomerId,month(orderdate))
order by CustomerId,month(orderdate)

SELECT 
  [CustomerId],
  month(orderdate) OrderMonth,
  sum(prices) TotalPrice
from Orders
group by CustomerId,month(orderdate)
with rollup
order by CustomerId,month(orderdate)

SELECT 
  [CustomerId],
  year(orderdate) OrderYear,
  month(orderdate) OrderMonth,
  sum(prices) TotalPrice,
  GROUPING (CustomerId)CustomerIdGrouping,
  GROUPING (year(orderdate)) OrderYearGrouping,
  GROUPING (month(orderdate)) OrderMonthGrouping
from Orders
group by CustomerId,year(orderdate),month(orderdate)
with rollup
order by CustomerId,OrderYear,OrderMonth