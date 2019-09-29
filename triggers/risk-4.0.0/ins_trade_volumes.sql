
if object_id("ins_trade_volumes") != NULL
    drop trigger
        ins_trade_volumes
go

create trigger
    ins_trade_volumes
on
    trade_volumes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_volumes: insert "
        + convert(varchar(10), a.trade_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.volume)
    )
from
    inserted a

go
