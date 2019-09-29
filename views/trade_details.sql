
if object_id("trade_details") != NULL
    drop view
        trade_details
go

create view
    trade_details
as
select
    trade_id = convert(numeric(6,0), a.trade_id),
    deal_id = convert(numeric(6,0), a.deal_id),
    login = case when b.login = NULL
        then "<" + convert(varchar(8), a.user_id) + ">"
        else convert(varchar(10), b.login) end,
    type = convert(varchar(4), c.name),
    internal_account = convert(varchar(15), d.symbol),
    external_account = convert(varchar(15), e.symbol),
    counterparty = convert(varchar(15), f.name),
    quantity = convert(numeric(15,0), a.quantity),
    contract = convert(varchar(10), g.symbol),
    val_d = convert(varchar(5), a.value_date, 101),
    fix_d = case when a.fixing_date is NULL then ""
        else convert(varchar(5), a.fixing_date, 101) end,
    a.price,
    trade_date = convert(varchar(5), a.trade_date, 1) + " " + convert(varchar(5), a.trade_date, 8),
    trader = convert(varchar(15), h.symbol),
    strategy = convert(varchar(10), i.name),
    status = convert(varchar(10), j.name),
    broker = convert(varchar(10), k.symbol),
    sales_code = convert(varchar(5), l.name),
    identifier = convert(varchar(25), a.identifier)
from

    trades a
left outer join
    tico_accounts b
        on a.user_id = b.account_id
left outer join
    trade_types c
        on a.trade_type_id = c.trade_type_id
left outer join
    internal_accounts d
        on a.internal_account_id = d.internal_account_id
left outer join
    external_accounts e
        on a.external_account_id = e.external_account_id
left outer join
    counterparties f
        on a.counterparty_id = f.counterparty_id
left outer join
    contracts g
        on a.contract_id = g.contract_id
left outer join
    traders h
        on a.trader_id = h.trader_id
left outer join    
    strategies i
        on a.strategy_id = i.strategy_id
left outer join    
    statuses j
        on a.status_id = j.status_id
left outer join    
    brokers k
        on a.broker_id = k.broker_id
left outer join    
    sales_codes l
        on a.sales_code_id = l.sales_code_id

go
