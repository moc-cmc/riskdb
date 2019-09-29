
if object_id("del_user_emails") != NULL
    drop trigger
        del_user_emails
go

create trigger
    del_user_emails
on
    user_emails
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_emails: delete "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.email_id)
    )
from
    deleted a

go
