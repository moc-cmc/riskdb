use
	risk_edgewater
go

drop table
	account_reporting_domains
go

create table
	account_reporting_domains(
		id int identity, /* Hi Lo! */
		external_account_id int,
		reporting_domain_id int)
go

create unique index
	u_ard
on
	account_reporting_domains(
		external_account_id,
		reporting_domain_id)
go



