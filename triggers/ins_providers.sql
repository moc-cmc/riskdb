
if object_id("ins_providers") != NULL
    drop trigger
        ins_providers
go

create trigger
    ins_providers
on
    providers
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".providers: insert "
        + convert(varchar(10), a.provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
