
if object_id("ins_sales_codes") != NULL
    drop trigger
        ins_sales_codes
go

create trigger
    ins_sales_codes
on
    sales_codes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sales_codes: insert "
        + convert(varchar(10), a.sales_code_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
