
if object_id("report_types") != NULL
    drop table
        report_types
go

create table
    report_types (
        report_type_id int,
        name varchar(50)
    )
go
