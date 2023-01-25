
if object_id("user_agreement_types") != NULL
    drop table user_agreement_types
go

create table 
    user_agreement_types (
        user_agreement_type_id int,
        name varchar(50)              -- Manual, Clickwrap, (Third-Party)
    )
go

create unique nonclustered index 
    u_uat
on  
    user_agreement_types (
        user_agreement_type_id
    )
go

create unique nonclustered index 
    n_uat
on  
    user_agreement_types (
        name
    )
go

insert into user_agreement_types values(1, "Manual")
insert into user_agreement_types values(2, "Clickwrap")

if not exists(select * from keys where relation = "user_agreement_types")
	insert into keys values("user_agreement_types", 2)

if not exists(select * from tables where name = "user_agreement_types")
	insert into tables(name, table_type) values("user_agreement_types", "E")

go

