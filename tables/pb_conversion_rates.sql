
if object_id("pb_conversion_rates") != NULL
    drop table
        pb_conversion_rates
go

create table
    pb_conversion_rates (
        pb_conversion_rate_id int,
        contract_id int,
	prime_broker_id int,
        price_date datetime,
        price float
    )
go

create unique nonclustered index
	u_pbc
on
	pb_conversion_rates(pb_conversion_rate_id)
go

create nonclustered index
	n_pbc
on
	pb_conversion_rates(price_date)
go

create nonclustered index 
        n_pbcc
on
        pb_conversion_rates(contract_id)
go


insert into keys values("pb_conversion_rates", 1000)
go

