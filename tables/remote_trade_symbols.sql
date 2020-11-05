
if object_id("remote_trade_symbols") != NULL
    drop table
        remote_trade_symbols
go

create table
    remote_trade_symbols (
        remote_trade_symbol_id int,
	source_id int,
	trade_id int NULL,
	recon_status_id int,	
        internal_account_id int,
        external_account_id int,
        counterparty_id int,
        quantity numeric(30,8),
        price float,
        contract_id int,
        trade_date datetime,
        value_date datetime,
        fixing_date datetime null,
        identifier varchar(100),
	bo_trade_date datetime
    )
go

create unique nonclustered index
	pk
on
	remote_trade_symbols(remote_trade_symbol_id)
go

if not exists(select name from tables where name = "remote_trade_symbols")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "remote_trade_symbols",
        "J"
    )
end
go

insert into
	keys
values(
	"remote_trade_symbols",
	0
)
go

