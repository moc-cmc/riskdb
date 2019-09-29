
if object_id("upd_credit_profile_dist_lists") != NULL
    drop trigger
        upd_credit_profile_dist_lists
go

create trigger
    upd_credit_profile_dist_lists
on
    credit_profile_dist_lists
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_dist_lists: update "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.dist_list_id)
    )
from
    inserted a

go
