if object_id("upd_external_account_prime_brokers") != NULL
    drop trigger
        upd_external_account_prime_brokers 
go

create trigger
    upd_external_account_prime_brokers
on
    external_account_prime_brokers 
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_prime_brokers: update "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), prime_broker_id)
    )
from
    inserted

go
