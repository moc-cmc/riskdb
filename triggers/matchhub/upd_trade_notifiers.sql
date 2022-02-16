
if object_id("upd_trade_notifiers") != NULL
    drop trigger
        upd_trade_notifiers
go

create trigger
    upd_trade_notifiers
on
    trade_notifiers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_notifiers: update "
        + convert(varchar(10), a.trade_notifier_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + (case when a.external_account_id = NULL then "NULL" else convert(varchar(10), a.external_account_id) end) + " "
        + (case when a.broker_id = NULL then "NULL" else convert(varchar(10), a.broker_id) end) + " "
        + (case when a.trader_id = NULL then "NULL" else convert(varchar(10), a.trader_id) end) + " "
        + (case when a.counterparty_id = NULL then "NULL" else convert(varchar(10), a.counterparty_id) end) + " "
        + (case when a.status_id = NULL then "NULL" else convert(varchar(10), a.status_id) end) + " "
        + convert(varchar(10), a.notification_status_id) + " "
        + "'" + convert(varchar(19), a.notifier_date, 23) + "." + substring(convert(varchar(15), a.notifier_date, 20), 10, 3) + "' "
        + (case when a.trade_type_id = NULL then "NULL" else convert(varchar(10), a.trade_type_id) end)
    )
from
    inserted a

go
