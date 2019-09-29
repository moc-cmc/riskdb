
if object_id("ext_account_margins") != NULL
    drop table
        ext_account_margins
go

create table
    ext_account_margins (
        ext_account_margin_limit_id numeric(10,0) identity,
        external_account_id int,
        currency_id int,
        initial_margin numeric(30,4) null,
        notice_level float,
        warning_level float,
        blocked_level float
    )
go

create unique nonclustered index
	u_eaml
on
	ext_account_margins(external_account_id)
go

