use risk_hehmeyer_dev
go
drop table
	FXBADDAT
go

create table
	FXBADDAT(
		CODE char(3),
		DATE datetime,
		MISC char(8),
		HOL_NAME varchar(30),
		timestamp timestamp NULL
)
go
