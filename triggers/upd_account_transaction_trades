
if object_id("upd_account_transaction_trades") != NULL
    drop trigger
        upd_account_transaction_trades
go

create trigger
    upd_account_transaction_trades
on
    account_transaction_trades
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_transaction_trades: update "
        + convert(varchar(10), a.account_transaction_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(50), a.conversion_rate)
    )
from
    inserted a

go
