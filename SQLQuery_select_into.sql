 select identity(int,1,1) as id,[CustomerId],[fullname],[orderdate],[prices] 
 into orderwithdetails
from (select
	o.CustomerId,
	c.FirstName+ ' ' + c.LastName [fullname],
	o.OrderDate,
	o.Prices
from 
	orders o
inner join customers c on c.id =o.CustomerId) temp
 
 select * from orderwithdetails
 drop table orderwithdetails