
if object_id("trade_notifier_details") != NULL
    drop view
        trade_notifier_details
go

create view
    trade_notifier_details
as

select
    a.trade_notifier_id,
    source=convert(varchar(25), b.name),
    external_account=convert(varchar(25),c.symbol),
    broker=convert(varchar(15), d.symbol),
    status=convert(varchar(15), e.name),
    notification_status=convert(varchar(15), f.name)
from
    trade_notifiers a
    left outer join sources b
        on a.source_id = b.source_id
    left outer join external_accounts c
        on a.external_account_id = c.external_account_id
    left outer join brokers d
        on a.broker_id = d.broker_id
    left outer join statuses e
        on a.status_id = e.status_id
    left outer join statuses f
        on a.notification_status_id = f.status_id

go