
if object_id("upd_product_rates") != NULL
    drop trigger
        upd_product_rates
go

create trigger
    upd_product_rates
on
    product_rates
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rates: update "
        + convert(varchar(10), a.product_rate_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(19), a.rate_date, 23) + "." + substring(convert(varchar(15), a.rate_date, 20), 10, 3) + "'"
    )
from
    inserted a

go
