if object_id("protocol_credentials") != NULL
    drop table
        protocol_credentials
go

create table
	protocol_credentials(
		protocol_credential_id int,
		transfer_protocol_id int,
		hostname varchar(100),
		login varchar(50),
		password varchar(100),
		public_key_id int,
		encryption_method int
)

go

create unique clustered index
        u_p
on
        protocol_credentials(protocol_credential_id)
go

