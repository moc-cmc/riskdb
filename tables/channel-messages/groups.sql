
if object_id("groups") != NULL
    drop table
        groups
go

create table
    groups (
        group_id int,
        name char(200),
        login_type_id int,
        activity_status_id int
    )
go

create unique index
    u_g
on
    groups (
        group_id
    )
go

create unique index
    n_g
on
    groups (
        name
    )
go

delete from keys where relation = "groups"
insert into keys(relation, last_id) values("groups", 0)
go

