
drop table 
	change_types
go

delete from
	keys
where
	relation="change_types"
go

create table
	change_types (
		change_type_id int,
		name varchar(100))
go

create unique index 
	cti
on
	change_types (change_type_id)
go

insert into
	change_types
values
	(1, "Integration Development")
go

insert into 
	change_types
values
	(2, "Custom Login Development")
go

insert into 
	keys
values
	("change_types", 3)
go


