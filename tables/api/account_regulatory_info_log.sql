
if object_id("account_regulatory_info_log") != NULL
	drop table
		account_regulatory_info_log
go

create table
	account_regulatory_info_log (
		account_regulatory_info_log_id int,
		user_static_action_id int,
		account_regulatory_info_id int,
		external_account_id int,
		country varchar(50) NULL,
		branch_location varchar(50) NULL,
		corporate_sector varchar(50) NULL,
		party_region varchar(50)  NULL,
		financial_jurisdiction varchar(50) NULL,
		lei_number varchar(50) NULL,
		lei_type varchar(10) NULL	
         )

create unique index ari on account_regulatory_info_log (account_regulatory_info_log_id)
go

if exists (select relation from keys where relation="account_regulatory_info_log")
	delete from keys where relation="account_regulatory_info_log"
	
insert into keys values ("account_regulatory_info_log", 0)

go

