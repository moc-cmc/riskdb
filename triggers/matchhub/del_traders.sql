
if object_id("del_traders") != NULL
    drop trigger
        del_traders
go

create trigger
    del_traders
on
    traders
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: delete "
        + convert(varchar(10), a.trader_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.default_strategy_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.sales_code_id)
    )
from
    deleted a

go
