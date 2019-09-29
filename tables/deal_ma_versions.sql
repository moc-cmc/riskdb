use
	risk_atglobal
go

drop table
	deal_ma_versions
go

create table
	deal_ma_versions(
		deal_id int,
		ma_version_id int,
		timestamp datetime)
go

create unique index
	u_dmv
on
	deal_ma_versions(
		deal_id)


go
