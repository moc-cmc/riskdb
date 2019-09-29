
if object_id("counterparty_nop_details") != NULL
    drop view
        counterparty_nop_details
go

create view
    counterparty_nop_details
as
select
    counterparty = convert(varchar(30), a.name),
    nop_type = convert(varchar(15), ba.name),
    nop = c.nop,
    nop_limit = b.nop_limit,
    nop_prct = case when c.nop is NULL or b.nop_limit = 0 or b.nop_limit = NULL then "" else convert(varchar(10), convert(numeric(6,2), c.nop / b.nop_limit * 100)) + "%" end
from
    counterparties a
    left join counterparty_limits b
        on
            a.counterparty_id = b.counterparty_id
        left outer join nop_types ba
            on
                b.nop_type_id = ba.nop_type_id
    left outer join counterparty_nops c
        on
            a.counterparty_id = c.counterparty_id

go
