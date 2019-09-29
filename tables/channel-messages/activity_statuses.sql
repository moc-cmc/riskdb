
if object_id("activity_statuses") != NULL
    drop table
        activity_statuses
go

create table
    activity_statuses (
        activity_status_id int,
        name varchar(25)
    )
go

create unique index
    u_mrs
on
    activity_statuses (
        activity_status_id
    )
go

create unique index
    n_mrs
on
    activity_statuses (
        name
    )
go

insert into activity_statuses values(1, "Active")
insert into activity_statuses values(2, "Inactive")
insert into activity_statuses values(3, "Disabled")

delete from keys where relation = "activity_statuses"
insert into keys(relation, last_id) values("activity_statuses", 3)

go
