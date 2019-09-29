
if object_id("ins_prime_broker_symbols") != NULL
    drop trigger
        ins_prime_broker_symbols
go

create trigger
    ins_prime_broker_symbols
on
    prime_broker_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prime_broker_symbols: insert "
        + convert(varchar(10), a.prime_broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    inserted a

go
