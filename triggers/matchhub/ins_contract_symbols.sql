
if object_id("ins_contract_symbols") != NULL
    drop trigger
        ins_contract_symbols
go

create trigger
    ins_contract_symbols
on
    contract_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contract_symbols: insert "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
