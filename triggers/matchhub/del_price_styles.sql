
if object_id("del_price_styles") != NULL
    drop trigger
        del_price_styles
go

create trigger
    del_price_styles
on
    price_styles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".price_styles: delete "
        + convert(varchar(10), a.price_style_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(50), a.factor)
    )
from
    deleted a

go
