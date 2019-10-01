create table
	default_margin_profile_values(
		currency_id int,
		margin_model_id int,
		notice_level float,
		warning_level float,
		blocked_level float,
		multiplier float 
	)
go

declare @usd_ccy_id int
declare @margin_model_id int

select
	@usd_ccy_id = product_id
from
	products
where
	symbol = "USD"

select
	@margin_model_id = margin_model_id
from
	margin_models
where
	name = "Shorts"


if @usd_ccy_id != NULL and @margin_model_id != NULL
begin

	insert into
		default_margin_profile_values
	values(
		@usd_ccy_id,
		@margin_model_id,
		.75,
		.85,
		.95,
		1.0
	)
end
go


		
