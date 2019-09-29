
if object_id("del_access_group_accounts") != NULL
    drop trigger
        del_access_group_accounts
go

create trigger
    del_access_group_accounts
on
    access_group_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".access_group_accounts: delete "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.access_group_id)
    )
from
    deleted a

go
