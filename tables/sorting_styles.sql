
if object_id("sorting_styles") != NULL
    drop table
        sorting_styles
go

create table
    sorting_styles (
        sorting_style_id int,
        name char(50)
    )
go
