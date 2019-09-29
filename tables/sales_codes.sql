
if object_id("sales_codes") != NULL
    drop table
        sales_codes
go

create table
    sales_codes (
        sales_code_id int,
        name varchar(25)
    )
go
