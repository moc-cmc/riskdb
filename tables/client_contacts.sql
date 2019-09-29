drop table
	client_contacts
go

create table
	client_contacts(
		external_account_id int,
		name varchar(200) NULL,
		phone varchar(200) NULL,
		email varchar(200) NULL,
		address_line1 varchar(200) NULL,
		address_line2 varchar(200) NULL,
		additional1 varchar(200) NULL,
		additional2 varchar(200) NULL,
		additional3 varchar(200) NULL)

go

create unique index
	u_cc
on
	client_contacts(
		external_account_id)

go
