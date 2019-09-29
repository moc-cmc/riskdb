
if object_id("funds") != NULL
    drop table
        funds
go

create table
    funds (
        fund_id int,
        name char(50),
        evaluation_currency_id int,
        fund_type_id int,
        status_id int,
        tico_server varchar(100),
        tico_database varchar(100),
        prime_broker_id int
    )
go
