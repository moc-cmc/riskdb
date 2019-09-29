
if object_id("upd_strategy_volumes") != NULL
    drop trigger
        upd_strategy_volumes
go

create trigger
    upd_strategy_volumes
on
    strategy_volumes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".strategy_volumes: update "
        + convert(varchar(10), a.strategy_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
