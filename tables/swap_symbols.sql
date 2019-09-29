if object_id("swap_symbols") != NULL
    drop table
        swap_symbols
go


create table
   swap_symbols (
	swap_symbol_id int,
	symbol varchar(50),
	timestamp datetime
   )
go

create unique nonclustered index u_ss on swap_symbols(swap_symbol_id)
go

create unique nonclustered index on us_ss on swap_symbols(symbol)
go

insert into
	keys
values(
	"swap_symbols",
	0
       )
go




