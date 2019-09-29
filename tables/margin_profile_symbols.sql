
if object_id("margin_profile_symbols") != NULL
    drop table
        margin_profile_symbols
go

create table
    margin_profile_symbols (
        margin_profile_id int,
        source_id int,
        symbol char(50)
    )
go

create nonclustered index n_ts on margin_profile_symbols(margin_profile_id)
go

create unique index u_ts on margin_profile_symbols(source_id, symbol)
go

