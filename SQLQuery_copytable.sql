create  table #TempCustomers
(
[CustomerId] int not null primary key,
[Fullname] nvarchar(400) not null,
[TotalPrice] decimal null
);
go

INSERT INTO #TempCustomers
SELECT id,firstname+ ' '+ lastname, null from customers

select * from #TempCustomers
SELECT t.CustomerId, t.Fullname,temp.TotalPrice FROM #TempCustomers t
INNER JOIN (select CustomerId, sum(prices) [TotalPrice] from Orders group by CustomerId) temp ON temp.CustomerId=t.CustomerId

  

