
if object_id("trade_daily_revals") != NULL
    drop table
        trade_daily_revals
go

create table
    trade_daily_revals (
        trade_daily_reval_id int identity,
        trade_id int,
        bo_trade_date datetime,
        source_id int,
        status_id int,
        contract_id int,
        contract_qty int null,
        value_date datetime,
        reval_date datetime,
        close_price float null,
        native_value float null,
        forward_id int null,
        delta float null,
        gamma float null,
        theta float null,
        tau float null,
        native_currency_id int null,
        product_id int null,
        evaluation_currency_id int null,
        evaluation_value float null,
        price_change_to_date float null,
        native_realized_pl_to_date float null,
        native_unrealized_pl_to_date float null,
        realized_pl_to_date float null,
        unrealized_pl_to_date float null,
        premium_ccy_id int null,
        premium float null,
        evaluation_premium float null,
        premium_settle_date datetime null,
        notional_amount float null,
        evaluation_notional float null
    )
go

/*
alter table
    trade_daily_revals
add
    forward_id int NULL
 */