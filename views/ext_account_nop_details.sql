
if object_id("ext_account_nop_details") != NULL
    drop view
        ext_account_nop_details
go

create view
    ext_account_nop_details
as
select
    ext_account = convert(varchar(30), a.name),
    nop_type = convert(varchar(15), ba.name),
    nop = c.nop,
    nop_limit = b.nop_limit,
    nop_prct = case when c.nop is NULL or b.nop_limit = 0 or b.nop_limit = NULL then "" else convert(varchar(10), convert(numeric(6,2), c.nop / b.nop_limit * 100)) + "%" end
from
    external_accounts a
    left join ext_account_limits b
        on
            a.external_account_id = b.external_account_id
        left outer join nop_types ba
            on
                b.nop_type_id = ba.nop_type_id
    left outer join ext_account_nops c
        on
            a.external_account_id = c.external_account_id

go
