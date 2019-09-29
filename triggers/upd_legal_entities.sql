
if object_id("upd_legal_entities") != NULL
    drop trigger
        upd_legal_entities
go

create trigger
    upd_legal_entities
on
    legal_entities
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entities: update "
        + convert(varchar(10), a.legal_entity_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
