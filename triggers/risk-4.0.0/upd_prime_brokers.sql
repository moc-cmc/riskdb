
if object_id("upd_prime_brokers") != NULL
    drop trigger
        upd_prime_brokers
go

create trigger
    upd_prime_brokers
on
    prime_brokers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".prime_brokers: update "
        + convert(varchar(10), a.prime_broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + (case when a.bo_external_account_id = NULL then "NULL" else convert(varchar(10), a.bo_external_account_id) end) + " "
        + (case when a.run_id = NULL then "NULL" else convert(varchar(10), a.run_id) end) + " "
        + (case when a.mkt_ext_account_id = NULL then "NULL" else convert(varchar(10), a.mkt_ext_account_id) end)
    )
from
    inserted a

go
