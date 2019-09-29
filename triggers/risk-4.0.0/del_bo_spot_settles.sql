
if object_id("del_bo_spot_settles") != NULL
    drop trigger
        del_bo_spot_settles
go

create trigger
    del_bo_spot_settles
on
    bo_spot_settles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_spot_settles: delete "
        + convert(varchar(10), a.bo_spot_settle_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.price_date), 9) + "' "
        + convert(varchar(50), a.price)
    )
from
    deleted a

go
