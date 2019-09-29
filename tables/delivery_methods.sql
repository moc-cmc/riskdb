
if object_id("delivery_methods") != NULL
    drop table
        delivery_methods
go

create table
    delivery_methods (
        delivery_method_id int identity,
        name varchar(25)
    )
go

create unique index
    n_dm
on
    delivery_methods (
        name
    )
go

insert into delivery_methods values("Email")
insert into delivery_methods values("SMS")
insert into delivery_methods values("Mission Control")
go
