
if object_id("ins_product_rate_points") != NULL
    drop trigger
        ins_product_rate_points
go

create trigger
    ins_product_rate_points
on
    product_rate_points
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rate_points: insert "
        + convert(varchar(10), a.product_rate_id) + " "
        + convert(varchar(50), a.days) + " "
        + convert(varchar(50), a.rate)
    )
from
    inserted a

go
