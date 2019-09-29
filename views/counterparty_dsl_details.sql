
if object_id("counterparty_dsl_details") != NULL
    drop view
        counterparty_dsl_details
go

create view
    counterparty_dsl_details
as
select
    counterparty = convert(varchar(30), a.name),
    dsl_type = convert(varchar(15), ba.name),
    c.value_date,
    dsl = c.dsl,
    dsl_limit = b.dsl_limit,
    dsl_prct = case when c.dsl is NULL or b.dsl_limit = 0 or b.dsl_limit = NULL then "" else convert(varchar(10), convert(numeric(6,2), c.dsl / b.dsl_limit * 100)) + "%" end
from
    counterparties a
    left join counterparty_limits b
        on
            a.counterparty_id = b.counterparty_id
        left outer join dsl_types ba
            on
                b.dsl_type_id = ba.dsl_type_id
    left outer join counterparty_dsls c
        on
            a.counterparty_id = c.counterparty_id

go
