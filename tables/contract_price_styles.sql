
if object_id("contract_price_styles") != NULL
    drop table
        contract_price_styles
go

create table
    contract_price_styles (
        contract_id int,
        price_style_id int,
        factor float,
        min_scale int default 4,
        max_scale int default 6
    )
go

create unique index
    u_cps
on
    contract_price_styles (
        contract_id
    )

go

