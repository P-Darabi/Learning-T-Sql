CREATE DATABASE [AccountingDB]
 ON  PRIMARY 
( 
NAME = N'AccountingDB',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PARISAKARIMI\MSSQL\DATA\AccountingDB.mdf' ,
SIZE = 8192KB ,
FILEGROWTH = 65536KB
)
 LOG ON 
( NAME = N'AccountingDB_log',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PARISAKARIMI\MSSQL\DATA\AccountingDB_log.ldf' ,
SIZE = 8192KB ,
FILEGROWTH = 65536KB
)
GO

use [AccountingDB]
Go


create table [CostCategories]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[Title] nvarchar(200) not null,
UNIQUE([Title])
)
Go

create table [IncomeCategories]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[Title] nvarchar(200) not null,
UNIQUE([Title])
)
Go

create table [Cost]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[CostCategoriyId] int not null REFERENCES [CostCategories] ([ID]),
[Title] nvarchar(200) not null,
[Description] nvarchar(2000) null,
[Date] datetime not null default (getdate()),
[Price] decimal not null,
)
Go

create table [Incomes]
(
[ID] INT identity NOT NULL PRIMARY KEY,
[IncomeCategoriyId] int not null references [IncomeCategories] ([ID]),
[Title] nvarchar(200) not null,
[Description] nvarchar(2000) null,
[Date] datetime not null DEFAULT (GETDATE()),
[Price] decimal not null,
)
Go

create table [ProductCategories]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[Title] nvarchar(200) not null,
)
Go

create table [Products]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[ProductCategoryId] int not null references [ProductCategories] ([ID]),
[Code] varchar(6) not null,
[Title] nvarchar(200) not null,
[Description] nvarchar(2000) null,
)
Go

create table [ProductPrices]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[ProductId] int not null REFERENCES [Products] ([ID]),
[Date] datetime not null DEFAULT (GETDATE()),
[Price] decimal not null,
)
Go

CREATE TABLE [ProductsIn]
(
[ID] uniqueidentifier NOT NULL PRIMARY KEY default (newid()),
[Serial] varchar(6) not null,
[Date] datetime not null default (getdate()),
[Title] nvarchar(200) not null,
[Description] nvarchar(2000) null,
)
GO

create table [ProductInsDetails]
(
[ProductInsId] uniqueidentifier not null references [ProductsIn] ([ID]),
[ProductId] int not null REFERENCES [Products] ([ID]),
[ProductPricesId] int not null REFERENCES [ProductPrices] ([ID]),
[Amount] decimal not null,
primary key ([ProductInsId],[ProductId] )
)
GO


CREATE TABLE [ProductsOuts]
(
[ID] uniqueidentifier NOT NULL PRIMARY KEY default (newid()),
[Serial] varchar(6) not null,
[Date] datetime not null default (getdate()),
[Title] nvarchar(200) not null,
[Description] nvarchar(2000) null,
)
GO

create table [ProductOutsDetails]
(
[ProductOutsId] uniqueidentifier not null references [ProductsOuts] ([ID]),
[ProductId] int not null REFERENCES [Products] ([ID]),
[ProductPricesId] int not null REFERENCES [ProductPrices] ([ID]),
[Amount] decimal not null,
primary key ([ProductOutsId],[ProductId])
)
GO









