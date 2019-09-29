
if object_id("credit_profile_symbols") != NULL
    drop table
        credit_profile_symbols
go

create table
    credit_profile_symbols (
        credit_profile_id int,
        source_id int,
        symbol char(50)
    )
go

create nonclustered index n_ts on credit_profile_symbols(credit_profile_id)
go

create unique index u_ts on credit_profile_symbols(source_id, symbol)
go

