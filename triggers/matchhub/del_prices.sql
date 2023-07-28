
if object_id("del_prices") != NULL
    drop trigger
        del_prices
go

create trigger
    del_prices
on
    prices
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prices: delete "
        + convert(varchar(10), a.price_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(19), a.price_date, 23) + "." + substring(convert(varchar(15), a.price_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.price_type_id) + " "
        + convert(varchar(50), a.price)
    )
from
    deleted a

go
