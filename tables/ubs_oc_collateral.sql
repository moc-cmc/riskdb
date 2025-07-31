
drop table
	ubs_oc_collateral
go


create table
	ubs_oc_collateral(
	collateral_date datetime,
        customer_name varchar(25),
        excess_deficit_collateral float NULL,
        credit_utilization float NULL,
        collateral_posted float NULL,
        collateral_pending float NULL,
        nop_limit float NULL,
        netIM float NULL,
        mtm float NULL,
        credit_excess float NULL,
        collateral_required float NULL,
        utilized_line float NULL,
	source varchar(25))

go


