create or alter function udf_GetSKUPrice (@ID_SKU int)
RETURNS decimal(18,2) as
BEGIN
	declare @Value decimal(18,2);
	declare @Quantity int;

	set @Value = (select sum(Value) from dbo.Basket where dbo.Basket.ID_SKU = @ID_SKU);
	set @Quantity = (select sum(Quantity) from dbo.Basket where dbo.Basket.ID_SKU = @ID_SKU);

	RETURN @Value / @Quantity;
END;