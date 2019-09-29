
if object_id("traders") != NULL
    drop table
        traders
go

create table
    traders (
        trader_id int,
        symbol varchar(50),
        tico_account_id int,
        default_strategy_id int,
        external_account_id int,
        sales_code_id int
    )
go
