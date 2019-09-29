
if object_id("colors") != NULL
    drop table
        colors
go

create table
    colors (
        color_id int,
        name char(20),
        html_name char(50)
    )
go
