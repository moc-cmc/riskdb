
if object_id("contract_details") != NULL
    drop view
        contract_details
go

create view
    contract_details
as
select

    a.contract_id,
    a.instrument_id,
    a.symbol,
    
    exchange_id = case
        when cb.exchange_id != NULL then cb.exchange_id
        when da.exchange_id != NULL then da.exchange_id
        when e.exchange_id != NULL then e.exchange_id
        else NULL
    end,
    quantity = case when e.quantity != NULL then e.quantity else 1 end 
        * case when da.quantity != NULL then da.quantity else 1 end
        * case when cb.quantity != NULL then cb.quantity else 1 end,
    price_style_id = case when h.price_style_id != NULL then h.price_style_id else 1 end,
    factor = case when g.factor != NULL then g.factor else 1 end /* FEATURE(future_price_styles) 
        case
        when i.name = "Future" and f.factor != NULL then f.factor 
        when i.name = "Option" and f.option_factor != NULL then f.option_factor
        else 1 
    end */,
/* FEATURE(contract_price_styles.min_scale)
    min_scale = case when h.min_scale != NULL then h.min_scale else NULL end,
    max_scale = case when h.max_scale != NULL then h.max_scale else NULL end,
*/
    expiration = case when ca.expiration != NULL then ca.expiration else d.expiration end,
    
    /* Forwards */
    product_id = e.product_id,
    currency_id = e.currency_id,
    def_perspective_contract_id = case
        when j.perspective_contract_id != NULL then j.perspective_contract_id
        when k.perspective_contract_id != NULL then k.perspective_contract_id
        when d.contract_id != NULL then d.contract_id
        else e.contract_id
    end,
    forward_id = e.contract_id,
    forward_exchange_id = e.exchange_id,
    forward_quantity = e.quantity,
    
    /* Futures */
    future_id = da.future_id,
    future_exchange_id = da.exchange_id,
    future_symbol = /* FEATURE(futures.symbol) da.symbol */ da.root_symbol /* */,
    future_quantity = da.quantity,
/*
    future_tick_size = da.tick_size,
    future_price_scale = da.price_scale,
 */
    future_expiration = d.expiration,
    
    /* Options */
    option_id = cb.option_id,
    option_underlying_id = cb.underlying_contract_id,
    option_exchange_id = cb.exchange_id,
    option_quantity = cb.quantity,
    option_tick_size = cb.tick_size,
    option_expiration_symbol = ca.symbol,
    option_expiration = ca.expiration,
    
    /* Exotics */
    option_exercise_style_id = case
        when b.exercise_style_id != NULL then b.exercise_style_id
        else c.exercise_style_id
    end,
    option_put_call = case
        when b.put_call != NULL then b.put_call
        else c.put_call
    end,
    option_strike = case
        when b.strike != NULL then b.strike
        else c.strike
    end /* FEATURE(exotic_contracts.*),
    option_barrier = b.barrier,
    option_ko_ki_date = b.ko_ki_date,
    option_barrier2 = b.barrier2,
    option_date2 = b.date2, 
    exotic_instrument_id = b.exotic_instrument_id */
    
from
    contracts a
left outer join
    exotic_contracts b
        on a.contract_id = b.contract_id
left outer join
    option_contracts c
        on a.contract_id = c.contract_id
    left outer join
        option_expirations ca
            on c.option_expiration_id = ca.option_expiration_id
            or b.option_expiration_id = ca.option_expiration_id
    left outer join
        options cb
            on ca.option_id = cb.option_id
left outer join
    future_contracts d
        on a.contract_id = d.contract_id
        or cb.underlying_contract_id = d.contract_id
    left outer join
        futures da
            on d.future_id = da.future_id
left outer join
    forwards e
        on a.contract_id = e.contract_id
        or cb.underlying_contract_id = e.contract_id
        or da.forward_id = e.contract_id
/* FEATURE(future_price_styles)
left outer join
    future_price_styles f
        on da.future_id = f.future_id */
left outer join
    contract_price_styles g
        on a.contract_id = g.contract_id
left outer join
    price_styles h
        on /* FEATURE(future_price_styles)
           f.price_style_id = h.price_style_id
        or */ g.price_style_id = h.price_style_id
join
    instruments i
        on a.instrument_id = i.instrument_id
left outer join
    def_perspective_contracts j
        on
            d.contract_id = j.contract_id
left outer join
    def_perspective_contracts k
        on
            e.contract_id = k.contract_id

go
