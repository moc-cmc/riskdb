
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
        + convert(varchar(10), a.trade_notifier_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + (case when a.external_account_id = NULL then "NULL" else convert(varchar(10), a.external_account_id) end) + " "
        + (case when a.broker_id = NULL then "NULL" else convert(varchar(10), a.broker_id) end) + " "
        + (case when a.trader_id = NULL then "NULL" else convert(varchar(10), a.trader_id) end) + " "
        + (case when a.counterparty_id = NULL then "NULL" else convert(varchar(10), a.counterparty_id) end) + " "
        + (case when a.status_id = NULL then "NULL" else convert(varchar(10), a.status_id) end) + " "
        + convert(varchar(10), a.notification_status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.notifier_date), 9) + "'"
    )
from
    deleted a

go
