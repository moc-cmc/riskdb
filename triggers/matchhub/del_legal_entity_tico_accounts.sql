
if object_id("del_legal_entity_tico_accounts") != NULL
    drop trigger
        del_legal_entity_tico_accounts
go

create trigger
    del_legal_entity_tico_accounts
on
    legal_entity_tico_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_tico_accounts: delete "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.tico_account_id)
    )
from
    deleted a

go
