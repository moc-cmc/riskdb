
if object_id("upd_access_group_accounts") != NULL
    drop trigger
        upd_access_group_accounts
go

create trigger
    upd_access_group_accounts
on
    access_group_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".access_group_accounts: update "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.access_group_id)
    )
from
    inserted a

go
