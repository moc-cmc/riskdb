
if object_id("upd_emails") != NULL
    drop trigger
        upd_emails
go

create trigger
    upd_emails
on
    emails
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".emails: update "
        + convert(varchar(10), a.email_id) + " "
        + "'" + str_replace(a.email, "'", "\'") + "'"
    )
from
    inserted a

go
