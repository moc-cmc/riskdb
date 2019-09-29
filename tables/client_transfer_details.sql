
if object_id("client_transfer_details") != NULL
    drop table
        client_transfer_details
go

create table client_transfer_details
(
	external_account_id int,
	protocol_credential_id int NULL,
	dist_list_id int NULL,
	client_login_config_id int NULL
)
go

create unique clustered index
	u_t
on
	client_transfer_details(external_account_id)


go

