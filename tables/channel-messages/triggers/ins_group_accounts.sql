
if object_id("ins_group_accounts") != NULL
    drop trigger
        ins_group_accounts
go

create trigger
    ins_group_accounts
on
    group_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_accounts: insert "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.tico_account_id)
    )
from
    inserted a

go
