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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_rates: update "
        + convert(varchar(10), product_rate_id) + " "
        + convert(varchar(10), product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), rate_date), 9) + "'"
    )
from
    inserted

go