
if object_id("ext_account_nops") != NULL
    drop view
        ext_account_nops
go

create view
    ext_account_nops
as
select
    external_account_id = a.external_account_id,
    nop = abs(sum(case 
        when ba.nop_type_id = NULL then
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
        left outer join nop_types ba
            on
                b.nop_type_id = ba.nop_type_id
    left outer join ext_account_balances c
        on
            a.external_account_id = c.external_account_id
    left outer join currency_rates d
        on
            c.product_id = d.product_id
        and
            b.currency_id = d.currency_id
group by
    a.external_account_id

go
