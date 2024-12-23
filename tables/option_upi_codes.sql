
drop table option_upi_codes
go

create table option_upi_codes (
	contract_id int,
	trade_type_id int,
	call_put varchar(1),
	symbol varchar(50))
go

create unique index cpky on option_upi_codes (contract_id,trade_type_id,call_put)
go


