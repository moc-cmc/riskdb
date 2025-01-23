if object_id("ins_external_account_prime_brokers") != NULL
    drop trigger
        ins_external_account_prime_brokers 
go

create trigger
    ins_external_account_prime_brokers 
on
    external_account_prime_brokers 
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_prime_brokers: insert "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), prime_broker_id)
    )
from
    inserted

go
