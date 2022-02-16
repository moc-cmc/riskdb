
if object_id("ins_credit_statuses") != NULL
    drop trigger
        ins_credit_statuses
go

create trigger
    ins_credit_statuses
on
    credit_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_statuses: insert "
        + convert(varchar(10), a.credit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
