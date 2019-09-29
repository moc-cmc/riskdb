
if object_id("ins_aggregation_styles") != NULL
    drop trigger
        ins_aggregation_styles
go

create trigger
    ins_aggregation_styles
on
    aggregation_styles
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".aggregation_styles: insert "
        + convert(varchar(10), a.aggregation_style_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
