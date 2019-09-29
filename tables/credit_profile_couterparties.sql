drop table credit_profile_counterparties
go

create table
	credit_profile_counterparties(
		credit_profile_id int,
		counterparty_id int
	)
go

create unique nonclustered index
	u_cg
on
	credit_profile_counterparties(credit_profile_id, counterparty_id)
go

		
