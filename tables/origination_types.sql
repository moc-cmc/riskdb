create table
	origination_types(
		origination_type_id int,
		name varchar(50))
go

create unique index
	u_ot
on
	origination_types(
		origination_type_id)
go

create unique index
	n_ot
on
	origination_types(
		name)
go

insert into origination_types values(1, "Fiat")
go
insert into origination_types values(2, "Digital")
go


delete

from
	keys
where
	relation = "origination_types"
go

insert into
	keys
values(
	"origination_types",
	2)
go

if not exists(select name from tables where name = "origination_types")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "origination_types",
                "E"
        )
end
go

