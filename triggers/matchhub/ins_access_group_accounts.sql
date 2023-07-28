
if object_id("ins_access_group_accounts") != NULL
    drop trigger
        ins_access_group_accounts
go

create trigger
    ins_access_group_accounts
on
    access_group_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".access_group_accounts: insert "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.access_group_id)
    )
from
    inserted a

go
