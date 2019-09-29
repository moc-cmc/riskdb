use
	risk_pers
go

drop table
	exercise_overrides
go

create table
	exercise_overrides(
		trade_id int,
		exercise varchar(5))
go

create unique index
	u_t
on
	exercise_overrides(
		trade_id)

go
