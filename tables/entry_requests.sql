/* 
 * We have both the account_transaction_id and the account product amount.
 * At first this seems like duplicat info, but this stores the status of a request to
 * make a ledger movement downstream. No ability in system to edit these but a user
 * can edit a ledger entry. This tracks the product amount and account of the transaction
 * at the time of sending downstream so that information is stored again
 */
create table
	entry_requests(
		entry_request_id int,
		requestor_id int,
		status_id int,
		account_transaction_id int, 
		fo_sub_account_id int,
		product_id int,
		amount float,
		request_date datetime,
		respond_timestamp datetime NULL,
		respond_message varchar(150) NULL)

go

create unique index
	u_ar
on
	entry_requests(
		entry_request_id)

delete

from
	keys
where
	relation = "entry_requests"
go

insert into
	keys
values(
	"entry_requests",
	0)
go

