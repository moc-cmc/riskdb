drop table
	queued_fees
go

create table
	queued_fees(
		queued_fee_id int,
		tico_account_id int,
		style varchar(250) NULL,
		transaction_date datetime,
		transaction_type_id int,
		external_account_id int,
		currency_id int,
		amount float,
		account_transaction_id int NULL,
		booked_amount float NULL,
		match_status varchar(25) NULL)


go


create unique index
	u_qf
on
	queued_fees(
		queued_fee_id)
go

create unique index
	n_qf
on
	queued_fees(
		tico_account_id,
		transaction_date,
		transaction_type_id,
		external_account_id,
		currency_id)
go

delete

from
	keys
where
	relation = "queued_fees"

insert into
	keys
values(
	"queued_fees",
	0)
go

	
