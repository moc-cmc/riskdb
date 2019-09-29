
if object_id("ext_account_credit_infos") != NULL
    drop view
        ext_account_credit_infos
go

create view
    ext_account_credit_infos
as
select
    external_account = b.symbol,
    product = d.symbol,
    a.value_date,
    a.amount,
    c.credit_limit,
    usage_level = abs(a.amount / c.credit_limit) * 100,
    c.notice_level,
    n = case when abs(a.amount / c.credit_limit) > c.notice_level then "X" else " " end,
    c.warning_level,
    w = case when abs(a.amount / c.credit_limit) > c.notice_level then "X" else " " end,
    c.blocked_level,
    b = case when abs(a.amount / c.credit_limit) > c.notice_level then "X" else " " end
from
    ext_account_credits a,
    external_accounts b,
    ext_account_limits c,
    products d
where
    a.external_account_id = b.external_account_id
and
    a.external_account_id *= c.external_account_id
and
    a.product_id = d.product_id
go
