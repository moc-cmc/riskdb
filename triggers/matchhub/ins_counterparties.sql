
if object_id("ins_counterparties") != NULL
    drop trigger
        ins_counterparties
go

create trigger
    ins_counterparties
on
    counterparties
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparties: insert "
        + convert(varchar(10), a.counterparty_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
