
if object_id("upd_broker_volumes") != NULL
    drop trigger
        upd_broker_volumes
go

create trigger
    upd_broker_volumes
on
    broker_volumes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".broker_volumes: update "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
