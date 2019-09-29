
if object_id("contract_eval_methods") != NULL
    drop table
        contract_eval_methods
go

create table
    contract_eval_methods (
        contract_id int,
        eval_method_id int
    )
go
