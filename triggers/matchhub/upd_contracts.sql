
if object_id("upd_contracts") != NULL
    drop trigger
        upd_contracts
go

create trigger
    upd_contracts
on
    contracts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contract_details: update "
        + (case when a.contract_id = NULL then "NULL" else convert(varchar(10), a.contract_id) end) + " "
        + (case when a.instrument_id = NULL then "NULL" else convert(varchar(10), a.instrument_id) end) + " "
        + (case when a.symbol = NULL then "NULL" else "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'" end) + " "
        + (case when a.exchange_id = NULL then "NULL" else convert(varchar(10), a.exchange_id) end) + " "
        + (case when a.quantity = NULL then "NULL" else convert(varchar(50), a.quantity) end) + " "
        + (case when a.price_style_id = NULL then "NULL" else convert(varchar(10), a.price_style_id) end) + " "
        + (case when a.factor = NULL then "NULL" else convert(varchar(50), a.factor) end) + " "
        + (case when a.expiration = NULL then "NULL" else "'" + convert(varchar(19), a.expiration, 23) + "." + substring(convert(varchar(15), a.expiration, 20), 10, 3) + "'" end) + " "
        + (case when a.product_id = NULL then "NULL" else convert(varchar(10), a.product_id) end) + " "
        + (case when a.currency_id = NULL then "NULL" else convert(varchar(10), a.currency_id) end) + " "
        + (case when a.def_perspective_contract_id = NULL then "NULL" else convert(varchar(10), a.def_perspective_contract_id) end) + " "
        + (case when a.forward_id = NULL then "NULL" else convert(varchar(10), a.forward_id) end) + " "
        + (case when a.forward_exchange_id = NULL then "NULL" else convert(varchar(10), a.forward_exchange_id) end) + " "
        + (case when a.forward_quantity = NULL then "NULL" else convert(varchar(10), a.forward_quantity) end) + " "
        + (case when a.future_id = NULL then "NULL" else convert(varchar(10), a.future_id) end) + " "
        + (case when a.future_exchange_id = NULL then "NULL" else convert(varchar(10), a.future_exchange_id) end) + " "
        + (case when a.future_symbol = NULL then "NULL" else "'" + str_replace(a.future_symbol, "'", "\'") + "'" end) + " "
        + (case when a.future_quantity = NULL then "NULL" else convert(varchar(50), a.future_quantity) end) + " "
        + (case when a.future_expiration = NULL then "NULL" else "'" + convert(varchar(19), a.future_expiration, 23) + "." + substring(convert(varchar(15), a.future_expiration, 20), 10, 3) + "'" end) + " "
        + (case when a.option_id = NULL then "NULL" else convert(varchar(10), a.option_id) end) + " "
        + (case when a.option_underlying_id = NULL then "NULL" else convert(varchar(10), a.option_underlying_id) end) + " "
        + (case when a.option_exchange_id = NULL then "NULL" else convert(varchar(10), a.option_exchange_id) end) + " "
        + (case when a.option_quantity = NULL then "NULL" else convert(varchar(50), a.option_quantity) end) + " "
        + (case when a.option_tick_size = NULL then "NULL" else convert(varchar(50), a.option_tick_size) end) + " "
        + (case when a.option_expiration_symbol = NULL then "NULL" else "'" + str_replace(a.option_expiration_symbol, "'", "\'") + "'" end) + " "
        + (case when a.option_expiration = NULL then "NULL" else "'" + convert(varchar(19), a.option_expiration, 23) + "." + substring(convert(varchar(15), a.option_expiration, 20), 10, 3) + "'" end) + " "
        + (case when a.option_exercise_style_id = NULL then "NULL" else convert(varchar(10), a.option_exercise_style_id) end) + " "
        + (case when a.option_put_call = NULL then "NULL" else "'" + str_replace(a.option_put_call, "'", "\'") + "'" end) + " "
        + (case when a.option_strike = NULL then "NULL" else convert(varchar(50), a.option_strike) end)
    )
from
    contract_details a,
    inserted b
where
    a.contract_id = b.contract_id

go
