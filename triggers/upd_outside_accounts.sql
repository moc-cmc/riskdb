
if object_id("upd_outside_accounts") != NULL
    drop trigger
        upd_outside_accounts
go

create trigger
    upd_outside_accounts
on
    outside_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_accounts: update "
        + convert(varchar(10), a.outside_account_id) + " "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
