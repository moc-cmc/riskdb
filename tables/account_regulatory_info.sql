drop table account_regulatory_info
go

create table
	account_regulatory_info(
		account_regulatory_info_id int,
		external_account_id int,
		country varchar(50) NULL,
		branch_location varchar(50) NULL,
		corporate_sector varchar(50) NULL,
		party_region varchar(10) NULL,
		financial_juristiction varchar(10) NULL,
		lei_number varchar(50) NULL
)
go

create unique nonclustered index 
	u_ar
on
	account_regulatory_info(account_regulatory_info_id)
go

create unique nonclustered index
	u_arq
on
	account_regulatory_info(external_account_id)
go

insert into keys values("account_regulatory_info", 0)
go

	
