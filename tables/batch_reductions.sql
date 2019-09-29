
if object_id("batch_reductions") != NULL
    drop table
        batch_reductions
go

create table
    batch_reductions (
        batch_reduction_id int,
        batch_id int,
        internal_external char(2),
        trader_id int,
        contract_id int,
        quantity numeric(30,6),
        trade_date datetime,
        price numeric(30,6)
    )
go
