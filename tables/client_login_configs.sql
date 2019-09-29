
if object_id("client_login_configs") != NULL
    drop table
        client_login_configs
go

create table
	client_login_configs(
		id int identity,
		tico_account_id int,
		run_id int NULL,
		blotter_view_style_id int NULL)
go

create unique index
	u_clc
on
	client_login_configs(
		tico_account_id)

go	
