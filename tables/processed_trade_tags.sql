
if object_id("processed_trade_tags") != NULL
    drop table
        processed_trade_tags
go

create table
    processed_trade_tags (
        trade_tag_id int identity,
        deal_tag_id int,
        tag varchar(50),
        quantity numeric(30,4),
        tag_date datetime
    )
go

alter table
    processed_trade_tags
lock datarows
go

create unique index
    u_tt
on
    processed_trade_tags (
        trade_tag_id
    )

create unique index
    t_tt
on
    processed_trade_tags (
        tag
    )

create index
    dt_tt
on
    processed_trade_tags (
        deal_tag_id
    )

go

