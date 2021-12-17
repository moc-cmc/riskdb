
if object_id("cpty_regulatory_info_log") != NULL
	drop table
		cpty_regulatory_info_log
go

create table
	cpty_regulatory_info_log (
		cpty_regulatory_info_log_id int,
		user_static_action_id int,
		cpty_regulatory_info_id int,
		counterparty_id int,
		country varchar(50) NULL,
		branch_location varchar(50) NULL,
		corporate_sector varchar(50) NULL,
		party_region varchar(50)  NULL,
		financial_jurisdiction varchar(50) NULL,
		lei_number varchar(50) NULL,
		lei_type varchar(10) NULL	
         )

create unique index cri on cpty_regulatory_info_log (cpty_regulatory_info_log_id)
go

if exists (select relation from keys where relation="cpty_regulatory_info_log")
	delete from keys where relation="cpty_regulatory_info_log"
	
insert into keys values ("cpty_regulatory_info_log", 0)

go

