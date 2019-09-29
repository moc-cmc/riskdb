
if object_id("archive_pl_view_styles") != NULL
    drop table
        archive_pl_view_styles
go

create table
    archive_pl_view_styles (
        pl_view_style_id int,
        name char(50)
    )
go

