
if object_id("source_permissions") != NULL
    drop table
        source_permissions
go

create table
    source_permissions (
        source_permission_id int identity,
        source_id int,
        autocreates_users char(1),
        autocreates_statuses char(1),
        autocreates_funds char(1),
        autocreates_internal_accounts char(1),
        autocreates_external_accounts char(1),
        autocreates_traders char(1),
        autocreates_brokers char(1),
        autocreates_strategies char(1),
        autocreates_contracts char(1),
        autocreates_products char(1),
        autocreates_exchanges char(1)
    )
go
