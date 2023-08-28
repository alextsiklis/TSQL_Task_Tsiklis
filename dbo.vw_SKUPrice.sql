create or alter view dbo.vw_SKUPrice as
select *,  dbo.udf_GetSKUPrice(ID) as Value
from dbo.SKU