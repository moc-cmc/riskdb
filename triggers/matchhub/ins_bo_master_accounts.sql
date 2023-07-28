
if object_id("ins_bo_master_accounts") != NULL
    drop trigger
        ins_bo_master_accounts
go

create trigger
    ins_bo_master_accounts
on
    bo_master_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_master_accounts: insert "
        + convert(varchar(10), a.bo_master_account_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.legal_entity_id)
    )
from
    inserted a

go
