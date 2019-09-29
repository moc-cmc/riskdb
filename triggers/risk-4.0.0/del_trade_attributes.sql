
if object_id("del_trade_attributes") != NULL
    drop trigger
        del_trade_attributes
go

create trigger
    del_trade_attributes
on
    trade_attributes
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_attributes: delete "
        + convert(varchar(10), a.trade_id) + " "
        + (case when a.mid_mark = NULL then "NULL" else convert(varchar(50), a.mid_mark) end) + " "
        + (case when a.note = NULL then "NULL" else "'" + str_replace(a.note, "'", "\'") + "'" end)
    )
from
    deleted a

go
