
if object_id("deal_notifiers") != NULL
    drop table
        deal_notifiers
go

create table
    deal_notifiers (
        deal_notifier_id int,
        source_id int,
        external_account_id int,
        status_id int
    )
go
