
if object_id("inbound_sources") != NULL
    drop table
        inbound_sources
go

create table
    inbound_sources (
        source_id int
    )
go

create unique nonclusterd index
	u_os
on
	inbound_sources(source_id)
go


