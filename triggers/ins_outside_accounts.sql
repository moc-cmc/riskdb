
if object_id("ins_outside_accounts") != NULL
    drop trigger
        ins_outside_accounts
go

create trigger
    ins_outside_accounts
on
    outside_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_accounts: insert "
        + convert(varchar(10), a.outside_account_id) + " "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
