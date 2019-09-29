
if object_id("upd_aggregation_styles") != NULL
    drop trigger
        upd_aggregation_styles
go

create trigger
    upd_aggregation_styles
on
    aggregation_styles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".aggregation_styles: update "
        + convert(varchar(10), a.aggregation_style_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
