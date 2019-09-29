drop table account_snapshots
go

create table
	account_snapshots
(
	account_snapshot_id int,
	external_account_id int,
	transaction_type_id int,
	value float,
	currency_id int,
	snapshot_date datetime,
	note varchar(200) NULL
)

create unique nonclustered index 
	u_as
on
	account_snapshots(account_snapshot_id)
go

insert into keys values("account_snapshots", 1)
go

