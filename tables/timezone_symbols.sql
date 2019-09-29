create table
    timezone_symbols (
        timezone_id int,
        source_id int,
        symbol char(50)
    )
go

create nonclustered index n_ss on timezone_symbols(source_id, symbol)
go

create nonclustered index n_ts on timezone_symbols(timezone_id, source_id)
go
