
if object_id("ins_deal_aliases") != NULL
    drop trigger
        ins_deal_aliases
go

create trigger
    ins_deal_aliases
on
    deal_aliases
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_aliases: insert "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    inserted a

go
