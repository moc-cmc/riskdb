
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
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".broker_volumes: update "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(19), a.volume_date, 23) + "." + substring(convert(varchar(15), a.volume_date, 20), 10, 3) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count) + " "
        + (case when a.adj_count = NULL then "NULL" else convert(varchar(10), a.adj_count) end) + " "
        + (case when a.volume_adj = NULL then "NULL" else convert(varchar(10), a.volume_adj) end)
    )
from
    inserted a

go
