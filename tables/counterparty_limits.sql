
if object_id("counterparty_limits") != NULL
    drop table
        counterparty_limits
go

create table
    counterparty_limits (
        counterparty_limit_id int identity,
        counterparty_id int,
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
