drop table
	mh_settlements
go

create table
    mh_settlements (
	mh_settlement_id int,
        hub_deal_id int,
	source_id int,
	entered_at datetime,
	deal_id int NULL,
        systrades_trade1_id int NULL,
	systrades_trade2_id int NULL,
	syssettle_transaction_id int NULL,
	account_transaction_id int NULL
    )
go

create unique nonclustered index
    u_id
on
    mh_settlements (
        hub_deal_id,
	source_id
    )
go

if not exists(select * from keys where relation = 'mh_settlements')
    insert into keys values('mh_settlements', 0)
go

if not exists(select * from tables where name = 'mh_settlements')
    insert into tables(name, table_type) values('mh_settlements', 'J')
go
