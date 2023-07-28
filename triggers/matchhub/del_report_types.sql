
if object_id("del_report_types") != NULL
    drop trigger
        del_report_types
go

create trigger
    del_report_types
on
    report_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".report_types: delete "
        + convert(varchar(10), a.report_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
