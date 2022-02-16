
if object_id("upd_bo_internal_accounts") != NULL
    drop trigger
        upd_bo_internal_accounts
go

create trigger
    upd_bo_internal_accounts
on
    bo_internal_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_internal_accounts: update "
        + convert(varchar(10), a.bo_internal_account_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.legal_entity_id)
    )
from
    inserted a

go
