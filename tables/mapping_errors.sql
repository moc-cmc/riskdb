if object_id("mapping_errors") != NULL
    drop table
        mapping_errors

go

create table
	mapping_errors(
		mapping_error_id int,
		broker_id int,
		identifier varchar(100),
		mapping_error_type_id int,
		timestamp datetime)
lock datarows
go

create unique index
	u_me
on
	mapping_errors(
		mapping_error_id)
go

create unique nonclustered index
	u_bi
on
	mapping_errors(broker_id, identifier, mapping_error_type_id)
go


delete

from
	keys
where
	relation = "mapping_errors"
go

insert into
	keys
values(
	"mapping_errors",
	0)
go
