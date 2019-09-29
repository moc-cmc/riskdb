
create table
    pending_transaction_rolls (
	transaction_roll_id int identity,
        account_transaction_id int,
	transaction_date datetime,
	roll_date datetime
    )
go

create unique nonclustered index pk on pending_transaction_rolls(transaction_roll_id)
go

create unique nonclustered index nk on pending_transaction_rolls(account_transaction_id, transaction_date)
go

if not exists(select name from tables where name = "pending_transaction_rolls")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"pending_transaction_rolls",
		"J"
	)
end
go

