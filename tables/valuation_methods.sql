
if object_id("valuation_methods") != NULL
    drop table
        valuation_methods
go

create table
    valuation_methods (
        valuation_method_id int,
        name char(200),
        implementation_id int
    )
go
