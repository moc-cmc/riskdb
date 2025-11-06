
if object_id("saxo_pos_notes") != NULL
    drop table
        saxo_pos_notes
go

create table
    saxo_pos_notes (
        counterparty_id int,
        contract_id int,
	trade_date datetime,
	notes varchar(250) NULL
    )
go

create unique index pn on saxo_pos_notes (counterparty_id, contract_id, trade_date)

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
