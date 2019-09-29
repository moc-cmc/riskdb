if object_id("fund_resid_traders") != NULL
    drop table
        fund_resid_traders
go

create table
    fund_resid_traders (
        fund_id int,
        resid_trader_id int
    )
go
