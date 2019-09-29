
if object_id("ext_account_limits_old") != NULL
    drop table
        ext_account_limits_old
go

create table
    ext_account_limits_old (
        ext_account_limit_id numeric(10,0) identity,
        external_account_id int,
        currency_id int,
        credit_limit numeric(30,4),
        notice_level float,
        warning_level float,
        blocked_level float
    )
go
