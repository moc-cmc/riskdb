
if object_id("nop_models") != NULL
    drop table
        nop_models
go

create table
    nop_models (
        nop_model_id int identity,
        name varchar(100),
        long_multiplier float,
        short_multiplier float,
        base_ccy_multiplier float,
        abs_multiplier float,
        use_max_sum char(2)
    )
go

create unique nonclustered index 
	u_nm
on
    nop_models (
        nop_model_id
    )
go

create unique nonclustered index 
	n_nm
on
	nop_models (
        name
    )
go

insert into nop_models values("Net", 1.0, 1.0, 0.0, 0.0, "N")
insert into nop_models values("Shorts", 0.0, 1.0, 1.0, 0.0, "N")
insert into nop_models values("Longs", 1.0, 0.0, 1.0, 0.0, "N")
insert into nop_models values("Aggregate Shorts", 0.0, 1.0, 0.0, 0.0, "N")
insert into nop_models values("Aggregate Longs", 1.0, 0.0, 0.0, 0.0, "N")
insert into nop_models values("Max Long Shorts", 1.0, 1.0, 1.0, 0.0, "Y")
insert into nop_models values("Max Agg Longs Shorts", 1.0, 1.0, 0.0, 0.0, "Y")
insert into nop_models values("Always", 1.0, 1.0, 1.0, 0.0, "N")
insert into nop_models values("Always Aggregate", 0.0, 0.0, 0.0, 1.0, "N")

go
