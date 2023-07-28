
if object_id("del_prime_broker_symbols") != NULL
    drop trigger
        del_prime_broker_symbols
go

create trigger
    del_prime_broker_symbols
on
    prime_broker_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prime_broker_symbols: delete "
        + convert(varchar(10), a.prime_broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    deleted a

go
