declare Cus_Cursor cursor for
select [FirstName], [LastName] from Customers

open cus_cursor
declare @FN nvarchar(200)
declare @LN nvarchar(200)
fetch next from cus_cursor into @FN , @LN

while @@FETCH_STATUS=0
begin
	if @FN= N'پریسا'
	print @FN + ' ' + @LN  
	fetch next from Cus_Cursor into @FN, @LN
end

close Cus_Cursor
deallocate Cus_Cursor