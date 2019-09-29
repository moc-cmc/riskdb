
if object_id("ins_legal_entities") != NULL
    drop trigger
        ins_legal_entities
go

create trigger
    ins_legal_entities
on
    legal_entities
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entities: insert "
        + convert(varchar(10), a.legal_entity_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
