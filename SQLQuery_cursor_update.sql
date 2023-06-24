alter table Orders add [tax] int null
update Orders set [tax]=null
SELECT * FROM Orders

declare orders_cursor scroll cursor for
select [Prices] from Orders

open Orders_cursor

declare @price int

fetch next from orders_cursor into @price

while @@FETCH_STATUS=0
begin
	declare @tax int = ((@price /100)*15)
	update [Orders] set [tax]= @tax where CURRENT of Orders_cursor 
	fetch next from Orders_cursor into @price
end

close Orders_cursor
deallocate Orders_cursor