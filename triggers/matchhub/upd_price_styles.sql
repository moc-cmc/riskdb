
if object_id("upd_price_styles") != NULL
    drop trigger
        upd_price_styles
go

create trigger
    upd_price_styles
on
    price_styles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".price_styles: update "
        + convert(varchar(10), a.price_style_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(50), a.factor)
    )
from
    inserted a

go
