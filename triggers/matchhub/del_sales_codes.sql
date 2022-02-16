
if object_id("del_sales_codes") != NULL
    drop trigger
        del_sales_codes
go

create trigger
    del_sales_codes
on
    sales_codes
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sales_codes: delete "
        + convert(varchar(10), a.sales_code_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
