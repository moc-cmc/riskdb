create table
	legal_entity_contacts(
		legal_entity_contact_id int,
		entered_by int,
		legal_entity_id int,
		name varchar(250),
		contact_type_id int)
go

create unique index
	u_eac
on
	legal_entity_contacts(
		legal_entity_contact_id)
go

delete

from
	keys
where
	relation = "legal_entity_contacts"
go

insert into
	keys
values(
	"legal_entity_contacts",
	0)
go

