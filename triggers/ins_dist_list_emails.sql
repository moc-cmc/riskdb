if object_id("ins_dist_list_emails") != NULL
    drop trigger
        ins_dist_list_emails
go

create trigger
    ins_dist_list_emails
on
    dist_list_emails
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_list_emails: insert "
        + convert(varchar(10), a.dist_list_id) + " "
        + convert(varchar(10), a.email_id)
    )
from
    inserted a

go
