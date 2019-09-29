drop table default_credit_profile_values
go

create table
	default_credit_profile_values(
		currency_id int,
		nop_type_id int,
		dsl_type_id int,
		notice_level float,
		warning_level float,
		blocked_level float
	)
go

declare @usd_ccy_id int
declare @nop_type_id int
declare @dsl_type_id int

select
	@usd_ccy_id = product_id
from
	products
where
	symbol = "USD"

select
	@nop_type_id = nop_type_id
from
	nop_types
where
	name = "Aggregate Shorts"

select
	@dsl_type_id = dsl_type_id
from
	dsl_types
where
	name = "Net"

if @usd_ccy_id != NULL and @nop_type_id != NULL and @dsl_type_id != NULL
begin

	insert into
		default_credit_profile_values
	values(
		@usd_ccy_id,
		@nop_type_id,
		@dsl_type_id,
		.75,
		.85,
		.95
	)
end
go


		
