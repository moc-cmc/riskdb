drop table agg_group_counterparties
go

create table
	agg_group_counterparties(
		agg_group_id int,
		counterparty_id int
	)
go

create unique nonclustered index
	u_cg
on
	agg_group_counterparties(agg_group_id, counterparty_id)
go

		
