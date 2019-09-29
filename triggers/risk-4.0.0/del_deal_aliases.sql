
if object_id("del_deal_aliases") != NULL
    drop trigger
        del_deal_aliases
go

create trigger
    del_deal_aliases
on
    deal_aliases
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_aliases: delete "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    deleted a

go
