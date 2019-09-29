
if object_id("fund_agency_traders") != NULL
    drop table
        fund_agency_traders
go

create table
    fund_agency_traders (
        fund_id int,
        trader_id int
    )
go

create unique index
    u_fat
on
    fund_agency_traders (
        fund_id,
        trader_id
    )
go
