
if object_id("suppressed_deal_aliases") != NULL
    drop table
        suppressed_deal_aliases
go

create table
    suppressed_deal_aliases (
        deal_id int,
        source_id int,
        alias varchar(100)
    )
go

create unique nonclustered index
	sda_ds
on
	suppressed_deal_aliases(
		deal_id,
		source_id)

create unique nonclustered index
        sda_sa
on
	suppressed_deal_aliases(
        	source_id,
		alias)


go
		
