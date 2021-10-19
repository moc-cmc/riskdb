drop table
	cpty_contacts
go

create table
	cpty_contacts(
		counterparty_id int,
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
	cpty_contacts(
		counterparty_id)

go
