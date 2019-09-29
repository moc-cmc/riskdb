
if object_id("user_run_favorites") != NULL
    drop table
        user_run_favorites
go

create table
    user_run_favorites (
        tico_account_id int,
        run_id int
    )
go

create unique nonclustered index
	u_urf
on
	user_run_favorites(tico_account_id, run_id)
go

