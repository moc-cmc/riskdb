
if object_id("group_addresses") != NULL
    drop table
        group_addresses
go

create table
    group_addresses (
        group_address_id int,
        group_id int,
        address_type_id int,
        address varchar(100),
        token varchar(100) NULL,
        min_priority_id int,
        activity_status_id int /* Pending, Active */
    )
go

create unique index
    u_ga
on
    group_addresses (
        group_address_id
    )
go

create unique index
    ua_ga
on
    group_addresses (
        group_id,
        address
    )
go

delete from keys where relation = "group_addresses"
insert into keys(relation, last_id) values("group_addresses", 0)
go

