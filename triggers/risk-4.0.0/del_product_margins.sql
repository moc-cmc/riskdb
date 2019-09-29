
if object_id("del_product_margins") != NULL
    drop trigger
        del_product_margins
go

create trigger
    del_product_margins
on
    product_margins
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_margins: delete "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.margin) + " "
        + convert(varchar(10), a.prime_broker_id)
    )
from
    deleted a

go
