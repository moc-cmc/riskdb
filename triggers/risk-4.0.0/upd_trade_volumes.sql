
if object_id("upd_trade_volumes") != NULL
    drop trigger
        upd_trade_volumes
go

create trigger
    upd_trade_volumes
on
    trade_volumes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_volumes: update "
        + convert(varchar(10), a.trade_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.volume)
    )
from
    inserted a

go
