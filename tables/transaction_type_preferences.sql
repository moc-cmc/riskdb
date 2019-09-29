use
	risk_finotec
go

drop table
	transaction_type_preferences
go

create table
	transaction_type_preferences(
		id int identity, /* This is for Lo and his desire for primary keys! */
		transaction_type_id int,
		ordering int NULL)
go

create unique index
	u_ttp
on
	transaction_type_preferences(
		transaction_type_id)
go



