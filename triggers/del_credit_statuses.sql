
if object_id("del_credit_statuses") != NULL
    drop trigger
        del_credit_statuses
go

create trigger
    del_credit_statuses
on
    credit_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_statuses: delete "
        + convert(varchar(10), a.credit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
