
if object_id("suppressed_deals") != NULL
    drop table
        suppressed_deals
go

create table
    suppressed_deals (
        deal_id int,
        deal_type_id int,
	symbol varchar(100),
        timestamp datetime,
        status_id int
    )
go

create unique index u_sd on 
	suppressed_deals(deal_id)
go

create index s_sd on
        suppressed_deals(symbol)
go
	
insert into
	keys
values(
	"suppressed_deals",
	0
	)
go
