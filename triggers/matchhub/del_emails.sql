
if object_id("del_emails") != NULL
    drop trigger
        del_emails
go

create trigger
    del_emails
on
    emails
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".emails: delete "
        + convert(varchar(10), a.email_id) + " "
        + "'" + str_replace(a.email, "'", "\'") + "'"
    )
from
    deleted a

go
