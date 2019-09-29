
if object_id("message_types") != NULL
    drop table
        message_types
go

create table
    message_types (
        message_type_id int,
        name varchar(25)
    )
go

create unique index
    u_mt
on
    message_types (
        message_type_id
    )
go

create unique index
    n_mt
on
    message_types (
        name
    )
go

insert into message_types values(1, "Normal")

delete from keys where relation = "message_types"
insert into keys(relation, last_id) values("message_types", 1)

go
