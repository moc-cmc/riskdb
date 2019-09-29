
if object_id("ext_account_dsls") != NULL
    drop view
        ext_account_dsls
go

create view
    ext_account_dsls
as
select
    a.external_account_id,
    c.value_date,
    dsl = abs(sum(case 
        when ba.dsl_type_id = NULL then
            NULL
        when ba.incl_base_ccy = "N" and b.currency_id = c.product_id then
            0
        when ba.incl_shorts = "Y" and c.amount < 0 then
            c.amount * d.rate
        when ba.incl_longs = "Y" and c.amount > 0 then
            c.amount * d.rate
        else
            0
    end))
from
    external_accounts a
    join ext_account_limits b
        on
            a.external_account_id = b.external_account_id
        left outer join dsl_types ba
            on
                b.dsl_type_id = ba.dsl_type_id
    left outer join ext_account_ladders c
        on
            a.external_account_id = c.external_account_id
    join currency_rates d
        on
            c.product_id = d.product_id
        and
            b.currency_id = d.currency_id
group by
    a.external_account_id,
    c.value_date

go
