
if object_id("del_account_transaction_trades") != NULL
    drop trigger
        del_account_transaction_trades
go

create trigger
    del_account_transaction_trades
on
    account_transaction_trades
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_transaction_trades: delete "
        + convert(varchar(10), a.account_transaction_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(50), a.conversion_rate)
    )
from
    deleted a

go
