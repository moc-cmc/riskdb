
if object_id("upd_providers") != NULL
    drop trigger
        upd_providers
go

create trigger
    upd_providers
on
    providers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".providers: update "
        + convert(varchar(10), a.provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
