create table
	otc_matches(
		otc_match_id int,
		requestor_id int,
		request_date datetime,
		trade_date datetime,
		buyer_account_id  int NULL,
		buyer_trader_id int,
		buyer_legal_entity_id int,
		buyer_status_id int,
		buyer_trade_id int NULL,
		seller_account_id int NULL,
		seller_trader_id int,
		seller_legal_entity_id int,
		seller_status_id int,
		seller_trade_id int NULL,
		contract_id int,
		quantity float,
		price float,
		value_date datetime,
		execution_status_id  int NULL,
		execution_response_date datetime NULL,
		execution_message varchar(100) NULL,
		execution_id varchar(100) NULL)
go


	
create unique index
	u_om
on
	otc_matches(
		otc_match_id)
go

delete

from
	keys
where
	relation = "otc_matches"
go

insert into
	keys
values(
	"otc_matches",
	0)
go

