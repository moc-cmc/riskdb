
if object_id("ins_account_transaction_trades") != NULL
    drop trigger
        ins_account_transaction_trades
go

create trigger
    ins_account_transaction_trades
on
    account_transaction_trades
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_transaction_trades: insert "
        + convert(varchar(10), a.account_transaction_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(50), a.conversion_rate)
    )
from
    inserted a

go
