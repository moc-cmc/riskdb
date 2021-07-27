/* not normalized by app, might use user_auths schema to replace this later */
create table
	user_login_stats(
		user_login_stat_id int identity,
		activity_date datetime,
		tico_account_id int,
		mc_logins int,
		mpt_logins int
)
go


create unique nonclustered index 
	pk
on
	user_login_stats(user_login_stat_id)
on indexsegment
go

create unique nonclustered index 
	nk
on
	user_login_stats(activity_date, tico_account_id)
on indexsegment
go


create nonclustered index 
	n_dt
on
	user_login_stats(activity_date)
on indexsegment
go


if not exists(select name from tables where name = "user_login_stats")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "user_login_stats",
                "J"
        )
end
go


	
	
	
