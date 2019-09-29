drop table user_emails
go

create table
	user_emails(
		tico_account_id int,
		email_id int)
go

create unique nonclustered index 
	u_e
on
	user_emails(email_id)
go

create nonclustered index 
	n_te
on
	user_emails(tico_account_id)
go
