
if object_id("ins_deal_exec_symbols") != NULL
    drop trigger
        ins_deal_exec_symbols
go

create trigger
    ins_deal_exec_symbols
on
    deal_exec_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_exec_symbols: insert "
        + convert(varchar(10), a.deal_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    inserted a

go
