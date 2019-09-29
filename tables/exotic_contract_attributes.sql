
if object_id("exotic_contract_attributes") != NULL
    drop table
        exotic_contract_attributes
go

create table
    exotic_contract_attributes (
        contract_id int,
        attribute_type_id int,
        value char(200)
    )
go
