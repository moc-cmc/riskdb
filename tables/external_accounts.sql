
if object_id("external_accounts") != NULL
    drop table
        external_accounts
go

create table
    external_accounts (
        external_account_id int,
        instrument_type varchar(10),
        symbol varchar(50),
        name varchar(150),
        external_account_type_id int,
        internal_account_id int,
        evaluation_currency_id int,
        aggregation_style_id int,
	settlement_method_id int NULL,
	lp_transparency varchar(50) NULL,
	max_mtd_statement_trades int NULL,
	margin_multiplier float NULL
    )

go

create unique nonclustered index u_ea on external_accounts(external_account_id)
go

create  unique nonclustered index n_ea on external_accounts(symbol)
go
