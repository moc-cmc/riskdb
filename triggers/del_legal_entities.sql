
if object_id("del_legal_entities") != NULL
    drop trigger
        del_legal_entities
go

create trigger
    del_legal_entities
on
    legal_entities
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entities: delete "
        + convert(varchar(10), a.legal_entity_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
