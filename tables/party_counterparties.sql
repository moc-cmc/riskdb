drop table party_counterparties
go

create table
	party_counterparties(
		party_counterparty_id int identity,
		party_id int,
		counterparty_id int,
		clearing_party_id int
	)
go

create unique nonclustered index 
	u_p
on
	party_counterparties(counterparty_id)
go

