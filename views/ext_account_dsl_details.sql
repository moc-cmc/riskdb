
if object_id("ext_account_dsl_details") != NULL
    drop view
        ext_account_dsl_details
go

create view
    ext_account_dsl_details
as
select
    ext_account = convert(varchar(30), a.name),
    dsl_type = convert(varchar(15), ba.name),
    c.value_date,
    dsl = c.dsl,
    dsl_limit = b.dsl_limit,
    dsl_prct = case when c.dsl is NULL or b.dsl_limit = 0 or b.dsl_limit = NULL then "" else convert(varchar(10), convert(numeric(6,2), c.dsl / b.dsl_limit * 100)) + "%" end
from
    external_accounts a
    left join ext_account_limits b
        on
            a.external_account_id = b.external_account_id
        left outer join dsl_types ba
            on
                b.dsl_type_id = ba.dsl_type_id
    left outer join ext_account_dsls c
        on
            a.external_account_id = c.external_account_id

go
