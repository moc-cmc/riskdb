if object_id("deal_type_symbols") != NULL
    drop table
        deal_type_symbols
go

create table
    deal_type_symbols (
        deal_type_id int,
        source_id int,
        symbol varchar(25)
    )
go

create unique nonclustered index 
	u_tts
on
	deal_type_symbols(deal_type_id, source_id)
go

