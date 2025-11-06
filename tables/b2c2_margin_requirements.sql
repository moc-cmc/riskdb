
drop table
	b2c2_margin_requirements
go

create table
	b2c2_margin_requirements (
		margin_date 		datetime,
		equity			float,
		free_equity		float,
		margin_requirement	float,
		margin_usage		float,
		currency		varchar(50))

go

create unique index md on b2c2_margin_requirements (margin_date)
go


