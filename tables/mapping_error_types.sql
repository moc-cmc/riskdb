if object_id("mapping_error_types") != NULL
    drop table
        mapping_error_types

go


create table
	mapping_error_types(
		mapping_error_type_id int,
		name varchar(15)
)
go

create unique nonclustered index
	u_me
on
	mapping_error_types(
		mapping_error_type_id)
go

create unique nonclustered index
	u_bi
on
	mapping_error_types(name)
go


insert into mapping_error_types values(1, "Trader")
insert into mapping_error_types values(2, "Counterparty")
insert into mapping_error_types values(3, "Ext Account")
go

delete

from
	keys
where
	relation = "mapping_error_types"
go

insert into
	keys
values(
	"mapping_error_types",
	4)
go
