
if object_id("del_counterparties") != NULL
    drop trigger
        del_counterparties
go

create trigger
    del_counterparties
on
    counterparties
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparties: delete "
        + convert(varchar(10), a.counterparty_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.external_account_id)
    )
from
    deleted a

go
