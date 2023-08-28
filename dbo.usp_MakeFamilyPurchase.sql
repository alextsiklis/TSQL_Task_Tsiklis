create or alter procedure dbo.usp_MakeFamilyPurchase (@FamilySurName varchar(255)) as
if (select count(*) from dbo.Family where SurName = @FamilySurName) > 0
	update dbo.Family 
	set BudgetValue = BudgetValue - 
		(select sum(b.Value) 
		from dbo.Basket b
		join dbo.Family f on b.ID_Family = f.ID
		where SurName = @FamilySurName)
	where SurName = @FamilySurName;
else
	throw 51000, 'Family Surname does not exist.', 1;  
		