
if object_id("del_counterparty_volumes") != NULL
    drop trigger
        del_counterparty_volumes
go

create trigger
    del_counterparty_volumes
on
    counterparty_volumes
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparty_volumes: delete "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    deleted a

go
