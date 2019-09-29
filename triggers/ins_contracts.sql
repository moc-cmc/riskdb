if object_id("ins_contracts") != NULL
    drop trigger
        ins_contracts
go

create trigger
    ins_contracts
on
    contracts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contracts: insert "
        + convert(varchar(10), contract_id) + " "
        + "'" + rtrim(str_replace(symbol, "'", "\'")) + "' "
        + convert(varchar(10), instrument_id)
    )
from
    inserted

go