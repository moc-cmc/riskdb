
if object_id("upd_current_prices") != NULL
    drop trigger
        upd_current_prices
go

create trigger
    upd_current_prices
on
    current_prices
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".current_prices: update "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    inserted a

go
