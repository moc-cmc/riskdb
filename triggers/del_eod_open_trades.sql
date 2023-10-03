
if object_id("del_eod_open_trades") != NULL
    drop trigger
        del_eod_open_trades
go

create trigger
    del_eod_open_trades
on
    eod_open_trades
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".eod_open_trades: delete "
        + convert(varchar(10), a.id) + " "
        + "'" + convert(varchar(19), a.eod_date, 23) + "." + substring(convert(varchar(15), a.eod_date, 20), 10, 3) + "' "
        + "'" + convert(varchar(19), a.trade_date, 23) + "." + substring(convert(varchar(15), a.trade_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(19), a.value_date, 23) + "." + substring(convert(varchar(15), a.value_date, 20), 10, 3) + "' "
        + convert(varchar(50), a.open_amount) + " "
        + convert(varchar(50), a.price) + " "
        + (case when a.current_price = NULL then "NULL" else convert(varchar(50), a.current_price) end) + " "
        + (case when a.currency_id = NULL then "NULL" else convert(varchar(10), a.currency_id) end) + " "
        + (case when a.unrealized_pl = NULL then "NULL" else convert(varchar(50), a.unrealized_pl) end)
    )
from
    deleted a

go
