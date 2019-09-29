drop table credit_profile_source_hacks
go

/* This is a table that allows you to hardcode a balance
   for a credit_profile in ag_creditprofilebalances. A request
   to hardcode a value of 0 for FXGCC from John Colasanti was
   made for ITG. Also, they have a profile that they dont want reported */ 
create table
	credit_profile_source_hacks(
		credit_profile_id int,
		source_id int,
		balance_override numeric(30, 4) NULL,
		exclude_from_export char(1) NULL
)
go


create unique nonclustered index
	u_cph
on
	credit_profile_source_hacks(credit_profile_id, source_id)
go


