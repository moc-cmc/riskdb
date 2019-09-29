drop table margin_profiles
go

create table
	margin_profiles(
		margin_profile_id int,
		name varchar(50),
		currency_id int,
                margin_model_id int,
		notice_level float,
		warning_level float,
		blocked_level float,
		multiplier float,
		prime_broker_id int
	)
go

create unique nonclustered index
	u_cg
on
	margin_profiles(margin_profile_id)
go

create unique nonclustered index 
        u_cgn
on
        margin_profiles(name)
go 

insert into keys values("margin_profiles", 1)
go
		
