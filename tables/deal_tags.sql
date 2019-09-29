
if object_id("deal_tags") != NULL
    drop table
        deal_tags
go

create table
    deal_tags (
        deal_tag_id int identity,
        tag varchar(50),
        quantity numeric(30,4),
        status_id int,
        tag_date datetime
    )
go

alter table
    deal_tags
lock datarows
go

create unique index
    u_tt
on
    deal_tags (
        deal_tag_id
    )

create unique clustered index
    i_tt
on
    deal_tags (
        tag
    )

go

