if object_id("trade_type_symbols") != NULL
    drop table
        trade_type_symbols
go

create table
    trade_type_symbols (
        trade_type_id int,
        source_id int,
        symbol varchar(25)
    )
go

create unique nonclustered index 
	u_tts
on
	trade_type_symbols(trade_type_id, source_id)
go

