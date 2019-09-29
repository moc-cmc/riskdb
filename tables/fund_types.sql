
if object_id("fund_types") != NULL
    drop table
        fund_types
go

create table
    fund_types (
        fund_type_id int,
        name varchar(50)
    )
go
