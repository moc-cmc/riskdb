
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
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entities: insert "
        + convert(varchar(10), a.legal_entity_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.lei = NULL then "NULL" else "'" + str_replace(a.lei, "'", "\'") + "'" end) + " "
        + (case when a.status_id = NULL then "NULL" else convert(varchar(10), a.status_id) end) + " "
        + (case when a.label = NULL then "NULL" else "'" + str_replace(a.label, "'", "\'") + "'" end)
    )
from
    inserted a

go
