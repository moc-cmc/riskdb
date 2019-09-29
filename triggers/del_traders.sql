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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: delete "
        + convert(varchar(10), trader_id) + " "
        + "'" + str_replace(symbol, "'", "\'") + "' "
        + convert(varchar(10), tico_account_id) + " "
        + convert(varchar(10), default_strategy_id) + " "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), sales_code_id)
    )
from
    deleted

go