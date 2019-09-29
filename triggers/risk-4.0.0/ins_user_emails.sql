
if object_id("ins_user_emails") != NULL
    drop trigger
        ins_user_emails
go

create trigger
    ins_user_emails
on
    user_emails
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_emails: insert "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.email_id)
    )
from
    inserted a

go
