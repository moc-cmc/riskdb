
if object_id("del_product_rate_points") != NULL
    drop trigger
        del_product_rate_points
go

create trigger
    del_product_rate_points
on
    product_rate_points
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rate_points: delete "
        + convert(varchar(10), a.product_rate_id) + " "
        + convert(varchar(50), a.days) + " "
        + convert(varchar(50), a.rate)
    )
from
    deleted a

go
