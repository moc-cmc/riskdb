
if object_id("ins_legal_entity_otc_links") != NULL
    drop trigger
        ins_legal_entity_otc_links
go

create trigger
    ins_legal_entity_otc_links
on
    legal_entity_otc_links
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_otc_links: insert "
        + convert(varchar(10), a.legal_entity_otc_link_id) + " "
        + convert(varchar(10), a.entering_legal_entity_id) + " "
        + convert(varchar(10), a.available_legal_entity_id)
    )
from
    inserted a

go
