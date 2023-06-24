create table #source
(
[id] int not null primary key,
[title] nvarchar(200) not null,
[date] datetime not null
)
go

create table #target
(
[id] int not null primary key,
[title] nvarchar(200) not null,
[date] datetime not null
)
go

insert into #source values (1,N'project1',getdate())
insert into #source values (2,N'project2',getdate())
insert into #source values (3,N'project3',getdate())
insert into #source values (4,N'pro4',getdate())
insert into #source values (5,N'pro5',getdate())
insert into #source values (6,N'pro6',getdate())


delete from #source where id=7 
insert into #source values (8,N'parisa',getdate())
update #source set [title]= N'parisaupdate' where id=1


merge #target as [target]
using #source as [source]
on [source].id =[target].id 
when not matched then 
	insert values ([source].id,[source].title,[source].[date])
when matched then
	update set [target].title=[source].title
when not matched by source then
	delete
output $action [action], inserted.*,deleted.*; 

 
