create table
    source_edit_settings (
        source_id int,
	deal_id char(1) NULL,
	user_id char(1) NULL,
	internal_account char(1) NULL,
	external_account char(1) NULL,
	counterparty char(1) NULL,
	quantity char(1) NULL,
	contract char(1) NULL,
	trade_date char(1) NULL,
	value_date char(1) NULL,
	fixing_date char(1) NULL,
	price char(1) NULL,
	trader char(1) NULL,
	strategy char(1) NULL,
	status char(1) NULL,
	broker char(1) NULL,
	sales_code char(1) NULL,
	identifier char(1) NULL,
        pct_price char(1) NULL,
	spot_reference char(1) NULL
    )
go

create unique nonclustered index
	u_pk
on
	source_edit_settings(source_id)
go

if not exists(select name from tables where name = "source_edit_settings")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"source_edit_settings",
		"L"
	)
end
go

