
if object_id("deal_aliases") != NULL
    drop table
        deal_aliases
go

create table
    deal_aliases (
        deal_id int,
        source_id int,
        alias varchar(100)
    )
go
