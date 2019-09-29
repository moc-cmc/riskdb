
if object_id("del_tico_reports") != NULL
    drop trigger
        del_tico_reports
go

create trigger
    del_tico_reports
on
    tico_reports
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_reports: delete "
        + convert(varchar(10), a.tico_report_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.run_id) + " "
        + "'" + str_replace(a.proc_name, "'", "\'") + "' "
        + "'" + str_replace(a.filename_tmpl, "'", "\'") + "' "
        + "'" + str_replace(a.params_tmpl, "'", "\'") + "' "
        + convert(varchar(10), a.report_user_id) + " "
        + convert(varchar(10), a.status_id)
    )
from
    deleted a

go
