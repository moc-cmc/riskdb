create table
    fixing_center_symbols (
        fixing_center_id int,
        source_id int,
        symbol char(50)
    )
go

create nonclustered index n_sss on fixing_center_symbols(source_id, symbol)
go

create nonclustered index n_fs on fixing_center_symbols(fixing_center_id, source_id)
go
