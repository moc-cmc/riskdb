
if object_id("del_product_rates") != NULL
    drop trigger
        del_product_rates
go

create trigger
    del_product_rates
on
    product_rates
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rates: delete "
        + convert(varchar(10), a.product_rate_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(19), a.rate_date, 23) + "." + substring(convert(varchar(15), a.rate_date, 20), 10, 3) + "'"
    )
from
    deleted a

go
