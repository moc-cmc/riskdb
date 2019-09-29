
if object_id("ext_account_limit_edits") != NULL
    drop table
        ext_account_limit_edits
go

create table
    ext_account_limit_edits (
        ext_account_limit_id int,
        external_account_id int,
        currency_id int,
        nop_type_id int null,
        nop_limit numeric(30,4) null,
        dsl_type_id int null,
        dsl_limit numeric(30,4) null,
        notice_level float,
        warning_level float,
        blocked_level float,
	archive_date datetime,
	tico_account_id int
    )
go
