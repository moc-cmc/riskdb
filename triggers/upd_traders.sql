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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: update "
        + convert(varchar(10), trader_id) + " "
        + "'" + str_replace(symbol, "'", "\'") + "' "
        + convert(varchar(10), tico_account_id) + " "
        + convert(varchar(10), default_strategy_id) + " "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), sales_code_id)
    )
from
    inserted

go