
if object_id("saxo_net_positions") != NULL
    drop table
        saxo_net_positions
go

create table
    saxo_net_positions (
        recon_status_id int NULL,	
        account_number varchar(30) NULL,
        counterparty_mapping varchar(30) NULL,
	external_account_id int NULL,
	counterparty_id int NULL,
	counterparty varchar(50) NULL,
        contract_mapping varchar(50),
        contract_id int NULL,
	contract varchar(20) NULL,
        quantity numeric(30,8),
	trade_date datetime NULL,
	recon_method_id int null
    )
go

if not exists(select name from tables where name = "saxo_net_positions")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "saxo_net_positions",
        "J"
    )
end
go
