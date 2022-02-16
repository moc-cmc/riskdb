
if object_id("ins_legal_entity_tico_accounts") != NULL
    drop trigger
        ins_legal_entity_tico_accounts
go

create trigger
    ins_legal_entity_tico_accounts
on
    legal_entity_tico_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_tico_accounts: insert "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.tico_account_id)
    )
from
    inserted a

go
