
if object_id("ext_account_limits") != NULL
    drop table
        ext_account_limits
go

create table
    ext_account_limits (
        ext_account_limit_id numeric(10,0) identity,
        external_account_id int,
        currency_id int,
        nop_type_id int null,
        nop_limit numeric(30,4) null,
        dsl_type_id int null,
        dsl_limit numeric(30,4) null,
        notice_level float,
        warning_level float,
        blocked_level float
    )
go
