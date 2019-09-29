
if object_id("flattened_trades") != NULL
    drop view
        flattened_trades
go

create view
    flattened_trades
as
    select
        a.trade_id,
        a.deal_id,
        a.user_id,
        a.trade_type_id,
        a.internal_account_id,
        a.external_account_id,
        a.counterparty_id,
        a.quantity,
        a.contract_id,
        a.price,
        a.trade_date,
        a.trader_id,
        a.strategy_id,
        a.status_id,
        a.broker_id,
        a.sales_code_id,
        a.identifier,
        a.value_date
    from
        trades a
    
go
