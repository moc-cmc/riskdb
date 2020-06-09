
if object_id("del_trade_volumes") != NULL
    drop trigger
        del_trade_volumes
go

create trigger
    del_trade_volumes
on
    trade_volumes
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_volumes: delete "
        + convert(varchar(10), a.trade_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.volume)
    )
from
    deleted a

go
