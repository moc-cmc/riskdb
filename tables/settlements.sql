
if object_id('settlements') is not NULL
    drop table
        settlements
go

/**
 * The settlements table lists ...
 */
create table
    settlements (
        account_transaction_id int,
        deal_id int null,
        entered_by int,
        external_account_id int,
        transaction_type_id int,
        transaction_date datetime,
        currency_id int,
        amount float,
        create_date datetime,
        status_id int,
        ledger_request_id int null,
        note char(255) null
    )
go

create unique nonclustered index
    u_id
on
    settlements (
        account_transaction_id
    )
go

if not exists(select * from keys where relation = 'settlements')
    insert into keys values('settlements', 0)
go

if not exists(select * from tables where name = 'settlements')
    insert into tables(name, table_type) values('settlements', 'L')
go