
if object_id("upd_product_rate_points") != NULL
    drop trigger
        upd_product_rate_points
go

create trigger
    upd_product_rate_points
on
    product_rate_points
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rate_points: update "
        + convert(varchar(10), a.product_rate_id) + " "
        + convert(varchar(50), a.days) + " "
        + convert(varchar(50), a.rate)
    )
from
    inserted a

go
