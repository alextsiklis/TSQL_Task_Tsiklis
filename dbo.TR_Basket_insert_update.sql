create or alter trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as
declare @i int;
set @i = (select max(ID_SKU) from inserted);

while @i > 0
begin
if @i in (select ID_SKU from inserted)
begin
	if ((select count(*) from inserted where ID_SKU = @i) > 1)
		begin
			update dbo.Basket
			set dbo.Basket.DiscountValue = dbo.Basket.Value * 0.05
			where dbo.Basket.ID_SKU = @i;
		end;
	else
		begin
			update dbo.Basket
			set dbo.Basket.DiscountValue = 0
			where dbo.Basket.ID_SKU = @i;
		end;
end;
set @i = @i - 1;
end;