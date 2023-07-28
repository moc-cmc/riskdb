
if object_id("del_dist_list_emails") != NULL
    drop trigger
        del_dist_list_emails
go

create trigger
    del_dist_list_emails
on
    dist_list_emails
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_list_emails: delete "
        + convert(varchar(10), a.dist_list_id) + " "
        + convert(varchar(10), a.email_id)
    )
from
    deleted a

go
