
if object_id("upd_user_emails") != NULL
    drop trigger
        upd_user_emails
go

create trigger
    upd_user_emails
on
    user_emails
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_emails: update "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.email_id)
    )
from
    inserted a

go
