
if object_id("outbound_sources") != NULL
    drop table
        outbound_sources
go

create table
    outbound_sources (
        source_id int
    )
go

create unique nonclusterd index
	u_os
on
	outbound_sources(source_id)
go


