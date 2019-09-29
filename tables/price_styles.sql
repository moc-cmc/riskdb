
if object_id("price_styles") != NULL
    drop table
        price_styles
go

create table
    price_styles (
        price_style_id int,
        name char(100),
        factor float
    )
go
