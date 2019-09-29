
if object_id("address_types") != NULL
    drop table
        address_types
go

create table
    address_types (
        address_type_id int,
        name varchar(25)
    )
go

create unique index
    u_at
on
    address_types (
        address_type_id
    )
go

create unique index
    n_at
on
    address_types (
        name
    )
go

insert into address_types values(1, "Email")
insert into address_types values(2, "Mobile")

delete from keys where relation = "address_types"
insert into keys(relation, last_id) values("address_types", 2)

go
