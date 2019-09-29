if object_id("ins_traders") != NULL
    drop trigger
        ins_traders
go

create trigger
    ins_traders
on
    traders
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: insert "
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