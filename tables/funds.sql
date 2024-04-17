
if object_id("funds") != NULL
    drop table
        funds
go

create table
    funds (
        fund_id int,
        name char(50),
        evaluation_currency_id int,
        fund_type_id int,
        status_id int,
        tico_server varchar(100),
        tico_database varchar(100),
        prime_broker_id int NULL,
	fund_code char(10) NULL,
	payments_ext_account_id int NULL,
	min_ticket_size int NULL,
	settlement_ext_account_id int NULL,
	nop_type_id int NULL,
	pair_margining varchar(10) NULL,
	settlement_product_id int NULL,
	margin_model_id int NULL
    )
go
