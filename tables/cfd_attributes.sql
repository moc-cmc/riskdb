/*
if object_id("cfd_attributes") != NULL
    drop table
        cfd_attributes
go
*/

create table
	cfd_attributes(
		contract_id int,
		source_id int,
		underlying_asset_class varchar(50) NULL,
		underlying_type varchar(50) NULL,
		isin varchar(50) NULL,
		underlying_isin varchar(50) NULL,
		instrument_full_name varchar(50) NULL,
		underlying_instrument varchar(50) NULL,
		instrument_term varchar(50) NULL,
		attributes varchar(255) NULL
	)

go

create unique nonclustered index un_cacs on cfd_attributes(contract_id, source_id)
go
