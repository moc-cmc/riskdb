if object_id("mapping_error_messages") != NULL
    drop table
        mapping_error_messages

go


create table 
	mapping_error_messages (
		mapping_error_id int,
		message_id int)
go

create unique index mem on mapping_error_messages (mapping_error_id, message_id)
go

create index mei on mapping_error_messages(mapping_error_id)
go


