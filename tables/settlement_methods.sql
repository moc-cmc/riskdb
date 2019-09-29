drop table settlement_methods
go

create table
	settlement_methods
(
	settlement_method_id int,
	name varchar(50)
)
go

create unique nonclustered index 
	u_sm
on
	settlement_methods(settlement_method_id)
go

create unique nonclustered index
	n_sm
on
	settlement_methods(name)
go

