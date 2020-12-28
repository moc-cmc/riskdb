if object_id("upd_matchhub_trades") != NULL
    drop trigger
        upd_matchhub_trades
go

create trigger
    upd_matchhub_trades
on
    matchhub_trades
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".matchhub_trades: update "
        + convert(varchar(10), a.matchhub_trade_id) + " "
        + "'" + convert(varchar(19), a.capture_date, 23) + "." + substring(convert(varchar(15), a.capture_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.account_id) + " "
        + convert(varchar(10), a.trader_id) + " "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(19), a.trade_date, 23) + "." + substring(convert(varchar(15), a.trade_date, 20), 10, 3) + "' "
        + "'" + convert(varchar(19), a.value_date, 23) + "." + substring(convert(varchar(15), a.value_date, 20), 10, 3) + "' "
        + (case when a.far_price = NULL then "NULL" else convert(varchar(50), a.far_price) end) + " "
        + (case when a.far_value_date = NULL then "NULL" else "'" + convert(varchar(19), a.far_value_date, 23) + "." + substring(convert(varchar(15), a.far_value_date, 20), 10, 3) + "'" end) + " "
        + convert(varchar(10), a.broker_id) + " "
        + "'" + str_replace(a.identifier, "'", "\'") + "' "
        + (case when a.confirmed_by = NULL then "NULL" else convert(varchar(10), a.confirmed_by) end) + " "
        + (case when a.confirmed_at = NULL then "NULL" else "'" + convert(varchar(19), a.confirmed_at, 23) + "." + substring(convert(varchar(15), a.confirmed_at, 20), 10, 3) + "'" end) + " "
        + (case when a.confirm_status_id = NULL then "NULL" else convert(varchar(10), a.confirm_status_id) end) + " "
        + (case when a.confirm_response_date = NULL then "NULL" else "'" + convert(varchar(19), a.confirm_response_date, 23) + "." + substring(convert(varchar(15), a.confirm_response_date, 20), 10, 3) + "'" end) + " "
        + (case when a.confirm_message = NULL then "NULL" else "'" + str_replace(a.confirm_message, "'", "\'") + "'" end)
    )
from
    inserted a

go
