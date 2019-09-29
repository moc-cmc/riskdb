if object_id("resolved_mapping_errors") != NULL
    drop table
        resolved_mapping_errors

go

create table
	resolved_mapping_errors(
		mapping_error_id int,
		broker_id int,
		identifier varchar(100),
		mapping_error_type_id int,
		timestamp datetime,
		resolved_at datetime
)
lock datarows
go


create unique index
	u_me
on
	resolved_mapping_errors(
		mapping_error_id)
go

create unique nonclustered index
	u_bi
on
	resolved_mapping_errors(broker_id, identifier, mapping_error_type_id)
go

go
