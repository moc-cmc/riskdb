
if object_id("upd_credit_statuses") != NULL
    drop trigger
        upd_credit_statuses
go

create trigger
    upd_credit_statuses
on
    credit_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_statuses: update "
        + convert(varchar(10), a.credit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
