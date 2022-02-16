
if object_id("del_aggregation_styles") != NULL
    drop trigger
        del_aggregation_styles
go

create trigger
    del_aggregation_styles
on
    aggregation_styles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".aggregation_styles: delete "
        + convert(varchar(10), a.aggregation_style_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
