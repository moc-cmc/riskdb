
if object_id('account_strategies') is not NULL
    drop table
        account_strategies
go

/**
 * The account_strategies table lists ...
 */
create table
    account_strategies (
        external_account_id  int,
        strategy_id          int
    )
go

create unique nonclustered index
    u_as
on
    account_strategies (
        external_account_id
    )
go

if not exists(select * from keys where relation = 'account_strategies')
    insert into keys values('account_strategies', 0)
go

if not exists(select * from tables where name = 'account_strategies')
    insert into tables(name, table_type) values('account_strategies', 'M')
go