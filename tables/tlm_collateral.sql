
drop table
	tlm_collateral
go

create table
	tlm_collateral(
		tlm_collateral_id int,
		trade_date datetime,
		client_account_id int,
		collateral_agreement_id int,
		instrument_type_id int,
		currency_id int,
		possesion_status_id int,
		margin_type_id int,
		notional numeric(30,4),
		valuation_percentage float,
		native_market_value numeric(30,4),
		market_value_equiv numeric(30,4))
go

create unique index
	u_tc
on
	tlm_collateral(
		tlm_collateral_id)
go

create unique index
	n_tc
on
	tlm_collateral(
		trade_date,
		client_account_id,
		collateral_agreement_id,
		instrument_type_id,
		currency_id)
go

delete

from
	keys
where
	relation = "tlm_collateral"
go

insert into
	keys
values(
	"tlm_collateral",
	0)
go
		
insert into
	tables
values(
	"tlm_collateral",
	"J"	
)
go
