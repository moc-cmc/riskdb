
if object_id("del_legal_entity_otc_links") != NULL
    drop trigger
        del_legal_entity_otc_links
go

create trigger
    del_legal_entity_otc_links
on
    legal_entity_otc_links
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_otc_links: delete "
        + convert(varchar(10), a.legal_entity_otc_link_id) + " "
        + convert(varchar(10), a.entering_legal_entity_id) + " "
        + convert(varchar(10), a.available_legal_entity_id)
    )
from
    deleted a

go

