
if object_id("ins_external_account_types") != NULL
    drop trigger
        ins_external_account_types
go

create trigger
    ins_external_account_types
on
    external_account_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_types: insert "
        + convert(varchar(50), a.external_account_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
