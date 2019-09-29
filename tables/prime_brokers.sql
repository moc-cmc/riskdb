
if object_id("prime_brokers") != NULL
    drop table
        prime_brokers
go

create table
    prime_brokers (
        prime_broker_id int,
        source_id int,
	bo_external_account_id int NULL,
	run_id int NULL,
	mkt_ext_account_id int NULL
    )
go
