
if object_id("ins_trade_attributes") != NULL
    drop trigger
        ins_trade_attributes
go

create trigger
    ins_trade_attributes
on
    trade_attributes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_attributes: insert "
        + convert(varchar(10), a.trade_id) + " "
        + (case when a.mid_mark = NULL then "NULL" else convert(varchar(50), a.mid_mark) end) + " "
        + (case when a.note = NULL then "NULL" else "'" + str_replace(a.note, "'", "\'") + "'" end)
    )
from
    inserted a

go
