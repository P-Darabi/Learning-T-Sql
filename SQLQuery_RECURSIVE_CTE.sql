create table #customers
(
[id] int identity not null primary key,
[fname] nvarchar(200) not null,
[lname] nvarchar(200) not null,
[managerid] int null
)
go


insert into #customers values (N'پریسا', N'کریمی',null)
insert into #customers values (N'لیلا', N'کریمی',null)
insert into #customers values (N'سارا', N'کریمی',null)
insert into #customers values (N'پریسا', N'کریمی نسب',1)
insert into #customers values (N'پروین', N'کریمی',null)
insert into #customers values (N'عباس', N'کریمی',2)
insert into #customers values (N'پریسا', N'عباسی',3)
insert into #customers values (N'پریا', N'علی ابادی',5)
insert into #customers values (N'مرتضی', N'مرتضوی',5)
insert into #customers values (N'ساناز', N'سمیعی',1)
insert into #customers values (N'سعید', N'سلوکی',4)
insert into #customers values (N'اتنا', N'سعدی',7)
insert into #customers values (N'قادر', N'تیموری',6)
insert into #customers values (N'پونه', N'ابراهیمی',6)
insert into #customers values (N'پدرام', N'سرابی',8)

select * from #customers


with customer_cte
as 
(
select [id], [fname], [lname], [managerid], 0 [level] from #customers where [managerid] is null
union all
select c.[id], c.[fname], c.[lname], c.[managerid], [level] + 1 [level] from #customers c
inner join customer_cte on customer_cte.[id]=c.[managerid]
)
select * from customer_cte