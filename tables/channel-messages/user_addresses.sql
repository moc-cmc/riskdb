
if object_id("user_addresses") != NULL
    drop table
        user_addresses
go

create table
    user_addresses (
        user_address_id int,
        user_id int,
        address_type_id int,
        address varchar(100),
        token varchar(100) NULL,
        min_priority_id int,
        activity_status_id int /* Pending, Active */
    )
go

create unique index
    u_ua
on
    user_addresses (
        user_address_id
    )
go

create unique index
    ua_ua
on
    user_addresses (
        user_id,
        address
    )
go

delete from keys where relation = "user_addresses"
insert into keys(relation, last_id) values("user_addresses", 0)
go

