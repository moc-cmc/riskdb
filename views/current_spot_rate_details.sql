
if object_id("current_spot_rate_details") != NULL
    drop view
        current_spot_rate_details
go

create view
    current_spot_rate_details
as
select
    product = convert(varchar(25), aa.symbol),
    currency = convert(varchar(25), ab.symbol),
    a.rate,
    a.rate_date,
    price_style = convert(varchar(10), ac.name),
    factor = a.factor
from
    current_spot_rates a
    join products aa
        on a.product_id = aa.product_id
    join products ab
        on a.currency_id = ab.product_id
    join price_styles ac
        on a.price_style_id = ac.price_style_id

go
