
if object_id("orders") != NULL
    drop table
        orders
go

create table
    orders (
        order_id int,
        deal_id int,
        order_type_id int,
        user_id int,
        internal_account_id int,
        external_account_id int,
        quantity numeric(30,4),
        contract_id int,
        price float null,
        order_date datetime,
        execution_date datetime null,
        trader_id int,
        strategy_id int,
        status_id int,
        broker_id int
    )
go
