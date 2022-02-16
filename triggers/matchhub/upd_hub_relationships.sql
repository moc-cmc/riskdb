
if object_id("upd_hub_relationships") != NULL
    drop trigger
        upd_hub_relationships
go

create trigger
    upd_hub_relationships
on
    hub_relationships
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".hub_relationships: update "
        + convert(varchar(10), a.hub_relationship_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.counterparty_id) + " "
        + (case when a.aggregation_enabled = NULL then "NULL" else "'" + rtrim(str_replace(a.aggregation_enabled, "'", "\'")) + "'" end) + " "
        + (case when a.status_id = NULL then "NULL" else convert(varchar(10), a.status_id) end)
    )
from
    inserted a

go
