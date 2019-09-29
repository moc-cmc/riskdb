
if object_id("upd_prime_broker_symbols") != NULL
    drop trigger
        upd_prime_broker_symbols
go

create trigger
    upd_prime_broker_symbols
on
    prime_broker_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prime_broker_symbols: update "
        + convert(varchar(10), a.prime_broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    inserted a

go
