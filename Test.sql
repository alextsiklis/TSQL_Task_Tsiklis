drop table if exists dbo.Basket;
drop table if exists dbo.Family;
drop table if exists dbo.SKU;
drop table if exists dbo.SKU_withCode;

insert into dbo.SKU values ('s1','Alex'), ('s2','Roma'), ('s3','Vika');
select * from dbo.SKU;
insert into dbo.Family values ('Tsiklis',17000), ('Emelyanov', 20000), ('Mur',15000);
select * from dbo.Family;
insert into dbo.Basket(ID_SKU,ID_Family,Quantity,Value) values (1,1,5,3000), (2,2,3,3000), (3,3,5,2000), (3,3,4,8000);
select * from dbo.Basket;

select dbo.udf_GetSKUPrice(1);
select dbo.udf_GetSKUPrice(2);
select dbo.udf_GetSKUPrice(3);

exec dbo.usp_MakeFamilyPurchase 'Tsiklis';
exec dbo.usp_MakeFamilyPurchase 'Emelyanov';
exec dbo.usp_MakeFamilyPurchase 'Mur';
exec dbo.usp_MakeFamilyPurchase 'None';

select * from dbo.vw_SKUPrice

select * from dbo.Basket;
insert into dbo.Basket(ID_SKU,ID_Family,Quantity,Value) values (1,1,4,32000), (2,2,2,1000), (3,3,5,2000), (3,3,4,8000);
select * from dbo.Basket;

select top 1 count(*) as cnt from dbo.Basket group by ID_SKU order by cnt desc;