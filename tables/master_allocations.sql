drop table master_allocations
go

create table
	master_allocations
(
	master_allocation_id int,
	name varchar(200),
	tico_account_id int,
	external_account_id int,
	allocation_mode_id int,
	status_id int,
	as_of_date datetime
)

go


if not exists(select relation from keys where relation = "master_allocations")
begin
	insert into keys values("master_allocations", 1)
end
go
	

create unique nonclustered index 
	u_am
on
	master_allocations(master_allocation_id)
go

create unique nonclustered index 
        n_am
on
        master_allocations(name, external_account_id)
go



