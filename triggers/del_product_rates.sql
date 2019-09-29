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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rates: delete "
        + convert(varchar(10), product_rate_id) + " "
        + convert(varchar(10), product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), rate_date), 9) + "'"
    )
from
    deleted

go