
if object_id("upd_deal_types") != NULL
    drop trigger
        upd_deal_types
go

create trigger
    upd_deal_types
on
    deal_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_types: update "
        + convert(varchar(10), a.deal_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
