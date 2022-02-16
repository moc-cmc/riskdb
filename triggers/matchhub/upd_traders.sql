
if object_id("upd_traders") != NULL
    drop trigger
        upd_traders
go

create trigger
    upd_traders
on
    traders
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: update "
        + convert(varchar(10), a.trader_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.default_strategy_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.sales_code_id)
    )
from
    inserted a

go
