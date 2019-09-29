
if object_id("counterparty_limit_edits") != NULL
    drop table
        counterparty_limit_edits
go

create table
    counterparty_limit_edits (
        counterparty_limit_id int,
        counterparty_id int,
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
