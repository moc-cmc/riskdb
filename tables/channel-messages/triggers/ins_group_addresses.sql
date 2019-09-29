
if object_id("ins_group_addresses") != NULL
    drop trigger
        ins_group_addresses
go

create trigger
    ins_group_addresses
on
    group_addresses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_addresses: insert "
        + convert(varchar(10), a.group_address_id) + " "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.address_type_id) + " "
        + "'" + str_replace(a.address, "'", "\'") + "' "
        + (case when a.token = NULL then "NULL" else "'" + str_replace(a.token, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.min_priority_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    inserted a

go
