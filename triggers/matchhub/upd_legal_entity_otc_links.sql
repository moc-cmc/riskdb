
if object_id("upd_legal_entity_otc_links") != NULL
    drop trigger
        upd_legal_entity_otc_links
go

create trigger
    upd_legal_entity_otc_links
on
    legal_entity_otc_links
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_otc_links: update "
        + convert(varchar(10), a.legal_entity_otc_link_id) + " "
        + convert(varchar(10), a.entering_legal_entity_id) + " "
        + convert(varchar(10), a.available_legal_entity_id)
    )
from
    inserted a

go
