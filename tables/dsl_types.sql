
if object_id("dsl_types") != NULL
    drop table
        dsl_types
go

create table
    dsl_types (
        dsl_type_id int identity,
        name varchar(25),
        incl_longs char(1),
        incl_shorts char(1),
        incl_base_ccy char(1)
    )
go

insert into dsl_types values("Net", "Y", "Y", "N")
insert into dsl_types values("Shorts", "N", "Y", "Y")
insert into dsl_types values("Longs", "Y", "N", "Y")
go
