
if object_id("account_transaction_trades") != NULL
    drop table
        account_transaction_trades
go

create table
    account_transaction_trades (
        account_transaction_id int,
        trade_id int,
        conversion_rate float
    )
go
