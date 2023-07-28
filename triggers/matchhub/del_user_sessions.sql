
if object_id("del_user_sessions") != NULL
    drop trigger
        del_user_sessions
go

create trigger
    del_user_sessions
on
    user_sessions
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_sessions: delete "
        + convert(varchar(10), a.user_session_id) + " "
        + convert(varchar(10), a.user_app_version_id) + " "
        + convert(varchar(10), a.user_device_id) + " "
        + "'" + str_replace(a.identifier, "'", "\'") + "' "
        + (case when a.ip_address_id = NULL then "NULL" else convert(varchar(10), a.ip_address_id) end) + " "
        + (case when a.user_auth_id = NULL then "NULL" else convert(varchar(10), a.user_auth_id) end) + " "
        + (case when a.user_id = NULL then "NULL" else convert(varchar(10), a.user_id) end) + " "
        + "'" + convert(varchar(19), a.begin_date, 23) + "." + substring(convert(varchar(15), a.begin_date, 20), 10, 3) + "' "
        + (case when a.end_date = NULL then "NULL" else "'" + convert(varchar(19), a.end_date, 23) + "." + substring(convert(varchar(15), a.end_date, 20), 10, 3) + "'" end) + " "
        + convert(varchar(10), a.session_status_id)
    )
from
    deleted a

go
