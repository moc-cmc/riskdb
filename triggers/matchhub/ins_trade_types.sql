
if object_id("ins_trade_types") != NULL
    drop trigger
        ins_trade_types
go

create trigger
    ins_trade_types
on
    trade_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_types: insert "
        + convert(varchar(10), a.trade_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
