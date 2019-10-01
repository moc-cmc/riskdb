
create table
	netlink_deal_groupings(
		trade_date datetime,
		contract_id int,
		deal_id int
)

create unique nonclustered index
	u_ndg
on
	netlink_deal_groupings(trade_date, contract_id)
go

