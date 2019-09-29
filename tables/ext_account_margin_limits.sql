
if object_id("ext_account_margin_limits") != NULL
    drop table
        ext_account_margin_limits
go

create table
    ext_account_margin_limits (
        ext_account_margin_limit_id numeric(10,0) identity,
        external_account_id int,
        currency_id int,
        intitial_margin numeric(30,4) null,
        notice_level float,
        warning_level float,
        blocked_level float
    )
go

create unique nonclustered index
	u_eaml
on
	ext_account_margin_limits(external_account_id)
go

