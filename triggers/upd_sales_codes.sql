if object_id("upd_sales_codes") != NULL
    drop trigger
        upd_sales_codes
go

create trigger
    upd_sales_codes
on
    sales_codes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sales_codes: update "
        + convert(varchar(10), sales_code_id) + " "
        + "'" + str_replace(name, "'", "\'") + "'"
    )
from
    inserted

go