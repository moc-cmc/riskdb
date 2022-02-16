
if object_id("ins_emails") != NULL
    drop trigger
        ins_emails
go

create trigger
    ins_emails
on
    emails
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".emails: insert "
        + convert(varchar(10), a.email_id) + " "
        + "'" + str_replace(a.email, "'", "\'") + "'"
    )
from
    inserted a

go
