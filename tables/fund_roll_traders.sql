
if object_id("fund_roll_traders") != NULL
    drop table
        fund_roll_traders
go

create table
    fund_roll_traders (
        fund_id int,
        roll_trader_id int
    )
go
