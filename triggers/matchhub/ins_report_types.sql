
if object_id("ins_report_types") != NULL
    drop trigger
        ins_report_types
go

create trigger
    ins_report_types
on
    report_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".report_types: insert "
        + convert(varchar(10), a.report_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
