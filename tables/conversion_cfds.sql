drop table conversion_cfds
go

create table 
	conversion_cfds(
		contract_id int
)
go

create unique nonclustered index
	u_cvc
on
	conversion_cfds(contract_id)
go


