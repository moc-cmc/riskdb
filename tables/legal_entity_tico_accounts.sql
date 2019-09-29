create table
	legal_entity_tico_accounts(
		legal_entity_id int,
		tico_account_id int)
go

create unique index
	u_leta
on
	legal_entity_tico_accounts(
		legal_entity_id,
		tico_account_id)
go


