if object_id("transfer_protocols") != NULL
    drop table
        transfer_protocols
go

create table
	transfer_protocols(
		transfer_protocol_id int,
		name varchar(25)
)

go


create unique nonclustered index
        u_t
on
        transfer_protocols(transfer_protocol_id)
go


create unique nonclustered index
        u_n
on
        transfer_protocols(name)
go


