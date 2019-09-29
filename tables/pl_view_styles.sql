
if object_id("pl_view_styles") != NULL
    drop table
        pl_view_styles
go

create table
    pl_view_styles (
        pl_view_style_id int,
        name char(50)
    )
go
