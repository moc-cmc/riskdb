use
	risk_qson
go

drop table
	margin_model_nop_types
go

create table
	margin_model_nop_types(
		margin_model_id int,
		nop_type_id int)
go

create unique index
	u_mmnt
on
	margin_model_nop_types(
		margin_model_id,
		nop_type_id)
go
