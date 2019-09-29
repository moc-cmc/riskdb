
if object_id("committed_pl_contracts") != NULL
    drop table
        committed_pl_contracts
go

create table
    committed_pl_contracts (
        int_account_transaction_id int,
        contract_id int,
        native_position_pl float,
        position_pl float,
        native_trades_pl float,
        trades_pl float
    )
go
