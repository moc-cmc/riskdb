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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparties: insert "
        + convert(varchar(10), counterparty_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), external_account_id)
    )
from
    inserted

go