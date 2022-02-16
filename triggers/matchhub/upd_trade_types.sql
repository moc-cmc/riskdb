
if object_id("upd_trade_types") != NULL
    drop trigger
        upd_trade_types
go

create trigger
    upd_trade_types
on
    trade_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_types: update "
        + convert(varchar(10), a.trade_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
