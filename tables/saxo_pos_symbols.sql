
if object_id("saxo_pos_symbols") != NULL
    drop table
        saxo_pos_symbols
go

create table
    saxo_pos_symbols (
        saxo_pos_symbol_id int,
	source_id int,
        recon_status_id int,	
        internal_account varchar(30),
        external_account varchar(50),
        counterparty varchar(50),
        quantity numeric(30,8),
        price float,
        contract varchar(20),
        trade_date datetime,
        value_date datetime,
        fixing_date datetime null,
        identifier varchar(100),
	recon_method_id int null
    )
go

create unique nonclustered index
	po
on
	saxo_pos_symbols(saxo_pos_symbol_id)
go

if not exists(select name from tables where name = "saxo_pos_symbols")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "saxo_pos_symbols",
        "J"
    )
end
go

insert into
	keys
values(
	"saxo_pos_symbols",
	0
)
go

