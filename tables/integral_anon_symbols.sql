drop table 
	integral_anon_symbols
go

create table
	integral_anon_symbols(
		source_id int,
		symbol varchar(50))
go


create unique nonclustered index  u_ias on integral_anon_symbols(source_id,symbol)
go

