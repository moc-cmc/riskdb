create table 
	ledger_request_fees_archive(
		ledger_request_id int,
		account_transaction_id int,
		transaction_type_id int,
		product_id int,
		amount float, 
		archived_by_id int,
		timestamp datetime,
		offset_acct_transaction_id int
)
go

create unique nonclustered index
	pk_lr
on
	ledger_request_fees_archive(ledger_request_id)
go

insert into keys values("ledger_request_fees_archive", 0)
go

insert into tables values("ledger_request_fees_archive", "J")
go
