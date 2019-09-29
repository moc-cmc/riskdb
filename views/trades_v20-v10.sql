
if object_id("trades_v20") != NULL
    drop view
        trades_v20
go

create view
    trades_v20
as

select
    trade_id = a.trade_id,
    deal_id = a.deal_id,
    user_id = a.user_id,
    trade_type_id = NULL,
    internal_account_id = a.internal_account_id,
    external_account_id = a.external_account_id,
    counterparty_id = NULL,
    quantity = a.quantity,
    contract_id = a.contract_id,
    value_date = b.value_date,
    fixing_date = NULL,
    price = a.price,
    trade_date = a.trade_date,
    trader_id = a.trader_id,
    strategy_id = a.strategy_id,
    status_id = a.status_id,
    broker_id = a.broker_id,
    sales_code_id = NULL,
    identifier = NULL,
    pct_price = NULL,
    spot_reference = NULL
from
    trades a
    left outer join trade_value_dates b
        on
            a.trade_id = b.trade_id

go