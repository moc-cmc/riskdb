
if object_id("current_spot_rates") != NULL
    drop view
        current_spot_rates
go

create view
    current_spot_rates
as
select
    a.product_id,
    b.currency_id,
    rate = case 
        when a.product_id = b.currency_id then 1
        when ca.price != NULL then ca.price
        when da.price != NULL and da.price != 0 then 1 / da.price
        else NULL
    end,
    rate_date = case 
        when a.product_id = b.currency_id then getdate()
        when ca.price != NULL then ca.timestamp
        when da.price != NULL and da.price != 0 then da.timestamp
        else NULL
    end,
    price_style_id = case 
        when cb.price_style_id != NULL then cb.price_style_id
        when db.price_style_id != NULL then
            case db.price_style_id
                when f.price_style_id then e.price_style_id
                else f.price_style_id
            end
        else e.price_style_id
    end,
    factor = case 
        when cb.factor != NULL then cb.factor
        when db.factor != NULL and db.factor != 0 then 1 / db.factor
        else 1
    end
from
    products a
    join product_types aa
        on
            a.product_type_id = aa.product_type_id
    join currencies b
        on
            b.currency_id != NULL
    left outer join forwards c
        on
            a.product_id = c.product_id
        and
            b.currency_id = c.currency_id
        left outer join current_prices ca
            on
                c.contract_id = ca.contract_id
        left outer join contract_price_styles cb
            on
                c.contract_id = cb.contract_id
    left outer join forwards d
        on
            a.product_id = d.currency_id
        and
            b.currency_id = d.product_id
        left outer join current_prices da
            on
                d.contract_id = da.contract_id
        left outer join contract_price_styles db
            on
                d.contract_id = db.contract_id
    join price_styles e
        on
            e.name = "Standard"
    join price_styles f
        on
            f.name = "Inverted"

go
