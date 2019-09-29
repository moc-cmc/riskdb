drop table tico_account_emails
go

create table
	tico_account_emails(
		tico_account_id int,
		email_id int)
go

create unique nonclustered index 
	u_e
on
	tico_account_emails(email_id)
go

create nonclustered index 
	n_te
on
	tico_account_emails(tico_account_id)
go
