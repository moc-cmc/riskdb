
if object_id("ins_prices") != NULL
    drop trigger
        ins_prices
go

create trigger
    ins_prices
on
    prices
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prices: insert "
        + convert(varchar(10), a.price_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(19), a.price_date, 23) + "." + substring(convert(varchar(15), a.price_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.price_type_id) + " "
        + convert(varchar(50), a.price)
    )
from
    inserted a

go
