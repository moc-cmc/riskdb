
if object_id("del_bo_master_accounts") != NULL
    drop trigger
        del_bo_master_accounts
go

create trigger
    del_bo_master_accounts
on
    bo_master_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_master_accounts: delete "
        + convert(varchar(10), a.bo_master_account_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.legal_entity_id)
    )
from
    deleted a

go
