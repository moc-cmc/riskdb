create table
    bo_points (
        bo_point_id int,
        status_id int,
        contract_id int,
        price_date datetime,
        value_date datetime null,
        source_id int,
	discount_factor float NULL,
	int_cou float NULL,
	days_to_maturity float NULL,
	year_basis_cou float NULL
    )
go

insert into keys values("bo_points", 0)
go

create unique nonclustered index bop on bo_points(bo_point_id)
go

create unique nonclustered index bsp on bo_points(contract_id, source_id, value_date, price_date)
go
