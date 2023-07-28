
if object_id("upd_legal_entity_approvals") != NULL
    drop trigger
        upd_legal_entity_approvals
go

create trigger
    upd_legal_entity_approvals
on
    legal_entity_approvals
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".legal_entity_approvals: update "
        + convert(varchar(10), a.legal_entity_approval_id) + " "
        + convert(varchar(10), a.legal_entity_id) + " "
        + convert(varchar(10), a.tico_account_id) + " "
        + "'" + convert(varchar(19), a.approved_at, 23) + "." + substring(convert(varchar(15), a.approved_at, 20), 10, 3) + "'"
    )
from
    inserted a

go
