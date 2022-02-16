
if object_id("del_outside_accounts") != NULL
    drop trigger
        del_outside_accounts
go

create trigger
    del_outside_accounts
on
    outside_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_accounts: delete "
        + convert(varchar(10), a.outside_account_id) + " "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
