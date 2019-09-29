
if object_id("trade_tags") != NULL
    drop table
        trade_tags
go

create table
    trade_tags (
        trade_tag_id int identity,
        deal_tag_id int,
        tag varchar(50),
        quantity numeric(30,4),
        tag_date datetime
    )
go

alter table
    trade_tags
lock datarows
go

create unique index
    u_tt
on
    trade_tags (
        trade_tag_id
    )

create unique index
    t_tt
on
    trade_tags (
        tag
    )

create index
    dt_tt
on
    trade_tags (
        deal_tag_id
    )

go

