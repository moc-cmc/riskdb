
create table
	recon_methods(
		recon_method_id int,
		name varchar(25))
go

create unique index
	u_ms
on
	recon_methods(
		recon_method_id)
go

create unique index
	n_ms
on
	recon_methods(
		name)
go

insert into recon_methods values(1, "Algo")
go
insert into recon_methods values(2, "Accepted Internal")
go
insert into recon_methods values(3, "Accepted External")
go
insert into recon_methods values(4, "Accepted Mismatch")
go
insert into recon_methods values(5, "Algo Invert")
go
insert into recon_methods values(6, "Aggressive")
go
insert into recon_methods values(7, "Aggressive Invert")
go
insert into recon_methods values(8, "Algo Prev Date")
go


if not exists(select name from tables where name = "recon_methods")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"recon_methods",
		"E"
	)
end
go

delete

from
	keys
where
	relation = "recon_methods"

insert into
	keys
values(
	"recon_methods",
	8)

go
