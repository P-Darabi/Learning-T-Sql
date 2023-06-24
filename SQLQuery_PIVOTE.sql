with Pivote_CTE
as 
(
select 
CustomerId,
year (OrderDate) YearOrders,
Prices
from Orders
)

select 
pivot_pv.CustomerId,
c.FirstName,
c.LastName,
pivot_pv.[2020],
pivot_pv.[2021]
from Pivote_CTE
pivot
(
sum(Prices)
for [YearOrders]
in ([2020],[2021])
) as pivot_pv
INNER JOIN Customers c on c.ID= pivot_pv.CustomerId
ORDER BY CustomerId


