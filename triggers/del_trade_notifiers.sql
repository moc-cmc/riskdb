if object_id("del_trade_notifiers") != NULL
    drop trigger
        del_trade_notifiers
go

create trigger
    del_trade_notifiers
on
    trade_notifiers
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_notifiers: delete "
        + convert(varchar(10), trade_notifier_id) + " "
        + convert(varchar(10), source_id) + " "
        + (case when external_account_id = NULL then "NULL" else convert(varchar(10), external_account_id) end) + " "
        + (case when broker_id = NULL then "NULL" else convert(varchar(10), broker_id) end) + " "
        + (case when trader_id = NULL then "NULL" else convert(varchar(10), trader_id) end) + " "
        + (case when counterparty_id = NULL then "NULL" else convert(varchar(10), counterparty_id) end) + " "
        + (case when status_id = NULL then "NULL" else convert(varchar(10), status_id) end) + " "
        + convert(varchar(10), notification_status_id)
    )
from
    deleted

go