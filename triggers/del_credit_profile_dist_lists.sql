
if object_id("del_credit_profile_dist_lists") != NULL
    drop trigger
        del_credit_profile_dist_lists
go

create trigger
    del_credit_profile_dist_lists
on
    credit_profile_dist_lists
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_dist_lists: delete "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.dist_list_id)
    )
from
    deleted a

go
