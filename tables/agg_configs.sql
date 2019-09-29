drop table agg_configs
go

create table
	agg_configs(
		agg_config_id int,
		name varchar(50),
		agg_schedule_id int 
	)
go

create unique nonclustered index
	u_cg
on
	agg_configs(agg_config_id)
go

create unique nonclustered index 
        u_cgn
on
        agg_configs(name)
go 

insert into keys values("agg_configs", 1)
go
		
