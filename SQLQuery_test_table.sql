create database DBTest
go

create table [DBTest] .. [Customers]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[FirstName] nvarchar(200) not null,
[LastName] nvarchar(200) not null,
[AddDate] datetime not null default (getdate())
)
go

create table [DBTest] .. [Orders]
(
[ID] INT IDENTITY NOT NULL PRIMARY KEY,
[CustomerId] int not null references DBTest .. Customers ([ID]),
[OrderDate] datetime not null default (getdate()),
[Prices] decimal not null
)
go


declare @FIndex int = FLOOR (44 * RAND()+1)
declare @FN NVARCHAR (200) = choose (@FIndex, N'علی',N'پریسا',N'محمود',N'لیلا',N'مهدی',N'احمد',N'امید',N'هستی',N'الینا',N'کیوان',N'طاهره',N'روناک',N'زهره',N'زهرا',N'عسگر',N'نازاره',N'علی اصغر',N'مهناز',N'حسام',N'سام',N'حسین',N'محدثه',N'مستانه',N'مرضیه',N'شکوفه',N'مریم',N'شهاب',N'شهناز',N'پرویز',N'فیروزه',N'فرامرز',N'فتانه',N'فروزان',N'پارمیدا',N'سعیده',N'شهرام',N'شهروز',N'شایان',N'سامان',N'محمد',N'محمدامین',N'مرتضی',N'رضا',N'علیرضا')
declare @LIndex int = FLOOR (44 * RAND()+1)
declare @LN NVARCHAR (200) = choose (@LIndex, N'علیمردانی',N'پروا',N'محمودی',N'کریمی',N'کریمی نسب',N'احمدی',N'امیدی',N'مهدوی',N'الهی',N'عسگری',N'ناطق',N'مرادیفر',N'زارعی',N'نواب صفوی',N'طهمورث',N'تیموری',N'غیاثی',N'غفارمنش',N'امیری',N'ابراهیمی',N'قبادی',N'ساکت',N'صالحی',N'بهمنش',N'بهرنگ',N'بهرامی',N'سعیدی',N'سماواتی',N'صداقت',N'سلحشور',N'صادقی',N'سلیمی',N'قاسمی',N'قنبری',N'گنجی',N'گودرزی',N'گنجوی',N'نجاتی',N'کریم نژاد',N'محسنی',N'معتمد',N'مرتضوی',N'سهیلی',N'سعادتی')

declare @dateoffset int= floor (15674* rand()+1)
declare @DR datetime = dateadd(hour,@dateoffset,'2020-01-01')
declare @customer_id int =(select top(1) ID FROM Customers ORDER BY NEWID())
declare @PRICE money= floor (250000* rand()+50000)

INSERT INTO [Orders] VALUES (@customer_id,@DR,@PRICE)
GO 49500

insert into [Customers] values (@FN,@LN,@DR)
GO 500

SELECT * FROM Customers
SELECT * FROM Orders