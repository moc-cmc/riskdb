
if object_id("upd_sales_code_volumes") != NULL
    drop trigger
        upd_sales_code_volumes
go

create trigger
    upd_sales_code_volumes
on
    sales_code_volumes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sales_code_volumes: update "
        + convert(varchar(10), a.sales_code_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.volume_date), 9) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
