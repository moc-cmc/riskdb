
if object_id("del_trade_types") != NULL
    drop trigger
        del_trade_types
go

create trigger
    del_trade_types
on
    trade_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_types: delete "
        + convert(varchar(10), a.trade_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
