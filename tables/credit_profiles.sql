drop table credit_profiles
go

create table
	credit_profiles(
		credit_profile_id int,
		name varchar(50),
		currency_id int,
		nop_type_id int,
		nop_limit float,
		dsl_type_id int,
		dsl_limit float,
		notice_level float,
		warning_level float,
		blocked_level float
	)
go

create unique nonclustered index
	u_cg
on
	credit_profiles(credit_profile_id)
go

create unique nonclustered index 
        u_cgn
on
        credit_profiles(name)
go 

insert into keys values("credit_profiles", 1)
go
		
