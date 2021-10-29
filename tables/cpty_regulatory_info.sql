drop table cpty_regulatory_info
go

create table
	cpty_regulatory_info(
		cpty_regulatory_info_id int,
		counterparty_id int,
		country varchar(50) NULL,
		branch_location varchar(50) NULL,
		corporate_sector varchar(50) NULL,
		party_region varchar(10) NULL,
		financial_juristiction varchar(10) NULL,
		lei_number varchar(50) NULL,
		lei_type varchar(10) NULL
)
go

create unique nonclustered index 
	u_ar
on
	cpty_regulatory_info(cpty_regulatory_info_id)
go

create unique nonclustered index
	u_arq
on
	cpty_regulatory_info(counterparty_id)
go

insert into keys values("cpty_regulatory_info", 0)
go

insert into tables values("cpty_regulatory_info", "L")
go


	
