
if object_id("upd_tico_report_requests") != NULL
    drop trigger
        upd_tico_report_requests
go

create trigger
    upd_tico_report_requests
on
    tico_report_requests
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_report_requests: update "
        + convert(varchar(10), a.tico_report_request_id) + " "
        + convert(varchar(10), a.tico_report_id) + " "
        + "'" + convert(varchar(19), a.as_of_date, 23) + "." + substring(convert(varchar(15), a.as_of_date, 20), 10, 3) + "' "
        + "'" + convert(varchar(19), a.request_date, 23) + "." + substring(convert(varchar(15), a.request_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.status_id) + " "
        + (case when a.error = NULL then "NULL" else "'" + str_replace(a.error, "'", "\'") + "'" end) + " "
        + (case when a.modify_date = NULL then "NULL" else "'" + convert(varchar(19), a.modify_date, 23) + "." + substring(convert(varchar(15), a.modify_date, 20), 10, 3) + "'" end) + " "
        + (case when a.filename = NULL then "NULL" else "'" + str_replace(a.filename, "'", "\'") + "'" end) + " "
        + (case when a.params = NULL then "NULL" else "'" + str_replace(a.params, "'", "\'") + "'" end) + " "
        + (case when a.url = NULL then "NULL" else "'" + str_replace(a.url, "'", "\'") + "'" end)
    )
from
    inserted a

go
