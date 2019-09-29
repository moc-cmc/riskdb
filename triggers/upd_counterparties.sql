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
        + convert(varchar(10), counterparty_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), external_account_id)
    )
from
    inserted

go