
if object_id("user_agreements") != NULL
    drop table user_agreements
go

create table 
    user_agreements (
        user_agreement_id int,
        name varchar(75),               -- used as a key to impl names
        title varchar(100),             -- displayed to the user
        user_agreement_type_id int,     -- format, impl
        begin_date datetime,            -- available date
        end_date datetime null,         -- end availability date or open ended
        source_id int,                  -- entity responsible (or legal_entity?)
        activity_status_id int,         -- must be Active to use
    )
go

create unique nonclustered index 
    u_ua
on  
    user_agreements (
        user_agreement_id
    )
go

create unique nonclustered index 
    n_ua
on  
    user_agreements (
        name
    )
go

if not exists(select * from keys where relation = "user_agreements")
	insert into keys values("user_agreements", 0)

if not exists(select * from tables where name = "user_agreements")
	insert into tables(name, table_type) values("user_agreements", "L")

go
