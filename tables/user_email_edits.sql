create table
	user_email_edits(
		id int identity,
		tico_account_id int,
		email_id int,
		edited_by int,
		timestamp datetime
		)
go

create unique nonclustered index 
	u_e
on
	user_email_edits(id)
go

create nonclustered index 
	n_tai
on
	user_email_edits(tico_account_id)
go

create nonclustered index
        n_te
on
        user_email_edits(email_id)
go

