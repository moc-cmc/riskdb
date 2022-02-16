
if object_id("upd_group_accounts") != NULL
    drop trigger
        upd_group_accounts
go

create trigger
    upd_group_accounts
on
    group_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_accounts: update "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.tico_account_id)
    )
from
    inserted a

go
