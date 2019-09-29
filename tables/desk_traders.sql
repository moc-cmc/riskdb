drop table
	desk_traders
go

create table
	desk_traders(
		desk_id int,
		trader_id int)
go

create unique index
	u_dt
on
	desk_traders(
		desk_id,
		trader_id)
go


