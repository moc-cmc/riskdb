
if object_id("upd_product_margins") != NULL
    drop trigger
        upd_product_margins
go

create trigger
    upd_product_margins
on
    product_margins
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_margins: update "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.margin) + " "
        + convert(varchar(10), a.prime_broker_id)
    )
from
    inserted a

go
