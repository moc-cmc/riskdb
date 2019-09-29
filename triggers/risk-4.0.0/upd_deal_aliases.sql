
if object_id("upd_deal_aliases") != NULL
    drop trigger
        upd_deal_aliases
go

create trigger
    upd_deal_aliases
on
    deal_aliases
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_aliases: update "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    inserted a

go
