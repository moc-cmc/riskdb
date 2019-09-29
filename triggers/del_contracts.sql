if object_id("del_contracts") != NULL
    drop trigger
        del_contracts
go

create trigger
    del_contracts
on
    contracts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contracts: delete "
        + convert(varchar(10), contract_id) + " "
        + "'" + rtrim(str_replace(symbol, "'", "\'")) + "' "
        + convert(varchar(10), instrument_id)
    )
from
    deleted

go