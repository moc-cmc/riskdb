
create table
	legal_entity_approvals(
		legal_entity_approval_id int,
		legal_entity_id int,
		tico_account_id int,
		approved_at datetime
)
go

create unique nonclustered index 
	u_s
on
	legal_entity_approvals(legal_entity_approval_id)
go

create unique nonclustered index 
        u_sn
on
        legal_entity_approvals(legal_entity_id, tico_account_id)
go



if not exists(select last_id from keys where relation = "legal_entity_approvals")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"legal_entity_approvals",
		1
	)
end
go

if not exists(select name from tables where name = "legal_entity_approvals")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "legal_entity_approvals",
                "J"
        )
end
go

