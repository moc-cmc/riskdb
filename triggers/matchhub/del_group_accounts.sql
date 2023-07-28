
if object_id("del_group_accounts") != NULL
    drop trigger
        del_group_accounts
go

create trigger
    del_group_accounts
on
    group_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_accounts: delete "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.tico_account_id)
    )
from
    deleted a

go
