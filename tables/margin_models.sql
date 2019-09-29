drop table margin_models
go

create table
	margin_models(
		margin_model_id int,
		name varchar(50)
)
go

create unique nonclustered index 
	u_i
on
	margin_models(margin_model_id)
go

create unique nonclustered index
	u_n
on
	margin_models(name)
go

insert into margin_models values(1, "NOP Aggregate Max")
insert into margin_models values(2, "NOP Max")
insert into margin_models values(3, "Shorts")
insert into margin_models values(4, "Longs")
insert into margin_models values(5, "Aggregate Short")
insert into margin_models values(6, "Aggregate Longs")
go

insert into keys values("margin_models", 6)
go

	
