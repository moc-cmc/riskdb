
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
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".traders: insert "
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
