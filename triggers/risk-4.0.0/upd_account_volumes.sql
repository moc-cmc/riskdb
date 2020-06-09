
if object_id("upd_account_volumes") != NULL
    drop trigger
        upd_account_volumes
go

create trigger
    upd_account_volumes
on
    account_volumes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_volumes: update "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
