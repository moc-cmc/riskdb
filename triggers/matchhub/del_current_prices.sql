
if object_id("del_current_prices") != NULL
    drop trigger
        del_current_prices
go

create trigger
    del_current_prices
on
    current_prices
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".current_prices: delete "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    deleted a

go
