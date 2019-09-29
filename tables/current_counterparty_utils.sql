
if object_id("current_counterparty_utils") != NULL
    drop table
        current_counterparty_utils
go

create table
    current_counterparty_utils (
        counterparty_id int,
        date datetime,
        dsl float NULL,
        nop float NULL
    )
go

create unique clustered index
    u_ccu
on
    current_counterparty_utils(
        counterparty_id
    )

go
