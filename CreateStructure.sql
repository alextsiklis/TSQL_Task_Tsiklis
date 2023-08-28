drop table if exists dbo.Basket;
drop table if exists dbo.Family;
drop table if exists dbo.SKU;
drop table if exists dbo.SKU_withCode;

create table dbo.SKU(
	ID int identity primary key,
	Code varchar(20) unique,
	/*check(Code like '^s[0-9]+'),*/
	Name varchar(20)Make
);

/*select ID, 
	concat('s', convert(varchar(20), ID)) as Code,
	Name
into
    dbo.SKUwithCode
from
    dbo.SKU
*/

create table dbo.Family(
	ID int identity primary key,
	SurName varchar(20) unique,
	BudgetValue decimal(18,2)
);

create table dbo.Basket(
	ID int identity primary key,
	ID_SKU int,
	ID_Family int,
	Quantity int,
	Value decimal(18,2),
	PurchaseDate datetime default getdate(),
	DiscountValue decimal(18,2) default null,
	check(Quantity > 0 and Value > 0),
	foreign key  (ID_Family) references dbo.Family (ID), 
	foreign key (ID_SKU) references dbo.SKU (ID)
);
