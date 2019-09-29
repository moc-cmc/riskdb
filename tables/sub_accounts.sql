drop table sub_accounts
go

create table
	sub_accounts
(
	sub_account_id int,
	master_allocation_id int,
	external_account_id int,
	allocation float
)

go


if not exists(select relation from keys where relation = "sub_accounts")
begin
	insert into keys values("sub_accounts", 1)
end
go
	

create unique nonclustered index 
	u_am
on
	sub_accounts(sub_account_id)
go

create unique nonclustered index 
        n_am
on
        sub_accounts(external_account_id)
go



