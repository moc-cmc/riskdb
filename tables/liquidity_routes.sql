drop table liquidity_routes
go

create table
	liquidity_routes(
		liquidity_route_id int,
		push_source_id int,
		receive_source_id int,
		symbol varchar(50)
)
go

create unique nonclustered index
	u_lr
on
	liquidity_routes(liquidity_route_id)
go

create unique nonclustered index
	u_ldpr
on
	liquidity_routes(push_source_id, receive_source_id, symbol)
go




insert into keys values("liquidity_routes", 0)
go
