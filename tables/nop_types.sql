
if object_id("nop_types") != NULL
    drop table
        nop_types
go

create table
    nop_types (
        nop_type_id int identity,
        name varchar(25),
        incl_longs char(1),
        incl_shorts char(1),
        incl_base_ccy char(1)
    )
go

insert into nop_types values("Net", "Y", "Y", "N")
insert into nop_types values("Shorts", "N", "Y", "Y")
insert into nop_types values("Longs", "Y", "N", "Y")
insert into nop_types values("Aggregate Shorts", "N", "Y", "N")
insert into nop_types values("Aggregate Longs", "Y", "N", "N")
go
