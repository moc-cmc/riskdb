
if object_id("del_bo_internal_accounts") != NULL
    drop trigger
        del_bo_internal_accounts
go

create trigger
    del_bo_internal_accounts
on
    bo_internal_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_internal_accounts: delete "
        + convert(varchar(10), a.bo_internal_account_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.legal_entity_id)
    )
from
    deleted a

go
