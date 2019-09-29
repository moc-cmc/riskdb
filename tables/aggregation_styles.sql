
if object_id("aggregation_styles") != NULL
    drop table
        aggregation_styles
go

create table
    aggregation_styles (
        aggregation_style_id int identity,
        name varchar(25)
    )
go
