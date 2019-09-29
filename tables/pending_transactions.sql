
create table
    pending_transactions (
        account_transaction_id int,
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

create unique nonclustered index pk on pending_transactions(account_transaction_id)
go

create nonclustered index n_lr on pending_transactions(ledger_request_id)
go

create nonclustered index n_st on pending_transactions(status_id)
go

create nonclustered index n_at on pending_transactions(external_account_id)
go

create nonclustered index n_atd on pending_transactions(transaction_date)
go

create nonclustered index n_c on pending_transactions(currency_id)
go

/* no insert into keys table because this will take account_transaction_keys */

if not exists(select name from tables where name = "pending_transactions")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"pending_transactions",
		"J"
	)
end
go

