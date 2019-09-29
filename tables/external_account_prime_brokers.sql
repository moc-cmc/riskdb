
if object_id("external_account_prime_brokers") != NULL
    drop table
        external_account_prime_brokers
go

create table
    external_account_prime_brokers (
        external_account_id int,
        prime_broker_id int
    )
go
