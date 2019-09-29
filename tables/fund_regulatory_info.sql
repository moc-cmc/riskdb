drop table fund_regulatory_info
go

create table
	fund_regulatory_info(
		fund_regulatory_info_id int,
		fund_id int,
		legal_name varchar(50) NULL,
		shortcode varchar(50) NULL,
		country varchar(50) NULL,
		branch_location varchar(50) NULL,
		corporate_sector varchar(50) NULL,
		party_region varchar(10) NULL,
		financial_juristiction varchar(10) NULL,
		lei_number varchar(50) NULL,
		o_code varchar(10) NULL
)
go

create unique nonclustered index 
	u_ar
on
	fund_regulatory_info(fund_regulatory_info_id)
go

create unique nonclustered index
	u_arq
on
	fund_regulatory_info(fund_id)
go

insert into keys values("fund_regulatory_info", 0)
go

	
