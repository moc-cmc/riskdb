
create table
	legal_entity_otc_links(
		legal_entity_otc_link_id int identity,
		entering_legal_entity_id int,
		available_legal_entity_id int
)
go

create unique nonclustered index 
	u_s
on
	legal_entity_otc_links(legal_entity_otc_link_id)
go

create unique nonclustered index 
        u_sn
on
        legal_entity_otc_links(entering_legal_entity_id, available_legal_entity_id)
go



if not exists(select name from tables where name = "legal_entity_otc_links")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "legal_entity_otc_links",
                "L"
        )
end
go

