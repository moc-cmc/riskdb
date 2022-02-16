
if object_id("del_contract_symbols") != NULL
    drop trigger
        del_contract_symbols
go

create trigger
    del_contract_symbols
on
    contract_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contract_symbols: delete "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    deleted a

go
