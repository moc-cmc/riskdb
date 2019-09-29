drop table
	session_report_balances
go

create table
	session_report_balances(
		tico_account_id int,
		session_id varchar(100),
		product_id int,
		value_date datetime,
		quantity numeric(30,4),
		trade_date datetime)
go

create index
	i_srb
on
	session_report_balances(
		product_id)
create index
	n_srb
on
	session_report_balances(
		value_date)
go

