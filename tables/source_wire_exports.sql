drop table source_wire_exports
go

create table
	source_wire_exports(
		source_wire_export_id int,
		pb_wire_signoff_id int,
		source_id int,
		export_date datetime
)

go

create unique nonclustered index 
	pk
on
	source_wire_exports(source_wire_export_id)
go

create unique nonclustered index 
	u_swe
on
	source_wire_exports(pb_wire_signoff_id, source_id)
go

if not exists(select last_id from keys where relation="source_wire_exports")
begin
	insert into keys values("source_wire_exports", 0)
end
go
