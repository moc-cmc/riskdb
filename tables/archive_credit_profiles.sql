drop table archive_credit_profiles
go

create table
	archive_credit_profiles(
		credit_profile_id int,
		name varchar(50),
		currency_id int,
		nop_type_id int,
		nop_limit float,
		dsl_type_id int,
		dsl_limit float,
		notice_level float,
		warning_level float,
		blocked_level float,
		edited_by int,
		timestamp int
	)
go

		
