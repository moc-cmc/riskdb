
if object_id("upd_bo_spot_settles") != NULL
    drop trigger
        upd_bo_spot_settles
go

create trigger
    upd_bo_spot_settles
on
    bo_spot_settles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_spot_settles: update "
        + convert(varchar(10), a.bo_spot_settle_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + convert(varchar(19), a.price_date, 23) + "." + substring(convert(varchar(15), a.price_date, 20), 10, 3) + "' "
        + convert(varchar(50), a.price)
    )
from
    inserted a

go
