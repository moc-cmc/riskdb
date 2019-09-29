
drop table
	round_turns
go
	
create table
	round_turns(
		round_turn_id int,
		trade_date datetime,
		contract_id int,
		external_account_id int,
		entry_trade_id int,
		entry_date datetime,
		entry_quantity numeric(30,4),
		entry_price float,
		exit_trade_id int,
		exit_date datetime,
		exit_quantity numeric(30,4),
		exit_price float,
		currency_id int NULL,
		realized_pl float NULL)
go

create unique index
	u_rt
on
	round_turns(
		round_turn_id)
go

create nonclustered index
	n_rt
on
	round_turns(trade_date)
go

create nonclustered index
	n_rtc
on
	round_turns(contract_id)
go

create nonclustered index
	r_rte
on
	round_turns(external_account_id)
go


delete

from
	keys
where
	relation = "round_turns"
go

insert into
	keys
values(
	"round_turns",
	0)


go

