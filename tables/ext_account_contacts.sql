drop table
	ext_account_contacts
go

create table
	ext_account_contacts(
		ext_account_contact_id int,
		entered_by int,
		external_account_id int,
		name varchar(250),
		contact_type_id int)
go

create unique index
	u_eac
on
	ext_account_contacts(
		ext_account_contact_id)
go

delete

from
	keys
where
	relation = "ext_account_contacts"
go

insert into
	keys
values(
	"ext_account_contacts",
	0)
go

