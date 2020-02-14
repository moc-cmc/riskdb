
drop table
	work_order_reqs
go

delete from keys where relation="work_order_reqs"
go

create table
	work_order_reqs (
		work_order_req_id		int,
		title				varchar(250),
		client_id			int,
		req_date			datetime,
		change_type_id			int,
		expiration			datetime,
		pivotal_id			varchar(12),
		setup_amount			float NULL,
		monthly_amount			float NULL,
		setup_fees_billed		char(4),
		monthly_fees_billed		char(4),
		setup_billing_date		datetime NULL,
		monthly_billing_date		datetime NULL,
		docu_sign_date			datetime NULL,
		est_completion_date		datetime NULL,
		completion_date			datetime NULL,
		production_date			datetime NULL,
		variable_model_id		int NULL,
		workorder_status_id		int NULL,
		note				varchar(255) NULL	
)

create unique index
	wor
on
	work_order_reqs (work_order_req_id)
go

insert into
	keys
values
	("work_order_reqs", 0)
go

		
		
		
