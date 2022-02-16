
if object_id("del_user_addresses") != NULL
    drop trigger
        del_user_addresses
go

create trigger
    del_user_addresses
on
    user_addresses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_addresses: delete "
        + convert(varchar(10), a.user_address_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.address_type_id) + " "
        + "'" + str_replace(a.address, "'", "\'") + "' "
        + (case when a.token = NULL then "NULL" else "'" + str_replace(a.token, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.min_priority_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    deleted a

go
