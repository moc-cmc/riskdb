Create table 
	wire_intermediaries(
        	wire_intermediary_id int,
        	external_account_id int,
        	product_id int,
        	intermediary varchar(100) NULL,
        	int_swift_code varchar(50) NULL,
        	ord_swift_code varchar(50) NULL,
        	bank_line_code varchar(10) NULL,
        	ord_bank_name varchar(50) NULL
	)
go

create unique nonclustered index u_wi on wire_intermediaries(wire_intermediary_id)
go

create unique nonclustered index n_wi on wire_intermediaries(external_account_id,product_id)
go



