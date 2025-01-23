if object_id("del_external_account_prime_brokers") != NULL
    drop trigger
        del_external_account_prime_brokers 
go

create trigger
    del_external_account_prime_brokers 
on
    external_account_prime_brokers 
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_prime_brokers: delete "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), prime_broker_id)
    )
from
    deleted

go
