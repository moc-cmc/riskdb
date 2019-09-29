
if object_id("upd_counterparties") != NULL
    drop trigger
        upd_counterparties
go

create trigger
    upd_counterparties
on
    counterparties
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparties: update "
        + convert(varchar(10), a.counterparty_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
